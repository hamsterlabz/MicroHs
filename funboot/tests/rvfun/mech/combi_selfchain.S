# combi_selfchain.S - xfun compliance: SELF-CHAINED t4 dispatches through
# one combi cell - the hs_braun toList/ilv shape at the exact failure:
# the same fn.combi.t4 5,[3,0,1,2,0,0] word (0x0110e842) dispatches 3
# times IN A ROW (pc returns to the same cell via args[3] each time),
# each iteration re-pushing a/b/c with sources in the just-written copy
# and Turner-updating a root while the previous copies are still in the
# write path. In hs_braun the fetch's walk of such a just-written copy
# cell (0x80003890) returned the STALE word - the h-cache write-to-
# fetch-read ordering hazard. The window/update comparison and the final
# cell checks below catch both the stale-push and stale-walk forms.
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
t4cell:
  fn.combi.t4 5, [3,0,1,2,0,0]     # 0x0110e842 - the braun word

  # ---- test 1: three back-to-back dispatches of t4cell ------------------
  # seed spine (top first): a b c T4 T4 T4 T4 CASE K0 snt
  #   iter 1: pops a,b,c,T4,T4  root=sc2  head=T4 -> pc=t4cell
  #   iter 2: pops a,b,c,T4,T4  root=sc4  head=T4 -> pc=t4cell
  #   iter 3: pops a,b,c,CASE,K0 root=sk0 head=CASE (host)
  # copies at _heap+0/+16/+32, each [lnk c, lnk b, lnk a, eln next-head]
  .balign 64
test1:
  li   gp, 1
  j    s1c
  .balign 64
s1c:
  fn.link snt
sk0:
  fn.link K0box
  fn.link CASEb
sc4:
  fn.link t4cell
sc3:
  fn.link t4cell
sc2:
  fn.link t4cell
sc1:
  fn.link t4cell
  fn.link bx3                # c
  fn.link bx2                # b
  fn.link bx1                # a (top of stack)
  fn.elink t4cell
  .balign 8
CASEb:
  fn.tor  a1                 # (a, copy3+8): payload of bx1
  li   t0, 0xD0D00011
  bne  a1, t0, _fail
  fn.tor  a2                 # (b, copy3+4)
  li   t0, 0xD0D00012
  bne  a2, t0, _fail
  fn.tor  a3                 # (c, copy3+0)
  li   t0, 0xD0D00013
  bne  a3, t0, _fail
  fn.tor  a4                 # sentinel: spine drained
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail

  # copies: [lnk bx3, lnk bx2, lnk bx1, eln t4cell/CASEb]
  li   gp, 2
  la   s1, _heap
  li   s2, 3                 # three copies at _heap, +16, +32
1:
  lw   t2, 0(s1)
  la   t3, bx3
  bne  t2, t3, _fail
  lw   t2, 4(s1)
  la   t3, bx2
  bne  t2, t3, _fail
  lw   t2, 8(s1)
  la   t3, bx1
  bne  t2, t3, _fail
  addi s1, s1, 16
  addi s2, s2, -1
  bnez s2, 1b
  la   s1, _heap
  lw   t2, 12(s1)            # copy1 tail = elink(t4cell)
  la   t3, t4cell
  ori  t3, t3, 1
  bne  t2, t3, _fail
  lw   t2, 28(s1)            # copy2 tail = elink(t4cell)
  bne  t2, t3, _fail
  lw   t2, 44(s1)            # copy3 tail = elink(CASEb)
  la   t3, CASEb
  ori  t3, t3, 1
  bne  t2, t3, _fail

  # roots: sc2 := eln(_heap), sc4 := eln(_heap+16), sk0 := eln(_heap+32)
  li   gp, 3
  la   t1, sc2
  lw   t2, 0(t1)
  la   t3, _heap
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, sc4
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 16
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, sk0
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 32
  ori  t3, t3, 1
  bne  t2, t3, _fail
  # untouched seed cells: sc1/sc3 still link(t4cell)
  la   t1, sc1
  lw   t2, 0(t1)
  la   t3, t4cell
  bne  t2, t3, _fail
  la   t1, sc3
  lw   t2, 0(t1)
  bne  t2, t3, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 48
  la   t2, _heap
  addi t2, t2, 48
  bne  a2, t2, _fail

  # ---- test 2: the same chain again, hotter: the seed cells sc2/sc4/sk0
  # were memoized above, so a FRESH seed drives 4 dispatches with the
  # earlier copies resident in the same h-cache sets (the test-1
# databox probe adds 8: copies at _heap+56/+72/+88/+104) ----------------------
  li   gp, 4
  j    s2c
  .balign 64
s2c:
  fn.link snt
uk0:
  fn.link K0box
  fn.link CASEc
uc6:
  fn.link t4cell
uc5:
  fn.link t4cell
uc4:
  fn.link t4cell
uc3:
  fn.link t4cell
uc2:
  fn.link t4cell
uc1:
  fn.link t4cell
  fn.link bx3
  fn.link bx2
  fn.link bx1
  fn.elink t4cell
  .balign 8
CASEc:
  fn.tor  a1
  li   t0, 0xD0D00011
  bne  a1, t0, _fail
  fn.tor  a2
  li   t0, 0xD0D00012
  bne  a2, t0, _fail
  fn.tor  a3
  li   t0, 0xD0D00013
  bne  a3, t0, _fail
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  li   gp, 5
  la   t1, uc2               # roots of the 4 dispatches
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 56
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, uc4
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 72
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, uc6
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 88
  ori  t3, t3, 1
  bne  t2, t3, _fail
  la   t1, uk0
  lw   t2, 0(t1)
  la   t3, _heap
  addi t3, t3, 104
  ori  t3, t3, 1
  bne  t2, t3, _fail
  .word 0x0000765b           # fn.databox a2, zero : hp = _heap + 112
  la   t2, _heap
  addi t2, t2, 120
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
K0box:
  .word 0x0000605b
  .word 0x00000000
  .balign 8
bx1:
  .word 0x0000605b
  .word 0xD0D00011
  .balign 8
bx2:
  .word 0x0000605b
  .word 0xD0D00012
  .balign 8
bx3:
  .word 0x0000605b
  .word 0xD0D00013

  .section .tohost
  .align 4
  .globl tohost
tohost: .dword 0
