\version "2.1.36"

\header {
texidoc = "The staff is a grob (graphical object) which may be adjusted as well, for example, to have 6 thick lines and a slightly large @code{staff-space}.
However, beams remain correctly quantized."    

}


mus = \notes \relative c' { c4 g' d'8 d d d }

\score {
  \notes <<
    \new Staff {
	\override Staff.StaffSymbol  #'thickness = #2.0
	\override Staff.StaffSymbol  #'line-count = #6
	\override Staff.StaffSymbol  #'staff-space = #1.1
	\mus
    }
    \mus
  >>
  \paper  {
    raggedright = ##t
  }
}

