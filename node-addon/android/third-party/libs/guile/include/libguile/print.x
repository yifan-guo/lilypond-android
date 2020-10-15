/* cpp arguments: print.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 sym_reader = scm_permanent_object (scm_from_locale_symbol ("reader")) ;
 scm_c_define_gsubr (s_scm_print_options, 0, 1, 0, (SCM (*)()) scm_print_options); ;
 g_write = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_write, 1, 1, 0, (SCM (*)()) scm_write, &g_write) ;
 g_display = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_display, 1, 1, 0, (SCM (*)()) scm_display, &g_display) ;
 scm_c_define_gsubr (s_scm_simple_format, 2, 0, 1, (SCM (*)()) scm_simple_format); ;
 scm_c_define_gsubr (s_scm_newline, 0, 1, 0, (SCM (*)()) scm_newline); ;
 scm_c_define_gsubr (s_scm_write_char, 1, 1, 0, (SCM (*)()) scm_write_char); ;
 scm_c_define_gsubr (s_scm_port_with_print_state, 1, 1, 0, (SCM (*)()) scm_port_with_print_state); ;
 scm_c_define_gsubr (s_scm_get_print_state, 1, 0, 0, (SCM (*)()) scm_get_print_state); ;
