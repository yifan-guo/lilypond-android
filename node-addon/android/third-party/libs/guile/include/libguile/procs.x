/* cpp arguments: procs.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_procedure_p, 1, 0, 0, (SCM (*)()) scm_procedure_p); ;
 scm_c_define_gsubr (s_scm_closure_p, 1, 0, 0, (SCM (*)()) scm_closure_p); ;
 scm_c_define_gsubr (s_scm_thunk_p, 1, 0, 0, (SCM (*)()) scm_thunk_p); ;
 scm_c_define_gsubr (s_scm_procedure_documentation, 1, 0, 0, (SCM (*)()) scm_procedure_documentation); ;
 scm_c_define_gsubr (s_scm_procedure_with_setter_p, 1, 0, 0, (SCM (*)()) scm_procedure_with_setter_p); ;
 scm_c_define_gsubr (s_scm_make_procedure_with_setter, 2, 0, 0, (SCM (*)()) scm_make_procedure_with_setter); ;
 scm_c_define_gsubr (s_scm_procedure, 1, 0, 0, (SCM (*)()) scm_procedure); ;
 g_setter = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_setter, 1, 0, 0, (SCM (*)()) scm_setter, &g_setter) ;
