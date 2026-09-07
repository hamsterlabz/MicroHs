module GcN where
import Prelude()
import NanoPrelude
-- Nano dialect, no Handles, no full Prelude: allocates well past the 32 KB
-- trigger so the collector must run.  The answer is checked, so a corrupted
-- graph shows up as a wrong number rather than as a plausible-looking exit.
-- sum [1..20000] = 200010000
suml :: Int -> Int -> Int
suml i acc = if i > 20000 then acc else suml (i+1) (acc+i)

main :: Int
main = suml 1 0
