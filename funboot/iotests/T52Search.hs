-- EXPECT: 206 206
module T52Search(main) where
import Prelude
import System.IO
main :: IO ()
main = do
  let f = "../../lib/Data/Bool_Type.hs"
  m1 <- openFileM "mhs/Data/Bool_Type.hs" ReadMode
  m2 <- openFileM "src/Data/Bool_Type.hs" ReadMode
  h  <- openFile f ReadMode
  t  <- readFile f
  s  <- hGetContents h
  putStrLn (show (length t) ++ " " ++ show (length s))
