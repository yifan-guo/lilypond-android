%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.38"

\header {
  lsrtags = "pitches, editorial-and-educational-use"
 texidoc = "
The shapeNoteStyles property gives you the ability to define various
note heads styles for each step of the scale (as defined by the key
signature or the \"tonic\" property).

This property requires a set of symbols, which can be purely arbitrary
(geometrical expressions such as triangle, cross, xcircle etc. are
allowed) or based on old American engraving tradition (you can use some
latin note names as well). 

That said, if you're trying to imitate old American song books, you may
also want to try LilyPond's predefined note heads styles, through
shortcut commands such as \\aikenHeads or \\sacredHarpHeads.

This example shows different ways to obtain shape note heads, and
demonstrates the ability to transpose a melody without losing the
correspondance between harmonic functions and note heads styles.
" }
% begin verbatim
fragment = {
  \key c \major
  c1 d e f g a b c
  \break
}

\score {
  \new Staff {
    \transpose c d 
    \relative {
      \set shapeNoteStyles = ##(do re mi fa #f la ti)
      \fragment \break
    }
    
    \relative {
      \set shapeNoteStyles  = ##(cross triangle fa #f mensural xcircle diamond)
      \fragment
    }
  }
}

