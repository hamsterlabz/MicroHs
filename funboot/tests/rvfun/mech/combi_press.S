# combi_press.S - xfun compliance: the Braun.size nest UNDER PRESSURE.
#
# combi_nest.S proved the nested-dispatch shape alone is clean, shallow
# and deep. hs_braun still diverges after ~280 dispatches with the update
# queue and the reduction unit busy (FUNPMC uq/rcbusy nonzero) - the
# remaining ingredients are sustained back-to-back reduction traffic and
# h-cache line pressure. This test:
#   phase 1: 64 fn.databox allocations advance hp across h-cache sets and
#            dirty the write path;
#   phase 2: EIGHT back-to-back size/Branch nests (distinct root cells,
#            zero host instructions inside each nest, minimal host glue
#            between them), every root and copy cell checked at the end.
# A window/update divergence here reproduces the hs_braun class in a
# directed test; the failing iteration is localized by the UPDDIV pc.
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

  .balign 64
sizecell:
  fn.link K0box
  fn.link CASEch
  fn.combi.t2 3, [2,0,1,0,0,0]     # 0x00109822
  .balign 8
treecell:
  fn.link bxX
  fn.link bxL
  fn.link bxR
  fn.combi.t4 5, [3,0,1,2,0,0]     # 0x0110e842
  .balign 8
CASEch:
  fn.tor  a1
  li   t0, 0xD0D00007
  bne  a1, t0, _fail
  fn.tor  a2
  li   t0, 0xD0D00006
  bne  a2, t0, _fail
  fn.tor  a3
  li   t0, 0xD0D00005
  bne  a3, t0, _fail
  fn.tor  a4                 # this nest's sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  jr   s3                    # next nest (s3 = next entry)

  # ---- phase 1: heap spread + write-path dirt ---------------------------
  .balign 64
test1:
  li   gp, 1
  li   s0, 64
  li   a0, 0x0DB0DB00
1:
  .word 0x0005755b           # fn.databox a0, a0 : a0 <- box ptr (chained)
  addi s0, s0, -1
  bnez s0, 1b
  # hp is now _heap + 512; the nests allocate from here (call it HN)

  # ---- phase 2: 8 back-to-back nests ------------------------------------
  li   gp, 2
  la   s3, e2
  j    e1
  .balign 64
e1:
  fn.link snt
r1:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e2:
  la   s3, e3
  j    e2c
  .balign 64
e2c:
  fn.link snt
r2:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e3:
  la   s3, e4
  j    e3c
  .balign 64
e3c:
  fn.link snt
r3:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e4:
  la   s3, e5
  j    e4c
  .balign 64
e4c:
  fn.link snt
r4:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e5:
  la   s3, e6
  j    e5c
  .balign 64
e5c:
  fn.link snt
r5:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e6:
  la   s3, e7
  j    e6c
  .balign 64
e6c:
  fn.link snt
r6:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e7:
  la   s3, e8
  j    e7c
  .balign 64
e7c:
  fn.link snt
r7:
  fn.link treecell
  fn.elink sizecell
  .balign 64
e8:
  la   s3, echk
  j    e8c
  .balign 64
e8c:
  fn.link snt
r8:
  fn.link treecell
  fn.elink sizecell

  # ---- checks: every nest k (0-based) allocated 28 bytes at
  # HN + 28k: copy1 word 0 = elink(copy2), root rK = elink(copy1) --------
echk:
  li   gp, 3
  la   s1, _heap
  addi s1, s1, 512           # HN
  li   s2, 8                 # nest countdown (nest 8 .. nest 1)
  la   s4, rtab
1:
  lw   t1, 0(s4)             # rK cell address from the table
  lw   t2, 0(t1)             # rK = elink(copy1)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  lw   t2, 0(s1)             # copy1 word 0 = elink(copy2 = copy1+12)
  addi t3, s1, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 4(s1)             # copy1 word 1 = link(CASEch)
  la   t3, CASEch
  bne  t2, t3, _fail
  lw   t2, 24(s1)            # copy2 word 3 = elink(CASEch)
  ori  t3, t3, 1
  bne  t2, t3, _fail
  addi s1, s1, 28
  addi s4, s4, 4
  addi s2, s2, -1
  bnez s2, 1b
  .word 0x0000765b           # fn.databox a2, zero : hp = HN + 224
  la   t2, _heap
  addi t2, t2, 736           # 512 + 224
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
rtab:                        # the 8 root cells, nest order
  .word r1
  .word r2
  .word r3
  .word r4
  .word r5
  .word r6
  .word r7
  .word r8
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

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
