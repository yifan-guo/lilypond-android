
cmake_minimum_required(VERSION 3.17)


function(dump_all_variables)
	get_cmake_property(_variableNames VARIABLES)
	list (SORT _variableNames)
	foreach (_variableName ${_variableNames})
		message(STATUS "${_variableName}=${${_variableName}}")
	endforeach()
endfunction()


project(lilypond-node-addon)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-std=c++17 -lstdc++fs")
set(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/..)

include(${LILYPOND_DIR}/cmake/lilypond.cmake)

target_include_directories(
	lilypond

	PRIVATE /usr/lib/x86_64-linux-gnu/glib-2.0/include
	PRIVATE ${LILYPOND_DIR}/build/lily/out
	PRIVATE /usr/include/guile/1.8
	PRIVATE /usr/include/freetype2
	PRIVATE /usr/include/pango-1.0
	PRIVATE /usr/include/glib-2.0
)

import_lib(guile /usr/local/lib/libguile.so.17)
import_lib(fontconfig /usr/lib/x86_64-linux-gnu/libfontconfig.so.1)
import_lib(pangoft2 /usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0)

target_link_libraries(
	lilypond

	PRIVATE guile
	PRIVATE fontconfig
	PRIVATE pangoft2
)



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
	PRIVATE stdc++fs
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
	COMMAND "${CMAKE_COMMAND}" -E create_symlink
		${LILYPOND_DIR}/build/out/share
		${CMAKE_HOME_DIRECTORY}/output/share
	COMMENT "Copying to output directory."
)
