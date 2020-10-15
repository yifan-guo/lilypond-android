/* cpp arguments: scmsigs.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_sigaction_for_thread, 1, 3, 0, (SCM (*)()) scm_sigaction_for_thread); ;
 scm_c_define_gsubr (s_scm_restore_signals, 0, 0, 0, (SCM (*)()) scm_restore_signals); ;
 scm_c_define_gsubr (s_scm_alarm, 1, 0, 0, (SCM (*)()) scm_alarm); ;
 scm_c_define_gsubr (s_scm_setitimer, 5, 0, 0, (SCM (*)()) scm_setitimer); ;
 scm_c_define_gsubr (s_scm_getitimer, 1, 0, 0, (SCM (*)()) scm_getitimer); ;
 scm_c_define_gsubr (s_scm_pause, 0, 0, 0, (SCM (*)()) scm_pause); ;
 scm_c_define_gsubr (s_scm_sleep, 1, 0, 0, (SCM (*)()) scm_sleep); ;
 scm_c_define_gsubr (s_scm_usleep, 1, 0, 0, (SCM (*)()) scm_usleep); ;
 scm_c_define_gsubr (s_scm_raise, 1, 0, 0, (SCM (*)()) scm_raise); ;
