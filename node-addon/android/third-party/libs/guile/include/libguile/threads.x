/* cpp arguments: threads.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_call_with_new_thread, 1, 1, 0, (SCM (*)()) scm_call_with_new_thread); ;
 scm_c_define_gsubr (s_scm_yield, 0, 0, 0, (SCM (*)()) scm_yield); ;
 scm_c_define_gsubr (s_scm_join_thread, 1, 0, 0, (SCM (*)()) scm_join_thread); ;
 scm_c_define_gsubr (s_scm_make_mutex, 0, 0, 0, (SCM (*)()) scm_make_mutex); ;
 scm_c_define_gsubr (s_scm_make_recursive_mutex, 0, 0, 0, (SCM (*)()) scm_make_recursive_mutex); ;
 scm_c_define_gsubr (s_scm_lock_mutex, 1, 0, 0, (SCM (*)()) scm_lock_mutex); ;
 scm_c_define_gsubr (s_scm_try_mutex, 1, 0, 0, (SCM (*)()) scm_try_mutex); ;
 scm_c_define_gsubr (s_scm_unlock_mutex, 1, 0, 0, (SCM (*)()) scm_unlock_mutex); ;
 scm_c_define_gsubr (s_scm_make_condition_variable, 0, 0, 0, (SCM (*)()) scm_make_condition_variable); ;
 scm_c_define_gsubr (s_scm_timed_wait_condition_variable, 2, 1, 0, (SCM (*)()) scm_timed_wait_condition_variable); ;
 scm_c_define_gsubr (s_scm_signal_condition_variable, 1, 0, 0, (SCM (*)()) scm_signal_condition_variable); ;
 scm_c_define_gsubr (s_scm_broadcast_condition_variable, 1, 0, 0, (SCM (*)()) scm_broadcast_condition_variable); ;
 scm_c_define_gsubr (s_scm_current_thread, 0, 0, 0, (SCM (*)()) scm_current_thread); ;
 scm_c_define_gsubr (s_scm_all_threads, 0, 0, 0, (SCM (*)()) scm_all_threads); ;
 scm_c_define_gsubr (s_scm_thread_exited_p, 1, 0, 0, (SCM (*)()) scm_thread_exited_p); ;
