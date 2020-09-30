
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
	${NODEADDON_SOURCE_FILES}
	${BISON_MyParser_OUTPUTS}
	${FLEX_MyScanner_OUTPUTS}
)


target_include_directories(
	lilypond

	PUBLIC ${LILYPOND_DIR}/build
	PUBLIC ${LILYPOND_DIR}/build/lily/out
	PUBLIC ${LILYPOND_DIR}/lily/include
	PUBLIC ${LILYPOND_DIR}/flower/include
	PUBLIC ${LILYPOND_DIR}/node-addon/include
	PUBLIC /usr/include/guile/2.2
	PUBLIC /usr/include/freetype2
	PUBLIC /usr/include/pango-1.0
	PUBLIC /usr/include/glib-2.0
	PUBLIC /usr/lib/x86_64-linux-gnu/glib-2.0/include
)


target_link_libraries(
	lilypond

	PUBLIC guile
)
