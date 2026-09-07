-- EXPECT: True False True True
module T76ExpEq(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
main :: IO ()
main = do
  let e1 = App (Lit (LInt 3)) (Lit (LPrim "K"))
      e2 = App (Lit (LInt 4)) (Lit (LPrim "K"))
  putStrLn (show (e1 == e1) ++ " " ++ show (e1 == e2) ++ " "
            ++ show (Lit (LInt 3) == Lit (LInt 3)) ++ " "
            ++ show (Sc 3 X [0,1] == Sc 3 X [0,1]))
