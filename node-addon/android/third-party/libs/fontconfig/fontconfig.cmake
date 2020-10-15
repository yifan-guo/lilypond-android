
include(${LIBS_DIR}/expat/expat.cmake)



file(GLOB_RECURSE FONTCONFIG_SOURCE_FILES ${LIBS_DIR}/fontconfig/src/*.c)


add_library(
	fontconfig

	SHARED

	${FONTCONFIG_SOURCE_FILES}
)


#[[set_target_properties(
	fontconfig
	PROPERTIES

	LINKER_LANGUAGE c
)]]


target_compile_definitions(
	fontconfig

	PRIVATE HAVE_CONFIG_H
	PRIVATE FC_CACHEDIR="/usr/local/var/cache/fontconfig"
	PRIVATE FONTCONFIG_PATH="/usr/local/etc/fonts"
)


target_include_directories(
	fontconfig

	PUBLIC ${LIBS_DIR}/fontconfig/include
	PUBLIC ${LIBS_DIR}/fontconfig/${ANDROID_ABI}
	PRIVATE ${LIBS_DIR}/freetype/include
)


target_link_libraries(
	fontconfig

	PRIVATE freetype2
	PRIVATE expat
)
