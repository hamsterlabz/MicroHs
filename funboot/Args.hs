module Args(main) where
import System.Environment
main :: IO ()
main = do
  as <- getArgs
  putStrLn ("argc=" ++ show (length as))
  mapM_ putStrLn as
