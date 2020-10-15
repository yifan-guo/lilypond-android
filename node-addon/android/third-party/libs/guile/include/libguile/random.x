/* cpp arguments: random.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 scm_var_random_state = scm_permanent_object (scm_c_define ("*random-state*", scm_seed_to_random_state (scm_from_locale_string ("URL:http://stat.fsu.edu/~geo/diehard.html")))); ;
 scm_c_define_gsubr (s_scm_random, 1, 1, 0, (SCM (*)()) scm_random); ;
 scm_c_define_gsubr (s_scm_copy_random_state, 0, 1, 0, (SCM (*)()) scm_copy_random_state); ;
 scm_c_define_gsubr (s_scm_seed_to_random_state, 1, 0, 0, (SCM (*)()) scm_seed_to_random_state); ;
 scm_c_define_gsubr (s_scm_random_uniform, 0, 1, 0, (SCM (*)()) scm_random_uniform); ;
 scm_c_define_gsubr (s_scm_random_normal, 0, 1, 0, (SCM (*)()) scm_random_normal); ;
 scm_c_define_gsubr (s_scm_random_solid_sphere_x, 1, 1, 0, (SCM (*)()) scm_random_solid_sphere_x); ;
 scm_c_define_gsubr (s_scm_random_hollow_sphere_x, 1, 1, 0, (SCM (*)()) scm_random_hollow_sphere_x); ;
 scm_c_define_gsubr (s_scm_random_normal_vector_x, 1, 1, 0, (SCM (*)()) scm_random_normal_vector_x); ;
 scm_c_define_gsubr (s_scm_random_exp, 0, 1, 0, (SCM (*)()) scm_random_exp); ;
