# y.S - xfun compliance: fn.y (0x5B f3=0, word 0x0000005b) - the knot.
#
# Spec (Model.RvRef funReduceOnce Y), with top of stack (f, fsrc):
#   yf = hp;  mem[yf] = yf (self-link);  mem[yf+4] = elink(f);  hp += 8;
#   mem[fsrc] = elink(yf)   (root update, memoizes the knot);
#   top of stack <- (yf, yf);  pc <- f.
#
# Test 1 checks the knot anatomy + root update. Tests 2/3 RECURSE through
# the knot 6 more times via the memoized root (jr onto the updated cell:
# elink dispatch -> self-link push -> inline elink -> blob), verifying the
# spine top each entry and ZERO further heap allocation (memoization).
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
  li   gp, 1
  li   s0, 0                 # blob entry counter
  j    y1c
  .balign 64
y1c:
  fn.link snt                # spine bottom: balance sentinel
yroot:
  fn.link yblob              # the knot's root cell (gets the elink update)
  fn.y
  .balign 8
yblob:
  # every entry: top of stack = (yf, yf); tor unboxes the knot's arg cell
  fn.tor  a0                 # a0 = mem[yf+4] = elink(yblob) = yblob|1
  la   t0, yblob
  ori  t0, t0, 1
  bne  a0, t0, _fail
  addi s0, s0, 1
  li   t1, 1
  bne  s0, t1, yagain
  # first entry only: knot anatomy + root update
  la   t1, _heap             # yf = _heap (first allocation after boot)
  lw   t2, 0(t1)
  bne  t2, t1, _fail         # mem[yf] = yf : the self-link
  la   t3, yroot
  lw   t4, 0(t3)
  ori  t5, t1, 1
  bne  t4, t5, _fail         # mem[yroot] = elink(yf)
  li   gp, 2
yagain:
  li   t6, 7
  beq  s0, t6, ydone
  la   t0, yroot
  jr   t0                    # recurse: re-enter through the memoized root
ydone:
  # spine balance: after 7 entries / 7 tors the sentinel is the top
  li   gp, 3
  fn.tor  a4
  li   t0, 0x5E17BA5E
  bne  a4, t0, _fail
  # memoization: 6 re-walks allocated NOTHING (hp still _heap+8)
  li   gp, 4
  .word 0x000077db           # fn.databox a5, zero : a5 = hp
  la   t2, _heap
  addi t2, t2, 8
  bne  a5, t2, _fail

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
