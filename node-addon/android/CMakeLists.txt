
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

# for android emulator
set(TARGET_ABI x86)

# for physical android device
#set(TARGET_ABI arm64-v8a)

set(ABI_64BITS arm64-v8a x86_64)
set(ABI_32BITS armeabi-v7a x86)


#dump_all_variables()
include(${LILYPOND_DIR}/cmake/lilypond.cmake)

if(${ANDROID_ABI} IN_LIST ABI_64BITS)
	target_compile_definitions(
		lilypond

		PRIVATE __x86_64__
	)
endif()

if(${ANDROID_ABI} STREQUAL "x86_64")
	import_lib(guile /usr/local/lib/libguile.so.17)
	import_lib(fontconfig /usr/lib/x86_64-linux-gnu/libfontconfig.so.1)
endif()

import_lib(pangoft2 ${CMAKE_HOME_DIRECTORY}/third-party/${ANDROID_ABI}/pango/libpangoft2-1.0.so.0)
import_lib(pango ${CMAKE_HOME_DIRECTORY}/third-party/${ANDROID_ABI}/pango/libpango-1.0.so.0)

target_include_directories(
	lilypond

	PRIVATE ${CMAKE_HOME_DIRECTORY}/lily
	PUBLIC ${CMAKE_HOME_DIRECTORY}/third-party/include
	PRIVATE ${CMAKE_HOME_DIRECTORY}/third-party/libs/gmp/${ANDROID_ABI}
	PRIVATE ${CMAKE_HOME_DIRECTORY}/third-party/${ANDROID_ABI}/glib-2.0/include

	#PRIVATE /usr/include/pango-1.0
	PRIVATE /usr/include/guile/1.8
	PRIVATE /usr/include/freetype2
	PRIVATE /usr/include/glib-2.0
)

target_link_libraries(
	lilypond

	PRIVATE guile
	PRIVATE fontconfig
	#PRIVATE pangoft2
	PRIVATE pango
)


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


target_link_libraries(
	${PROJECT_NAME}

	#PRIVATE lilypond
	#PRIVATE stdc++fs
	PRIVATE node
)


set_target_properties(
	${PROJECT_NAME}
	PROPERTIES

	LINKER_LANGUAGE CXX
)


# copy target library files
if (${ANDROID_ABI} STREQUAL ${TARGET_ABI})
	#message (WARNING "copy: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lib${PROJECT_NAME}.so, ${CMAKE_HOME_DIRECTORY}/app/app/src/main/assets/lilypond-server/lilypond.node")
	add_custom_command(
		TARGET ${PROJECT_NAME}
		POST_BUILD
		COMMAND "${CMAKE_COMMAND}" -E copy 
			${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lib${PROJECT_NAME}.so
			${CMAKE_HOME_DIRECTORY}/app/app/src/main/assets/lilypond-server/lilypond.node
		COMMENT "Copying to app assets directory."
	)
endif ()
