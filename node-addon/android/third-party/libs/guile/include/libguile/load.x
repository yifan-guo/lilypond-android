/* cpp arguments: load.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes */
 scm_c_define_gsubr (s_scm_primitive_load, 1, 0, 0, (SCM (*)()) scm_primitive_load); ;
 scm_c_define_gsubr (s_scm_sys_package_data_dir, 0, 0, 0, (SCM (*)()) scm_sys_package_data_dir); ;
 scm_c_define_gsubr (s_scm_sys_library_dir, 0, 0, 0, (SCM (*)()) scm_sys_library_dir); ;
 scm_c_define_gsubr (s_scm_sys_site_dir, 0, 0, 0, (SCM (*)()) scm_sys_site_dir); ;
 scm_c_define_gsubr (s_scm_parse_path, 1, 1, 0, (SCM (*)()) scm_parse_path); ;
 scm_c_define_gsubr (s_scm_search_path, 2, 1, 0, (SCM (*)()) scm_search_path); ;
 scm_c_define_gsubr (s_scm_sys_search_load_path, 1, 0, 0, (SCM (*)()) scm_sys_search_load_path); ;
 scm_c_define_gsubr (s_scm_primitive_load_path, 1, 0, 0, (SCM (*)()) scm_primitive_load_path); ;
