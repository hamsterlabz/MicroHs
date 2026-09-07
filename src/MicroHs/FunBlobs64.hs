-- Copyright 2025 Lennart Augustsson, Cecil Accetti
-- See LICENSE file for full license.
module MicroHs.FunBlobs64(
  primBlobs64, cmpBlobs64, effBlobs64, start64S,
  ) where
import qualified Prelude(); import MHSPrelude
import MicroHs.FunBlobs(csrRegs)

-- The runtime blobs for -rv64g: a stock RV64GC host, where the fun
-- instructions are assembly macros (funboot/rv64g/fun_macros.S and
-- fun_combi.S) rather than an extension.  These are a SECOND set beside the
-- xfun blobs in MicroHs.FunBlobs, which stay exactly as they are; the two
-- targets differ in more than mnemonics, so nothing is shared:
--
--   * the fun ops are macro invocations, and a macro is many instructions, so
--     "the next word" is the next macro, not pc+4;
--   * the fun CSRs are the globals fn_hp / fn_nfa / fn_frame, reached through
--     fn_csrr / fn_csrw; the performance counters are globals too, except
--     cycle and instret, which the hardware here actually has;
--   * saves are 64-bit (sd/ld, 16-byte frames) while the graph stays 32-bit
--     (lw/sw) -- a heap word is a 32-bit reference on both targets.
--
-- Every .balign carries an explicit 0 fill: in a code section GAS pads with
-- whole NOPs and, when the remainder is not a multiple of the instruction
-- width (after a string, say), it silently emits NO padding at all -- which
-- leaves the next label at an odd address and every branch to it truncates.
--
-- The semantics are those of the reducer in qemu (target/riscv/fun_helper.c)
-- and clash-rvfun (src/Core/Fun.hs), which are the references.

-- a pm gate: one argument and fn_seq forces it, two or more and it falls
-- through to the elink that transfers to the blob.
pm64 :: String -> String -> [String]
pm64 p b = [ "  .balign 4, 0", p ++ ":", "  fn_seq", "  fn_elink " ++ b ]

ffPop :: [String]                    -- pop the raw argument, force it in a frame
ffPop = [ "  fn_pop a0", "  jal ra, _fforce" ]

enter64 :: String
enter64 = "  fn_enter"

box64 :: [String]                    -- a0 = a machine word -> a box, and enter it
box64 = [ "  fn_databox a0, a0", "  fn_go a0" ]

-- Arithmetic.  The operands are already WHNF (opInfix), so tor takes the two
-- payloads, the result is boxed, the redex root is memoized and we enter the
-- box, which threads the value to the continuation.
primBlobs64 :: [String]
primBlobs64 = concatMap blob
  [ ("_prim_add","addw"), ("_prim_sub","subw"), ("_prim_mul","mulw")
  , ("_prim_div","divw"), ("_prim_divu","divuw")
  , ("_prim_rem","remw"), ("_prim_remu","remuw")
  , ("_prim_and","and"),  ("_prim_or","or"),    ("_prim_xor","xor")
  , ("_prim_sll","sllw"), ("_prim_srl","srlw"), ("_prim_sra","sraw") ]
  where
    blob (sym, op) =
      [ "  .balign 4, 0"
      , sym ++ ":"
      , "  fn_tor a0"
      , "  fn_tor a1"
      , "  " ++ op ++ " a0, a0, a1"
      , "  fn_databox a0, a0"
      , "  fn_update a0"
      , "  fn_go a0" ]

-- Comparisons, the framed force, seq, catch/raise and the packed-ByteString
-- loops.  Same shapes as the xfun blobs -- these are the operational
-- semantics, not a target detail -- with rv64 widths.
cmpBlobs64 :: [String]
cmpBlobs64 = fforceBlob ++ catchBlob ++ bsBlobs ++ seqBlob ++ concatMap blob
  [ ("_prim_eq","beq a0,a1"),  ("_prim_ne","bne a0,a1")
  , ("_prim_lt","blt a0,a1"),  ("_prim_ge","bge a0,a1")
  , ("_prim_le","bge a1,a0"),  ("_prim_gt","blt a1,a0")
  , ("_prim_ltu","bltu a0,a1"),("_prim_geu","bgeu a0,a1")
  , ("_prim_leu","bgeu a1,a0"),("_prim_gtu","bltu a1,a0") ]
  ++ floatBlobs64
  where
    -- The branch selection pops its two arguments EXPLICITLY rather than
    -- closing with a combinator word.  A combi performs the record-free Turner
    -- update, whose redex root is ws(carity-1) -- the source of the deepest
    -- consumed entry.  Inside a graph block that source is the cell holding
    -- the redex and the update is right, but a blob is entered by whoever
    -- walked into it, so the sources are unrelated cells and the update lands
    -- on one of them; when that cell is a Y knot's self-pointer the knot
    -- becomes an indirection to itself and the walk can never leave.  This is
    -- the same reduct without the update, exactly as _seq does it.
    blob (sym, br) =
      [ "  .balign 4, 0"
      , sym ++ ":"
      , "  fn_tor a0"
      , "  fn_tor a1"
      , "  " ++ br ++ ", .Ltrue_" ++ sym
      , "  fn_combi_t0 2, 0,0,0,0,0,0"          -- False = K -> spine[0] = else
      , ".Ltrue_" ++ sym ++ ":"
      , "  fn_combi_t0 2, 1,0,0,0,0,0" ]        -- True  = A -> spine[1] = then

    -- The framed force, the runtime's evali.  Writing ~0 to the frame captures
    -- the current depth as the base: the spine below it is invisible to every
    -- window read and depth gate, so the nested reduction can neither consume
    -- nor corrupt the caller's spine.  Any WHNF at the boundary branches to
    -- NF_ADDR, whose epilogue drains the frame and jumps to the resume.
    -- IN: a0 = the node to force; OUT: a0 = the box payload.
    fforceBlob =
      [ "  .balign 4, 0"
      , "_fforce:"
      , "  addi sp, sp, -32"
      , "  sd   ra, 16(sp)"
      , "  la   t0, _force_resume"
      , "  ld   t1, 0(t0)"
      , "  sd   t1, 8(sp)"                      -- enclosing forcer's resume
      , "  fn_csrr t1, 0x7c2"
      , "  sd   t1, 0(sp)"                      -- enclosing frame base
      , "  la   t1, _fforce_nf"
      , "  sd   t1, 0(t0)"
      , "  li   t1, -1"
      , "  fn_csrw 0x7c2, t1"                   -- frame := depth (evali entry)
      , "  la   t0, fn_hp"
      , "  ld   a5, 0(t0)"
      , "  la   a4, _fforce_resume"
      , "  FN_WCELL_LINK a5, a4"
      , "  addi a6, a5, FN_CELL_LINK"
      , "  andi a0, a0, -4"
      , "  FN_WCELL_ELINK a6, a0"
      , "  la   t0, fn_hp"
      , "  ld   t1, 0(t0)"
      , "  addi t1, t1, FN_CELL_LINK + FN_CELL_ELINK"
      , "  sd   t1, 0(t0)"
      , "  fence.i"
      , "  jr   a5"
      , "  .balign 4, 0"
      , "_fforce_resume:"                       -- the box delivered itself
      , "  fn_tor a0"
      , "  ld   t1, 0(sp)"
      , "  fn_csrw 0x7c2, t1"
      , "  la   t0, _force_resume"
      , "  ld   t1, 8(sp)"
      , "  sd   t1, 0(t0)"
      , "  ld   ra, 16(sp)"
      , "  addi sp, sp, 32"
      , "  ret"
      , "  .balign 4, 0"
      , "_fforce_nf:"                           -- WHNF was not data
      , "  la   a0, _fforce_msg"
      , "  j    _unimpfi_halt"
      , "  .balign 4, 0"
      , "_fforce_msg:"
      , "  .asciz \"fforce: non-data WHNF\""
      , "  .balign 4, 0" ]

    -- seq a b: force a in a frame, discard it, enter b on the intact outer
    -- spine.  Not spelled with a combi word: the record-free update takes the
    -- redex root to be the source of the deepest consumed entry, and in a blob
    -- the sources are unrelated graph cells.
    seqBlob =
      [ "  .balign 4, 0"
      , "_seq:"
      , "  fn_pop a0"                           -- a, to force
      , "  fn_pop a1"                           -- b
      , "  bnez a1, .Lseq_ok"                    -- degenerate application
      , "  j    _error0"
      , ".Lseq_ok:"
      , "  FN_ROOT_PUSH a1"                     -- b, across the force
      , "  addi sp, sp, -32"
      , "  la   t0, _force_resume"
      , "  ld   t1, 0(t0)"
      , "  sd   t1, 8(sp)"
      , "  fn_csrr t1, 0x7c2"
      , "  sd   t1, 0(sp)"
      , "  la   t1, _seq_resume"
      , "  sd   t1, 0(t0)"
      , "  li   t1, -1"
      , "  fn_csrw 0x7c2, t1"                   -- evali(a) begins
      , "  andi a0, a0, -4"
      , "  fn_go a0"
      , "  .balign 4, 0"
      , "_seq_resume:"
      , "  la   t0, _force_resume"
      , "  ld   t1, 8(sp)"
      , "  sd   t1, 0(t0)"
      , "  ld   t1, 0(sp)"
      , "  fn_csrw 0x7c2, t1"
      , "  addi sp, sp, 32"
      , "  FN_ROOT_POP t2"
      , "  andi t2, t2, -4"
      , "  fn_go t2"                             -- b, outer spine intact
      , "  .balign 8, 0"
      , "_force_resume:"                        -- innermost resume; 0 = none
      , "  .skip 8" ]

    -- Exceptions.  The record holds everything an unwind puts back: handler and
    -- continuation, the C stack, the enclosing frame and resume, and the spine
    -- DEPTH at install time -- a raise discards whatever the abandoned action
    -- left on the spine, which is a drain down to that depth.
    catchBlob =
      [ "  .balign 4, 0" ]
      ++ pm64 "_pm_catch" "_catch" ++
      [ "  .balign 4, 0"
      , "_catch:"
      , "  fn_pop a0"                           -- the action
      , "  fn_pop a1"                           -- the handler
      , "  fn_pop a2"                           -- the IO continuation
      , "  addi sp, sp, -64"
      , "  la   t0, _exc_top"
      , "  ld   t1, 0(t0)"
      , "  sd   t1, 0(sp)"                      -- previous record
      , "  fn_csrr t1, 0x7c2"
      , "  sd   t1, 40(sp)"                     -- enclosing frame
      , "  la   t3, _force_resume"
      , "  ld   t1, 0(t3)"
      , "  sd   t1, 48(sp)"                     -- enclosing resume
      , "  la   t1, fn_rootsp"
      , "  lw   t1, 0(t1)"
      , "  sd   t1, 56(sp)"                     -- and the root stack depth: a
                                                -- raise abandons whatever the
                                                -- abandoned action pushed
      , "  li   t1, -1"
      , "  fn_csrw 0x7c2, t1"
      , "  fn_csrr t1, 0x7c2"                   -- the depth a raise unwinds to
      , "  sd   t1, 8(sp)"
      , "  addi t1, sp, 64"
      , "  sd   t1, 16(sp)"                     -- sp to restore
      , "  sd   a1, 24(sp)"                     -- handler
      , "  sd   a2, 32(sp)"                     -- continuation
      , "  sd   sp, 0(t0)"                      -- now innermost
      , "  la   t0, fn_hp"
      , "  ld   a5, 0(t0)"
      , "  la   a4, _catch_done"
      , "  FN_WCELL_LINK a5, a4"
      , "  addi a6, a5, FN_CELL_LINK"
      , "  andi a0, a0, -4"
      , "  FN_WCELL_ELINK a6, a0"
      , "  la   t0, fn_hp"
      , "  ld   t1, 0(t0)"
      , "  addi t1, t1, FN_CELL_LINK + FN_CELL_ELINK"
      , "  sd   t1, 0(t0)"
      , "  fence.i"
      , "  jr   a5"
      , "  .balign 4, 0"
      , "_catch_done:"                          -- the action returned
      , "  fn_pop a0"                           -- its value
      , "  la   t0, _exc_top"
      , "  ld   t1, 0(t0)"
      , "  ld   t2, 0(t1)"
      , "  sd   t2, 0(t0)"                      -- pop the record
      , "  ld   a2, 32(t1)"
      , "  ld   t3, 40(t1)"
      , "  fn_csrw 0x7c2, t3"
      , "  la   t4, _force_resume"
      , "  ld   t3, 48(t1)"
      , "  sd   t3, 0(t4)"
      , "  ld   sp, 16(t1)"
      , "  la   t0, fn_hp"
      , "  ld   a5, 0(t0)"
      , "  andi a0, a0, -4"
      , "  FN_WCELL_LINK a5, a0"
      , "  addi a6, a5, FN_CELL_LINK"
      , "  andi a2, a2, -4"
      , "  FN_WCELL_ELINK a6, a2"
      , "  la   t0, fn_hp"
      , "  ld   t1, 0(t0)"
      , "  addi t1, t1, FN_CELL_LINK + FN_CELL_ELINK"
      , "  sd   t1, 0(t0)"
      , "  fence.i"
      , "  jr   a5"
      , "  .balign 4, 0"
      , "_raise:"                               -- primRaise e
      , "  fn_pop a0"
      , "  la   t0, _exc_top"  -- the record goes in a register the
                                          -- macros below do not scratch
      , "  ld   a3, 0(t0)"
      , "  beqz a3, _raise_top"                 -- uncaught
      , "  ld   t2, 0(a3)"
      , "  sd   t2, 0(t0)"
      , "  ld   t3, 8(a3)"
      , "  fn_csrw 0x7c2, t3"                   -- frame := the install depth, so
      , ".Ldrain:"                              -- that fn_pop stops there, and
      , "  fn_pop t4"                           -- drain the abandoned spine
      , "  bnez t4, .Ldrain"
      , "  ld   t3, 40(a3)"
      , "  fn_csrw 0x7c2, t3"
      , "  la   t4, _force_resume"
      , "  ld   t3, 48(a3)"
      , "  sd   t3, 0(t4)"
      , "  ld   t3, 56(a3)"
      , "  la   t4, fn_rootsp"
      , "  sw   t3, 0(t4)"                      -- the root stack, unwound
      , "  ld   a1, 24(a3)"                     -- handler
      , "  ld   a2, 32(a3)"                     -- continuation
      , "  ld   sp, 16(a3)"
      , "  la   t0, fn_hp"                      -- [link k][link e][elink handler]
      , "  ld   a4, 0(t0)"
      , "  andi a2, a2, -4"
      , "  FN_WCELL_LINK a4, a2"                -- deepest = k
      , "  addi a5, a4, FN_CELL_LINK"
      , "  andi a0, a0, -4"
      , "  FN_WCELL_LINK a5, a0"                -- then e
      , "  addi a6, a5, FN_CELL_LINK"
      , "  andi a1, a1, -4"
      , "  FN_WCELL_ELINK a6, a1"
      , "  la   t0, fn_hp"
      , "  ld   t1, 0(t0)"
      , "  addi t1, t1, 2*FN_CELL_LINK + FN_CELL_ELINK"
      , "  sd   t1, 0(t0)"
      , "  fence.i"
      , "  jr   a4"
      , "  .balign 4, 0"
      , "_raise_top:"
      , "  la   a0, _excmsg"
      , "  j    _unimpfi_halt"
      , "  .balign 4, 0"
      , "_excmsg:"
      , "  .asciz \"uncaught exception\""
      , "  .balign 8, 0"
      , "  .globl _exc_top"
      , "_exc_top:"                             -- innermost record; 0 = none
      , "  .skip 8" ]

    -- Packed ByteString equality and ordering.  An arena is word 0 = the
    -- length, one word per byte after it, so both are loops here instead of a
    -- walk over cons cells.  This is the compiler's hottest operation.  The
    -- first arena must survive forcing the second, so it goes on the C stack.
    bsBlobs =
         pm64 "_pm_bs_eq" "_bs_eq" ++
      [ "  .balign 4, 0"
      , "_bs_eq:" ] ++ ffPop ++
      [ "  FN_ROOT_PUSH a0"                     -- x's arena, across the force
      ] ++ ffPop ++
      [ "  FN_ROOT_POP a2"
      , "  lw   t0, 4(a2)"                      -- length x
      , "  lw   t1, 4(a0)"                      -- length y
      , "  bne  t0, t1, .Lbs_ne"
      , "  addi a2, a2, 8", "  addi a0, a0, 8"
      , ".Lbs_loop:"
      , "  beqz t0, .Lbs_eq"
      , "  lw   t2, 0(a2)", "  lw   t3, 0(a0)"
      , "  bne  t2, t3, .Lbs_ne"
      , "  addi a2, a2, 4", "  addi a0, a0, 4"
      , "  addi t0, t0, -1", "  j .Lbs_loop"
      , ".Lbs_ne:", "  fn_combi_t0 2, 0,0,0,0,0,0"     -- False
      , ".Lbs_eq:", "  fn_combi_t0 2, 1,0,0,0,0,0" ]   -- True
      ++ pm64 "_pm_bs_cmp" "_bs_cmp" ++
      [ "  .balign 4, 0"
      , "_bs_cmp:" ] ++ ffPop ++
      [ "  FN_ROOT_PUSH a0"
      ] ++ ffPop ++
      [ "  FN_ROOT_POP a2"
      , "  lw   t0, 4(a2)", "  lw   t1, 4(a0)"
      , "  addi a2, a2, 8", "  addi a0, a0, 8"
      , ".Lcmp_loop:"                           -- the common prefix
      , "  beqz t0, .Lcmp_xend"
      , "  beqz t1, .Lcmp_gt"                   -- y exhausted: x > y
      , "  lw   t2, 0(a2)", "  lw   t3, 0(a0)"
      , "  bltu t2, t3, .Lcmp_lt"
      , "  bltu t3, t2, .Lcmp_gt"
      , "  addi a2, a2, 4", "  addi a0, a0, 4"
      , "  addi t0, t0, -1", "  addi t1, t1, -1"
      , "  j .Lcmp_loop"
      , ".Lcmp_xend:", "  bnez t1, .Lcmp_lt"    -- x shorter: LT
      , "  fn_combi_t0 3, 1,0,0,0,0,0"          -- EQ
      , ".Lcmp_lt:", "  fn_combi_t0 3, 0,0,0,0,0,0"
      , ".Lcmp_gt:", "  fn_combi_t0 3, 2,0,0,0,0,0"
      , "  .balign 4, 0" ]

-- F32: a float is a 1-word IEEE binary32 payload in the standard box,
-- computed on the F datapath.  Binary arith mirrors _prim_add (pre-forced
-- operands, Y-wrapped, so it closes with an update); compares mirror the
-- integer ones; the unary ops are not opInfix-managed, so they force their
-- single argument and produce an un-memoized box.
floatBlobs64 :: [String]
floatBlobs64 =
     concatMap arith
       [ ("_prim_fadd","fadd.s"), ("_prim_fsub","fsub.s")
       , ("_prim_fmul","fmul.s"), ("_prim_fdiv","fdiv.s") ]
  ++ concatMap cmp
       [ ("_prim_feq", "feq.s a0, fa0, fa1", "bnez")
       , ("_prim_fne", "feq.s a0, fa0, fa1", "beqz")
       , ("_prim_flt", "flt.s a0, fa0, fa1", "bnez")
       , ("_prim_fle", "fle.s a0, fa0, fa1", "bnez")
       , ("_prim_fgt", "flt.s a0, fa1, fa0", "bnez")
       , ("_prim_fge", "fle.s a0, fa1, fa0", "bnez") ]
  ++ concatMap unary
       [ ("_prim_fneg",  [ "  fmv.w.x fa0, a0", "  fneg.s fa0, fa0", "  fmv.x.w a0, fa0" ])
       , ("_prim_fsqrt", [ "  fmv.w.x fa0, a0", "  fsqrt.s fa0, fa0", "  fmv.x.w a0, fa0" ])
       , ("_prim_itof",  [ "  fcvt.s.w fa0, a0", "  fmv.x.w a0, fa0" ])
       , ("_prim_ftoi",  [ "  fmv.w.x fa0, a0", "  fcvt.w.s a0, fa0, rtz" ]) ]
  where
    arith (sym, op) =
      [ "  .balign 4, 0", sym ++ ":"
      , "  fn_tor a0", "  fn_tor a1"
      , "  fmv.w.x fa0, a0", "  fmv.w.x fa1, a1"
      , "  " ++ op ++ " fa0, fa0, fa1"
      , "  fmv.x.w a0, fa0"
      , "  fn_databox a0, a0", "  fn_update a0", "  fn_go a0" ]
    cmp (sym, cmpi, br) =
      [ "  .balign 4, 0", sym ++ ":"
      , "  fn_tor a0", "  fn_tor a1"
      , "  fmv.w.x fa0, a0", "  fmv.w.x fa1, a1"
      , "  " ++ cmpi
      , "  " ++ br ++ " a0, .Lftrue_" ++ sym
      , "  fn_combi_t0 2, 0,0,0,0,0,0"
      , ".Lftrue_" ++ sym ++ ":"
      , "  fn_combi_t0 2, 1,0,0,0,0,0" ]
    unary (sym, body) =
      [ "  .balign 4, 0", sym ++ ":"
      , "  fn_force"                            -- reduce the argument to a box
      , "  fn_tor a0" ] ++ body ++ box64

-- Effects, the CSR shims, the arrays and the two halts.  -rv64g targets Linux
-- on a real RV64GC machine, so the writes are ecalls; there is no bare variant
-- here (the SoC is the xfun target).
effBlobs64 :: [String]
effBlobs64 =
     pm64 "_pm_putb"  "_io_putb"
  ++ [ "  .balign 4, 0", "_io_putb:" ] ++ ffPop ++ wrByte [ "  li a0, 1" ] ++ [ enter64 ]
  ++ pm64 "_pm_setfd" "_io_setfd"
  ++ [ "  .balign 4, 0", "_io_setfd:" ] ++ ffPop
  ++ [ "  la a1, _cur_fd", "  sw a0, 0(a1)", enter64 ]
  ++ pm64 "_pm_putbf" "_io_putbf"
  ++ [ "  .balign 4, 0", "_io_putbf:" ] ++ ffPop
  ++ wrByte [ "  la a2, _cur_fd", "  lw a0, 0(a2)" ] ++ [ enter64 ]
  ++ fileBlobs64
  ++ morphBlobs64
  ++ csrBlobs64
  ++ arrBlobs64
  ++ haltBlobs64
  ++ [ "  .balign 8, 0", "_iobuf:", "  .skip 8", "  .balign 8, 0", "_cur_fd:", "  .skip 8" ]
  where
    wrByte fd = [ "  la a1, _iobuf", "  sb a0, 0(a1)" ] ++ fd
                ++ [ "  li a2, 1", "  li a7, 64", "  ecall" ]   -- write(fd, buf, 1)

-- The rest of System.IO: opening a file, reading a byte, walking argv.  On the
-- fun backend a `Ptr BFILE` IS the fd (lib/System/IO.hs), so there is no handle
-- table to keep -- a path is streamed in one byte at a time, opened, and then
-- read or written through the latched current fd.  No C runtime sits under the
-- graph, so each one is a raw Linux syscall.
--
-- Two shapes, following the arity the Haskell side applies:
--   arity 2 (an argument then the continuation) is pm-gated, like io.putbf;
--   arity 1 is a CPS value -- entered with only the continuation on the spine,
--   it boxes its result and enters the box, which hands ITSELF to that
--   continuation.  That is exactly a csrr read, so those need no gate at all.
fileBlobs64 :: [String]
fileBlobs64 =
     pm64 "_pm_pathc" "_io_pathc"
  ++ [ "  .balign 4, 0", "_io_pathc:" ] ++ ffPop ++
     [ "  la   a1, _pathlen"
     , "  ld   a2, 0(a1)"
     , "  li   a3, " ++ show (pathMax - 1)
     , "  bgeu a2, a3, .Lpathfull"          -- a longer path truncates rather
     , "  la   a3, _pathbuf"                -- than trampling what follows
     , "  add  a3, a3, a2"
     , "  sb   a0, 0(a3)"
     , "  addi a2, a2, 1"
     , "  sd   a2, 0(a1)"
     , ".Lpathfull:"
     , enter64 ]
  ++ pm64 "_pm_open" "_io_open"
  ++ [ "  .balign 4, 0", "_io_open:" ] ++ ffPop ++
     [ "  andi a0, a0, 3"                   -- IOMode: Read/Write/Append/RW
     , "  la   a1, _pathlen"
     , "  ld   a2, 0(a1)"
     , "  sd   zero, 0(a1)"                 -- the buffer is per open
     , "  la   a1, _pathbuf"
     , "  add  a3, a1, a2"
     , "  sb   zero, 0(a3)"                 -- NUL-terminate for the kernel
     , "  la   a3, _openflags"
     , "  slli a2, a0, 3"
     , "  add  a3, a3, a2"
     , "  ld   a2, 0(a3)"                   -- flags BEFORE a0 becomes the dirfd
     , "  li   a0, -100"                    -- AT_FDCWD
     , "  li   a3, 438"                     -- 0666
     , "  li   a7, 56"                      -- openat
     , "  ecall" ] ++ box64                 -- fd (or -errno) -> the continuation
  ++ pm64 "_pm_close" "_io_close"
  ++ [ "  .balign 4, 0", "_io_close:" ] ++ ffPop ++
     [ "  li   a7, 57", "  ecall", enter64 ]
  ++ pm64 "_pm_argsel" "_io_argsel"
  ++ [ "  .balign 4, 0", "_io_argsel:" ] ++ ffPop ++
     [ "  la   a1, _argv_base"              -- sp at entry: argc, then argv[]
     , "  ld   a1, 0(a1)"
     , "  addi a0, a0, 1"                   -- past the argc word itself
     , "  slli a0, a0, 3"
     , "  add  a1, a1, a0"
     , "  ld   a1, 0(a1)"
     , "  la   a2, _argptr"
     , "  sd   a1, 0(a2)"                   -- the read offset restarts here
     , enter64 ]
  ++ [ "  .balign 4, 0", "_pm_getb:", "  li a0, 0" ] ++ rdByte "0" ++ box64
  ++ [ "  .balign 4, 0", "_pm_getbf:", "  la a0, _cur_fd", "  lw a0, 0(a0)" ]
     ++ rdByte "f" ++ box64
  ++ [ "  .balign 4, 0", "_pm_argc:"
     , "  la   a0, _argv_base"
     , "  ld   a0, 0(a0)"
     , "  ld   a0, 0(a0)" ] ++ box64
  ++ [ "  .balign 4, 0", "_pm_argrd:"
     , "  la   a1, _argptr"
     , "  ld   a2, 0(a1)"
     , "  beqz a2, .Largend"                -- nothing selected yet
     , "  lbu  a0, 0(a2)"
     , "  beqz a0, .Largend"                -- the NUL ends this argument
     , "  addi a2, a2, 1"
     , "  sd   a2, 0(a1)" ] ++ box64
  ++ [ "  .balign 4, 0", ".Largend:", "  li a0, -1" ] ++ box64
  ++ [ "  .balign 8, 0", "_pathbuf:", "  .skip " ++ show pathMax
     , "  .balign 8, 0", "_pathlen:", "  .skip 8"
     , "  .balign 8, 0", "_argptr:",  "  .skip 8"
     , "  .balign 8, 0", "_openflags:"      -- indexed by the IOMode above
     , "  .dword 0"                         -- ReadMode      O_RDONLY
     , "  .dword 577"                       -- WriteMode     O_WRONLY|O_CREAT|O_TRUNC
     , "  .dword 1089"                      -- AppendMode    O_WRONLY|O_CREAT|O_APPEND
     , "  .dword 66" ]                      -- ReadWriteMode O_RDWR|O_CREAT
  where
    pathMax = 1024 :: Int
    -- read one byte from the fd in a0.  EOF (0) and an error (<0) both report
    -- -1, which is the contract System.IO's getb expects.
    rdByte t = [ "  la   a1, _iobuf"
               , "  li   a2, 1"
               , "  li   a7, 63"                       -- read(fd, buf, 1)
               , "  ecall"
               , "  li   a1, 1"
               , "  bne  a0, a1, .Leof" ++ t
               , "  la   a1, _iobuf"
               , "  lbu  a0, 0(a1)"
               , "  j    .Lrd" ++ t
               , ".Leof" ++ t ++ ":", "  li a0, -1"
               , ".Lrd" ++ t ++ ":" ]

-- Explicit morphisms (--morph): cata, ana, para and hylo as real reductions.
--
-- Each rewrites its redex into a graph that contains a reference back to the
-- morphism cell itself, so the next layer unfolds the same way -- recursion
-- without a recursive combinator.  The rewrites (Model.RvRef funMorph, and the
-- reducers in qemu and clash-rvfun) are:
--
--   cata F A x    ->  A (F (cata F A) x)
--   para F A x    ->  the same rewrite; the schemes differ only in which cell
--                     the back-reference names, and that is the cell itself
--   ana  F C s    ->  F (ana F C) (C s)
--   hylo F A C s  ->  A (F (hylo F A C) (C s))
--
-- The reduct is laid out exactly as the reference lays it out, with this
-- target's cell sizes instead of four bytes:
--
--   cata/para  rc  = [link A][link F][elink p]        3 cells
--              inr = [link x][link rc][elink F]       3 cells
--              out = [link inr][elink A]              2 cells
--              memo(xsrc) <- out ;  enter out
--   ana        rc  = [link C][link F][elink p]        3 cells
--              ca  = [link s][elink C]                2 cells
--              inr = [link ca][link rc][elink F]      3 cells
--              memo(ssrc) <- inr ;  enter inr
--   hylo       rc  = [link C][link A][link F][elink p]  4 cells
--              ca  = [link s][elink C]                  2 cells
--              inr = [link ca][link rc][elink F]        3 cells
--              push (inr, 0) ; enter A -- and NO root update: hylo consumes
--              its seed rather than memoizing it, so the s cell is left alone
--
-- Under-application is not a trap here as it is on the xfun machine: too few
-- arguments means the head cannot reduce, which is normal form, the same
-- answer the combinator dispatch gives.
morphBlobs64 :: [String]
morphBlobs64 =
     mstart "_rt_cata" 3
  ++ [ "  FN_WV a0, 0"                          -- F
     , "  FN_WV a1, 1"                          -- A
     , "  FN_WV a2, 2"                          -- x
     , "  FN_WS a3, 2"                          -- and the cell it came from
     , "  andi a0, a0, -4", "  andi a1, a1, -4", "  andi a2, a2, -4"
     , "  la   t0, fn_hp", "  ld a4, 0(t0)" ]   -- a4 = rc
  ++ cell3 "a4" "a1" "a0"                       -- [link A][link F][elink p]
  ++ [ "  addi a5, a4, 3*FN_CELL_LINK" ]        -- a5 = inr
  ++ [ "  FN_WCELL_LINK a5, a2"
     , "  addi a6, a5, FN_CELL_LINK"
     , "  FN_WCELL_LINK a6, a4"
     , "  addi a6, a6, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a6, a0"
     , "  addi a6, a5, 3*FN_CELL_LINK"          -- a6 = out
     , "  FN_WCELL_LINK a6, a5"
     , "  addi a7, a6, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a7, a1" ]
  ++ memoRoot "a3" "a6"
  ++ bump 160 ++ [ "  FN_POPN 3", "  jr a6" ] ++ mend
  ++ mstart "_rt_ana" 3
  ++ [ "  FN_WV a0, 0"                          -- F
     , "  FN_WV a1, 1"                          -- C
     , "  FN_WV a2, 2"                          -- s
     , "  FN_WS a3, 2"
     , "  andi a0, a0, -4", "  andi a1, a1, -4", "  andi a2, a2, -4"
     , "  la   t0, fn_hp", "  ld a4, 0(t0)" ]   -- a4 = rc
  ++ cell3 "a4" "a1" "a0"                       -- [link C][link F][elink p]
  ++ [ "  addi a5, a4, 3*FN_CELL_LINK"          -- a5 = ca
     , "  FN_WCELL_LINK a5, a2"
     , "  addi a6, a5, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a6, a1"
     , "  addi a6, a5, 2*FN_CELL_LINK"          -- a6 = inr
     , "  FN_WCELL_LINK a6, a5"
     , "  addi a7, a6, FN_CELL_LINK"
     , "  FN_WCELL_LINK a7, a4"
     , "  addi a7, a7, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a7, a0" ]
  ++ memoRoot "a3" "a6"
  ++ bump 160 ++ [ "  FN_POPN 3", "  jr a6" ] ++ mend
  ++ mstart "_rt_hylo" 4
  ++ [ "  FN_WV a0, 0"                          -- F
     , "  FN_WV a1, 1"                          -- A
     , "  FN_WV a2, 2"                          -- C
     , "  FN_WV a3, 3"                          -- s
     , "  andi a0, a0, -4", "  andi a1, a1, -4"
     , "  andi a2, a2, -4", "  andi a3, a3, -4"
     , "  la   t0, fn_hp", "  ld a4, 0(t0)" ]   -- a4 = rc
  ++ [ "  FN_WCELL_LINK a4, a2"                 -- [link C][link A][link F][elink p]
     , "  addi a5, a4, FN_CELL_LINK"
     , "  FN_WCELL_LINK a5, a1"
     , "  addi a5, a5, FN_CELL_LINK"
     , "  FN_WCELL_LINK a5, a0"
     , "  addi a5, a5, FN_CELL_LINK"
     , "  la   t0, fn_mp", "  ld a6, 0(t0)"
     , "  FN_WCELL_ELINK a5, a6"
     , "  addi a5, a4, 4*FN_CELL_LINK"          -- a5 = ca
     , "  FN_WCELL_LINK a5, a3"
     , "  addi a6, a5, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a6, a2"
     , "  addi a6, a5, 2*FN_CELL_LINK"          -- a6 = inr
     , "  FN_WCELL_LINK a6, a5"
     , "  addi a7, a6, FN_CELL_LINK"
     , "  FN_WCELL_LINK a7, a4"
     , "  addi a7, a7, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a7, a0" ]
  ++ bump 180
  ++ [ "  FN_POPN 4"
     , "  FN_PUSH a6, zero"                     -- the seed cell stays untouched
     , "  jr   a1" ] ++ mend
  where
    -- the head of every morphism routine: keep the cell's own address (the
    -- cell writers scratch t2/t3), collect if this reduction crosses the
    -- limit, and refuse to reduce when the arguments are not all there.
    mstart sym ar =
      [ "  .balign 4, 0", sym ++ ":"
      , "  la   t0, fn_mp", "  sd t3, 0(t0)"
      , "  FN_GCCHECK"
      , "  FN_DEPTH t6"
      , "  li   t5, " ++ show (ar::Int)
      , "  blt  t6, t5, 91f"
      , "  la   t0, fn_reductions", "  ld t1, 0(t0)"
      , "  addi t1, t1, 1", "  sd t1, 0(t0)" ]
    mend = [ "91:", "  la t4, fn_nfa", "  ld t4, 0(t4)", "  jr t4" ]
    -- [link x][link y][elink p] -- the recursive node every scheme starts with
    cell3 at x y =
      [ "  FN_WCELL_LINK " ++ at ++ ", " ++ x
      , "  addi a5, " ++ at ++ ", FN_CELL_LINK"
      , "  FN_WCELL_LINK a5, " ++ y
      , "  addi a5, a5, FN_CELL_LINK"
      , "  la   t0, fn_mp", "  ld a6, 0(t0)"
      , "  FN_WCELL_ELINK a5, a6" ]
    memoRoot src tgt =
      [ "  beqz " ++ src ++ ", 30f"
      , "  andi " ++ src ++ ", " ++ src ++ ", -4"
      , "  FN_MEMO " ++ src ++ ", " ++ tgt
      , "30:" ]
    bump n = [ "  la   t0, fn_hp", "  ld t1, 0(t0)"
             , "  addi t1, t1, " ++ show (n::Int), "  sd t1, 0(t0)"
             , "  fence.i" ]

-- The performance CSRs become globals, as the fun CSRs do -- except cycle and
-- instret, which this host has for real and which every benchmark reads.
csrBlobs64 :: [String]
csrBlobs64 = concatMap rd csrRegs ++ concatMap wr csrRegs ++ concatMap cell csrRegs
  where
    rd s = [ "  .balign 4, 0", "_csrr_" ++ s ++ ":" ] ++ get s ++ box64
    get s | s == "0xb00" || s == "0xc00" = [ "  rdcycle a0" ]
          | s == "0xb02" || s == "0xc02" = [ "  rdinstret a0" ]
          | otherwise                    = [ "  lw a0, _csr_" ++ s ]
    wr s = pm64 ("_pm_csrw_" ++ s) ("_csrw_" ++ s)
           ++ [ "  .balign 4, 0", "_csrw_" ++ s ++ ":" ] ++ ffPop
           ++ [ "  sw a0, _csr_" ++ s ++ ", t0", enter64 ]
    cell s = [ "  .balign 8, 0", "_csr_" ++ s ++ ":", "  .skip 8" ]

-- Arrays.  An arena is one heap block: word 0 the element count, one word per
-- element after it.  Allocation is a run of boxes, which is how a blob asks
-- the allocator for raw words.
arrBlobs64 :: [String]
arrBlobs64 =
     pm64 "_pm_arr_alloc" "_arr_alloc"
  ++ [ "  .balign 4, 0", "_arr_alloc:" ] ++ ffPop ++       -- n
     [ "  mv   a2, a0"
     , "  fn_pop a3"                                    -- the fill, UNFORCED
     ] ++ heapWords "alloc" "a2" ++
     [ "  li t0, 0x3605b", "  sw t0, 0(t4)"             -- the arena marker
     , "  sw a2, 4(t4)"                                 -- the element count
     , "  addi t2, t4, 8", "  mv t3, a2"
     , ".Lfill:", "  beqz t3, .Lfilled"
     , "  sw a3, 0(t2)", "  addi t2, t2, 4", "  addi t3, t3, -1", "  j .Lfill"
     , ".Lfilled:", "  fn_pbox a0, t4", "  fn_go a0" ]
  ++ pm64 "_pm_arr_size" "_arr_size"
  ++ [ "  .balign 4, 0", "_arr_size:" ] ++ ffPop ++
     [ "  lw a0, 4(a0)" ] ++ box64
  ++ pm64 "_pm_arr_read" "_arr_read"
  ++ [ "  .balign 4, 0", "_arr_read:" ] ++ ffPop ++        -- the arena
     [ "  FN_ROOT_PUSH a0" ] ++ ffPop ++                 -- the index
     [ "  FN_ROOT_POP a2"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  lw   a0, 8(a2)"                               -- element i
     , "  andi a0, a0, -4"
     , "  fn_pop a1"                                    -- the continuation
     , "  andi a1, a1, -4"
     , "  la   t0, fn_hp"                              -- [link value][elink k]
     , "  ld   a4, 0(t0)"
     , "  FN_WCELL_LINK a4, a0"
     , "  addi a5, a4, FN_CELL_LINK"
     , "  FN_WCELL_ELINK a5, a1"
     , "  la   t0, fn_hp"
     , "  ld   t1, 0(t0)"
     , "  addi t1, t1, FN_CELL_LINK + FN_CELL_ELINK"
     , "  sd   t1, 0(t0)"
     , "  fence.i"
     , "  jr   a4" ]
  ++ pm64 "_pm_arr_write" "_arr_write"
  ++ [ "  .balign 4, 0", "_arr_write:" ] ++ ffPop ++
     [ "  FN_ROOT_PUSH a0" ] ++ ffPop ++
     [ "  FN_ROOT_POP a2"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  fn_pop a1"                                    -- the value, UNFORCED
     , "  sw   a1, 8(a2)"
     , enter64 ]
  ++ pm64 "_pm_bs_wr" "_bs_wr"
  ++ [ "  .balign 4, 0", "_bs_wr:" ] ++ ffPop ++           -- the arena
     [ "  FN_ROOT_PUSH a0" ] ++ ffPop ++                 -- the arena is a heap
     [ "  addi sp, sp, -16", "  sd a0, 0(sp)"           -- reference and the
     ] ++ ffPop ++                                      -- collector moves it,
     [ "  ld   a1, 0(sp)", "  addi sp, sp, 16"          -- so it goes on the
     , "  FN_ROOT_POP a2"                               -- root stack; the
     , "  slli a1, a1, 2", "  add a2, a2, a1"           -- index is an int
     , "  sw   a0, 8(a2)"
     , enter64 ]
  ++ pm64 "_pm_bs_rd" "_bs_rd"
  ++ [ "  .balign 4, 0", "_bs_rd:" ] ++ ffPop ++
     [ "  FN_ROOT_PUSH a0" ] ++ ffPop ++
     [ "  FN_ROOT_POP a2"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  lw   a0, 8(a2)" ] ++ box64                    -- the raw byte
  ++ pm64 "_pm_arr_copy" "_arr_copy"
  ++ [ "  .balign 4, 0", "_arr_copy:" ] ++ ffPop ++
     [ "  lw a2, 4(a0)"                                 -- n
     , "  mv a1, a0"                                    -- heapWords uses t*
     ] ++ heapWords "copy" "a2" ++
     [ "  li t0, 0x3605b", "  sw t0, 0(t4)"
     , "  sw a2, 4(t4)"
     , "  addi t2, t4, 8", "  addi t0, a1, 8", "  mv t3, a2"
     , ".Lcopy:", "  beqz t3, .Lcopied"
     , "  lw t1, 0(t0)", "  sw t1, 0(t2)"
     , "  addi t2, t2, 4", "  addi t0, t0, 4", "  addi t3, t3, -1", "  j .Lcopy"
     , ".Lcopied:", "  fn_pbox a0, t4", "  fn_go a0" ]
  where
    -- the count lives in an argument register: allocation scratches t0-t2
    heapWords tag n =
      [ "  addi a4, " ++ n ++ ", 5", "  srli a4, a4, 2"   -- ceil((n+2)/4) boxes
      , "  fn_databox t4, zero", "  addi a4, a4, -1"
      , ".Lw_" ++ tag ++ ":", "  beqz a4, .Lwd_" ++ tag
      , "  fn_databox t5, zero", "  addi a4, a4, -1", "  j .Lw_" ++ tag
      , ".Lwd_" ++ tag ++ ":" ]

-- The two ways a fun program stops early: error/raise in the graph reaches
-- _error0, a foreign import that is actually called reaches _unimpfi_halt with
-- a0 at its name.  Both print to stderr and exit; neither returns.
haltBlobs64 :: [String]
haltBlobs64 =
     [ "  .balign 4, 0", "  .globl _caf_overflow", "_caf_overflow:", "  la a0, _cafmsg", "  j _unimpfi_halt"
     , "  .balign 4, 0", "_cafmsg:", "  .asciz \"fun: memoized-cell table full\""
     , "  .balign 4, 0", "_error0:", "  la a0, _errmsg", "  j _unimpfi_halt"
     , "  .balign 4, 0", "_unimpfi_halt:"
     , "  mv a1, a0"                              -- write(2, msg, len); exit(1)
     , "  mv a2, zero"
     , ".Lstrlen:", "  add a3, a1, a2", "  lbu a3, 0(a3)", "  beqz a3, .Lgotlen"
     , "  addi a2, a2, 1", "  j .Lstrlen"
     , ".Lgotlen:", "  li a0, 2", "  li a7, 64", "  ecall"
     , "  la a1, _nlmsg", "  li a2, 1", "  li a0, 2", "  li a7, 64", "  ecall"
     , "  li a0, 1", "  li a7, 93", "  ecall"
     , "  .balign 4, 0", "_errmsg:", "  .asciz \"mhs (fun): error\""
     , "  .balign 4, 0", "_nlmsg:", "  .asciz \"\\n\"", "  .balign 4, 0" ]

-- The rv64 entry.  Start-up does what the reducer cannot do for itself: it maps
-- a heap that is BELOW 2 GiB -- a heap word is a 32-bit reference and lw
-- sign-extends it, so every cell has to be reachable that way -- makes the
-- image writable, because a Turner update memoizes a redex by writing the
-- reduct back into the graph cell it came from and the graph is in .text, and
-- records argv for the io.arg* effects.  The macros hold the machine state in
-- memory, so it also seeds the spine pointer, the allocation pointer and
-- NF_ADDR.  Then it enters the graph at main.
start64S :: [String]
start64S =
  [ "  .text"
  , "  .globl _start"
  , "_start:"
  , "  mv   s2, sp"                  -- sp AT ENTRY: argc, argv[], envp[].  Taken
                                     -- first; the store that keeps it has to
                                     -- wait for the mprotect below.
  , "  li   a0, 0"                   -- the C stack, kernel-placed: the framed
  , "  li   a1, 0x10000000"          -- forcers nest on it, so give it room
  , "  li   a2, 3"                   -- PROT_READ|PROT_WRITE
  , "  li   a3, 0x22"                -- MAP_PRIVATE|MAP_ANONYMOUS
  , "  li   a4, -1"
  , "  li   a5, 0"
  , "  li   a7, 222"                 -- mmap
  , "  ecall"
  , "  li   t0, -4096"
  , "  bltu a0, t0, .Lcsok"          -- a branch reaches +-4 KiB and the halt is
  , "  j    _heap_fail"              -- at the far end of the runtime
  , ".Lcsok:"
  , "  add  sp, a0, a1"
  , "  addi sp, sp, -16"
  , "  li   s0, 0x20000000"          -- the heap, at a FIXED low address: the
  , "  li   s1, 0x8000000"           -- kernel would otherwise place it above
  , ".Lhmap:"                        -- 4 GiB, out of reach of a 32-bit word.
  , "  mv   a0, s0"                  -- 128 MiB; step down until one is granted.
  , "  mv   a1, s1"
  , "  li   a2, 7"                   -- RWX: the machine ENTERS heap cells
  , "  li   a3, 0x100032"            -- PRIVATE|ANON|FIXED_NOREPLACE
  , "  li   a4, -1"
  , "  li   a5, 0"
  , "  li   a7, 222"
  , "  ecall"
  , "  beq  a0, s0, .Lhok"
  , "  li   t1, 0x1000000"           -- 16 MiB at a time
  , "  sub  s1, s1, t1"
  , "  bgeu s1, t1, .Lhmap"
  , "  j    _heap_fail"
  , ".Lhok:"
  , "  la   a0, _start"              -- make the image writable: Turner updates
  , "  li   t0, -4096"               -- land in the graph, and _argv_base is ours
  , "  and  a0, a0, t0"              -- to write.  ld grants write permission
  , "  la   a1, _funtext_end"        -- only when an input section asks for it,
  , "  sub  a1, a1, a0"              -- which depends on what the graph happens
  , "  li   a2, 7"                   -- to contain -- so take it here.
  , "  li   a7, 226"                 -- mprotect
  , "  ecall"
  , "  la   t0, _argv_base"          -- NOW the store is safe
  , "  sd   s2, 0(t0)"
  , "  sw   zero, fn_rsp, t0"        -- an empty spine, no frame
  , "  sw   zero, fn_frame, t0"
  , "  sd   s0, fn_hp, t0"           -- the allocation pointer
  , "  la   s10, _rt_link"             -- pinned: the shared tails of the two
  , "  la   s9,  _rt_boxbody"
  , "  la   s8,  _rt_boxbody"          -- the pointer-box tail: same routine          -- commonest cells, so an emitted cell
                                       -- stays short
  , "  sd   s0, fn_heapbase, t0"      -- everything at or above this is data
  , "  add  t0, s0, s1"
  , "  sd   t0, fn_heapend, t1"
  , "  li   t1, 0x800000"              -- keep a margin in hand for what a blob
  , "  sub  t0, t0, t1"                -- allocates between two reductions
  , "  add  t1, s0, zero"
  , "  li   t2, 0x2000000"             -- the first pass is due after 32 MiB;
  , "  add  t1, t1, t2"                -- after that the collector paces
  , "  bltu t1, t0, .Lglim"            -- itself by what survived
  , "  mv   t1, t0"
  , ".Lglim:"
  , "  sd   t1, fn_gclimit, t2"
  , "  la   t0, _nf_epi"
  , "  sd   t0, fn_nfa, t1"          -- NF_ADDR: the NORMAL_FORM epilogue
  -- main is an IO action: it needs its continuation on the spine before it is
  -- entered, so the entry is a two-cell block exactly as on the rvfun target --
  -- a link cell carrying the WHNF continuation, then the transfer into main.
  , "  .globl _graph_entry"
  , "_graph_entry:"
  , "  fn_link _epilogue"
  , "  fn_elink main"
  , "  .balign 4, 0"
  , "  .globl _epilogue"
  , "_epilogue:"                     -- the reduction ended: main's IO has run,
  , "  FN_DEPTH t4"                  -- or main was a value and the answer is
  , "  beqz t4, .Lnoresult"          -- the box on top -- report it
  , "  fn_tor a0"
  , "  call fun_result"
  , ".Lnoresult:"
  , "  call fun_report_reductions"
  , "  li   a0, 0", "  li a7, 93", "  ecall"
  , "  .balign 4, 0"
  -- NORMAL FORM: an under-applied head.  Inside a nested force the spine holds
  -- only that frame, so drain it and resume the forcer, which discards or
  -- inspects the value as it sees fit.  With no force in flight the whole
  -- program reduced to a function, which is reported and is exit 71.
  , "_nf_epi:"
  , ".Lnfdrain:"
  , "  fn_pop t0"
  , "  bnez t0, .Lnfdrain"
  , "  la   t1, _force_resume"
  , "  ld   t1, 0(t1)"
  , "  beqz t1, .Lnf_top"
  , "  jr   t1"
  , ".Lnf_top:"
  , "  la   a1, _nfmsg", "  li a2, 36", "  li a0, 2", "  li a7, 64", "  ecall"
  , "  li   a0, 71", "  li a7, 93", "  ecall"
  , "  .balign 4, 0"
  , "_nfmsg:"
  , "  .asciz \"fun: normal form, nothing to resume\\n\""
  , "  .balign 4, 0"
  , "_heap_fail:"
  , "  la   a1, _hfmsg", "  li a2, 19", "  li a0, 2", "  li a7, 64", "  ecall"
  , "  li   a0, 70", "  li a7, 93", "  ecall"
  , "  .balign 4, 0"
  , "_hfmsg:"
  , "  .asciz \"fun: no heap\\n\""
  , "  .balign 8, 0"
  , "  .globl _argv_base"
  , "_argv_base:"
  , "  .skip 8" ]
  ++ rtWalk64

-- The interpreter for cells the runtime allocated.  The compiled graph is
-- native code and is entered by jumping to it, but a box, a knot or one of the
-- little blocks a blob assembles is built at run time and holds fun words in
-- native code, exactly like the compiled graph: a reduction WRITES the cells
-- it allocates as instructions, so a transfer is always just a jump and
-- nothing is ever interpreted.  These are the shared tails those cells jump
-- to, kept in pinned registers so each emitted cell stays short.
rtWalk64 :: [String]
rtWalk64 =
  -- The shared tails of the two commonest cells.  A graph that carries data --
  -- a benchmark with its input embedded as a list literal is 100k cons cells --
  -- would otherwise get the whole body of each one inline: the same code a
  -- hundred thousand times over, which is minutes of assembler and megabytes
  -- of text for what is really data.
  [ "  .balign 4, 0"
  , "  .globl _rt_link"
  , "_rt_link:"                      -- t4 = the target, t5 = this cell
  , "  FN_PUSH t4, t5"
  , "  addi t5, t5, FN_CELL_LINK"    -- one cell form, one stride
  , "  jr   t5"
  , "  .balign 4, 0"
  , "  .globl _rt_boxbody"
  , "_rt_boxbody:"                   -- t6 = the box cell + 8
  , "  addi t6, t6, -8"
  , "  FN_DEPTH t4"
  , "  beqz t4, .Lbb_nf"
  , "  FN_WV t4, 0"                  -- the continuation
  , "  FN_WS t5, 0"
  , "  FN_POPN 1"
  , "  FN_PUSH t6, t5"               -- the box hands ITSELF over
  , "  andi t4, t4, -4"
  , "  jr   t4"
  , ".Lbb_nf:"
  , "  la   t4, fn_nfa"
  , "  ld   t4, 0(t4)"
  , "  jr   t4"
  , "  .balign 4, 0" ]
