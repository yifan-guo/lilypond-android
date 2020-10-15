/* cpp arguments: pairs.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_cons, 2, 0, 0, (SCM (*)()) scm_cons); ;
 scm_c_define_gsubr (s_scm_pair_p, 1, 0, 0, (SCM (*)()) scm_pair_p); ;
 scm_c_define_gsubr (s_scm_set_car_x, 2, 0, 0, (SCM (*)()) scm_set_car_x); ;
 scm_c_define_gsubr (s_scm_set_cdr_x, 2, 0, 0, (SCM (*)()) scm_set_cdr_x); ;
