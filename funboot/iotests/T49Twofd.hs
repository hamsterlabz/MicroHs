-- EXPECT: 206 206
module T49Twofd(main) where
import Prelude
import System.IO
main :: IO ()
main = do
  h <- openFile "../../lib/Data/Bool_Type.hs" ReadMode
  t <- readFile "../../lib/Data/Bool_Type.hs"
  s <- hGetContents h
  putStrLn (show (length t) ++ " " ++ show (length s))
