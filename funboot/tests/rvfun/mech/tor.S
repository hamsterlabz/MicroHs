# tor.S - xfun compliance: fn.tor rd  (0x5B f3=2, 0x205b | rd<<7).
#
# Spec (Model.RvRef stepInsnBase): pop the spine top (a, src); rd <- mem[a+4]
# (the popped entry's argument cell). Empty spine: rd <- 0, no pop. pc+4.
#
# The lockstep harness compares every retired fn.tor's rd against the
# model, plus pc/heap-pointer/spine-depth at each retire. The self-checks
# below pin the architectural values so the test also fails standalone.
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

  # ---- test 1: single link push, tor reads the argument cell ----------
  .balign 64
test1:
  li   gp, 1
  j    t1c
  .balign 64
t1c:
  fn.link nodeA
  fn.tor  a1
  li   t0, 0xC0FFEE11
  bne  a1, t0, _fail

  # ---- test 2: LIFO: push A then B; top of stack is B, then A ---------
  li   gp, 2
  j    t2c
  .balign 64
t2c:
  fn.link nodeA
  fn.link nodeB
  fn.tor  a1                 # top of stack = B
  li   t0, 0xBEEF2222
  bne  a1, t0, _fail
  fn.tor  a2                 # new top = A
  li   t0, 0xC0FFEE11
  bne  a2, t0, _fail

  # ---- test 3: tor result consumed by the next instruction ------------
  li   gp, 3
  j    t3c
  .balign 64
t3c:
  fn.link nodeB
  fn.tor  a1
  addi a1, a1, 1
  li   t0, 0xBEEF2223
  bne  a1, t0, _fail

  # ---- test 4: rd = x0: pops and discards; next tor sees the entry below
  li   gp, 4
  j    t4c
  .balign 64
t4c:
  fn.link nodeA
  fn.link nodeB
  fn.tor  zero               # pops B, discards
  fn.tor  a3                 # top of stack must now be A
  li   t0, 0xC0FFEE11
  bne  a3, t0, _fail

  # (NO empty-spine tor test here: the model defines rd <- 0 / no pop, but
  # fun_checker.sv:101 asserts the case unreachable and $stops the sim -
  # the two contracts disagree; needs a ruling before it can be tested.)

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
nodeA:
  .word 0x0000605b           # box marker
  .word 0xC0FFEE11
  .balign 8
nodeB:
  .word 0x0000605b
  .word 0xBEEF2222

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
