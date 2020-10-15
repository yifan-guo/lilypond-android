/* cpp arguments: async.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_async, 1, 0, 0, (SCM (*)()) scm_async); ;
 scm_c_define_gsubr (s_scm_async_mark, 1, 0, 0, (SCM (*)()) scm_async_mark); ;
 scm_c_define_gsubr (s_scm_run_asyncs, 1, 0, 0, (SCM (*)()) scm_run_asyncs); ;
 scm_c_define_gsubr (s_scm_system_async, 1, 0, 0, (SCM (*)()) scm_system_async); ;
 scm_c_define_gsubr (s_scm_system_async_mark_for_thread, 1, 1, 0, (SCM (*)()) scm_system_async_mark_for_thread); ;
 scm_c_define_gsubr (s_scm_noop, 0, 0, 1, (SCM (*)()) scm_noop); ;
 scm_c_define_gsubr (s_scm_unmask_signals, 0, 0, 0, (SCM (*)()) scm_unmask_signals); ;
 scm_c_define_gsubr (s_scm_mask_signals, 0, 0, 0, (SCM (*)()) scm_mask_signals); ;
 scm_c_define_gsubr (s_scm_call_with_blocked_asyncs, 1, 0, 0, (SCM (*)()) scm_call_with_blocked_asyncs); ;
 scm_c_define_gsubr (s_scm_call_with_unblocked_asyncs, 1, 0, 0, (SCM (*)()) scm_call_with_unblocked_asyncs); ;
