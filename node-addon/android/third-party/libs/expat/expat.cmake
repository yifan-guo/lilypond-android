
file(GLOB_RECURSE EXPAT_SOURCE_FILES ${LIBS_DIR}/expat/src/*.c)


add_library(
	expat

	SHARED

	${EXPAT_SOURCE_FILES}
)


target_compile_definitions(
	expat

	PRIVATE HAVE_CONFIG_H
	PRAVATE HAVE_SYSCALL_GETRANDOM
)


target_include_directories(
	expat

	PUBLIC ${LIBS_DIR}/expat/include
	#PUBLIC ${LIBS_DIR}/expat/${ANDROID_ABI}
)
