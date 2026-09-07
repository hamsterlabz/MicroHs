-- EXPECT: ok
module T84StrLit(main) where
import Prelude
import MicroHs.Parse
import MicroHs.Expr
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx :: Int\nx = primitive \"+\"\n" of
    Left err -> putStrLn ("parse error: " ++ err)
    Right m  -> do
      let s = show m
      putStrLn (if not (null [ () | c <- s, c == toEnum 43 ]) then "ok"
                else "PLUS LOST: " ++ take 200 s)
