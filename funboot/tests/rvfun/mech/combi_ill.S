# combi_ill.S - xfun compliance: combi over-application traps ILLEGAL.
#
# Spec (Model.RvRef stepInsnBase): a combi whose arity exceeds the spine
# depth raises IllegalInsn (mcause=2, mepc=the combi cell) - the ID-stage
# fun_ill check in the RTL. The mtvec handler verifies mcause + mepc for
# two cases: arity 2 at depth 1, and arity 1 at depth 0.
# tohost: 1 = PASS, (testnum<<1)|1 = FAIL testnum.

  .section .text.init
  .globl _start
_start:
  la   t0, _rvstart
  jr   t0

  .section .text
  .globl _rvstart
_rvstart:
  la   t0, tvec
  csrw mtvec, t0
  la   t0, _heap
  csrw 0x7c0, t0             # machine-state setup: seed the heap pointer
  la   t1, test1
  jalr x0, 0(t1)             # ID-resolved: csrw retired before fn.* fetch
  nop
  nop

  # ---- test 1: arity 2, depth 1 -> illegal ------------------------------
  .balign 64
test1:
  li   gp, 1
  j    i1c
  .balign 64
i1c:
  fn.link boxA
ic1:
  fn.combi.t0 2, [0,0,0,0,0,0]
  j    _fail                 # must not fall through

  # ---- test 2: arity 1, depth 0 -> illegal ------------------------------
  .balign 64
test2:
  li   gp, 2
  fn.tor  zero               # drain the boxA entry left by test 1
  j    i2c
  .balign 64
ic2:
i2c:
  fn.combi.t0 1, [0,0,0,0,0,0]
  j    _fail

tvec:
  csrr t0, mcause
  li   t1, 2                 # illegal instruction
  bne  t0, t1, _fail
  csrr t2, mepc
  li   t3, 1
  beq  gp, t3, 1f
  li   t3, 2
  beq  gp, t3, 2f
  j    _fail
1:
  la   t4, ic1
  bne  t2, t4, _fail
  la   t5, test2
  csrw mepc, t5
  mret
2:
  la   t4, ic2
  bne  t2, t4, _fail

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
boxA:
  .word 0x0000605b
  .word 0xC0FFEE11

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
