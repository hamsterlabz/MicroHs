# force.S - rv64 mechanism test: fn_force.
#
# fn_force pops the top entry (a, src), pushes the point just past the macro
# as the resume -- keeping the popped entry's SOURCE -- and enters a.  It is
# how a strict position asks for WHNF without a frame: the value is entered,
# and whatever it reduces to arrives back at the resume with itself on top.
#
# Keeping the source is not decoration: the resume entry is what a Turner
# update overwrites if the forced value turns out to be a redex, so it has to
# name the cell the value came from, not the force site.
#
# An empty spine has nothing to force and is normal form, which ends the
# program; that path is left to the suite's programs.
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

    # ---- check 1: forcing a box comes back with the box on top ----------
    li   gp, 1
    FN_DEPTH s4
    fn_link n1
    fn_force
    fn_tor a0                       # the box delivered itself to the resume
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the resume keeps the forced entry's source ------------
    li   gp, 2
l2:
    fn_link n2                      # source of this entry = l2
    fn_force
    FN_WS a4, 0                     # what the box handed back carries it on
    la   t1, l2
    bne  a4, t1, _fail
    fn_pop a0

    # ---- check 3: forcing a code cell enters it -------------------------
    # The value need not be a box; force enters whatever it is, and a cell
    # that ends in a box hand-off returns the same way.
    li   gp, 3
    fn_link t3val
    fn_force
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail
    j    t3done
    .balign 4
t3val:                              # entered with the resume on top
    fn_link n2
    fn_enter                        # hand n2 to the resume
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
