/* cpp arguments: deprecated.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_substring_move_left_x, 5, 0, 0, (SCM (*)()) scm_substring_move_x); ;
 scm_c_define_gsubr (s_substring_move_right_x, 5, 0, 0, (SCM (*)()) scm_substring_move_x); ;
 scm_c_define_gsubr (s_scm_registered_modules, 0, 0, 0, (SCM (*)()) scm_registered_modules); ;
 scm_c_define_gsubr (s_scm_clear_registered_modules, 0, 0, 0, (SCM (*)()) scm_clear_registered_modules); ;
 scm_sym_app = scm_permanent_object (scm_from_locale_symbol ("app")) ;
 scm_sym_modules = scm_permanent_object (scm_from_locale_symbol ("modules")) ;
 scm_c_define_gsubr (s_scm_close_all_ports_except, 0, 0, 1, (SCM (*)()) scm_close_all_ports_except); ;
 scm_c_define_gsubr (s_scm_variable_set_name_hint, 2, 0, 0, (SCM (*)()) scm_variable_set_name_hint); ;
 scm_c_define_gsubr (s_scm_builtin_variable, 1, 0, 0, (SCM (*)()) scm_builtin_variable); ;
 scm_c_define_gsubr (s_scm_sloppy_memq, 2, 0, 0, (SCM (*)()) scm_sloppy_memq); ;
 scm_c_define_gsubr (s_scm_sloppy_memv, 2, 0, 0, (SCM (*)()) scm_sloppy_memv); ;
 scm_c_define_gsubr (s_scm_sloppy_member, 2, 0, 0, (SCM (*)()) scm_sloppy_member); ;
 scm_end_of_file_key = scm_permanent_object (scm_from_locale_symbol ("end-of-file")) ;
 scm_c_define_gsubr (s_scm_read_and_eval_x, 0, 1, 0, (SCM (*)()) scm_read_and_eval_x); ;
 scm_c_define_gsubr (s_scm_string_to_obarray_symbol, 2, 1, 0, (SCM (*)()) scm_string_to_obarray_symbol); ;
 scm_c_define_gsubr (s_scm_intern_symbol, 2, 0, 0, (SCM (*)()) scm_intern_symbol); ;
 scm_c_define_gsubr (s_scm_unintern_symbol, 2, 0, 0, (SCM (*)()) scm_unintern_symbol); ;
 scm_c_define_gsubr (s_scm_symbol_binding, 2, 0, 0, (SCM (*)()) scm_symbol_binding); ;
 scm_c_define_gsubr (s_scm_symbol_bound_p, 2, 0, 0, (SCM (*)()) scm_symbol_bound_p); ;
 scm_c_define_gsubr (s_scm_symbol_set_x, 3, 0, 0, (SCM (*)()) scm_symbol_set_x); ;
 scm_c_define_gsubr (s_scm_gentemp, 0, 2, 0, (SCM (*)()) scm_gentemp); ;
 scm_c_define_gsubr (s_scm_guardian_destroyed_p, 1, 0, 0, (SCM (*)()) scm_guardian_destroyed_p); ;
 scm_c_define_gsubr (s_scm_guardian_greedy_p, 1, 0, 0, (SCM (*)()) scm_guardian_greedy_p); ;
 scm_c_define_gsubr (s_scm_destroy_guardian_x, 1, 0, 0, (SCM (*)()) scm_destroy_guardian_x); ;
