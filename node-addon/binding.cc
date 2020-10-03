
#include <v8.h>
#include <node.h>
#include <nan.h>

#include "apis.hh"



struct Initializer
{
	Initializer ()
	{
		LilyEx::initialize();
	}
};


void test(const v8::FunctionCallbackInfo<v8::Value>& args) {
	static Initializer init;

	const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());
	const auto error = LilyEx::engrave(ly_code);

	args.GetReturnValue().Set(error);
}


void initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", test);
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
