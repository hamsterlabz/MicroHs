-- TreeSumFused.hs - TreeSum fully restructured, the exp3_8m way.
--
-- TreeSum.hs is  treeSum (mkTree 13): a build immediately followed by a
-- consume, i.e. a hylomorphism.  The tree exists only to be walked, so it need
-- not exist at all -- the fold runs straight over the depth.  And mkTree's two
-- children are the SAME subtree, so their sums are one value, not two.
--
--   treeSum (mkTree 0)     = 1
--   treeSum (mkTree n)     = s + s + 1  where s = treeSum (mkTree (n-1))
--
-- 2^(n+1)-1 nodes walked becomes n steps.

module TreeSumFused where

import Prelude()
import NanoPrelude

treeSumOf :: Int -> Int
treeSumOf n = if n == 0
                then 1
                else let s = treeSumOf (n - 1)
                     in  s + s + 1

main :: Int
main = treeSumOf 13
