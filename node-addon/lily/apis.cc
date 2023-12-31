
#include <iostream>
#include <sstream>
#include <cstdio>
#include <ctime>
#include <regex>
#if HAVE_GETTEXT
#	include <libintl.h>
#endif

#include "lilypond-ex.hh"

#include "lily-imports.hh"
#include "lily-guile.hh"
#include "global-ctor.hh"
#include "freetype.hh"
#include "all-font-metrics.hh"
#include "../../flower/warn.hh"
#include "../../flower/international.hh"
#include "lily-version.hh"
#include "relocate.hh"

#include "sources.hh"
#include "file-name-map.hh"
#include "lily-parser.hh"
#include "source-file.hh"
#include "../../flower/string-convert.hh"



extern std::string lilypond_datadir;
extern std::vector<std::string> start_environment_global;
extern std::string init_scheme_variables_global;
extern std::string init_scheme_code_global;
extern File_path global_path;
extern std::string init_name_global;
extern bool parse_protect_global;


void init_fontconfig ();


static void prepend_scheme_list (const std::string &dir, const std::string &scmlist)
/*
 *	Inserts an item at the front of a Scheme list, e.g. %load-path
 *	Parameters:
 *		dir:		 The directory to add to the front of the list
 *		scmlist: The Scheme list onto which to prepend the directory
 */
{
	SCM var = scm_c_lookup (scmlist.c_str ());
	scm_variable_set_x (var, scm_cons (scm_from_locale_string (dir.c_str ()),
																		 scm_variable_ref (var)));
}


static void env_var_info (FILE *out, char const *key)
/*
 * Retrieve value of an OS environment variable.
 * Parameter:
 *	key, the name of an environment variable.
 */
{
	if (char const *value = getenv (key))
		fprintf (out, "%s=\"%s\"\n", key, value);
}


static void dir_info (FILE *out)
/*
 * Print out information re directories being used by LilyPond
 * for this session.
 */
{
	fputs ("\n", out);
	env_var_info (out, "LILYPOND_DATADIR");
	env_var_info (out, "LILYPOND_LOCALEDIR");
	env_var_info (out, "LILYPOND_RELOCDIR");

	fputs (_f ("\n"
						 "Effective prefix: '%s'\n",
						 lilypond_datadir).c_str (), out);

	env_var_info (out, "FONTCONFIG_FILE");
	env_var_info (out, "FONTCONFIG_PATH");
	env_var_info (out, "GS_FONTPATH");
	env_var_info (out, "GS_LIB");
	env_var_info (out, "GUILE_LOAD_PATH");
	env_var_info (out, "PANGO_RC_FILE");
	env_var_info (out, "PANGO_PREFIX");
	env_var_info (out, "PATH");
	fputs ("\n", out);
}

static void setup_localisation ()
/*
 *	Set up local language text locale (if available from configure)
 *	Implicit inputs:
 *	HAVE_GETTEXT: Internationalization available for a local language.
 */
{
#if HAVE_GETTEXT
	/* Enable locales */
#if !defined (__MINGW32__) || defined (_UCRT)
	setlocale (LC_ALL, "");
#else
	// Workaround for MinGW UTF-8 locale settings issue:
	// `setlocale (LC_ALL, "")` in msvcrt.dll sets user-defined ANSI code page
	// (i.e. 437 for English, 932 for Japanse, etc.)
	// even if process code page is UTF-8 (i.e. 65001 for all languages).
	// With this setting, outputting UTF-8 string becomes garbled.
	// So we get the process code page with `GetACP ()` and,
	// if it is UTF-8, explicitly set locale's code page to UTF-8 (i.e. 65001).
	// If Universal CRT (UCRT, newer than msvcrt.dll) is used
	// (i.e. `_UCRT' is defined), no such workaround is needed.
	if (GetACP () == CP_UTF8)
		setlocale (LC_ALL, ".65001");
	else
		setlocale (LC_ALL, "");
#endif

	/* FIXME: check if this is still true.
		 Disable localisation of float values. */
	setlocale (LC_NUMERIC, "C");

#if GUILEV2
	// In order not to have this porting aid backfire to GUILE1 usage,
	// this is only compiled in the GUILEV2 version.	It should
	// eventually be replaced with proper multibyte communication with
	// GUILE2, but in the mean time it seems that this is the least
	// invasive path to get comparable results between the
	// not-really-multibyte-supporting GUILE1 and GUILE2

	/* Disable character sets */
	setlocale (LC_CTYPE, "C");
	/* But our text domain is in UTF-8 */
	bind_textdomain_codeset ("lilypond", "UTF-8");
#endif

	// we temporarily use the compile-time value for the locale
	// until we get the final directory location
	bindtextdomain ("lilypond", LOCALEDIR);
	textdomain ("lilypond");
#endif
}

static void identify (FILE *out)
/*
 * Print out LilyPond version string.
 */
{
	fputs (gnu_lilypond_version_string ().c_str (), out);
	fputs ("\n", out);
}

#if (GUILEV2)

static void setup_guile_v2_env ()
/*
 * Set up environment variables relevant to compiling
 * Scheme files for Guile V2.
 */
{
	sane_putenv ("GUILE_AUTO_COMPILE", "0", false); // disable auto-compile
	sane_putenv ("GUILE_WARN_DEPRECATED", "detailed",
							 "true"); // set Guile to info re deprecation
	/*
				Set root for Guile %compile-fallback to
				Lilypond root for its data.
			*/
	sane_putenv ("XDG_CACHE_HOME", lilypond_datadir, true);

	// This reduces the GC overhead during parsing and
	// initialization. To see if this is a good value, run #(display
	// (gc-stats)) just before \maininput in init.ly, and check that
	// it's roughly this value.
	sane_putenv ("GC_INITIAL_HEAP_SIZE", "40M", false);

	/*
		Empirically, multithreaded GC doesn't change wall time. It just
		adds another thread that burns 30% of the time.

		David K mentions: "I think that this may be due to both/either our
		use of mark hooks and of finalisers for calling destructors.
		Either may cause serialisation.	Another serialisation is because
		Guile itself switches BGC to Java mode where finalised objects can
		no longer be marked (or something like that: the exact semantics I
		do not remember).	And of course the C++ free store still has to
		do its full job.
	*/
	sane_putenv ("GC_NPROCS", "1", false);

	// Use less CPU for GC, at the expense of memory.
	sane_putenv ("GC_FREE_SPACE_DIVISOR", "1", false);
}
#else
static void setup_guile_gc_env ()
/*
 * Set up environment variables relevant to the
 * Garbage Collector
 */
{
	char const *yield = getenv ("LILYPOND_GC_YIELD");
	bool overwrite = true;
	if (!yield)
		{
			yield = "65";
			overwrite = false;
		}

	sane_putenv ("GUILE_MIN_YIELD_1", yield, overwrite);
	sane_putenv ("GUILE_MIN_YIELD_2", yield, overwrite);
	sane_putenv ("GUILE_MIN_YIELD_MALLOC", yield, overwrite);

	sane_putenv ("GUILE_INIT_SEGMENT_SIZE_1",
							 "10485760", overwrite);
	sane_putenv ("GUILE_MAX_SEGMENT_SIZE",
							 "104857600", overwrite);
}
#endif

static void setup_guile_env ()
/*
 * Set up environment variables relevant to Scheme
 */
{
#if (GUILEV2)
	setup_guile_v2_env ();	// configure Guile V2 behaviour
#else
	setup_guile_gc_env ();	// configure garbage collector
#endif
}




namespace LilyEx
{
	Sources sources_;

	EngraveOptions options_;
}


LY_DEFINE (lyx_output_port, "lyx:output-port",
	2, 0, 0, (SCM filename, SCM port),
	"Output result file via memory buffer.")
{
	//std::cout << "t4:" << std::clock() << std::endl;
	std::string name = ly_scm2string(filename);

	SCM str = scm_get_output_string(port);
	//ByteBuffer buffer(ly_scm2string(str));

	size_t len;
	char *c_string = scm_to_utf8_stringn (str, &len);
	ByteBuffer buffer;
	buffer.assign(c_string, len + 1);
	buffer.data()[len] = 0;	// set the terminal \0

	//std::cout << "lyx:output-port: " << name << std::endl;
	//std::cout << buffer << std::endl;

	LilyEx::options_.onSVG(name, buffer);

	return SCM_UNSPECIFIED;
}

static char const *PROGRAM_NAME = "lilypond";
static char const *PROGRAM_URL = "https://lilypond.org";

LY_DEFINE (ly_usage, "ly:usage",
					0, 0, 0, (),
					"Print usage message.")
/*
 * ly_usage: Routine to output standard information when LilyPond is run without a
 * source file to compile.
 * Also callable as ly:usage from Scheme.
 */
{
	/* No version number or newline here.	It confuses help2man.	*/
	printf ("%s", (_f ("Usage: %s [OPTION]... FILE...", PROGRAM_NAME).c_str ()));
	printf ("\n\n");
	printf ("%s", (_ ("Typeset music and/or produce MIDI from FILE.").c_str ()));
	printf ("\n\n");
	printf ("%s", (_ ("LilyPond produces beautiful music notation.").c_str ()));
	printf ("\n");
	printf ("%s", (_f ("For more information, see %s", PROGRAM_URL).c_str ()));
	printf ("\n\n");
	//printf ("%s", (_ ("Options:").c_str ()));
	//printf ("\n");
	//printf ("%s", Long_option_init::table_string (options_static).c_str ());
	//printf ("\n");
	/* Translators, please translate this string as
		 "Report bugs in English via %s",
		 or if there is a LilyPond users list or forum in your language
		 "Report bugs in English via %s or in YOUR_LANG via URI"	*/
	printf ("%s", (_f ("You found a bug? Please read %s",
										 "https://lilypond.org/bug-reports.html")
								 .c_str ()));
	printf ("\n");
	printf ("\n");
	return SCM_UNSPECIFIED;
}


LY_DEFINE (lyx_print, "lyx:print",
	1, 0, 0, (SCM message),
	"Print message in std::cout")
{
	std::string str_message = ly_scm2string(message);
	std::cout << str_message << std::endl;

	return SCM_UNSPECIFIED;
}


void on_midi_output (const std::string& filename, const ByteBuffer& data)
{
	//std::cout << "t3:" << std::clock() << std::endl;
	LilyEx::options_.onMIDI(filename, data);
}

SCM ly_init (void *p)
{
	ly_c_init_guile ();
	//std::cout << "initialize.3" << std::endl;
	call_constructors ();
	init_fontconfig ();

	//std::cout << "initialize.4" << std::endl;

	init_freetype ();
	ly_reset_all_fonts ();

	return SCM_UNSPECIFIED;
}


static SCM handle_error (void *data, SCM /*tag*/, SCM args)
{
	//scm_display_error_message (scm_cadr (args), scm_caddr (args), scm_current_error_port ());

	SCM port = scm_open_output_string();
	scm_display_error_message (scm_cadr (args), scm_caddr (args), port);

	SCM str = scm_get_output_string(port);
	std::string str_message = ly_scm2string(str);
	std::cerr << "SCM ERROR: " << str_message << std::endl;

	return SCM_UNSPECIFIED;
}


namespace LilyEx
{
	void initialize (const std::string& init_path)
	{
		//std::cout << "t0:" << std::clock() << std::endl;

		for (char **p = environ; *p; p++)
		{
			std::string env = *p;
			start_environment_global.push_back (env);

			auto eqpos = env.find ('=');
			if (eqpos != std::string::npos)
			{
				auto envkey = env.substr (0, eqpos);
				if (envkey.substr (0, 14) == "LILYPOND_INIT_")
				{
					std::string var = String_convert::to_lower (std::regex_replace (envkey.substr (14), std::regex("_"), "-"));
					std::string value = getenv (envkey.c_str ());

					init_scheme_variables_global += "(" + var + " . " + value + ")\n";
				}
			}
		}

		if (getenv ("LILYPOND_VERBOSE"))
			set_loglevel (LOGLEVEL_DEBUG);
		if (getenv ("LILYPOND_LOGLEVEL"))
			set_loglevel (getenv ("LILYPOND_LOGLEVEL"));

		setup_localisation ();

		//parse_argv (argc, argv);
		init_scheme_variables_global += "(backend . svg)\n";
		init_scheme_variables_global += "(memory-output . #t)\n";
		//init_scheme_variables_global += "(svg-woff . #t)\n";

		if (isatty (STDIN_FILENO) && (is_loglevel (LOG_BASIC)))
			identify (stderr);

		setup_paths (init_path.c_str ());
		setup_guile_env ();	// set up environment variables to pass into Guile API

		// Let Guile know whether the Ghostscript API is not available.
		init_scheme_variables_global += "(gs-api . #f)\n";

		scm_init_guile();

		std::string scm_pct_load_path = "%load-path";
		std::string scm_pct_load_compiled_path = "%load-compiled-path";

		prepend_scheme_list (lilypond_datadir, scm_pct_load_path);
		prepend_scheme_list (lilypond_datadir + "/scm", scm_pct_load_path);

		if (is_loglevel (LOG_DEBUG))
			dir_info (stderr);

		init_scheme_variables_global = "(" + init_scheme_variables_global + ")";
		init_scheme_code_global = "(begin " + init_scheme_code_global + ")";

		scm_internal_catch (SCM_BOOL_T, ly_init, nullptr, &handle_error, nullptr);

		sources_.set_path (&global_path);

		//std::cout << "t1:" << std::clock() << std::endl;
	}


	int engrave (const std::string& ly_code, const EngraveOptions& options)
	{
		//std::cout << "t2:" << std::clock() << std::endl;

		options_ = options;
		sources_.reset ();

		if (!options.includeFolders.empty ())
		{
			auto dirs = global_path.directories ();
			for (size_t i = 0; i < options.includeFolders.size (); ++i)
			{
				auto folder = options.includeFolders[i];
				if (std::find (dirs.begin (), dirs.end (), folder) == dirs.end ())
					global_path.append (folder);
			}
		}

		std::stringstream buffer_cerr;
		std::streambuf* origin = std::cerr.rdbuf(buffer_cerr.rdbuf());

		static std::hash<std::string> hash;
		std::stringstream stream;
		stream << "data:" << std::hex << hash(ly_code);

		static const std::string init = init_name_global.empty () ? "init.ly" : init_name_global;

		const std::string source_name = stream.str();
		const std::string source_name_ly = source_name + ".ly";

		Source_file *file = new Source_file (source_name_ly, ly_code);
		sources_.add (file);

		basic_progress (_f ("Processing `%s'", source_name_ly.c_str ()));

		// ensure guile error can be catched
		parse_protect_global = true;

		Lily_parser *parser = new Lily_parser (&sources_);
		//parser->parse_file (init, source_name_ly, "");
		parser->parse_file (init, source_name_ly, source_name);

		int error = parser->error_level_;

		parser->clear ();
		parser->unprotect ();

		std::cerr.rdbuf(origin);

		const std::string log = buffer_cerr.str();
		options.log(log);

		//std::cout << "t5:" << std::clock() << std::endl;

		return error;
	}
}
