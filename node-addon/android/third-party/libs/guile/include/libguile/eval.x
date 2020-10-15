/* cpp arguments: eval.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 syntax_error_key = scm_permanent_object (scm_from_locale_symbol ("syntax-error")) ;
 sym_three_question_marks = scm_permanent_object (scm_from_locale_symbol ("???")) ;
 scm_make_synt (s_and, scm_i_makbimacro, scm_m_and) ;
 scm_sym_and = scm_permanent_object (scm_from_locale_symbol (s_and)) ;
 scm_make_synt (s_begin, scm_i_makbimacro, scm_m_begin) ;
 scm_sym_begin = scm_permanent_object (scm_from_locale_symbol (s_begin)) ;
 scm_make_synt (s_case, scm_i_makbimacro, scm_m_case) ;
 scm_sym_case = scm_permanent_object (scm_from_locale_symbol (s_case)) ;
 scm_sym_else = scm_permanent_object (scm_from_locale_symbol ("else")) ;
 scm_make_synt (s_cond, scm_i_makbimacro, scm_m_cond) ;
 scm_sym_cond = scm_permanent_object (scm_from_locale_symbol (s_cond)) ;
 scm_sym_arrow = scm_permanent_object (scm_from_locale_symbol ("=>")) ;
 scm_make_synt (s_define, scm_i_makbimacro, scm_m_define) ;
 scm_sym_define = scm_permanent_object (scm_from_locale_symbol (s_define)) ;
 scm_make_synt (s_delay, scm_i_makbimacro, scm_m_delay) ;
 scm_sym_delay = scm_permanent_object (scm_from_locale_symbol (s_delay)) ;
 scm_make_synt (s_do, scm_i_makbimacro, scm_m_do) ;
 scm_sym_do = scm_permanent_object (scm_from_locale_symbol (s_do)) ;
 scm_make_synt (s_if, scm_i_makbimacro, scm_m_if) ;
 scm_sym_if = scm_permanent_object (scm_from_locale_symbol (s_if)) ;
 scm_make_synt (s_lambda, scm_i_makbimacro, scm_m_lambda) ;
 scm_sym_lambda = scm_permanent_object (scm_from_locale_symbol (s_lambda)) ;
 scm_make_synt (s_let, scm_i_makbimacro, scm_m_let) ;
 scm_sym_let = scm_permanent_object (scm_from_locale_symbol (s_let)) ;
 scm_make_synt (s_letrec, scm_i_makbimacro, scm_m_letrec) ;
 scm_sym_letrec = scm_permanent_object (scm_from_locale_symbol (s_letrec)) ;
 scm_make_synt (s_letstar, scm_i_makbimacro, scm_m_letstar) ;
 scm_sym_letstar = scm_permanent_object (scm_from_locale_symbol (s_letstar)) ;
 scm_make_synt (s_or, scm_i_makbimacro, scm_m_or) ;
 scm_sym_or = scm_permanent_object (scm_from_locale_symbol (s_or)) ;
 scm_make_synt (s_quasiquote, scm_makacro, scm_m_quasiquote) ;
 scm_sym_quasiquote = scm_permanent_object (scm_from_locale_symbol (s_quasiquote)) ;
 scm_sym_unquote = scm_permanent_object (scm_from_locale_symbol ("unquote")) ;
 scm_sym_uq_splicing = scm_permanent_object (scm_from_locale_symbol ("unquote-splicing")) ;
 scm_make_synt (s_quote, scm_i_makbimacro, scm_m_quote) ;
 scm_sym_quote = scm_permanent_object (scm_from_locale_symbol (s_quote)) ;
 scm_sym_set_x = scm_permanent_object (scm_from_locale_symbol (s_set_x)) ;
 scm_make_synt (s_atapply, scm_i_makbimacro, scm_m_apply) ;
 scm_sym_atapply = scm_permanent_object (scm_from_locale_symbol (s_atapply)) ;
 scm_sym_apply = scm_permanent_object (scm_from_locale_symbol (s_atapply + 1)) ;
 scm_make_synt (s_atbind, scm_i_makbimacro, scm_m_atbind) ;
 scm_make_synt (s_atcall_cc, scm_i_makbimacro, scm_m_cont) ;
 scm_sym_atcall_cc = scm_permanent_object (scm_from_locale_symbol (s_atcall_cc)) ;
 scm_make_synt (s_at_call_with_values, scm_i_makbimacro, scm_m_at_call_with_values) ;
 scm_sym_at_call_with_values = scm_permanent_object (scm_from_locale_symbol (s_at_call_with_values)) ;
 scm_make_synt (s_gset_x, scm_i_makbimacro, scm_m_generalized_set_x) ;
 scm_sym_setter = scm_permanent_object (scm_from_locale_symbol ("setter")) ;
 sym_atslot_ref = scm_permanent_object (scm_from_locale_symbol ("@slot-ref")) ;
 sym_atslot_set_x = scm_permanent_object (scm_from_locale_symbol ("@slot-set!")) ;
 scm_make_synt (s_nil_cond, scm_i_makbimacro, scm_m_nil_cond) ;
 scm_make_synt (s_atfop, scm_i_makbimacro, scm_m_atfop) ;
 scm_make_synt (s_undefine, scm_makacro, scm_m_undefine) ;
 scm_sym_enter_frame = scm_permanent_object (scm_from_locale_symbol ("enter-frame")) ;
 scm_sym_apply_frame = scm_permanent_object (scm_from_locale_symbol ("apply-frame")) ;
 scm_sym_exit_frame = scm_permanent_object (scm_from_locale_symbol ("exit-frame")) ;
 scm_sym_trace = scm_permanent_object (scm_from_locale_symbol ("trace")) ;
 sym_instead = scm_permanent_object (scm_from_locale_symbol ("instead")) ;
 scm_unbound_variable_key = scm_permanent_object (scm_from_locale_symbol ("unbound-variable")) ;
 scm_c_define_gsubr (s_scm_nconc2last, 1, 0, 0, (SCM (*)()) scm_nconc2last); ;
 g_map = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_map, 2, 0, 1, (SCM (*)()) scm_map, &g_map) ;
 g_for_each = ((SCM) (0)); scm_c_define_gsubr_with_generic (s_for_each, 2, 0, 1, (SCM (*)()) scm_for_each, &g_for_each) ;
 scm_c_define_gsubr (s_scm_force, 1, 0, 0, (SCM (*)()) scm_force); ;
 scm_c_define_gsubr (s_scm_promise_p, 1, 0, 0, (SCM (*)()) scm_promise_p); ;
 scm_c_define_gsubr (s_scm_cons_source, 3, 0, 0, (SCM (*)()) scm_cons_source); ;
 scm_c_define_gsubr (s_scm_copy_tree, 1, 0, 0, (SCM (*)()) scm_copy_tree); ;
 scm_c_define_gsubr (s_scm_primitive_eval, 1, 0, 0, (SCM (*)()) scm_primitive_eval); ;
 scm_c_define_gsubr (s_scm_eval, 2, 0, 0, (SCM (*)()) scm_eval); ;
 scm_c_define_gsubr (s_scm_eval_options_interface, 0, 1, 0, (SCM (*)()) scm_eval_options_interface); ;
 scm_c_define_gsubr (s_scm_evaluator_traps, 0, 1, 0, (SCM (*)()) scm_evaluator_traps); ;
