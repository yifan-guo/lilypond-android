
cmake_minimum_required(VERSION 3.17)

project(lilypond)

SET(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/..)
#include(${LILYPOND_DIR}/cmake/lilypond.cmake)

add_library(
	${PROJECT_NAME}
	SHARED

	binding.cc
)

include_directories(
	"~/sdk/nodejs-mobile/src"
	"~/sdk/nodejs-mobile/deps/v8/include"
	"~/sdk/nodejs-mobile/deps/uv/include"
	"~/sdk/nan"
)


# Nodejs native addaon bianry file name format
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".node")
