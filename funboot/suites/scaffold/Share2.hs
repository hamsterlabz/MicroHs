module Share2(main) where
import Prelude

expensive :: Int -> Int
expensive n = go n 0
  where go 0 acc = acc
        go k acc = go (k-1) (acc + k)

-- D: two syntactic uses, so a single-use splice cannot apply
useD :: Int -> Int
useD n = let x = expensive n
         in  if x > 0 then sum [ x | _ <- [1::Int .. 10] ] else x

-- E: top-level CAF, which must be one shared node
xtop :: Int
xtop = expensive 2000

useE :: Int -> Int
useE _ = sum [ xtop | _ <- [1::Int .. 10] ]

-- F: forced first, then used
useF :: Int -> Int
useF n = let x = expensive n
         in  seq x (sum [ x | _ <- [1::Int .. 10] ])

main :: IO ()
main = putStrLn ("E=" ++ show (useE 2000))
