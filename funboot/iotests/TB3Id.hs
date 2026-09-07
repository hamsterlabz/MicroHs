-- EXPECT: 0/0/2/2
module TB3Id(main) where
import Prelude
dec :: String -> String
dec [] = []
dec (c : cs) = c : dec cs
main :: IO ()
main = putStrLn (show (length (id ([] :: String))) ++ "/"
                 ++ show (length (dec $ id $ reverse ([] :: String))) ++ "/"
                 ++ show (length (dec $ id $ reverse ("ab" :: String))) ++ "/"
                 ++ show (length (id ("ab" :: String))))
