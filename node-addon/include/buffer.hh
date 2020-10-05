
#ifndef BUFFER_HH
#define BUFFER_HH



#include <memory>
#include <string>
#include <vector>



template <typename Byte>
class Buffer
{
public:
	template <typename Char>
	Buffer (const std::basic_string<Char>& str)
	{
		static_assert(sizeof(Char) == sizeof(Byte), "char type size must be the same with Buffer Byte.");

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


	template <typename T>
	void assign (const T& container)
	{
		reserve(container.size());
		data_ptr_->assign(container.begin(), container.end());
	};


	template <typename Char>
	void assign (const std::basic_string<Char>& str)
	{
		reserve(str.size() + 1);
		const Char* begin = str.c_str();
		const char* end = begin + str.size() + 1;
		data_ptr_->assign(begin, end);
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


private:
	void init ()
	{
		if (!data_ptr_)
			data_ptr_.reset(new std::vector<Byte>());
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
	std::shared_ptr<std::vector<Byte>> data_ptr_;
};

typedef Buffer<uint8_t> ByteBuffer;



#endif	// BUFFER_HH
