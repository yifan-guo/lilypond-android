
#ifndef ASYNC_ENGRAVER_HH
#define ASYNC_ENGRAVER_HH



#include <string>
#include <deque>
#include <mutex>
#include <functional>
#include <any>
#include <condition_variable>
#include <optional>

#include "buffer.hh"



class AsyncEngraver
{
	typedef std::function<void (int)>				TaskFinish;
	typedef std::function<void ()>					Functor0;


	template <typename T>
	struct OutputFunc
	{
		typedef std::optional<std::function<void (const std::string&, const T&)>>	type;
	};


public:
	struct Task
	{
		std::string		ly_code;

		TaskFinish		onFinish;

		std::vector<std::string>							includeFolders;
		std::optional<std::function<void (std::string)>>	log;
		typename OutputFunc<ByteBuffer>::type				onSVG;
		typename OutputFunc<ByteBuffer>::type				onMIDI;
	};
	typedef std::shared_ptr<const Task>				TaskPtr;

	typedef std::function<void (const std::any&)>	SendFunctor;


public:
	AsyncEngraver ();

	void queue ();


public:
	void appendTask (const Task* task);

	void engrave (const SendFunctor& sender);
	void handleProgress (const std::any& data);


private:
	std::mutex				mutex_;
	std::condition_variable	cv_;

	std::deque<TaskPtr>		tasks_;
};



#endif	// ASYNC_ENGRAVER_HH
