/* cpp arguments: simpos.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_system, 0, 1, 0, (SCM (*)()) scm_system); ;
 scm_c_define_gsubr (s_scm_system_star, 0, 0, 1, (SCM (*)()) scm_system_star); ;
 scm_c_define_gsubr (s_scm_getenv, 1, 0, 0, (SCM (*)()) scm_getenv); ;
 scm_c_define_gsubr (s_scm_primitive_exit, 0, 1, 0, (SCM (*)()) scm_primitive_exit); ;
 scm_c_define_gsubr (s_scm_primitive__exit, 0, 1, 0, (SCM (*)()) scm_primitive__exit); ;
