-- EXPECT: 3000
module T16C1000(main) where
import Prelude
build :: Int -> String -> String
build 0 acc = acc
build n acc = build (n-1) (acc ++ "abc")
main :: IO ()
main = putStrLn (show (length (build 1000 "")))
