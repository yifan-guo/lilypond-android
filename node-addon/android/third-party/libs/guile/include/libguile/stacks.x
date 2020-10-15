/* cpp arguments: stacks.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_stack_p, 1, 0, 0, (SCM (*)()) scm_stack_p); ;
 scm_c_define_gsubr (s_scm_make_stack, 1, 0, 1, (SCM (*)()) scm_make_stack); ;
 scm_c_define_gsubr (s_scm_stack_id, 1, 0, 0, (SCM (*)()) scm_stack_id); ;
 scm_c_define_gsubr (s_scm_stack_ref, 2, 0, 0, (SCM (*)()) scm_stack_ref); ;
 scm_c_define_gsubr (s_scm_stack_length, 1, 0, 0, (SCM (*)()) scm_stack_length); ;
 scm_c_define_gsubr (s_scm_frame_p, 1, 0, 0, (SCM (*)()) scm_frame_p); ;
 scm_c_define_gsubr (s_scm_last_stack_frame, 1, 0, 0, (SCM (*)()) scm_last_stack_frame); ;
 scm_c_define_gsubr (s_scm_frame_number, 1, 0, 0, (SCM (*)()) scm_frame_number); ;
 scm_c_define_gsubr (s_scm_frame_source, 1, 0, 0, (SCM (*)()) scm_frame_source); ;
 scm_c_define_gsubr (s_scm_frame_procedure, 1, 0, 0, (SCM (*)()) scm_frame_procedure); ;
 scm_c_define_gsubr (s_scm_frame_arguments, 1, 0, 0, (SCM (*)()) scm_frame_arguments); ;
 scm_c_define_gsubr (s_scm_frame_previous, 1, 0, 0, (SCM (*)()) scm_frame_previous); ;
 scm_c_define_gsubr (s_scm_frame_next, 1, 0, 0, (SCM (*)()) scm_frame_next); ;
 scm_c_define_gsubr (s_scm_frame_real_p, 1, 0, 0, (SCM (*)()) scm_frame_real_p); ;
 scm_c_define_gsubr (s_scm_frame_procedure_p, 1, 0, 0, (SCM (*)()) scm_frame_procedure_p); ;
 scm_c_define_gsubr (s_scm_frame_evaluating_args_p, 1, 0, 0, (SCM (*)()) scm_frame_evaluating_args_p); ;
 scm_c_define_gsubr (s_scm_frame_overflow_p, 1, 0, 0, (SCM (*)()) scm_frame_overflow_p); ;
