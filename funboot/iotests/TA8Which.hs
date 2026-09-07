-- EXPECT: 5 TString
module TA8Which(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
kind :: L.Token -> String
kind t = case t of
           L.TString _ _ -> "TString"
           L.TIdent _ _ _ -> "TIdent"
           L.TSpec _ _ -> "TSpec"
           L.TInt _ _ -> "TInt"
           _ -> "other"
main :: IO ()
main = do
  let ts = L.lex (SLoc "T" 1 1) "z = \"\"\n"
  putStrLn (show (length ts) ++ " " ++ kind (ts !! 2))
