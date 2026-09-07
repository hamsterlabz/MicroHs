# combi_chain.S - xfun compliance: LONG chain of back-to-back reductions.
#
# 25 select combinators (fn.combi.t0 1,[0]) execute in one unbroken run:
# the chunk pushes 27 entries (sentinel, continuation, boxA, 24 cells of
# the sel array), then the terminator sel pops the top and the pc hops
# backwards through the 24-word sel array, one reduction per word, ending
# in the box swap. 25 consecutive allocations (hp: _heap .. _heap+96) and
# 25 consecutive root updates (all chunk cells), no host instruction in
# between. The 27-deep spine also crosses the per-chunk push caps (8 per
# chunk) and the fetch-line boundary.
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
  j    cc
  .balign 64
cc:
  fn.link snt                # word 0
  fn.link cccont             # word 1
  fn.link boxA               # word 2 : root of reduction 25
  .set K, 0
  .rept 24                   # words 3..26 : roots of reductions 24..1
  fn.link bchain + (K*4)
  .set K, K+1
  .endr
  fn.combi.t0 1, [0,0,0,0,0,0]   # word 27 : reduction 1 (pops bchain+92)
  .balign 8
bchain:
  .rept 24                   # reductions 2..25, pc walks 92 -> 0
  fn.combi.t0 1, [0,0,0,0,0,0]
  .endr
cccont:
  fn.tor  a0                 # top of stack = boxA after the box swap
  li   t0, 0xC0FFEE11
  bne  a0, t0, _fail

  # spot-check the Turner roots: reduction k overwrote chunk word (26-k+1)
  # with elink(_heap + 4*(k-1)); k = 1, 2, 24, 25
  li   gp, 2
  la   s1, _heap
  la   s2, cc
  lw   t2, 104(s2)           # word 26 (last bchain link) := elink(_heap)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  lw   t2, 100(s2)           # word 25 := elink(_heap+4)
  addi t3, s1, 4
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 12(s2)            # word 3 (bchain+0 link) := elink(_heap+92)
  addi t3, s1, 92
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 8(s2)             # word 2 (boxA link) := elink(_heap+96)
  addi t3, s1, 96
  ori  t3, t3, 1
  bne  t2, t3, _fail

  # copies: first = elink(bchain+92), last = elink(boxA)
  li   gp, 3
  lw   t2, 0(s1)
  la   t3, bchain
  addi t3, t3, 92
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 96(s1)
  la   t3, boxA
  ori  t3, t3, 1
  bne  t2, t3, _fail

  li   gp, 4
  fn.tor  a4                 # spine balance: sentinel on top
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 100
  addi t2, s1, 100
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
