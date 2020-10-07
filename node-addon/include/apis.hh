
#include <string>
#include <vector>
#include <functional>

#include "buffer.hh"



#ifdef BUILDING_LILYPOND
#	define LILYPOND_API	extern __attribute__((__visibility__("default")))
#else
#	define LILYPOND_API
#endif



namespace LilyEx
{
	LILYPOND_API void initialize (const std::string& init_path);


	struct EngraveOptions
	{
		std::vector<std::string>										includeFolders;
		std::function<void (const std::string&)>						log;
		std::function<void (const std::string&, const ByteBuffer&)>		onSVG;
		std::function<void (const std::string&, const ByteBuffer&)>		onMIDI;
	};

	LILYPOND_API int engrave (const std::string& ly_code, const EngraveOptions& options);
}
