\version "2.24.3"

\header {
  title = "Ó, mily jó az Úrban bízni"
}

akkordok = \chordmode {
  g1 | c1 | g1 | c2 d2 | g1 |
  c2 g2 | e2:m c2 | d2 g2 | s1 | c2 d2 | g1 |
  s2 d2 | g1 | c2 g2 | e2:m c2 | d2 g2 |
}

dallam = \relative c' {
  \clef treble
  \key g \major 
  \time 4/4    
  
  b'4 a g4. fis8 | e4 g e d | g4 b d4. b8 | a4 g a2 | b4 a g4. fis8 |
  e4 g e d | g4 b e,4. a8 | g4 fis g2 | b4 d d b | a4 g b a | b4 d d4. b8 |
  a4 g a2 | b4 a g d | c'4. e,8 e4 d | g4 b e,4. a8 | g4 fis g2 |
  
  \bar "|." 
}

szovegEgy = \lyricmode {
  Ó, mily jó az Úr -- ban bíz -- ni, Er -- re bá -- to -- rít sza -- va, Meg -- nyu -- god -- ni í -- gé -- re -- tén, Ve -- lünk van Ő min -- den -- nap. Jé -- zus, Jé -- zus, hű Meg -- vál -- tóm, A re -- mény -- em csak Te vagy, Én Ki -- rály -- om, én Kő -- szá -- lam, Ben -- ned bí -- zom min -- den -- nap.
}

szovegKetto = \lyricmode {
  Má -- so -- dik sor.
}

szovegHarom = \lyricmode {
  Har -- ma -- dik rész.
}

szovegNegy = \lyricmode {
  Ne -- gye -- dik jön.
}

\score {
  <<
    \new ChordNames { \akkordok }
    
    \new Staff {
      \new Voice = "ének" { \dallam }
    }
    
    \new Lyrics \lyricsto "ének" { \szovegEgy }
    \new Lyrics \lyricsto "ének" { \szovegKetto }
    \new Lyrics \lyricsto "ének" { \szovegHarom }
    \new Lyrics \lyricsto "ének" { \szovegNegy }
  >>
  
  \layout { 
    indent = 0.0 
  }
  
  \midi { 
    \tempo 4 = 100 
  }
}