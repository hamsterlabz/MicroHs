-- EXPECT: 3
-- ARGS: alpha beta
module TD1Argc(main) where
import Prelude()
import Primitives
prim_argc :: forall a . (Int -> a) -> a
prim_argc = primitive "io.argc"
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
main :: IO ()
main = primUnsafeCoerce (\ k -> prim_argc (\ n -> prim_putb (primIntAdd 48 n) (prim_putb 10 (k ()))))
