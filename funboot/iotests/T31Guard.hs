-- EXPECT: 30
module T31Guard(main) where
import Prelude
f :: Int -> Int -> Int
f a b
  | a + b <= 1 = 10
f 0 _ = 20
f _ _ = 30
main :: IO ()
main = putStrLn (show (f 5 5))
