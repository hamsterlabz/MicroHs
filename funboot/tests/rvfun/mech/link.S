# link.S - xfun compliance: fn.link chunk pushes (any word with low2=00).
#
# Spec (Model.RvRef funConsumeLinks): at a fetch line, up to
# cap = min(16 - word-offset-in-line, 8 - depth%8) leading link cells push
# (value, own-address) silently; a link terminator at the cap continues
# with the next chunk; any other terminator stops the walk. Link cells
# never retire.
# Test 3 places a chunk so it straddles a 64-byte fetch line: 2 links in
# line N (cap hit), 1 link in line N+1, then the tor terminator.
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

  # ---- test 1: 3-link chunk, popped LIFO -------------------------------
  .balign 64
test1:
  li   gp, 1
  j    l1c
  .balign 64
l1c:
  fn.link n1
  fn.link n2
  fn.link n3
  fn.tor  a1                 # top of stack = n3
  li   t0, 0xA0000003
  bne  a1, t0, _fail
  fn.tor  a2
  li   t0, 0xA0000002
  bne  a2, t0, _fail
  fn.tor  a3
  li   t0, 0xA0000001
  bne  a3, t0, _fail

  # ---- test 2: taken BRANCH lands directly on a chunk (fetch seam) -----
  li   gp, 2
  li   t0, 1
  li   t1, 2
  bne  t0, t1, l2c           # always taken, target = link cell
  j    _fail
  .balign 64
l2c:
  fn.link n2
  fn.tor  a1
  li   t0, 0xA0000002
  bne  a1, t0, _fail

  # ---- test 3: chunk straddles the 64-byte line: cap = 16 - offset -----
  li   gp, 3
  j    l3pad
  .balign 64
l3pad:                       # 14 host words position the links at word 14
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  fn.link n1                 # word 14 of the line (cap = 2)
  fn.link n2                 # word 15
  fn.link n3                 # word 0 of the next line (chunk continues)
  fn.tor  a1                 # top of stack = n3
  li   t0, 0xA0000003
  bne  a1, t0, _fail
  fn.tor  a2
  li   t0, 0xA0000002
  bne  a2, t0, _fail
  fn.tor  a3
  li   t0, 0xA0000001
  bne  a3, t0, _fail

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
n1:
  .word 0x0000605b
  .word 0xA0000001
  .balign 8
n2:
  .word 0x0000605b
  .word 0xA0000002
  .balign 8
n3:
  .word 0x0000605b
  .word 0xA0000003

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
