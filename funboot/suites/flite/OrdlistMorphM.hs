-- OrdlistMorphM.hs - Ordlist in the exp3_8m idiom.
--
-- Ordlist.hs writes the recursive call THREE times in one expression:
--     boolList (S n) = boolList n ++ map ((:) False) (boolList n)
--                                 ++ map ((:) True ) (boolList n)
-- and `top` calls boolList twice more.  Each occurrence is its own graph node,
-- so the subtree is rebuilt every time.  The Mendler algebra names the
-- recursive result once and uses it three times.

module OrdlistMorphM where

import Prelude()
import NanoPrelude

data Nat
  = S Nat
  | Z

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

implies False x = True
implies True  x = x

ord :: [Bool] -> Bool
ord = fix (\ rec xs ->
             case xs of
               []       -> True
               (x : ys) -> case ys of
                             []      -> True
                             (y : _) -> implies x y && rec ys)

ins :: Bool -> [Bool] -> [Bool]
ins x = fix (\ rec xs ->
               case xs of
                 []       -> [x]
                 (y : ys) -> if implies x y
                               then x : y : ys
                               else y : rec ys)

prop x xs = implies (ord xs) (ord (ins x xs))

boolList :: Nat -> [[Bool]]
boolList = fix (\ rec n ->
                  case n of
                    Z     -> [[]]
                    S m   -> let bs = rec m
                             in  bs ++ map ((:) False) bs ++ map ((:) True) bs)

top n = let bs = boolList n
        in  and (map (prop True) bs ++ map (prop False) bs)

main =
  let num = S (S (S (S Z)))
  in if top num
       then 1::Int
       else 0
