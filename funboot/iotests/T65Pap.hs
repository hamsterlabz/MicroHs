-- EXPECT: ok
module T65Pap(main) where
import Prelude
add3 :: Int -> Int -> Int -> Int
add3 a b c = a + b + c
main :: IO ()
main = seq (add3 1 2) (putStrLn "ok")
