/* cpp arguments: procprop.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_sym_system_procedure = scm_permanent_object (scm_from_locale_symbol ("system-procedure")) ;
 scm_sym_arity = scm_permanent_object (scm_from_locale_symbol ("arity")) ;
 scm_c_define_gsubr (s_scm_procedure_properties, 1, 0, 0, (SCM (*)()) scm_procedure_properties); ;
 scm_c_define_gsubr (s_scm_set_procedure_properties_x, 2, 0, 0, (SCM (*)()) scm_set_procedure_properties_x); ;
 scm_c_define_gsubr (s_scm_procedure_property, 2, 0, 0, (SCM (*)()) scm_procedure_property); ;
 scm_c_define_gsubr (s_scm_set_procedure_property_x, 3, 0, 0, (SCM (*)()) scm_set_procedure_property_x); ;
