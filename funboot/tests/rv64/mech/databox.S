# databox.S - rv64 mechanism test: fn_databox, the allocator every blob uses.
#
# fn_databox rd, rs1 writes a box holding rs1 at hp, leaves the box address in
# rd and advances hp by one box.  It is how a primitive returns a value and
# the only way a blob asks for raw heap, so the size it advances by and the
# payload it stores are load-bearing for every arithmetic result in a program.
#
# The rvfun version asserts the addresses themselves (the first allocation
# lands exactly at _heap, the second eight bytes on).  Those numbers are that
# machine's: a cell there is four bytes and a box is two of them.  What holds
# on both machines, and what these checks state, is the relation -- successive
# boxes are one box apart, distinct, and each reads back what was put in it.
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

    # ---- check 1: the box lands at hp and hp advances by one box --------
    li   gp, 1
    FN_DEPTH s4
    fn_csrr s5, 0x7c0               # hp before
    li   a0, 0x11
    fn_databox a1, a0
    bne  a1, s5, _fail              # the box is AT the old hp
    fn_csrr a4, 0x7c0
    addi t1, s5, FN_CELL_BOX
    bne  a4, t1, _fail              # hp advanced by exactly one box

    # ---- check 2: the payload reads back ---------------------------------
    li   gp, 2
    fn_link k2
    fn_go a1
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail

    # ---- check 3: successive boxes are distinct and one box apart -------
    li   gp, 3
    li   a0, 0x21
    fn_databox s5, a0
    li   a0, 0x22
    fn_databox s6, a0
    li   a0, 0x23
    fn_databox s7, a0
    addi t1, s5, FN_CELL_BOX
    bne  s6, t1, _fail
    addi t1, s6, FN_CELL_BOX
    bne  s7, t1, _fail

    # ---- check 4: each keeps its own payload ----------------------------
    li   gp, 4
    fn_link k4a
    fn_go s5
k4a:
    fn_tor a0
    li   t0, 0x21
    bne  a0, t0, _fail
    fn_link k4b
    fn_go s6
k4b:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_link k4c
    fn_go s7
k4c:
    fn_tor a0
    li   t0, 0x23
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 5: a negative payload survives ---------------------------
    li   gp, 5
    li   a0, -3
    fn_databox a1, a0
    fn_link k5
    fn_go a1
k5:
    fn_tor a0
    li   t0, -3
    bne  a0, t0, _fail

_pass:
    li   a0, 0
    li   a7, 93
    ecall
_fail:
    mv   a0, gp
    li   a7, 93
    ecall
