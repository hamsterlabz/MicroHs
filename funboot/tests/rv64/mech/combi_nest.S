# combi_nest.S - rv64 mechanism test: a dispatch consuming the previous one's
# fresh copy cells.
#
# The outer dispatch pushes entries whose SOURCES are the copy cells it has
# just written, and enters a head that is itself a combinator.  With no host
# instruction in between, the inner dispatch consumes those entries and
# Turner-updates its root -- which is a cell inside the outer's copy, written
# moments earlier.  That is the Braun.size shape, and the one place where a
# write still in flight would be read back stale.
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

    # ---- check 1: the nest runs and the answer is the selected argument -
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k1
    fn_link n3                      # wv(2)
    fn_link n2                      # wv(1)
    fn_link inner                   # wv(0): the head is another dispatch
    j    outer
    .balign 4
outer:
    fn_combi_t2 3, 0,1,2,0,0,0      # pushes n2 and n3 with copy-cell sources
    .balign 4
inner:
    fn_combi_t0 2, 0,0,0,0,0,0      # consumes both; its root is in that copy
k1:
    fn_tor a0
    li   t0, 0x22                   # inner selected wv(0), which is n2
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 2
    bne  a4, t1, _fail              # two dispatches, back to back
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the same nest on top of a deep spine ------------------
    # The inner dispatch reads its arguments through the window, so depth
    # must not change what it sees.
    li   gp, 2
    li   s3, 12
    la   s6, n1
.Lpad:
    FN_PUSH s6, zero
    addi s3, s3, -1
    bnez s3, .Lpad
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k2
    fn_link n3
    fn_link n2
    fn_link inner
    j    outer2
    .balign 4
outer2:
    fn_combi_t2 3, 0,1,2,0,0,0
k2:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 2
    bne  a4, t1, _fail
    li   s3, 12
.Lunpad:
    fn_pop a0
    addi s3, s3, -1
    bnez s3, .Lunpad
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
