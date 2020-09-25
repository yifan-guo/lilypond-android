
#include <v8.h>
#include <node.h>



void Test(const v8::FunctionCallbackInfo<v8::Value>& args) {
	static int c = 0;

	args.GetReturnValue().Set(c++);
}


void Initialize(v8::Local<v8::Object> target) {
	NODE_SET_METHOD(target, "test", Test);
}


NODE_MODULE(NODE_GYP_MODULE_NAME, Initialize)
