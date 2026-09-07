-- EXPECT: parsed 3
module T85A(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx = \"abc\"\n" of
    Left err -> putStrLn ("parse error: " ++ err)
    Right m  -> seq m (putStrLn "parsed 3")
