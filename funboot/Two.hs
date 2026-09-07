module Two(main) where
import Prelude()
import Primitives
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
putI :: Int -> IO ()
putI c = primUnsafeCoerce (\ k -> prim_putb c (k ()))
main :: IO ()
main = primThen (putI 65) (primThen (putI 66) (putI 10))
