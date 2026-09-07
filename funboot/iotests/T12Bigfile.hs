-- EXPECT: 40000
module T12Bigfile(main) where
import Prelude
main :: IO ()
main = do
  writeFile "t12.tmp" (replicate 40000 (toEnum 97))
  s <- readFile "t12.tmp"
  putStrLn (show (length s))
