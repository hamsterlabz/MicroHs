-- EXPECT: shown
module T91E(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx = \"\"\n" of
    Left err -> putStrLn ("parse error: " ++ err)
    Right m  -> putStrLn (seq (length (show m)) "shown")
