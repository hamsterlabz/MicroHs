# combi_hi.S - xfun compliance: HIGH-ARITY combi words extracted from the
# compiled problematic programs, byte-exact:
#   test 1: fn.combi.t2 4,[3,0,1,0,0,0] = 0x0010e022
#           (the hs_clausify / hs_countdown diverging site on HEAD)
#   test 2: fn.combi.t4 5,[3,0,1,2,0,0] = 0x0110e842
#           (the hs_braun diverging site on HEAD)
# (Type field = w[10:4], the model/RTL/gas rule. objdump prints these with
# a STALE w[10:5] decode as "t1"/"t2" - do not trust its tN label.)
# The shapes the minimal tests missed: arity > used leaves (popped
# arguments DISCARDED without update), selectors reaching arg 3, 3- and
# 4-word reduct copies with 2-3 spine pushes.
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

  # ---- test 1: t2 arity 4, selectors [3,0,1]: enter arg3, push arg0 and
  # arg1, discard arg2; copy = [lnk bxB, lnk bxA, eln hb1] at _heap -------
  .balign 64
test1:
  li   gp, 1
  j    h1
  .balign 64
h1:
  fn.link snt
h1r:
  fn.link hb1                # args[3]: entered; deepest consumed = root
h1u:
  fn.link bxC                # args[2]: discarded, cell must stay untouched
  fn.link bxB                # args[1]: pushed (src = copy word 0)
  fn.link bxA                # args[0]: pushed (src = copy word 1)
  fn.combi.t2 4, [3,0,1,0,0,0]
  .balign 8
hb1:
  fn.tor  a1                 # top of stack = (bxA, _heap+4)
  li   t0, 0xD0D00001
  bne  a1, t0, _fail
  fn.tor  a2                 # then (bxB, _heap+0)
  li   t0, 0xD0D00002
  bne  a2, t0, _fail
  la   s1, _heap
  lw   t2, 0(s1)             # copy word 0 = link(bxB)
  la   t3, bxB
  bne  t2, t3, _fail
  lw   t2, 4(s1)             # copy word 1 = link(bxA)
  la   t3, bxA
  bne  t2, t3, _fail
  lw   t2, 8(s1)             # copy word 2 = elink(hb1)
  la   t3, hb1
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, h1r               # root := elink(_heap)
  lw   t2, 0(t1)
  ori  t3, s1, 1
  bne  t2, t3, _fail
  la   t1, h1u               # discarded arg cell untouched
  lw   t2, 0(t1)
  la   t3, bxC
  bne  t2, t3, _fail
  fn.tor  a4                 # spine balance: sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: t4 arity 5, selectors [3,0,1,2]: enter arg3, push arg0,
  # arg1, arg2; discard arg4 (its cell is the root); 4-word copy ----------
  li   gp, 2
  j    h2
  .balign 64
h2:
  fn.link snt
h2r:
  fn.link bxD                # args[4]: discarded; its cell is the root
  fn.link hb2                # args[3]: entered
  fn.link bxC                # args[2]: pushed (src = copy word 0)
  fn.link bxB                # args[1]: pushed (src = copy word 1)
  fn.link bxA                # args[0]: pushed (src = copy word 2)
  fn.combi.t4 5, [3,0,1,2,0,0]
  .balign 8
hb2:
  fn.tor  a1                 # top of stack = (bxA, _heap+20)
  li   t0, 0xD0D00001
  bne  a1, t0, _fail
  fn.tor  a2                 # then (bxB, _heap+16)
  li   t0, 0xD0D00002
  bne  a2, t0, _fail
  fn.tor  a3                 # then (bxC, _heap+12)
  li   t0, 0xD0D00003
  bne  a3, t0, _fail
  la   s1, _heap
  lw   t2, 12(s1)            # copy word 0 = link(bxC)
  la   t3, bxC
  bne  t2, t3, _fail
  lw   t2, 16(s1)            # copy word 1 = link(bxB)
  la   t3, bxB
  bne  t2, t3, _fail
  lw   t2, 20(s1)            # copy word 2 = link(bxA)
  la   t3, bxA
  bne  t2, t3, _fail
  lw   t2, 24(s1)            # copy word 3 = elink(hb2)
  la   t3, hb2
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, h2r               # root := elink(_heap+12)
  lw   t2, 0(t1)
  addi t3, s1, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 28
  addi t2, s1, 28
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
bxA:
  .word 0x0000605b
  .word 0xD0D00001
  .balign 8
bxB:
  .word 0x0000605b
  .word 0xD0D00002
  .balign 8
bxC:
  .word 0x0000605b
  .word 0xD0D00003
  .balign 8
bxD:
  .word 0x0000605b
  .word 0xD0D00004

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
