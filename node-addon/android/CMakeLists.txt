
cmake_minimum_required(VERSION 3.10.2)


function(dump_all_variables)
	get_cmake_property(_variableNames VARIABLES)
	list (SORT _variableNames)
	foreach (_variableName ${_variableNames})
		message(WARNING "${_variableName}=${${_variableName}}")
	endforeach()
endfunction()


project(lilypond-node-addon-android)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-std=c++17")
set(LILYPOND_DIR ${PROJECT_SOURCE_DIR}/../..)
set(SDK_DIR $ENV{HOME}/sdk)


#[[include(${LILYPOND_DIR}/cmake/lilypond.cmake)

target_compile_definitions(
	lilypond

	PRIVATE __x86_64__
)

target_include_directories(
	lilypond

	#PUBLIC /usr/include
	PUBLIC ${SDK_DIR}/gmp-Rupan/${ANDROID_ABI}
)]]


file(GLOB ADDON_SOURCE_FILES ${CMAKE_HOME_DIRECTORY}/../source/*.cc)

add_library(
	${PROJECT_NAME}

	SHARED

	${ADDON_SOURCE_FILES}
)

target_include_directories(
	${PROJECT_NAME}

	PRIVATE "${SDK_DIR}/nodejs-mobile/src"
	PRIVATE "${SDK_DIR}/nodejs-mobile/deps/v8/include"
	PRIVATE "${SDK_DIR}/nodejs-mobile/deps/uv/include"
	PRIVATE "${SDK_DIR}/nan"
	PRIVATE ${LILYPOND_DIR}/node-addon/include
)


# node
add_library(
	node
	SHARED
	IMPORTED
)

set_target_properties(
	node
	PROPERTIES IMPORTED_LOCATION
	${SDK_DIR}/nodejs-mobile/out_android/${ANDROID_ABI}/libnode.so
)


# android log
find_library(
	log-lib
	log
)


target_link_libraries(
	${PROJECT_NAME}

	#PRIVATE lilypond
	#PRIVATE stdc++fs
	PRIVATE node
	#PRIVATE ${log-lib}
)


set_target_properties(
	${PROJECT_NAME}
	PROPERTIES

	LINKER_LANGUAGE CXX

	# Nodejs native addaon bianry file name format
	#PREFIX ""
	#OUTPUT_NAME "lilypond"
	#SUFFIX ".node"
)


#[[add_custom_command(
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
)]]
