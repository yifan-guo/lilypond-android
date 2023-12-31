/* cpp arguments: srfi-4.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_sym_a = scm_permanent_object (scm_from_locale_symbol ("a")) ;
 scm_sym_b = scm_permanent_object (scm_from_locale_symbol ("b")) ;
 scm_c_define_gsubr (s_scm_uniform_vector_p, 1, 0, 0, (SCM (*)()) scm_uniform_vector_p); ;
 scm_c_define_gsubr (s_scm_uniform_vector_ref, 2, 0, 0, (SCM (*)()) scm_uniform_vector_ref); ;
 scm_c_define_gsubr (s_scm_uniform_vector_set_x, 3, 0, 0, (SCM (*)()) scm_uniform_vector_set_x); ;
 scm_c_define_gsubr (s_scm_uniform_vector_to_list, 1, 0, 0, (SCM (*)()) scm_uniform_vector_to_list); ;
 scm_c_define_gsubr (s_scm_uniform_vector_length, 1, 0, 0, (SCM (*)()) scm_uniform_vector_length); ;
 scm_c_define_gsubr (s_scm_uniform_vector_read_x, 1, 3, 0, (SCM (*)()) scm_uniform_vector_read_x); ;
 scm_c_define_gsubr (s_scm_uniform_vector_write, 1, 3, 0, (SCM (*)()) scm_uniform_vector_write); ;
 scm_c_define_gsubr (s_scm_u8vector_p, 1, 0, 0, (SCM (*)()) scm_u8vector_p); ;
 scm_c_define_gsubr (s_scm_make_u8vector, 1, 1, 0, (SCM (*)()) scm_make_u8vector); ;
 scm_c_define_gsubr (s_scm_u8vector, 0, 0, 1, (SCM (*)()) scm_u8vector); ;
 scm_c_define_gsubr (s_scm_u8vector_length, 1, 0, 0, (SCM (*)()) scm_u8vector_length); ;
 scm_c_define_gsubr (s_scm_u8vector_ref, 2, 0, 0, (SCM (*)()) scm_u8vector_ref); ;
 scm_c_define_gsubr (s_scm_u8vector_set_x, 3, 0, 0, (SCM (*)()) scm_u8vector_set_x); ;
 scm_c_define_gsubr (s_scm_u8vector_to_list, 1, 0, 0, (SCM (*)()) scm_u8vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_u8vector, 1, 0, 0, (SCM (*)()) scm_list_to_u8vector); ;
 scm_c_define_gsubr (s_scm_any_to_u8vector, 1, 0, 0, (SCM (*)()) scm_any_to_u8vector); ;
 scm_c_define_gsubr (s_scm_s8vector_p, 1, 0, 0, (SCM (*)()) scm_s8vector_p); ;
 scm_c_define_gsubr (s_scm_make_s8vector, 1, 1, 0, (SCM (*)()) scm_make_s8vector); ;
 scm_c_define_gsubr (s_scm_s8vector, 0, 0, 1, (SCM (*)()) scm_s8vector); ;
 scm_c_define_gsubr (s_scm_s8vector_length, 1, 0, 0, (SCM (*)()) scm_s8vector_length); ;
 scm_c_define_gsubr (s_scm_s8vector_ref, 2, 0, 0, (SCM (*)()) scm_s8vector_ref); ;
 scm_c_define_gsubr (s_scm_s8vector_set_x, 3, 0, 0, (SCM (*)()) scm_s8vector_set_x); ;
 scm_c_define_gsubr (s_scm_s8vector_to_list, 1, 0, 0, (SCM (*)()) scm_s8vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_s8vector, 1, 0, 0, (SCM (*)()) scm_list_to_s8vector); ;
 scm_c_define_gsubr (s_scm_any_to_s8vector, 1, 0, 0, (SCM (*)()) scm_any_to_s8vector); ;
 scm_c_define_gsubr (s_scm_u16vector_p, 1, 0, 0, (SCM (*)()) scm_u16vector_p); ;
 scm_c_define_gsubr (s_scm_make_u16vector, 1, 1, 0, (SCM (*)()) scm_make_u16vector); ;
 scm_c_define_gsubr (s_scm_u16vector, 0, 0, 1, (SCM (*)()) scm_u16vector); ;
 scm_c_define_gsubr (s_scm_u16vector_length, 1, 0, 0, (SCM (*)()) scm_u16vector_length); ;
 scm_c_define_gsubr (s_scm_u16vector_ref, 2, 0, 0, (SCM (*)()) scm_u16vector_ref); ;
 scm_c_define_gsubr (s_scm_u16vector_set_x, 3, 0, 0, (SCM (*)()) scm_u16vector_set_x); ;
 scm_c_define_gsubr (s_scm_u16vector_to_list, 1, 0, 0, (SCM (*)()) scm_u16vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_u16vector, 1, 0, 0, (SCM (*)()) scm_list_to_u16vector); ;
 scm_c_define_gsubr (s_scm_any_to_u16vector, 1, 0, 0, (SCM (*)()) scm_any_to_u16vector); ;
 scm_c_define_gsubr (s_scm_s16vector_p, 1, 0, 0, (SCM (*)()) scm_s16vector_p); ;
 scm_c_define_gsubr (s_scm_make_s16vector, 1, 1, 0, (SCM (*)()) scm_make_s16vector); ;
 scm_c_define_gsubr (s_scm_s16vector, 0, 0, 1, (SCM (*)()) scm_s16vector); ;
 scm_c_define_gsubr (s_scm_s16vector_length, 1, 0, 0, (SCM (*)()) scm_s16vector_length); ;
 scm_c_define_gsubr (s_scm_s16vector_ref, 2, 0, 0, (SCM (*)()) scm_s16vector_ref); ;
 scm_c_define_gsubr (s_scm_s16vector_set_x, 3, 0, 0, (SCM (*)()) scm_s16vector_set_x); ;
 scm_c_define_gsubr (s_scm_s16vector_to_list, 1, 0, 0, (SCM (*)()) scm_s16vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_s16vector, 1, 0, 0, (SCM (*)()) scm_list_to_s16vector); ;
 scm_c_define_gsubr (s_scm_any_to_s16vector, 1, 0, 0, (SCM (*)()) scm_any_to_s16vector); ;
 scm_c_define_gsubr (s_scm_u32vector_p, 1, 0, 0, (SCM (*)()) scm_u32vector_p); ;
 scm_c_define_gsubr (s_scm_make_u32vector, 1, 1, 0, (SCM (*)()) scm_make_u32vector); ;
 scm_c_define_gsubr (s_scm_u32vector, 0, 0, 1, (SCM (*)()) scm_u32vector); ;
 scm_c_define_gsubr (s_scm_u32vector_length, 1, 0, 0, (SCM (*)()) scm_u32vector_length); ;
 scm_c_define_gsubr (s_scm_u32vector_ref, 2, 0, 0, (SCM (*)()) scm_u32vector_ref); ;
 scm_c_define_gsubr (s_scm_u32vector_set_x, 3, 0, 0, (SCM (*)()) scm_u32vector_set_x); ;
 scm_c_define_gsubr (s_scm_u32vector_to_list, 1, 0, 0, (SCM (*)()) scm_u32vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_u32vector, 1, 0, 0, (SCM (*)()) scm_list_to_u32vector); ;
 scm_c_define_gsubr (s_scm_any_to_u32vector, 1, 0, 0, (SCM (*)()) scm_any_to_u32vector); ;
 scm_c_define_gsubr (s_scm_s32vector_p, 1, 0, 0, (SCM (*)()) scm_s32vector_p); ;
 scm_c_define_gsubr (s_scm_make_s32vector, 1, 1, 0, (SCM (*)()) scm_make_s32vector); ;
 scm_c_define_gsubr (s_scm_s32vector, 0, 0, 1, (SCM (*)()) scm_s32vector); ;
 scm_c_define_gsubr (s_scm_s32vector_length, 1, 0, 0, (SCM (*)()) scm_s32vector_length); ;
 scm_c_define_gsubr (s_scm_s32vector_ref, 2, 0, 0, (SCM (*)()) scm_s32vector_ref); ;
 scm_c_define_gsubr (s_scm_s32vector_set_x, 3, 0, 0, (SCM (*)()) scm_s32vector_set_x); ;
 scm_c_define_gsubr (s_scm_s32vector_to_list, 1, 0, 0, (SCM (*)()) scm_s32vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_s32vector, 1, 0, 0, (SCM (*)()) scm_list_to_s32vector); ;
 scm_c_define_gsubr (s_scm_any_to_s32vector, 1, 0, 0, (SCM (*)()) scm_any_to_s32vector); ;
 scm_c_define_gsubr (s_scm_u64vector_p, 1, 0, 0, (SCM (*)()) scm_u64vector_p); ;
 scm_c_define_gsubr (s_scm_make_u64vector, 1, 1, 0, (SCM (*)()) scm_make_u64vector); ;
 scm_c_define_gsubr (s_scm_u64vector, 0, 0, 1, (SCM (*)()) scm_u64vector); ;
 scm_c_define_gsubr (s_scm_u64vector_length, 1, 0, 0, (SCM (*)()) scm_u64vector_length); ;
 scm_c_define_gsubr (s_scm_u64vector_ref, 2, 0, 0, (SCM (*)()) scm_u64vector_ref); ;
 scm_c_define_gsubr (s_scm_u64vector_set_x, 3, 0, 0, (SCM (*)()) scm_u64vector_set_x); ;
 scm_c_define_gsubr (s_scm_u64vector_to_list, 1, 0, 0, (SCM (*)()) scm_u64vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_u64vector, 1, 0, 0, (SCM (*)()) scm_list_to_u64vector); ;
 scm_c_define_gsubr (s_scm_any_to_u64vector, 1, 0, 0, (SCM (*)()) scm_any_to_u64vector); ;
 scm_c_define_gsubr (s_scm_s64vector_p, 1, 0, 0, (SCM (*)()) scm_s64vector_p); ;
 scm_c_define_gsubr (s_scm_make_s64vector, 1, 1, 0, (SCM (*)()) scm_make_s64vector); ;
 scm_c_define_gsubr (s_scm_s64vector, 0, 0, 1, (SCM (*)()) scm_s64vector); ;
 scm_c_define_gsubr (s_scm_s64vector_length, 1, 0, 0, (SCM (*)()) scm_s64vector_length); ;
 scm_c_define_gsubr (s_scm_s64vector_ref, 2, 0, 0, (SCM (*)()) scm_s64vector_ref); ;
 scm_c_define_gsubr (s_scm_s64vector_set_x, 3, 0, 0, (SCM (*)()) scm_s64vector_set_x); ;
 scm_c_define_gsubr (s_scm_s64vector_to_list, 1, 0, 0, (SCM (*)()) scm_s64vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_s64vector, 1, 0, 0, (SCM (*)()) scm_list_to_s64vector); ;
 scm_c_define_gsubr (s_scm_any_to_s64vector, 1, 0, 0, (SCM (*)()) scm_any_to_s64vector); ;
 scm_c_define_gsubr (s_scm_f32vector_p, 1, 0, 0, (SCM (*)()) scm_f32vector_p); ;
 scm_c_define_gsubr (s_scm_make_f32vector, 1, 1, 0, (SCM (*)()) scm_make_f32vector); ;
 scm_c_define_gsubr (s_scm_f32vector, 0, 0, 1, (SCM (*)()) scm_f32vector); ;
 scm_c_define_gsubr (s_scm_f32vector_length, 1, 0, 0, (SCM (*)()) scm_f32vector_length); ;
 scm_c_define_gsubr (s_scm_f32vector_ref, 2, 0, 0, (SCM (*)()) scm_f32vector_ref); ;
 scm_c_define_gsubr (s_scm_f32vector_set_x, 3, 0, 0, (SCM (*)()) scm_f32vector_set_x); ;
 scm_c_define_gsubr (s_scm_f32vector_to_list, 1, 0, 0, (SCM (*)()) scm_f32vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_f32vector, 1, 0, 0, (SCM (*)()) scm_list_to_f32vector); ;
 scm_c_define_gsubr (s_scm_any_to_f32vector, 1, 0, 0, (SCM (*)()) scm_any_to_f32vector); ;
 scm_c_define_gsubr (s_scm_f64vector_p, 1, 0, 0, (SCM (*)()) scm_f64vector_p); ;
 scm_c_define_gsubr (s_scm_make_f64vector, 1, 1, 0, (SCM (*)()) scm_make_f64vector); ;
 scm_c_define_gsubr (s_scm_f64vector, 0, 0, 1, (SCM (*)()) scm_f64vector); ;
 scm_c_define_gsubr (s_scm_f64vector_length, 1, 0, 0, (SCM (*)()) scm_f64vector_length); ;
 scm_c_define_gsubr (s_scm_f64vector_ref, 2, 0, 0, (SCM (*)()) scm_f64vector_ref); ;
 scm_c_define_gsubr (s_scm_f64vector_set_x, 3, 0, 0, (SCM (*)()) scm_f64vector_set_x); ;
 scm_c_define_gsubr (s_scm_f64vector_to_list, 1, 0, 0, (SCM (*)()) scm_f64vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_f64vector, 1, 0, 0, (SCM (*)()) scm_list_to_f64vector); ;
 scm_c_define_gsubr (s_scm_any_to_f64vector, 1, 0, 0, (SCM (*)()) scm_any_to_f64vector); ;
 scm_c_define_gsubr (s_scm_c32vector_p, 1, 0, 0, (SCM (*)()) scm_c32vector_p); ;
 scm_c_define_gsubr (s_scm_make_c32vector, 1, 1, 0, (SCM (*)()) scm_make_c32vector); ;
 scm_c_define_gsubr (s_scm_c32vector, 0, 0, 1, (SCM (*)()) scm_c32vector); ;
 scm_c_define_gsubr (s_scm_c32vector_length, 1, 0, 0, (SCM (*)()) scm_c32vector_length); ;
 scm_c_define_gsubr (s_scm_c32vector_ref, 2, 0, 0, (SCM (*)()) scm_c32vector_ref); ;
 scm_c_define_gsubr (s_scm_c32vector_set_x, 3, 0, 0, (SCM (*)()) scm_c32vector_set_x); ;
 scm_c_define_gsubr (s_scm_c32vector_to_list, 1, 0, 0, (SCM (*)()) scm_c32vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_c32vector, 1, 0, 0, (SCM (*)()) scm_list_to_c32vector); ;
 scm_c_define_gsubr (s_scm_any_to_c32vector, 1, 0, 0, (SCM (*)()) scm_any_to_c32vector); ;
 scm_c_define_gsubr (s_scm_c64vector_p, 1, 0, 0, (SCM (*)()) scm_c64vector_p); ;
 scm_c_define_gsubr (s_scm_make_c64vector, 1, 1, 0, (SCM (*)()) scm_make_c64vector); ;
 scm_c_define_gsubr (s_scm_c64vector, 0, 0, 1, (SCM (*)()) scm_c64vector); ;
 scm_c_define_gsubr (s_scm_c64vector_length, 1, 0, 0, (SCM (*)()) scm_c64vector_length); ;
 scm_c_define_gsubr (s_scm_c64vector_ref, 2, 0, 0, (SCM (*)()) scm_c64vector_ref); ;
 scm_c_define_gsubr (s_scm_c64vector_set_x, 3, 0, 0, (SCM (*)()) scm_c64vector_set_x); ;
 scm_c_define_gsubr (s_scm_c64vector_to_list, 1, 0, 0, (SCM (*)()) scm_c64vector_to_list); ;
 scm_c_define_gsubr (s_scm_list_to_c64vector, 1, 0, 0, (SCM (*)()) scm_list_to_c64vector); ;
 scm_c_define_gsubr (s_scm_any_to_c64vector, 1, 0, 0, (SCM (*)()) scm_any_to_c64vector); ;
