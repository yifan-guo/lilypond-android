/* cpp arguments: net_db.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_host_not_found_key = scm_permanent_object (scm_from_locale_symbol ("host-not-found")) ;
 scm_try_again_key = scm_permanent_object (scm_from_locale_symbol ("try-again")) ;
 scm_no_recovery_key = scm_permanent_object (scm_from_locale_symbol ("no-recovery")) ;
 scm_no_data_key = scm_permanent_object (scm_from_locale_symbol ("no-data")) ;
 scm_c_define_gsubr (s_scm_gethost, 0, 1, 0, (SCM (*)()) scm_gethost); ;
 scm_c_define_gsubr (s_scm_getnet, 0, 1, 0, (SCM (*)()) scm_getnet); ;
 scm_c_define_gsubr (s_scm_getproto, 0, 1, 0, (SCM (*)()) scm_getproto); ;
 scm_c_define_gsubr (s_scm_getserv, 0, 2, 0, (SCM (*)()) scm_getserv); ;
 scm_c_define_gsubr (s_scm_sethost, 0, 1, 0, (SCM (*)()) scm_sethost); ;
 scm_c_define_gsubr (s_scm_setnet, 0, 1, 0, (SCM (*)()) scm_setnet); ;
 scm_c_define_gsubr (s_scm_setproto, 0, 1, 0, (SCM (*)()) scm_setproto); ;
 scm_c_define_gsubr (s_scm_setserv, 0, 1, 0, (SCM (*)()) scm_setserv); ;
