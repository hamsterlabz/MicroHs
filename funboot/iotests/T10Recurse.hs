-- EXPECT: 500500
module T10Recurse(main) where
import Prelude
main :: IO ()
main = putStrLn (show (sum [1..1000::Int]))
