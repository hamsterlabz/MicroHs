-- EXPECT: 6000
module T15Concat(main) where
import Prelude
build :: Int -> String -> String
build 0 acc = acc
build n acc = build (n-1) (acc ++ "abc")
main :: IO ()
main = putStrLn (show (length (build 2000 "")))
