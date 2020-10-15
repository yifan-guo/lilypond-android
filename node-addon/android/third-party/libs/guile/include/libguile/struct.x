/* cpp arguments: struct.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_make_struct_layout, 1, 0, 0, (SCM (*)()) scm_make_struct_layout); ;
 scm_c_define_gsubr (s_scm_struct_p, 1, 0, 0, (SCM (*)()) scm_struct_p); ;
 scm_c_define_gsubr (s_scm_struct_vtable_p, 1, 0, 0, (SCM (*)()) scm_struct_vtable_p); ;
 scm_c_define_gsubr (s_scm_make_struct, 2, 0, 1, (SCM (*)()) scm_make_struct); ;
 scm_c_define_gsubr (s_scm_make_vtable_vtable, 2, 0, 1, (SCM (*)()) scm_make_vtable_vtable); ;
 scm_c_define_gsubr (s_scm_make_vtable, 1, 1, 0, (SCM (*)()) scm_make_vtable); ;
 scm_c_define_gsubr (s_scm_struct_ref, 2, 0, 0, (SCM (*)()) scm_struct_ref); ;
 scm_c_define_gsubr (s_scm_struct_set_x, 3, 0, 0, (SCM (*)()) scm_struct_set_x); ;
 scm_c_define_gsubr (s_scm_struct_vtable, 1, 0, 0, (SCM (*)()) scm_struct_vtable); ;
 scm_c_define_gsubr (s_scm_struct_vtable_tag, 1, 0, 0, (SCM (*)()) scm_struct_vtable_tag); ;
 scm_c_define_gsubr (s_scm_struct_vtable_name, 1, 0, 0, (SCM (*)()) scm_struct_vtable_name); ;
 scm_c_define_gsubr (s_scm_set_struct_vtable_name_x, 2, 0, 0, (SCM (*)()) scm_set_struct_vtable_name_x); ;
