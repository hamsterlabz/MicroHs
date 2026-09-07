-- EXPECT: 1 done
module T68Tsc(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Ident
import MicroHs.ExpPrint
main :: IO ()
main = do
  let k = mkIdent "k"
      mn = mkIdent "M.main"
      e2 = Lam k (App (App (Lit (LPrim "io.putb")) (Lit (LInt 84)))
                      (App (Var k) (Lit (LPrim "K"))))
  case toStringCMdl (mn, [(mn, e2)]) of
    (n, s) -> putStrLn (show n ++ " done")
