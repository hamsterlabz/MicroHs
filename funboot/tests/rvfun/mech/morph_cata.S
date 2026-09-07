# morph_cata.S - xfun compliance: fn.cata (opcode 0x7B f3=0).
#
# Spec (Model.RvRef funMorph, f3=0):  cata functor alg x  rewrites to
#   alg (functor (fn.cata functor alg) x)
# materialized as three heap nodes (with pc = the cata cell p, top of
# stack = functor, then alg, then (x, xsrc)):
#   rc  = hp    : [link alg]  [link functor] [elink p]
#   inr = rc+12 : [link x]    [link rc]      [elink functor]
#   out = inr+12: [link inr]  [elink alg]
#   mem[xsrc] <- elink(out);  hp += 32;  pc <- out
# The walk at `out` then pushes (inr, out) and enters alg as host code.
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
  j    mc
  .balign 64
mc:
  fn.link snt
xcell:
  fn.link xnode              # (x, xsrc = xcell)
  fn.link algb
  fn.link fnb                # top of stack = functor
mcw:
  .word 0x0000007b           # fn.cata
  .balign 8
fnb:
  j    _fail                 # the functor blob must NOT be entered here
  .balign 8
algb:
  fn.tor  a0                 # pops (inr, out): a0 = mem[inr+4] = rc = _heap
  la   s1, _heap
  bne  a0, s1, _fail

  li   gp, 2                 # rc node
  lw   t0, 0(s1)
  la   t1, algb
  bne  t0, t1, _fail
  lw   t0, 4(s1)
  la   t1, fnb
  bne  t0, t1, _fail
  lw   t0, 8(s1)
  la   t1, mcw
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 3                 # inr node
  lw   t0, 12(s1)
  la   t1, xnode
  bne  t0, t1, _fail
  lw   t0, 16(s1)
  bne  t0, s1, _fail
  lw   t0, 20(s1)
  la   t1, fnb
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 4                 # out node + the root update
  lw   t0, 24(s1)
  addi t1, s1, 12
  bne  t0, t1, _fail
  lw   t0, 28(s1)
  la   t1, algb
  ori  t1, t1, 1
  bne  t0, t1, _fail
  la   t2, xcell
  lw   t0, 0(t2)
  addi t1, s1, 24
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
xnode:
  .word 0x0000605b
  .word 0x00CA7A00

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
