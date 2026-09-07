-- PrettyN.hs - nofib spectral/pretty (Main + Pretty + CharSeq), verbatim
-- port to the NanoPrelude dialect. No input; one putStr. ppInteger and
-- ppDouble are exported by the original but unreachable from main and are
-- omitted. Chars are codes ('\t' = 9 in mkIndent). The printed page is
-- consumed with the nofib hash.
module PrettyN where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

foldr1L :: (a -> a -> a) -> [a] -> a
foldr1L _ [x]    = x
foldr1L f (x:xs) = f x (foldr1L f xs)

-- CharSeq
data CSeq = CNil
          | CAppend CSeq CSeq
          | CIndent Int CSeq
          | CNewline
          | CStr [Int]
          | CCh Int

cNil :: CSeq
cNil = CNil

cAppend :: CSeq -> CSeq -> CSeq
cAppend cs1 cs2 = CAppend cs1 cs2

cIndent :: Int -> CSeq -> CSeq
cIndent n cs = CIndent n cs

cNL :: CSeq
cNL = CNewline

cStr :: [Int] -> CSeq
cStr = CStr

cCh :: Int -> CSeq
cCh = CCh

cShow :: CSeq -> [Int]
cShow sq = flatten 0 True sq []

flatten :: Int -> Bool -> CSeq -> [(Int,CSeq)] -> [Int]
flatten n nlp CNil seqs = flattenS nlp seqs
flatten n nlp (CAppend seq1 seq2) seqs = flatten n nlp seq1 ((n,seq2) : seqs)
flatten n nlp (CIndent n' sq) seqs = flatten (n'+n) nlp sq seqs
flatten n nlp CNewline seqs = 10 : flattenS True seqs
flatten n False (CStr s) seqs = append s (flattenS False seqs)
flatten n False (CCh c)  seqs = c : flattenS False seqs
flatten n True  (CStr s) seqs = mkIndent n (append s (flattenS False seqs))
flatten n True  (CCh c)  seqs = mkIndent n (c : flattenS False seqs)

flattenS :: Bool -> [(Int, CSeq)] -> [Int]
flattenS nlp [] = []
flattenS nlp ((col,sq):seqs) = flatten col nlp sq seqs

mkIndent :: Int -> [Int] -> [Int]
mkIndent 0 s = s
mkIndent n s = if n >= 8 then 9 : mkIndent (n-8) s
               else 32 : mkIndent (n-1) s

-- Pretty
type Pretty = Int -> Bool -> PrettyRep

data PrettyRep = MkPrettyRep CSeq Int Bool Bool

ppShow :: Int -> Pretty -> [Int]
ppShow width p
 = cShow sq
 where (MkPrettyRep sq ll emp sl) = p width False

ppNil :: Pretty
ppNil width is_vert = MkPrettyRep cNil 0 True (width >= 0)

ppStr :: [Int] -> Pretty
ppStr s width is_vert = MkPrettyRep (cStr s) ls False (width >= ls)
                        where ls = length s

ppChar :: Int -> Pretty
ppChar c width is_vert = MkPrettyRep (cCh c) 1 False (width >= 1)

showI :: Int -> [Int]
showI n = if n < 0 then 45 : showP (0-n) else showP n
  where showP k = if k < 10 then [48+k] else append (showP (div k 10)) [48 + mod k 10]

ppInt :: Int -> Pretty
ppInt n = ppStr (showI n)

ppSP, pp'SP :: Pretty
ppSP  = ppChar 32
pp'SP = ppStr [44,32]     -- ", "

ppBeside :: Pretty -> Pretty -> Pretty
ppBeside p1 p2 width is_vert
 = MkPrettyRep (seq1 `cAppend` (cIndent ll1 seq2))
               (ll1 + ll2)
               (emp1 `andL` emp2)
               ((width >= 0) `andL` (sl1 `andL` sl2))
 where
  MkPrettyRep seq1 ll1 emp1 sl1 = p1 width       False
  MkPrettyRep seq2 ll2 emp2 sl2 = p2 (width-ll1) False

ppBesides :: [Pretty] -> Pretty
ppBesides [] = ppNil
ppBesides ps = foldr1L ppBeside ps

ppBesideSP :: Pretty -> Pretty -> Pretty
ppBesideSP p1 p2 width is_vert
 = MkPrettyRep (seq1 `cAppend` (sp `cAppend` (cIndent li seq2)))
               (li + ll2)
               (emp1 `andL` emp2)
               ((width >= wi) `andL` (sl1 `andL` sl2))
 where
  MkPrettyRep seq1 ll1 emp1 sl1 = p1 width      False
  MkPrettyRep seq2 ll2 emp2 sl2 = p2 (width-li) False
  li = if emp1 then 0 else ll1+1
  wi = if emp1 then 0 else 1
  sp = if emp1 `orL` emp2 then cNil else (cCh 32)

ppCat :: [Pretty] -> Pretty
ppCat []  = ppNil
ppCat ps  = foldr1L ppBesideSP ps

ppAbove :: Pretty -> Pretty -> Pretty
ppAbove p1 p2 width is_vert
 = MkPrettyRep (seq1 `cAppend` (nl `cAppend` seq2))
               ll2
               (emp1 `andL` emp2)
               False
 where
  nl = if emp1 `orL` emp2 then cNil else cNL
  MkPrettyRep seq1 ll1 emp1 sl1 = p1 width True
  MkPrettyRep seq2 ll2 emp2 sl2 = p2 width True

ppAboves :: [Pretty] -> Pretty
ppAboves [] = ppNil
ppAboves ps = foldr1L ppAbove ps

ppHang :: Pretty -> Int -> Pretty -> Pretty
ppHang p1 n p2 width is_vert
 = if emp1 then
      p2 width is_vert
   else
   if (ll1 <= n) `orL` sl2 then
      MkPrettyRep (seq1 `cAppend` (cCh 32) `cAppend` (cIndent (ll1+1) seq2))
                (ll1 + 1 + ll2)
                False
                (sl1 `andL` sl2)
  else
      MkPrettyRep (seq1 `cAppend` (cNL `cAppend` (cIndent n seq2')))
                ll2'
                False
                False
 where
  MkPrettyRep seq1 ll1 emp1 sl1 = p1 width      False
  MkPrettyRep seq2 ll2 emp2 sl2 = p2 (width-(ll1+1)) False
  MkPrettyRep seq2' ll2' emp2' sl2' = p2 (width-n) False

andL :: Bool -> Bool -> Bool
andL False x = False
andL True  x = x

orL :: Bool -> Bool -> Bool
orL True  x = True
orL False x = x

-- Main
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastWords, simWords :: Int
fastWords = 50
simWords = 8

prettyPage :: [Int]
prettyPage = append (ppShow 80 pretty_stuff) [10]
 where
  pretty_stuff = ppAboves [ ppBesides [ppInt (0-42), ppChar 64, ppStr str1],
                            pp'SP,
                            ppHang (ppStr str2)
                                8 (ppCat (takeL simWords pp_words)) ]
  pp_words = pp_word : pp_words
  pp_word = ppStr [120,120,120,120,120]                              -- "xxxxx"
  str1 = [84,104,105,115,32,105,115,32,97,32,115,116,114,105,110,103]            -- "This is a string"
  str2 = [84,104,105,115,32,105,115,32,116,104,101,32,108,97,98,101,108]          -- "This is the label"

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS prettyPage

main :: Int
main = bench
