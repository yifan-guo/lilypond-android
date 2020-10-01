
#include <iostream>
#include <cstdio>

#include "apis.hh"

#include "lily-imports.hh"
#include "lily-guile.hh"
#include "global-ctor.hh"
#include "freetype.hh"
#include "all-font-metrics.hh"
#include "warn.hh"
#include "international.hh"



extern std::string lilypond_datadir;


static void prepend_scheme_list (const std::string &dir, const std::string &scmlist)
/*
 *  Inserts an item at the front of a Scheme list, e.g. %load-path
 *  Parameters:
 *    dir:     The directory to add to the front of the list
 *    scmlist: The Scheme list onto which to prepend the directory
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
 *  key, the name of an environment variable.
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


void init_fontconfig ();


void callMain (const std::string& filename)
{
	// TODO:
	lilypond_datadir = "../build/out/share/lilypond/current";

	std::string scm_pct_load_path = "%load-path";
	std::string scm_pct_load_compiled_path = "%load-compiled-path";

	prepend_scheme_list (lilypond_datadir, scm_pct_load_path);
	prepend_scheme_list (lilypond_datadir + "/scm", scm_pct_load_path);

	if (is_loglevel (LOG_DEBUG))
		dir_info (stderr);

	//init_scheme_variables_global = "(" + init_scheme_variables_global + ")";
	//init_scheme_code_global = "(begin " + init_scheme_code_global + ")";

	ly_c_init_guile ();
	call_constructors ();
	init_fontconfig ();

	init_freetype ();
	ly_reset_all_fonts ();

	SCM files = SCM_EOL;
	SCM *tail = &files;

	*tail = scm_cons (scm_from_locale_string (filename.c_str()), SCM_EOL);
	tail = SCM_CDRLOC (*tail);

	Lily::lilypond_main (files);
}
