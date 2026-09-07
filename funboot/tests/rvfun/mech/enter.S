# enter.S - xfun compliance: enter (opcode 0x0B, word 0x0000000b).
#
# Spec (Model.RvRef funReduceOnce ENTER): pop the top of the stack, pc <-
# the popped VALUE (resume there). The entry leaves no trace on the spine.
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

  # ---- test 1: enter pops the blob address and resumes there -----------
  .balign 64
test1:
  li   gp, 1
  j    n1c
  .balign 64
n1c:
  fn.link snt
  fn.link nA
  fn.link e1blob             # top of stack = e1blob
  .word 0x0000000b           # enter : pop, pc <- e1blob
  .balign 8
e1blob:
  fn.tor  a0                 # top of stack must now be nA
  li   t0, 0xE47E0001
  bne  a0, t0, _fail
  fn.tor  a4                 # then the sentinel (spine balance)
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: enter resumes INTO another chunk (graph-to-graph) -------
  li   gp, 2
  j    n2c
  .balign 64
n2c:
  fn.link n2b                # top of stack = the chunk address n2b
  .word 0x0000000b           # enter : pop, pc <- n2b (a link cell)
  .balign 64
n2b:
  fn.link nA
  fn.tor  a1
  li   t0, 0xE47E0001
  bne  a1, t0, _fail

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
nA:
  .word 0x0000605b
  .word 0xE47E0001

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
