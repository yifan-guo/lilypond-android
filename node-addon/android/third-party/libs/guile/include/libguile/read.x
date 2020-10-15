/* cpp arguments: read.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_sym_dot = scm_permanent_object (scm_from_locale_symbol (".")) ;
 scm_keyword_prefix = scm_permanent_object (scm_from_locale_symbol ("prefix")) ;
 scm_keyword_postfix = scm_permanent_object (scm_from_locale_symbol ("postfix")) ;
 scm_c_define_gsubr (s_scm_read_options, 0, 1, 0, (SCM (*)()) scm_read_options); ;
 scm_c_define_gsubr (s_scm_read, 0, 1, 0, (SCM (*)()) scm_read); ;
 scm_c_define_gsubr (s_scm_read_hash_extend, 2, 0, 0, (SCM (*)()) scm_read_hash_extend); ;
