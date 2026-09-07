-- EXPECT: ((<4,X(X(XX)),[0,3,2,1]> Y) +)
-- EXPECT: <2,XX,[1,0]>
-- EXPECT: <2,XX,[1,0]>
-- EXPECT: <3,XX,[2,0]>
-- EXPECT: <3,XX,[2,1]>
-- EXPECT: <4,XX,[3,0]>
-- EXPECT: <4,XX,[3,1]>
-- EXPECT: <4,XX,[3,2]>
-- EXPECT: ((<4,X(X(XX)),[0,3,2,1]> Y) +)
-- EXPECT: ok
module T78Seq2(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
import MicroHs.Ident
import MicroHs.Abstract
mkCon :: Int -> Int -> Exp
mkCon n i =
  let vs = [mkIdent ("x" ++ show k) | k <- [0..n-1]]
      f  = mkIdent "f"
  in foldr Lam (Lam f (foldl App (Var f) [Var (vs !! i)])) vs
main :: IO ()
main = do
  let r1 = show (compileOpt True (Lit (LPrim "+")))
  putStrLn r1
  -- the same shapes the compiler abstracts first: Scott constructors
  mapM_ (\ (n,i) -> putStrLn (show (compileOpt True (mkCon n i))))
        [(1,0),(1,0),(2,0),(2,1),(3,0),(3,1),(3,2)]
  let r2 = show (compileOpt True (Lit (LPrim "+")))
  putStrLn r2
  putStrLn (if r1 == r2 then "ok" else "MISMATCH")
