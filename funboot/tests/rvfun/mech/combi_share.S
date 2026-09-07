# combi_share.S - xfun compliance: the Turner root update must be VISIBLE
# to an immediately following re-walk of the same redex (memoization).
#
# Walk 1 reduces `redex` (select combi): the root cell rr is overwritten
# with elink(copy) and one copy cell is allocated. Walk 2 re-enters rr a
# few instructions later: the fetch must see the UPDATED cell (elink
# chain to the existing copy), NOT the stale link+combi pair. A stale
# read re-reduces the spent redex: extra allocation, extra update, and a
# diverging heap pointer - the exact failure class of the Knuthbendix
# stale-root bug and the h-cache read-ordering hazard.
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

  # ---- walk 1: reduce the redex once ------------------------------------
  .balign 64
test1:
  li   gp, 1
  j    w1
  .balign 64
w1:
  fn.link  snt
  fn.link  c1
  fn.elink redex
  .balign 64
redex:
rr:
  fn.link  boxA              # the root cell (overwritten by the reduction)
  fn.combi.t0 1, [0,0,0,0,0,0]
c1:
  fn.tor  a0                 # top of stack = boxA via the box swap
  li   t0, 0xC0FFEE11
  bne  a0, t0, _fail

  # ---- walk 2: re-enter the redex IMMEDIATELY through the updated root --
  li   gp, 2
  j    w2
  .balign 64
w2:
  fn.link  c2
  fn.elink redex             # rr now holds elink(copy): follow, do not reduce
c2:
  fn.tor  a1
  li   t0, 0xC0FFEE11
  bne  a1, t0, _fail

  # ---- checks: root cell, copy cell, spine balance, NO re-allocation ----
  li   gp, 3
  la   s1, _heap
  la   t1, rr
  lw   t2, 0(t1)             # rr = elink(_heap)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  lw   t2, 0(s1)             # copy = elink(boxA)
  la   t3, boxA
  ori  t3, t3, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # sentinel back on top
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 4
  addi t2, s1, 4             # walk 2 allocated NOTHING
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
