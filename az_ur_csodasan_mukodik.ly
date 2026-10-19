\version "2.24.3"

\header {
  title = "Az Úr csodásan működik"
  composer = ""
}

akkordok = \chordmode {
  s8 | 
  
  % Phrase 1 (Home -> Journey -> Tension)
  d2.:m | d2.:m | f2. | a2. |
  
  % Phrase 2 (Home -> Lift -> Journey -> Tension)
  d2.:m | f2. | g2.:m | a2. |
  
  % Phrase 3 (Staying grounded)
  d2.:m | f2. | g2.:m | a2. |
  
  % Phrase 4 (The Grand Finale: Faster chord changes)
  a2.:7 | a4. d4.:m | g4.:m a4. | d2.:m |
}

dallam = \relative c' {
  \clef treble
  \key d \minor
  \time 6/8

  \tempo 4 = 90
  
  \partial 8 a'8 | a4 f8 d4 e8 | f 4 e8 d4 f8 | f4 g8 a4 bes8 | a4.~ a4 a8 |
  a4 f8 e4 d8 | c4 bes'8 a4 f8 | g4 a8 c4 bes8 | a4.~ a4 d8 |
  d4 d8 c4 d8 |c4 bes8 a4 c8 | c4 bes8 g4 bes8 | a4.~ a4 d,8 |
  e4 f8 g4 bes8 | a4 cis8 d4 c8 | bes4 a8 f4 e8 | d4.~ d4
  
  \bar "|." 
}

szovegEgy = \lyricmode {
  Az Úr cso -- dá -- san mű -- kö -- dik, De út -- ja rejt -- ve van; Ten -- ger ta -- kar -- ja láb -- nyo -- mát, Sze -- lek  szár -- nyán su -- han. Mint tit -- kos bá -- nya -- mély -- lyé -- ben For -- mál -- ja ter -- ve -- it, De biz -- tos kéz -- zel hoz -- za föl, Mi most még rejt -- ve itt.
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