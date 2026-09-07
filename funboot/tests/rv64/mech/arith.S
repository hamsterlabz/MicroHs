# arith.S - rv64 mechanism test: the primitive cycle.
#
# Every arithmetic primitive a compiled program contains is this blob:
#
#     fn_tor a0 / fn_tor a1 / <op> / fn_databox a0,a0 / fn_update a0 / fn_go a0
#
# so the spine it is entered on reads, from the top down: the two operands
# (already boxes, because the caller forced them), the redex root, and the
# continuation.  It unboxes both, computes at 32-bit width, boxes the result,
# memoizes the root to that box so the work is never repeated, and enters the
# box -- which hands itself to the continuation.  Nothing in the blob knows
# who called it.
#
# The width matters: the ops are the w-forms, so the result is whatever 32-bit
# arithmetic gives, sign-extended.  Check 4 is that boundary.
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

    # ---- check 1: add, and the answer reaches the continuation ----------
    li   gp, 1
    FN_DEPTH s4
    fn_link k1                      # continuation
r1:
    fn_link r1                      # the redex root, carried as a value
    fn_link n2                      # -> a1
    fn_link n1                      # -> a0  (top)
    fn_elink _prim_add
k1:
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the root was memoized to the result box ---------------
    # Re-walking the root must deliver the SAME answer without computing it
    # again -- that is the whole point of the update in the blob.
    li   gp, 2
    fn_link k2
    j    r1
k2:
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail

    # ---- check 3: sub and mul, same shape -------------------------------
    li   gp, 3
    fn_link k3
r3:
    fn_link r3
    fn_link n1                      # -> a1 = 0x11
    fn_link n2                      # -> a0 = 0x22
    fn_elink _prim_sub              # a0 - a1
k3:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    fn_link k3m
r3m:
    fn_link r3m
    fn_link n2
    fn_link n1
    fn_elink _prim_mul
k3m:
    fn_tor a0
    li   t0, 0x242                  # 0x11 * 0x22
    bne  a0, t0, _fail

    # ---- check 4: the operations are 32-bit, and the result sign-extends
    li   gp, 4
    fn_link k4
r4:
    fn_link r4
    fn_link nbig                    # -> a1 = 0x40000000
    fn_link nbig                    # -> a0 = 0x40000000
    fn_elink _prim_add              # 0x80000000 as a 32-bit sum
k4:
    fn_tor a0
    li   t0, 0xffffffff80000000     # which is negative, sign-extended
    bne  a0, t0, _fail
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
    .balign 8
n2: fn_box
    .word 0x22
    fn_box_body
    .balign 8
nbig: fn_box
    .word 0x40000000
    fn_box_body
