
include(${CMAKE_CURRENT_LIST_DIR}/dependencies.cmake)


file(GLOB SOURCE_FILES ${LILYPOND_DIR}/lily/*.cc)

file(GLOB FLOWER_SOURCE_FILES ${LILYPOND_DIR}/flower/*.cc)
list(FILTER FLOWER_SOURCE_FILES EXCLUDE REGEX test-.*)

file(GLOB NODEADDON_SOURCE_FILES ${LILYPOND_DIR}/node-addon/source/*.cc)


find_package(BISON)
find_package(FLEX)

BISON_TARGET(MyParser ${LILYPOND_DIR}/lily/parser.yy ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp)
FLEX_TARGET(MyScanner ${LILYPOND_DIR}/lily/lexer.ll  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)

ADD_FLEX_BISON_DEPENDENCY(MyScanner MyParser)


add_library(
	lilypond

	SHARED

	${SOURCE_FILES}
	${FLOWER_SOURCE_FILES}
	${BISON_MyParser_OUTPUTS}
	${FLEX_MyScanner_OUTPUTS}
	${NODEADDON_SOURCE_FILES}
)


target_compile_definitions(
	lilypond

	PRIVATE BUILDING_LILYPOND
)


target_include_directories(
	lilypond

	PRIVATE ${LILYPOND_DIR}/build
	PRIVATE ${LILYPOND_DIR}/build/lily/out
	PRIVATE ${LILYPOND_DIR}/lily/include
	PRIVATE ${LILYPOND_DIR}/flower/include
	PUBLIC ${LILYPOND_DIR}/node-addon/include
	PRIVATE /usr/include/guile/2.2
	PRIVATE /usr/include/freetype2
	PRIVATE /usr/include/pango-1.0
	PRIVATE /usr/include/glib-2.0
	PRIVATE /usr/lib/x86_64-linux-gnu/glib-2.0/include
)


target_link_libraries(
	lilypond

	PRIVATE guile
	PRIVATE fontconfig
	PRIVATE pangoft2
)
