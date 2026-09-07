-- EXPECT: x=5TIndentEOF
-- EXPECT: y=cTIndentEOF
-- EXPECT: z=""TIndentEOF
-- EXPECT: ok
module T98Str2(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
main :: IO ()
main = do
  putStrLn (concatMap L.showToken (L.lex (SLoc "T" 1 1) "x = 5\n"))
  putStrLn (concatMap L.showToken (L.lex (SLoc "T" 1 1) "y = c\n"))
  putStrLn (concatMap L.showToken (L.lex (SLoc "T" 1 1) "z = \"\"\n"))
  putStrLn "ok"
