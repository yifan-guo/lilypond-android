
cmake_minimum_required(VERSION 3.4.1)


set(SDK_DIR $ENV{HOME}/sdk)


add_library(
	native-lib
	SHARED

	src/main/cpp/native-lib.cpp
)

include_directories(
	${SDK_DIR}/nodejs-mobile/src
	${SDK_DIR}/nodejs-mobile/deps/v8/include
	${SDK_DIR}/nodejs-mobile/deps/uv/include
)

add_library(
	libnode
	SHARED
	IMPORTED
)

set_target_properties(
	libnode

	PROPERTIES

	IMPORTED_LOCATION ${SDK_DIR}/nodejs-mobile/out_android/${ANDROID_ABI}/libnode.so
)

find_library(
	log-lib

	log
)

target_link_libraries(
	native-lib

	libnode
	${log-lib}
)
