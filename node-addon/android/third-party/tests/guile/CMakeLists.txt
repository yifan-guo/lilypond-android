
cmake_minimum_required(VERSION 3.10)


project(guile-cli)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-std=c++17")
set(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/../../../../..)
set(LIBS_DIR ${PROJECT_SOURCE_DIR}/../../libs)
set(ANDROID_ABI x86_64)

include(${LILYPOND_DIR}/cmake/dependencies.cmake)
include(${LIBS_DIR}/guile/guile.cmake)



target_include_directories(
	guile

	PRIVATE /usr/include/x86_64-linux-gnu
)

import_lib(gmp	/usr/lib/x86_64-linux-gnu/libgmp.so)


add_executable (
	guile-cli

	${PROJECT_SOURCE_DIR}/guile.c
)

target_include_directories(
	guile-cli

	PRIVATE ${LIBS_DIR}/guile/include
	PRIVATE ${LIBS_DIR}/guile/x86_64
)

find_package (Threads)

target_link_libraries(
	guile-cli

	PRIVATE guile
	PRIVATE ${CMAKE_THREAD_LIBS_INIT}
	PRIVATE m
)
