/* cpp arguments: weaks.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_make_weak_vector, 1, 1, 0, (SCM (*)()) scm_make_weak_vector); ;
 scm_c_define_gsubr (s_list_to_weak_vector, 1, 0, 0, (SCM (*)()) scm_weak_vector); ;
 scm_c_define_gsubr (s_scm_weak_vector, 0, 0, 1, (SCM (*)()) scm_weak_vector); ;
 scm_c_define_gsubr (s_scm_weak_vector_p, 1, 0, 0, (SCM (*)()) scm_weak_vector_p); ;
 scm_c_define_gsubr (s_scm_make_weak_key_alist_vector, 0, 1, 0, (SCM (*)()) scm_make_weak_key_alist_vector); ;
 scm_c_define_gsubr (s_scm_make_weak_value_alist_vector, 0, 1, 0, (SCM (*)()) scm_make_weak_value_alist_vector); ;
 scm_c_define_gsubr (s_scm_make_doubly_weak_alist_vector, 1, 0, 0, (SCM (*)()) scm_make_doubly_weak_alist_vector); ;
 scm_c_define_gsubr (s_scm_weak_key_alist_vector_p, 1, 0, 0, (SCM (*)()) scm_weak_key_alist_vector_p); ;
 scm_c_define_gsubr (s_scm_weak_value_alist_vector_p, 1, 0, 0, (SCM (*)()) scm_weak_value_alist_vector_p); ;
 scm_c_define_gsubr (s_scm_doubly_weak_alist_vector_p, 1, 0, 0, (SCM (*)()) scm_doubly_weak_alist_vector_p); ;
