
include(${LIBS_DIR}/libffi/libffi.cmake)



file(GLOB_RECURSE GLIB_SOURCE_FILES ${LIBS_DIR}/glib-2/src/glib/*.c)
file(GLOB_RECURSE GOBJECT_SOURCE_FILES ${LIBS_DIR}/glib-2/src/gobject/*.c)
file(GLOB_RECURSE GTHREAD_SOURCE_FILES ${LIBS_DIR}/glib-2/src/gthread/*.c)
#message(WARNING "GLIB_SOURCE_FILES: ${GLIB_SOURCE_FILES}")


add_library(
	glib

	SHARED

	${GLIB_SOURCE_FILES}
)

add_library(
	gobject

	SHARED

	${GOBJECT_SOURCE_FILES}
)

add_library(
	gthread

	SHARED

	${GTHREAD_SOURCE_FILES}
)


set_target_properties(
	glib
	PROPERTIES

	LINKER_LANGUAGE C
)

set_target_properties(
	gobject
	PROPERTIES

	LINKER_LANGUAGE C
)

set_target_properties(
	gthread
	PROPERTIES

	LINKER_LANGUAGE C
)


target_compile_definitions(
	glib

	PRIVATE G_LOG_DOMAIN="GLib"
	PRIVATE G_DISABLE_CAST_CHECKS
	#PRIVATE G_DISABLE_DEPRECATED
	PRIVATE GLIB_COMPILATION

	# pcre
	#PRIVATE G_LOG_DOMAIN="GLib-GRegex"
	PRIVATE HAVE_MEMMOVE
	PRIVATE SUPPORT_UCP
	PRIVATE SUPPORT_UTF
	PRIVATE SUPPORT_UTF8
	PRIVATE NEWLINE=-1
	PRIVATE MATCH_LIMIT=10000000
	PRIVATE MATCH_LIMIT_RECURSION=8192 
	PRIVATE MAX_NAME_SIZE=32
	PRIVATE MAX_NAME_COUNT=10000
	PRIVATE MAX_DUPLENGTH=30000
	PRIVATE LINK_SIZE=2
	PRIVATE POSIX_MALLOC_THRESHOLD=10
	PRIVATE PCRE_STATIC

	PRIVATE GLIB_CHARSETALIAS_DIR=""
)

target_compile_definitions(
	gobject

	PRIVATE G_LOG_DOMAIN="GLib-GObject"
	PRIVATE GOBJECT_COMPILATION
)

target_compile_definitions(
	gthread

	PRIVATE G_LOG_DOMAIN="GThread"
	PRIVATE G_DISABLE_CAST_CHECKS
)


target_include_directories(
	glib

	PUBLIC ${LIBS_DIR}/glib-2/src
	PUBLIC ${LIBS_DIR}/glib-2/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/../${ANDROID_ABI}/glib-2.0/include
	PUBLIC ${LIBS_DIR}/libffi/${ANDROID_ABI}/include
)

target_include_directories(
	gobject

	PUBLIC ${LIBS_DIR}/glib-2/src
	PUBLIC ${LIBS_DIR}/glib-2/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/../${ANDROID_ABI}/glib-2.0/include
)

target_include_directories(
	gthread

	PUBLIC ${LIBS_DIR}/glib-2/src
	PUBLIC ${LIBS_DIR}/glib-2/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/../${ANDROID_ABI}/glib-2.0/include
)


target_link_libraries(
	gobject

	PRIVATE ffi
	PRIVATE glib
)

target_link_libraries(
	gthread

	PRIVATE glib
)
