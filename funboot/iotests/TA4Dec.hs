-- EXPECT: 0 2 ab
module TA4Dec(main) where
import Prelude
dec :: String -> String
dec [] = []
dec (c : cs) = c : dec cs
main :: IO ()
main = do
  let e = dec (reverse [])
      t = dec (reverse "ba")
  putStrLn (show (length e) ++ " " ++ show (length t) ++ " " ++ t)
