/* cpp arguments: ioext.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_ftell, 1, 0, 0, (SCM (*)()) scm_ftell); ;
 scm_c_define_gsubr (s_scm_redirect_port, 2, 0, 0, (SCM (*)()) scm_redirect_port); ;
 scm_c_define_gsubr (s_scm_dup_to_fdes, 1, 1, 0, (SCM (*)()) scm_dup_to_fdes); ;
 scm_c_define_gsubr (s_scm_dup2, 2, 0, 0, (SCM (*)()) scm_dup2); ;
 scm_c_define_gsubr (s_scm_fileno, 1, 0, 0, (SCM (*)()) scm_fileno); ;
 scm_c_define_gsubr (s_scm_isatty_p, 1, 0, 0, (SCM (*)()) scm_isatty_p); ;
 scm_c_define_gsubr (s_scm_fdopen, 2, 0, 0, (SCM (*)()) scm_fdopen); ;
 scm_c_define_gsubr (s_scm_primitive_move_to_fdes, 2, 0, 0, (SCM (*)()) scm_primitive_move_to_fdes); ;
 scm_c_define_gsubr (s_scm_fdes_to_ports, 1, 0, 0, (SCM (*)()) scm_fdes_to_ports); ;
