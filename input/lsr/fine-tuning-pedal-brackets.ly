%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.57"

\header {
  lsrtags = "keyboards, tweaks-and-overrides"

  texidoc = "
For fine-tuning the appearance of a pedal bracket, the properties
@code{edge-width}, @code{edge-height}, and @code{shorten-pair} of
@code{PianoPedalBracket} objects can be modified.  For example, the
bracket may be extended to the right edge of the note head: 

"
  doctitle = "Fine-tuning pedal brackets"
} % begin verbatim
\relative c'' {
  \override Staff.PianoPedalBracket #'shorten-pair = #'(0 . -1.0)
  c4\sostenutoOn d e c,
  f4 g a2\sostenutoOff
}
