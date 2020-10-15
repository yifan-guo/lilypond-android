/* cpp arguments: fluids.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_c_define_gsubr (s_scm_make_fluid, 0, 0, 0, (SCM (*)()) scm_make_fluid); ;
 scm_c_define_gsubr (s_scm_fluid_p, 1, 0, 0, (SCM (*)()) scm_fluid_p); ;
 scm_c_define_gsubr (s_scm_fluid_ref, 1, 0, 0, (SCM (*)()) scm_fluid_ref); ;
 scm_c_define_gsubr (s_scm_fluid_set_x, 2, 0, 0, (SCM (*)()) scm_fluid_set_x); ;
 scm_c_define_gsubr (s_scm_with_fluids, 3, 0, 0, (SCM (*)()) scm_with_fluids); ;
 scm_c_define_gsubr (s_scm_with_fluid, 3, 0, 0, (SCM (*)()) scm_with_fluid); ;
 scm_c_define_gsubr (s_scm_make_dynamic_state, 0, 1, 0, (SCM (*)()) scm_make_dynamic_state); ;
 scm_c_define_gsubr (s_scm_dynamic_state_p, 1, 0, 0, (SCM (*)()) scm_dynamic_state_p); ;
 scm_c_define_gsubr (s_scm_current_dynamic_state, 0, 0, 0, (SCM (*)()) scm_current_dynamic_state); ;
 scm_c_define_gsubr (s_scm_set_current_dynamic_state, 1, 0, 0, (SCM (*)()) scm_set_current_dynamic_state); ;
 scm_c_define_gsubr (s_scm_with_dynamic_state, 2, 0, 0, (SCM (*)()) scm_with_dynamic_state); ;
