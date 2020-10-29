
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

#include <vector>
#include <map>
#include <string>
#include <functional>
#include <sstream>



std::hash<std::string> hash;

typedef regex_t* ref_regex_t;
typedef std::pair<std::vector<regmatch_t>, int> match_result_t;

std::map<std::size_t, regex_t>			regcomp_map;
std::map<std::size_t, match_result_t>	regexec_map;


static std::stringstream ss;


extern "C"
{
	int	cached_regcomp(ref_regex_t* exp, const char* source, int flags)
	{
		ss << source << '|' << flags;
		const std::string str = ss.str();
		ss.str("");
		ss.clear();

		std::size_t key = hash(str);
		if (regcomp_map.count(key))
		{
			*exp = &(regcomp_map[key]);

			return 0;
		}

		regex_t* pexp = &(regcomp_map[key]);
		int result = regcomp(pexp, source, flags);
		//std::copy(exp, exp + sizeof(regex_t), &(regcomp_map[key]));

		*exp = pexp;

		return result;
	}


	int	cached_regexec(const ref_regex_t* exp, const char* source, size_t nmatch, regmatch_t matches[], int flags)
	{
		//printf("\nscm_regexp_exec:%d\n", strlen(c_str));
		ss << (std::size_t)*exp << '|' << source << '|' << nmatch << '|' << flags;
		const std::string str = ss.str();
		ss.str("");
		ss.clear();

		std::size_t key = hash(str);
		if (regexec_map.count(key))
		{
			const match_result_t& cached = regexec_map[key];
			const regmatch_t* ms = cached.first.data();
			std::copy(ms, ms + nmatch, matches);

			return cached.second;
		}

		match_result_t& cached = regexec_map[key];
		cached.first.resize(nmatch);
		regmatch_t* ms = cached.first.data();

		cached.second = regexec(*exp, source, nmatch, ms, flags);
		std::copy(ms, ms + nmatch, matches);

		return cached.second;
	}


	void cached_regfree (ref_regex_t*__preg)
	{
	}


	size_t cached_regerror (int errcode, const ref_regex_t* preg, char* errbuf, size_t errbuf_size)
	{
		regerror(errcode, *preg, errbuf, errbuf_size);
	}
}
