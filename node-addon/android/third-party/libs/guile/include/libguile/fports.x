/* cpp arguments: fports.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_setvbuf, 2, 1, 0, (SCM (*)()) scm_setvbuf); ;
 scm_c_define_gsubr (s_scm_file_port_p, 1, 0, 0, (SCM (*)()) scm_file_port_p); ;
 scm_c_define_gsubr (s_scm_open_file, 2, 0, 0, (SCM (*)()) scm_open_file); ;
