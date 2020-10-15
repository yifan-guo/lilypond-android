/* cpp arguments: throw.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_catch_with_pre_unwind_handler, 3, 1, 0, (SCM (*)()) scm_catch_with_pre_unwind_handler); ;
 scm_c_define_gsubr (s_scm_with_throw_handler, 3, 0, 0, (SCM (*)()) scm_with_throw_handler); ;
 scm_c_define_gsubr (s_scm_lazy_catch, 3, 0, 0, (SCM (*)()) scm_lazy_catch); ;
 scm_c_define_gsubr (s_scm_throw, 1, 0, 1, (SCM (*)()) scm_throw); ;
