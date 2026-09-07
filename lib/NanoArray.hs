-- NanoArray.hs - mutable arrays for the nano dialect.
--
-- The array primitives in Primitives are already PURE and in continuation
-- passing style: each takes its arguments and the continuation directly and
-- returns whatever the continuation returns. That is exactly the shape the fun
-- backend's blobs implement (they end in fn.enter into the continuation), so
-- no IO is involved and nothing here needs the full Prelude.
--
-- Data.IOArray wraps the same atoms in IO, which makes them unreachable from
-- the nano dialect even though every fun image links the blobs. This module is
-- the nano-visible door to them.
module NanoArray(IOArray, newArr, readArr, writeArr, sizeArr, copyArr) where
import Prelude()
import Primitives(Int, IOArray, prim_arr_alloc, prim_arr_read, prim_arr_write,
                  prim_arr_size, prim_arr_copy)

-- newArr n x k: an array of n elements all x, handed to k
newArr :: forall a b . Int -> a -> (IOArray a -> b) -> b
newArr = prim_arr_alloc

-- readArr a i k: element i handed to k
readArr :: forall a b . IOArray a -> Int -> (a -> b) -> b
readArr = prim_arr_read

-- writeArr a i x k: store, then continue with k (already applied)
writeArr :: forall a b . IOArray a -> Int -> a -> b -> b
writeArr = prim_arr_write

sizeArr :: forall a b . IOArray a -> (Int -> b) -> b
sizeArr = prim_arr_size

copyArr :: forall a b . IOArray a -> (IOArray a -> b) -> b
copyArr = prim_arr_copy
