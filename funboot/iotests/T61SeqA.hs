-- EXPECT: 1
module T61SeqA(main) where
import Prelude
data M = M Int String
f :: Int -> String -> Int
f n s = let m@(M a _) = M n s in seq m a
main :: IO ()
main = putStrLn (show (f 1 "one"))
