# arith.S - xfun compliance: arithmetic procedures (the full primitive
# cycle a compiled program uses).
#
# A primitive is host code entered from the reduction: it pops its boxed
# arguments with fn.tor, computes in registers, boxes the result with
# fn.databox, memoizes it with fn.update through the root cell carried on
# the spine, then re-enters the root: the updated cell must chain
# (elink -> box marker -> swap) into the continuation with the result box
# on the top of the stack. Covers add and mul back to back, exactly the
# generated-code idiom (tor/tor/op/databox/update).
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

  # ---- test 1: 35 + 7 = 42 ----------------------------------------------
  .balign 64
test1:
  li   gp, 1
  j    a1c
  .balign 64
a1c:
  fn.link  snt
  fn.link  acont
  fn.link  aroot             # the root cell the primitive updates
  fn.link  box7
  fn.link  box35             # top of stack
  fn.elink addb
  .balign 8
addb:
  fn.tor  a0                 # 35
  fn.tor  a1                 # 7
  add  a2, a0, a1
  .word 0x000676db           # fn.databox a3, a2 : box the result
  .word 0x00d6b05b           # fn.update  a3     : mem[aroot] <- box|1, pop
  la   t0, aroot
  jr   t0                    # re-enter the memoized root
acont:
  fn.tor  a0                 # top of stack = the result box
  li   t0, 42
  bne  a0, t0, _fail
  la   t1, _heap             # the box was the first allocation
  bne  a3, t1, _fail
  la   t2, aroot
  lw   t3, 0(t2)
  ori  t4, t1, 1
  bne  t3, t4, _fail
  fn.tor  a4                 # sentinel: spine balanced
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: 6 * 7 = 42 -------------------------------------------------
  li   gp, 2
  j    a2c
  .balign 64
a2c:
  fn.link  snt
  fn.link  bcont
  fn.link  broot
  fn.link  box7
  fn.link  box6
  fn.elink mulb
  .balign 8
mulb:
  fn.tor  a0                 # 6
  fn.tor  a1                 # 7
  mul  a2, a0, a1
  .word 0x000676db           # fn.databox a3, a2
  .word 0x00d6b05b           # fn.update  a3
  la   t0, broot
  jr   t0
bcont:
  fn.tor  a0
  li   t0, 42
  bne  a0, t0, _fail
  la   t1, _heap
  addi t1, t1, 8             # second box: hp had advanced by 8
  bne  a3, t1, _fail
  la   t2, broot
  lw   t3, 0(t2)
  ori  t4, t1, 1
  bne  t3, t4, _fail
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 3: 9 - 4 = 5, result used in a host branch --------------------
  li   gp, 3
  j    a3c
  .balign 64
a3c:
  fn.link  snt
  fn.link  ccont
  fn.link  croot
  fn.link  box4
  fn.link  box9
  fn.elink subb
  .balign 8
subb:
  fn.tor  a0                 # 9
  fn.tor  a1                 # 4
  sub  a2, a0, a1
  bltz a2, _fail             # host branch on the primitive's result
  .word 0x000676db           # fn.databox a3, a2
  .word 0x00d6b05b           # fn.update  a3
  la   t0, croot
  jr   t0
ccont:
  fn.tor  a0
  li   t0, 5
  bne  a0, t0, _fail
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

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
box35:
  .word 0x0000605b
  .word 35
  .balign 8
box7:
  .word 0x0000605b
  .word 7
  .balign 8
box6:
  .word 0x0000605b
  .word 6
  .balign 8
box9:
  .word 0x0000605b
  .word 9
  .balign 8
box4:
  .word 0x0000605b
  .word 4
  .balign 8
aroot:
  .word 0
  .word 0
  .balign 8
broot:
  .word 0
  .word 0
  .balign 8
croot:
  .word 0
  .word 0

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
