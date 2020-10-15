/* cpp arguments: symbols.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_symbol_p, 1, 0, 0, (SCM (*)()) scm_symbol_p); ;
 scm_c_define_gsubr (s_scm_symbol_interned_p, 1, 0, 0, (SCM (*)()) scm_symbol_interned_p); ;
 scm_c_define_gsubr (s_scm_make_symbol, 1, 0, 0, (SCM (*)()) scm_make_symbol); ;
 scm_c_define_gsubr (s_scm_symbol_to_string, 1, 0, 0, (SCM (*)()) scm_symbol_to_string); ;
 scm_c_define_gsubr (s_scm_string_to_symbol, 1, 0, 0, (SCM (*)()) scm_string_to_symbol); ;
 scm_c_define_gsubr (s_scm_string_ci_to_symbol, 1, 0, 0, (SCM (*)()) scm_string_ci_to_symbol); ;
 scm_c_define_gsubr (s_scm_gensym, 0, 1, 0, (SCM (*)()) scm_gensym); ;
 scm_c_define_gsubr (s_scm_symbol_hash, 1, 0, 0, (SCM (*)()) scm_symbol_hash); ;
 scm_c_define_gsubr (s_scm_symbol_fref, 1, 0, 0, (SCM (*)()) scm_symbol_fref); ;
 scm_c_define_gsubr (s_scm_symbol_pref, 1, 0, 0, (SCM (*)()) scm_symbol_pref); ;
 scm_c_define_gsubr (s_scm_symbol_fset_x, 2, 0, 0, (SCM (*)()) scm_symbol_fset_x); ;
 scm_c_define_gsubr (s_scm_symbol_pset_x, 2, 0, 0, (SCM (*)()) scm_symbol_pset_x); ;
