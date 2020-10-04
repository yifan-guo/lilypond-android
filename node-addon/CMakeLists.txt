
cmake_minimum_required(VERSION 3.17)


# dump variables
#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#	message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()


project(lilypond-node-addon)

set(CMAKE_CXX_STANDARD 17)
set(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/..)

include(${LILYPOND_DIR}/cmake/lilypond.cmake)


file(GLOB ADDON_SOURCE_FILES ${CMAKE_HOME_DIRECTORY}/source/*.cc)

add_library(
	${PROJECT_NAME}

	SHARED

	${ADDON_SOURCE_FILES}
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

	PRIVATE lilypond
)


# Nodejs native addaon bianry file name format
set_target_properties(
	${PROJECT_NAME}

	PROPERTIES PREFIX ""
	OUTPUT_NAME "lilypond"
	SUFFIX ".node"
)


add_custom_command(
	TARGET ${PROJECT_NAME}
	POST_BUILD 
	COMMAND "${CMAKE_COMMAND}" -E copy 
		${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lilypond.node
		${CMAKE_HOME_DIRECTORY}/output/
	COMMAND "${CMAKE_COMMAND}" -E copy 
		${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/*.so
		${CMAKE_HOME_DIRECTORY}/output/
	COMMENT "Copying to output directory."
)
