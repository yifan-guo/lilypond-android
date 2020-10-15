/* cpp arguments: gc.c -DHAVE_CONFIG_H -I.. -I.. -I.. -Wno-error -Wall -Wmissing-prototypes -Werror */
 sym_cells_allocated = scm_permanent_object (scm_from_locale_symbol ("cells-allocated")) ;
 sym_heap_size = scm_permanent_object (scm_from_locale_symbol ("cell-heap-size")) ;
 sym_mallocated = scm_permanent_object (scm_from_locale_symbol ("bytes-malloced")) ;
 sym_mtrigger = scm_permanent_object (scm_from_locale_symbol ("gc-malloc-threshold")) ;
 sym_heap_segments = scm_permanent_object (scm_from_locale_symbol ("cell-heap-segments")) ;
 sym_gc_time_taken = scm_permanent_object (scm_from_locale_symbol ("gc-time-taken")) ;
 sym_gc_mark_time_taken = scm_permanent_object (scm_from_locale_symbol ("gc-mark-time-taken")) ;
 sym_times = scm_permanent_object (scm_from_locale_symbol ("gc-times")) ;
 sym_cells_marked = scm_permanent_object (scm_from_locale_symbol ("cells-marked")) ;
 sym_cells_swept = scm_permanent_object (scm_from_locale_symbol ("cells-swept")) ;
 sym_malloc_yield = scm_permanent_object (scm_from_locale_symbol ("malloc-yield")) ;
 sym_cell_yield = scm_permanent_object (scm_from_locale_symbol ("cell-yield")) ;
 sym_protected_objects = scm_permanent_object (scm_from_locale_symbol ("protected-objects")) ;
 sym_total_cells_allocated = scm_permanent_object (scm_from_locale_symbol ("total-cells-allocated")) ;
 scm_c_define_gsubr (s_scm_gc_live_object_stats, 0, 0, 0, (SCM (*)()) scm_gc_live_object_stats); ;
 scm_c_define_gsubr (s_scm_gc_stats, 0, 0, 0, (SCM (*)()) scm_gc_stats); ;
 scm_c_define_gsubr (s_scm_object_address, 1, 0, 0, (SCM (*)()) scm_object_address); ;
 scm_c_define_gsubr (s_scm_gc, 0, 0, 0, (SCM (*)()) scm_gc); ;
