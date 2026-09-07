-- EXPECT: 3
module T33Tmap3(main) where
import Prelude
import qualified TMap as M
main :: IO ()
main = putStrLn (show (M.size (M.fromList [(1::Int, 10::Int), (2, 20), (3, 30)])))
