module Arr(main) where
import Prelude()
import Primitives
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
putI :: Int -> IO ()
putI c = primUnsafeCoerce (\ k -> prim_putb c (k ()))
main :: IO ()
main =
  primBind (primArrAlloc 1 (65::Int)) (\ a ->
  primBind (primArrRead a 0) (\ v ->
  primThen (putI v)
  (primThen (primArrWrite a 0 (66::Int))
  (primBind (primArrRead a 0) (\ w ->
  primThen (putI w) (putI 10))))))
