-- Crc32.hs - mirrors benches/crc32.ml of min-caml-hs: the standard reflected
-- CRC-32, table driven, over 50000 bytes of the same generator.  Integer and
-- bit operations only.  1748744776.
module Crc32(main) where
import Prelude
import Data.IOArray
import Data.Bits

nbytes :: Int
nbytes = 50000

msk :: Int
msk = 4294967295

ent :: Int -> Int -> Int
ent c k = if k >= 8 then c
          else if c .&. 1 == 1 then ent (3988292384 `xor` shiftR c 1) (k+1)
                               else ent (shiftR c 1) (k+1)

main :: IO ()
main = do
  tbl <- newIOArray 256 (0::Int)
  let mktbl i = if i >= 256 then return () else writeIOArray tbl i (ent i 0) >> mktbl (i+1)
      crc i seed c =
        if i >= nbytes then return c
        else let s = (seed * 3877 + 29573) `rem` 139968
                 b = s .&. 255
             in do t <- readIOArray tbl ((c `xor` b) .&. 255)
                   crc (i+1) s ((t `xor` (shiftR c 8 .&. 16777215)) .&. msk)
  mktbl 0
  c <- crc 0 1 msk
  putStrLn (show (c `xor` msk))
