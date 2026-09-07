-- EXPECT: 1 one
module T58Case(main) where
import Prelude
data M = M Int String
f :: Int -> String -> (Int, String)
f n s = case M n s of M a b -> (a, b)
main :: IO ()
main = case f 1 "one" of (a, b) -> putStrLn (show a ++ " " ++ b)
