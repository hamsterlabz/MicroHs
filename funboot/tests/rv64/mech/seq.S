# seq.S - rv64 mechanism test: fn_seq, the arity gate.
#
# fn_seq is what stands in front of every two-argument primitive blob.  With
# two or more entries the blob has what it needs and seq falls through.  With
# exactly one, the primitive is under-applied against a value that has not
# been reduced yet, so seq forces that one entry and resumes at the same
# fall-through once it comes back.  With none, there is nothing to gate and
# the machine is in normal form.
#
# Depth here is measured from the FRAME, not from the bottom of the spine --
# a forcer runs its callee in a frame of its own so the callee cannot see or
# pop the caller's entries.  The checks set the frame explicitly, which is
# the only way to present seq with a depth of exactly one.
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

    # ---- check 1: two or more entries -> fall through, spine untouched --
    li   gp, 1
    FN_DEPTH s4
    fn_link n1
    fn_link n2
    fn_seq
    FN_DEPTH a4
    addi t1, s4, 2
    bne  a4, t1, _fail
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail

    # ---- check 2: exactly one entry -> force it, resume at the same place
    li   gp, 2
    fn_csrr s5, 0x7c2               # save the frame
    la   t0, fn_rsp
    lw   t1, 0(t0)
    fn_csrw 0x7c2, t1               # frame := rsp, so depth is now 0
    fn_link n1
    fn_seq                          # depth 1: forces n1 and comes back here
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    fn_csrw 0x7c2, s5               # restore the frame
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 3: the forced entry may be a cell, not just a box --------
    li   gp, 3
    fn_csrr s5, 0x7c2
    la   t0, fn_rsp
    lw   t1, 0(t0)
    fn_csrw 0x7c2, t1
    fn_link t3val
    fn_seq
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_csrw 0x7c2, s5
    FN_DEPTH a4
    bne  a4, s4, _fail
    j    t3done
    .balign 4
t3val:                              # entered with seq's resume on top
    fn_link n2
    fn_enter
t3done:

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
    .balign 8
n2: fn_box
    .word 0x22
    fn_box_body
