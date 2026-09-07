-- EXPECT: 0
module TA3Len(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
strOf :: L.Token -> String
strOf t = case t of
            L.TString _ s -> s
            _ -> "?"
main :: IO ()
main = do
  let ts = L.lex (SLoc "T" 1 1) "z = \"\"\n"
  putStrLn (show (length (strOf (ts !! 2))))
