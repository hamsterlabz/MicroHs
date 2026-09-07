-- EXPECT: roundtrip ok
module T07Filewrite(main) where
import Prelude
main :: IO ()
main = do
  writeFile "t07.tmp" "roundtrip ok"
  s <- readFile "t07.tmp"
  putStrLn s
