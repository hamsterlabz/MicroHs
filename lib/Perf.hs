-- Perf: self-reporting performance counters for fun (nofib) programs.
--
-- A program can start/stop the hardware counters, read them, and print the
-- results to stdout (which is the SoC UART bare-metal, or the write syscall under
-- Linux/QEMU -- chosen by the mhs target flag, NOT the source). Use with the
-- standard Prelude + `do`:
--
--     import MiniPrelude
--     import Perf
--     main = do perfReset; perfStart
--               let r = work
--               i <- r `seq` rdInstret
--               perfStop
--               putStrLn ("instret: " ++ show i)
--
-- GENERIC CSR access: each function is `primitive "csrr 0xNNN"` / "csrw 0xNNN" --
-- the mhs backend emits a csrr/csrw blob for any 0xNNN in its csrRegs set (see
-- GenRomMem). To add a NEW PMC: pick a CSR in the reserved 0x7e8.. range (already
-- generated -> no mhs recompile), add the RTL counter, and add one reader line here.
module Perf(
  -- counters
  rdCycle, rdInstret, rdCombiAlloc, rdCombiCount,
  -- CHPM microarchitectural events (lo halves)
  rdWbBubble, rdTrapFlush, rdBrRedir, rdStallMem, rdStallMul,
  rdFetchStarve, rdStallLd, rdMispNt, rdMispTaken, rdWbRealBubble, rdWbFreshLag,
  -- fun (graph-reduction) PMCs
  rdFunDisp, rdFunStall, rdFunCombi, rdFunCells, rdFunTor, rdFunUpd,
  -- control
  perfStart, perfStop, perfReset,
  -- raw generic CSR writers (for new PMCs / custom use)
  wrMcycle, wrMinstret, wrCombiLo, wrCombiHi, wrCombiCntLo, wrCombiCntHi, wrMcountinhibit,
  -- stdout (UART bare-metal / write ecall on Linux) -- io.putb based
  putByteIO, putStrIO, putLnIO
  ) where
import Prelude()
import MiniPrelude

-- ---- stdout -----------------------------------------------------------------
-- The standard Handle-based putStr does not reduce on the bare reducer (the
-- stdout Handle needs runtime setup that bare-metal lacks), but the io.putb
-- primitive + the IO monad work. So emit bytes directly through io.putb (a byte
-- to the SoC UART bare-metal, or the write syscall under Linux). do / Monad /
-- show / (++) stay fully standard; only this low-level byte emit is custom.
putByteIO :: Int -> IO ()
putByteIO  = primitive "io.putb"
putStrIO  :: String -> IO ()
putStrIO []     = return ()
putStrIO (c:cs) = putByteIO (ord c) >> putStrIO cs
putLnIO   :: String -> IO ()
putLnIO s = putStrIO s >> putByteIO 10

-- ---- counter reads (csrr -> boxed Int) ------------------------------------
rdCycle      :: IO Int          -- mcycle   (0xb00) : retired-cycle count
rdCycle       = primitive "csrr 0xb00"
rdInstret    :: IO Int          -- minstret (0xb02) : retired fn.* instructions
rdInstret     = primitive "csrr 0xb02"
rdCombiAlloc :: IO Int          -- 0x7e6 : cells allocated by the reducer (lo)
rdCombiAlloc  = primitive "csrr 0x7e6"
rdCombiCount :: IO Int          -- 0x7ea : number of fn.combi reductions
rdCombiCount  = primitive "csrr 0x7ea"

-- ---- CHPM microarchitectural events (lo halves; csrfile.sv map) ------------
rdWbBubble     :: IO Int        -- 0x7d0 : WB bubbles
rdWbBubble      = primitive "csrr 0x7d0"
rdTrapFlush    :: IO Int        -- 0x7d2 : trap flushes
rdTrapFlush     = primitive "csrr 0x7d2"
rdBrRedir      :: IO Int        -- 0x7d4 : ID branch redirects
rdBrRedir       = primitive "csrr 0x7d4"
rdStallMem     :: IO Int        -- 0x7d6 : MEM-stage solo stalls
rdStallMem      = primitive "csrr 0x7d6"
rdStallMul     :: IO Int        -- 0x7d8 : MUL/DIV solo stalls
rdStallMul      = primitive "csrr 0x7d8"
rdFetchStarve  :: IO Int        -- 0x7da : fetch starvation cycles
rdFetchStarve   = primitive "csrr 0x7da"
rdStallLd      :: IO Int        -- 0x7dc : load-use stalls
rdStallLd       = primitive "csrr 0x7dc"
rdMispNt       :: IO Int        -- 0x7de : mispredicts (not-taken)
rdMispNt        = primitive "csrr 0x7de"
rdMispTaken    :: IO Int        -- 0x7e0 : mispredicts (taken)
rdMispTaken     = primitive "csrr 0x7e0"
rdWbRealBubble :: IO Int        -- 0x7e2 : real WB bubbles
rdWbRealBubble  = primitive "csrr 0x7e2"
rdWbFreshLag   :: IO Int        -- 0x7e4 : WB fresh-lag cycles
rdWbFreshLag    = primitive "csrr 0x7e4"

-- ---- fun (graph-reduction) PMCs (csrfile.sv 0x7e8..0x7ed) -------------------
rdFunDisp  :: IO Int            -- 0x7e8 : reducer dispatches
rdFunDisp   = primitive "csrr 0x7e8"
rdFunStall :: IO Int            -- 0x7e9 : fun stall cycles (frz+rcbusy+uq)
rdFunStall  = primitive "csrr 0x7e9"
rdFunCombi :: IO Int            -- 0x7ea : fn.combi reductions
rdFunCombi  = primitive "csrr 0x7ea"
rdFunCells :: IO Int            -- 0x7eb : node cells written
rdFunCells  = primitive "csrr 0x7eb"
rdFunTor   :: IO Int            -- 0x7ec : fn.tor pops
rdFunTor    = primitive "csrr 0x7ec"
rdFunUpd   :: IO Int            -- 0x7ed : Turner updates
rdFunUpd    = primitive "csrr 0x7ed"

-- ---- raw CSR writers (csrw, arity-2: value + continuation) -----------------
wrMcountinhibit :: Int -> IO ()  -- 0x320 : bit0 gates cycle + the chpm/combi counters
wrMcountinhibit  = primitive "csrw 0x320"
wrMcycle        :: Int -> IO ()
wrMcycle         = primitive "csrw 0xb00"
wrMinstret      :: Int -> IO ()
wrMinstret       = primitive "csrw 0xb02"
wrCombiLo       :: Int -> IO ()
wrCombiLo        = primitive "csrw 0x7e6"
wrCombiHi       :: Int -> IO ()
wrCombiHi        = primitive "csrw 0x7e7"
wrCombiCntLo    :: Int -> IO ()
wrCombiCntLo     = primitive "csrw 0x7e8"
wrCombiCntHi    :: Int -> IO ()
wrCombiCntHi     = primitive "csrw 0x7e9"

-- ---- control ---------------------------------------------------------------
perfStart :: IO ()              -- un-inhibit: counters run
perfStart  = wrMcountinhibit 0
perfStop  :: IO ()              -- inhibit: counters freeze
perfStop   = wrMcountinhibit 1
perfReset :: IO ()              -- zero cycle / instret / combi-alloc / combi-count
perfReset  = do wrMcycle 0; wrMinstret 0; wrCombiLo 0; wrCombiHi 0; wrCombiCntLo 0; wrCombiCntHi 0
