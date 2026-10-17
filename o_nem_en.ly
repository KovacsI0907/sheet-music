\version "2.24.3"

\header {
  title = "Ó, nem én, Krisztus él bennem"
  composer = ""
}

% --- AKKORDOK (Gitárhoz) ---
akkordok = \chordmode {
  % Ide jönnek az akkordok (pl. c1 a2:m g2)
  \partial 4 s4 | c1 | f1 | 
  c2 a2:m | g1 | c1 |
  f1 | c2 g2 | c1 |
  f1 | c1 | f2 c2 |
  g1 | c2  g2 | c2 f2 |
  c2 g2 | c1
}

% --- DALLAM ---
dallam = \relative c' {
  \clef treble
  \key c \major % Hangnem beállítása (pl. g \major, d \minor)
  \time 4/4    % Ütemmutató beállítása (pl. 3/4, 6/8)
  
  % Ide jönnek a hangjegyek. A | jel segít átlátni az ütemeket (opcionális).
  \partial 4 \tuplet 3/2 {c8 c e} | e4 r8 e8 {e8 d d c} | c4 a4. {c8 c e} |
  e4. e8 {e8 c g' e} | d2~ {d8 c c e} | e4 r8 e8 {e16 d8.} {d16 c8.} |
  c4 a4. { c8 c e} | e4. e8 {e8 d} {d8. c16} | e2 r8 {e8 e a} |
  a4 r8 a8 {a8. g16} {g8 f} | {e8 (g)} g4. r8 {c8 b} |
  a4. g8 { g8 g g e } | d2~ d8 r8 {e8 d} | c4 { c8. d16 } d4 {d8 e} | e4 {c'8. b16} a8 r8 {g8 f} |
  e4 {c8 e} d4. c8 | c2 (c8) r8 r4 |

  
  % A legvégére vedd ki a kommentet a következő sorból a záróvonalhoz:
  % \bar "|." 
}

% --- DALSZÖVEGEK (4 versszak) ---
% A szavakat kötőjelekkel válaszd el: szó -- tag
szovegEgy = \lyricmode {
  Mily drá -- ga kincs, mit Krisz -- tus -- ban meg -- nyer -- tem, nincs Ná -- la szebb, min -- den -- nél töb -- bet ér. Csak Ben -- ne van, ö -- rö -- möm, sza -- bad -- sá -- gom, Sze -- rel -- me mély, bé -- ké -- je vég -- te -- len. Eb -- ben -- bí -- zom min -- den re -- mé -- nyem Jé -- zus, Él -- tem már, Ő -- ben -- ne rejt -- ve van. Tit -- kát nem ért -- he -- tem: meg -- van már min -- de -- nem, Ó, nem én, Krisz -- tus él ben -- nem.
}

szovegKetto = \lyricmode {
  Az éj sö -- tét, de nem ha -- gyott ma -- gam --ra, E -- rős jobb -- ja lesz lel -- kem tá -- ma -- sza. Fu -- tok -- küz -- dök, min -- dent ö -- röm -- nek tart -- va Míg cél -- ba é -- rek egy -- kor Ál -- ta -- la. Eb -- ben bí -- zom, jó Pász -- to -- rom lesz paj -- zsom Ő ve -- zet ha -- lál -- nak völ -- gyén át Tu -- dom, jól, Mes -- te -- rem tart -- ja meg é -- le -- tem, Ó, nem én, Krisz -- tus él ben -- nem.
}

szovegHarom = \lyricmode {
  Nem fé -- lek már, vét -- kem el lett tö -- röl -- ve. El -- múlt a vád, fi -- zet -- ve min -- den kár. Mert ér -- tem halt, Ő hord -- ta bün -- te -- té -- sem "S föl" -- tá -- ma -- dott a sír -- ból győz -- te -- sen. Bí -- zom Ben -- ne, min -- den bű -- nöm le -- győz te, Jé -- zus most, "s ö" -- rök -- ké vé -- del -- mem. Győ -- zel -- mét é -- nek -- lem, sza -- bad -- dá lett lel -- kem, Ó, nem én Krisz -- tus -- él -- ben -- nem.
}

szovegNegy = \lyricmode {
  Míg lé -- leg -- zek, Jé -- zus -- sal já -- rok hí -- ven. Meg -- í -- gér -- te, hogy ér -- tem visz -- sza -- tér. És nap mint nap meg -- ú -- jít nagy ke -- gyel -- me, Így áll -- ha -- tok  majd szent trón -- ja e -- lé. Eb -- ben bí -- zom, min -- den re -- mé -- nyem Jé -- zus, Ö -- vé min -- den ál -- dás, tisz -- tes -- ség. Ha vé -- get ér é -- le -- tem, aj -- kam zeng szün -- te -- len: Ó, nem én Krisz -- tus élt ben -- nem!
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