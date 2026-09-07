# box.S - rv64 mechanism test: the box cell and the WHNF hand-off.
#
# A box is four words: a jump over the payload, the payload itself, and the
# two-instruction body.  The payload keeps the slot at cell+4 -- that is the
# whole reason fn_box is split from fn_box_body, since a macro expansion
# cannot promise where its own words land -- so fn_tor is a load at a fixed
# offset rather than a walk.
#
# Entering a box IS the answer arriving: the body pops the continuation,
# pushes the box with that entry's source, and enters the continuation.  A
# reduction that has produced a value therefore just enters the box; it needs
# to know nothing about who is waiting.
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

    # ---- check 1: entering a box hands it to the continuation -----------
    li   gp, 1
    FN_DEPTH s4
    fn_link k1
    fn_link n1
    fn_enter
    j    _fail
k1:
    FN_DEPTH a4
    addi t1, s4, 1                  # the box replaced the continuation
    bne  a4, t1, _fail
    FN_WV a4, 0
    la   t1, n1
    bne  a4, t1, _fail              # and the entry IS the box
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail

    # ---- check 2: the hand-off keeps the continuation entry's source ----
    li   gp, 2
k2src:
    fn_link k2                      # source of the continuation entry = k2src
    fn_link n2
    fn_enter
    j    _fail
k2:
    FN_WS a4, 0
    la   t1, k2src
    bne  a4, t1, _fail
    fn_pop a0

    # ---- check 3: a box in the image and one built at run time agree ----
    li   gp, 3
    li   a0, 0x44
    fn_databox a1, a0               # allocate one
    fn_link k3
    fn_go a1                        # enter it exactly as check 1 entered n1
k3:
    fn_tor a0
    li   t0, 0x44
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
