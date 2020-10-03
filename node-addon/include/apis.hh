
#include <string>



#ifdef BUILDING_LILYPOND
#	define LILYPOND_API	extern __attribute__((__visibility__("default")))
#else
#	define LILYPOND_API
#endif



namespace LilyEx
{
	//LILYPOND_API void initialize ();

	LILYPOND_API void callMain (const std::string& filename);
}
