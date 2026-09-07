-- EXPECT: 0
module T20Empty(main) where
import Prelude
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.empty :: M.Map Int)))
