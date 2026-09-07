# morph_cata.S - rv64 mechanism test: fn_cata.
#
#   cata F A x  ->  A (F (cata F A) x)
#
# entered with the spine top holding F, then A, then (x, xsrc).  The reduct is
# three nodes, and the middle one carries a transfer back to the cata cell --
# that back-reference is the whole mechanism, since it is what makes the next
# layer of the structure unfold the same way:
#
#   rc  = [link A][link F][elink p]
#   inr = [link x][link rc][elink F]
#   out = [link inr][elink A]
#
# then the root is memoized to out and out is entered, so A runs with inr on
# top of the spine.
#
# The rvfun version reads the reduct back word by word at _heap+0,4,8,...  A
# cell is not a word here, so what these checks state instead is what those
# words were there to guarantee: that A is entered, that what it receives
# really is F applied to the recursive reference and the seed, and that the
# root now transfers to the reduct.
#
# exit status: 0 = PASS, otherwise the number of the check that failed.

    .section .text
    .globl main
main:
    la   t0, fn_heapend
    ld   t0, 0(t0)
    sd   t0, fn_gclimit, t1
    la   t0, _heap
    fn_csrw 0x7c0, t0

    # ---- check 1: the algebra is entered, with the reduct on top --------
    li   gp, 1
    FN_DEPTH s4
    li   s6, 0                      # times the functor ran
    li   s7, 0                      # times the algebra ran
    fn_link kdone                   # where the answer goes
xcell:
    fn_link xnode                   # x, and this cell is the redex root
    fn_link algb                    # A
    fn_link fnb                     # F  (top)
p:
    fn_cata
    j    _fail                      # the dispatch does not fall through

    .balign 4
algb:                               # A, entered with (inr) on top
    addi s7, s7, 1
    FN_DEPTH a4
    addi t1, s4, 2                  # kdone underneath, inr on top
    bne  a4, t1, _fail
    # Force what A was handed.  It is the F-application, so running it must
    # enter F -- with the recursive reference and the seed as its arguments.
    fn_force
    fn_tor a0
    li   t0, 0x00CA7A00             # the seed came through F
    bne  a0, t0, _fail
    li   t0, 1
    bne  s6, t0, _fail              # and F ran exactly once
    fn_link n1
    fn_enter                        # hand a value to kdone

    .balign 4
fnb:                                # F, entered with (rec, x) on the spine
    addi s6, s6, 1
    fn_pop s3                       # the recursive reference: cata F A
    beqz s3, _fail
    fn_tor a0                       # the seed's payload
    li   t0, 0x00CA7A00
    bne  a0, t0, _fail
    # hand the seed straight back, so the algebra sees it
    fn_link xnode
    fn_enter

kdone:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    li   t0, 1
    bne  s7, t0, _fail              # the algebra ran exactly once
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the redex root was memoized to the reduct -------------
    # Walking xcell again must reach the reduct that was built, and so run
    # the algebra a second time without dispatching cata again.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    li   s6, 0                      # the functor runs once per walk, not once
    fn_link kdone2
    j    xcell
kdone2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    bne  a4, s5, _fail              # no second cata dispatch: the root is spent
    li   t0, 2
    bne  s7, t0, _fail              # but the algebra did run again

    # ---- check 3: a dispatch counts as one reduction --------------------
    li   gp, 3
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link kdone3
x3:
    fn_link xnode
    fn_link algb3
    fn_link fnb3
    fn_cata
    j    _fail
    .balign 4
algb3:                              # discards the node it was handed, so the
    fn_pop a0                       # functor never runs
    fn_link n1
    fn_enter
    .balign 4
fnb3:
    j    _fail                      # not reached: the algebra discards it
kdone3:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail

_pass:
    li   a0, 0
    li   a7, 93
    ecall
_fail:
    mv   a0, gp
    li   a7, 93
    ecall

    .section .data
    .balign 8
xnode: fn_box
    .word 0x00CA7A00
    fn_box_body
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
