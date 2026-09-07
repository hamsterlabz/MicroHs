-- EXPECT: #3
-- EXPECT: 'a'
-- EXPECT: "abc"
-- EXPECT: +
-- EXPECT: ok
module T94ShowLit(main) where
import Prelude
import MicroHs.Expr
main :: IO ()
main = do
  putStrLn (showLit (LInt 3))
  putStrLn (showLit (LChar (toEnum 97)))
  putStrLn (showLit (LStr "abc"))
  putStrLn (showLit (LPrim "+"))
  putStrLn "ok"
