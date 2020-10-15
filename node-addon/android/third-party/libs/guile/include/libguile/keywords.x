/* cpp arguments: keywords.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_keyword_p, 1, 0, 0, (SCM (*)()) scm_keyword_p); ;
 scm_c_define_gsubr (s_scm_symbol_to_keyword, 1, 0, 0, (SCM (*)()) scm_symbol_to_keyword); ;
 scm_c_define_gsubr (s_scm_keyword_to_symbol, 1, 0, 0, (SCM (*)()) scm_keyword_to_symbol); ;
