
include(${LIBS_DIR}/harfbuzz/harfbuzz.cmake)
include(${LIBS_DIR}/fribidi/fribidi.cmake)



file(GLOB_RECURSE PANGO_SOURCE_FILES ${LIBS_DIR}/pango/src/*.c)


add_library(
	pango

	SHARED

	${PANGO_SOURCE_FILES}
)


set_target_properties(
	pango
	PROPERTIES

	LINKER_LANGUAGE C
)


target_compile_definitions(
	pango

	PRIVATE G_LOG_DOMAIN="Pango"
	PRIVATE PANGO_COMPILATION
	PRIVATE PANGO_ENABLE_BACKEND
	PRIVATE PANGO_ENABLE_ENGINE
	PRIVATE SYSCONFDIR="(sysconfdir)"
	PRIVATE LIBDIR="(libdir)"
)


target_include_directories(
	pango

	PUBLIC ${LIBS_DIR}/pango/include
	PRIVATE ${LIBS_DIR}/pango/include/pango
	PUBLIC ${LIBS_DIR}/pango/${ANDROID_ABI}
	PRIVATE ${LIBS_DIR}/glib-2/src
	PRIVATE ${LIBS_DIR}/../${ANDROID_ABI}/glib-2.0/include
	PRIVATE ${LIBS_DIR}/freetype/include
	PRIVATE ${LIBS_DIR}/harfbuzz/include
	PRIVATE ${LIBS_DIR}/fribidi/include
	PRIVATE ${LIBS_DIR}/fontconfig/include

	# temp
	PRIVATE ${LIBS_DIR}/../include
)


target_link_libraries(
	pango

	PRIVATE harfbuzz
	PRIVATE gobject
	PRIVATE glib
	PRIVATE freetype2
	PRIVATE fontconfig
	PRIVATE fribidi
)
