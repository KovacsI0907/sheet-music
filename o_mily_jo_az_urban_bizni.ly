\version "2.24.3"

\header {
  title = "Ó, mily jó az Úrban bízni"
}

% --- 1. AKKORDOK KETTÉBONTVA ---
versAkkordok = \chordmode {
  g1 | c2 g2 | g1 | d1 |
  g1 | c2 g2 | e2:m a2:m | d2 g2 |
}

refrenAkkordok = \chordmode {
  g1 | d1 | g1 | d1 |
  g1 | c2 g2 | e2:m a2:m | d2 g2 |
}

% --- 2. DALLAM KETTÉBONTVA ---
versDallam = \relative c' {
  \clef treble
  \key g \major 
  \time 4/4    
  \tempo 4 = 90
  
  b'4 a g4. fis8 | e4 g e d | g4 b d4. b8 | a4 g a2 | 
  b4 a g4. fis8 | e4 g e d | g4 b e,4. a8 | g4 fis g2 | 
}

refrenDallam = \relative c' {
  % A refrén ugyanabból az oktávból indul, mint az eleje
  b'4 d d b | a4 g b a | b4 d d4. b8 | a4 g a2 | 
  b4 a g d | c'4. e,8 e4 d | g4 b e,4. a8 | g4 fis g2 | 
  \bar "|." 
}

% --- 3. DALSZÖVEGEK KETTÉBONTVA ---
szovegEgy = \lyricmode {
  Ó, mily jó az Úr -- ban bíz -- ni, Er -- re bá -- to -- rít sza -- va, 
  Meg -- nyu -- god -- ni í -- gé -- re -- tén, Ve -- lünk van Ő min -- den -- nap. 
}

szovegRefren = \lyricmode {
  Jé -- zus, Jé -- zus, hű Meg -- vál -- tóm, A re -- mény -- em csak Te vagy, 
  Én Ki -- rály -- om, én Kő -- szá -- lam, Ben -- ned bí -- zom min -- den -- nap.
}

% (Ide jöhetnek majd a további versszakok is!)
szovegKetto = \lyricmode {
  Ó, mily jó az Úr -- ban bíz -- ni, Bűnt el -- tör -- lő vé -- ré -- ben, Hit -- tel foly -- ton Ő -- rá néz -- ni, Meg -- gyó -- gyul -- ni se -- bé -- ben.
}

szovegHarom = \lyricmode {
  Ó, mily jó az Úr -- ban bíz -- ni, Vé -- le jár -- ni szün -- te --len, Üd -- vöt, bé -- két Ő ad né -- kem, Ezt val -- lom min -- den he -- lyen.
}

szovegNegy = \lyricmode {
  Úgy ör -- vend a szí -- vem Ben -- ned, Drá -- ga Jé -- zus, hű ba -- rát! Te ve -- zetsz e lét -- ből en -- gem É -- gi, szép ha -- zám -- ba át.
}

% --- 4. KOTTA ÖSSZEÁLLÍTÁSA ---
\score {
  <<
    \new ChordNames { \versAkkordok \refrenAkkordok }
    
    \new Staff {
      \new Voice = "vers" { \versDallam }
      \new Voice = "refren" { \refrenDallam }
    }
    
    % A versszakok hozzárendelése a "vers" dallamhoz
    \new Lyrics = "sor1" \lyricsto "vers" { \szovegEgy }
    \new Lyrics = "sor2" \lyricsto "vers" { \szovegKetto }
    \new Lyrics = "sor3" \lyricsto "vers" { \szovegHarom }
    \new Lyrics = "sor4" \lyricsto "vers" { \szovegNegy }
    
    % A refrén hozzáfűzése a legfelső "sor1" szövegsorhoz!
    \context Lyrics = "sor2" \lyricsto "refren" { \szovegRefren }
  >>
  
  \layout { 
    indent = 0.0 
  }
  
  \midi { 
  }
}