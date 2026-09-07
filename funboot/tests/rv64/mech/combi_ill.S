# combi_ill.S - rv64 mechanism test: an under-applied combinator does not reduce.
#
# On the xfun machine a combi whose arity exceeds the spine depth raises
# IllegalInsn -- the ID-stage fun_ill check -- and the rvfun version of this
# test reads mcause and mepc out of a trap handler.  There is no fun decoder
# here to trap: a combinator is a jump to a routine, and the routine's first
# job is to ask whether the arguments are there.  Too few means the head
# cannot be reduced, which is normal form, and normal form is a real state of
# the machine -- the same answer the runtime gives when the spine runs dry.
#
# So the property is the same one the trap was protecting: an under-applied
# combinator consumes nothing, allocates nothing, and does not dispatch.  It
# is checked by pointing fn_nfa at this test rather than at the epilogue,
# which is how a program installs its own normal-form handler.
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

    la   t0, fn_nfa
    ld   s3, 0(t0)                  # the epilogue, to put back afterwards
    la   t1, nf
    sd   t1, 0(t0)

    # ---- check 1: arity 2 against a depth of 1 --------------------------
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_csrr s6, 0x7c0
    fn_csrr s7, 0x7c2               # save the frame
    la   t0, fn_rsp
    lw   t1, 0(t0)
    fn_csrw 0x7c2, t1               # frame := rsp, so depth is 0
    li   s2, 1
    fn_link n1                      # depth 1
    fn_combi_t1 2, 0,1,0,0,0,0      # needs 2
    j    _fail                      # must not fall through

    # ---- check 2: arity 1 against a depth of 0 --------------------------
c2:
    li   gp, 2
    li   s2, 2
    fn_combi_t0 1, 0,0,0,0,0,0      # needs 1, has none
    j    _fail

nf:                                 # normal form: the combinator refused
    li   t0, 1
    beq  s2, t0, .Lnf1
    li   t0, 2
    beq  s2, t0, .Lnf2
    j    _fail
.Lnf1:
    FN_DEPTH a4                     # nothing was consumed
    li   t1, 1
    bne  a4, t1, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    bne  a4, s5, _fail              # nothing was counted
    fn_csrr a4, 0x7c0
    bne  a4, s6, _fail              # nothing was allocated
    fn_pop a0                       # clear the one entry, then go on
    j    c2
.Lnf2:
    FN_DEPTH a4
    bnez a4, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    bne  a4, s5, _fail
    fn_csrr a4, 0x7c0
    bne  a4, s6, _fail

    # ---- check 3: with the arguments there, the same word reduces -------
    li   gp, 3
    fn_csrw 0x7c2, s7               # put the frame back
    la   t0, fn_nfa
    sd   s3, 0(t0)                  # and the epilogue
    fn_link k3
    fn_link n1
    j    c3
    .balign 4
c3:
    fn_combi_t0 1, 0,0,0,0,0,0
k3:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # now it did dispatch, exactly once
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
