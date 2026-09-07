# combi_b2b.S - rv64 mechanism test: back-to-back dispatches.
#
# A select combinator's target is the argument it selected, so if that
# argument is itself a combinator cell the next dispatch begins with no host
# instruction in between: allocate, update the root, pop, jump, allocate,
# update, pop, jump.  Nothing gets a chance to drain in the gaps because there
# are no gaps.  On the RTL this is where the update queue and the h-cache
# write path overlap; here it is where the fence.i after each cell write has
# to be enough for the very next jump.
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

    # ---- check 1: four dispatches, no host code between them ------------
    li   gp, 1
    FN_DEPTH s4
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k1                      # the answer goes here
    fn_link n1                      # bottom of the chain: a box
    fn_link c3
    fn_link c2
    fn_link c1                      # top
    j    d1
    .balign 4
d1: fn_combi_t0 1, 0,0,0,0,0,0      # pops c1, enters c1
    .balign 4
c1: fn_combi_t0 1, 0,0,0,0,0,0      # pops c2, enters c2
    .balign 4
c2: fn_combi_t0 1, 0,0,0,0,0,0      # pops c3, enters c3
    .balign 4
c3: fn_combi_t0 1, 0,0,0,0,0,0      # pops n1, enters n1 -- the box
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 4
    bne  a4, t1, _fail              # exactly four dispatches
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: every root along the chain was updated ----------------
    # Each dispatch memoized the cell that pushed the entry it consumed, so
    # walking the run again must reach the reducts and dispatch nothing.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k2
    fn_link n1
    fn_link c3
    fn_link c2
    fn_link c1
    j    d1
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 4
    bne  a4, t1, _fail              # fresh roots, so four again
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
