
#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#ifdef HAVE_REGCOMP
#ifdef HAVE_REGEX_H
#include <regex.h>
#else
#ifdef HAVE_RXPOSIX_H
#include <rxposix.h>		/* GNU Rx library */
#else
#ifdef HAVE_RX_RXPOSIX_H
#include <rx/rxposix.h>		/* GNU Rx library on Linux */
#endif
#endif
#endif
#endif



extern "C"
{
	int	cached_regcomp(regex_t* exp, const char* source, int flags)
	{
		return regcomp(exp, source, flags);
	}


	int	cached_regexec(const regex_t* exp, const char* source, size_t nmatch, regmatch_t matches[], int flags)
	{
		//printf("\nscm_regexp_exec:%d\n", strlen(c_str));
		return regexec(exp, source, nmatch, matches, flags);
	}
}
