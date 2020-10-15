
file(GLOB_RECURSE HARFBUZZ_SOURCE_FILES ${LIBS_DIR}/harfbuzz/src/*.c)


add_library(
	harfbuzz

	SHARED

	${HARFBUZZ_SOURCE_FILES}
)


set_target_properties(
	harfbuzz
	PROPERTIES

	LINKER_LANGUAGE CXX
)


#[[target_compile_definitions(
	harfbuzz

	PRIVATE FT2_BUILD_LIBRARY
)]]


target_include_directories(
	harfbuzz

	PUBLIC ${LIBS_DIR}/harfbuzz/include
	PUBLIC ${LIBS_DIR}/harfbuzz/${ANDROID_ABI}
)
