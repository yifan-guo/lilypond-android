
add_library(
	ltdl

	STATIC

	${LIBS_DIR}/libltdl/ltdl.c
)


target_compile_definitions(
	ltdl

	PRIVATE HAVE_STDLIB_H
	#PRIVATE HAVE_ARGZ_APPEND=1
	#PRIVATE HAVE_ARGZ_INSERT=1
	#PRIVATE HAVE_ARGZ_CREATE_SEP=1
	PRIVATE LTDL_OBJDIR=""
)


#[[target_include_directories(
	ltdl

)


set_target_properties(
	ltdl
	PROPERTIES

	LINKER_LANGUAGE C
)]]
