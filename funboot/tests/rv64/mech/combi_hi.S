# combi_hi.S - rv64 mechanism test: arity beyond the used leaves.
#
# Arity and selectors are independent: the arity says how many entries the
# dispatch consumes, the selectors say which of them the reduct refers to.  A
# combinator may therefore pop more than it uses, and the surplus entries are
# DISCARDED -- no update, no reference kept.  That is the shape the minimal
# tests miss and the one the compiled programs are full of.
#
# The recipe for this pattern (type 2) pushes two entries and enters a third:
# slot 0 ends on top, so the head is wv(s0) and it is entered with wv(s1) on
# top and wv(s2) beneath.
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

    # ---- check 1: head and argument order ------------------------------
    li   gp, 1
    FN_DEPTH s4
    fn_link k1
    fn_link n3                      # wv(2)
    fn_link n2                      # wv(1)
    fn_link hd                      # wv(0) -- the head
    j    c1
    .balign 4
c1: fn_combi_t2 3, 0,1,2,0,0,0
    .balign 4
hd:                                 # entered with n2 on top, then n3
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    fn_link n1
    fn_enter
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: an arity past the selectors discards the surplus ------
    # Arity 4 with the same three selectors: the fourth entry is consumed
    # and dropped.  If it were left on the spine the depth would be wrong;
    # if it were used the head would see the wrong argument.
    li   gp, 2
    fn_link k2
    fn_link nx                      # wv(3) -- surplus, must be discarded
    fn_link n3
    fn_link n2
    fn_link hd2
    j    c2
    .balign 4
c2: fn_combi_t2 4, 0,1,2,0,0,0
    .balign 4
hd2:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    FN_DEPTH a4
    addi t1, s4, 1                  # only k2 left: the surplus is gone
    bne  a4, t1, _fail
    fn_link n1
    fn_enter
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 3: a selector may reach past the first argument ----------
    li   gp, 3
    fn_link k3
    fn_link n3                      # wv(2)
    fn_link n2                      # wv(1)
    fn_link hd3                     # wv(0)
    j    c3
    .balign 4
c3: fn_combi_t2 3, 0,2,1,0,0,0      # swap which argument comes first
    .balign 4
hd3:
    fn_tor a0
    li   t0, 0x33                   # now wv(2) is on top
    bne  a0, t0, _fail
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    fn_link n1
    fn_enter
k3:
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
    .balign 8
nx: fn_box
    .word 0x7777
    fn_box_body
