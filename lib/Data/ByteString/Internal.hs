module Data.ByteString.Internal(module Data.ByteString.Internal) where
import Prelude(); import MiniPrelude hiding(length)
import Data.Word(Word8)
import Primitives(IOArray, primArrAlloc, primArrRead, primArrWrite, primArrSize,
                  primBSWriteByte, primBSReadByte,
                  primPerformIO, primBind, primReturn, primBSeqA, primBScmpA)

-- A ByteString is a PACKED arena: an array whose word 0 is the length and
-- whose following words hold one byte each.  It used to be a list of Word8,
-- which made every comparison a walk over cons cells in the graph -- and since
-- Ident carries a Text, Text is a ByteString, and the compiler compares
-- identifiers on every map lookup, that was the single hottest thing it did.
-- Equality and ordering are now runtime blobs that loop over the arena in
-- RISC-V (see bsBlobs in MicroHs.Main); everything else stays here.
newtype ByteString = BS (IOArray Word8)

bsLen :: forall a . [a] -> Int
bsLen = foldr (\ _ n -> n + 1) 0

primBSpack    :: [Word8] -> ByteString
primBSpack ws =
  BS (primPerformIO (primArrAlloc (bsLen ws) (0::Word8) `primBind` \ a ->
                     fill a 0 ws `primBind` \ _ -> primReturn a))
  where fill a i xs =
          case xs of
            []      -> primReturn ()
            y : ys  -> primBSWriteByte a i y `primBind` \ _ -> fill a (i+1) ys

primBSlength  :: ByteString -> Int
primBSlength (BS a) = primPerformIO (primArrSize a)

primBSindex   :: ByteString -> Int -> Word8
primBSindex (BS a) i = primPerformIO (primBSReadByte a i)

primBSunpack  :: ByteString -> [Word8]
primBSunpack bs = go 0
  where n = primBSlength bs
        go i = if i >= n then [] else primBSindex bs i : go (i+1)

-- Append copies arena to arena.  Going through lists here (pack . unpack)
-- rebuilds both operands as cons cells first, and the compiler appends
-- constantly -- every qualified identifier is a module name appended to a
-- name.
bsBlit :: IOArray Word8 -> Int -> ByteString -> Int -> IO ()
bsBlit dst at src n = go 0
  where go i = if i >= n then primReturn ()
               else primBSWriteByte dst (at+i) (primBSindex src i) `primBind` \ _ -> go (i+1)

primBSappend  :: ByteString -> ByteString -> ByteString
primBSappend a b =
  let la = primBSlength a; lb = primBSlength b in
  BS (primPerformIO (primArrAlloc (la+lb) (0::Word8) `primBind` \ d ->
                     bsBlit d 0  a la `primBind` \ _ ->
                     bsBlit d la b lb `primBind` \ _ -> primReturn d))
primBSappend3 :: ByteString -> ByteString -> ByteString -> ByteString
primBSappend3 a b c =
  let la = primBSlength a; lb = primBSlength b; lc = primBSlength c in
  BS (primPerformIO (primArrAlloc (la+lb+lc) (0::Word8) `primBind` \ d ->
                     bsBlit d 0       a la `primBind` \ _ ->
                     bsBlit d la      b lb `primBind` \ _ ->
                     bsBlit d (la+lb) c lc `primBind` \ _ -> primReturn d))

primBSEQ      :: ByteString -> ByteString -> Bool
primBSEQ (BS a) (BS b) = primBSeqA a b
primBSNE      :: ByteString -> ByteString -> Bool
primBSNE a b = not (primBSEQ a b)
primBScmp     :: ByteString -> ByteString -> Ordering
primBScmp (BS a) (BS b) = primBScmpA a b
primBSLT      :: ByteString -> ByteString -> Bool
primBSLT a b = case primBScmp a b of { LT -> True; _ -> False }
primBSLE      :: ByteString -> ByteString -> Bool
primBSLE a b = case primBScmp a b of { GT -> False; _ -> True }
primBSGT      :: ByteString -> ByteString -> Bool
primBSGT a b = case primBScmp a b of { GT -> True; _ -> False }
primBSGE      :: ByteString -> ByteString -> Bool
primBSGE a b = case primBScmp a b of { LT -> False; _ -> True }
primBSsubstr  :: ByteString -> Int -> Int -> ByteString
primBSsubstr bs offs len =
  BS (primPerformIO (primArrAlloc len (0::Word8) `primBind` \ d ->
                     go d 0 `primBind` \ _ -> primReturn d))
  where go d i = if i >= len then primReturn ()
                 else primBSWriteByte d i (primBSindex bs (offs+i)) `primBind` \ _ -> go d (i+1)

-----------------------------------------

instance Eq ByteString where
  (==) = primBSEQ
  (/=) = primBSNE

instance Ord ByteString where
  compare = primBScmp
  (<)     = primBSLT
  (<=)    = primBSLE
  (>)     = primBSGT
  (>=)    = primBSGE

instance Show ByteString where
  showsPrec p bs = showsPrec p (toString bs)

instance IsString ByteString where
  fromString = pack . map (toEnum . fromEnum)

instance Semigroup ByteString where
  (<>) = append

instance Monoid ByteString where
  mempty = empty

toString :: ByteString -> String
toString = map (toEnum . fromEnum) . unpack

empty :: ByteString
empty = pack []

singleton :: Word8 -> ByteString
singleton c = pack [c]

length :: ByteString -> Int
length = primBSlength

append :: ByteString -> ByteString -> ByteString
append = primBSappend

substr :: ByteString -> Int -> Int -> ByteString
substr bs offs len
  | offs < 0 || offs > sz     = bsError "substr bad offset"
  | len < 0  || len > sz-offs = bsError "substr bad length"
  | otherwise = primBSsubstr bs offs len
  where sz = length bs

bsError :: String -> a
bsError s = error $ "Data.ByteString." ++ s

pack :: [Word8] -> ByteString
pack = primBSpack

unpack :: ByteString -> [Word8]
unpack = primBSunpack

null :: ByteString -> Bool
null bs = length bs == 0
