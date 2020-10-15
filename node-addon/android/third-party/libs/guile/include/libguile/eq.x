/* cpp arguments: eq.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_subr (s_scm_eq_p, 69, scm_eq_p); ;
 g_scm_eqv_p = ((SCM) (0)); scm_c_define_subr_with_generic (s_scm_eqv_p, 69, scm_eqv_p, &g_scm_eqv_p); ;
 g_scm_equal_p = ((SCM) (0)); scm_c_define_subr_with_generic (s_scm_equal_p, 69, scm_equal_p, &g_scm_equal_p); ;
