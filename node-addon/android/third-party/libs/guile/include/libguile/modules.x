/* cpp arguments: modules.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_current_module, 0, 0, 0, (SCM (*)()) scm_current_module); ;
 scm_c_define_gsubr (s_scm_set_current_module, 1, 0, 0, (SCM (*)()) scm_set_current_module); ;
 scm_c_define_gsubr (s_scm_interaction_environment, 0, 0, 0, (SCM (*)()) scm_interaction_environment); ;
 sym_module = scm_permanent_object (scm_from_locale_symbol ("module")) ;
 scm_c_define_gsubr (s_scm_env_module, 1, 0, 0, (SCM (*)()) scm_env_module); ;
 scm_c_define_gsubr (s_scm_standard_eval_closure, 1, 0, 0, (SCM (*)()) scm_standard_eval_closure); ;
 scm_c_define_gsubr (s_scm_standard_interface_eval_closure, 1, 0, 0, (SCM (*)()) scm_standard_interface_eval_closure); ;
 scm_c_define_gsubr (s_scm_module_import_interface, 2, 0, 0, (SCM (*)()) scm_module_import_interface); ;
 scm_c_define_gsubr (s_scm_get_pre_modules_obarray, 0, 0, 0, (SCM (*)()) scm_get_pre_modules_obarray); ;
 scm_sym_system_module = scm_permanent_object (scm_from_locale_symbol ("system-module")) ;
