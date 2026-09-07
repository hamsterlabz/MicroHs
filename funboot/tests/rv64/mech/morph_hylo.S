# morph_hylo.S - rv64 mechanism test: fn_hylo.
#
#   hylo F A C s  ->  A (F (hylo F A C) (C s))
#
# The refold: it builds with the coalgebra and consumes with the algebra
# without ever materializing the structure between them.  Arity 4, and two
# things set it apart from the other three schemes:
#
#   * the algebra is entered DIRECTLY -- there is no out node, because there
#     is nothing to memoize a root to;
#   * there is NO root update.  The seed cell is left exactly as it was.
#     hylo consumes its seed rather than replacing it, so a walk of that cell
#     later must still find the original seed, not a reduct.  Check 3 is that
#     cell.
#
#   rc  = [link C][link A][link F][elink p]
#   ca  = [link s][elink C]
#   inr = [link ca][link rc][elink F]
#   push (inr, 0) and enter A
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

    # ---- check 1: the algebra is entered directly, with inr on top ------
    li   gp, 1
    FN_DEPTH s4
    li   s6, 0                      # times the coalgebra ran
    li   s7, 0                      # times the functor ran
    fn_link kdone
scell:
    fn_link snode                   # s
    fn_link coalg                   # C
    fn_link algb                    # A
    fn_link fnb                     # F  (top)
    fn_hylo
    j    _fail

    .balign 4
algb:                               # A: entered directly, inr on top
    FN_DEPTH a4
    addi t1, s4, 2                  # kdone underneath, inr on top
    bne  a4, t1, _fail
    li   t0, 0                      # nothing has run yet: F and C are both
    bne  s7, t0, _fail              # inside the node A was handed
    bne  s6, t0, _fail
    fn_force                        # drive it
    fn_tor a0
    li   t0, 0x0417                 # 0x0416 + 1: the seed went through C
    bne  a0, t0, _fail
    li   t0, 1
    bne  s7, t0, _fail
    bne  s6, t0, _fail
    fn_link n1
    fn_enter

    .balign 4
fnb:                                # F: top = rc, then ca
    addi s7, s7, 1
    fn_pop s3                       # the recursive hylo F A C
    beqz s3, _fail
    fn_force                        # ca is lazy: force it now
    fn_tor a0
    fn_databox a1, a0
    fn_go a1                        # hand it on

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
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the seed cell was NOT memoized ------------------------
    # Every other scheme overwrites its root, so a second walk reaches the
    # reduct and no dispatch happens.  hylo must leave the cell alone: the
    # walk has to run the whole redex again, which the counter shows.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    li   s6, 0
    li   s7, 0
    fn_link kdone2
    j    scell
kdone2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # exactly one more dispatch: no memo
    li   t0, 1
    bne  s7, t0, _fail              # and the whole redex ran again
    bne  s6, t0, _fail
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
    .word 0x0416
    fn_box_body
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
