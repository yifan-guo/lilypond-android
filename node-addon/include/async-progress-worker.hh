
#ifndef ASYNC_PROGRESS_WORKER_HH
#define ASYNC_PROGRESS_WORKER_HH



#include <any>
#include <functional>

#include <nan.h>

#include "persist.hh"



class AsyncProgressQueueWorker
	: public Nan::AsyncProgressQueueWorker<std::any>
{
public:
	typedef std::function<void (const std::any&)>			SendFunctor;
	typedef std::function<void (const SendFunctor&)>		ExecuteFunctor;
	typedef std::function<void (const std::any&)>			HandleCallbackFunctor;

	static void queue (
		const ExecuteFunctor& execute,
		const HandleCallbackFunctor& handle)
	{
		AsyncProgressQueueWorker* worker = new AsyncProgressQueueWorker(execute, handle);
		Nan::AsyncQueueWorker(worker);
	};


private:
	AsyncProgressQueueWorker(
		const ExecuteFunctor& execute,
		const HandleCallbackFunctor& handle,
		Nan::Callback* callback = new Nan::Callback())
		: Nan::AsyncProgressQueueWorker<std::any>(callback)
		, execute_(execute)
		, handle_(handle)
		, callbackPtr_(callback)
	{
	};

	~AsyncProgressQueueWorker() {};


	static void sendProgress (const ExecutionProgress& progress, const std::any& data)
	{
		progress.Send(&data, 1);
	};


	virtual void Execute(const ExecutionProgress& progress)
	{
		execute_([&progress](const std::any& data) {
			progress.Send(&data, 1);
		});
		//execute_(std::bind(&AsyncProgressQueueWorker::sendProgress, std::cref(progress), std::placeholders::_1));
	};

	virtual void HandleProgressCallback(const std::any* data, size_t size)
	{
		for (const std::any* it = data; it < data + size; ++it)
			handle_(*it);
	};


	ExecuteFunctor execute_;
	HandleCallbackFunctor handle_;

	std::shared_ptr<Nan::Callback> callbackPtr_;
};



#endif	// ASYNC_PROGRESS_WORKER_HH
