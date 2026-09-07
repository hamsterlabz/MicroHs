-- EXPECT: 1
module T21Single(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = putStrLn (show (M.size (M.singleton (mkIdent "a") (1::Int))))
