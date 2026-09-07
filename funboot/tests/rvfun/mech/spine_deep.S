# spine_deep.S - xfun compliance: deep spine (physical storage + caps).
#
# Test 1 pushes 20 links (chunk caps split the run: 8 + 8 + 4) then pops
# all 20 with fn.tor, checking strict LIFO order - a spill/fill or
# wrap defect in the spine storage shows up as a wrong value or a
# spine-depth divergence. Test 2 interleaves: push 6, pop 2, push 6
# starting at depth 4 (the depth-cap path: run splits 4 + 2), pop 10.
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

  # ---- test 1: 20 pushes, 20 LIFO pops ----------------------------------
  .balign 64
test1:
  li   gp, 1
  j    sd1
  .balign 64
sd1:
  .set K, 0
  .rept 20
  fn.link dnodes + (K*8)     # payload of node K = 0xA0000001 + K
  .set K, K+1
  .endr
  li   s1, 20                # host terminator; pop countdown
1:
  fn.tor  a1
  li   t0, 0xA0000000
  add  t0, t0, s1
  bne  a1, t0, _fail
  addi s1, s1, -1
  bnez s1, 1b

  # ---- test 2: interleaved push/pop across the depth cap -----------------
  li   gp, 2
  j    sd2a
  .balign 64
sd2a:
  .set K, 0
  .rept 6
  fn.link dnodes + (K*8)
  .set K, K+1
  .endr
  li   s1, 6                 # pop 2: values +6, +5
1:
  fn.tor  a1
  li   t0, 0xA0000000
  add  t0, t0, s1
  bne  a1, t0, _fail
  addi s1, s1, -1
  li   t2, 4
  bgt  s1, t2, 1b
  j    sd2b
  .balign 64
sd2b:                        # depth 4 here: cap = 8 - 4 splits the run 4+2
  .set K, 6
  .rept 6
  fn.link dnodes + (K*8)     # payloads +7 .. +12
  .set K, K+1
  .endr
  li   s1, 12                # pop 6: +12 .. +7
1:
  fn.tor  a1
  li   t0, 0xA0000000
  add  t0, t0, s1
  bne  a1, t0, _fail
  addi s1, s1, -1
  li   t2, 6
  bgt  s1, t2, 1b
  li   s1, 4                 # pop the 4 left from the first batch: +4 .. +1
1:
  fn.tor  a1
  li   t0, 0xA0000000
  add  t0, t0, s1
  bne  a1, t0, _fail
  addi s1, s1, -1
  bnez s1, 1b

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
dnodes:
  .set K, 1
  .rept 20
  .word 0x0000605b
  .word 0xA0000000 + K
  .set K, K+1
  .endr

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
