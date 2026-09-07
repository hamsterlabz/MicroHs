module ReadT(main) where
import System.IO
-- Bisect the file-read path: which step costs the time, open or the read
-- itself.  Each marker is printed before the step it names.
main :: IO ()
main = do
  putStrLn "A: before openFile"
  h <- openFile "/DATA.TXT" ReadMode
  putStrLn "B: opened"
  s <- hGetContents h
  putStrLn "C: hGetContents returned"
  putStrLn ("D: len " ++ show (length s))
