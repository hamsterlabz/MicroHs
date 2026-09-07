-- EXPECT: A0 B1 C0
module TB4Bare(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
pay :: [L.Token] -> Int -> String
pay ts i = case ts !! i of
             L.TString _ s -> s
             _ -> "?"
nullN :: String -> String
nullN s = case s of { [] -> "0" ; (_ : _) -> "1" }
main :: IO ()
main = do
  let a = L.lex (SLoc "T" 1 1) "\"\""
      b = L.lex (SLoc "T" 1 1) "\"a\""
      c = L.lex (SLoc "T" 1 1) "\"\"\n"
  putStrLn ("A" ++ nullN (pay a 0) ++ " B" ++ nullN (pay b 0) ++ " C" ++ nullN (pay c 0))
