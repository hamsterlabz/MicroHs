-- BraunMorphM.hs - Braun written in the exp3_8m idiom: every recursion is a
-- Mendler catamorphism tied with Fix, the recursive result named by the
-- algebra.  Same algorithm as Braun.hs -- this one is already a divide and
-- conquer with `unravel` binding its recursive result once, so there is no
-- re-walked accumulator for the idiom to remove.

module BraunMorphM where

import Prelude()
import NanoPrelude

data Tree
  = Branch Int Tree Tree
  | Empty

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

unravel :: [Int] -> ([Int], [Int])
unravel = fix (\ rec xs ->
                 case xs of
                   []       -> ([], [])
                   (y : ys) -> case rec ys of
                                 (odds, evens) -> (y : evens, odds))

fromList' :: [Int] -> Tree
fromList' = fix (\ rec xs ->
                   case xs of
                     []       -> Empty
                     (y : ys) -> case unravel ys of
                                   (odds, evens) -> Branch y (rec odds) (rec evens))

ilv :: [Int] -> [Int] -> [Int]
ilv = fix (\ rec xs ->
             \ ys -> case xs of
                       []       -> ys
                       (a : as) -> case ys of
                                     []       -> a : as
                                     (b : bs) -> a : b : rec as bs)

toList :: Tree -> [Int]
toList = fix (\ rec t ->
                case t of
                  Empty          -> []
                  Branch x t0 t1 -> x : ilv (rec t0) (rec t1))

equal :: [Int] -> [Int] -> Bool
equal = fix (\ rec xs ->
               \ ys -> case xs of
                         []       -> case ys of
                                       []      -> True
                                       (_ : _) -> False
                         (a : as) -> case ys of
                                       []       -> False
                                       (b : bs) -> case (==) a b of
                                                     False -> False
                                                     True  -> rec as bs)

prop xs = equal xs (toList (fromList' xs))

int True = 1::Int
int False = 0::Int

main = int (all prop (replicate 2 (enumFromTo 0 255)))
