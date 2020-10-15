/* cpp arguments: variable.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_make_variable, 1, 0, 0, (SCM (*)()) scm_make_variable); ;
 scm_c_define_gsubr (s_scm_make_undefined_variable, 0, 0, 0, (SCM (*)()) scm_make_undefined_variable); ;
 scm_c_define_gsubr (s_scm_variable_p, 1, 0, 0, (SCM (*)()) scm_variable_p); ;
 scm_c_define_gsubr (s_scm_variable_ref, 1, 0, 0, (SCM (*)()) scm_variable_ref); ;
 scm_c_define_gsubr (s_scm_variable_set_x, 2, 0, 0, (SCM (*)()) scm_variable_set_x); ;
 scm_c_define_gsubr (s_scm_variable_bound_p, 1, 0, 0, (SCM (*)()) scm_variable_bound_p); ;
