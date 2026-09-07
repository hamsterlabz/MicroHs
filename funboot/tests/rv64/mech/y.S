# y.S - rv64 mechanism test: fn_y, tying the knot.
#
# fn_y builds the cyclic reference a fixpoint needs: two cells at hp, the
# first naming itself and the second transferring to the function on top.
# The redex root is memoized to the knot, the top entry is replaced by it,
# and the function is entered -- so the function receives, as its argument,
# a reference that reduces back to the function's own result.  That is the
# whole of Y with no special case anywhere else in the machine.
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

    # ---- check 1: y enters the function with a knot in its hand ---------
    # f ignores its argument and yields a box, so the fixpoint terminates
    # and the answer must reach the continuation.
    li   gp, 1
    FN_DEPTH s4
    fn_link k1                      # the continuation
    fn_link f1                      # the function
    fn_y                            # enters f1, knot on top
    j    _fail
    .balign 4
f1:
    fn_pop a0                       # the knot: a real reference, not zero
    beqz a0, _fail
    fn_link n1
    fn_enter                        # hand n1 to k1
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the knot is on the heap, and it is two cells ----------
    li   gp, 2
    fn_csrr s5, 0x7c0               # hp before
    fn_link k2
    fn_link f2
    fn_y
    j    _fail
    .balign 4
f2:
    fn_pop s6                       # the knot address
    bltu s6, s5, _fail              # allocated at or after the old hp
    fn_csrr a4, 0x7c0
    bgeu s6, a4, _fail              # and below the new hp
    fn_link n2
    fn_enter
k2:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail

    # ---- check 3: entering the knot reaches the function again ----------
    # The knot transfers to the function, so a walk of it is another call:
    # this is what makes a recursive definition recur.
    li   gp, 3
    li   s7, 0                      # count the entries to f3
    fn_link k3
    fn_link f3
    fn_y
    j    _fail
    .balign 4
f3:
    addi s7, s7, 1
    fn_pop s6                       # the knot: from fn_y, then from the walk
    li   t0, 2
    bge  s7, t0, .Lstop             # second time round: stop recursing
    fn_go s6                        # walk the knot: it pushes itself and
                                    # transfers to f3, which is the recursion
.Lstop:
    fn_link n3
    fn_enter
k3:
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    li   t0, 2
    bne  s7, t0, _fail              # f3 really was entered twice

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
n3: fn_box
    .word 0x33
    fn_box_body
