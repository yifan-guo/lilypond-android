
#ifndef PERSIST_HH
#define PERSIST_HH



#include <nan.h>



/*template <typename T>
inline Nan::Persistent<T>* persist (const T& value)
{
	return new Nan::Persistent<T>(value);
}*/


template <typename T>
inline Nan::Persistent<T>* persist (const v8::Local<T>& value)
{
	return new Nan::Persistent<T>(value);
}



#endif	// PERSIST_HH
