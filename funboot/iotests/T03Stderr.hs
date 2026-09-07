-- EXPECT: out
module T03Stderr(main) where
import Prelude
import System.IO
main :: IO ()
main = do
  hPutStrLn stderr "err"
  hPutStrLn stdout "out"
