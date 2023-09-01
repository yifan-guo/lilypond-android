/* cpp arguments: environments.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_environment_p, 1, 0, 0, (SCM (*)()) scm_environment_p); ;
 scm_c_define_gsubr (s_scm_environment_bound_p, 2, 0, 0, (SCM (*)()) scm_environment_bound_p); ;
 scm_c_define_gsubr (s_scm_environment_ref, 2, 0, 0, (SCM (*)()) scm_environment_ref); ;
 scm_c_define_gsubr (s_scm_environment_fold, 3, 0, 0, (SCM (*)()) scm_environment_fold); ;
 scm_c_define_gsubr (s_scm_environment_define, 3, 0, 0, (SCM (*)()) scm_environment_define); ;
 scm_c_define_gsubr (s_scm_environment_undefine, 2, 0, 0, (SCM (*)()) scm_environment_undefine); ;
 scm_c_define_gsubr (s_scm_environment_set_x, 3, 0, 0, (SCM (*)()) scm_environment_set_x); ;
 scm_c_define_gsubr (s_scm_environment_cell, 3, 0, 0, (SCM (*)()) scm_environment_cell); ;
 scm_c_define_gsubr (s_scm_environment_observe, 2, 0, 0, (SCM (*)()) scm_environment_observe); ;
 scm_c_define_gsubr (s_scm_environment_observe_weak, 2, 0, 0, (SCM (*)()) scm_environment_observe_weak); ;
 scm_c_define_gsubr (s_scm_environment_unobserve, 1, 0, 0, (SCM (*)()) scm_environment_unobserve); ;
 scm_c_define_gsubr (s_scm_make_leaf_environment, 0, 0, 0, (SCM (*)()) scm_make_leaf_environment); ;
 scm_c_define_gsubr (s_scm_leaf_environment_p, 1, 0, 0, (SCM (*)()) scm_leaf_environment_p); ;
 scm_c_define_gsubr (s_scm_make_eval_environment, 2, 0, 0, (SCM (*)()) scm_make_eval_environment); ;
 scm_c_define_gsubr (s_scm_eval_environment_p, 1, 0, 0, (SCM (*)()) scm_eval_environment_p); ;
 scm_c_define_gsubr (s_scm_eval_environment_local, 1, 0, 0, (SCM (*)()) scm_eval_environment_local); ;
 scm_c_define_gsubr (s_scm_eval_environment_set_local_x, 2, 0, 0, (SCM (*)()) scm_eval_environment_set_local_x); ;
 scm_c_define_gsubr (s_scm_eval_environment_imported, 1, 0, 0, (SCM (*)()) scm_eval_environment_imported); ;
 scm_c_define_gsubr (s_scm_eval_environment_set_imported_x, 2, 0, 0, (SCM (*)()) scm_eval_environment_set_imported_x); ;
 scm_c_define_gsubr (s_scm_make_import_environment, 2, 0, 0, (SCM (*)()) scm_make_import_environment); ;
 scm_c_define_gsubr (s_scm_import_environment_p, 1, 0, 0, (SCM (*)()) scm_import_environment_p); ;
 scm_c_define_gsubr (s_scm_import_environment_imports, 1, 0, 0, (SCM (*)()) scm_import_environment_imports); ;
 scm_c_define_gsubr (s_scm_import_environment_set_imports_x, 2, 0, 0, (SCM (*)()) scm_import_environment_set_imports_x); ;
 symbol_immutable_location = scm_permanent_object (scm_from_locale_symbol ("immutable-location")) ;
 symbol_mutable_location = scm_permanent_object (scm_from_locale_symbol ("mutable-location")) ;
 scm_c_define_gsubr (s_scm_make_export_environment, 2, 0, 0, (SCM (*)()) scm_make_export_environment); ;
 scm_c_define_gsubr (s_scm_export_environment_p, 1, 0, 0, (SCM (*)()) scm_export_environment_p); ;
 scm_c_define_gsubr (s_scm_export_environment_private, 1, 0, 0, (SCM (*)()) scm_export_environment_private); ;
 scm_c_define_gsubr (s_scm_export_environment_set_private_x, 2, 0, 0, (SCM (*)()) scm_export_environment_set_private_x); ;
 scm_c_define_gsubr (s_scm_export_environment_signature, 1, 0, 0, (SCM (*)()) scm_export_environment_signature); ;
 scm_c_define_gsubr (s_scm_export_environment_set_signature_x, 2, 0, 0, (SCM (*)()) scm_export_environment_set_signature_x); ;