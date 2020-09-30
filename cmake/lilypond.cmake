
file(GLOB SOURCE_FILES ${LILYPOND_DIR}/lily/*.cc)

add_library(
	lilypond

	STATIC

	${SOURCE_FILES}
)


target_include_directories(
	lilypond

	PRIVATE ${LILYPOND_DIR}/build
	PRIVATE ${LILYPOND_DIR}/build/lily/out
	PRIVATE ${LILYPOND_DIR}/lily/include
	PRIVATE ${LILYPOND_DIR}/flower/include
	PRIVATE /usr/include/guile/2.2
	PRIVATE /usr/include/freetype2
	PRIVATE /usr/include/pango-1.0
	PRIVATE /usr/include/glib-2.0
	PRIVATE /usr/lib/x86_64-linux-gnu/glib-2.0/include
)
