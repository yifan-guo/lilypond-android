%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.55"

\header {
  lsrtags = "expressive-marks"

  texidoces = "
El glifo de la marca de respiración se puede ajustar
sobreescribiendo la proopiedad de texto del objeto de presentación
@code{BreathingSign}, con cualquier otro texto de marcado.

"
  doctitlees = "Cambiar el símbolo de la marca de respiración"

  texidoc = "
The glyph of the breath mark can be tuned by overriding the text
property of the @code{BreathingSign} layout object with any markup
text. 

"
  doctitle = "Changing the breath mark symbol"
} % begin verbatim
\relative c'' {
  c2
  \override BreathingSign #'text = \markup { \musicglyph #"scripts.rvarcomma" }
  \breathe
  d2
}
