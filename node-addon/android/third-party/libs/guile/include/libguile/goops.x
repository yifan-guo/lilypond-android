/* cpp arguments: goops.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_sym_define_public = scm_permanent_object (scm_from_locale_symbol ("define-public")) ;
 scm_c_define_gsubr (s_scm_class_of, 1, 0, 0, (SCM (*)()) scm_class_of); ;
 scm_c_define_gsubr (s_scm_sys_compute_slots, 1, 0, 0, (SCM (*)()) scm_sys_compute_slots); ;
 k_init_value = scm_permanent_object (scm_from_locale_keyword ("init-value")) ;
 k_init_thunk = scm_permanent_object (scm_from_locale_keyword ("init-thunk")) ;
 scm_c_define_gsubr (s_scm_get_keyword, 3, 0, 0, (SCM (*)()) scm_get_keyword); ;
 k_init_keyword = scm_permanent_object (scm_from_locale_keyword ("init-keyword")) ;
 scm_c_define_gsubr (s_scm_sys_initialize_object, 2, 0, 0, (SCM (*)()) scm_sys_initialize_object); ;
 k_class = scm_permanent_object (scm_from_locale_keyword ("class")) ;
 k_allocation = scm_permanent_object (scm_from_locale_keyword ("allocation")) ;
 k_instance = scm_permanent_object (scm_from_locale_keyword ("instance")) ;
 scm_c_define_gsubr (s_scm_sys_prep_layout_x, 1, 0, 0, (SCM (*)()) scm_sys_prep_layout_x); ;
 scm_c_define_gsubr (s_scm_sys_inherit_magic_x, 2, 0, 0, (SCM (*)()) scm_sys_inherit_magic_x); ;
 sym_layout = scm_permanent_object (scm_from_locale_symbol ("layout")) ;
 sym_vcell = scm_permanent_object (scm_from_locale_symbol ("vcell")) ;
 sym_vtable = scm_permanent_object (scm_from_locale_symbol ("vtable")) ;
 sym_print = scm_permanent_object (scm_from_locale_symbol ("print")) ;
 sym_procedure = scm_permanent_object (scm_from_locale_symbol ("procedure")) ;
 sym_setter = scm_permanent_object (scm_from_locale_symbol ("setter")) ;
 sym_redefined = scm_permanent_object (scm_from_locale_symbol ("redefined")) ;
 sym_h0 = scm_permanent_object (scm_from_locale_symbol ("h0")) ;
 sym_h1 = scm_permanent_object (scm_from_locale_symbol ("h1")) ;
 sym_h2 = scm_permanent_object (scm_from_locale_symbol ("h2")) ;
 sym_h3 = scm_permanent_object (scm_from_locale_symbol ("h3")) ;
 sym_h4 = scm_permanent_object (scm_from_locale_symbol ("h4")) ;
 sym_h5 = scm_permanent_object (scm_from_locale_symbol ("h5")) ;
 sym_h6 = scm_permanent_object (scm_from_locale_symbol ("h6")) ;
 sym_h7 = scm_permanent_object (scm_from_locale_symbol ("h7")) ;
 sym_name = scm_permanent_object (scm_from_locale_symbol ("name")) ;
 sym_direct_supers = scm_permanent_object (scm_from_locale_symbol ("direct-supers")) ;
 sym_direct_slots = scm_permanent_object (scm_from_locale_symbol ("direct-slots")) ;
 sym_direct_subclasses = scm_permanent_object (scm_from_locale_symbol ("direct-subclasses")) ;
 sym_direct_methods = scm_permanent_object (scm_from_locale_symbol ("direct-methods")) ;
 sym_cpl = scm_permanent_object (scm_from_locale_symbol ("cpl")) ;
 sym_default_slot_definition_class = scm_permanent_object (scm_from_locale_symbol ("default-slot-definition-class")) ;
 sym_slots = scm_permanent_object (scm_from_locale_symbol ("slots")) ;
 sym_getters_n_setters = scm_permanent_object (scm_from_locale_symbol ("getters-n-setters")) ;
 sym_keyword_access = scm_permanent_object (scm_from_locale_symbol ("keyword-access")) ;
 sym_nfields = scm_permanent_object (scm_from_locale_symbol ("nfields")) ;
 sym_environment = scm_permanent_object (scm_from_locale_symbol ("environment")) ;
 scm_c_define_gsubr (s_scm_instance_p, 1, 0, 0, (SCM (*)()) scm_instance_p); ;
 scm_c_define_gsubr (s_scm_class_name, 1, 0, 0, (SCM (*)()) scm_class_name); ;
 scm_c_define_gsubr (s_scm_class_direct_supers, 1, 0, 0, (SCM (*)()) scm_class_direct_supers); ;
 scm_c_define_gsubr (s_scm_class_direct_slots, 1, 0, 0, (SCM (*)()) scm_class_direct_slots); ;
 scm_c_define_gsubr (s_scm_class_direct_subclasses, 1, 0, 0, (SCM (*)()) scm_class_direct_subclasses); ;
 scm_c_define_gsubr (s_scm_class_direct_methods, 1, 0, 0, (SCM (*)()) scm_class_direct_methods); ;
 scm_c_define_gsubr (s_scm_class_precedence_list, 1, 0, 0, (SCM (*)()) scm_class_precedence_list); ;
 scm_c_define_gsubr (s_scm_class_slots, 1, 0, 0, (SCM (*)()) scm_class_slots); ;
 scm_c_define_gsubr (s_scm_class_environment, 1, 0, 0, (SCM (*)()) scm_class_environment); ;
 scm_c_define_gsubr (s_scm_generic_function_name, 1, 0, 0, (SCM (*)()) scm_generic_function_name); ;
 sym_methods = scm_permanent_object (scm_from_locale_symbol ("methods")) ;
 sym_extended_by = scm_permanent_object (scm_from_locale_symbol ("extended-by")) ;
 sym_extends = scm_permanent_object (scm_from_locale_symbol ("extends")) ;
 scm_c_define_gsubr (s_scm_generic_function_methods, 1, 0, 0, (SCM (*)()) scm_generic_function_methods); ;
 scm_c_define_gsubr (s_scm_method_generic_function, 1, 0, 0, (SCM (*)()) scm_method_generic_function); ;
 scm_c_define_gsubr (s_scm_method_specializers, 1, 0, 0, (SCM (*)()) scm_method_specializers); ;
 scm_c_define_gsubr (s_scm_method_procedure, 1, 0, 0, (SCM (*)()) scm_method_procedure); ;
 scm_c_define_gsubr (s_scm_accessor_method_slot_definition, 1, 0, 0, (SCM (*)()) scm_accessor_method_slot_definition); ;
 scm_c_define_gsubr (s_scm_sys_tag_body, 1, 0, 0, (SCM (*)()) scm_sys_tag_body); ;
 scm_c_define_gsubr (s_scm_make_unbound, 0, 0, 0, (SCM (*)()) scm_make_unbound); ;
 scm_c_define_gsubr (s_scm_unbound_p, 1, 0, 0, (SCM (*)()) scm_unbound_p); ;
 scm_c_define_gsubr (s_scm_assert_bound, 2, 0, 0, (SCM (*)()) scm_assert_bound); ;
 scm_c_define_gsubr (s_scm_at_assert_bound_ref, 2, 0, 0, (SCM (*)()) scm_at_assert_bound_ref); ;
 scm_c_define_gsubr (s_scm_sys_fast_slot_ref, 2, 0, 0, (SCM (*)()) scm_sys_fast_slot_ref); ;
 scm_c_define_gsubr (s_scm_sys_fast_slot_set_x, 3, 0, 0, (SCM (*)()) scm_sys_fast_slot_set_x); ;
 scm_make_synt (s_atslot_ref, scm_i_makbimacro, scm_m_atslot_ref) ;
 scm_make_synt (s_atslot_set_x, scm_i_makbimacro, scm_m_atslot_set_x) ;
 scm_c_define_gsubr (s_scm_slot_ref_using_class, 3, 0, 0, (SCM (*)()) scm_slot_ref_using_class); ;
 scm_c_define_gsubr (s_scm_slot_set_using_class_x, 4, 0, 0, (SCM (*)()) scm_slot_set_using_class_x); ;
 scm_c_define_gsubr (s_scm_slot_bound_using_class_p, 3, 0, 0, (SCM (*)()) scm_slot_bound_using_class_p); ;
 scm_c_define_gsubr (s_scm_slot_exists_using_class_p, 3, 0, 0, (SCM (*)()) scm_slot_exists_using_class_p); ;
 scm_c_define_gsubr (s_scm_slot_ref, 2, 0, 0, (SCM (*)()) scm_slot_ref); ;
 scm_c_define_gsubr (s_scm_slot_set_x, 3, 0, 0, (SCM (*)()) scm_slot_set_x); ;
 scm_c_define_gsubr (s_scm_slot_bound_p, 2, 0, 0, (SCM (*)()) scm_slot_bound_p); ;
 scm_c_define_gsubr (s_scm_slot_exists_p, 2, 0, 0, (SCM (*)()) scm_slot_exists_p); ;
 scm_c_define_gsubr (s_scm_sys_allocate_instance, 2, 0, 0, (SCM (*)()) scm_sys_allocate_instance); ;
 scm_c_define_gsubr (s_scm_sys_set_object_setter_x, 2, 0, 0, (SCM (*)()) scm_sys_set_object_setter_x); ;
 scm_c_define_gsubr (s_scm_sys_modify_instance, 2, 0, 0, (SCM (*)()) scm_sys_modify_instance); ;
 scm_c_define_gsubr (s_scm_sys_modify_class, 2, 0, 0, (SCM (*)()) scm_sys_modify_class); ;
 scm_c_define_gsubr (s_scm_sys_invalidate_class, 1, 0, 0, (SCM (*)()) scm_sys_invalidate_class); ;
 scm_sym_change_class = scm_permanent_object (scm_from_locale_symbol ("change-class")) ;
 k_name = scm_permanent_object (scm_from_locale_keyword ("name")) ;
 sym_no_method = scm_permanent_object (scm_from_locale_symbol ("no-method")) ;
 scm_sym_args = scm_permanent_object (scm_from_locale_symbol ("args")) ;
 scm_c_define_gsubr (s_scm_sys_invalidate_method_cache_x, 1, 0, 0, (SCM (*)()) scm_sys_invalidate_method_cache_x); ;
 scm_c_define_gsubr (s_scm_generic_capability_p, 1, 0, 0, (SCM (*)()) scm_generic_capability_p); ;
 scm_c_define_gsubr (s_scm_enable_primitive_generic_x, 0, 0, 1, (SCM (*)()) scm_enable_primitive_generic_x); ;
 scm_c_define_gsubr (s_scm_primitive_generic_generic, 1, 0, 0, (SCM (*)()) scm_primitive_generic_generic); ;
 scm_var_make_extended_generic = scm_permanent_object (scm_c_define ("make-extended-generic", ((SCM) ((((0)) << 8) + scm_tc8_flag)))); ;
 sym_compute_applicable_methods = scm_permanent_object (scm_from_locale_symbol ("compute-applicable-methods")) ;
 var_compute_applicable_methods = scm_permanent_object (scm_c_define ("compute-applicable-methods", scm_c_define_gsubr (s_sys_compute_applicable_methods, 2, 0, 0, scm_sys_compute_applicable_methods))); ;
 k_setter = scm_permanent_object (scm_from_locale_keyword ("setter")) ;
 k_specializers = scm_permanent_object (scm_from_locale_keyword ("specializers")) ;
 k_procedure = scm_permanent_object (scm_from_locale_keyword ("procedure")) ;
 k_dsupers = scm_permanent_object (scm_from_locale_keyword ("dsupers")) ;
 k_slots = scm_permanent_object (scm_from_locale_keyword ("slots")) ;
 k_gf = scm_permanent_object (scm_from_locale_keyword ("generic-function")) ;
 scm_c_define_gsubr (s_scm_make, 0, 0, 1, (SCM (*)()) scm_make); ;
 scm_c_define_gsubr (s_scm_find_method, 0, 0, 1, (SCM (*)()) scm_find_method); ;
 scm_c_define_gsubr (s_scm_sys_method_more_specific_p, 3, 0, 0, (SCM (*)()) scm_sys_method_more_specific_p); ;
 k_slot_definition = scm_permanent_object (scm_from_locale_keyword ("slot-definition")) ;
 sym_o = scm_permanent_object (scm_from_locale_symbol ("o")) ;
 sym_x = scm_permanent_object (scm_from_locale_symbol ("x")) ;
 k_accessor = scm_permanent_object (scm_from_locale_keyword ("accessor")) ;
 k_getter = scm_permanent_object (scm_from_locale_keyword ("getter")) ;
 sym_internal_add_method_x = scm_permanent_object (scm_from_locale_symbol ("internal-add-method!")) ;
 scm_c_define_gsubr (s_scm_sys_goops_loaded, 0, 0, 0, (SCM (*)()) scm_sys_goops_loaded); ;
