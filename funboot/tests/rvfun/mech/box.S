# box.S - xfun compliance: box dispatch (0x5B f3=6, the 0x605b data marker).
#
# Spec (Model.RvRef funReduceOnce BOX): with pc resting on a box marker and
# the spine non-empty: c = top-of-stack VALUE (the continuation), replace
# the top with (box address, top's src), pc <- c. This is the WHNF hand-off:
# the answer box lands on the top of the stack and control arrives at the
# continuation as ordinary host code.
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

  # ---- test 1: [snt][cont] then elink into a .data box -----------------
  .balign 64
test1:
  li   gp, 1
  j    b1c
  .balign 64
b1c:
  fn.link  snt
  fn.link  b1cont
  fn.elink nA                # walk redirects onto the box marker
b1cont:
  fn.tor   a0                # top of stack = the box; payload
  li   t0, 0xB0C5000A
  bne  a0, t0, _fail
  fn.tor   a4                # spine balance: sentinel is back on top
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: box node placed inline in .text (RAM), same dispatch ----
  li   gp, 2
  j    b2c
  .balign 64
b2c:
  fn.link  snt
  fn.link  b2cont
  fn.elink ibox
b2cont:
  fn.tor   a0
  li   t0, 0x77775555
  bne  a0, t0, _fail
  fn.tor   a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  j    _pass

  .balign 8
ibox:
  .word 0x0000605b           # inline box marker (fetched, executes the swap)
  .word 0x77775555

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
  .word 0xB0C5000A

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
