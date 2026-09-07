-- EXPECT: 5/x="ab"TIndentEOF/ok
module T96Lex(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
main :: IO ()
main = do
  let ts = L.lex (SLoc "T" 1 1) "x = \"ab\"\n"
  putStrLn (show (length ts) ++ "/" ++ concatMap L.showToken ts ++ "/ok")
