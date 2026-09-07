-- EXPECT: ((<4,X(X(XX)),[0,3,2,1]> Y) +)
module T79PlusSc(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Abstract
main :: IO ()
main = putStrLn (show (compileOpt False (Lit (LPrim "+"))))
