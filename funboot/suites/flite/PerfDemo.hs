-- PerfDemo: the PMC self-report demonstrator.
--
-- The measurements themselves (result / cycles / instret / combi-count /
-- combi-bytes) are printed by the runtime epilogue (sw/fun/startup_fun.S) over
-- the UART -- EVERY flite benchmark self-reports the same way; this program
-- just gives the report a minimal, well-known workload.
--
-- Deliberately NOT the old Perf.hs IO version: an mhs IO bind chain deeper
-- than 3 under-applies its combinators, and the record-free (frameless)
-- reducer cannot resolve under-application -- the ISA contract is saturated
-- combinators (fun-base ledger: `partial` = 0 on every bench). Pure main +
-- epilogue report sidesteps that entirely.
module PerfDemo where
import Prelude()
import NanoPrelude

fib :: Int -> Int
fib n = if n <= 1 then 1 else fib (n-1) + fib (n-2)

main :: Int
main = fib 15
