-- EXPECT: 3 Just 2
module T17Identmap(main) where
import Prelude(); import MHSPrelude
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
main :: IO ()
main = do
  let m = M.fromList [(mkIdent "a", 1::Int), (mkIdent "b", 2), (mkIdent "c", 3)]
  putStrLn (show (M.size m) ++ " " ++ show (M.lookup (mkIdent "b") m))
