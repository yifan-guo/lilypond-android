
#include <string>
#include <vector>
#include <functional>



#ifdef BUILDING_LILYPOND
#	define LILYPOND_API	extern __attribute__((__visibility__("default")))
#else
#	define LILYPOND_API
#endif



namespace LilyEx
{
	LILYPOND_API void initialize ();


	struct EngraveOptions
	{
		std::function<void (const std::string&, const std::string&)>			onSVG;
		std::function<void (const std::string&, const std::vector<uint8_t>&)>	onMIDI;
	};

	LILYPOND_API int engrave (const std::string& ly_code, const EngraveOptions& options);
}
