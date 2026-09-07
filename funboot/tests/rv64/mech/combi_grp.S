# combi_grp.S - rv64 mechanism test: body groups and a duplicated selector.
#
# Most combinators do more than rearrange the spine: their reduct contains
# sub-applications -- body groups -- built as their own nodes in the copy and
# handed to the head unevaluated.  And a selector may name the same argument
# more than once, which is how the compiler expresses sharing: one cell, two
# references, and whoever forces it first pays for it.
#
# The recipe for type 3 writes four cells -- a group [link b2][elink b1] and,
# after it, the node that pushes that group and transfers to b0 -- so the head
# receives exactly one argument, and that argument is the application of the
# second selected value to the third.
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

    # ---- check 1: the head is handed an unevaluated group ---------------
    li   gp, 1
    FN_DEPTH s4
    li   s6, 0                      # times the group's function ran
    fn_link k1
    fn_link n2                      # wv(2): the group's argument
    fn_link g                       # wv(1): the group's function
    fn_link hd                      # wv(0): the head
    j    c1
    .balign 4
c1: fn_combi_t3 3, 0,1,2,0,0,0
    .balign 4
hd:                                 # entered with the group node on top
    FN_DEPTH a4
    addi t1, s4, 2                  # k1 underneath, the group on top
    bne  a4, t1, _fail
    li   t0, 0
    bne  s6, t0, _fail              # the group has NOT been run: it is a node
    fn_force
    fn_tor a0
    li   t0, 0x23                   # 0x22 + 1, so the group really was g n2
    bne  a0, t0, _fail
    li   t0, 1
    bne  s6, t0, _fail
    fn_link n1
    fn_enter
    .balign 4
g:                                  # the group's function, entered with n2
    addi s6, s6, 1
    fn_tor a0
    addi a0, a0, 1
    fn_databox a1, a0
    fn_go a1
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: one argument named twice is pushed twice --------------
    # Both slots select wv(1), so the head receives the same cell in both
    # positions -- one value, two references.
    li   gp, 2
    fn_link k2
    fn_link n3                      # wv(2), deliberately not selected
    fn_link n2                      # wv(1), selected twice
    fn_link hd2                     # wv(0)
    j    c2
    .balign 4
c2: fn_combi_t2 3, 0,1,1,0,0,0
    .balign 4
hd2:
    FN_WV s3, 0
    FN_WV a4, 1
    bne  s3, a4, _fail              # the same cell in both positions
    la   t1, n2
    bne  s3, t1, _fail              # and it is the one that was selected
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail              # forcing it twice gives the same answer
    fn_link n1
    fn_enter
k2:
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
    .word 0x33
    fn_box_body
