-- Common.hs — shared utilities for the GADT benchmark suite, ported to the
-- KappaMutor (NanoPrelude / Int-only) dialect.  W is Int (the machine's 29-bit
-- integer); bitwise ops come from GExtra (hardware ALU opcodes).  Re-exports
-- GExtra so the per-structure modules get xor / .&. / .|. / shiftR by importing
-- Common, exactly as they used to get them from Data.Bits.
module Common
  ( module Common
  , module GExtra
  ) where

import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import GExtra

type W = Int

-- Linear-congruential PRNG (Numerical Recipes constants).
lcgNext :: W -> W
lcgNext s = s * 1664525 + 1013904223

lcgRange :: W -> W -> (W, W)
lcgRange s n =
  let s' = lcgNext s
      v  = s' `umod` (if n == 0 then 1 else n)   -- unsigned, matches C gadt_lcg_range
  in  (v, s')

-- 32-bit hash-mix (xorshift32 flavour).
hashMix :: W -> W -> W
hashMix h v =
  let a = h `xor` v
      b = a * 0x85ebca6b
      c = b `xor` (b `shiftR` 13)
      d = c * 0xc2b2ae35
  in  d `xor` (d `shiftR` 16)

-- Outer-loop driver.
benchFold :: Int -> (Int -> W -> W) -> W
benchFold n step = go 0 0xC0FFEE
  where
    go i acc
      | i >= n    = acc
      | otherwise = go (i + 1) (step i acc)

mul3plus1 :: W -> W
mul3plus1 x = x * 3 + 1

evenW :: W -> Bool
evenW x = (x .&. 1) == 0

addW :: W -> W -> W
addW a b = a + b

xorW :: W -> W -> W
xorW a b = a `xor` b
