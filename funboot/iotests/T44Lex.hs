-- EXPECT: lexed
module T44Lex(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
main :: IO ()
main = do
  let ts = L.lex (SLoc "T" 1 1) "x = 1\n"
  putStrLn (if length ts > 0 then "lexed" else "empty")
