-- EXPECT: ["alpha","beta"]
-- ARGS: alpha beta
module T05Args(main) where
import Prelude
import System.Environment
main :: IO ()
main = do
  as <- getArgs
  putStrLn (show as)
