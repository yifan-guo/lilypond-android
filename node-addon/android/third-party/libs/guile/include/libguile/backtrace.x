/* cpp arguments: backtrace.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_display_error, 6, 0, 0, (SCM (*)()) scm_display_error); ;
 scm_c_define_gsubr (s_scm_display_application, 1, 2, 0, (SCM (*)()) scm_display_application); ;
 sym_base = scm_permanent_object (scm_from_locale_symbol ("base")) ;
 scm_c_define_gsubr (s_scm_display_backtrace_with_highlights, 2, 3, 0, (SCM (*)()) scm_display_backtrace_with_highlights); ;
 scm_has_shown_backtrace_hint_p_var = scm_permanent_object (scm_c_define ("has-shown-backtrace-hint?", ((SCM) ((((0)) << 8) + scm_tc8_flag)))); ;
 scm_c_define_gsubr (s_scm_backtrace_with_highlights, 0, 1, 0, (SCM (*)()) scm_backtrace_with_highlights); ;
