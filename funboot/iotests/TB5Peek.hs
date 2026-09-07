-- EXPECT: []/[97]
module TB5Peek(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
pay :: [L.Token] -> Int -> String
pay ts i = case ts !! i of
             L.TString _ s -> s
             _ -> "?"
main :: IO ()
main = do
  let a = pay (L.lex (SLoc "T" 1 1) "\"\"") 0
  let b = pay (L.lex (SLoc "T" 1 1) "\"a\"") 0
  putStrLn (show (map fromEnum (take 4 a)) ++ "/" ++ show (map fromEnum (take 4 b)))
