/* cpp arguments: srcprop.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_sym_filename = scm_permanent_object (scm_from_locale_symbol ("filename")) ;
 scm_sym_copy = scm_permanent_object (scm_from_locale_symbol ("copy")) ;
 scm_sym_line = scm_permanent_object (scm_from_locale_symbol ("line")) ;
 scm_sym_column = scm_permanent_object (scm_from_locale_symbol ("column")) ;
 scm_sym_breakpoint = scm_permanent_object (scm_from_locale_symbol ("breakpoint")) ;
 scm_c_define_gsubr (s_scm_source_properties, 1, 0, 0, (SCM (*)()) scm_source_properties); ;
 scm_c_define_gsubr (s_scm_set_source_properties_x, 2, 0, 0, (SCM (*)()) scm_set_source_properties_x); ;
 scm_c_define_gsubr (s_scm_source_property, 2, 0, 0, (SCM (*)()) scm_source_property); ;
 scm_c_define_gsubr (s_scm_set_source_property_x, 3, 0, 0, (SCM (*)()) scm_set_source_property_x); ;
