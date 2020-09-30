
cmake_minimum_required(VERSION 3.17)

project(lilypond-node-addon)

SET(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/..)

include(${LILYPOND_DIR}/cmake/lilypond.cmake)


add_library(
	${PROJECT_NAME}
	SHARED

	binding.cc
)

target_include_directories(
	${PROJECT_NAME}

	PRIVATE "~/sdk/nodejs-mobile/src"
	PRIVATE "~/sdk/nodejs-mobile/deps/v8/include"
	PRIVATE "~/sdk/nodejs-mobile/deps/uv/include"
	PRIVATE "~/sdk/nan"
)

target_link_libraries(
	${PROJECT_NAME}

	lilypond
)


# Nodejs native addaon bianry file name format
set_target_properties(
	${PROJECT_NAME}

	PROPERTIES PREFIX ""
	OUTPUT_NAME "lilypond"
	SUFFIX ".node"
)
