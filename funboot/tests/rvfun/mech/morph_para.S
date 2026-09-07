# morph_para.S - xfun compliance: fn.para (opcode 0x7B f3=2).
#
# Spec (Model.RvRef funMorph): f3=2 routes through the SAME rewrite as
# cata; the elink in the rc node records the para cell itself, so a
# decode that confuses the two schemes fails on the mem[rc+8] check.
# Layout identical to morph_cata.S otherwise.
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
  j    mp
  .balign 64
mp:
  fn.link snt
xcell:
  fn.link xnode
  fn.link algb
  fn.link fnb
mpw:
  .word 0x0000207b           # fn.para
  .balign 8
fnb:
  j    _fail
  .balign 8
algb:
  fn.tor  a0                 # a0 = rc = _heap
  la   s1, _heap
  bne  a0, s1, _fail

  li   gp, 2
  lw   t0, 8(s1)             # rc marker = elink(the PARA cell)
  la   t1, mpw
  ori  t1, t1, 1
  bne  t0, t1, _fail
  la   t2, xcell             # root update
  lw   t0, 0(t2)
  addi t1, s1, 24
  ori  t1, t1, 1
  bne  t0, t1, _fail

  li   gp, 3
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
  .word 0x00CA7A02

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
