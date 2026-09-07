-- Data.ByteString.Lazy.Char8
--
-- The Char view of Data.ByteString.Lazy: the same chunked, streaming type,
-- with the element operations taking and returning Chars.
module Data.ByteString.Lazy.Char8(
  module Data.ByteString.Lazy.Char8,
  ByteString(..), chunkSize, empty, null, length, tail, append, concat,
  take, drop, splitAt, toStrict, fromStrict, toChunks, fromChunks,
  readFile, writeFile, appendFile, getContents, hGetContents, hGet, hPut,
  ) where
import Prelude(); import MiniPrelude hiding(length, null, head, tail, concat,
                                            take, drop, splitAt, elem, readFile,
                                            writeFile, appendFile, getContents,
                                            lines, unlines)
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.ByteString.Lazy hiding(head, cons, snoc, singleton, pack, unpack,
                                   index, elem, isPrefixOf)
import qualified Data.ByteString.Lazy as L
import Data.Coerce

singleton :: Char -> ByteString
singleton = coerce L.singleton

pack :: String -> ByteString
pack = coerce L.pack

unpack :: ByteString -> String
unpack = coerce L.unpack

head :: ByteString -> Char
head = coerce L.head

cons :: Char -> ByteString -> ByteString
cons = coerce L.cons

snoc :: ByteString -> Char -> ByteString
snoc = coerce L.snoc

index :: ByteString -> Int -> Char
index = coerce L.index

elem :: Char -> ByteString -> Bool
elem = coerce L.elem

isPrefixOf :: ByteString -> ByteString -> Bool
isPrefixOf = L.isPrefixOf
