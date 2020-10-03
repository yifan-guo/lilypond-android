
#include <v8.h>
#include <node.h>
#include <nan.h>

#include "apis.hh"
#include "async-solver.hh"



struct Initializer
{
	Initializer ()
	{
		LilyEx::initialize();
	}
};


void test(const v8::FunctionCallbackInfo<v8::Value>& args) {
	//const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());
	//const auto error = LilyEx::engrave(ly_code);

	//args.GetReturnValue().Set(error);

	const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());
	auto context = args.GetIsolate()->GetCurrentContext();

	auto maybe_resolver = v8::Promise::Resolver::New(context);
	v8::Local<v8::Promise::Resolver> resolver;
	if (maybe_resolver.ToLocal(&resolver)) {
		AsyncSolver<int>::queue(context, resolver, [ly_code]() {
			static Initializer init;

			return LilyEx::engrave(ly_code);
		});

		args.GetReturnValue().Set(resolver->GetPromise());
	}
	else {
		auto isolate = args.GetIsolate();
		isolate->ThrowException(
			v8::Exception::Error( v8::String::NewFromUtf8(isolate, "Failed to get resolver.") )
		);
	}
		
}


void initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", test);
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
