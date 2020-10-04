
#include <iostream>

#include "apis.hh"
#include "async-engraver.hh"



struct Initializer
{
	Initializer ()
	{
		LilyEx::initialize();
	}
};




AsyncEngraver::AsyncEngraver ()
{
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

		static Initializer init;

		const int error = LilyEx::engrave(task->ly_code);

		sender(Functor0([=] {
			task->onFinish(error);
		}));
	}
}


void AsyncEngraver::handleProgress (const std::any& data)
{
	if (const Functor0* f = std::any_cast<const Functor0>(&data))
		(*f)();
	else
		std::cerr << "Unhandled progress data type: " << data.type().name() << std::endl;
}
