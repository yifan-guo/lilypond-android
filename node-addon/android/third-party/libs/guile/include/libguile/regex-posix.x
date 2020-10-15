/* cpp arguments: regex-posix.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_regexp_error_key = scm_permanent_object (scm_from_locale_symbol ("regular-expression-syntax")) ;
 scm_c_define_gsubr (s_scm_regexp_p, 1, 0, 0, (SCM (*)()) scm_regexp_p); ;
 scm_c_define_gsubr (s_scm_make_regexp, 1, 0, 1, (SCM (*)()) scm_make_regexp); ;
 scm_c_define_gsubr (s_scm_regexp_exec, 2, 2, 0, (SCM (*)()) scm_regexp_exec); ;
