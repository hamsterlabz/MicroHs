-- EXPECT: True False LT
module T06Streq(main) where
import Prelude
main :: IO ()
main = putStrLn (show ("abc" == "abc") ++ " " ++ show ("abc" == "abd") ++ " " ++ show (compare "abc" "abd"))
