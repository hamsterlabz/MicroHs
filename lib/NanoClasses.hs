module NanoClasses(
  module NanoPrelude,
  module Data.Eq,
  module Text.Show,
  module Data.Char_Type,
  primChr, primOrd,
  IsString(..),
  module NanoClasses
  ) where

-- NanoClasses = NanoPrelude + the two type classes the compiler keys
-- `deriving` on (Data.Eq.Eq and Text.Show.Show), for the benchmarks that
-- compare or show their OWN data types. nofib sources may not be edited,
-- so a program that says `deriving (Eq, Show)` needs the real classes.
--
-- Why a separate module and not NanoPrelude itself: making (==) a class
-- method costs a dictionary build plus a selector reduction at every use,
-- including at Int, which mhs does not specialise away at any -O level
-- (checked -O1/-O2/-O3: the call site keeps `fn.link inst$(Data.Eq.Eq@Int)`
-- + `fn.link Data.Eq.$3d$3d` instead of `fn.elink _prim_eq`). Measured on
-- Adjoxo: 141,674 -> 153,917 compute cycles, +8.6%. Every benchmark that
-- only compares Ints therefore keeps importing NanoPrelude and keeps the
-- primitive; only a program that genuinely needs classes pays for them.

import Prelude()
import Primitives (Int, Char, primChr, primOrd, primCharEQ, primCharNE)
import NanoPrelude hiding ((==), (/=))
import Data.Eq
import Text.Show
import Data.Char_Type

-- string literals desugar through IsString.fromString, so the class has to
-- be in scope for a source that writes any. Declared here rather than
-- imported from Data.String, which drags in the full Data.List/Data.Char.
class IsString a where
  fromString :: String -> a

instance IsString String where
  fromString s = s

instance Eq Int where
  (==) = primitive "=="
  (/=) = primitive "/="

instance Eq Char where
  (==) = primCharEQ
  (/=) = primCharNE

-- lists and pairs: the structural instances every Haskell source assumes
instance Eq a => Eq [a] where
  []     == []     = True
  (x:xs) == (y:ys) = x == y && xs == ys
  _      == _      = False

instance (Eq a, Eq b) => Eq (a, b) where
  (a1, b1) == (a2, b2) = a1 == a2 && b1 == b2

-- Show for the structures a derived Show reaches through. GHC prints a
-- list with showList and a String in quotes; showList on Char is what
-- makes "abc" come out quoted rather than as [a,b,c].
instance Show a => Show [a] where
  showsPrec _ = showList

instance Show Char where
  showsPrec _ c s = primChr 39 : showLitChar c (primChr 39 : s)
  showList cs s = primChr 34 : showLitStr cs s

showLitChar :: Char -> String -> String
showLitChar c s =
  if primOrd c == 34 then primChr 92 : primChr 34 : s
  else if primOrd c == 92 then primChr 92 : primChr 92 : s
  else if primOrd c == 10 then primChr 92 : primChr 110 : s
  else if primOrd c == 9 then primChr 92 : primChr 116 : s
  else if primOrd c == 39 then primChr 92 : primChr 39 : s
  else if primOrd c < 32 || primOrd c > 126 then primChr 92 : showsPrec 0 (primOrd c) s
  else c : s

showLitStr :: String -> String -> String
showLitStr []     s = primChr 34 : s
showLitStr (c:cs) s =
  if primOrd c == 34 then primChr 92 : primChr 34 : showLitStr cs s
  else if primOrd c == 92 then primChr 92 : primChr 92 : showLitStr cs s
  else if primOrd c == 10 then primChr 92 : primChr 110 : showLitStr cs s
  else if primOrd c == 9 then primChr 92 : primChr 116 : showLitStr cs s
  else if primOrd c < 32 || primOrd c > 126 then primChr 92 : showsPrec 0 (primOrd c) (showLitStr cs s)
  else c : showLitStr cs s

instance (Show a, Show b) => Show (a, b) where
  showsPrec _ (a, b) s =
    primChr 40 : showsPrec 0 a (primChr 44 : showsPrec 0 b (primChr 41 : s))

instance (Show a, Show b, Show c, Show d) => Show (a, b, c, d) where
  showsPrec _ (a, b, c, d) s =
    primChr 40 : showsPrec 0 a (primChr 44 : showsPrec 0 b (primChr 44 :
      showsPrec 0 c (primChr 44 : showsPrec 0 d (primChr 41 : s))))

instance Show Int where
  showsPrec p n r =
    if n < 0 then
      if p > 6 then chParen (nshowNat (0 - n) (chRparen r))
               else chMinus (nshowNat (0 - n) r)
    else nshowNat n r

chParen :: String -> String
chParen s = primChr 40 : primChr 45 : s
chRparen :: String -> String
chRparen r = primChr 41 : r
chMinus :: String -> String
chMinus s = primChr 45 : s

nshowNat :: Int -> String -> String
nshowNat n r =
  if n < 10 then nDigit n : r
  else nshowNat (quot n 10) (nDigit (rem n 10) : r)

nDigit :: Int -> Char
nDigit d = primChr (primOrd (primChr 48) + d)

-- Bool, Maybe and the wider tuples: structural instances the circsim port
-- assumes (GHC has all of these natively; the shim needs none of them)
instance Show Bool where
  showsPrec _ True  s = 'T':'r':'u':'e':s
  showsPrec _ False s = 'F':'a':'l':'s':'e':s

instance (Show a, Show b, Show c) => Show (a, b, c) where
  showsPrec _ (a, b, c) s =
    primChr 40 : showsPrec 0 a (primChr 44 : showsPrec 0 b (primChr 44
      : showsPrec 0 c (primChr 41 : s)))

instance (Show a, Show b, Show c, Show d, Show e) => Show (a, b, c, d, e) where
  showsPrec _ (a, b, c, d, e) s =
    primChr 40 : showsPrec 0 a (primChr 44 : showsPrec 0 b (primChr 44
      : showsPrec 0 c (primChr 44 : showsPrec 0 d (primChr 44
      : showsPrec 0 e (primChr 41 : s)))))

instance (Show a, Show b, Show c, Show d, Show e, Show f)
    => Show (a, b, c, d, e, f) where
  showsPrec _ (a, b, c, d, e, f) s =
    primChr 40 : showsPrec 0 a (primChr 44 : showsPrec 0 b (primChr 44
      : showsPrec 0 c (primChr 44 : showsPrec 0 d (primChr 44
      : showsPrec 0 e (primChr 44 : showsPrec 0 f (primChr 41 : s))))))

instance Eq a => Eq (Maybe a) where
  Nothing == Nothing = True
  Just a  == Just b  = a == b
  _       == _       = False
  a /= b = not (a == b)
