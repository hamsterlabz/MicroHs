module Tiny(main) where
import Prelude()
import Primitives
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
main :: IO ()
main = primUnsafeCoerce (\ k -> prim_putb 84 (k ()))
