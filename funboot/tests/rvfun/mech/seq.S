# seq.S - xfun compliance: fn.seq (0x5B f3=1, word 0x0000105b).
#
# Spec (Model.RvRef funReduceOnce SEQ):
#   depth >= 2 : pc+4, NO pop (both entries stay; execution falls through
#                to the next word).
#   depth == 1 : replace the top with (seq cell address, 0), pc <- old top
#                VALUE (enter the argument with the seq cell as the
#                continuation-ish top entry).
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

  # ---- test 1: depth >= 2: seq falls through, pops nothing -------------
  .balign 64
test1:
  li   gp, 1
  j    s1c
  .balign 64
s1c:
  fn.link nB
  fn.link nA
  .word 0x0000105b           # fn.seq : depth 2 -> pc+4, no pop
  fn.tor  a1                 # top of stack must STILL be A
  li   t0, 0xC0DE00AA
  bne  a1, t0, _fail
  fn.tor  a2                 # then B
  li   t0, 0xC0DE00BB
  bne  a2, t0, _fail

  # ---- test 2: depth == 1: top replaced by (seq cell, 0), enter old top
  li   gp, 2
  j    s2c
  .balign 64
s2c:
  fn.link s2blob             # top of stack = s2blob
s2q:
  .word 0x0000105b           # fn.seq : depth 1 -> top=(s2q,0), pc=s2blob
  .word 0xD00DFEE5           # s2q+4: read back via tor (low2=01, never fetched)
  .balign 8
s2blob:
  fn.tor  a0                 # pops (s2q, 0): a0 = mem[s2q+4]
  li   t0, 0xD00DFEE5
  bne  a0, t0, _fail

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
  .word 0xC0DE00AA
  .balign 8
nB:
  .word 0x0000605b
  .word 0xC0DE00BB

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
