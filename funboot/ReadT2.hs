module ReadT2(main) where
import System.IO
-- The compile died right after the SECOND module's open: read one file to
-- completion, then open and read another, which is the shape mhs has when it
-- finishes NanoPrelude and turns to Primitives. With the trigger forced low a
-- collection lands in that window every time.
main :: IO ()
main = do
  a <- readFile "/DATA.TXT"
  putStrLn ("A len " ++ show (length a))
  b <- readFile "/DATA2.TXT"
  putStrLn ("B len " ++ show (length b))
  putStrLn "done"
