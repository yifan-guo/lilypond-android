
file(GLOB_RECURSE FRIBIDI_SOURCE_FILES ${LIBS_DIR}/fribidi/src/*.c)


add_library(
	fribidi

	STATIC

	${FRIBIDI_SOURCE_FILES}
)


target_compile_definitions(
	fribidi

	PRIVATE HAVE_CONFIG_H
)


target_include_directories(
	fribidi

	PRIVATE ${LIBS_DIR}/fribidi/include
	PRIVATE ${LIBS_DIR}/fribidi/${ANDROID_ABI}
)


#[[set_target_properties(
	fribidi
	PROPERTIES

	LINKER_LANGUAGE C
)]]
