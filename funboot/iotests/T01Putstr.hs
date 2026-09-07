-- EXPECT: hello
module T01Putstr(main) where
import Prelude
main :: IO ()
main = putStrLn "hello"
