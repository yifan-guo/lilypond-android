
#include <functional>

#include <v8.h>
#include <node.h>
#include <nan.h>

#include "apis.hh"
#include "async-progress-worker.hh"
#include "async-engraver.hh"
#include "persist.hh"



AsyncEngraver engraver;


void test(const v8::FunctionCallbackInfo<v8::Value>& args) {
	//const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());
	//const auto error = LilyEx::engrave(ly_code);

	//args.GetReturnValue().Set(error);

	const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());
	auto context = args.GetIsolate()->GetCurrentContext();

	auto resolver = v8::Promise::Resolver::New(context).ToLocalChecked();
	/*AsyncSolver<int>::queue(context, resolver, [ly_code]() {
		static Initializer init;

		return LilyEx::engrave(ly_code);
	});*/

	auto presolver = persist(resolver);
	auto pcontext = persist(context);

	auto task = new AsyncEngraver::Task {
		ly_code,

		// on finish
		[presolver, pcontext](int error) {
			Nan::HandleScope scope;

			auto resolver = Nan::New(*presolver);
			auto context = Nan::New(*pcontext);

			resolver->Resolve(context, Nan::New(error)).ToChecked();
		},
	};
	engraver.appendTask(task);

	args.GetReturnValue().Set(resolver->GetPromise());
}


void initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", test);

	AsyncProgressQueueWorker::queue(
		std::bind(&AsyncEngraver::engrave, &engraver, std::placeholders::_1),
		std::bind(&AsyncEngraver::handleProgress, &engraver, std::placeholders::_1));
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
