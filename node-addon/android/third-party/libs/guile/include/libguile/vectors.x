/* cpp arguments: vectors.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_vector_p, 1, 0, 0, (SCM (*)()) scm_vector_p); ;
 g_vector_length = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_vector_length, 1, 0, 0, (SCM (*)()) scm_vector_length, &g_vector_length) ;
 scm_c_define_gsubr (s_list_to_vector, 1, 0, 0, (SCM (*)()) scm_vector); ;
 scm_c_define_gsubr (s_scm_vector, 0, 0, 1, (SCM (*)()) scm_vector); ;
 g_vector_ref = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_vector_ref, 2, 0, 0, (SCM (*)()) scm_vector_ref, &g_vector_ref) ;
 g_vector_set_x = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_vector_set_x, 3, 0, 0, (SCM (*)()) scm_vector_set_x, &g_vector_set_x) ;
 scm_c_define_gsubr (s_scm_make_vector, 1, 1, 0, (SCM (*)()) scm_make_vector); ;
 scm_c_define_gsubr (s_scm_vector_copy, 1, 0, 0, (SCM (*)()) scm_vector_copy); ;
 scm_c_define_gsubr (s_scm_vector_to_list, 1, 0, 0, (SCM (*)()) scm_vector_to_list); ;
 scm_c_define_gsubr (s_scm_vector_fill_x, 2, 0, 0, (SCM (*)()) scm_vector_fill_x); ;
 scm_c_define_gsubr (s_scm_vector_move_left_x, 5, 0, 0, (SCM (*)()) scm_vector_move_left_x); ;
 scm_c_define_gsubr (s_scm_vector_move_right_x, 5, 0, 0, (SCM (*)()) scm_vector_move_right_x); ;
 scm_c_define_gsubr (s_scm_generalized_vector_p, 1, 0, 0, (SCM (*)()) scm_generalized_vector_p); ;
 scm_c_define_gsubr (s_scm_generalized_vector_length, 1, 0, 0, (SCM (*)()) scm_generalized_vector_length); ;
 scm_c_define_gsubr (s_scm_generalized_vector_ref, 2, 0, 0, (SCM (*)()) scm_generalized_vector_ref); ;
 scm_c_define_gsubr (s_scm_generalized_vector_set_x, 3, 0, 0, (SCM (*)()) scm_generalized_vector_set_x); ;
 scm_c_define_gsubr (s_scm_generalized_vector_to_list, 1, 0, 0, (SCM (*)()) scm_generalized_vector_to_list); ;
