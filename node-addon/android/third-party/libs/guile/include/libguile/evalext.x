/* cpp arguments: evalext.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_defined_p, 1, 1, 0, (SCM (*)()) scm_defined_p); ;
 scm_c_define_gsubr (s_map_in_order, 2, 0, 1, (SCM (*)()) scm_map); ;
 scm_c_define_gsubr (s_scm_self_evaluating_p, 1, 0, 0, (SCM (*)()) scm_self_evaluating_p); ;
