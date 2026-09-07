-- EXPECT: ab [1,2] 3
module T54Mapm2(main) where
import Prelude
import MicroHs.StateIO
one :: (Int, String) -> StateIO Int Int
one p = case p of
  (n, s) -> do
    liftIO (putStr s)
    modify (+ 1)
    return n
main :: IO ()
main = do
  r <- runStateIO (mapM one [(1::Int,"a"), (2,"b")]) (1::Int)
  case r of
    (xs, st) -> putStrLn (" " ++ show xs ++ " " ++ show st)
