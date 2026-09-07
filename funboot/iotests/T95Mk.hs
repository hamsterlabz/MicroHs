-- EXPECT: shown
module T95Mk(main) where
import Prelude
import MicroHs.Expr
import MicroHs.Ident
main :: IO ()
main = do
  let loc = SLoc "T" 1 1
      e = mkEStr loc "ab"
  putStrLn (seq (length (show e)) "shown")
