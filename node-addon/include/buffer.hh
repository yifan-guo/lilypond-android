
#ifndef BUFFER_HH
#define BUFFER_HH



#include <memory>
#include <string>
#include <vector>
#include <cstring>
#include <iostream>



template <typename Byte>
class Buffer
{
public:
	Buffer ()
	{
		init();
	};

	template <typename Char>
	Buffer (const std::basic_string<Char>& str)
	{
		static_assert(sizeof(Char) == sizeof(Byte), "char type size must be the same with Buffer Byte.");

		init();
		assign(str);
	};

	Buffer (const char* str)
	{
		init();
		assign(str);
	};

	template <typename Char>
	Buffer (const std::vector<Char>& vec)
	{
		static_assert(sizeof(Char) == sizeof(Byte), "char type size must be the same with Buffer Byte.");

		init();
		assign(vec);
	};

	template <typename Char>
	Buffer (std::basic_istream<Char>& stream)
	{
		static_assert(sizeof(Char) == sizeof(Byte), "char type size must be the same with Buffer Byte.");

		init();
		assign(stream);
	};


	template <typename T>
	void assign (const T& container)
	{
		reserve(container.size());
		data_ptr_->assign(container.begin(), container.end());
	};

	template <typename Char>
	void assign (std::basic_istream<Char>& stream)
	{
		std::streampos beg = stream.tellg();
		stream.seekg(0, std::ios_base::end);
		std::streampos end = stream.tellg();
		stream.seekg(0, std::ios_base::beg);
		reserve(end - beg);

		data_ptr_->assign(std::istreambuf_iterator<Char>(stream), std::istreambuf_iterator<Char>());
	};

	template <typename Char>
	void assign (const std::basic_string<Char>& str)
	{
		reserve(str.size() + 1);
		const Char* begin = str.c_str();
		const char* end = begin + str.size() + 1;
		data_ptr_->assign(begin, end);
	};

	void assign (const char* str)
	{
		size_t size = strlen(str) + 1;
		const char* end = str + size;
		data_ptr_->assign(str, end);
	};

	void assign (const char* str, size_t len)
	{
		data_ptr_->assign(str, str + len);
	};


	void reserve(size_t capacity)
	{
		data_ptr_->reserve(capacity);
	};


	size_t size () const
	{
		return data_ptr_->size();
	};

	template <typename Char = Byte>
	const Char* copy () const
	{
		Byte* buffer = new Byte[size()];
		memcpy(buffer, data_ptr_->data(), size());

		return reinterpret_cast<Char*>(buffer);
	};


	std::vector<Byte>& data ()
	{
		return *data_ptr_;
	};

	const std::vector<Byte>& data () const
	{
		return *data_ptr_;
	};


private:
	void init ()
	{
		if (!data_ptr_)
			data_ptr_.reset(new std::vector<Byte>());
	};


private:
	std::shared_ptr<std::vector<Byte>> data_ptr_;
};

typedef Buffer<uint8_t> ByteBuffer;



#endif	// BUFFER_HH
