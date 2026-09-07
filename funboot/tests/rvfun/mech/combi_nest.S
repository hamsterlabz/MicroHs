# combi_nest.S - xfun compliance: NESTED dispatches through fresh copy
# cells - the Braun.size (Scott-encoded match) shape where hs_braun first
# leaves the model:
#   dispatch 1 (byte-exact size word 0x00109822, t2 ar3 [2,0,1]): pushes
#     two entries whose SOURCES are its own just-written copy cells and
#     enters the "tree" cell;
#   dispatch 2 (byte-exact 0x0110e842, t4 ar5 [3,0,1,2,0,0]): with no
#     host instruction in between, consumes those entries, pushes three
#     more, and Turner-updates its root INTO dispatch 1's fresh copy cell.
# Test 1 runs the nest SHALLOW (depth <= 6): a failure here is the
# write-in-flight / read-ordering class, depth-independent.
# Test 2 runs the identical nest on top of 12 filler pushes so the inner
# commit sits at depth ~18 (hs_braun diverged at rdep=16, the window
# boundary): a failure ONLY here is the depth/spill class (r-cache).
# tohost: 1 = PASS, (testnum<<1)|1 = FAIL testnum.

  .section .text.init
  .globl _start
_start:
  la   t0, _rvstart
  jr   t0

  .section .text
  .globl _rvstart
_rvstart:
  la   t0, _heap
  csrw 0x7c0, t0             # machine-state setup: seed the heap pointer
  la   t1, test1
  jalr x0, 0(t1)             # ID-resolved: csrw retired before fn.* fetch
  nop
  nop

  # ---- the shared graph cells (never updated in place: the roots are the
  # per-test entry cells and heap copy cells) -----------------------------
  .balign 64
sizecell:                    # Braun.size shape, byte-exact first word set
  fn.link K0box              # args[1] of dispatch 1
  fn.link CASEch             # args[0] of dispatch 1
  fn.combi.t2 3, [2,0,1,0,0,0]     # = 0x00109822: enter args[2] = tree
  .balign 8
treecell:                    # the "Branch closure": consumes the two
  fn.link bxX                # entries dispatch 1 pushed (fresh srcs) plus
  fn.link bxL                # its own three pushes
  fn.link bxR
  fn.combi.t4 5, [3,0,1,2,0,0]     # = 0x0110e842: enter args[3] = CASEch,
                             # root = args[4].src = dispatch 1's copy cell
  .balign 8
CASEch:
  fn.tor  a1                 # top of stack = (bxR, copy2+8)
  li   t0, 0xD0D00007
  bne  a1, t0, _fail
  fn.tor  a2                 # (bxL, copy2+4)
  li   t0, 0xD0D00006
  bne  a2, t0, _fail
  fn.tor  a3                 # (bxX, copy2+0)
  li   t0, 0xD0D00005
  bne  a3, t0, _fail
  jalr x0, 0(s3)             # per-test continuation

  # ---- test 1: shallow nest ---------------------------------------------
  .balign 64
test1:
  li   gp, 1
  la   s3, t1chk
  j    t1c
  .balign 64
t1c:
  fn.link snt
t1r:
  fn.link treecell           # args[2] of dispatch 1; root of dispatch 1
  fn.elink sizecell
t1chk:
  la   s1, _heap
  # copy1 word 0 (_heap+0) was link(K0box) when dispatch 1 wrote it, then
  # dispatch 2's root update overwrote it: must now be elink(copy2)
  lw   t2, 0(s1)
  addi t3, s1, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 4(s1)             # copy1 word 1 = link(CASEch)
  la   t3, CASEch
  bne  t2, t3, _fail
  lw   t2, 8(s1)             # copy1 word 2 = elink(treecell)
  la   t3, treecell
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 12(s1)            # copy2 = [lnk bxX, lnk bxL, lnk bxR,
  la   t3, bxX               #          eln CASEch]
  bne  t2, t3, _fail
  lw   t2, 16(s1)
  la   t3, bxL
  bne  t2, t3, _fail
  lw   t2, 20(s1)
  la   t3, bxR
  bne  t2, t3, _fail
  lw   t2, 24(s1)
  la   t3, CASEch
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, t1r               # dispatch 1's root = elink(copy1 = _heap)
  lw   t2, 0(t1)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # spine balance: sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: the same nest at depth (12 fillers below) ----------------
  li   gp, 2
  la   s3, t2chk
  j    t2c
  .balign 64
t2c:
  fn.link snt
  fn.link pad1
  fn.link pad1
  fn.link pad1
  fn.link pad1
  fn.link pad1
  fn.link pad1
  fn.link pad2
  fn.link pad2
  fn.link pad2
  fn.link pad2
  fn.link pad2
  fn.link pad2
t2r:
  fn.link treecell
  fn.elink sizecell
t2chk:
  la   s1, _heap
  lw   t2, 28(s1)            # test-2 copy1 word 0: rewritten by the inner
  addi t3, s1, 40            # root update to elink(copy2 = _heap+40)
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 32(s1)            # copy1 word 1 = link(CASEch)
  la   t3, CASEch
  bne  t2, t3, _fail
  lw   t2, 48(s1)            # copy2 word 2 = link(bxR)
  la   t3, bxR
  bne  t2, t3, _fail
  lw   t2, 52(s1)            # copy2 word 3 = elink(CASEch)
  la   t3, CASEch
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, t2r               # dispatch 1's root = elink(copy1 = _heap+28)
  lw   t2, 0(t1)
  addi t3, s1, 28
  ori  t3, t3, 1
  bne  t2, t3, _fail
  li   s1, 12                # drain the 12 fillers, checking payloads
1:
  fn.tor  a1
  li   t0, 6
  bgt  s1, t0, 2f
  li   t0, 0xF1110001        # pads 6..1 = pad1
  j    3f
2:
  li   t0, 0xF1110002        # pads 12..7 = pad2
3:
  bne  a1, t0, _fail
  addi s1, s1, -1
  bnez s1, 1b
  fn.tor  a4                 # sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 56
  la   t2, _heap
  addi t2, t2, 56
  bne  a2, t2, _fail

_pass:
  li   t0, 1
  la   t1, tohost
  sw   t0, 0(t1)
1:
  j    1b

_fail:
  slli t0, gp, 1
  ori  t0, t0, 1
  la   t1, tohost
  sw   t0, 0(t1)
1:
  j    1b

  .section .data
  .balign 8
snt:
  .word 0x0000605b
  .word 0x5E17BA5E
  .balign 8
K0box:
  .word 0x0000605b
  .word 0x00000000
  .balign 8
bxX:
  .word 0x0000605b
  .word 0xD0D00005
  .balign 8
bxL:
  .word 0x0000605b
  .word 0xD0D00006
  .balign 8
bxR:
  .word 0x0000605b
  .word 0xD0D00007
  .balign 8
pad1:
  .word 0x0000605b
  .word 0xF1110001
  .balign 8
pad2:
  .word 0x0000605b
  .word 0xF1110002

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
