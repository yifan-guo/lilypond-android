\version "2.20.0"

\include "dots.ly"



\score {
	\new Staff <<
		\relative c' {
			c2 g
		}

		\new Lyrics \lyricmode {
			\dotWB
		}
	>>
}
