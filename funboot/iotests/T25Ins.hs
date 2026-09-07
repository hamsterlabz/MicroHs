-- EXPECT: 2
module T25Ins(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.insert (mkIdent "b") (2::Int) (M.singleton (mkIdent "a") 1))))
