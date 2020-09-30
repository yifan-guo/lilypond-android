
#include <v8.h>
#include <node.h>

#include "apis.hh"



void test(const v8::FunctionCallbackInfo<v8::Value>& args) {
	static int c = 0;

	args.GetReturnValue().Set(c++);

	callMain("test");
}


void initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", test);
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
