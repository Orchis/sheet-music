\version "2.18.2"

\paper {
  system-system-spacing.basic-distance = #20 % espace entre les portée
}

global = {
  \key c \major
  \time 4/4
  \tempo 4=65
}

voiceTenorI = \relative c' {
  \global
%{ 1 %}   r4 e'16 d c d~d4 d16 c b c~
          c4 r4 r2
          r4 e16 d c d~d4 c16 b a b~
          b^( c b8)~b^( a16 b gis4) r4  
%{ 5 %}   r4 e'16 d8 c16 d16 e16 f8~f4
          r8. b,16 c[ b8.] c16[ d e8]~e4 
          
%% Refrain
          a,,4 c8[ e16 a16]~a8[ a8] c8[e16 a16]~
          a2 r4 dis16 e dis e
%{ 10 %}
}

voiceTenorII = \relative c' {
  \global
  %{ 1 %}  r1
}


voiceBaryton = \relative c {
  \global
  %{1%}    r1
}

voiceBasse = \relative c' {
  \global
  \autoBeamOff
%{1%}   r4 a,8 a4 c8 c4
        e2 e2
        r4 c8 a4 c8 f,4
        e'2 e2
%{5%}   r4 \tuplet 3/2 { a,4. c d }
        \tuplet 3/2 { e,2 e e }
%% refrain
          a,4 c8[ e16 a16]~a8[ a8] r8 r8
          a2 r4 dis,16 e dis e
}

verseOne = \lyricmode {
  \set stanza = "1."
%%%%%%%%%---------------------  couplet 1 mesure 1
Pour -- quoi je vis, __ pour -- quoi je meurs __
Pour -- quoi je ris, pour -- quoi je pleure __
Voi -- ci le S. O. S. __
D'un ter -- rien en dé -- tresse __
%%%%%%%%%--------------------- refain 1 et 3 mesure 7

\set stanza = "   1.3."
J'ai ja -- mais eu __ les pieds sur terre __
J'aim' -- rais mieux être un oi -- seau
Je suis mal dans ma peau
Je voudrais voir le monde à  l'envers
}
verseTwo = \lyricmode {
  \set stanza = "2."
  Pour -- quoi je vis, pour -- quoi je meurs __
Pour -- quoi je cris, pour -- quoi je pleure __
Je crois cap -- ter des ondes __
Ve -- nues d'un au -- tre monde __
}


verseOneBasse = \lyricmode {
  \set stanza = "1."
Pour -- quoi __ je vis, __ je __ mange __
Pour -- quoi __ je ris, __ je __ chante __ 
Voi -- ci le S. O. S. __
\set stanza = "   1.3."
J'ai ja  mais eu __ les pieds sur terre __
J'aim' -- rais mieux Ãªtre un oi -- seau
Je suis mal dans ma peau
Je voudrais voir le monde Ã  l'envers
}

\score {
    \new ChoirStaff <<
      \new Staff \with {
        midiInstrument = "acoustic grand"
        instrumentName = \markup \left-column \fontsize#-2 { "Ténor I" "Ténor II" }
        shortInstrumentName = \markup \left-column \fontsize#-2 { "T1" "T2" }
      } <<
        \new Voice = "voiceTenorI" { \voiceOne \voiceTenorI }
        \new Voice = "voiceTenorII" { \voiceTwo \voiceTenorII }
      >>
      \new Lyrics \lyricsto "voiceTenorI" \verseOne
      \new Lyrics  \lyricsto "voiceTenorI" \verseTwo
      \new Staff \with {
        midiInstrument = "acoustic grand"
        instrumentName = \markup \left-column  \fontsize#-2 { Baryton Basse }
        shortInstrumentName = \markup \left-column \fontsize#-2 { "Br" "Bs" }
      } <<
        \clef bass
        \new Voice = "voiceBaryton" { \voiceOne \voiceBaryton }
        \new Voice = "voiceBasse" { \voiceTwo \voiceBasse }
      >>
       \new Lyrics \lyricsto "voiceBasse" \verseOneBasse

    >>
	  \layout{     }
  \midi {  }
}


