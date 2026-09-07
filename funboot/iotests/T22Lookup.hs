-- EXPECT: 1
module T22Lookup(main) where
import Prelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main =
  case M.lookup (mkIdent "a") (M.singleton (mkIdent "a") (1::Int)) of
    Nothing -> putStrLn "none"
    Just v  -> putStrLn (show v)
