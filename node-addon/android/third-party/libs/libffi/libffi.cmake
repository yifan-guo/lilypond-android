
file(GLOB_RECURSE LIBFFI_SOURCE_FILES ${LIBS_DIR}/libffi/src/*.c)
#message(WARNING "LIBFFI_SOURCE_FILES: ${LIBFFI_SOURCE_FILES}")


add_library(
	ffi

	STATIC

	${LIBFFI_SOURCE_FILES}
	#${LIBS_DIR}/libffi/src/x86/sysv.S
)


target_include_directories(
	ffi

	PRIVATE ${LIBS_DIR}/libffi/include
	PUBLIC ${LIBS_DIR}/libffi/${ANDROID_ABI}
	PUBLIC ${LIBS_DIR}/libffi/${ANDROID_ABI}/include
)


set_target_properties(
	ffi
	PROPERTIES

	LINKER_LANGUAGE C
)
