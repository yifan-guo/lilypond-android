
\version "2.1.36"
\header { texidoc = "Each clef have own accidental placing rules. " }

\score { \notes
  \relative cis' {

% \clef french % same as octaviated bass
\clef violin
\key cis \major cis1  \key ces \major ces
\clef soprano
\key cis \major cis \key ces \major ces
\clef mezzosoprano
\key cis \major cis \key ces \major ces
\clef alto
\key cis \major cis \key ces \major ces
\clef tenor
\key cis \major cis \key ces \major ces
\clef baritone
\key cis \major cis \key ces \major ces
\clef bass
\key cis \major cis \key ces \major  ces
}

	\paper{\paperSixteen}

}

