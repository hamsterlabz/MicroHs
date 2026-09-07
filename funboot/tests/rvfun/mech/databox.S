# databox.S - xfun compliance: fn.databox rd, rs1  (0x5B f3=7,
# 0x705b | rd<<7 | rs1<<15).
#
# Spec (Model.RvRef stepInsnBase): box R[rs1] on the heap ({0x605b, R[rs1]}
# at hp), rd <- the box pointer, hp += 8. pc+4. The first allocation after
# boot lands exactly at _heap, so all box addresses here are architectural.
# Test 4 then USES a runtime box as a live graph node (box dispatch through
# a continuation), including the host-jump-onto-heap fetch seam.
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
  # ---- test 1: box a0; rd = old hp = _heap; marker + payload written ---
  li   gp, 1
  li   a0, 0x12345678
  .word 0x000575db           # fn.databox a1, a0
  la   t2, _heap
  bne  a1, t2, _fail
  lw   t0, 0(a1)
  li   t1, 0x0000605b
  bne  t0, t1, _fail
  lw   t0, 4(a1)
  li   t1, 0x12345678
  bne  t0, t1, _fail

  # ---- test 2: second box: hp advanced by exactly 8 --------------------
  li   gp, 2
  li   a0, 0xFEEDF00D
  .word 0x0005765b           # fn.databox a2, a0
  addi t2, a1, 8
  bne  a2, t2, _fail
  lw   t0, 0(a2)
  li   t1, 0x0000605b
  bne  t0, t1, _fail
  lw   t0, 4(a2)
  li   t1, 0xFEEDF00D
  bne  t0, t1, _fail

  # ---- test 3: rs1 = x0 boxes zero -------------------------------------
  li   gp, 3
  .word 0x000076db           # fn.databox a3, zero
  addi t2, a2, 8
  bne  a3, t2, _fail
  lw   t0, 4(a3)
  bnez t0, _fail

  # ---- test 4: the test-1 box is a live graph node: push a continuation
  # and a sentinel, then jump INTO the heap box; box dispatch must swap
  # through the continuation with the box on the top of the stack --------
  li   gp, 4
  j    d4c
  .balign 64
d4c:
  fn.link snt
  fn.link d4cont
  jr   a1                    # host jump onto the heap box (fetch seam)
d4cont:
  fn.tor  a4                 # top of stack = the box; payload check
  li   t0, 0x12345678
  bne  a4, t0, _fail
  fn.tor  a5                 # next entry must be the sentinel (balance)
  li   t0, 0x5E17BA5E
  bne  a5, t0, _fail

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

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
