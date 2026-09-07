-- EXPECT: 3
module T28Mhsp(main) where
import Prelude(); import MHSPrelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.fromList [(mkIdent "a", 1::Int), (mkIdent "b", 2), (mkIdent "c", 3)])))
