-- EXPECT: shown
module T90ShowTree(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx = 1\n" of
    Left err -> putStrLn ("parse error: " ++ err)
    Right m  -> putStrLn (seq (length (show m)) "shown")
