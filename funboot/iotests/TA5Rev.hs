-- EXPECT: 0 2
module TA5Rev(main) where
import Prelude
main :: IO ()
main = do
  let e = reverse ([] :: String)
      t = reverse ("ba" :: String)
  putStrLn (show (length e) ++ " " ++ show (length t))
