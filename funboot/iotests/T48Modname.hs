-- EXPECT: Data.Bool_Type
module T48Modname(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
import MicroHs.Ident
src :: String
src = "-- c\nmodule Data.Bool_Type(module Data.Bool_Type) where\nimport Prelude()\ndata Bool = False | True\n"
main :: IO ()
main =
  case parse pTop "T" src of
    Left e -> putStrLn ("parse error " ++ e)
    Right m -> case m of
                 EModule mn _ _ -> putStrLn (showIdent mn)
