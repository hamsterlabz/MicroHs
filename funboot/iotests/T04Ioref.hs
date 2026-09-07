-- EXPECT: 7
module T04Ioref(main) where
import Prelude
import Data.IORef
main :: IO ()
main = do
  r <- newIORef (3::Int)
  writeIORef r 7
  v <- readIORef r
  putStrLn (show v)
