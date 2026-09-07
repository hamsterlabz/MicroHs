-- EXPECT: ok
module T18Words(main) where
import Prelude
main :: IO ()
main = do
  s <- readFile "../../lib/Primitives.hs"
  let ws = words s
      ls = lines s
  putStrLn (if length ws > 100 && length ls > 50 then "ok" else "short")
