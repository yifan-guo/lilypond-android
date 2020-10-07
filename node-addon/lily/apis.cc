
#include <iostream>
#include <sstream>
#include <cstdio>
#include <ctime>
#include <libintl.h>

#include "apis.hh"

#include "lily-imports.hh"
#include "lily-guile.hh"
#include "global-ctor.hh"
#include "freetype.hh"
#include "all-font-metrics.hh"
#include "warn.hh"
#include "international.hh"
#include "lily-version.hh"
#include "relocate.hh"

#include "sources.hh"
#include "file-name-map.hh"
#include "lily-parser.hh"
#include "source-file.hh"



extern std::string lilypond_datadir;
extern std::vector<std::string> start_environment_global;
extern std::string init_scheme_variables_global;
extern std::string init_scheme_code_global;
extern File_path global_path;
extern std::string init_name_global;


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


void on_midi_output (const std::string& filename, const ByteBuffer& data)
{
	//std::cout << "t3:" << std::clock() << std::endl;
	LilyEx::options_.onMIDI(filename, data);
}


namespace LilyEx
{
	void initialize (const std::string& init_path)
	{
		//std::cout << "t0:" << std::clock() << std::endl;

		for (char **p = environ; *p; p++)
			start_environment_global.push_back (*p);

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

		ly_c_init_guile ();
		call_constructors ();
		init_fontconfig ();

		init_freetype ();
		ly_reset_all_fonts ();

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
