
#include <iostream>
//#include <cstdarg>
#if HAS_FILESYSTEM
#	include <experimental/filesystem>
#endif
#include <dlfcn.h>

#include "lilypond-ex.hh"
#include "async-engraver.hh"
#include "async-progress-worker.hh"



#if HAS_FILESYSTEM
namespace fs = std::experimental::filesystem;
#endif


struct Initializer
{
	Initializer ()
	{
		Dl_info info;
		dladdr((void*)&LilyEx::initialize, &info);

		std::string ly_path;
		if (getenv("LILYPOND_PATH"))
			ly_path = getenv("LILYPOND_PATH");
#if HAS_FILESYSTEM
		else {
			fs::path liblily_path = info.dli_fname;
			auto dir = liblily_path.parent_path();
			if (!fs::exists(dir / "share"))
				dir = dir.parent_path().parent_path() / "output";
			if (!fs::exists(dir / "share"))
				dir = fs::path(getenv("HOME")) / "lilypond/usr";

			if (!fs::exists(dir / "share"))
				std::cerr << "Cannot find lilypond path." << std::endl;

			ly_path = (dir / "bin/lilypond").u8string();
		}
#endif

		//std::cout << "ly_path: " << ly_path << std::endl;
		LilyEx::initialize(ly_path);
	}
};




AsyncEngraver::AsyncEngraver ()
{
}

void AsyncEngraver::queue ()
{
	AsyncProgressQueueWorker::queue(
		std::bind(&AsyncEngraver::engrave, this, std::placeholders::_1),
		std::bind(&AsyncEngraver::handleProgress, this, std::placeholders::_1));
}


void AsyncEngraver::appendTask (const Task* task)
{
	{
		std::lock_guard<std::mutex> lock(mutex_);
		tasks_.push_back (TaskPtr(task));
	}

	cv_.notify_one();
}


void AsyncEngraver::engrave (const SendFunctor& sender)
{
	while (true)
	{
		std::unique_lock<std::mutex> lock(mutex_);
		cv_.wait(lock, [this] {return !this->tasks_.empty();});

		TaskPtr task = tasks_.front();
		tasks_.pop_front();
		lock.unlock();

		try
		{
			static Initializer init;

			const int error = LilyEx::engrave(task->ly_code, LilyEx::EngraveOptions {
				// includeFolders
				task->includeFolders,

				// log
				[=](const std::string& messages) {
					if (task->log)
						sender(Functor0([=] {
							(*task->log)(messages);
						}));
				},

				// onSVG
				[=](const std::string& filename, const ByteBuffer& data) {
					if (task->onSVG)
						sender(Functor0([=] {
							(*task->onSVG)(filename, data);
						}));
				},

				// onMIDI
				[=](const std::string& filename, const ByteBuffer& data) {
					if (task->onMIDI)
						sender(Functor0([=] {
							(*task->onMIDI)(filename, data);
						}));
				},
			});

			sender(Functor0([=] {
				task->onFinish(error);
			}));
		}
		catch(const std::exception& e)
		{
			std::cerr << "AsyncEngraver::engrave error: " << e.what() << std::endl;

			sender(Functor0([=] {
				task->onFinish(-1);
			}));
		}
		catch(...)
		{
			sender(Functor0([=] {
				task->onFinish(-1);
			}));

			// fatal error thrown, process is crashing irretrievably, cannot report error either.
			return;
		}
	}
}


void AsyncEngraver::handleProgress (const std::any& data)
{
	if (const Functor0* f = std::any_cast<const Functor0>(&data))
		(*f)();
	else
		std::cerr << "Unhandled progress data type: " << data.type().name() << std::endl;
}
