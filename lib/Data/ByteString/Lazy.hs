-- Data.ByteString.Lazy
--
-- A lazy list of strict chunks. The tail of the list is produced by
-- unsafeInterleaveIO, so reading a file costs one chunk of memory at a time
-- however long the file is, and a chunk already walked past is garbage.
--
-- Data.ByteString.Lazy.Char8 is this same type seen as Chars.
module Data.ByteString.Lazy(
  ByteString(..), chunkSize,
  empty, singleton, pack, unpack, null, length, head, tail, cons, snoc,
  append, concat, take, drop, splitAt, index, elem, isPrefixOf,
  toStrict, fromStrict, toChunks, fromChunks,
  readFile, writeFile, appendFile, getContents, hGetContents, hGet, hPut,
  ) where
import Prelude(); import MiniPrelude hiding(length, null, head, tail, concat,
                                            take, drop, splitAt, elem, readFile,
                                            writeFile, appendFile, getContents)
import qualified Prelude as P
import qualified Data.ByteString as B
import Data.Word(Word8)
import System.IO(Handle, IOMode(..), openFile, hClose, stdin)
import System.IO.Unsafe(unsafeInterleaveIO)

data ByteString = Empty | Chunk B.ByteString ByteString

-- Big enough that the per-chunk work is amortised, small enough that a
-- program holding one chunk holds nothing much.
chunkSize :: Int
chunkSize = 4096

toChunks :: ByteString -> [B.ByteString]
toChunks Empty = []
toChunks (Chunk c r) = c : toChunks r

fromChunks :: [B.ByteString] -> ByteString
fromChunks [] = Empty
fromChunks (c : cs) = if B.null c then fromChunks cs else Chunk c (fromChunks cs)

empty :: ByteString
empty = Empty

fromStrict :: B.ByteString -> ByteString
fromStrict c = if B.null c then Empty else Chunk c Empty

-- Copies: the chunks are separate arenas, and a caller asking for a strict
-- ByteString is asking for one arena.
toStrict :: ByteString -> B.ByteString
toStrict = B.concat . toChunks

singleton :: Word8 -> ByteString
singleton w = fromStrict (B.singleton w)

pack :: [Word8] -> ByteString
pack = fromStrict . B.pack

unpack :: ByteString -> [Word8]
unpack = P.concatMap B.unpack . toChunks

null :: ByteString -> Bool
null Empty = True
null (Chunk c r) = B.null c && null r

length :: ByteString -> Int
length = go 0
  where go n Empty = n
        go n (Chunk c r) = go (n + B.length c) r

head :: ByteString -> Word8
head Empty = error "Data.ByteString.Lazy.head: empty"
head (Chunk c r) = if B.null c then head r else B.head c

tail :: ByteString -> ByteString
tail Empty = error "Data.ByteString.Lazy.tail: empty"
tail (Chunk c r) = if B.length c <= 1 then r else Chunk (B.tail c) r

cons :: Word8 -> ByteString -> ByteString
cons w b = Chunk (B.singleton w) b

snoc :: ByteString -> Word8 -> ByteString
snoc b w = append b (singleton w)

append :: ByteString -> ByteString -> ByteString
append Empty b = b
append (Chunk c r) b = Chunk c (append r b)

concat :: [ByteString] -> ByteString
concat = P.foldr append Empty

take :: Int -> ByteString -> ByteString
take n _ | n <= 0 = Empty
take _ Empty = Empty
take n (Chunk c r) =
  let k = B.length c
  in if n < k then Chunk (B.take n c) Empty
              else Chunk c (take (n - k) r)

drop :: Int -> ByteString -> ByteString
drop n b | n <= 0 = b
drop _ Empty = Empty
drop n (Chunk c r) =
  let k = B.length c
  in if n < k then Chunk (B.drop n c) r else drop (n - k) r

-- One walk, not two: the reorder loop in a parser does this per packet.
splitAt :: Int -> ByteString -> (ByteString, ByteString)
splitAt n b | n <= 0 = (Empty, b)
splitAt _ Empty = (Empty, Empty)
splitAt n (Chunk c r) =
  let k = B.length c
  in if n < k then (Chunk (B.take n c) Empty, Chunk (B.drop n c) r)
     else let (x, y) = splitAt (n - k) r in (Chunk c x, y)

index :: ByteString -> Int -> Word8
index Empty _ = error "Data.ByteString.Lazy.index: out of range"
index (Chunk c r) i = if i < B.length c then B.index c i else index r (i - B.length c)

elem :: Word8 -> ByteString -> Bool
elem w = P.any (B.elem w) . toChunks

isPrefixOf :: ByteString -> ByteString -> Bool
isPrefixOf p b = B.isPrefixOf (toStrict p) (toStrict (take (length p) b))

-- The streaming part: a chunk is read when the consumer reaches it.
hGetContents :: Handle -> IO ByteString
hGetContents h = go
  where go = unsafeInterleaveIO $ do
               c <- B.hGet h chunkSize
               if B.null c then do { hClose h; return Empty }
                           else Chunk c <$> go

hGet :: Handle -> Int -> IO ByteString
hGet h n = fromStrict <$> B.hGet h n

hPut :: Handle -> ByteString -> IO ()
hPut h = P.mapM_ (B.hPut h) . toChunks

readFile :: FilePath -> IO ByteString
readFile p = openFile p ReadMode >>= hGetContents

getContents :: IO ByteString
getContents = hGetContents stdin

writeFile :: FilePath -> ByteString -> IO ()
writeFile p b = do { h <- openFile p WriteMode; hPut h b; hClose h }

appendFile :: FilePath -> ByteString -> IO ()
appendFile p b = do { h <- openFile p AppendMode; hPut h b; hClose h }
