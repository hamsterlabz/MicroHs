-- EXPECT: <1,X,[0]>
-- EXPECT: ((<3,X(XX),[0,2,1]> (io.putb #84)) <2,X,[0]>)
-- EXPECT: ((((<5,X(XX(XXX)),[0,4,1,4,2,3]> Y) #2) #1) +)
-- EXPECT: done
module T67Abs(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Ident
import MicroHs.Abstract
main :: IO ()
main = do
  let k = mkIdent "k"; x = mkIdent "x"; y = mkIdent "y"
      e1 = Lam x (Lam y (App (Var x) (Var y)))
      e2 = Lam k (App (App (Lit (LPrim "io.putb")) (Lit (LInt 84)))
                      (App (Var k) (Lit (LPrim "K"))))
      e3 = Lam x (App (App (Lit (LPrim "+")) (App (Var x) (Lit (LInt 1))))
                      (App (Var x) (Lit (LInt 2))))
  putStrLn (show (compileOpt True e1))
  putStrLn (show (compileOpt True e2))
  putStrLn (show (compileOpt True e3))
  putStrLn "done"
