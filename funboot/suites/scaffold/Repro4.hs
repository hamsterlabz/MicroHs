module Repro4(main) where
import Prelude
import MicroHs.Ident
import MicroHs.Expr(Lit(..))
import MicroHs.Exp
import qualified MicroHs.IdentMap as M

mkDefs :: Int -> [(Ident, Exp)]
mkDefs n = [ (mkIdent ("Mod.v" ++ show i), mkBody i) | i <- [1 .. n] ]
  where mkBody i | rem i 3 == 0 = Lit (LInt i)
                 | otherwise    = Lam (mkIdent "$q")
                                    (App (App (Var (mkIdent ("Mod.v" ++ show (rem i 7 * 3 + 3))))
                                              (Lit (LInt i)))
                                         (Var (mkIdent "$q")))

esz :: Exp -> Int
esz (App f a) = 1 + esz f + esz a
esz (Lam _ b) = 1 + esz b
esz _         = 1

-- the exact shape of inlineOnce
{-# LAZY run #-}
run :: Int -> [(Ident, Exp)] -> Int
run cap ds = sum [ esz (sub e) | (_, e) <- ds ]
  where
    bump m i = M.insert i (maybe (1::Int) (+1) (M.lookup i m)) m
    fvs  = [ (i, freeVars e) | (i, e) <- ds ]
    uses = foldl bump M.empty (concatMap snd fvs)
    isAtom (App _ _) = False
    isAtom (Lam _ _) = False
    isAtom _         = True
    cand = M.fromList [ (i, e) | (i, e) <- ds
                      , isAtom e || (M.lookup i uses == Just 1 && esz e <= cap)
                      , not (elem i (freeVars e)) ]
    sub (Var i)   = case M.lookup i cand of { Just e -> e ; Nothing -> Var i }
    sub (App f a) = App (sub f) (sub a)
    sub (Lam x b) = Lam x (sub b)
    sub e         = e

main :: IO ()
main = putStrLn ("r -> " ++ show (run 8 (mkDefs 40)))
