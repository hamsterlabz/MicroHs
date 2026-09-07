-- EXPECT: 3
module T26Fl3(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.fromList [(mkIdent "a", 1::Int), (mkIdent "b", 2), (mkIdent "c", 3)])))
