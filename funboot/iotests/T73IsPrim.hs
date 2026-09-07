-- EXPECT: True False False True
module T73IsPrim(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Expr(Lit(..))
isPrimT :: String -> Exp -> Bool
isPrimT s ae =
  case ae of
    Lit (LPrim ss) -> s == ss
    _ -> False
main :: IO ()
main = putStrLn (show (isPrimT "K" (Lit (LPrim "K"))) ++ " "
              ++ show (isPrimT "K" (Lit (LInt 3))) ++ " "
              ++ show (isPrimT "K" (Lit (LPrim "S"))) ++ " "
              ++ show (isPrimT "K2" (Lit (LPrim "K2"))))
