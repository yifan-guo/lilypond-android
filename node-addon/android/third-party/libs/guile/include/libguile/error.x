/* cpp arguments: error.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_error_scm, 5, 0, 0, (SCM (*)()) scm_error_scm); ;
 scm_c_define_gsubr (s_scm_strerror, 1, 0, 0, (SCM (*)()) scm_strerror); ;
 scm_system_error_key = scm_permanent_object (scm_from_locale_symbol ("system-error")) ;
 scm_num_overflow_key = scm_permanent_object (scm_from_locale_symbol ("numerical-overflow")) ;
 scm_out_of_range_key = scm_permanent_object (scm_from_locale_symbol ("out-of-range")) ;
 scm_args_number_key = scm_permanent_object (scm_from_locale_symbol ("wrong-number-of-args")) ;
 scm_arg_type_key = scm_permanent_object (scm_from_locale_symbol ("wrong-type-arg")) ;
 scm_memory_alloc_key = scm_permanent_object (scm_from_locale_symbol ("memory-allocation-error")) ;
 scm_misc_error_key = scm_permanent_object (scm_from_locale_symbol ("misc-error")) ;
