module Rep1 where
import Prelude()
import NanoPrelude

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

repeatL :: a -> [a]
repeatL x = x : repeatL x

main :: Int
main = sum (takeL 3 (repeatL 7))
