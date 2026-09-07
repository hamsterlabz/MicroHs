# combi.S - xfun compliance: fn.combi dispatch (low3 = 010; word =
# 0x2 | type[10:4] | arity[13:11] | args[31:14], 3 bits per arg).
#
# Spec (Model.RvRef funComStep): pop `arity` entries, materialize the body
# groups + the reduct spine copy at hp, overwrite the redex root (the
# DEEPEST consumed entry's source cell) with elink(copy) - the record-free
# Turner update - push spine elems 1.. (src = their copy cells) and enter
# the spine head. Types here: t0 = select (copy = [elink(arg[a0])]),
# t1 = apply (copy = [link(arg[a1]), elink(arg[a0])]).
# Every value below is architectural: copy addresses are _heap-relative
# (first allocation lands at _heap), roots are chunk cells.
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

  # ---- test 1: t0 arity-2 select-FIRST (K): enters boxA ----------------
  .balign 64
test1:
  li   gp, 1
  j    c1
  .balign 64
c1:
  fn.link snt
  fn.link epi1               # WHNF continuation
r1:
  fn.link boxB               # deepest consumed = the redex root cell
  fn.link boxA               # top of stack
  fn.combi.t0 2, [0,0,0,0,0,0]
epi1:
  fn.tor  a0                 # box swap put boxA on top: payload
  li   t0, 0xC0FFEE11
  bne  a0, t0, _fail
  la   t1, r1                # root cell := elink(copy) = _heap|1
  lw   t2, 0(t1)
  la   t3, _heap
  ori  t4, t3, 1
  bne  t2, t4, _fail
  lw   t5, 0(t3)             # copy cell = elink(boxA)
  la   t6, boxA
  ori  t6, t6, 1
  bne  t5, t6, _fail
  fn.tor  a4                 # spine balance: sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: t0 arity-2 select-SECOND: enters boxB -------------------
  li   gp, 2
  j    c2
  .balign 64
c2:
  fn.link snt
  fn.link epi2
r2:
  fn.link boxB
  fn.link boxA
  fn.combi.t0 2, [1,0,0,0,0,0]
epi2:
  fn.tor  a0
  li   t0, 0xBEEF2222        # boxB payload this time
  bne  a0, t0, _fail
  la   t1, r2                # root := elink(_heap+4)
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 4
  ori  t4, t3, 1
  bne  t2, t4, _fail
  lw   t5, 0(t3)             # copy = elink(boxB)
  la   t6, boxB
  ori  t6, t6, 1
  bne  t5, t6, _fail
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 3: t1 arity-2 APPLY: copy = [link boxA, elink fb3],
  # boxA pushed with src = its copy cell, blob entered ------------------
  li   gp, 3
  j    c3
  .balign 64
c3:
  fn.link snt
r3:
  fn.link boxA               # deepest consumed (root)
  fn.link fb3                # top of stack (the spine head)
  fn.combi.t1 2, [0,1,0,0,0,0]
  .balign 8
fb3:
  fn.tor  a1                 # top of stack = (boxA, copy cell): payload
  li   t0, 0xC0FFEE11
  bne  a1, t0, _fail
  la   t1, r3                # root := elink(_heap+8)
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 8
  ori  t4, t3, 1
  bne  t2, t4, _fail
  lw   t5, 0(t3)             # copy word 0 = link(boxA)
  la   t6, boxA
  bne  t5, t6, _fail
  lw   t5, 4(t3)             # copy word 1 = elink(fb3)
  la   t6, fb3
  ori  t6, t6, 1
  bne  t5, t6, _fail
  fn.tor  a4                 # sentinel back on top
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 4: allocation accounting: hp = _heap + 16 ------------------
  li   gp, 4
  .word 0x0000765b           # fn.databox a2, zero : a2 = hp
  la   t2, _heap
  addi t2, t2, 16
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
  .balign 8
boxB:
  .word 0x0000605b
  .word 0xBEEF2222

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
