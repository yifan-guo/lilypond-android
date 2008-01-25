%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.35"

\header {
  lsrtags = "ancient-notation, tweaks-and-overrides"
 texidoc = "
Custodes may be engraved in various styles.
" }
% begin verbatim
\layout {
  \context {
    \Staff
    \consists Custos_engraver
  }
  ragged-right = ##t
}

{
  \override Staff.Custos  #'neutral-position = #4

  \override Staff.Custos  #'style = #'hufnagel
  c'1^"hufnagel"
  \break < d' a' f''>1

  \override Staff.Custos  #'style = #'medicaea
  c'1^"medicaea"
  \break < d' a' f''>1

  \override Staff.Custos  #'style = #'vaticana
  c'1^"vaticana"
  \break < d' a' f''>1

  \override Staff.Custos  #'style = #'mensural
  c'1^"mensural"
  \break < d' a' f''>1
}

