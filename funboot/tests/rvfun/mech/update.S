# update.S - xfun compliance: fn.update rs2  (0x5B f3=3, 0x305b | rs2<<20).
#
# Spec (Model.RvRef stepInsnBase): mem[spine top VALUE] <- R[rs2] | 1 (the
# elink tag is the instruction's semantics), pop. Empty spine: no store,
# no pop. pc+4. The compiler also mirrors the register into the rs1 field
# (e.g. fn.update a0 = 0x00a5305b); this test uses the same idiom.
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

  # ---- test 1: update writes R[rs2]|1 through the top-of-stack address -
  .balign 64
test1:
  li   gp, 1
  j    u1c
  .balign 64
u1c:
  fn.link cellX              # top of stack = (cellX, u1c)
  li   a0, 0x600DBEA0
  .word 0x00a5305b           # fn.update a0 : mem[cellX] <- a0|1, pop
  la   t1, cellX
  lw   t2, 0(t1)
  li   t0, 0x600DBEA1
  bne  t2, t0, _fail

  # ---- test 2: update pops exactly one entry; entry below becomes top --
  li   gp, 2
  j    u2c
  .balign 64
u2c:
  fn.link nodeA
  fn.link cellY              # top of stack = cellY
  li   a1, 0x11223340
  .word 0x00b5b05b           # fn.update a1 : mem[cellY] <- a1|1, pop
  fn.tor  a2                 # top of stack must now be nodeA
  li   t0, 0xC0FFEE11
  bne  a2, t0, _fail
  la   t1, cellY
  lw   t2, 0(t1)
  li   t0, 0x11223341
  bne  t2, t0, _fail

  # (NO empty-spine update test here: same model-vs-fun_checker contract
  # disagreement as the empty-spine tor - see tor.S.)

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
  .word 0x0000605b
  .word 0xC0FFEE11
  .balign 8
cellX:
  .word 0
  .word 0
  .balign 8
cellY:
  .word 0
  .word 0

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
