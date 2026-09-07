# combi_mutual.S - rv64 mechanism test: two cells feeding each other.
#
# The hot loop of a compiled program is rarely one combinator repeating: it is
# two or three that alternate, each dispatch consuming entries the other just
# pushed, so every root update lands in a copy the other cell wrote moments
# before.  This is the hs_braun shape, and the reason it is worth its own test
# is that the write path never drains -- there is no host instruction between
# any two dispatches to let it.
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

    # ---- check 1: the two cells alternate all the way down --------------
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k1
    fn_link n1                      # the bottom
    fn_link ca
    fn_link cb
    fn_link ca
    fn_link cb                      # top
    j    ca                         # ca pops cb and enters it, and so on
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 5                  # ca cb ca cb, then the one that took n1
    bne  a4, t1, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the same alternation under an arity-3 dispatch --------
    # cb2 pops three and enters the head, which is ca2; ca2 selects and
    # enters the box.  The inner dispatch's root is in the outer's copy.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k2
    fn_link n3
    fn_link n1                      # what ca2 will select
    fn_link ca2
    j    cb2
    .balign 4
cb2:
    fn_combi_t2 3, 0,1,2,0,0,0      # head = ca2, pushes n1 then n3
    .balign 4
ca2:
    fn_combi_t0 2, 0,0,0,0,0,0      # consumes BOTH pushes and selects n1;
                                    # leaving one behind would put a box where
                                    # the continuation belongs, and two boxes
                                    # hand themselves to each other forever
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 2
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

    .balign 4
ca: fn_combi_t0 1, 0,0,0,0,0,0
    .balign 4
cb: fn_combi_t0 1, 0,0,0,0,0,0

    .section .data
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
    .balign 8
n3: fn_box
    .word 0x33
    fn_box_body
