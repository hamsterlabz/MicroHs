-- EXPECT: 0/42/0/7
module TB1Zero(main) where
import Prelude
main :: IO ()
main = putStrLn (show (0 :: Int) ++ "/" ++ show (42 :: Int) ++ "/"
                 ++ show (length ("" :: String)) ++ "/" ++ show (length ("abcdefg" :: String)))
