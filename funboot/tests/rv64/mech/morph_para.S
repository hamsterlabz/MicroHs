# morph_para.S - rv64 mechanism test: fn_para.
#
# para routes through the SAME rewrite as cata:
#
#   para F A x  ->  A (F (para F A) x)
#
# The schemes are not distinguished by the shape they build but by the cell
# the reduct's back-reference names -- its own.  A decode that confused the
# two would plant the wrong cell there and the unfold would run the wrong
# scheme from the second layer on, which is exactly what check 2 walks into:
# it takes the recursive reference the reduct handed the functor, supplies a
# fresh seed, and walks it.  Arriving back at the functor with the reduction
# counter advanced is the back-reference doing its job.
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

    li   gp, 1
    FN_DEPTH s4
    li   s6, 0                      # times the functor ran
    li   s5, 0                      # reductions before the unfold
    fn_link kdone
xc:
    fn_link xnode
    fn_link algb
    fn_link fnb
pcell:
    fn_para
    j    _fail

    .balign 4
algb:                               # A: force what it was handed, which
    fn_force                        # drives the functor
    fn_pop a0
    fn_link n1
    fn_enter

    .balign 4
fnb:                                # F: top = rc, then the seed
    addi s6, s6, 1
    fn_pop s3                       # the recursive para F A
    beqz s3, _fail
    fn_tor a0                       # the seed
    li   t0, 2
    bge  s6, t0, .Lstop

    # ---- check 2: walking the back-reference unfolds again --------------
    li   gp, 2
    li   t0, 0x0BA1                 # the first seed, as supplied
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link xnode2                  # a fresh seed for the next layer
    fn_go s3                        # rc: pushes A and F, enters the para cell
.Lstop:
    li   t0, 0x0BA2                 # the second layer saw the fresh seed
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail              # and that really was another dispatch
    fn_link n1
    fn_enter

kdone:
    li   gp, 3
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    li   t0, 2
    bne  s6, t0, _fail              # the functor ran on both layers
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
xnode: fn_box
    .word 0x0BA1
    fn_box_body
    .balign 8
xnode2: fn_box
    .word 0x0BA2
    fn_box_body
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
