%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.12.2"

\header {
%% Translation of GIT committish: c1d5bb448321d688185e0c6b798575d4c325ae80
  texidocfr = "
Les crochets d'arpegio (@code{arpeggioBracket}) permettent de mettre en
évidence les divisions d'un pupitre en l'absence de hampe, comme on le
voit régulièrement dans les partitions pour chœur.

"

  doctitlefr = "Utilisation d'un arpeggioBracket pour rendre les
divisions plus évidentes"


  lsrtags = "expressive-marks, vocal-music"


%% Translation of GIT committish: fa19277d20f8ab0397c560eb0e7b814bd804ecec
  texidoces = "
El corchete de arpegios @code{arpeggioBracket} se puede usar para
indicar la división de voces cuando no hay plicas que puedan ofrecer
esta información. Se suele encontrar en la música coral.

"

  doctitlees = "Uso de arpeggioBracket para hacer más visible un divisi"


  texidoc = "
The @code{arpeggioBracket} can be used to indicate the division of
voices where there are no stems to provide the information. This is
often seen in choral music.

"
  doctitle = "Using arpeggioBracket to make divisi more visible"
} % begin verbatim

\include "english.ly"

\score {
  \relative c'' {
    \key a \major
    \time 2/2
    <<
      \new Voice = "upper"
      <<
        { \voiceOne \arpeggioBracket
          a2( b2
          <b d>1\arpeggio)
          <cs e>\arpeggio ~
          <cs e>4
        }
        \addlyrics { \lyricmode { A -- men. } }
      >>
      \new Voice = "lower"
      { \voiceTwo
        a1 ~
        a
        a ~
        a4 \bar "|."
      }
    >>
  }
  \layout { ragged-right = ##t }
}

