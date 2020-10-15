/* cpp arguments: srfi-14.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_char_set_p, 1, 0, 0, (SCM (*)()) scm_char_set_p); ;
 scm_c_define_gsubr (s_scm_char_set_eq, 0, 0, 1, (SCM (*)()) scm_char_set_eq); ;
 scm_c_define_gsubr (s_scm_char_set_leq, 0, 0, 1, (SCM (*)()) scm_char_set_leq); ;
 scm_c_define_gsubr (s_scm_char_set_hash, 1, 1, 0, (SCM (*)()) scm_char_set_hash); ;
 scm_c_define_gsubr (s_scm_char_set_cursor, 1, 0, 0, (SCM (*)()) scm_char_set_cursor); ;
 scm_c_define_gsubr (s_scm_char_set_ref, 2, 0, 0, (SCM (*)()) scm_char_set_ref); ;
 scm_c_define_gsubr (s_scm_char_set_cursor_next, 2, 0, 0, (SCM (*)()) scm_char_set_cursor_next); ;
 scm_c_define_gsubr (s_scm_end_of_char_set_p, 1, 0, 0, (SCM (*)()) scm_end_of_char_set_p); ;
 scm_c_define_gsubr (s_scm_char_set_fold, 3, 0, 0, (SCM (*)()) scm_char_set_fold); ;
 scm_c_define_gsubr (s_scm_char_set_unfold, 4, 1, 0, (SCM (*)()) scm_char_set_unfold); ;
 scm_c_define_gsubr (s_scm_char_set_unfold_x, 5, 0, 0, (SCM (*)()) scm_char_set_unfold_x); ;
 scm_c_define_gsubr (s_scm_char_set_for_each, 2, 0, 0, (SCM (*)()) scm_char_set_for_each); ;
 scm_c_define_gsubr (s_scm_char_set_map, 2, 0, 0, (SCM (*)()) scm_char_set_map); ;
 scm_c_define_gsubr (s_scm_char_set_copy, 1, 0, 0, (SCM (*)()) scm_char_set_copy); ;
 scm_c_define_gsubr (s_scm_char_set, 0, 0, 1, (SCM (*)()) scm_char_set); ;
 scm_c_define_gsubr (s_scm_list_to_char_set, 1, 1, 0, (SCM (*)()) scm_list_to_char_set); ;
 scm_c_define_gsubr (s_scm_list_to_char_set_x, 2, 0, 0, (SCM (*)()) scm_list_to_char_set_x); ;
 scm_c_define_gsubr (s_scm_string_to_char_set, 1, 1, 0, (SCM (*)()) scm_string_to_char_set); ;
 scm_c_define_gsubr (s_scm_string_to_char_set_x, 2, 0, 0, (SCM (*)()) scm_string_to_char_set_x); ;
 scm_c_define_gsubr (s_scm_char_set_filter, 2, 1, 0, (SCM (*)()) scm_char_set_filter); ;
 scm_c_define_gsubr (s_scm_char_set_filter_x, 3, 0, 0, (SCM (*)()) scm_char_set_filter_x); ;
 scm_c_define_gsubr (s_scm_ucs_range_to_char_set, 2, 2, 0, (SCM (*)()) scm_ucs_range_to_char_set); ;
 scm_c_define_gsubr (s_scm_ucs_range_to_char_set_x, 4, 0, 0, (SCM (*)()) scm_ucs_range_to_char_set_x); ;
 scm_c_define_gsubr (s_scm_to_char_set, 1, 0, 0, (SCM (*)()) scm_to_char_set); ;
 scm_c_define_gsubr (s_scm_char_set_size, 1, 0, 0, (SCM (*)()) scm_char_set_size); ;
 scm_c_define_gsubr (s_scm_char_set_count, 2, 0, 0, (SCM (*)()) scm_char_set_count); ;
 scm_c_define_gsubr (s_scm_char_set_to_list, 1, 0, 0, (SCM (*)()) scm_char_set_to_list); ;
 scm_c_define_gsubr (s_scm_char_set_to_string, 1, 0, 0, (SCM (*)()) scm_char_set_to_string); ;
 scm_c_define_gsubr (s_scm_char_set_contains_p, 2, 0, 0, (SCM (*)()) scm_char_set_contains_p); ;
 scm_c_define_gsubr (s_scm_char_set_every, 2, 0, 0, (SCM (*)()) scm_char_set_every); ;
 scm_c_define_gsubr (s_scm_char_set_any, 2, 0, 0, (SCM (*)()) scm_char_set_any); ;
 scm_c_define_gsubr (s_scm_char_set_adjoin, 1, 0, 1, (SCM (*)()) scm_char_set_adjoin); ;
 scm_c_define_gsubr (s_scm_char_set_delete, 1, 0, 1, (SCM (*)()) scm_char_set_delete); ;
 scm_c_define_gsubr (s_scm_char_set_adjoin_x, 1, 0, 1, (SCM (*)()) scm_char_set_adjoin_x); ;
 scm_c_define_gsubr (s_scm_char_set_delete_x, 1, 0, 1, (SCM (*)()) scm_char_set_delete_x); ;
 scm_c_define_gsubr (s_scm_char_set_complement, 1, 0, 0, (SCM (*)()) scm_char_set_complement); ;
 scm_c_define_gsubr (s_scm_char_set_union, 0, 0, 1, (SCM (*)()) scm_char_set_union); ;
 scm_c_define_gsubr (s_scm_char_set_intersection, 0, 0, 1, (SCM (*)()) scm_char_set_intersection); ;
 scm_c_define_gsubr (s_scm_char_set_difference, 1, 0, 1, (SCM (*)()) scm_char_set_difference); ;
 scm_c_define_gsubr (s_scm_char_set_xor, 0, 0, 1, (SCM (*)()) scm_char_set_xor); ;
 scm_c_define_gsubr (s_scm_char_set_diff_plus_intersection, 1, 0, 1, (SCM (*)()) scm_char_set_diff_plus_intersection); ;
 scm_c_define_gsubr (s_scm_char_set_complement_x, 1, 0, 0, (SCM (*)()) scm_char_set_complement_x); ;
 scm_c_define_gsubr (s_scm_char_set_union_x, 1, 0, 1, (SCM (*)()) scm_char_set_union_x); ;
 scm_c_define_gsubr (s_scm_char_set_intersection_x, 1, 0, 1, (SCM (*)()) scm_char_set_intersection_x); ;
 scm_c_define_gsubr (s_scm_char_set_difference_x, 1, 0, 1, (SCM (*)()) scm_char_set_difference_x); ;
 scm_c_define_gsubr (s_scm_char_set_xor_x, 1, 0, 1, (SCM (*)()) scm_char_set_xor_x); ;
 scm_c_define_gsubr (s_scm_char_set_diff_plus_intersection_x, 2, 0, 1, (SCM (*)()) scm_char_set_diff_plus_intersection_x); ;
