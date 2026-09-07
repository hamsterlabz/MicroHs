-- EXPECT: 200000
module TL1Pure(main) where
import Prelude
go :: Int -> Int -> Int
go 0 acc = acc
go n acc = go (n - 1) (acc + length [n, n])
main :: IO ()
main = putStrLn (show (go 100000 0))
