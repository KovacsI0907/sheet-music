\version "2.24.3"

\header {
  title = "Ó, nem én, Krisztus él bennem"
  composer = ""
}

% --- AKKORDOK (Gitárhoz) ---
akkordok = \chordmode {
  % Ide jönnek az akkordok (pl. c1 a2:m g2)
  \partial 4 s4 | c1 | 
  f1 | c2 a:m | g1 | c1 |
  f1 | c2 g2 | 
}

% --- DALLAM ---
dallam = \relative c' {
  \clef treble
  \key c \major % Hangnem beállítása (pl. g \major, d \minor)
  \time 4/4    % Ütemmutató beállítása (pl. 3/4, 6/8)
  
  % Ide jönnek a hangjegyek. A | jel segít átlátni az ütemeket (opcionális).
  \partial 4 \tuplet 3/2 {c8 c e} | e4 r8 e8 {e8 d d c} | c4 a4. {c8 c e} |
  e4. e8 {e8 c g' e} | d2 {d8 c c e} | e4 r8 e8 {e16 d8.} {d16 c8.} |
  c4 a4. { c8 c e} | e4. e8 {e8 d} {d8. c16} | e4 r8 e8 {e16 d8.} {d16 c8.} |
  c4 a4. {c8 c e} | e4. e8 {e8 d} {d8. c16} | c2 r8 {e8 e a} |
  a4 r8 a8 {a8. g16} {g8 f} | {e8 g} g4. r8 {c8 b} |
  a4. g8 { g8 g g e } | d2~ d8 r8 {e8 d} | c4 { c8. d16 } d4 {d8 e} | e4 {c'8. b16} a8 r8 {g8 f} |
  e4 {c8 e} d4. c8 | c2 c8 r8 r4 |

  
  % A legvégére vedd ki a kommentet a következő sorból a záróvonalhoz:
  % \bar "|." 
}

% --- DALSZÖVEGEK (4 versszak) ---
% A szavakat kötőjelekkel válaszd el: szó -- tag
szovegEgy = \lyricmode {
  El -- ső vers -- szak.
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

% --- KOTTA GENERÁLÁSA ---
\score {
  <<
    % Akkordok sora
    \new ChordNames { \akkordok }
    
    % Kotta sora a dallammal
    \new Staff {
      \new Voice = "ének" { \dallam }
    }
    
    % Szövegek összekapcsolása a "ének" nevű dallammal
    \new Lyrics \lyricsto "ének" { \szovegEgy }
    \new Lyrics \lyricsto "ének" { \szovegKetto }
    \new Lyrics \lyricsto "ének" { \szovegHarom }
    \new Lyrics \lyricsto "ének" { \szovegNegy }
  >>
  
  % PDF kimenet beállításai
  \layout { 
    indent = 0.0 % Ne legyen behúzva az első sor
  }
  
  % MIDI kimenet beállításai (lejátszáshoz)
  \midi { 
    \tempo 4 = 100 
  }
}