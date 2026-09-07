# combi_mutual.S - xfun compliance: the hs_braun HOT LOOP, transplanted.
#
# Two combi cells alternate exactly as at braun's divergence site
# (0x800029b8/0x800029bc): the t30 word 0x959431e2 (pop 6, push 3, one
# 3-element body group) and the t4 word 0x0110e842 (pop 5, push 3),
# chained with ZERO host instructions:
#   - the static chunk SITEA [link P][link t4c][t30] is RE-WALKED every
#     iteration (list cells end with elink SITEA),
#   - each dispatch consumes entries the OTHER dispatch just pushed
#     (their sources are the just-written copy cells),
#   - the second t30's root update lands INSIDE the first t4's copy
#     (cp2+0), while that copy is still in the write path.
# At braun's divergence the t4 pushed args[1] = 0x80002e94 where the
# model says 0x80003870 - the value the t30 had pushed one dispatch
# earlier. Every copy cell, group cell, root and popped value of the
# two-pair loop is checked below.
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
SITEA:                       # braun L296, verbatim shape
  fn.link Pbox
  fn.link t4c
  .word 0x959431e2           # fn.combi t30 6,[0,2,1,3,5,4]
  .balign 8
t4c:
  .word 0x0110e842           # fn.combi t4 5,[3,0,1,2,0,0]
  .balign 8
L1:
  fn.link y1box
  fn.elink SITEA
  .balign 8
L2:
  fn.link y2box
  fn.elink SITEA

  .balign 64
test1:
  li   gp, 1
  # Align the loop's allocations to braun's exact line phase: at the
  # divergence the t30's group started at hp = ...0x30 (mod 64), so its
  # 4-word spine copy STRADDLED the 64-byte line (word 0 at offset 0x3C)
  # and the t4's copy landed in the straddled line. Pad with databoxes
  # until hp is congruent, then take all heap checks relative to s4.
1:
  .word 0x0000765b           # fn.databox a2, zero : a2 = old hp
  addi s4, a2, 8             # hp after this box
  andi t0, s4, 63
  li   t1, 0x30
  bne  t0, t1, 1b
  j    seed
  .balign 64
seed:                        # deepest first; top of stack ends at bxA
  fn.link snt
sG:
  fn.link bxG                # root of the second t4
sF:
  fn.link CASEb              # head of the second t4 (ends the loop)
sE:
  fn.link bxE                # root of the first t4
sD:
  fn.link L2                 # head of the first t4 (next list cell)
sC:
  fn.link bxC                # root of the first t30; G0 cell
sB:
  fn.link bxB                # consumed by t30#1 (pushed), then t30#2 G0
sA:
  fn.link bxA                # G0 cell of t30#1
  fn.elink L1                # cap-boundary elink: walk L1 -> SITEA
  .balign 8
CASEb:
  # spine here: (y2, cp''+8) (G0'=_heap+44, cp''+4) (G0b=_heap, cp''+0) snt
  fn.tor  a1                 # mem[y2box+4]
  li   t0, 0xEE000002
  bne  a1, t0, _fail
  fn.tor  a2                 # mem[G0'+4] = link(y1box) = y1box address
  la   t0, y1box
  bne  a2, t0, _fail
  fn.tor  a3                 # mem[G0b+4] = link(bxA) = bxA address
  la   t0, bxA
  bne  a3, t0, _fail
  fn.tor  a4                 # sentinel: spine drained
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # heap layout: pair 1: G0b@_heap [lnk bxC, lnk bxA, eln Pbox],
  #   cp1@+12 [lnk bxB, lnk G0b, lnk y1box, eln t4c],
  #   cp2@+28 [lnk bxB, lnk G0b, lnk y1box, eln L2] (word 0 then
  #   REWRITTEN by t30#2's root update to eln(cp1'));
  # pair 2: G0'@+44 [lnk bxB, lnk y1box, eln Pbox],
  #   cp1'@+56 [lnk G0b, lnk G0', lnk y2box, eln t4c],
  #   cp''@+72 [lnk G0b, lnk G0', lnk y2box, eln CASEb]
  li   gp, 2
  mv   s1, s4
  lw   t2, 0(s1)             # G0b word 0 = link(bxC)
  la   t3, bxC
  bne  t2, t3, _fail
  lw   t2, 4(s1)             # G0b word 1 = link(bxA)
  la   t3, bxA
  bne  t2, t3, _fail
  lw   t2, 8(s1)             # G0b word 2 = elink(Pbox)
  la   t3, Pbox
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 12(s1)            # cp1 word 0 = link(bxB)
  la   t3, bxB
  bne  t2, t3, _fail
  lw   t2, 16(s1)            # cp1 word 1 = link(G0b)
  bne  t2, s1, _fail
  lw   t2, 20(s1)            # cp1 word 2 = link(y1box)
  la   t3, y1box
  bne  t2, t3, _fail
  lw   t2, 24(s1)            # cp1 word 3 = elink(t4c)
  la   t3, t4c
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 28(s1)            # cp2 word 0 := t30#2 ROOT = elink(cp1'=+56)
  addi t3, s1, 56
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 40(s1)            # cp2 word 3 = elink(L2)
  la   t3, L2
  ori  t3, t3, 1
  bne  t2, t3, _fail

  li   gp, 3
  lw   t2, 44(s1)            # G0' word 0 = link(bxB)
  la   t3, bxB
  bne  t2, t3, _fail
  lw   t2, 48(s1)            # G0' word 1 = link(y1box)
  la   t3, y1box
  bne  t2, t3, _fail
  lw   t2, 56(s1)            # cp1' word 0 = link(G0b)
  bne  t2, s1, _fail
  lw   t2, 60(s1)            # cp1' word 1 = link(G0')
  addi t3, s1, 44
  bne  t2, t3, _fail
  lw   t2, 64(s1)            # cp1' word 2 = link(y2box)
  la   t3, y2box
  bne  t2, t3, _fail
  lw   t2, 72(s1)            # cp'' word 0 = link(G0b)
  bne  t2, s1, _fail
  lw   t2, 76(s1)            # cp'' word 1 = link(G0')
  addi t3, s1, 44
  bne  t2, t3, _fail
  lw   t2, 84(s1)            # cp'' word 3 = elink(CASEb)
  la   t3, CASEb
  ori  t3, t3, 1
  bne  t2, t3, _fail

  # seed roots: sC := eln(cp1=+12), sE := eln(cp2=+28), sG := eln(cp''=+72)
  li   gp, 4
  la   t1, sC
  lw   t2, 0(t1)
  addi t3, s1, 12
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, sE
  lw   t2, 0(t1)
  addi t3, s1, 28
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, sG
  lw   t2, 0(t1)
  addi t3, s1, 72
  ori  t3, t3, 1
  bne  t2, t3, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 88
  addi t2, s1, 88          # 2 pairs x 44 bytes from the padded base
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
Pbox:
  .word 0x0000605b
  .word 0x00000050
  .balign 8
y1box:
  .word 0x0000605b
  .word 0xEE000001
  .balign 8
y2box:
  .word 0x0000605b
  .word 0xEE000002
  .balign 8
bxA:
  .word 0x0000605b
  .word 0xAA000001
  .balign 8
bxB:
  .word 0x0000605b
  .word 0xAA000002
  .balign 8
bxC:
  .word 0x0000605b
  .word 0xAA000003
  .balign 8
bxE:
  .word 0x0000605b
  .word 0xAA000005
  .balign 8
bxG:
  .word 0x0000605b
  .word 0xAA000007

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
