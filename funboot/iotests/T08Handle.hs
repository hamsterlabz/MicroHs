-- EXPECT: line1
module T08Handle(main) where
import Prelude
import System.IO
main :: IO ()
main = do
  h <- openFile "t08.tmp" WriteMode
  hPutStrLn h "line1"
  hClose h
  g <- openFile "t08.tmp" ReadMode
  l <- hGetLine g
  hClose g
  putStrLn l
