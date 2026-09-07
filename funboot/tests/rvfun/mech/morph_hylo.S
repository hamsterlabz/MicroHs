# morph_hylo.S - xfun compliance: fn.hylo (opcode 0x7B f3=3, arity 4).
#
# Spec (Model.RvRef funMorph, f3=3):  hylo functor alg coalg s  rewrites to
#   alg (functor (fn.hylo f a c) (coalg s))
# materialized as (pc = the hylo cell p; top of stack = functor, alg,
# coalg, then (s, _)):
#   rc  = hp    : [link coalg] [link alg] [link functor] [elink p]
#   ca  = rc+16 : [link s]     [elink coalg]
#   inr = ca+8  : [link ca]    [link rc]  [elink functor]
#   push (inr, 0);  hp += 36;  pc <- alg  (entered directly as host code;
#   no root update in this scheme - the s cell must stay untouched)
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
  j    mh
  .balign 64
mh:
  fn.link snt
scell:
  fn.link snode
  fn.link coalgb
  fn.link algb
  fn.link fnb                # top of stack = functor
mhw:
  .word 0x0000307b           # fn.hylo
  .balign 8
coalgb:
  j    _fail
  .balign 8
fnb:
  j    _fail
  .balign 8
algb:
  fn.tor  a0                 # pops (inr, 0): a0 = mem[inr+4] = rc = _heap
  la   s1, _heap
  bne  a0, s1, _fail

  li   gp, 2                 # rc node
  lw   t0, 0(s1)
  la   t1, coalgb
  bne  t0, t1, _fail
  lw   t0, 4(s1)
  la   t1, algb
  bne  t0, t1, _fail
  lw   t0, 8(s1)
  la   t1, fnb
  bne  t0, t1, _fail
  lw   t0, 12(s1)
  la   t1, mhw
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 3                 # ca + inr nodes
  lw   t0, 16(s1)
  la   t1, snode
  bne  t0, t1, _fail
  lw   t0, 20(s1)
  la   t1, coalgb
  ori  t1, t1, 1
  bne  t0, t1, _fail
  lw   t0, 24(s1)
  addi t1, s1, 16
  bne  t0, t1, _fail
  lw   t0, 28(s1)
  bne  t0, s1, _fail
  lw   t0, 32(s1)
  la   t1, fnb
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 4                 # NO root update: the s link cell is untouched
  la   t2, scell
  lw   t0, 0(t2)
  la   t1, snode
  bne  t0, t1, _fail

  li   gp, 5                 # spine balance + allocation accounting
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 36
  addi t2, s1, 36
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
snode:
  .word 0x0000605b
  .word 0x00CA7A03

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
