-- EXPECT: 705082704
module T13Deeprec(main) where
import Prelude
main :: IO ()
main = putStrLn (show (sum [1..100000::Int]))   -- 32-bit Int: wraps
