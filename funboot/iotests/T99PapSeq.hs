-- EXPECT: 42
-- seq forcing a PARTIAL APPLICATION: add3 1 2 is under-applied, so its WHNF is
-- an under-applied combinator. seq must return its second argument, not diverge.
module T99PapSeq(main) where
import Prelude
add3 :: Int -> Int -> Int -> Int
add3 a b c = a + b + c
main :: IO ()
main = putStrLn (show (seq (add3 1 2) 42))
