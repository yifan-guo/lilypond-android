/* cpp arguments: i18n.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_gettext, 1, 2, 0, (SCM (*)()) scm_gettext); ;
 scm_c_define_gsubr (s_scm_ngettext, 3, 2, 0, (SCM (*)()) scm_ngettext); ;
 scm_c_define_gsubr (s_scm_textdomain, 0, 1, 0, (SCM (*)()) scm_textdomain); ;
 scm_c_define_gsubr (s_scm_bindtextdomain, 1, 1, 0, (SCM (*)()) scm_bindtextdomain); ;
 scm_c_define_gsubr (s_scm_bind_textdomain_codeset, 1, 1, 0, (SCM (*)()) scm_bind_textdomain_codeset); ;
