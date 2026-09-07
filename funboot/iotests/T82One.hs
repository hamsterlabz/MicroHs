-- EXPECT: D = ((<4,X(X(XX)),[0,3,2,1]> Y) +)
-- CWD: ../..
module T82One(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Compile
import MicroHs.CompileCache
import MicroHs.Flags
import MicroHs.Ident
main :: IO ()
main = do
  let flags = (defaultFlags ".") { paths = ["", "mhs", "src", "lib", "paths", "funboot"] }
  (rds, _, _) <- compileCacheTop flags (mkIdent "V1") emptyCache
  case rds of
    (_, ds) ->
      case [ e | (i, e) <- ds, unIdent i == "Primitives.primIntAdd" ] of
        (e : _) -> putStrLn ("D = " ++ show e)
        []      -> putStrLn "not found"
