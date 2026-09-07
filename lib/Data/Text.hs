module Data.Text(
  Text,
  pack, unpack,
  empty,
  append,
  null,
  head,
  tail,
  uncons,
  ) where
import Prelude(); import MiniPrelude hiding(head, tail, null)
import Data.Monoid.Internal
import Data.String

-- fun backend: Text is just a list of codepoints (no UTF-8 / ByteString — fun has
-- no byte ops and the compiler treats String as [Char] throughout).
newtype Text = T [Char]

instance Eq Text where
  T x == T y  =  x == y
  T x /= T y  =  x /= y

instance Ord Text where
  T x <  T y  =  x <  y
  T x <= T y  =  x <= y
  T x >  T y  =  x >  y
  T x >= T y  =  x >= y

instance Show Text where
  showsPrec p = showsPrec p . unpack

instance IsString Text where
  fromString = pack

instance Semigroup Text where
  (<>) = append

instance Monoid Text where
  mempty = empty

empty :: Text
empty = T []

pack :: String -> Text
pack s = T s

unpack :: Text -> String
unpack (T t) = t

append :: Text -> Text -> Text
append (T x) (T y) = T (x ++ y)

null :: Text -> Bool
null (T t) = case t of { [] -> True; _ -> False }

head :: Text -> Char
head (T (c:_)) = c
head (T [])    = error "Data.Text.head: empty"

tail :: Text -> Text
tail (T (_:cs)) = T cs
tail (T [])     = error "Data.Text.tail: empty"

uncons :: Text -> Maybe (Char, Text)
uncons t | null t    = Nothing
         | otherwise = Just (head t, tail t)
