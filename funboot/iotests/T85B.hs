-- EXPECT: 31
module T85B(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx = \"abc\"\n" of
    Left err -> putStrLn ("parse error: " ++ err)
    Right m  -> putStrLn (show (length (show m)))
