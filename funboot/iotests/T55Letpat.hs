-- EXPECT: 1 one 2 two
module T55Letpat(main) where
import Prelude
data M = M Int String
f :: Int -> String -> (Int, String)
f n s = let m@(M a b) = M n s in seq m (a, b)
main :: IO ()
main =
  case f 1 "one" of
    (a1, b1) -> case f 2 "two" of
      (a2, b2) -> putStrLn (show a1 ++ " " ++ b1 ++ " " ++ show a2 ++ " " ++ b2)
