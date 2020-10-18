
cmake_minimum_required(VERSION 3.10)


set(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/../../../../..)
set(LIBS_DIR ${PROJECT_SOURCE_DIR}/../../libs)
set(ANDROID_ABI x86_64)

include(${LILYPOND_DIR}/cmake/dependencies.cmake)
include(${LIBS_DIR}/guile/guile.cmake)



add_executable (
	guile-cli

	${PROJECT_SOURCE_DIR}/guile.c
)

target_include_directories(
	guile-cli

	PRIVATE ${LIBS_DIR}/guile/include
	PRIVATE ${LIBS_DIR}/guile/x86_64
)

target_link_libraries(
	guile-cli

	PRIVATE guile
)
