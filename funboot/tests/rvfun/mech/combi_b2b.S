# combi_b2b.S - xfun compliance: BACK-TO-BACK combi dispatches.
#
# Four select combinators (fn.combi.t0 1,[0]) dispatch in a row with ZERO
# link cells between them: each dispatch's target (the selected argument)
# is a cell that itself holds the next combi word, so the pc hops
# dispatch -> dispatch -> dispatch -> dispatch -> box. Every dispatch pops
# one entry, allocates one copy cell at hp, and Turner-updates its root
# (a chunk cell here) - four consecutive updates, four consecutive
# allocations, no host instruction in between.
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
test1:
  li   gp, 1
  j    bb
  .balign 64
bb:
  fn.link snt
  fn.link bbcont
rt4:
  fn.link boxA               # popped by dispatch 4 (root -> elink(_heap+12))
rt3:
  fn.link b3                 # popped by dispatch 3 (root -> elink(_heap+8))
rt2:
  fn.link b2                 # popped by dispatch 2 (root -> elink(_heap+4))
rt1:
  fn.link b1                 # popped by dispatch 1 (root -> elink(_heap))
  fn.combi.t0 1, [0,0,0,0,0,0]   # dispatch 1: pc -> b1
  .balign 8
b1:
  fn.combi.t0 1, [0,0,0,0,0,0]   # dispatch 2: pc -> b2
b2:
  fn.combi.t0 1, [0,0,0,0,0,0]   # dispatch 3: pc -> b3
b3:
  fn.combi.t0 1, [0,0,0,0,0,0]   # dispatch 4: pc -> boxA -> box swap
bbcont:
  fn.tor  a0                 # top of stack = boxA
  li   t0, 0xC0FFEE11
  bne  a0, t0, _fail

  # roots: rtK := elink(_heap + 4*(K-1)), copies = elink(popped cell)
  li   gp, 2
  la   s1, _heap
  la   t1, rt1
  lw   t2, 0(t1)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  la   t1, rt2
  lw   t2, 0(t1)
  addi t3, s1, 4
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, rt3
  lw   t2, 0(t1)
  addi t3, s1, 8
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, rt4
  lw   t2, 0(t1)
  addi t3, s1, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail

  li   gp, 3
  lw   t2, 0(s1)             # copy 1 = elink(b1)
  la   t3, b1
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 4(s1)             # copy 2 = elink(b2)
  la   t3, b2
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 8(s1)             # copy 3 = elink(b3)
  la   t3, b3
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 12(s1)            # copy 4 = elink(boxA)
  la   t3, boxA
  ori  t3, t3, 1
  bne  t2, t3, _fail

  li   gp, 4
  fn.tor  a4                 # spine balance: sentinel on top
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 16
  addi t2, s1, 16
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
boxA:
  .word 0x0000605b
  .word 0xC0FFEE11

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
