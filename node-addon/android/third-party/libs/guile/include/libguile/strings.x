/* cpp arguments: strings.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_string_p, 1, 0, 0, (SCM (*)()) scm_string_p); ;
 scm_c_define_gsubr (s_scm_list_to_string, 1, 0, 0, (SCM (*)()) scm_string); ;
 scm_c_define_gsubr (s_scm_string, 0, 0, 1, (SCM (*)()) scm_string); ;
 scm_c_define_gsubr (s_scm_make_string, 1, 1, 0, (SCM (*)()) scm_make_string); ;
 scm_c_define_gsubr (s_scm_string_length, 1, 0, 0, (SCM (*)()) scm_string_length); ;
 scm_c_define_gsubr (s_scm_string_ref, 2, 0, 0, (SCM (*)()) scm_string_ref); ;
 scm_c_define_gsubr (s_scm_string_set_x, 3, 0, 0, (SCM (*)()) scm_string_set_x); ;
 scm_c_define_gsubr (s_scm_substring, 2, 1, 0, (SCM (*)()) scm_substring); ;
 scm_c_define_gsubr (s_scm_substring_read_only, 2, 1, 0, (SCM (*)()) scm_substring_read_only); ;
 scm_c_define_gsubr (s_scm_substring_copy, 2, 1, 0, (SCM (*)()) scm_substring_copy); ;
 scm_c_define_gsubr (s_scm_substring_shared, 2, 1, 0, (SCM (*)()) scm_substring_shared); ;
 scm_c_define_gsubr (s_scm_string_append, 0, 0, 1, (SCM (*)()) scm_string_append); ;
