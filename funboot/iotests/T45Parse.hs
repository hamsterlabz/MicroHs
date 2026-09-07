-- EXPECT: parsed
module T45Parse(main) where
import Prelude
import MicroHs.Parse
main :: IO ()
main =
  case parse pTop "T" "module M(x) where\nx :: Int\nx = 1\n" of
    Left e  -> putStrLn ("error " ++ e)
    Right _ -> putStrLn "parsed"
