# tor.S - rv64 mechanism test: fn_tor and fn_pop.
#
# fn_tor rd reads the payload of the box on top of the spine into rd and pops.
# A box keeps its payload in the word at cell+4 -- that slot is why fn_box is
# split into a jump over the payload and a body after it -- so tor is a load
# at a fixed offset from the entry's value, not a walk.
# fn_pop rd takes the RAW top instead: the reference itself, unread.
#
# Both write their destination LAST, so the destination may be a register the
# macro also uses to address the spine; the checks below use a0 for exactly
# that reason.
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

    # ---- check 1: tor reads the payload and pops ------------------------
    li   gp, 1
    FN_DEPTH s4
    fn_link n1
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: pop takes the reference, not the payload --------------
    li   gp, 2
    fn_link n2
    fn_pop a0
    la   t0, n2
    bne  a0, t0, _fail

    # ---- check 3: a negative payload comes back sign-extended -----------
    # The payload is a 32-bit word and tor loads it with lw, so a graph value
    # that is negative as an int must compare equal to the sign-extended
    # constant -- the width the arithmetic blobs work at.
    li   gp, 3
    fn_link n3
    fn_tor a0
    li   t0, -2
    bne  a0, t0, _fail

    # ---- check 4: tor over several boxes, LIFO --------------------------
    li   gp, 4
    fn_link n1
    fn_link n2
    fn_link n3
    fn_tor a0
    li   t0, -2
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x11
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
n3: fn_box
    .word -2
    fn_box_body
