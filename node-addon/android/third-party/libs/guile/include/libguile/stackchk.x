/* cpp arguments: stackchk.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_stack_overflow_key = scm_permanent_object (scm_from_locale_symbol ("stack-overflow")) ;
 scm_c_define_gsubr (s_scm_sys_get_stack_size, 0, 0, 0, (SCM (*)()) scm_sys_get_stack_size); ;
