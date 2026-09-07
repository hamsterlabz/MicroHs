-- EXPECT: 2
module T34Tmap2(main) where
import Prelude
import qualified TMap as M
main :: IO ()
main = putStrLn (show (M.size (M.fromList [(1::Int, 10::Int), (2, 20)])))
