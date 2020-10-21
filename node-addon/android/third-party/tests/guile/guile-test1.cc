
#include <unistd.h>
#include <iostream>

#include <libguile.h>



static void prepend_scheme_list (const std::string &dir, const std::string &scmlist)
{
	SCM var = scm_c_lookup (scmlist.c_str ());
	scm_variable_set_x (var, scm_cons (scm_from_locale_string (dir.c_str ()), scm_variable_ref (var)));
}


int main ()
{
	std::string cwd = getcwd (0, 0);
	std::cout << "cwd: " << cwd << std::endl;

	std::string guile_dir = cwd + "/../../../../app/demo/src/main/assets/lilypond-server/share/guile/1.8";
	std::string scm_dir = cwd + "/../scm";

	setenv("GUILE_LOAD_PATH", guile_dir.c_str(), 1);

	scm_init_guile();

	prepend_scheme_list (scm_dir, "%load-path");

	scm_primitive_load_path (scm_from_locale_string ("test1.scm"));

	return 0;
}
