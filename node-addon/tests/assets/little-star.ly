\version "2.20.0"

\header {
}

#(set-global-staff-size 28.5714285714)
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1.5\cm
    bottom-margin = 1.5\cm
    left-margin = 1.5\cm
    right-margin = 1.5\cm
    between-system-space = 2.3\cm
    indent = 1.61538461538\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative d' {
    \clef "treble" \key c \major \time 4/4
    | % 1
    c c g' g a a g2 f4 f e e d d c2
    \bar "|."
    }


% The score definition
\score {
    <<
        
        \new Staff
        <<
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %\midi {\tempo 4 = 100 }
}
