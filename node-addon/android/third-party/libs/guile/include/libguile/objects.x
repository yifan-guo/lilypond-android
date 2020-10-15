/* cpp arguments: objects.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_entity_p, 1, 0, 0, (SCM (*)()) scm_entity_p); ;
 scm_c_define_gsubr (s_scm_operator_p, 1, 0, 0, (SCM (*)()) scm_operator_p); ;
 scm_c_define_gsubr (s_scm_valid_object_procedure_p, 1, 0, 0, (SCM (*)()) scm_valid_object_procedure_p); ;
 scm_c_define_gsubr (s_scm_set_object_procedure_x, 2, 0, 0, (SCM (*)()) scm_set_object_procedure_x); ;
 scm_c_define_gsubr (s_scm_make_class_object, 2, 0, 0, (SCM (*)()) scm_make_class_object); ;
 scm_c_define_gsubr (s_scm_make_subclass_object, 2, 0, 0, (SCM (*)()) scm_make_subclass_object); ;
