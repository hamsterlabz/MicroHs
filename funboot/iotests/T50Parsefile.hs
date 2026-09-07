-- EXPECT: Data.Bool_Type
module T50Parsefile(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
import MicroHs.Ident
main :: IO ()
main = do
  s <- readFile "../../lib/Data/Bool_Type.hs"
  case parse pTop "T" s of
    Left e -> putStrLn ("parse error: " ++ e)
    Right m -> case m of
                 EModule mn _ _ -> putStrLn (showIdent mn)
