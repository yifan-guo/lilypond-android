/* cpp arguments: hooks.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_make_hook, 0, 1, 0, (SCM (*)()) scm_make_hook); ;
 scm_c_define_gsubr (s_scm_hook_p, 1, 0, 0, (SCM (*)()) scm_hook_p); ;
 scm_c_define_gsubr (s_scm_hook_empty_p, 1, 0, 0, (SCM (*)()) scm_hook_empty_p); ;
 scm_c_define_gsubr (s_scm_add_hook_x, 2, 1, 0, (SCM (*)()) scm_add_hook_x); ;
 scm_c_define_gsubr (s_scm_remove_hook_x, 2, 0, 0, (SCM (*)()) scm_remove_hook_x); ;
 scm_c_define_gsubr (s_scm_reset_hook_x, 1, 0, 0, (SCM (*)()) scm_reset_hook_x); ;
 scm_c_define_gsubr (s_scm_run_hook, 1, 0, 1, (SCM (*)()) scm_run_hook); ;
 scm_c_define_gsubr (s_scm_hook_to_list, 1, 0, 0, (SCM (*)()) scm_hook_to_list); ;
