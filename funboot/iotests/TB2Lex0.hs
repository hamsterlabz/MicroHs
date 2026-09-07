-- EXPECT: got
module TB2Lex0(main) where
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
      n = length (strOf (ts !! 2))
  putStrLn (if n == 0 then "got" else "n=" ++ show n)
