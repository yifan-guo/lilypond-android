/* cpp arguments: dynl.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_dynamic_link, 1, 0, 0, (SCM (*)()) scm_dynamic_link); ;
 scm_c_define_gsubr (s_scm_dynamic_object_p, 1, 0, 0, (SCM (*)()) scm_dynamic_object_p); ;
 scm_c_define_gsubr (s_scm_dynamic_unlink, 1, 0, 0, (SCM (*)()) scm_dynamic_unlink); ;
 scm_c_define_gsubr (s_scm_dynamic_func, 2, 0, 0, (SCM (*)()) scm_dynamic_func); ;
 scm_c_define_gsubr (s_scm_dynamic_call, 2, 0, 0, (SCM (*)()) scm_dynamic_call); ;
 scm_c_define_gsubr (s_scm_dynamic_args_call, 3, 0, 0, (SCM (*)()) scm_dynamic_args_call); ;
