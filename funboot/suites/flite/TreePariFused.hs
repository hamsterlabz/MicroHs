-- TreePariFused.hs - TreePari fully restructured.
--
-- pariWhere p (mkTree n) is again build-then-consume.  Fused over the depth,
-- and the two identical children share one parity, so each level is one step
-- instead of two subtrees.

module TreePariFused where

import Prelude()
import NanoPrelude

data Parity = Odd | Even

xor :: Parity -> Parity -> Parity
xor a b = case a of
            Odd  -> case b of
                      Odd  -> Even
                      Even -> Odd
            Even -> case b of
                      Odd  -> Odd
                      Even -> Even

-- withTwoLeaf is True exactly at depth 1 (Node Leaf Leaf)
hereP :: Int -> Parity
hereP n = if n == 1 then Odd else Even

pariOf :: Int -> Parity
pariOf n = if n == 0
             then Even                      -- p Leaf = False
             else let s = pariOf (n - 1)
                  in  xor (xor s s) (hereP n)

peek :: Parity -> Int
peek Even = 42
peek _    = 0

main :: Int
main = peek (pariOf 10)
