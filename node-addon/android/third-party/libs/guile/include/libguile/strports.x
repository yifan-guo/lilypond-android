/* cpp arguments: strports.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_object_to_string, 1, 1, 0, (SCM (*)()) scm_object_to_string); ;
 scm_c_define_gsubr (s_scm_call_with_output_string, 1, 0, 0, (SCM (*)()) scm_call_with_output_string); ;
 scm_c_define_gsubr (s_scm_call_with_input_string, 2, 0, 0, (SCM (*)()) scm_call_with_input_string); ;
 scm_c_define_gsubr (s_scm_open_input_string, 1, 0, 0, (SCM (*)()) scm_open_input_string); ;
 scm_c_define_gsubr (s_scm_open_output_string, 0, 0, 0, (SCM (*)()) scm_open_output_string); ;
 scm_c_define_gsubr (s_scm_get_output_string, 1, 0, 0, (SCM (*)()) scm_get_output_string); ;
 scm_c_define_gsubr (s_scm_eval_string_in_module, 1, 1, 0, (SCM (*)()) scm_eval_string_in_module); ;
