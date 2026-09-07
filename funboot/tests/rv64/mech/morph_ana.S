# morph_ana.S - rv64 mechanism test: fn_ana.
#
#   ana F C s  ->  F (ana F C) (C s)
#
# entered with the spine top holding F, then C, then (s, ssrc).  Where cata
# consumes a structure, ana builds one, so the reduct hands the functor an
# UNEVALUATED coalgebra application rather than a value -- that is what makes
# the unfold lazy, and it is why ca is its own node:
#
#   rc  = [link C][link F][elink p]
#   ca  = [link s][elink C]
#   inr = [link ca][link rc][elink F]
#
# the root is memoized to inr and inr is entered, so F runs with rc on top and
# ca beneath it.
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

    # ---- check 1: F is entered with the recursion and the coalgebra -----
    li   gp, 1
    FN_DEPTH s4
    li   s6, 0                      # times the coalgebra ran
    li   s7, 0                      # times the functor ran
    fn_link kdone
scell:
    fn_link snode                   # s, and this cell is the redex root
    fn_link coalg                   # C
    fn_link fnb                     # F  (top)
    fn_ana
    j    _fail

    .balign 4
fnb:                                # F: top = rc, then ca
    addi s7, s7, 1
    FN_DEPTH a4
    addi t1, s4, 3                  # kdone, ca, rc
    bne  a4, t1, _fail
    fn_pop s3                       # the recursive ana F C
    beqz s3, _fail
    li   t0, 0
    bne  s6, t0, _fail              # ca has NOT been run yet: it is lazy
    fn_force                        # now force it
    fn_tor a0
    li   t0, 0x0A11                 # 0x0A10 + 1, so C really ran on s
    bne  a0, t0, _fail
    li   t0, 1
    bne  s6, t0, _fail
    fn_link n1
    fn_enter

    .balign 4
coalg:                              # C: entered with s on top
    addi s6, s6, 1
    fn_tor a0
    addi a0, a0, 1
    fn_databox a1, a0
    fn_go a1

kdone:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    li   t0, 1
    bne  s7, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the seed cell was memoized to the reduct --------------
    # Walking scell again must reach the reduct that was built rather than
    # dispatching ana a second time.  F runs again on the way, so the
    # laziness counter is reset first -- ca is a node, not a value, and
    # nothing memoized it, so the coalgebra genuinely runs once per walk.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    li   s6, 0
    fn_link kdone2
    j    scell
kdone2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    bne  a4, s5, _fail              # no second dispatch: the root is spent
    li   t0, 2
    bne  s7, t0, _fail              # but the functor did run again
    FN_DEPTH a4
    bne  a4, s4, _fail

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
snode: fn_box
    .word 0x0A10
    fn_box_body
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
