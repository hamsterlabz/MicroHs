# combi_chain.S - rv64 mechanism test: a long unbroken run of dispatches.
#
# combi_b2b proves four in a row.  This is the same shape held for 25, with a
# spine deep enough that the run is never doing anything but allocate, update,
# pop and jump.  A defect that needs a few reductions to show -- an allocation
# that drifts, a write that has not landed by the time the next jump reads it
# -- has room to show here and not there.
#
# exit status: 0 = PASS, otherwise the number of the check that failed.

    .equ NLINK, 24                  # dispatches through the shared cell, plus
                                    # the one that starts the run

    .section .text
    .globl main
main:
    la   t0, fn_heapend
    ld   t0, 0(t0)
    sd   t0, fn_gclimit, t1
    la   t0, _heap
    fn_csrw 0x7c0, t0

    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_csrr s6, 0x7c0               # hp before the run

    fn_link k1
    fn_link n1                      # the bottom of the chain
    li   s3, NLINK
    la   s7, cc
.Lchainfill:
    FN_PUSH s7, zero                # source 0: no root to memoize, so the run
    addi s3, s3, -1                 # is pure dispatch traffic
    bnez s3, .Lchainfill

    j    cc
    .balign 4
cc: fn_combi_t0 1, 0,0,0,0,0,0      # pop one, enter it: the next cc, or n1

k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    li   t1, NLINK+1
    add  t1, t1, s5
    bne  a4, t1, _fail              # 25 dispatches, no more and no fewer
    FN_DEPTH a4
    bne  a4, s4, _fail

    # every dispatch allocates its reduct, so hp must have advanced by one
    # cell per dispatch -- a select's reduct is a single transfer cell
    li   gp, 2
    fn_csrr a4, 0x7c0
    li   t1, (NLINK+1)*FN_CELL_ELINK
    add  t1, t1, s6
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
n1: fn_box
    .word 0x11
    fn_box_body
