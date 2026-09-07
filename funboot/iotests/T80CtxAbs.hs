-- EXPECT: probe ((<4,X(X(XX)),[0,3,2,1]> Y) +)
module T80CtxAbs(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Abstract
import MicroHs.Compile
import MicroHs.CompileCache
import MicroHs.Flags
import MicroHs.Ident
main :: IO ()
main = do
  let flags = (defaultFlags ".") { paths = ["", "../../mhs", "../../src", "../../lib", "../../paths", ".."] }
  (rds, _, _) <- compileCacheTop flags (mkIdent "V1") emptyCache
  case rds of
    (_, ds) -> putStrLn ("probe" ++ replicate (length ds - length ds) (toEnum 32)
                         ++ " " ++ show (compileOpt False (Lit (LPrim "+"))))
