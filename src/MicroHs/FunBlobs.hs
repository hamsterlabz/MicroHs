module MicroHs.FunBlobs(
  linuxStartS,
  cmpBlobs, primBlobs, floatBlobs, effBlobs, haltBlobs,
  csrBlobs, csrRegs, arrBlobs, thinStartS, effBlobsThin, linuxStart32S) where
import Prelude(); import MHSPrelude
import Data.Char
import Data.List

-- The fun runtime's assembly blobs.
--
-- Everything the reducer cannot do by graph reduction alone lives here as a
-- small piece of RISC-V: the arithmetic and comparison primitives, the effect
-- atoms, the CSR accessors, the array and ByteString primitives, the framed
-- forcer, exceptions, and the process start-up.  They used to sit in
-- MicroHs.Main, which is a driver and had no business holding six hundred
-- lines of assembly.

-- rv64 Linux _start for --rvfun-linux: set the fun heap CSR, then run the fun
-- entry `main`. `main` is the reduced IO action; any text IO it performs is done
-- by the language's lowest-level IO primitives, which are foreign calls into C
-- functions linked into this same ELF (the reducer executes them). On return,
-- exit cleanly.
linuxStartS :: Bool -> Bool -> String   -- io, rv32
-- --rvfun-linux PC reducer: each arithmetic primitive is an RV32 blob entered via
-- fn.elink. It unboxes the two operand boxes (fn.tor), runs a real 32-bit RV32 op,
-- and fn.databox'es the result (which swaps the R-stack top + branches to the
-- continuation). Boxes/operands are 32-bit; the *w ops give 32-bit semantics.
-- compare blobs: fn.tor the 2 operands, RV32-branch on the comparison, then fall
-- into the inline False (K, picks rstack[0]=else) or True (A, picks rstack[1]=then)
-- combinator word -- which is itself a reduction branch (no Bool atom, no resume).
cmpBlobs :: [String]
cmpBlobs = fforceBlob ++ catchBlob ++ bsBlobs ++ seqBlob ++ concatMap blob
  [ ("_prim_eq","beq a0,a1"),  ("_prim_ne","bne a0,a1")
  , ("_prim_lt","blt a0,a1"),  ("_prim_ge","bge a0,a1")
  , ("_prim_le","bge a1,a0"),  ("_prim_gt","blt a1,a0")
  , ("_prim_ltu","bltu a0,a1"),("_prim_geu","bgeu a0,a1")
  , ("_prim_leu","bgeu a1,a0"),("_prim_gtu","bltu a1,a0") ]
  ++ floatBlobs
  where
    -- seq a b = force a to WHNF (strict), then return b. A standalone fn.force has no
    -- valid pc+4 continuation, so seq must be a blob: fn.force a0, then the A combinator
    -- (type0 ar2 arg0=1) consumes both args and returns rstack[1] = b.
    -- seq a b = force a, then evaluate b.  This must NOT be spelled with a combi
    -- word.  The record-free update takes the redex root to be ws(carity-1), the
    -- SOURCE of the deepest consumed spine entry.  Inside a graph block that
    -- source IS the block cell holding the redex, so the update is right; but a
    -- blob is entered by whoever walked into it, so the sources are unrelated
    -- graph cells and the update lands on one of them.  When the argument is a Y
    -- knot its self-pointer gets overwritten, which ties the knot to an
    -- indirection back to itself and the walk can never leave.  Pop the two
    -- entries explicitly and enter b: same reduct, no update.
    -- seq a b: eval.c line 3410 (seq x y = evali(x); pop 2; indirect y), with
    -- evali's frame -- a C local in the runtime -- held on the C STACK here.
    -- The outer spine is spilled to sp, the nested reduction of a runs on an
    -- empty spine over one planted continuation entry, and every WHNF shape
    -- terminates into the runtime: a box enters the continuation, a Scott
    -- constructor consumes it as its case continuation, an under-applied head
    -- raises NORMAL_FORM whose epilogue drains the frame and jumps via
    -- _force_resume.  The resume rebuilds the spilled spine as a heap block of
    -- links (deepest first, ending in an elink to b) and walks it.
    -- seq discards the forced value, so its delivery shape never matters.
    -- seq a b: eval.c line 3410 (seq x y = evali(x); pop 2; indirect y), with
    -- evali's frame as machine state.  CSR 0x7c2 write ~0 captures the current
    -- spine depth as the FRAME BASE: the spine below it becomes invisible to
    -- every window read and depth gate, so the nested reduction of a can
    -- neither consume nor corrupt the caller's spine (eval.c's CHECK against
    -- stk).  Any WHNF at the frame boundary -- a box with no continuation, an
    -- under-applied combinator (PAP or Scott constructor), Y/enter/seq on an
    -- empty frame -- branches to NF_ADDR; the epilogue drains the frame
    -- remnants (frame-relative pops stop at the base) and jumps to the
    -- innermost forcer's resume.  The resume restores the enclosing frame and
    -- resume from the C stack -- evali's locals live on the C stack -- and
    -- enters b on the intact outer spine: POP(2); GOIND(y).  seq discards the
    -- forced value, so no delivery of it is needed.
    -- Packed ByteString comparison.  A ByteString is an array reference block --
    -- word 0 the length, one byte per word after it -- so equality and
    -- ordering are a loop in RISC-V here instead of a walk over cons cells in
    -- the graph.  This is the compiler's hottest operation: every identifier
    -- lookup compares two of them.  The first reference block has to survive forcing the
    -- second, so it goes on the C stack, which is re-entrant and is scanned by
    -- the collector.
    bsBlobs =
      [ "  .balign 4"
      , "_pm_bs_eq:", "  .word 0x0000105b", "  .word _bs_eq+1"
      , "  .balign 4"
      , "_bs_eq:"
      , "  fn.pop a0", "  jal ra, _fforce"     -- x's reference block
      , "  addi sp, sp, -8", "  sw a0, 0(sp)"
      , "  fn.pop a0", "  jal ra, _fforce"     -- y's reference block
      , "  lw   a2, 0(sp)", "  addi sp, sp, 8"
      , "  lw   t0, 16(a2)"                    -- size x (fn.array node)
      , "  lw   t1, 16(a0)"                    -- size y
      , "  bne  t0, t1, 8f"
      , "  addi a2, a2, 20", "  addi a0, a0, 20"
      , "1:"
      , "  beqz t0, 9f"
      , "  lw   t2, 0(a2)", "  lw   t3, 0(a0)"
      , "  bne  t2, t3, 8f"
      , "  addi a2, a2, 4", "  addi a0, a0, 4"
      , "  addi t0, t0, -1", "  j 1b"
      , "8:", "  fn.combi.t0 2, [0,0,0,0,0,0]"   -- False
      , "9:", "  fn.combi.t0 2, [1,0,0,0,0,0]"   -- True
      , "  .balign 4"
      , "_pm_bs_cmp:", "  .word 0x0000105b", "  .word _bs_cmp+1"
      , "  .balign 4"
      , "_bs_cmp:"
      , "  fn.pop a0", "  jal ra, _fforce"
      , "  addi sp, sp, -8", "  sw a0, 0(sp)"
      , "  fn.pop a0", "  jal ra, _fforce"
      , "  lw   a2, 0(sp)", "  addi sp, sp, 8"
      , "  lw   t0, 16(a2)"                    -- size x (fn.array node)
      , "  lw   t1, 16(a0)"                    -- size y
      , "  addi a2, a2, 20", "  addi a0, a0, 20"
      , "1:"                                   -- compare the common prefix
      , "  beqz t0, 6f"                        -- x exhausted
      , "  beqz t1, 8f"                        -- y exhausted: x > y
      , "  lw   t2, 0(a2)", "  lw   t3, 0(a0)"
      , "  bltu t2, t3, 7f"
      , "  bltu t3, t2, 8f"
      , "  addi a2, a2, 4", "  addi a0, a0, 4"
      , "  addi t0, t0, -1", "  addi t1, t1, -1"
      , "  j 1b"
      , "6:", "  bnez t1, 7f"                  -- x shorter: LT
      , "  fn.combi.t0 3, [1,0,0,0,0,0]"       -- EQ
      , "7:", "  fn.combi.t0 3, [0,0,0,0,0,0]" -- LT
      , "8:", "  fn.combi.t0 3, [2,0,0,0,0,0]" -- GT
      , "  .balign 4" ]

    -- exceptions; see the note above catchBlob in this module.
    -- exceptions; see the note above catchBlob in this module.  The record
    -- holds everything an unwind has to put back: the handler and the
    -- continuation, the C stack, the enclosing evaluation frame and the
    -- enclosing forcer's resume, and the spine DEPTH at install time -- a
    -- raise has to discard whatever the abandoned action left on the spine,
    -- which is a drain down to that depth, not just a frame write.
    catchBlob =
      [ "  .balign 4"
      , "_pm_catch:", "  .word 0x0000105b", "  .word _catch+1"
      , "  .balign 4"
      , "_catch:"
      , "  fn.pop a0"                    -- the action
      , "  fn.pop a1"                    -- the handler
      , "  fn.pop a2"                    -- the IO continuation
      , "  addi sp, sp, -32"
      , "  la   t0, _exc_top"
      , "  lw   t1, 0(t0)"
      , "  sw   t1, 0(sp)"               -- previous record
      , "  csrr t1, 0x7c2"
      , "  sw   t1, 20(sp)"              -- enclosing frame
      , "  la   t3, _force_resume"
      , "  lw   t1, 0(t3)"
      , "  sw   t1, 24(sp)"              -- enclosing forcer's resume
      , "  li   t1, -1"
      , "  csrw 0x7c2, t1"               -- frame := depth, and read it back:
      , "  csrr t1, 0x7c2"               -- that depth is what a raise unwinds to
      , "  sw   t1, 4(sp)"
      , "  addi t1, sp, 32"
      , "  sw   t1, 8(sp)"               -- sp to restore
      , "  sw   a1, 12(sp)"              -- handler
      , "  sw   a2, 16(sp)"              -- continuation
      , "  la   t1, _fun_frame_sp"
      , "  lw   t1, 0(t1)"
      , "  sw   t1, 28(sp)"              -- frame depth to unwind to
      , "  sw   sp, 0(t0)"               -- this record is now innermost
      , "  fn.databox t2, zero"          -- [link _catch_done][elink action]
      , "  la   t1, _catch_done"
      , "  sw   t1, 0(t2)"
      , "  andi a0, a0, -4"
      , "  ori  a0, a0, 1"
      , "  sw   a0, 4(t2)"
      , "  jr   t2"
      , "  .balign 4"
      , "_catch_done:"                   -- the action returned; value on top
      , "  fn.pop a0"                    -- the value
      , "  la   t0, _exc_top"
      , "  lw   t1, 0(t0)"
      , "  lw   t2, 0(t1)"
      , "  sw   t2, 0(t0)"               -- pop the record
      , "  lw   a2, 16(t1)"              -- the continuation
      , "  lw   t3, 20(t1)"
      , "  csrw 0x7c2, t3"               -- enclosing frame back
      , "  lw   t3, 28(t1)"
      , "  la   t4, _fun_frame_sp"
      , "  sw   t3, 0(t4)"               -- and the frames it had pushed
      , "  la   t4, _force_resume"
      , "  lw   t3, 24(t1)"
      , "  sw   t3, 0(t4)"
      , "  lw   sp, 8(t1)"
      , "  fn.databox t2, zero"          -- [link value][elink k] = k value
      , "  andi a0, a0, -4"
      , "  sw   a0, 0(t2)"
      , "  andi a2, a2, -4"
      , "  ori  a2, a2, 1"
      , "  sw   a2, 4(t2)"
      , "  jr   t2"
      , "  .balign 4"
      , "_raise:"                        -- primRaise e: e is the only argument
      , "  fn.pop a0"                    -- the exception
      , "  la   t0, _exc_top"
      , "  lw   t1, 0(t0)"
      , "  beqz t1, _raise_top"          -- uncaught
      , "  lw   t2, 0(t1)"
      , "  sw   t2, 0(t0)"               -- pop the record
      , "  lw   t3, 4(t1)"
      , "  csrw 0x7c2, t3"               -- frame := the install depth, so that
      , "1:"                             -- fn.pop stops exactly there, and drain
      , "  fn.pop t4"                    -- the abandoned action's spine away
      , "  bnez t4, 1b"
      , "  lw   t3, 20(t1)"
      , "  csrw 0x7c2, t3"               -- now the enclosing frame is current
      , "  lw   t3, 28(t1)"
      , "  la   t4, _fun_frame_sp"
      , "  sw   t3, 0(t4)"               -- and the frames it had pushed
      , "  la   t4, _force_resume"
      , "  lw   t3, 24(t1)"
      , "  sw   t3, 0(t4)"               -- and the enclosing forcer's resume
      , "  lw   a1, 12(t1)"              -- handler
      , "  lw   a2, 16(t1)"              -- continuation
      , "  lw   sp, 8(t1)"
      , "  fn.databox t2, zero"          -- three words: [k][e][elink handler]
      , "  fn.databox t3, zero"
      , "  andi a2, a2, -4"
      , "  sw   a2, 0(t2)"               -- pushed first: deepest = k
      , "  andi a0, a0, -4"
      , "  sw   a0, 4(t2)"               -- then e, the handler's first argument
      , "  andi a1, a1, -4"
      , "  ori  a1, a1, 1"
      , "  sw   a1, 8(t2)"               -- elink handler
      , "  jr   t2"
      , "  .balign 4"
      , "_raise_top:"                    -- nothing to catch it
      , "  la   a0, _excmsg"
      , "  j    _unimpfi_halt"
      , "  .balign 4"
      , "_excmsg:"
      , "  .asciz \"uncaught exception\""
      , "  .balign 8"
      , "_exc_top:"                      -- innermost handler record; 0 = none
      , "  .skip 8" ]

    -- the shared framed-force subroutine; see the module comment on seqBlob.
    -- IN: a0 = the node to force (raw ref); OUT: a0 = the box payload.
    -- Clobbers t-registers; preserves everything via the C stack.
    -- spill the caller's spine into a fresh frame; the machine is left at
    -- depth 0, so the nested reduction's own depth is the only one the arity
    -- gate sees. Ends with the elink that resumes RESUME once the frame is
    -- walked back in. Clobbers t0-t6.
    -- enter a frame: the caller's spine stays put, the machine simply stops
    -- counting it. Clobbers t0-t3.
    enterFrame :: String -> String -> [String]
    enterFrame mark resume =
      [ "  csrr t3, 0x7cb"                 -- the enclosing frame base
      , "  la   t0, _fun_frame_sp"
      , "  lw   t1, 0(t0)"
      , "  la   t2, " ++ resume
      , "  sw   t2, 0(t1)"
      , (if mark == "0" then "  li   t2, 0" else "  la   t2, " ++ mark)
      , "  sw   t2, 4(t1)"                 -- drain down to this (0 = to the base)
      , "  sw   t3, 8(t1)"                 -- and restore this base
      , "  addi t2, t1, 12"
      , "  la   t3, _fun_frames_end"
      , "  bltu t2, t3, 8f"
      , "  la   a0, _fsomsg"
      , "  j    _unimpfi_halt"
      , "8:"
      , "  sw   t2, 0(t0)"
      , "  li   t2, -1"
      , "  csrw 0x7cb, t2" ]               -- frame := the current depth

    -- THE HARDWARE FORCE. This used to build an entry block
    -- [link resume][elink thunk], push a software frame and set the frame base
    -- (csrw 0x7cb, -1), then jump into the block. On this machine that does
    -- not deliver the box: measured at _fforce_resume, the spine top was still
    -- the RESUME LINK, not the forced box, so the following fn.tor read
    -- _fforce_resume+4 (the next instruction word) instead of the payload.
    -- Every software-visible quantity was correct -- the block contents, the
    -- thunk node, the spine depth (4 in, 5 at the resume) -- and no amount of
    -- separation or fencing changed it.
    --
    -- fn.force is the instruction for exactly this: pop the value, push the
    -- continuation (this cell + 4) keeping the source, and enter the value.
    -- The min-caml runtime forces this way and its whole benchmark set passes,
    -- so this is the proven path on this target. ra goes on the C stack
    -- because the nested reduction runs arbitrary blobs and every one of them
    -- uses it.
    fforceBlob =
      [ "  .balign 4"
      , "_fforce:"
      , "  addi sp, sp, -16"
      , "  sw   ra, 0(sp)"
      , "  .word 0x0205305b"             -- fn.pushp a0: the thunk, raw
      , "  .word 0x0000505b"             -- fn.force:   pop it, enter it
      , "  .word 0x0000255b"             -- fn.tor a0:  <- resumes here, payload
      , "  lw   ra, 0(sp)"
      , "  addi sp, sp, 16"
      , "  ret"
      , "  .balign 4"
      , "_fforce_nf:"                    -- WHNF was not data: type garbage
      , "  la   a0, _fforce_msg"
      , "  j    _unimpfi_halt"
      , "  .balign 4"
      , "_fforce_msg:"
      , "  .asciz \"fforce: non-data WHNF\""
      , "  .balign 4" ]

    -- drop the innermost frame; the resume reached us the ordinary way.
    popFrame :: [String]
    popFrame =
      [ "  la   t0, _fun_frame_sp"
      , "  lw   t1, 0(t0)"
      , "  addi t1, t1, -12"
      , "  sw   t1, 0(t0)"
      , "  lw   t2, 8(t1)"
      , "  csrw 0x7cb, t2" ]               -- the enclosing frame is current again

    seqBlob =
      [ "  .balign 4"
      , "_seq:"
      , "  fn.pop a0"                      -- a, the expression to force
      , "  fn.pop a1"                      -- b
      , "  beqz a1, _error0"               -- degenerate application
      , "  addi sp, sp, -8"
      , "  sw   a1, 4(sp)"                 -- b; the collector scans the C stack
      ] ++ enterFrame "0" "_seq_resume" ++
      [ "  andi a0, a0, -4"
      , "  jr   a0"                        -- force a in its own frame: an
                                           -- under-applied head is now really
                                           -- under-applied
      , "  .balign 4"
      , "_seq_resume:"                     -- a reached WHNF, whatever shape.
                                           -- The epilogue popped the frame and
                                           -- put the enclosing base back.
      , "  lw   t2, 4(sp)"
      , "  addi sp, sp, 8"
      , "  andi t2, t2, -4"
      , "  jr   t2"                        -- seq discards the value: enter b
      , "  .balign 4"
      -- The WHNF epilogue: NF_ADDR points here, so every terminal the machine
      -- cannot reduce arrives here - an under-applied head, or a value with no
      -- continuation (which rides in on the spine).
      , "  .globl _whnf_epi"
      , "_whnf_epi:"
      , "  la   t0, _fun_frame_sp"
      , "  lw   t1, 0(t0)"
      , "  la   t2, _fun_frames"
      , "  beq  t1, t2, 6f"                -- no frame: nothing left to resume
      , "  lw   t3, -12(t1)"               -- the innermost frame: its resume
      , "  lw   t4, -8(t1)"                -- what to drain down to
      , "  lw   t5, -4(t1)"                -- and the enclosing base
      , "  addi t1, t1, -12"
      , "  sw   t1, 0(t0)"                 -- pop it
      -- the abandoned evaluation left its arguments in this frame; drop them.
      -- fn.pop stops at the base by itself, reading 0 there.
      , "5:"
      , "  fn.pop a3"
      , "  beqz a3, 7f"
      , "  bne  a3, t4, 5b"
      , "7:"
      , "  csrw 0x7cb, t5"                 -- the enclosing frame is current
      , "  jr   t3"
      , "6:"
      , "  la   a0, _nfmsg"
      , "  j    _unimpfi_halt"
      , "  .balign 4"
      , "_nfmsg:"
      , "  .asciz \"fun: normal form\\n\""
      , "  .balign 4"
      , "_fsomsg:"
      , "  .asciz \"fun: frame stack overflow\\n\""
      , "  .balign 8"
      , "_force_resume:"                   -- innermost forcer's resume; 0 = none
      , "  .skip 8"
      -- The frame stack: program memory, both ends exported. The collector
      -- walks [_fun_frames, _fun_frame_sp) with the rest of the roots.
      , "  .balign 8"
      , "  .globl _fun_frame_sp"
      , "_fun_frame_sp:"
      , "  .word _fun_frames"
      , "  .balign 8"
      , "  .globl _fun_frames"
      , "_fun_frames:"
      , "  .skip 8192"
      , "  .globl _fun_frames_end"
      , "_fun_frames_end:"
      -- GC SAFEPOINT WRAPPER + the software trigger word. Self-contained in
      -- the runtime section so gmhs's intermediate standalone link resolves;
      -- fun_gc_run is a WEAK ref -- images without a collector linked just
      -- skip the call. Entered with 'jal t0, _gc_safepoint'. The full caller
      -- state goes on the C stack, which the collector scans as roots, so
      -- every saved graph pointer is restored FORWARDED.
      , "  .balign 4"
      , "  .weak fun_gc_run"
      , "  .globl _gc_safepoint"
      , "_gc_safepoint:"
      -- Drain the fetch before anything else. The poll sits mid-blob and the
      -- fetch unit runs ahead: it has gathered spine nodes for this slot that
      -- fRsp has not counted and that live in pipeline registers, not memory.
      -- The collector cannot see or rewrite those, so the reduction resumed
      -- against pre-collection references and jumped into from-space.
      , "  fence"
      , "  fence.i"
      , "  addi sp, sp, -128"
      , "  sw   t0, 76(sp)"
      , "  sw   ra, 0(sp)"
      , "  sw   t1, 8(sp)"
      , "  sw   t2, 12(sp)"
      , "  sw   a0, 16(sp)"
      , "  sw   a1, 20(sp)"
      , "  sw   a2, 24(sp)"
      , "  sw   a3, 28(sp)"
      , "  sw   a4, 32(sp)"
      , "  sw   a5, 36(sp)"
      , "  sw   a6, 40(sp)"
      , "  sw   a7, 44(sp)"
      , "  sw   t3, 52(sp)"
      , "  sw   t4, 56(sp)"
      , "  sw   t5, 60(sp)"
      , "  sw   t6, 64(sp)"
      -- s0-s11 TOO.  The collector finds its roots by scanning this frame, and
      -- a scan can only forward what it can see: a graph pointer sitting in a
      -- callee-saved register is invisible, survives the pass unrelocated, and
      -- still points into from-space.  Nothing fails at the collection -- it
      -- fails whenever that register is next dereferenced, which is why the
      -- compile ran on correctly past the pass and only then read garbage.
      , "  sw   s0, 80(sp)"
      , "  sw   s1, 84(sp)"
      , "  sw   s2, 88(sp)"
      , "  sw   s3, 92(sp)"
      , "  sw   s4, 96(sp)"
      , "  sw   s5, 100(sp)"
      , "  sw   s6, 104(sp)"
      , "  sw   s7, 108(sp)"
      , "  sw   s8, 112(sp)"
      , "  sw   s9, 116(sp)"
      , "  sw   s10, 120(sp)"
      , "  sw   s11, 124(sp)"
      , "  la   t1, fun_gc_run"
      , "  beqz t1, 1f"
      , "  mv   a0, sp"
      , "  jalr ra, 0(t1)"
      , "1:"
      , "  lw   ra, 0(sp)"
      , "  lw   t1, 8(sp)"
      , "  lw   t2, 12(sp)"
      , "  lw   a0, 16(sp)"
      , "  lw   a1, 20(sp)"
      , "  lw   a2, 24(sp)"
      , "  lw   a3, 28(sp)"
      , "  lw   a4, 32(sp)"
      , "  lw   a5, 36(sp)"
      , "  lw   a6, 40(sp)"
      , "  lw   a7, 44(sp)"
      , "  lw   t3, 52(sp)"
      , "  lw   t4, 56(sp)"
      , "  lw   t5, 60(sp)"
      , "  lw   t6, 64(sp)"
      , "  lw   s0, 80(sp)"
      , "  lw   s1, 84(sp)"
      , "  lw   s2, 88(sp)"
      , "  lw   s3, 92(sp)"
      , "  lw   s4, 96(sp)"
      , "  lw   s5, 100(sp)"
      , "  lw   s6, 104(sp)"
      , "  lw   s7, 108(sp)"
      , "  lw   s8, 112(sp)"
      , "  lw   s9, 116(sp)"
      , "  lw   s10, 120(sp)"
      , "  lw   s11, 124(sp)"
      , "  lw   t0, 76(sp)"
      , "  addi sp, sp, 128"
      , "  fence.i"
      , "  jr   t0"
      , "  .balign 4"
      , "  .globl fn_gc_trig"
      , "fn_gc_trig:"
      , "  .word 0xffffffff" ]

    blob (sym, br) =
      [ "  .balign 4"
      , sym ++ ":"
      , "  .word 0x0000255b"            -- fn.tor a0  (operands pre-forced via opInfix)
      , "  .word 0x000025db"            -- fn.tor a1
      , "  " ++ br ++ ",1f"             -- branch taken == comparison True
      , "  fn.combi.t0 2, [0,0,0,0,0,0]"  -- False = K (type0 ar2 arg0=0) -> rstack[0] = else
      , "1:"
      , "  fn.combi.t0 2, [1,0,0,0,0,0]" ]-- True  = A (type0 ar2 arg0=1) -> rstack[1] = then

-- THE GC SAFEPOINT POLL IS GONE: heap availability is checked IN HARDWARE,
-- before every instruction that allocates heap nodes.  The comparator on
-- CSR 0x7fd fires on a committing fn.databox and on every committing
-- staged reduction (combi / fn.y / morphism) whose post-commit hp crosses
-- the armed limit, AFTER the commit -- allocation done, spine moved,
-- update queued -- resuming at GC_EPC.  The old fetch-side displacement
-- that could skip a reduction is not how it fires; nothing is in flight.
-- The six-instruction software poll this used to splice after every box
-- site cost dead instructions in every program and still left multi-MB
-- poll-free allocation stretches (Parser) that overran small semispaces.
-- fn_gc_trig and _gc_safepoint stay in the runtime blob: the collector
-- links against the trigger word as its own pacing state.
gcPoll :: [String]
gcPoll = []

-- F32 float blobs (the user-approved single-precision path: a float is a
-- 1-word IEEE binary32 payload in the standard databox, computed on the F
-- datapath). Binary arith mirrors _prim_add (operands pre-forced via
-- opInfix; Y-wrapped, so the blob closes with fn.update). Compares mirror
-- cmpBlobs (combi branch select; float compares write an INT register).
-- Unary ops (fneg/fsqrt/itof/ftoi) are NOT opInfix-managed: the blob
-- fn.forces its single arg first, and produces an un-memoized box (no
-- update leg - same tail as the csrr blobs). fcvt.w.s uses rtz (C cast).
floatBlobs :: [String]
floatBlobs =
     concatMap arith
       [ ("_prim_fadd", "fadd.s"), ("_prim_fsub", "fsub.s")
       , ("_prim_fmul", "fmul.s"), ("_prim_fdiv", "fdiv.s") ]
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
       , ("_prim_ftoi",  [ "  fmv.w.x fa0, a0", "  fcvt.w.s a0, fa0, rtz" ])
       -- sin/cos: Payne-Hanek-lite range reduction to [-pi/4,pi/4] plus the
       -- degree-9/8 minimax polynomials, then the quadrant select. Same
       -- routine the min-caml runtime uses, which is the only sin/cos this
       -- target has ever had; mhs had no primitive for either.
       , ("_prim_fsin",  [ "  fmv.w.x fa0, a0", "  jal ra, _fsincos"
                         , "  andi t0, a1, 3"
                         , "  beqz t0, 1f"
                         , "  li   t1, 1", "  beq t0, t1, 2f"
                         , "  li   t1, 2", "  beq t0, t1, 3f"
                         , "  fneg.s fa0, ft5", "  j 4f"
                         , "1:", "  fmv.s fa0, ft3", "  j 4f"
                         , "2:", "  fmv.s fa0, ft5", "  j 4f"
                         , "3:", "  fneg.s fa0, ft3"
                         , "4:", "  fmv.x.w a0, fa0" ])
       , ("_prim_fcos",  [ "  fmv.w.x fa0, a0", "  jal ra, _fsincos"
                         , "  andi t0, a1, 3"
                         , "  beqz t0, 1f"
                         , "  li   t1, 1", "  beq t0, t1, 2f"
                         , "  li   t1, 2", "  beq t0, t1, 3f"
                         , "  fmv.s fa0, ft3", "  j 4f"
                         , "1:", "  fmv.s fa0, ft5", "  j 4f"
                         , "2:", "  fneg.s fa0, ft3", "  j 4f"
                         , "3:", "  fneg.s fa0, ft5"
                         , "4:", "  fmv.x.w a0, fa0" ]) ]
  ++ sincosHelper
  where
    arith (sym, op) =
      [ "  .balign 4"
      , sym ++ ":"
      , "  fn.tor a0"                   -- operands pre-forced via opInfix
      , "  fn.tor a1"
      , "  fmv.w.x fa0, a0"
      , "  fmv.w.x fa1, a1"
      , "  " ++ op ++ " fa0, fa0, fa1"
      , "  fmv.x.w a0, fa0"
      ] ++ gcPoll ++ [ "  fn.databox a0" ]   -- box OVER the knot (see primBlobs)
    cmp (sym, cmpi, br) =
      [ "  .balign 4"
      , sym ++ ":"
      , "  .word 0x0000255b"            -- fn.tor a0
      , "  .word 0x000025db"            -- fn.tor a1
      , "  fmv.w.x fa0, a0"
      , "  fmv.w.x fa1, a1"
      , "  " ++ cmpi
      , "  " ++ br ++ " a0, 1f"         -- taken == comparison True
      , "  fn.combi.t0 2, [0,0,0,0,0,0]"  -- False = K -> rstack[0] = else
      , "1:"
      , "  fn.combi.t0 2, [1,0,0,0,0,0]" ]-- True  = A -> rstack[1] = then
    unary (sym, body) =
      [ "  .balign 4"
      , sym ++ ":"
      , "  .word 0x0000505b"            -- fn.force: reduce the arg to a WHNF box
      , "  .word 0x0000255b" ]          -- fn.tor a0
      ++ body ++
      [ "  .word 0x0005755b"            -- fn.databox a0, a0
      ] ++ gcPoll ++ [ "  jr a0" ]                     -- enter the box (no update: un-memoized)

-- effect blobs (rvfun PC reducer). io.putb/io.putbf b k = write b; enter k. arity-2
-- marker (rsp>=2) like the prims; the blob forces+unboxes the arg, performs the
-- effect, then fn.enter pops the continuation k and tail-jumps to it.
--   bare=True  : stdout is a 16550-compatible UART at 0x10011000 (poll LSR@5 THRE
--                bit5, then store THR@0) -- bare-metal blackbird (rv64).
--   bare=False : the Linux write ecall (blackbird-under-Linux, or QEMU virt).
-- Generic CSR access (perf self-reporting + future PMCs) is in csrBlobs below.
effBlobs :: Bool -> [String]
effBlobs bare =
     pm "_pm_putb"  "_io_putb"  ++ [ "  .balign 4", "_io_putb:",  ff1, ff2 ] ++ wrByteStdout ++ [ enter ]
  ++ pm "_pm_setfd" "_io_setfd" ++ [ "  .balign 4", "_io_setfd:", ff1, ff2
                                   , "  la a1, _cur_fd", "  sw a0, 0(a1)", enter ]
  ++ pm "_pm_putbf" "_io_putbf" ++ [ "  .balign 4", "_io_putbf:", ff1, ff2 ] ++ wrByteFd ++ [ enter ]
  -- no filesystem under a bare image: the path is swallowed and the open
  -- fails, which openFile reports as "does not exist"
  ++ pm "_pm_pathc" "_io_pathc"
  ++ [ "  .balign 4", "_io_pathc:", ff1, ff2, enter ]
  ++ [ "  .balign 4", "_io_open:", ff1, ff2, "  li a0, -1", "  ret" ]
  ++ csrBlobs
  ++ arrBlobs
  ++ haltBlobs bare
  ++ [ "  .balign 8", "_iobuf:", "  .skip 8", "  .balign 8", "_cur_fd:", "  .skip 8" ]
  where
    -- the framed force: pop the raw arg, force it inside a frame (_fforce)
    ff1     = "  fn.pop a0"
    ff2     = "  jal ra, _fforce"
    enter   = "  .word 0x0000000b"        -- fn.enter (pop k, tail-jump)
    pm p b  = [ "  .balign 4", p ++ ":", "  .word 0x0000105b", "  .word " ++ b ++ "+1" ]
    uartTx  = [ "  li a1, 0x10011000", "1:", "  lbu a2, 0x14(a1)", "  andi a2, a2, 0x20"
              , "  beqz a2, 1b", "  sb a0, 0(a1)" ]   -- 16550, WORD-indexed regs (mk22
              -- axil_uart: off = addr[4:2], LSR at byte 0x14): poll THRE, write THR
    ecW fdimm = [ "  la a1, _iobuf", "  sb a0, 0(a1)" ] ++ fdimm
                ++ [ "  li a2, 1", "  li a7, 64", "  ecall" ]
    wrByteStdout | bare      = uartTx
                 | otherwise = ecW [ "  li a0, 1" ]                 -- fd = stdout
    wrByteFd     | bare      = uartTx                               -- bare: all -> UART
                 | otherwise = ecW [ "  la a2, _cur_fd", "  lw a0, 0(a2)" ]  -- fd = current_fd

-- The two ways a fun program stops early.  `error`/`raise` in the graph reach
-- _error0; a foreign import that is actually called reaches _unimpfi_halt with
-- a0 pointing at its name (GenRomMem.ffiText).  Both print to stderr and stop:
-- an ecall exit under Linux, the UART and a spin on the bare SoC (which has no
-- exit to make).  Neither returns, so no continuation is needed.
haltBlobs :: Bool -> [String]
haltBlobs bare =
     [ "  .balign 4", "_error0:", "  la a0, _errmsg", "  j _unimpfi_halt"
     , "  .balign 4", "_unimpfi_halt:" ]          -- a0 = a NUL-terminated message
  ++ (if bare
      then [ "  mv a1, a0"                        -- bare: 16550 UART, then END
           , "1:", "  lbu a2, 0(a1)", "  beqz a2, 2f"
           , "  li a3, 0x10011000"
           , "3:", "  lbu a4, 0x14(a3)", "  andi a4, a4, 0x20", "  beqz a4, 3b"
           , "  sb a2, 0(a3)", "  addi a1, a1, 1", "  j 1b"
           -- the message is out; now STOP. A halted program has said
           -- everything it is going to say, and spinning here just burns the
           -- run's whole cycle budget after the fact (fish printed NORMAL
           -- FORM and then spun for another half hour). tohost is where this
           -- harness watches; 3 = stopped without a value.
           , "2:", "  li a3, 0x10012000", "  li a4, 3", "  sw a4, 0(a3)"
           , "4:", "  j 4b" ]
      else [ "  mv a1, a0"                        -- Linux: write(2, msg, len); exit(1)
           , "  mv a2, zero"
           , "1:", "  add a3, a1, a2", "  lbu a3, 0(a3)", "  beqz a3, 2f"
           , "  addi a2, a2, 1", "  j 1b"
           , "2:", "  li a0, 2", "  li a7, 64", "  ecall"
           , "  la a1, _nlmsg", "  li a2, 1", "  li a0, 2", "  li a7, 64", "  ecall"
           , "  li a0, 1", "  li a7, 93", "  ecall" ])
  ++ [ "  .balign 4", "_errmsg:", "  .asciz \"mhs (fun): error\""
     , "  .balign 4", "_nlmsg:", "  .asciz \"\\n\"", "  .balign 4" ]

-- Generic CSR read/write blobs (target-independent; csrr/csrw work bare + Linux).
-- A Haskell `primitive "csrr 0xNNN"` (arity-1: just k) -> fn.elink _csrr_0xNNN ->
-- csrr a0,0xNNN; fn.databox (boxed Int).  `primitive "csrw 0xNNN"` (arity-2: val+k)
-- -> _pm_csrw_0xNNN -> _csrw_0xNNN: unbox val; csrw 0xNNN,a0; fn.enter.
-- csrRegs is the set with generated blobs. 0x7e8.. are RESERVED for future PMCs so
-- new counters need only an RTL change + a Haskell `primitive "csrr 0x7eN"` line.
csrRegs :: [String]
csrRegs = [ "0xb00", "0xb02", "0xc00", "0xc02"   -- mcycle, minstret, cycle, instret
          , "0x320"                              -- mcountinhibit (start/stop)
          , "0x7d0", "0x7d2", "0x7d4", "0x7d6"   -- CHPM: wb_bubble, trap_flush,
          , "0x7d8", "0x7da", "0x7dc", "0x7de"   --   br_redir, stall_mem, stall_mul,
          , "0x7e0", "0x7e2", "0x7e4"            --   fetch_starve, stall_ld, misp_nt,
                                                 --   misp_taken, wb_real_bubble, wb_fresh_lag
          , "0x7e6", "0x7e7"                     -- combi_alloc lo/hi
          , "0x7e8", "0x7e9", "0x7ea", "0x7eb"   -- fun: disp, stall, combi, cells
          , "0x7ec", "0x7ed", "0x7ee", "0x7ef" ] -- fun: tor, upd (+2 reserved)
-- Mutable-array blobs (Primitives.primArr*).  An IOArray is a header word (the
-- element count) followed by one word per element, allocated from the fun heap
-- (CSR 0x7c0); the handle handed back to the graph is that address in an
-- ordinary databox, so slot addressing is Int arithmetic in Haskell and array
-- identity is Int equality.  A slot holds the element's RAW GRAPH REFERENCE:
-- fn.pop takes it off the spine WITHOUT forcing it (fn.tor would dereference
-- it, and newIOArray n arrEleBottom must not evaluate its element), and a read
-- hands it back by entering it, exactly as the arithmetic blobs enter a box.
--
-- Every operation is arity 2 (argument + IO continuation), so the existing
-- fn.seq arity gate covers them; the element count and the slot address are
-- latched by their own arity-2 effects (the ordering argument is in
-- Primitives.hs, above primArrSetN).
arrBlobs :: [String]
arrBlobs =
  -- The array primitives take the array and an INDEX, matching what the C
  -- runtime provides; the slot arithmetic that used to live in Haskell (and
  -- needed raw addresses, which only this machine has) is done here instead.
  -- An reference block is the element count in word 0 followed by one word per element.
     pm "_pm_arr_alloc"  "_arr_alloc"
  ++ [ "  .balign 4", "_arr_alloc:"
     -- every argument first, then the force; see _arr_write
     , "  addi sp, sp, -16"
     , "  fn.pop a0", "  sw a0, 0(sp)"         -- n, raw
     , "  fn.pop a0", "  sw a0, 4(sp)"         -- the fill element, UNFORCED
     , "  lw   a0, 0(sp)", "  jal ra, _fforce"  -- n
     , "  mv   a2, a0"
     , "  lw   a3, 4(sp)", "  addi sp, sp, 16"
     -- fn.array NODE in the ARRAY HEAP [0xB8000000, 0xBFF00000): a typed
     -- array, Augustsson's T_ARR.  The words after the fn.array header are
     -- his struct ioarray field for field: next (the fn_array_root chain),
     -- marked, permanent, size, then the elements.  Arrays live OUTSIDE the
     -- copying semispaces and NEVER MOVE, so the boxed handle is a stable
     -- address and pointer identity is Int equality, exactly as upstream.
     -- The collector walks the chain and forwards every element slot.
     , "  la   t0, _array_next", "  lw t4, 0(t0)"   -- t4 = the new node
     , "  slli t1, a2, 2", "  addi t1, t1, 20"
     , "  add  t1, t4, t1", "  sw t1, 0(t0)"        -- bump the array heap
     , "  la   t1, _fn_array_hdr", "  lw t1, 0(t1)"
     , "  sw   t1, 0(t4)"                           -- fn.array header
     , "  la   t0, fn_array_root", "  lw t1, 0(t0)"
     , "  sw   t1, 4(t4)"                           -- next = the old root
     , "  sw   t4, 0(t0)"                           -- root = this node
     , "  sw   zero, 8(t4)"                         -- marked
     , "  sw   zero, 12(t4)"                        -- permanent
     , "  sw   a2, 16(t4)"                          -- size
     , "  addi t2, t4, 20", "  mv t3, a2"
     , "3:", "  beqz t3, 4f"
     , "  sw a3, 0(t2)", "  addi t2, t2, 4", "  addi t3, t3, -1", "  j 3b"
     , "4:", "  fn.databox a0,t4", "  jr a0" ]
  ++ pm "_pm_arr_size"   "_arr_size"
  ++ [ "  .balign 4", "_arr_size:", ff1, ff2    -- a0 = the reference block
     , "  lw a0, 16(a0)", "  fn.databox a0,a0", "  jr a0" ]
  ++ pm "_pm_arr_read"   "_arr_read"
  -- A read hands the element to the continuation: k v.  It must NOT enter the
  -- element the way the arithmetic blobs enter a box -- that works only because
  -- a box HANDS ITSELF to the continuation; an arbitrary value entered with the
  -- continuation beneath it is APPLIED to it instead.  So build the
  -- application: [link v][elink k] is exactly [push v][enter k].
  ++ [ "  .balign 4", "_arr_read:"
     -- every argument first (CHKARG3NP), then the forces; see _arr_write
     , "  addi sp, sp, -16"
     , "  fn.pop a0", "  sw a0, 0(sp)"         -- the reference block, raw
     , "  fn.pop a0", "  sw a0, 4(sp)"         -- the index, raw
     , "  fn.pop a0", "  sw a0, 8(sp)"         -- the continuation, raw
     , "  lw   a0, 0(sp)", "  jal ra, _fforce"
     , "  sw   a0, 0(sp)"
     , "  lw   a0, 4(sp)", "  jal ra, _fforce"
     , "  lw   a2, 0(sp)"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  lw   a0, 20(a2)"                      -- the element (node word 5+i)
     , "  andi a0, a0, -4"
     , "  lw   a1, 8(sp)", "  addi sp, sp, 16"
     , "  andi a1, a1, -4"
     , "  fn.databox t0,zero"
     , "  sw a0, 0(t0)"
     , "  ori a1, a1, 1"
     , "  sw a1, 4(t0)"
     , "  jr t0" ]
  ++ pm "_pm_arr_write"  "_arr_write"
  ++ [ "  .balign 4", "_arr_write:"
     -- EVERY ARGUMENT FIRST (the reference runtime's CHKARG4NP), then the
     -- forces.  A spine read after a nested reduction is a read against a
     -- spine that reduction has moved.
     , "  addi sp, sp, -16"
     , "  fn.pop a0", "  sw a0, 0(sp)"         -- the reference block, raw
     , "  fn.pop a0", "  sw a0, 4(sp)"         -- the index, raw
     , "  fn.pop a0", "  sw a0, 8(sp)"         -- the value, raw + UNFORCED
     , "  fn.pop a0", "  sw a0, 12(sp)"        -- the continuation, raw
     , "  lw   a0, 0(sp)", "  jal ra, _fforce"
     , "  sw   a0, 0(sp)"
     , "  lw   a0, 4(sp)", "  jal ra, _fforce"
     , "  lw   a2, 0(sp)", "  lw a1, 8(sp)"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  sw   a1, 20(a2)"
     , "  lw   a0, 12(sp)", "  addi sp, sp, 16"
     , "  andi a0, a0, -4", "  jr a0" ]        -- enter the continuation
  ++ pm "_pm_bs_wr"      "_bs_wr"
  -- raw byte store/load: the VALUE goes in the reference block word, not a node, so
  -- comparing two reference blocks is a word loop (see bsBlobs)
  ++ [ "  .balign 4", "_bs_wr:"
     -- every argument first, then the forces (see _arr_write): a nested
     -- reduction moves the spine, so no spine read may follow one
     , "  addi sp, sp, -16"
     , "  fn.pop a0", "  sw a0, 0(sp)"         -- the reference block, raw
     , "  fn.pop a0", "  sw a0, 4(sp)"         -- the index, raw
     , "  fn.pop a0", "  sw a0, 8(sp)"         -- the value, raw
     , "  fn.pop a0", "  sw a0, 12(sp)"        -- the continuation, raw
     , "  lw   a0, 0(sp)", "  jal ra, _fforce", "  sw a0, 0(sp)"
     , "  lw   a0, 4(sp)", "  jal ra, _fforce", "  sw a0, 4(sp)"
     , "  lw   a0, 8(sp)", "  jal ra, _fforce"  -- the VALUE (a raw byte here)
     , "  lw   a2, 0(sp)", "  lw a1, 4(sp)"
     , "  slli a1, a1, 2", "  add a2, a2, a1"
     , "  sw   a0, 20(a2)"
     , "  lw   a0, 12(sp)", "  addi sp, sp, 16"
     , "  andi a0, a0, -4", "  jr a0" ]
  ++ pm "_pm_bs_rd"      "_bs_rd"
  ++ [ "  .balign 4", "_bs_rd:"
     -- every argument first, then the forces; see _bs_wr
     , "  addi sp, sp, -16"
     , "  fn.pop a0", "  sw a0, 0(sp)"         -- the reference block, raw
     , "  fn.pop a0", "  sw a0, 4(sp)"         -- the index, raw
     , "  lw   a0, 0(sp)", "  jal ra, _fforce", "  sw a0, 0(sp)"
     , "  lw   a0, 4(sp)", "  jal ra, _fforce"
     , "  lw   a2, 0(sp)", "  addi sp, sp, 16"
     , "  slli a0, a0, 2", "  add a2, a2, a0"
     , "  lw   a0, 20(a2)"                      -- the raw byte
     , "  fn.databox a0,a0", "  jr a0" ]
  ++ pm "_pm_arr_copy"   "_arr_copy"
  ++ [ "  .balign 4", "_arr_copy:", ff1, ff2    -- a0 = the source fn.array node
     , "  lw a2, 16(a0)"                        -- n
     , "  mv a1, a0"
     , "  la   t0, _array_next", "  lw t4, 0(t0)"
     , "  slli t1, a2, 2", "  addi t1, t1, 20"
     , "  add  t1, t4, t1", "  sw t1, 0(t0)"
     , "  la   t1, _fn_array_hdr", "  lw t1, 0(t1)"
     , "  sw   t1, 0(t4)"
     , "  la   t0, fn_array_root", "  lw t1, 0(t0)"
     , "  sw   t1, 4(t4)", "  sw t4, 0(t0)"
     , "  sw   zero, 8(t4)", "  sw zero, 12(t4)"
     , "  sw   a2, 16(t4)"
     , "  addi t2, t4, 20", "  addi t0, a1, 20", "  mv t3, a2"
     , "3:", "  beqz t3, 4f"
     , "  lw t1, 0(t0)", "  sw t1, 0(t2)"
     , "  addi t2, t2, 4", "  addi t0, t0, 4", "  addi t3, t3, -1", "  j 3b"
     , "4:", "  fn.databox a0,t4", "  jr a0" ]
  ++ [ "  .balign 8", "_arr_n:", "  .skip 8", "  .balign 8", "_arr_sl:", "  .skip 8"
     -- the array heap lives above the copying semispaces; nodes never move.
     -- _fn_array_hdr is the ASSEMBLED fn.array instruction: the allocator
     -- loads it, so gas owns the encoding and no source spells the word out.
     , "  .balign 4", "_fn_array_hdr:", "  fn.array"
     , "  .balign 8", "  .globl _array_next", "_array_next:", "  .word 0xB8000000"
     , "  .balign 8", "  .globl fn_array_root", "fn_array_root:", "  .word 0" ]
  where
    ff1    = "  fn.pop a0"               -- the raw arg, then the framed force
    ff2    = "  jal ra, _fforce"
    enter  = "  .word 0x0000000b"        -- fn.enter
    pm p b = [ "  .balign 4", p ++ ":", "  .word 0x0000105b", "  .word " ++ b ++ "+1" ]

csrBlobs :: [String]
csrBlobs = concatMap rd csrRegs ++ concatMap wr csrRegs
  where
    -- the arith-blob tail (new databox-rd ISA): box a0 ({0x605b, a0} at hp,
    -- a0 <- box pointer), then enter the box; the BOX dispatch threads the
    -- boxed Int to the consumer. No fn.update leg: CSR reads are volatile,
    -- never memoized.
    rd s = [ "  .balign 4", "_csrr_" ++ s ++ ":", "  csrr a0, " ++ s
           , "  .word 0x0005755b", "  jr a0" ]
    wr s = [ "  .balign 4", "_pm_csrw_" ++ s ++ ":", "  .word 0x0000105b"
           , "  .word _csrw_" ++ s ++ "+1"
           , "  .balign 4", "_csrw_" ++ s ++ ":", "  fn.pop a0", "  jal ra, _fforce"
           , "  csrw " ++ s ++ ", a0", "  .word 0x0000000b" ]

-- rv32=True emits rv32 ops (add/sub/...); rv64 (default) the *w word ops. The
-- boxed payloads are 32-bit either way; on rv32 the base ops already give 32-bit
-- semantics, so the `w` suffix is simply dropped. (and/or/xor have no w variant.)
primBlobs :: Bool -> [String]
primBlobs rv32 = concatMap blob
  [ ("_prim_add", w "add"), ("_prim_sub", w "sub"), ("_prim_mul", w "mul")
  , ("_prim_div", w "div"), ("_prim_divu", w "divu")
  , ("_prim_rem", w "rem"), ("_prim_remu", w "remu")
  , ("_prim_and","and"),    ("_prim_or","or"),       ("_prim_xor","xor")
  , ("_prim_sll", w "sll"), ("_prim_srl", w "srl"),  ("_prim_sra", w "sra") ]
  where
    w s = if rv32 then s else s ++ "w"
    -- The box goes straight into the KNOT fn.y tied for this redex: one
    -- `fn.databox a0` with no destination register writes {box, value} over
    -- the cell the spine top points at, pops the knot, pops the
    -- continuation, and the fetch resumes there.  What this replaces --
    -- allocate a fresh box at hp, store elink(box) into the knot, then jump
    -- through that indirection into the box -- cost two words of heap, two
    -- instructions and a chased pointer per arithmetic op.  The redex root
    -- fn.y already updated points at the knot, so a sharer now reads a real
    -- box instead of a link to one.
    blob (sym, op) =
      [ "  .balign 4"
      , sym ++ ":"
      , "  fn.tor a0"                   -- operand already WHNF via opInfix
      , "  fn.tor a1"
      ] ++ gcPoll ++ [ "  fn." ++ op ++ " a0, a1" ]

-- The boxed graph + prim blobs are identical to the Linux build; --rv32 differs
-- only in the blob ops (add vs addw) and in DROPPING the Linux _start prologue:
-- on the SoC the shared startup_rv0.S provides _start and does `call main`
-- (genRomMem emits the `main:` entry alias), so the mmap/mprotect/csrw setup is
-- unnecessary here. The graph lands in writable RAM at 0x80000000; the harness
-- seeds the heap/stack bases. This is the minimal bare-metal adaptation.
-- rv32 + Linux: a real hosted program.  This used to emit the BARE blobs --
-- UART writes and no _start at all -- because the entry came from a separately
-- assembled rt_linux.o.  mhs emits its own now, and the effects go through
-- ecall like every other Linux target.
linuxStartS _io True = unlines
  ( linuxStart32S ++ primBlobs True ++ cmpBlobs ++ effBlobs False
    ++ ["  .globl _fungraph_start", "_fungraph_start:"] )
linuxStartS _io rv32 = unlines (
  [ "  .text"
  , "  .globl _start"
  , "_start:"
  -- Bare-metal C-calling-convention wrapper. The reduction is a functional unit:
  -- its ONLY machine behaviour is "WHNF (r-stack empty / not enough args) -> jump
  -- to RA". Everything else here is ordinary instructions. Set up the heap/boundary
  -- CSRs, save the caller's RA on the C stack, call main; on WHNF main returns here
  -- (RA, not overwritten); read the answer off the r-stack top via fn.tor a0,
  -- restore RA, return to the caller. The harness reads a0 at the end of the run
  -- (no tohost / no done signal). The graph is in writable RAM at 0x80000000 and
  -- the heap follows it (linker _heap = end-of-graph).
  , "  la   sp, _cstack_top"     -- C stack
  , "  la   t0, _heap"           -- RAM heap base (end of graph, from the linker)
  , "  csrw 0x7c0, t0"           -- fun_hp = heap base (CSR_HEAP_POINTER)
  --the spine is memory too: RSTACK_START/END place its region,
  --the top 64 KB of node RAM (8192 entries x 8 B = RDEPTH). The
  --r-cache spills and fills there over its own bus port.
  , "  li   t0, 0xBFFE0000"
  , "  csrw 0x7e4, t0"           -- RSTACK_START
  , "  li   t0, 0xC0000000"
  , "  csrw 0x7e5, t0"           -- RSTACK_END
  , "  la   t0, _whnf_epi"
  , "  csrw 0x7c1, t0"           -- WHNF (under-applied head) epilogue
  , "  addi sp, sp, -16"
  , "  sd   ra, 8(sp)"           -- save the caller's RA on the C stack
  , "  jal  ra, main"            -- RA <- PC+4 (the epilogue); jump to main
  , "  .word 0x0000255b"         -- epilogue: fn.tor a0 (r-stack top = answer -> a0)
  , "  ld   ra, 8(sp)"           -- restore the caller's RA
  , "  addi sp, sp, 16"
  , "  ret"                      -- return to the caller (the ROM halt loop)
  , "  .balign 16"
  , "_cstack:"
  , "  .skip 4096"
  , "_cstack_top:"
  ] ++ primBlobs rv32 ++ cmpBlobs ++ effBlobs rv32
    ++ ["  .globl _fungraph_start", "_fungraph_start:"])

-- ---------------------------------------------------------------------------
-- thinOS (--thin).  The contract is include/thinos.h in ~/work/thinOS: the OS
-- loads the ELF at 0x80400000 and CALLS its entry as an ordinary function,
--
--     int _astart(const thinos_api *os, int argc, char **argv)
--
-- with everything the program may do to the outside world reached through
-- function pointers in that table.  There are no syscalls to make: where the
-- Linux target does `ecall`, this loads the table and `jalr`s.
--
-- Table offsets, rv32 (thinos.h, THINOS_VERSION 2): magic 0, version 4,
-- putc 8, getc 12, puts 16, printf 20, open 24, creat 28, read 32, write 36,
-- lseek 40, fsize 44, close 48, list 52, exit 56, cycles 60.
tosPutc, tosGetc, tosOpen, tosCreat, tosRead, tosWrite :: Int
tosClose, tosExit, tosCycles :: Int
tosPutc = 8; tosGetc = 12; tosOpen = 24; tosCreat = 28
tosRead = 32; tosWrite = 36; tosClose = 48; tosExit = 56; tosCycles = 60

-- Call os->f(...) with the argument already in a0.  The fun machine keeps live
-- state in the temporaries, and a C function is free to clobber t0-t6 -- an
-- ecall is not -- so they are saved across the call.  This is the one place
-- the two targets genuinely differ in cost.
tosCall :: Int -> [String]
tosCall off =
  [ "  addi sp, sp, -48"
  , "  sw ra, 0(sp)", "  sw t0, 4(sp)", "  sw t1, 8(sp)", "  sw t2, 12(sp)"
  , "  sw t3, 16(sp)", "  sw t4, 20(sp)", "  sw t5, 24(sp)", "  sw t6, 28(sp)"
  , "  la t0, _tos_api", "  lw t0, 0(t0)"
  , "  lw t1, " ++ show off ++ "(t0)"
  , "  jalr ra, t1, 0"
  , "  lw ra, 0(sp)", "  lw t0, 4(sp)", "  lw t1, 8(sp)", "  lw t2, 12(sp)"
  , "  lw t3, 16(sp)", "  lw t4, 20(sp)", "  lw t5, 24(sp)", "  lw t6, 28(sp)"
  , "  addi sp, sp, 48" ]

-- The effects, thinOS flavour.  Same set and same shapes as effBlobs; only the
-- way out to the world changes.
-- The tail of every value-returning reader.  These are CPS values: the answer
-- has to go back into the GRAPH, so it is boxed and the box entered -- exactly
-- what a csrr read does.  A plain `ret` returns to the word after the call
-- site, and the call site is a bare `jal` with the next block behind it, so the
-- value was dropped and the machine ran into unrelated code.  That single
-- missing tail broke io.argc, io.argrd, io.getbf and io.open alike -- argv AND
-- every file read.
retBox :: [String]
retBox = [ "  .word 0x0005755b"                 -- fn.databox a0, a0
         , "  jr a0" ]                          -- enter the box

-- FUNDBG: one character out through the OS putc, with every register a blob
-- cares about saved.  This is here to answer one question -- does the graph
-- reach an effect atom at all -- without a trace that buries the console.
dbgMark :: Char -> [String]
dbgMark c =
  [ "  addi sp, sp, -32"
  , "  sw ra, 0(sp)", "  sw a0, 4(sp)", "  sw a1, 8(sp)"
  , "  sw a2, 12(sp)", "  sw a3, 16(sp)"
  , "  li a0, " ++ show (fromEnum c) ] ++ tosCall tosPutc ++
  [ "  lw ra, 0(sp)", "  lw a0, 4(sp)", "  lw a1, 8(sp)"
  , "  lw a2, 12(sp)", "  lw a3, 16(sp)"
  , "  addi sp, sp, 32" ]

effBlobsThin :: [String]
effBlobsThin =
     pm "_pm_putb"  "_io_putb"
  ++ [ "  .balign 4", "_io_putb:", ff1, ff2 ] ++ tosCall tosPutc ++ [ enter ]
  ++ pm "_pm_setfd" "_io_setfd"
  ++ [ "  .balign 4", "_io_setfd:", ff1, ff2
     , "  la a1, _cur_fd", "  sw a0, 0(a1)", enter ]
  ++ pm "_pm_putbf" "_io_putbf"
  -- thinOS write() is a FAT write and has no console path at all: it looks the
  -- fd up in the open-file table and returns BADFD for 0/1/2.  A byte aimed at
  -- stdout therefore has to go through putc.  Without this split every write to
  -- stdout was silently discarded -- the graph reached the atom, the character
  -- just went nowhere.
  ++ [ "  .balign 4", "_io_putbf:", ff1, ff2
     , "  la a1, _iobuf", "  sb a0, 0(a1)"        -- byte -> buffer
     , "  la a2, _cur_fd", "  lw a2, 0(a2)"       -- a2 = fd
     , "  li a3, 2"
     , "  bgtu a2, a3, 8f" ]                      -- a real file: write(fd,buf,1)
  ++ [ "  la a1, _iobuf", "  lbu a0, 0(a1)" ]     -- console: putc(byte)
  ++ tosCall tosPutc
  ++ [ "  j 9f"
     , "8:"
     , "  addi a0, a2, -3", "  la a1, _iobuf", "  li a2, 1" ]
  ++ tosCall tosWrite
  ++ [ "9:", enter ]
  ++ [ "  .balign 4", "_io_getb:", "  li a0, 0" ] ++ tosCall tosGetc ++ [ "  ret" ]
  -- and the same on the way in: thinOS read() is a FAT read, so stdin has to
  -- come from getc.
  ++ [ "  .balign 4", "_io_getbf:"
     , "  la a2, _cur_fd", "  lw a2, 0(a2)"
     , "  li a3, 2"
     , "  bgtu a2, a3, 6f" ]
  ++ tosCall tosGetc
  ++ retBox
  ++ [ "6:"
     , "  addi a0, a2, -3"
     , "  la a1, _iobuf", "  li a2, 1" ]
  ++ tosCall tosRead
  ++ [ "  blez a0, 1f"                            -- 0 or error -> EOF
     , "  la a1, _iobuf", "  lbu a0, 0(a1)", "  j 2f"
     , "1:", "  li a0, -1"
     , "2:" ] ++ retBox
  ++ [ "  .balign 4", "_io_close:", ff1, ff2
     , "  li a1, 2", "  bgtu a0, a1, 7f" ]
  ++ [ enter ]                                  -- a console handle: nothing to close
  ++ [ "7:", "  addi a0, a0, -3" ]
  ++ tosCall tosClose ++ [ enter ]
  -- openFile streams the path a byte at a time (io.pathc) and then opens it
  -- (io.open): thinOS takes a NUL-terminated path, so the buffer is
  -- terminated on every append and the length resets after each open.
  ++ pm "_pm_pathc" "_io_pathc"
  ++ [ "  .balign 4", "_io_pathc:", ff1, ff2
     , "  la a1, _pathn", "  lw a2, 0(a1)"
     , "  la a3, _pathbuf"
     , "  add a3, a3, a2"
     , "  sb a0, 0(a3)"
     , "  sb zero, 1(a3)"
     , "  addi a2, a2, 1"
     , "  li a4, 126", "  bltu a2, a4, 1f", "  li a2, 126"   -- clamp, never overrun
     , "1:", "  sw a2, 0(a1)", enter ]
  ++ [ "  .balign 4", "_io_open:", ff1, ff2
     , "  la a1, _pathn", "  sw zero, 0(a1)"    -- the next path starts fresh
     , "  mv a1, a0"                            -- a1 = the IOMode
     , "  la a0, _pathbuf"
     , "  beqz a1, 2f" ]
  ++ tosCall tosCreat                           -- write/append: create it
  ++ [ "  j 3f", "2:" ]
  ++ tosCall tosOpen                            -- read: open it
  -- thinOS numbers FAT descriptors from 0, and 0/1/2 are ALSO the console
  -- handles the language uses.  The first file opened therefore came back as
  -- fd 0 and every read on it went to getc, which blocks forever.  Bias real
  -- descriptors past the console range; the byte effects undo it.
  ++ [ "3:"
     , "  bltz a0, 4f"                          -- leave error codes alone
     , "  addi a0, a0, 3"
     , "4:" ]
  ++ retBox
  ++ [ "  .balign 4", "_rd_cycle:" ] ++ tosCall tosCycles ++ retBox
  ++ [ "  .balign 4", "_rd_instret:", "  csrr a0, 0xc02" ] ++ retBox
  -- argv: the loader handed us (api, argc, argv) and the entry kept all
  -- three. getArgs asks for the count, selects one, then reads its bytes.
  ++ [ "  .balign 4", "_io_argc:", "  la a0, _tos_argc", "  lw a0, 0(a0)" ] ++ retBox
  ++ pm "_pm_argsel" "_io_argsel"
  ++ [ "  .balign 4", "_io_argsel:", ff1, ff2
     , "  la a1, _tos_argv", "  lw a1, 0(a1)"
     , "  slli a0, a0, 2"
     , "  add a1, a1, a0"
     , "  lw a1, 0(a1)"                      -- argv[n]
     , "  la a2, _argptr", "  sw a1, 0(a2)"  -- reading restarts here
     , enter ]
  ++ [ "  .balign 4", "_io_argrd:"
     , "  la a1, _argptr", "  lw a2, 0(a1)"
     , "  beqz a2, 1f"
     , "  lbu a0, 0(a2)"
     , "  beqz a0, 1f"                       -- the NUL ends it
     , "  addi a2, a2, 1", "  sw a2, 0(a1)"
     , "  j 2f"
     , "1:", "  li a0, -1"
     , "2:" ] ++ retBox
  ++ arrBlobs
  ++ csrBlobs
  ++ haltBlobsThin
  ++ [ "  .balign 8", "_iobuf:",  "  .skip 8"   -- the one-byte read/write staging
     , "  .balign 8", "_cur_fd:", "  .skip 8"   -- fd the byte effects act on
     , "  .balign 8", "_tos_api:", "  .skip 4"
     , "  .balign 8", "_tos_argc:", "  .skip 4"
     , "  .balign 8", "_tos_argv:", "  .skip 4"
     , "  .balign 8", "_pathbuf:", "  .skip 128"  -- the path openFile builds
     , "  .balign 8", "_pathn:",   "  .skip 4"
     , "  .balign 8", "_argptr:",  "  .skip 4" ]  -- byte cursor into argv[n]
  where
    ff1    = "  fn.pop a0"
    ff2    = "  jal ra, _fforce"
    enter  = "  .word 0x0000000b"
    pm p b = [ "  .balign 4", p ++ ":", "  .word 0x0000105b", "  .word " ++ b ++ "+1" ]

-- Every performance counter this machine has, in report order: mcycle and
-- minstret, the nine HPM events (0x7d2..0x7e2 even, hpmVec order), the
-- D-cache trio and the 28 bubble causes (bubOrder, in the three runs the CSR
-- map puts them in).  Core.Pipeline readCsr is the authority.
pmcRows :: [(String, Int)]
pmcRows =
  [ ("cycles", 0xb00), ("instret", 0xb02)
  , ("trap_flush", 0x7d2), ("br_redir", 0x7d4), ("stall_mem", 0x7d6)
  , ("stall_mul", 0x7d8), ("fetch_starve", 0x7da), ("stall_ld", 0x7dc)
  , ("misp_nottaken", 0x7de), ("misp_taken", 0x7e0), ("wb_bubble", 0x7e2)
  , ("dc_fill", 0x7e6), ("dc_writeback", 0x7e7), ("dc_uncached", 0x7e8)
  , ("bub_ex_squash", 0x7c2), ("bub_ex_mmu", 0x7c3), ("bub_ex_dport", 0x7c4)
  , ("bub_ex_misal", 0x7c5), ("bub_ex_amo", 0x7c6), ("bub_ex_div", 0x7c7)
  , ("bub_ex_fpit", 0x7c8), ("bub_ex_cvt", 0x7c9)
  , ("bub_fs_redir", 0x7e9), ("bub_fs_iwait", 0x7ea), ("bub_fs_poison", 0x7eb)
  , ("bub_fs_shadow", 0x7ec), ("bub_fs_imiss", 0x7ed), ("bub_fs_other", 0x7ee)
  , ("bub_id_load", 0x7ef), ("bub_id_mul", 0x7f0), ("bub_id_late", 0x7f1)
  , ("bub_id_agu", 0x7f2), ("bub_id_f", 0x7f3), ("bub_id_csr", 0x7f4)
  , ("bub_id_priv", 0x7f5), ("bub_id_funrc", 0x7f6), ("bub_id_funstage", 0x7f7)
  , ("bub_id_misp", 0x7f8), ("bub_id_flush", 0x7f9), ("bub_id_silentlk", 0x7fa)
  , ("bub_id_silentel", 0x7fb), ("bub_unknown", 0x7fc) ]

-- The counter snapshots and the report, for the --perf startup.  The END
-- snapshot is taken FIRST, before a single character is printed, so the
-- report cannot measure itself.
pmcSnap :: String -> [String]
pmcSnap buf =
  [ "  la t5, " ++ buf ] ++
  concat [ [ "  csrr t6, " ++ hexCsr c, "  sw t6, " ++ show (4*i) ++ "(t5)" ]
         | (i, (_, c)) <- zip [0 :: Int ..] pmcRows ]

pmcReport :: [String]
pmcReport =
  concat [ [ "  la a0, _pmcl" ++ show i, "  jal ra, _tos_puts"
           , "  la t5, _pmcsave", "  la t4, _pmcsave2"
           , "  lw a0, " ++ show (4*i) ++ "(t4)"
           , "  lw t6, " ++ show (4*i) ++ "(t5)"
           , "  sub a0, a0, t6", "  jal ra, _tos_putdec"
           , "  li a0, 10", "  jal ra, _tos_putc" ]
         | (i, _) <- zip [0 :: Int ..] pmcRows ]

hexCsr :: Int -> String
hexCsr c = "0x" ++ showHex3 c
  where showHex3 n = [ d (n `div` 256), d ((n `div` 16) `mod` 16), d (n `mod` 16) ]
        d k = ("0123456789abcdef" !! k)

-- The thinOS entry.  Not a _start: the OS calls this like a function and
-- expects it to return (or to call os->exit), so the caller's ra is saved and
-- the answer is handed back in a0.
-- IN: perf = report every counter around the run (mhs --thin --perf), the
-- way the fun benchmark images do.
thinStartS :: Bool -> String
thinStartS perf = unlines (
  [ "  .text"
  , "  .globl _astart"
  , "_astart:"
  , "  la   t0, _tos_api",  "  sw a0, 0(t0)"    -- the api table
  , "  la   t0, _tos_argc", "  sw a1, 0(t0)"
  , "  la   t0, _tos_argv", "  sw a2, 0(t0)"
  -- The app gets its OWN C stack.  The framed forcers nest on it, one frame per
  -- nested force, and that is far deeper than an OS shell's stack: growing down
  -- from the shell's sp walks straight through the shell's own frames, so the
  -- exit longjmp came back to clobbered locals and the boot script re-ran its
  -- current line forever.  ra and sp go to globals, not to the stack we are
  -- about to abandon.
  , "  la   t0, _shell_ra", "  sw ra, 0(t0)"
  , "  la   t0, _shell_sp", "  sw sp, 0(t0)"
  , "  li   sp, 0xBFFC0000"
  , "  la   t0, _heap"                          -- heap follows the graph
  , "  csrw 0x7c0, t0"                          -- fun_hp
  --the spine is memory too: RSTACK_START/END place its region,
  --the top 64 KB of node RAM (8192 entries x 8 B = RDEPTH). The
  --r-cache spills and fills there over its own bus port.
  , "  li   t0, 0xBFFE0000"
  , "  csrw 0x7e4, t0"           -- RSTACK_START
  , "  li   t0, 0xC0000000"
  , "  csrw 0x7e5, t0"           -- RSTACK_END
  , "  la   t0, _whnf_epi"
  , "  csrw 0x7c1, t0"                          -- WHNF epilogue
  -- ARM THE COLLECTOR.  fn_gc_trig defaults to 0xffffffff, which makes the
  -- safepoint poll in every arith blob always skip: an image that never sets
  -- it never collects, and dies of heap exhaustion on any real workload.  The
  -- trigger sits one GC_MARGIN below the end of the first semispace, exactly
  -- as the bench runtime arms it.  CSR 0x7fd stays unarmed: displacing an
  -- in-flight combi can skip a reduction, so the collector is entered from the
  -- software safepoint instead.
  , "  la   t0, _heap"
  , "  la   t1, _heap_end"
  , "  sub  t1, t1, t0"
  , "  srli t1, t1, 1"                          -- one semispace
  , "  add  t0, t0, t1"
  , "  li   t2, 0x1000000"                      -- GC_MARGIN, matches fun_gc_cheney.c
  , "  sub  t0, t0, t2"
  -- NO STEP CAP on the first pass. The trigger sits one GC_MARGIN below the
  -- end of the first semispace and nowhere earlier: on a heap sized so the
  -- program never fills a semispace, that means it never collects at all,
  -- which is the point of the large flat memory.
  , "  la   t1, fn_gc_trig"
  , "  sw   t0, 0(t1)"
  -- PRODUCTION: diagnostics off.  fn_gcverbose=1 arms the fingerprint +
  -- post-pass verifier (50-100M cycles per pass on MB live sets); any GC
  -- suspicion starts by flipping this back to 1.
  , "  la   t1, fn_gcverbose"
  , "  sw   zero, 0(t1)" ]
  ++ (if perf then pmcSnap "_pmcsave" else [])
  ++ [ "  jal  ra, main"
  , "  .word 0x0000255b" ]                      -- fn.tor a0: r-stack top -> a0
  -- the END snapshot goes first: printing costs cycles, and the report is
  -- about the program, not about itself
  ++ (if perf then [ "  addi sp, sp, -8", "  sw a0, 4(sp)"
                   , "  jal ra, _pmc_final"
                   , "  lw a0, 4(sp)", "  addi sp, sp, 8" ]
              else [])
  ++ [ "  la   t0, _shell_sp", "  lw sp, 0(t0)"
  , "  la   t0, _shell_ra", "  lw ra, 0(t0)"
  , "  ret"
  , "  .balign 4", "_shell_ra:", "  .skip 4"
  , "  .balign 4", "_shell_sp:", "  .skip 4"
  -- The root sets beyond the spine.  The thin image keeps no shadow root
  -- stack, no CAF table and no exception records, so these are present and
  -- ZERO rather than absent -- the collector reads the counts, finds none,
  -- and walks the spine and the interrupted C stack alone.
  , "  .section .data"
  , "  .balign 4"
  , "  .globl fn_rootsp, fn_cafn, fn_gcverbose, fn_roots, fn_caf"
  -- _exc_top is defined by the exception machinery but was file-local; the
  -- collector reads it as a root, so export the existing one rather than
  -- define a second.
  , "  .globl _exc_top"
  -- the standalone forcer's resume is a graph address the collector forwards
  , "  .globl _force_resume"
  , "fn_rootsp:    .word 0"
  , "fn_cafn:      .word 0"
  , "fn_gcverbose: .word 0"
  -- _exc_top already exists: the exception machinery defines it
  , "fn_roots:     .skip 256"
  , "fn_caf:       .skip 256"
  , "  .text" ]
  ++ (if perf then
        -- The counters have to survive EVERY way out. A program that ends by
        -- reducing to a value leaves through the WHNF epilogue and never
        -- returns here, so an inline report at the return path is emitted for
        -- runs that do not take it -- which is every IO program on this
        -- runtime. As a routine, the halt path can call it too.
        [ "  .balign 4", "  .globl _pmc_final", "_pmc_final:"
        , "  addi sp, sp, -16", "  sw ra, 0(sp)" ]
        ++ pmcSnap "_pmcsave2"
        ++ [ "  la a0, _pmchdr", "  jal ra, _tos_puts" ]
        ++ pmcReport
        ++ [ "  lw ra, 0(sp)", "  addi sp, sp, 16", "  ret" ]
      else [])
  ++ primBlobs True ++ cmpBlobs ++ effBlobsThin
  ++ (if perf then perfBlobsThin else [])
  ++ ["  .globl _fungraph_start", "_fungraph_start:"])

-- The report itself: a decimal printer and a string printer over os->putc,
-- the two snapshots, and one label per counter.
perfBlobsThin :: [String]
perfBlobsThin =
     [ "  .balign 4", "_tos_putc:"
     , "  addi sp, sp, -8", "  sw ra, 4(sp)" ]
  ++ tosCall tosPutc
  ++ [ "  lw ra, 4(sp)", "  addi sp, sp, 8", "  ret" ]
  ++ [ "  .balign 4", "_tos_puts:"              -- a0 = NUL-terminated
     , "  addi sp, sp, -16", "  sw ra, 12(sp)", "  sw s0, 8(sp)"
     , "  mv s0, a0"
     , "1:", "  lbu a0, 0(s0)", "  beqz a0, 2f"
     , "  jal ra, _tos_putc", "  addi s0, s0, 1", "  j 1b"
     , "2:", "  lw ra, 12(sp)", "  lw s0, 8(sp)", "  addi sp, sp, 16", "  ret" ]
  ++ [ "  .balign 4", "_tos_putdec:"            -- a0 = unsigned
     , "  addi sp, sp, -16", "  sw ra, 12(sp)", "  sw s0, 8(sp)", "  sw s1, 4(sp)"
     , "  la s0, _pmcnum", "  addi s0, s0, 11", "  sb zero, 0(s0)"
     , "  li s1, 10"
     , "3:", "  remu t0, a0, s1", "  addi t0, t0, 48"
     , "  addi s0, s0, -1", "  sb t0, 0(s0)"
     , "  divu a0, a0, s1", "  bnez a0, 3b"
     , "  mv a0, s0", "  jal ra, _tos_puts"
     , "  lw ra, 12(sp)", "  lw s0, 8(sp)", "  lw s1, 4(sp)"
     , "  addi sp, sp, 16", "  ret" ]
  ++ [ "  .balign 4", "_pmchdr:"
     , "  .asciz \"--- PMC breakdown ---\\n\"" ]
  ++ concat [ [ "  .balign 4", "_pmcl" ++ show i ++ ":"
              , "  .asciz \"" ++ pad (n ++ ":") ++ "\"" ]
            | (i, (n, _)) <- zip [0 :: Int ..] pmcRows ]
  ++ [ "  .balign 8", "_pmcnum:",   "  .skip 12"
     , "  .balign 8", "_pmcsave:",  "  .skip " ++ show (4 * length pmcRows)
     , "  .balign 8", "_pmcsave2:", "  .skip " ++ show (4 * length pmcRows) ]
  where pad l = l ++ replicate (max 1 (19 - length l)) ' '

-- The two ways a fun program stops early, thinOS flavour: say why through
-- os->puts and hand the shell a failure with os->exit.  Neither returns, so
-- there is no continuation to preserve -- but exit() is a call like any other,
-- so if it ever DID return, spin rather than fall into whatever follows.
haltBlobsThin :: [String]
haltBlobsThin =
     [ "  .balign 4", "_error0:", "  la a0, _errmsg", "  j _unimpfi_halt"
     , "  .balign 4", "_unimpfi_halt:" ]          -- a0 = NUL-terminated message
  ++ tosCall tosPuts
  -- print the counters on the way out, if this image has them. Weak, so a
  -- non-perf build links unchanged.
  ++ [ "  .weak _pmc_final"
     , "  la t0, _pmc_final", "  beqz t0, 1f", "  jalr ra, t0, 0", "1:" ]
  ++ [ "  li a0, 1" ] ++ tosCall tosExit
  ++ [ "1:", "  j 1b"
     , "  .balign 4", "_errmsg:", "  .asciz \"mhs (fun): error\"", "  .balign 4" ]

tosPuts :: Int
tosPuts = 16

-- ---------------------------------------------------------------------------
-- rv32 Linux (--linux --march=rvfun).  The same shape as the rv64 _start in
-- FunBlobs64: take argv off the entry sp, get a C stack and a heap from the
-- kernel, make the image writable because Turner updates write into graph
-- cells, then enter the graph.  riscv32 uses the generic syscall table, so the
-- numbers are the ones the 64-bit target uses (mmap 222, mprotect 226,
-- exit 93); the stores are 32-bit and the machine state goes in the fun CSRs
-- rather than in memory globals, because on this target it IS hardware.
linuxStart32S :: [String]
linuxStart32S =
  [ "  .text"
  , "  .globl _start"
  , "_start:"
  , "  mv   s2, sp"                  -- argc, argv[], envp[] as the kernel left them
  , "  li   a0, 0"                   -- a C stack: the framed forcers nest on it
  , "  li   a1, 0x1000000"           -- 16 MiB
  , "  li   a2, 3"                   -- PROT_READ|PROT_WRITE
  , "  li   a3, 0x22"                -- MAP_PRIVATE|MAP_ANONYMOUS
  , "  li   a4, -1"
  , "  li   a5, 0"
  , "  li   a7, 222"                 -- mmap
  , "  ecall"
  , "  li   t0, -4096"
  , "  bltu a0, t0, .L32csok"
  , "  j    _error0"
  , ".L32csok:"
  , "  add  sp, a0, a1"
  , "  addi sp, sp, -16"
  , "  li   s0, 0x20000000"          -- the heap, at a fixed low address
  , "  li   s1, 0x4000000"           -- 64 MiB
  , ".L32hmap:"
  , "  mv   a0, s0"
  , "  mv   a1, s1"
  , "  li   a2, 7"                   -- RWX: the machine ENTERS heap cells
  , "  li   a3, 0x100032"            -- PRIVATE|ANON|FIXED_NOREPLACE
  , "  li   a4, -1"
  , "  li   a5, 0"
  , "  li   a7, 222"
  , "  ecall"
  , "  beq  a0, s0, .L32hok"
  , "  li   t1, 0x400000"            -- 4 MiB at a time
  , "  sub  s1, s1, t1"
  , "  bgeu s1, t1, .L32hmap"
  , "  j    _error0"
  , ".L32hok:"
  , "  la   a0, _start"              -- the image writable: updates land in it
  , "  li   t0, -4096"
  , "  and  a0, a0, t0"
  , "  la   a1, _funtext_end"
  , "  sub  a1, a1, a0"
  , "  li   a2, 7"
  , "  li   a7, 226"                 -- mprotect
  , "  ecall"
  , "  la   t0, _argv_base"          -- now the store is safe
  , "  sw   s2, 0(t0)"
  , "  csrw 0x7c0, s0"               -- fun_hp = heap base
  --the spine is memory too: RSTACK_START/END place its region,
  --the top 64 KB of node RAM (8192 entries x 8 B = RDEPTH). The
  --r-cache spills and fills there over its own bus port.
  , "  li   s0, 0xBFFE0000"
  , "  csrw 0x7e4, s0"           -- RSTACK_START
  , "  li   s0, 0xC0000000"
  , "  csrw 0x7e5, s0"           -- RSTACK_END
  , "  la   t0, _whnf_epi"
  , "  csrw 0x7c1, t0"               -- WHNF epilogue
  , "  jal  ra, main"
  , "  .word 0x0000255b"             -- fn.tor a0: the answer off the r-stack
  , "  li   a7, 93"                  -- exit(a0)
  , "  ecall"
  , "  .balign 8"
  , "  .globl _argv_base"
  , "_argv_base:"
  , "  .skip 4" ]

-- the shared range-reduction + polynomial kernel, emitted once.
-- in fa0 = x; out ft3 = sin(r), ft5 = cos(r), a1 = quadrant. clobbers t0,ft0-ft2,ft4
sincosHelper :: [String]
sincosHelper =
  [ "  .balign 4"
  , "_fsincos:"
  , "  la t0,_fk_inv;  flw ft0,0(t0)"
  , "  fmul.s ft0, fa0, ft0"
  , "  fcvt.w.s a1, ft0, rne"
  , "  fcvt.s.w ft0, a1"
  , "  la t0,_fk_pio2; flw ft1,0(t0)"
  , "  fnmsub.s fa0, ft0, ft1, fa0"
  , "  fmul.s ft2, fa0, fa0"
  , "  la t0,_fk_s4; flw ft3,0(t0)"
  , "  la t0,_fk_s3; flw ft4,0(t0); fmadd.s ft3,ft3,ft2,ft4"
  , "  la t0,_fk_s2; flw ft4,0(t0); fmadd.s ft3,ft3,ft2,ft4"
  , "  la t0,_fk_s1; flw ft4,0(t0); fmadd.s ft3,ft3,ft2,ft4"
  , "  fmul.s ft3,ft3,ft2"
  , "  fmadd.s ft3,ft3,fa0,fa0"
  , "  la t0,_fk_c4; flw ft5,0(t0)"
  , "  la t0,_fk_c3; flw ft4,0(t0); fmadd.s ft5,ft5,ft2,ft4"
  , "  la t0,_fk_c2; flw ft4,0(t0); fmadd.s ft5,ft5,ft2,ft4"
  , "  la t0,_fk_c1; flw ft4,0(t0); fmadd.s ft5,ft5,ft2,ft4"
  , "  la t0,_fk_one;flw ft4,0(t0); fmadd.s ft5,ft5,ft2,ft4"
  , "  ret"
  , "  .balign 4"
  , "_fk_inv:  .float 0.6366197723675814"
  , "_fk_pio2: .float 1.5707963267948966"
  , "_fk_one:  .float 1.0"
  , "_fk_s1:   .float -0.16666666666666666"
  , "_fk_s2:   .float 0.008333333333333333"
  , "_fk_s3:   .float -0.0001984126984126984"
  , "_fk_s4:   .float 0.0000027557319223985893"
  , "_fk_c1:   .float -0.5"
  , "_fk_c2:   .float 0.041666666666666664"
  , "_fk_c3:   .float -0.001388888888888889"
  , "_fk_c4:   .float 0.0000248015873015873"
  ]
