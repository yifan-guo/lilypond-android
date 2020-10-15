/* cpp arguments: macros.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_makmmacro, 1, 0, 0, (SCM (*)()) scm_makmmacro); ;
 scm_c_define_gsubr (s_scm_makacro, 1, 0, 0, (SCM (*)()) scm_makacro); ;
 scm_c_define_gsubr (s_scm_makmacro, 1, 0, 0, (SCM (*)()) scm_makmacro); ;
 scm_c_define_gsubr (s_scm_macro_p, 1, 0, 0, (SCM (*)()) scm_macro_p); ;
 scm_sym_syntax = scm_permanent_object (scm_from_locale_symbol ("syntax")) ;
 scm_sym_macro = scm_permanent_object (scm_from_locale_symbol ("macro")) ;
 scm_sym_mmacro = scm_permanent_object (scm_from_locale_symbol ("macro!")) ;
 scm_sym_bimacro = scm_permanent_object (scm_from_locale_symbol ("builtin-macro!")) ;
 scm_c_define_gsubr (s_scm_macro_type, 1, 0, 0, (SCM (*)()) scm_macro_type); ;
 scm_c_define_gsubr (s_scm_macro_name, 1, 0, 0, (SCM (*)()) scm_macro_name); ;
 scm_c_define_gsubr (s_scm_macro_transformer, 1, 0, 0, (SCM (*)()) scm_macro_transformer); ;
