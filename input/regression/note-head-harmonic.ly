\header
{
    texidoc = "  The handling of stems for harmonic notes must be
   completely identical to normal note heads.

  Harmonic heads do not get  dots. If @code{harmonicAccidentals} is unset, they also don't get accidentals."
}

\version "2.1.36"

\score {
 \notes {
    < c'' f''\harmonic >4
    \stemUp
    < c'' f''\harmonic >4.
    < cis'' fis''\harmonic >8
    \set Staff.harmonicAccidentals = ##f
    < dis'' gis''\harmonic >8
  }

  \paper {
      raggedright = ##t 
  }
}
