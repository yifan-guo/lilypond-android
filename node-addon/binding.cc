
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

	const std::string filename = *Nan::Utf8String(args[0].As<v8::Object>());
	LilyEx::engrave(filename);
}


void initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", test);
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
