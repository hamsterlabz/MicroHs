-- EXPECT: 1 one
module T59As(main) where
import Prelude
data M = M Int String
f :: Int -> String -> (Int, String)
f n s = let m@(M a b) = M n s in (a, b)
main :: IO ()
main = case f 1 "one" of (a, b) -> putStrLn (show a ++ " " ++ b)
