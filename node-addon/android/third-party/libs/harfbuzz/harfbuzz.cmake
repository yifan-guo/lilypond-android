
#file(GLOB_RECURSE HARFBUZZ_SOURCE_FILES ${LIBS_DIR}/harfbuzz/src/*.cc)


add_library(
	harfbuzz

	SHARED

	#${HARFBUZZ_SOURCE_FILES}
	${LIBS_DIR}/harfbuzz/src/harfbuzz.cc
)


set_target_properties(
	harfbuzz
	PROPERTIES

	LINKER_LANGUAGE CXX
)


target_compile_definitions(
	harfbuzz

	PRIVATE HAVE_CONFIG_H
)


target_include_directories(
	harfbuzz

	PUBLIC ${LIBS_DIR}/harfbuzz/include
	PUBLIC ${LIBS_DIR}/harfbuzz/${ANDROID_ABI}
	PRIVATE ${LIBS_DIR}/glib-2/src
	PRIVATE ${LIBS_DIR}/../${ANDROID_ABI}/glib-2.0/include
	PRIVATE ${LIBS_DIR}/freetype/include
)


target_link_libraries(
	harfbuzz

	PRIVATE freetype2
	PRIVATE glib
)
