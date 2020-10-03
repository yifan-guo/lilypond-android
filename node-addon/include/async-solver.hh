
#ifndef ASYNC_SOLVER_HH
#define ASYNC_SOLVER_HH



#include <functional>
#include <nan.h>

#include "persist.hh"



template<typename Result>
class AsyncSolver
	: public Nan::AsyncWorker
{
public:
	typedef std::function<Result ()>	ExecuteFunctor;

	static void queue (
		const v8::Local<v8::Context>& context,
		const v8::Local<v8::Promise::Resolver>& resolver,
		const ExecuteFunctor& execute)
	{
		AsyncSolver* worker = new AsyncSolver(context, resolver, execute);
		Nan::AsyncQueueWorker(worker);
	};

private:
	AsyncSolver(
		const v8::Local<v8::Context>& context,
		const v8::Local<v8::Promise::Resolver>& resolver,
		const ExecuteFunctor& execute)
		: Nan::AsyncWorker(nullptr)
		, context_(persist(context))
		, resolver_(persist(resolver))
		, execute_(execute)
	{
	};

	~AsyncSolver() {};

	virtual void Execute()
	{
		result_ = execute_();
	};

	virtual void HandleOKCallback ()
	{
		Nan::HandleScope scope;

		auto resolver = Nan::New(*resolver_);
		auto context = Nan::New(*context_);
		auto success = resolver->Resolve(context, Nan::New(result_));
		(void)success;
	};

	Nan::Persistent<v8::Context>* context_;
	Nan::Persistent<v8::Promise::Resolver>* resolver_;
	Result result_;
	ExecuteFunctor execute_;
};



#endif	// ASYNC_SOLVER_HH
