
tranpostion = c % f origine
tonaliteOriginale = c
tonalite = "Do"

\paper {
  system-system-spacing.basic-distance = #20 % espace entre les portÃ©e
}
#(set-default-paper-size "a4")
#(set-global-staff-size 20)






global = {
  \key c \major
  \time 4/4
  \tempo 4=65
}


theChords = \chordmode {
  \time 2/2
  a2:m  d2:m/a
  a1:m
  f1:7
  e2:4 e2:7
  a2:m d2:m/f
  e2:4 e2:7
  a1:m
  f1
  c2 g2:7
  a1:m
  a1:m
  f1
  c2 g:7
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
D'un ter -- rien en dÃ© -- tresse __
%%%%%%%%%--------------------- refain 1 et 3 mesure 7

\set stanza = "   1.3."
J'ai ja -- mais eu __ les pieds sur terre __
J'aim' -- rais mieux Ãªtre un oi -- seau
Je suis mal dans ma peau
Je voudrais voir le monde Ã  l'envers
%%%%%%%%%--------------------- couplet 1 mesure 12
Si jamais c'Ã©tait plus beau
Plus beau vu d'en haut, vu d'en haut
oh__ d'en haut__ %%%%%%%%%%%%%%%%           ?????
J'ai toujours confondu la vie
Avec les bandes dessinÃ©es
J'ai comme des envies de mÃ©tamorphose
Je sens quelque chose
Qui m'attire
Qui m'attire
Qui m'attire vers le haut

%%%%%%%%%--------------------- refrain 2 mesure 7
Au grand loto de l'univers
J'ai pas tirÃ© le bon numÃ©ro
Je suis mal dans ma peau

%%%%%%%%%--------------------- couplet 2 mesure 12
J'ai pas envie d'Ãªtre un robot
MÃ©tro, boulot, dodo
oh__ d'en haut__ %%%%%%%%%%%%%%%%           ?????
%%%%%%%%%--------------------- Couplet 2 mesure 1
Pourquoi je vis, pourquoi je meurs
Pourquoi je cris, pourquoi je pleure
Je crois capter des ondes
Venues d'un autre monde

%%%%%%%%%--------------------- refrain 1 mesure 7
J'ai jamais eu les pieds sur terre
J'aimerais mieux Ãªtre un oiseau
Je suis mal dans ma peau
Je voudrais voir le monde Ã  l'envers
%%%%%%%%%--------------------- couplet 2 mesure 12
J'aimerais mieux Ãªtre un oiseau
Dodo l'enfant do
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
  \transpose \tonaliteOriginale \tranpostion  {
    \new ChoirStaff <<
      \new ChordNames {
        \override ChordNames . ChordName #'font-size = #-2 \theChords
      }
      \new Staff \with {
        midiInstrument = "acoustic grand"
        instrumentName = \markup \left-column \fontsize#-2 { "TÃ©nor I" "TÃ©nor II" }
        shortInstrumentName = \markup \left-column \fontsize#-2 { "T1" "T2" }
      } <<
        \new Voice = "voiceTenorI" { \voiceOne \voiceTenorI }
        \new Voice = "voiceTenorII" { \voiceTwo \voiceTenorII }
      >>
      \new Lyrics \with {
        \override VerticalAxisGroup #'staff-affinity = #CENTER
      } \lyricsto "voiceTenorI" \verseOne
      \new Lyrics \with {
        \override VerticalAxisGroup #'staff-affinity = #CENTER
      } \lyricsto "voiceTenorI" \verseTwo
      \new Staff \with {
        midiInstrument = "acoustic grand"
        instrumentName = \markup \left-column  \fontsize#-2 { Baryton Basse }
        shortInstrumentName = \markup \left-column \fontsize#-2 { "Br" "Bs" }
      } <<
        \clef bass
        \new Voice = "voiceBaryton" { \voiceOne \voiceBaryton }
        \new Voice = "voiceBasse" { \voiceTwo \voiceBasse }
      >>
       \new Lyrics 
       \lyricsto "voiceBasse" \verseOneBasse

    >>

  } % END \transpose
  %--------- Do majeur # majeur ---------------------------------%

