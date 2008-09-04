%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.57"

\header {
  lsrtags = "tweaks-and-overrides, paper-and-layout, spacing"

  texidoces = "
Mediante el establecimiento de las propiedades de
@code{NonMusicalPaperColumn} se puede ajustar el espaciado vertical en
cada sistema.

Ajustando @code{alignment-extra-space} o
@code{fixed-alignment-extra-space} se puede ampliar verticalmente un
sistema individual.

Por razones técnicas, se debe usar @code{\overrideProperty} para
cambiar estas propiedades dentro de un pentagrama; aún se debe usar
@code{\override} dentro de un bloque @code{\context} para las
sobreescrituras globales.

"
  doctitlees = "Espaciado de la alineación vertical"

  texidoc = "
By setting properties in @code{NonMusicalPaperColumn}, vertical spacing
can be adjusted per system.


By setting @code{alignment-extra-space} or
@code{fixed-alignment-extra-space} an individual system may be
stretched vertically.


For technical reasons, @code{\\overrideProperty} must be used for
changing these properties within a staff; @code{\\override} in a
@code{\\context} block may still be used for global overrides. 

"
  doctitle = "Alignment vertical spacing"
} % begin verbatim
#(set-global-staff-size 13)

\relative c''
\new StaffGroup <<
  \new Staff {
    c1 \break
    c1 \break
    c1 \break
  }
  \new Staff {
    c1 | c | c
  }
  \new PianoStaff <<
    \new Voice  {
      \set PianoStaff.instrumentName = #"piano"
      \set PianoStaff.shortInstrumentName = #"pn"
      c1_"normal"
      
      \overrideProperty
        #"Score.NonMusicalPaperColumn"
        #'line-break-system-details
        #'((fixed-alignment-extra-space . 15))
      c_"fixed-aligment-extra-space"

      \overrideProperty
        #"Score.NonMusicalPaperColumn"
        #'line-break-system-details
        #'((alignment-extra-space . 15))
      c_"aligment-extra-space"
    }
    { c1 | c | c }
  >>
>>
