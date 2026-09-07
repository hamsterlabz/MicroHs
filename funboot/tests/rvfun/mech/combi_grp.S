# combi_grp.S - xfun compliance: combi words with BODY GROUPS and a
# DUPLICATED argument selector, extracted byte-exact from the compiled
# problematic programs (neighbors of the diverging sites):
#   test 1: fn.combi.t15 5,[0,1,3,2,4,0] = 0x113228f2   (hs_clausify)
#           spine [arg0, G0, G1]; G0 = [arg1, arg3], G1 = [arg2, arg4]
#   test 2: fn.combi.t30 6,[0,2,1,3,5,4] = 0x959431e2   (hs_braun)
#           spine [arg0, arg2, G0, arg4]; G0 = [arg1, arg3, arg5]
#   test 3: fn.combi.t46 5,[4,0,1,3,2,2] = 0x49912ae2   (hs_braun)
#           spine [arg4, arg0, G0]; G0 = [arg1, arg3, arg2, arg2] - the
#           same argument selected TWICE inside one group (sharing)
# (Type field = w[10:4]; objdump's tN label uses a stale w[10:5] decode.)
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

  # ---- test 1: t15 arity 5: G0 @_heap = [lnk arg3, eln arg1], G1
  # @_heap+8 = [lnk arg4, eln arg2], copy @_heap+16 = [lnk G1, lnk G0,
  # eln arg0]; push (G0, copy+4) and (G1, copy+0); enter arg0 -------------
  .balign 64
test1:
  li   gp, 1
  j    g1
  .balign 64
g1:
  fn.link snt
g1r:
  fn.link bxD                # args[4]: G1 tail cell; deepest = root
  fn.link bxC                # args[3]: G0 tail cell
  fn.link bxB                # args[2]: G1 head (elink)
  fn.link bxA                # args[1]: G0 head (elink)
  fn.link gb1                # args[0]: entered
  fn.combi.t15 5, [0,1,3,2,4,0]
  .balign 8
gb1:
  fn.tor  a1                 # pops (G0 = _heap, copy+4): mem[G0+4] = eln(bxA)
  la   t0, bxA
  ori  t0, t0, 1
  bne  a1, t0, _fail
  fn.tor  a2                 # pops (G1 = _heap+8): mem[G1+4] = eln(bxB)
  la   t0, bxB
  ori  t0, t0, 1
  bne  a2, t0, _fail
  la   s1, _heap
  lw   t2, 0(s1)             # G0 word 0 = link(arg3 = bxC)
  la   t3, bxC
  bne  t2, t3, _fail
  lw   t2, 8(s1)             # G1 word 0 = link(arg4 = bxD)
  la   t3, bxD
  bne  t2, t3, _fail
  lw   t2, 16(s1)            # copy word 0 = link(G1 = _heap+8)
  addi t3, s1, 8
  bne  t2, t3, _fail
  lw   t2, 20(s1)            # copy word 1 = link(G0 = _heap)
  bne  t2, s1, _fail
  lw   t2, 24(s1)            # copy word 2 = elink(gb1)
  la   t3, gb1
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, g1r               # root := elink(copy = _heap+16)
  lw   t2, 0(t1)
  addi t3, s1, 16
  ori  t3, t3, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 2: t30 arity 6: G0 @H=_heap+28 = [lnk arg5, lnk arg3,
  # eln arg1], copy @H+12 = [lnk arg4, lnk G0, lnk arg2, eln arg0];
  # push (arg2, copy+8), (G0, copy+4), (arg4, copy+0); enter arg0 ---------
  li   gp, 2
  j    g2
  .balign 64
g2:
  fn.link snt
g2r:
  fn.link bxE                # args[5]: G0 tail cell; deepest = root
  fn.link bxD                # args[4]: pushed under G0
  fn.link bxC                # args[3]: G0 middle cell
  fn.link bxB                # args[2]: pushed on top
  fn.link bxA                # args[1]: G0 head (elink)
  fn.link gb2                # args[0]: entered
  fn.combi.t30 6, [0,2,1,3,5,4]
  .balign 8
gb2:
  fn.tor  a1                 # pops (bxB box, copy+8): payload
  li   t0, 0xD0D00002
  bne  a1, t0, _fail
  la   s1, _heap
  addi s2, s1, 28            # H = G0 base
  fn.tor  a2                 # pops (G0 = H): mem[H+4] = link(arg3 = bxC)
  la   t0, bxC
  bne  a2, t0, _fail
  fn.tor  a3                 # pops (bxD box, copy+0): payload
  li   t0, 0xD0D00004
  bne  a3, t0, _fail
  lw   t2, 0(s2)             # G0 word 0 = link(arg5 = bxE)
  la   t3, bxE
  bne  t2, t3, _fail
  lw   t2, 8(s2)             # G0 word 2 = elink(arg1 = bxA)
  la   t3, bxA
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 12(s2)            # copy word 0 = link(arg4 = bxD)
  la   t3, bxD
  bne  t2, t3, _fail
  lw   t2, 16(s2)            # copy word 1 = link(G0 = H)
  bne  t2, s2, _fail
  lw   t2, 20(s2)            # copy word 2 = link(arg2 = bxB)
  la   t3, bxB
  bne  t2, t3, _fail
  lw   t2, 24(s2)            # copy word 3 = elink(gb2)
  la   t3, gb2
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, g2r               # root := elink(copy = H+12)
  lw   t2, 0(t1)
  addi t3, s2, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # ---- test 3: t46 arity 5: G0 @H2=_heap+56 = [lnk arg2, lnk arg2,
  # lnk arg3, eln arg1] - args[2] TWICE in one group; copy @H2+16 =
  # [lnk G0, lnk arg0, eln arg4]; push (arg0, copy+4), (G0, copy+0);
  # enter arg4 (whose own cell is the root) -------------------------------
  li   gp, 3
  j    g3
  .balign 64
g3:
  fn.link snt
g3r:
  fn.link gb3                # args[4]: entered; deepest = root
  fn.link bxD                # args[3]: G0 cell
  fn.link bxC                # args[2]: DUPLICATED G0 cells
  fn.link bxB                # args[1]: G0 head (elink)
  fn.link bxA                # args[0]: pushed on top
  fn.combi.t46 5, [4,0,1,3,2,2]
  .balign 8
gb3:
  fn.tor  a1                 # pops (bxA box, copy+4): payload
  li   t0, 0xD0D00001
  bne  a1, t0, _fail
  la   s1, _heap
  addi s2, s1, 56            # H2 = G0 base
  fn.tor  a2                 # pops (G0 = H2): mem[H2+4] = link(arg2 = bxC)
  la   t0, bxC
  bne  a2, t0, _fail
  lw   t2, 0(s2)             # G0 word 0 = link(arg2 = bxC) - dup pair
  la   t3, bxC
  bne  t2, t3, _fail
  lw   t2, 4(s2)             # G0 word 1 = link(arg2 = bxC) - dup pair
  bne  t2, t3, _fail
  lw   t2, 8(s2)             # G0 word 2 = link(arg3 = bxD)
  la   t3, bxD
  bne  t2, t3, _fail
  lw   t2, 12(s2)            # G0 word 3 = elink(arg1 = bxB)
  la   t3, bxB
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 16(s2)            # copy word 0 = link(G0 = H2)
  bne  t2, s2, _fail
  lw   t2, 20(s2)            # copy word 1 = link(arg0 = bxA)
  la   t3, bxA
  bne  t2, t3, _fail
  lw   t2, 24(s2)            # copy word 2 = elink(gb3)
  la   t3, gb3
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, g3r               # root := elink(copy = H2+16)
  lw   t2, 0(t1)
  addi t3, s2, 16
  ori  t3, t3, 1
  bne  t2, t3, _fail
  fn.tor  a4                 # sentinel
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 84
  addi t2, s1, 84
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
  .balign 8
bxE:
  .word 0x0000605b
  .word 0xD0D00005

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
