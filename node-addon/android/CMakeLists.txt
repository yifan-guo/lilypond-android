
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
set(LIBS_DIR ${PROJECT_SOURCE_DIR}/third-party/libs)
set(SDK_DIR $ENV{HOME}/sdk)

# for android emulator
set(TARGET_ABI x86)

# for physical android device
#set(TARGET_ABI arm64-v8a)

set(ABI_64BITS	arm64-v8a x86_64)
set(ABI_32BITS	armeabi-v7a x86)
set(ABI_ARM		arm64-v8a armeabi-v7a)
set(ABI_X86		x86 x86_64)


# third party libraries
include(${LIBS_DIR}/glib-2/glib.cmake)
include(${LIBS_DIR}/freetype/freetype.cmake)
include(${LIBS_DIR}/fontconfig/fontconfig.cmake)
include(${LIBS_DIR}/pango/pango.cmake)
include(${LIBS_DIR}/guile/guile.cmake)

# lilypond main module
include(${LILYPOND_DIR}/cmake/lilypond.cmake)



#[[if(${ANDROID_ABI} IN_LIST ABI_64BITS)
	target_compile_definitions(
		lilypond

		PRIVATE __x86_64__
	)
endif()]]

target_include_directories(
	lilypond

	PRIVATE ${CMAKE_HOME_DIRECTORY}/lily
	PUBLIC ${CMAKE_HOME_DIRECTORY}/third-party/include
	PRIVATE ${CMAKE_HOME_DIRECTORY}/third-party/libs/glib-2/src
	PRIVATE ${CMAKE_HOME_DIRECTORY}/third-party/libs/pango/include
)

target_link_libraries(
	lilypond

	PRIVATE guile
	PRIVATE fontconfig
	PRIVATE pango
	PRIVATE freetype2
	PRIVATE glib
	PRIVATE gobject
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

	PRIVATE lilypond
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
