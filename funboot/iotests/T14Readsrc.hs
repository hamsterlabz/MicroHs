-- EXPECT: ok
module T14Readsrc(main) where
import Prelude
main :: IO ()
main = do
  s <- readFile "../../lib/Primitives.hs"
  putStrLn (if length s > 1000 then "ok" else "short")
