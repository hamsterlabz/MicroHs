# elink.S - xfun compliance: fn.elink (any word with low2=01).
#
# Spec (Model.RvRef): an INLINE elink terminator (chunk run still under the
# cap) is a pure fetch redirect - silent, no retire, walk continues at the
# target. A LONE elink (no leading links) or an elink AT the cap boundary
# is the next retiring instruction: it dispatches as one reduction
# (pc <- target & ~3).
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

  # ---- test 1: inline elink: [link A][elink e1b] chains into [link B] --
  .balign 64
test1:
  li   gp, 1
  j    e1c
  .balign 64
e1c:
  fn.link  nA
  fn.elink e1b               # inline: silent redirect, walk continues
  .balign 64
e1b:
  fn.link  nB
  fn.tor   a1                # top of stack = B (pushed after the redirect)
  li   t0, 0xB0000002
  bne  a1, t0, _fail
  fn.tor   a2                # then A (pushed before the redirect)
  li   t0, 0xB0000001
  bne  a2, t0, _fail

  # ---- test 2: lone elink (no leading links): dispatches as a redirect -
  li   gp, 2
  j    e2c
  .balign 64
e2c:
  fn.elink e2b
  .balign 64
e2b:
  fn.link  nA
  fn.tor   a1
  li   t0, 0xB0000001
  bne  a1, t0, _fail

  # ---- test 3: elink exactly AT the cap boundary (word 16): the chunk
  # run hits the cap first, so the elink must dispatch, not inline -------
  li   gp, 3
  j    e3pad
  .balign 64
e3pad:                       # 15 host words position the link at word 15
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
  nop
  fn.link  nB                # word 15: cap = 1, run stops at the cap
  fn.elink e3b               # word 0 of the next line: dispatch redirect
  .balign 64
e3b:
  fn.tor   a1                # top of stack = B
  li   t0, 0xB0000002
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
nA:
  .word 0x0000605b
  .word 0xB0000001
  .balign 8
nB:
  .word 0x0000605b
  .word 0xB0000002

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
