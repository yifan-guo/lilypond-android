
#include <string>



#ifdef BUILDING_LILYPOND
#	define LILYPOND_API	extern __attribute__((__visibility__("default")))
#else
#	define LILYPOND_API
#endif



LILYPOND_API void callMain (const std::string& filename);
