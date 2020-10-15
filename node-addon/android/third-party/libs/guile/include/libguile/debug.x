/* cpp arguments: debug.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_debug_options, 0, 1, 0, (SCM (*)()) scm_debug_options); ;
 scm_c_define_gsubr (s_scm_with_traps, 1, 0, 0, (SCM (*)()) scm_with_traps); ;
 scm_sym_procname = scm_permanent_object (scm_from_locale_symbol ("procname")) ;
 scm_sym_dots = scm_permanent_object (scm_from_locale_symbol ("...")) ;
 scm_sym_source = scm_permanent_object (scm_from_locale_symbol ("source")) ;
 scm_c_define_gsubr (s_scm_memoized_p, 1, 0, 0, (SCM (*)()) scm_memoized_p); ;
 scm_c_define_gsubr (s_scm_i_unmemoize_expr, 1, 0, 0, (SCM (*)()) scm_i_unmemoize_expr); ;
 scm_c_define_gsubr (s_scm_memoized_environment, 1, 0, 0, (SCM (*)()) scm_memoized_environment); ;
 scm_c_define_gsubr (s_scm_procedure_name, 1, 0, 0, (SCM (*)()) scm_procedure_name); ;
 scm_c_define_gsubr (s_scm_procedure_source, 1, 0, 0, (SCM (*)()) scm_procedure_source); ;
 scm_c_define_gsubr (s_scm_procedure_environment, 1, 0, 0, (SCM (*)()) scm_procedure_environment); ;
 scm_c_define_gsubr (s_scm_local_eval, 1, 1, 0, (SCM (*)()) scm_local_eval); ;
 scm_make_synt (s_start_stack, scm_makacro, scm_m_start_stack) ;
 scm_c_define_gsubr (s_scm_debug_object_p, 1, 0, 0, (SCM (*)()) scm_debug_object_p); ;
