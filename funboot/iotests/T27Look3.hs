-- EXPECT: Just 2
module T27Look3(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.lookup (mkIdent "b") (M.fromList [(mkIdent "a", 1::Int), (mkIdent "b", 2), (mkIdent "c", 3)])))
