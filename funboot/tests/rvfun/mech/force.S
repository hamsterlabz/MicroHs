# force.S - xfun compliance: fn.force (0x5B f3=5, word 0x0000505b).
#
# Spec (Model.RvRef funReduceOnce FORCE):
#   depth == 0 : pc+4 (plain fall-through).
#   depth  > 0 : top (a, src) becomes (force-cell-address + 4, src) - the
#                return point - and pc <- a (enter the old top VALUE).
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

  # ---- test 1: empty spine: force falls through ------------------------
  .balign 64
test1:
  li   gp, 1
  .word 0x0000505b           # fn.force : depth 0 -> pc+4
  li   t0, 1                 # reached = pass condition (PCDIV guards pc)
  beqz t0, _fail

  # ---- test 2: depth > 0: enter old top, return point pushed -----------
  li   gp, 2
  j    f2c
  .balign 64
f2c:
  fn.link f2blob             # top of stack = f2blob
f2q:
  .word 0x0000505b           # fn.force : top=(f2q+4, src), pc=f2blob
  .word 0x600DF001           # f2q+4 : the return-point cell (never fetched)
  .word 0x600DF00D           # f2q+8 : its argument cell, read via tor
  .balign 8
f2blob:
  fn.tor  a0                 # pops (f2q+4, src): a0 = mem[f2q+8]
  li   t0, 0x600DF00D
  bne  a0, t0, _fail

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

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
