
file(GLOB_RECURSE FREETYPE_SOURCE_FILES ${LIBS_DIR}/freetype/src/*.c)


add_library(
	freetype2

	SHARED

	${FREETYPE_SOURCE_FILES}
)


set_target_properties(
	freetype2
	PROPERTIES

	LINKER_LANGUAGE C
)


target_compile_definitions(
	freetype2

	PRIVATE FT2_BUILD_LIBRARY
)


target_include_directories(
	freetype2

	PUBLIC ${LIBS_DIR}/freetype/include
)
