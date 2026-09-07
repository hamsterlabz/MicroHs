-- EXPECT: 2
module T24Fl2(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.fromList [(mkIdent "a", 1::Int), (mkIdent "b", 2)])))
