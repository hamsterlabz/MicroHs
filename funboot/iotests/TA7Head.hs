-- EXPECT: null
module TA7Head(main) where
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
      s = strOf (ts !! 2)
  putStrLn (case s of { [] -> "null" ; (c : _) -> "cons " ++ show c })
