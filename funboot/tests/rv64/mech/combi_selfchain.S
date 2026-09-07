# combi_selfchain.S - rv64 mechanism test: one cell dispatching repeatedly.
#
# The same combinator cell reduces several times in a row, control returning
# to it because the argument it selects is itself.  Each pass memoizes a
# different root while the previous pass's copy is still the most recently
# written thing in the heap.  In hs_braun this shape is where a walk of a
# just-written copy cell returned the stale word; here it is where the fence.i
# after one cell write has to cover the jump that immediately follows.
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

    # ---- check 1: three passes through one cell, then the answer --------
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k1
    fn_link n1                      # the bottom of the chain
r1: fn_link sc                      # each of these is a real redex root
r2: fn_link sc
r3: fn_link sc
    j    sc
    .balign 4
sc: fn_combi_t0 1, 0,0,0,0,0,0      # pop one, enter it: sc again, then n1
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 4                  # three self-dispatches and the last one
    bne  a4, t1, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the roots the run touched are spent --------------------
    # Each root was memoized to its reduct, and for a select that reduct is
    # the combinator itself -- so walking r3 transfers straight into a single
    # dispatch instead of re-running what the cell held before.  It needs an
    # argument, exactly as the original redex had one.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k2
    fn_link n1
    j    r3
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # one dispatch: the transfer, then sc

    li   gp, 3
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k3
    fn_link n1
    j    r2                         # a different root of the same run
k3:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail
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
