-- EXPECT: 20 2
module T46Stateio(main) where
import Prelude
import MicroHs.StateIO
prog :: StateIO Int Int
prog = do
  modify (+ 1)
  n <- get
  liftIO (putStr "")
  modify (+ n)
  m <- get
  return (m * 10)
main :: IO ()
main = do
  as <- runStateIO prog (0::Int)
  case as of
    (a, s) -> putStrLn (show a ++ " " ++ show s)
