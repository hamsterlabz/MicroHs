-- EXPECT: 1 one
module T57Nolet(main) where
import Prelude
data M = M Int String
f :: Int -> String -> (Int, String)
f n s = let M a b = M n s in (a, b)
main :: IO ()
main = case f 1 "one" of (a, b) -> putStrLn (show a ++ " " ++ b)
