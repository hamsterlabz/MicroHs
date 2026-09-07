-- EXPECT: ""|/""X/"a"Y
module T99Shows(main) where
import Prelude
data Tok = TS String | TI
sh :: Tok -> String
sh (TS s) = show s
sh TI = "|"
main :: IO ()
main = putStrLn (concatMap sh [TS "", TI] ++ "/"
                 ++ shows ("" :: String) "X" ++ "/"
                 ++ shows ("a" :: String) "Y")
