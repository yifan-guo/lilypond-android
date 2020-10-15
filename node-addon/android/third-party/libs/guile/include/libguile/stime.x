/* cpp arguments: stime.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_get_internal_real_time, 0, 0, 0, (SCM (*)()) scm_get_internal_real_time); ;
 scm_c_define_gsubr (s_scm_times, 0, 0, 0, (SCM (*)()) scm_times); ;
 scm_c_define_gsubr (s_scm_get_internal_run_time, 0, 0, 0, (SCM (*)()) scm_get_internal_run_time); ;
 scm_c_define_gsubr (s_scm_current_time, 0, 0, 0, (SCM (*)()) scm_current_time); ;
 scm_c_define_gsubr (s_scm_gettimeofday, 0, 0, 0, (SCM (*)()) scm_gettimeofday); ;
 scm_c_define_gsubr (s_scm_localtime, 1, 1, 0, (SCM (*)()) scm_localtime); ;
 scm_c_define_gsubr (s_scm_gmtime, 1, 0, 0, (SCM (*)()) scm_gmtime); ;
 scm_c_define_gsubr (s_scm_mktime, 1, 1, 0, (SCM (*)()) scm_mktime); ;
 scm_c_define_gsubr (s_scm_tzset, 0, 0, 0, (SCM (*)()) scm_tzset); ;
 scm_c_define_gsubr (s_scm_strftime, 2, 0, 0, (SCM (*)()) scm_strftime); ;
 scm_c_define_gsubr (s_scm_strptime, 2, 0, 0, (SCM (*)()) scm_strptime); ;
