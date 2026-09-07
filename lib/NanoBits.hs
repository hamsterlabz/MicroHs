-- NanoBits.hs - integer bitwise operations for the nano dialect.
-- The primitives already exist and the fun backend already has blobs for them
-- (_prim_and/_prim_or/_prim_xor/_prim_sll/_prim_srl); Data.Bits only reaches
-- them through the full-Prelude class hierarchy, which the nano dialect does
-- not have. This is the nano-visible door, same idea as NanoArray.
module NanoBits(andI, orI, xorI, shlI, shrI) where
import Prelude()
import Primitives(Int)

andI :: Int -> Int -> Int
andI = primitive "and"
orI :: Int -> Int -> Int
orI = primitive "or"
xorI :: Int -> Int -> Int
xorI = primitive "xor"
shlI :: Int -> Int -> Int
shlI = primitive "shl"
shrI :: Int -> Int -> Int
shrI = primitive "shr"
