
\header {

  texidoc = "Setting @code{positions} overrides the automatic
positioning of the slur. It selects the slur configuration closest to
the given pair. "
  
  }
\version "2.5.0"

\paper { raggedright = ##T }
\relative {
  \override Slur #'positions = #'(-4 . -5)
  e( f g)
}

