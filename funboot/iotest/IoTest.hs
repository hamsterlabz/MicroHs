module IoTest(main) where
import qualified Prelude(); import MHSPrelude
import System.IO
import System.Environment

-- Exercises every file/argv primitive the bootstrap needs, one at a time, so a
-- failure names the mechanism instead of surfacing as "the compiler is wrong":
--   io.argc / io.argsel / io.argrd  (getArgs)
--   io.pathc / io.open / io.getbf / io.close  (readFile)
--   io.pathc / io.open / io.setfd / io.putbf  (writeFile)
main :: IO ()
main = do
  as <- getArgs
  putStrLn ("argc " ++ show (length as))
  mapM_ (\ a -> putStrLn ("arg [" ++ a ++ "]")) as
  s <- readFile "iotest.in"
  putStrLn ("read " ++ show (length s))
  putStrLn ("head " ++ take 20 s)
  writeFile "iotest.out" s
  t <- readFile "iotest.out"
  putStrLn (if t == s then "roundtrip ok" else "roundtrip MISMATCH")
