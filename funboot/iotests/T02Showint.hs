-- EXPECT: 42
module T02Showint(main) where
import Prelude
main :: IO ()
main = putStrLn (show (40 + 2 :: Int))
