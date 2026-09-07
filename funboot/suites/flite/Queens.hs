module Queens where

import Prelude()
import NanoPrelude
{-# LAZY gen1 #-}

nsoln nq = length (gen nq nq)

gen nq n =
  if n == 0
    then [[]]
    else concatMap (gen1 nq) (gen nq (n - 1))

gen1 nq b = concatMap (gen2 b) (toOne nq)

gen2 b q = if safe q 1 b
             then [q : b]
             else []

safe x d [] = True
safe x d (q : l) =
  (x /= q)   &&
  (x /= q + d) &&
  (x /= q - d) &&
  safe x (d + 1) l

toOne n = if n == 1
            then [1::Int]
            else n : toOne (n - 1)

-- Small main
main = nsoln 6

-- Large main
-- main = nsoln 11
