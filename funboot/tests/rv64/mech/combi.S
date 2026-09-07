# combi.S - rv64 mechanism test: fn_combi dispatch.
#
# A structured combinator is one cell carrying an arity and six 3-bit
# selectors.  Dispatching it pops `arity` entries, materializes the reduct --
# the body groups and the spine copy -- at hp, overwrites the redex root with
# a transfer to that copy (the record-free Turner update), pushes the spine
# elements with their copy cells as sources, and enters the head.
#
# The two shapes here are the ones everything else is built from:
#   t0, the select : the reduct is one selected argument, so the copy is a
#                    single transfer and the dispatch is a jump to it;
#   t1, the apply  : the copy is a link naming one argument followed by a
#                    transfer to another, so walking it applies the second
#                    to the first.
#
# The rvfun version checks the copy ADDRESSES against _heap and the root word
# against elink(copy).  Both are that machine's representation.  What holds
# here is what those numbers were standing for, and it is what these checks
# state: the right argument is selected, the application really is built, the
# root is memoized so the redex never runs twice, and each dispatch counts as
# exactly one reduction.
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

    # ---- check 1: select takes the argument its selector names ----------
    li   gp, 1
    FN_DEPTH s4
    fn_link k1
sel1:
    fn_link n1                      # the only argument, and the redex root
    j    c1
    .balign 4
c1:
    fn_combi_t0 1, 0,0,0,0,0,0      # arity 1, select argument 0
k1:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the redex root was memoized ---------------------------
    # Walking the root again must reach the reduct that the dispatch built,
    # not run the dispatch a second time.
    li   gp, 2
    la   t0, fn_reductions
    ld   s5, 0(t0)                  # reductions before the re-walk
    fn_link k2
    j    sel1
k2:
    fn_tor a0
    li   t0, 0x11
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    bne  a4, s5, _fail              # no dispatch happened: the redex is spent

    # ---- check 3: a dispatch counts as exactly one reduction ------------
    li   gp, 3
    la   t0, fn_reductions
    ld   s5, 0(t0)
    fn_link k3
sel3:
    fn_link n2
    j    c3
    .balign 4
c3:
    fn_combi_t0 1, 0,0,0,0,0,0
k3:
    fn_tor a0
    li   t0, 0x22
    bne  a0, t0, _fail
    la   t0, fn_reductions
    ld   a4, 0(t0)
    addi t1, s5, 1
    bne  a4, t1, _fail

    # ---- check 4: apply builds the application --------------------------
    # window: wv(0) = fapp, wv(1) = n2.  t1 with selectors [0,1] copies a
    # link naming wv(1) and a transfer to wv(0), so fapp is entered with n2
    # pushed -- the application fapp n2.
    li   gp, 4
    fn_link k4
    fn_link n2
ap4:
    fn_link fapp
    j    c4
    .balign 4
c4:
    fn_combi_t1 2, 0,1,0,0,0,0
    .balign 4
fapp:                               # entered with n2 on top
    fn_tor a0
    addi a0, a0, 1
    fn_databox a1, a0
    fn_go a1                        # hand the result to k4
k4:
    fn_tor a0
    li   t0, 0x23                   # 0x22 + 1: fapp really did receive n2
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
