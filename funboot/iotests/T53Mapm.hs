-- EXPECT: 123 6
module T53Mapm(main) where
import Prelude
import MicroHs.StateIO
step :: Int -> StateIO Int ()
step n = do
  liftIO (putStr (show n))
  modify (+ n)
main :: IO ()
main = do
  s <- execStateIO (mapM_ step [1,2,3::Int]) (0::Int)
  putStrLn (" " ++ show s)
