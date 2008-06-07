%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.48"

\header {
  lsrtags = "expressive-marks"

  texidoc = "
An arpeggio can be drawn across notes in different voices on the same
staff if the @code{Span_arpeggio_engraver} is moved to the @code{Staff}
context: 

"
  doctitle = "Creating arpeggios across notes in different voices"
} % begin verbatim
\new Staff \with {
  \consists "Span_arpeggio_engraver"
}
\relative c' {
  \set Staff.connectArpeggios = ##t
  <<
    { <e' g>4\arpeggio <d f> <d f>2 } \\
    { <d, f>2\arpeggio <g b>2 }
  >>
}
