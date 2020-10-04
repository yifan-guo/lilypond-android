
#include <functional>

#include <v8.h>
#include <node.h>
#include <nan.h>

#include "apis.hh"
#include "async-progress-worker.hh"
#include "async-engraver.hh"
#include "persist.hh"



AsyncEngraver engraver;


v8::Local<v8::String> v8str (const std::string& str)
{
	return v8::String::NewFromUtf8(v8::Isolate::GetCurrent(), str.c_str(), v8::String::kNormalString);
}


v8::Local<v8::ArrayBuffer> v8arraybuffer (const std::vector<uint8_t>& data)
{
	return v8::ArrayBuffer::New(v8::Isolate::GetCurrent(), (void*)data.data(), data.size(), v8::ArrayBufferCreationMode::kInternalized);
}


void engrave(const v8::FunctionCallbackInfo<v8::Value>& args)
{
	auto context = args.GetIsolate()->GetCurrentContext();

	// workaround promise resolving problem
	v8::Script::Compile(context, v8str("console.log('');"))
		.ToLocalChecked()->Run(context).ToLocalChecked();

	const std::string ly_code = *Nan::Utf8String(args[0].As<v8::Object>());

	auto resolver = v8::Promise::Resolver::New(context).ToLocalChecked();

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
			//std::cout << "resolved." << std::endl;
		},
	};

	if (args.Length() >= 2)
	{
		auto options = args[1].As<v8::Object>();
		auto maybeLog = options->Get(v8str("log"));
		auto maybeSvg = options->Get(v8str("onSVG"));
		auto maybeMidi = options->Get(v8str("onMIDI"));

		if (!maybeLog.IsEmpty() && maybeLog->IsFunction())
		{
			auto pLog = persist(maybeLog);
			task->log = [pLog, pcontext](const std::string& messages) {
				Nan::HandleScope scope;

				auto context = Nan::New(*pcontext);

				auto log = v8::Local<v8::Function>::Cast(Nan::New(*pLog));
				v8::Local<v8::Value> args[] = {v8str(messages)};
				log->CallAsFunction(context, context->Global(), 1, args).ToLocalChecked();
			};
		}

		if (!maybeSvg.IsEmpty() && maybeSvg->IsFunction())
		{
			auto pSvg = persist(maybeSvg);
			task->onSVG = [pSvg, pcontext](const std::string& filename, const std::string& content) {
				Nan::HandleScope scope;

				auto context = Nan::New(*pcontext);

				auto onSVG = v8::Local<v8::Function>::Cast(Nan::New(*pSvg));
				v8::Local<v8::Value> args[] = {v8str(filename), v8str(content)};
				onSVG->CallAsFunction(context, context->Global(), 2, args).ToLocalChecked();
			};
		}

		if (!maybeMidi.IsEmpty() && maybeMidi->IsFunction())
		{
			auto pMidi = persist(maybeMidi);
			task->onMIDI = [pMidi, pcontext](const std::string& filename, const std::vector<uint8_t>& data) {
				Nan::HandleScope scope;

				auto context = Nan::New(*pcontext);

				auto onMIDI = v8::Local<v8::Function>::Cast(Nan::New(*pMidi));
				v8::Local<v8::Value> args[] = {v8str(filename), v8arraybuffer(data)};
				onMIDI->CallAsFunction(context, context->Global(), 2, args).ToLocalChecked();
			};
		}
	}

	engraver.appendTask(task);

	args.GetReturnValue().Set(resolver->GetPromise());
}


void initialize(v8::Local<v8::Object> target)
{
	NODE_SET_METHOD(target, "engrave", engrave);

	AsyncProgressQueueWorker::queue(
		std::bind(&AsyncEngraver::engrave, &engraver, std::placeholders::_1),
		std::bind(&AsyncEngraver::handleProgress, &engraver, std::placeholders::_1));
}


NODE_MODULE(NODE_GYP_MODULE_NAME, initialize)
