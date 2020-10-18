
include(${LIBS_DIR}/libltdl/ltdl.cmake)



file(GLOB_RECURSE GUILE_SOURCE_FILES ${LIBS_DIR}/guile/src/*.c)


add_library(
	guile

	SHARED

	${GUILE_SOURCE_FILES}
)


target_compile_definitions(
	guile

	PRIVATE HAVE_CONFIG_H
	#PRIVATE __GNU_LIBRARY__
)


target_include_directories(
	guile

	PUBLIC ${LIBS_DIR}/guile/include
	PUBLIC ${LIBS_DIR}/guile/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/gmp/${ANDROID_ABI}
	PRIVATE ${LIBS_DIR}/../include
	PRIVATE ${LIBS_DIR}/libltdl
)


#include(${LILYPOND_DIR}/cmake/dependencies.cmake)
#import_lib(gmp	${LIBS_DIR}/gmp/${ANDROID_ABI}/libgmp.so)

target_link_libraries(
	guile

	PRIVATE gmp
	PRIVATE ltdl
)



file(GLOB_RECURSE SRFI_SOURCE_FILES ${LIBS_DIR}/guile/srfi/*.c)


add_library(
	guile-srfi

	SHARED

	${SRFI_SOURCE_FILES}
)


set_target_properties(
	guile-srfi

	PROPERTIES
		OUTPUT_NAME "guile-srfi-srfi-1-v-3"
		#SUFFIX ""
)


target_compile_definitions(
	guile-srfi

	PRIVATE HAVE_CONFIG_H
)


target_include_directories(
	guile-srfi

	PUBLIC ${LIBS_DIR}/guile/include
	PUBLIC ${LIBS_DIR}/guile/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/guile
)

target_link_libraries(
	guile-srfi

	PRIVATE guile
	PRIVATE gmp
)
