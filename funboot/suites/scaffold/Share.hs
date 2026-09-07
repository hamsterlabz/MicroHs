module Share(main) where
import Prelude

expensive :: Int -> Int
expensive n = go n 0
  where go 0 acc = acc
        go k acc = go (k-1) (acc + k)

-- A: value used once
useA :: Int -> Int
useA n = let x = expensive n in x

-- B: let-bound value used inside a comprehension over 10 elements
useB :: Int -> Int
useB n = let x = expensive n in sum [ x | _ <- [1::Int .. 10] ]

-- C: where-bound value used inside a lambda applied 10 times
useC :: Int -> Int
useC n = sum (map f [1::Int .. 10])
  where x   = expensive n
        f _ = x

main :: IO ()
main = putStrLn ("C=" ++ show (useC 2000))
