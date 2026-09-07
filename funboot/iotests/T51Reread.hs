-- EXPECT: 206 206 206 206
module T51Reread(main) where
import Prelude
main :: IO ()
main = do
  let f = "../../lib/Data/Bool_Type.hs"
  a <- readFile f
  b <- readFile f
  c <- readFile f
  d <- readFile f
  putStrLn (show (length a) ++ " " ++ show (length b) ++ " " ++ show (length c) ++ " " ++ show (length d))
