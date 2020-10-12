
#include <iostream>
#include <experimental/filesystem>
#include <dlfcn.h>

//#include "apis.hh"
#include "async-engraver.hh"



//namespace fs = std::experimental::filesystem;
namespace fs = std::filesystem;


struct Initializer
{
	Initializer ()
	{
		/*Dl_info info;
		dladdr((void*)&LilyEx::initialize, &info);

		std::string ly_path;
		if (getenv("LILYPOND_PATH"))
			ly_path = getenv("LILYPOND_PATH");
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

		LilyEx::initialize(ly_path);*/
		std::cout << "fake lilypond init." << std::endl;
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

		/*const int error = LilyEx::engrave(task->ly_code, LilyEx::EngraveOptions {
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
		});*/
		std::cout << "fake lilypond engrave." << std::endl;
		const int error = 0;
		if (task->log)
			sender(Functor0([=] {
				(*task->log)("This is fake lilypond engraving.");
			}));
		if (task->onSVG)
		{
			static const char* const svg = R"""(<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.2" width="210.00mm" height="297.00mm" viewBox="0 0 119.5016 169.0094">
<style type="text/css">

tspan { white-space: pre; }

</style>
<!-- Page: 1/1 -->
<g transform="translate(14.2264, 9.6243)">
<line stroke-linejoin="round" stroke-linecap="round" stroke-width="0.1000" stroke="currentColor" x1="0.0500" y1="0" x2="14.9000" y2="0"></line>
</g>
<g transform="translate(14.2264, 8.6243)">
<line stroke-linejoin="round" stroke-linecap="round" stroke-width="0.1000" stroke="currentColor" x1="0.0500" y1="0" x2="14.9000" y2="0"></line>
</g>
<g transform="translate(14.2264, 7.6243)">
<line stroke-linejoin="round" stroke-linecap="round" stroke-width="0.1000" stroke="currentColor" x1="0.0500" y1="0" x2="14.9000" y2="0"></line>
</g>
<g transform="translate(14.2264, 6.6243)">
<line stroke-linejoin="round" stroke-linecap="round" stroke-width="0.1000" stroke="currentColor" x1="0.0500" y1="0" x2="14.9000" y2="0"></line>
</g>
<g transform="translate(14.2264, 5.6243)">
<line stroke-linejoin="round" stroke-linecap="round" stroke-width="0.1000" stroke="currentColor" x1="0.0500" y1="0" x2="14.9000" y2="0"></line>
</g>
<g transform="translate(5.6906, 10.6243)">
<rect x="16.7453" y="-0.1000" width="2.9430" height="0.2000" ry="0.1000" fill="currentColor"></rect>
</g>
<g transform="translate(28.9864, 7.6243)">
<rect x="0.0000" y="-2.0000" width="0.1900" height="4.0000" ry="0.0000" fill="currentColor"></rect>
</g>
<g transform="translate(19.2264, 7.6243)">
<path transform="scale(0.0040, -0.0040)" d="M359 27c-49 0 -75 42 -75 75c0 38 27 77 72 77c4 0 9 0 14 -1c-28 37 -72 59 -120 59c-106 0 -113 -73 -113 -186v-51v-51c0 -113 7 -187 113 -187c80 0 139 70 158 151c2 7 7 10 12 10c6 0 13 -4 13 -12c0 -94 -105 -174 -183 -174c-68 0 -137 21 -184 70
c-49 51 -66 122 -66 193s17 142 66 193c47 49 116 69 184 69c87 0 160 -63 175 -149c1 -5 1 -10 1 -14c0 -40 -30 -72 -67 -72z" fill="currentColor"></path>
</g>
<g transform="translate(15.0264, 8.6243)">
<path transform="scale(0.0040, -0.0040)" d="M266 -635h-6c-108 0 -195 88 -195 197c0 58 53 103 112 103c54 0 95 -47 95 -103c0 -52 -43 -95 -95 -95c-11 0 -21 2 -31 6c26 -39 68 -65 117 -65h4zM461 -203c68 24 113 95 113 164c0 90 -66 179 -173 190c24 -116 46 -231 60 -354zM74 28c0 -135 129 -247 264 -247
c28 0 55 2 82 6c-14 127 -37 245 -63 364c-79 -8 -124 -61 -124 -119c0 -44 25 -91 81 -123c5 -5 7 -10 7 -15c0 -11 -10 -22 -22 -22c-3 0 -6 1 -9 2c-80 43 -117 115 -117 185c0 88 58 174 160 197c-14 58 -29 117 -46 175c-107 -121 -213 -243 -213 -403zM335 -262
c-188 0 -333 172 -333 374c0 177 131 306 248 441c-19 62 -37 125 -45 190c-6 52 -7 104 -7 156c0 115 55 224 149 292c6 5 14 5 20 0c71 -84 133 -245 133 -358c0 -143 -86 -255 -180 -364c21 -68 39 -138 56 -207c4 0 9 1 13 1c155 0 256 -128 256 -261
c0 -76 -33 -154 -107 -210c-22 -17 -47 -28 -73 -36c3 -35 5 -70 5 -105c0 -19 -1 -39 -2 -58c-7 -119 -88 -225 -202 -228l1 43c93 2 153 92 159 191c1 18 2 37 2 55c0 31 -1 61 -4 92c-29 -5 -58 -8 -89 -8zM428 916c0 55 -4 79 -20 129c-99 -48 -162 -149 -162 -259
c0 -74 18 -133 36 -194c80 97 146 198 146 324z" fill="currentColor"></path>
</g>
<a style="color:inherit;" xlink:href="textedit:3:15:16">
<g transform="translate(22.9264, 10.6243)">
<path transform="scale(0.0040, -0.0040)" d="M213 112c-50 0 -69 -43 -69 -88c0 -77 57 -136 134 -136c50 0 69 43 69 88c0 77 -57 136 -134 136zM491 0c0 -43 -34 -75 -72 -96c-53 -29 -114 -40 -174 -40s-120 11 -173 40c-38 21 -72 53 -72 96s34 75 72 96c53 29 113 40 173 40s121 -11 174 -40
c38 -21 72 -53 72 -96z" fill="currentColor"></path>
</g>
</a>
<g transform="translate(28.9194, 165.1170)">
<a xlink:href="https://lilypond.org/">
<rect x="0.0000" y="-0.4780" width="61.6628" height="2.1510" fill="none" stroke="none" stroke-width="0.0"></rect>
</a>
</g>
<g transform="translate(28.9194, 165.1170)">
<text font-family="serif" font-size="2.2001" text-anchor="start" fill="currentColor">
<tspan>Music engraving by LilyPond 2.21.7—www.lilypond.org</tspan>
</text>
</g>
</svg>)""";

			sender(Functor0([=] {
				(*task->onSVG)("test.ly", svg);
			}));
		}

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
