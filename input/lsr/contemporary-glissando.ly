%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.35"

\header {
  lsrtags = "expressive-marks"
 texidoc = "
Use a glissando without final note. Contemporary glissando !
" }
% begin verbatim
\relative c'' {
    \override Glissando #'style = #'zigzag
     \time 3/4
     c4 c
	 \cadenzaOn  c\glissando \hideNotes c,, \unHideNotes \cadenzaOff
	 \bar "|"
	 }

\addlyrics { Use cadenzaOn glissando hideNotes }
\addlyrics { unHideNotes cadenzaOff, skip_and_\bar \skip 4  }
\layout{raggedright = ##t}
\header { tagline="" }
% begin verbatim
