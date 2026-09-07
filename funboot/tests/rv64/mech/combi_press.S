# combi_press.S - rv64 mechanism test: nests under allocation pressure.
#
# combi_nest proves the nested-dispatch shape is clean on a quiet heap.  The
# failures that motivated it did not appear until the write path had been busy
# for a while -- so this runs the same nest repeatedly with the allocation
# pointer moving hard between rounds, and checks every answer.  A cell write
# that had not landed, or an allocation that drifted by one, shows up here as
# a wrong answer rather than as a rare hang.
#
# exit status: 0 = PASS, otherwise the number of the check that failed.

    .equ NFILL,  64                 # boxes allocated between rounds
    .equ NROUND, 8                  # nests

    .section .text
    .globl main
main:
    la   t0, fn_heapend
    ld   t0, 0(t0)
    sd   t0, fn_gclimit, t1
    la   t0, _heap
    fn_csrw 0x7c0, t0

    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    li   s7, NROUND

.Lround:
    # dirty the write path: a run of allocations moves hp well past whatever
    # the previous round's copies touched
    li   s3, NFILL
    li   s6, 0x100
.Lfillbox:
    fn_databox a1, s6
    addi s6, s6, 1
    addi s3, s3, -1
    bnez s3, .Lfillbox

    # and now the nest, with no host instruction inside it.  The arguments
    # are pushed WITHOUT a source: a link cell here would be memoized by the
    # first round and the later rounds would reach that reduct instead of
    # dispatching.  The update this test is about is the inner dispatch's,
    # whose root is one of the outer's copy cells -- fresh every round.
    fn_link kr
    la   s6, n3
    FN_PUSH s6, zero
    la   s6, n2
    FN_PUSH s6, zero
    la   s6, inner
    FN_PUSH s6, zero
    j    outer
    .balign 4
outer:
    fn_combi_t2 3, 0,1,2,0,0,0
    .balign 4
inner:
    fn_combi_t0 2, 0,0,0,0,0,0
kr:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail
    addi s7, s7, -1
    bnez s7, .Lround

    # every round dispatched exactly twice
    li   gp, 2
    la   t0, fn_reductions
    ld   a4, 0(t0)
    li   t1, NROUND*2
    add  t1, t1, s5
    bne  a4, t1, _fail

    # the last box allocated still reads back: the fill and the reducts did
    # not tread on each other
    li   gp, 3
    fn_link kb
    fn_go a1
kb:
    fn_tor a0
    li   t0, 0x100+NFILL-1
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
n2: fn_box
    .word 0x22
    fn_box_body
    .balign 8
n3: fn_box
    .word 0x33
    fn_box_body
