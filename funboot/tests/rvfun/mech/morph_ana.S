# morph_ana.S - xfun compliance: fn.ana (opcode 0x7B f3=1).
#
# Spec (Model.RvRef funMorph, f3=1):  ana functor coalg s  rewrites to
#   functor (fn.ana functor coalg) (coalg s)
# materialized as (pc = the ana cell p, top of stack = functor, then
# coalg, then (s, ssrc)):
#   rc  = hp    : [link coalg] [link functor] [elink p]
#   ca  = rc+12 : [link s]     [elink coalg]
#   inr = ca+8  : [link ca]    [link rc]      [elink functor]
#   mem[ssrc] <- elink(inr);  hp += 32;  pc <- inr
# The walk at `inr` pushes (ca, inr) and (rc, inr+4), then enters the
# functor as host code.
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
  j    ma
  .balign 64
ma:
  fn.link snt
scell:
  fn.link snode              # (s, ssrc = scell)
  fn.link coalgb
  fn.link fnb                # top of stack = functor
maw:
  .word 0x0000107b           # fn.ana
  .balign 8
coalgb:
  j    _fail                 # the coalgebra blob must NOT be entered here
  .balign 8
fnb:
  fn.tor  a0                 # pops (rc, inr+4): a0 = mem[rc+4] = fnb
  la   t1, fnb
  bne  a0, t1, _fail
  fn.tor  a1                 # pops (ca, inr): a1 = mem[ca+4] = coalgb|1
  la   t1, coalgb
  ori  t1, t1, 1
  bne  a1, t1, _fail

  li   gp, 2                 # rc node
  la   s1, _heap
  lw   t0, 0(s1)
  la   t1, coalgb
  bne  t0, t1, _fail
  lw   t0, 4(s1)
  la   t1, fnb
  bne  t0, t1, _fail
  lw   t0, 8(s1)
  la   t1, maw
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 3                 # ca + inr nodes
  lw   t0, 12(s1)
  la   t1, snode
  bne  t0, t1, _fail
  lw   t0, 16(s1)
  la   t1, coalgb
  ori  t1, t1, 1
  bne  t0, t1, _fail
  lw   t0, 20(s1)
  addi t1, s1, 12
  bne  t0, t1, _fail
  lw   t0, 24(s1)
  bne  t0, s1, _fail
  lw   t0, 28(s1)
  la   t1, fnb
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 4                 # root update
  la   t2, scell
  lw   t0, 0(t2)
  addi t1, s1, 20
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 5                 # spine balance + allocation accounting
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 32
  addi t2, s1, 32
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
  .word 0x00CA7A01

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
