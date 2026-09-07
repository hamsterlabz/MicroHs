module Mix(main) where
import Prelude
import Primitives
import System.IO
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
putI :: Int -> IO ()
putI c = primUnsafeCoerce (\ k -> prim_putb c (k ()))
main :: IO ()
main = primThen (putI 88) (primThen (hPutChar stdout (toEnum 65)) (primThen (putI 89) (putI 10)))
