module Put2(main) where
import Prelude()
import Primitives
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
main :: IO ()
main = primUnsafeCoerce (\ k -> prim_putb 65 (k ()))
