-- EXPECT: 0 0 True/2 2 True
module TA2Cmp(main) where
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
      s0 = strOf (ts !! 2)
      ts2 = L.lex (SLoc "T" 1 1) "z = \"ab\"\n"
      s2 = strOf (ts2 !! 2)
  putStrLn (show (length s0) ++ " " ++ show (length ("" :: String))
            ++ " " ++ show (s0 == "") ++ "/"
            ++ show (length s2) ++ " " ++ show (length ("ab" :: String))
            ++ " " ++ show (s2 == "ab"))
