/* cpp arguments: ramap.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_array_fill_x, 2, 0, 0, (SCM (*)()) scm_array_fill_x); ;
 scm_c_define_gsubr (s_array_copy_in_order_x, 2, 0, 0, (SCM (*)()) scm_array_copy_x); ;
 scm_c_define_gsubr (s_scm_array_copy_x, 2, 0, 0, (SCM (*)()) scm_array_copy_x); ;
 scm_c_define_gsubr (s_array_map_in_order_x, 2, 0, 1, (SCM (*)()) scm_array_map_x); ;
 sym_b = scm_permanent_object (scm_from_locale_symbol ("b")) ;
 scm_c_define_gsubr (s_scm_array_map_x, 2, 0, 1, (SCM (*)()) scm_array_map_x); ;
 scm_c_define_gsubr (s_scm_array_for_each, 2, 0, 1, (SCM (*)()) scm_array_for_each); ;
 scm_c_define_gsubr (s_scm_array_index_map_x, 2, 0, 0, (SCM (*)()) scm_array_index_map_x); ;
