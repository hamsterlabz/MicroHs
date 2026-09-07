# combi_share.S - rv64 mechanism test: the Turner update makes a redex spent.
#
# A dispatch overwrites its redex root with a transfer to the reduct it just
# built.  Any later walk of that root must therefore reach the reduct: it must
# not dispatch again, and it must not allocate again.  A stale read here
# re-reduces a spent redex -- extra allocation, extra update, a heap pointer
# that diverges from the model -- which is the Knuthbendix stale-root failure
# and, on the RTL, the h-cache write-to-fetch-read hazard.
#
# On this target the update writes instructions over the head of the cell, so
# "visible to the next walk" means the fence.i did its job.
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

    # ---- check 1: the first walk reduces --------------------------------
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_csrr s6, 0x7c0               # hp before
    fn_link k1
rr:
    fn_link n1
    j    cw
    .balign 4
cw:
    fn_combi_t0 1, 0,0,0,0,0,0
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # exactly one dispatch
    fn_csrr s7, 0x7c0
    bgeu s6, s7, _fail              # and it allocated

    # ---- check 2: the second walk neither dispatches nor allocates ------
    li   gp, 2
    fn_link k2
    j    rr
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # still just the one dispatch
    fn_csrr a4, 0x7c0
    bne  a4, s7, _fail              # and hp has not moved

    # ---- check 3: and again, many times ---------------------------------
    li   gp, 3
    li   s3, 8
.Lagain:
    fn_link k3
    j    rr
k3:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    addi s3, s3, -1
    bnez s3, .Lagain
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail
    fn_csrr a4, 0x7c0
    bne  a4, s7, _fail
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
n1: fn_box
    .word 0x11
    fn_box_body
