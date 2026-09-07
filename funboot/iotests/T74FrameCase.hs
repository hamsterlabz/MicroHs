-- EXPECT: 7 107
module T74FrameCase(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Ident
walk :: Exp -> Int
walk e = case e of
  App a b -> walk a + walk b
  Lit (LInt n) -> n
  _ -> 100
main :: IO ()
main = do
  let e = App (Lit (LInt 3)) (Lit (LInt 4))
      f = App e (Var (mkIdent "z"))
  putStrLn (show (walk e) ++ " " ++ show (seq (walk f) (walk f)))
