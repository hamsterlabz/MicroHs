# update.S - rv64 mechanism test: fn_update, the record-free Turner update.
#
# fn_update rs2 memoizes the cell that is the VALUE on top of the spine -- the
# redex root, which a reduction carries there -- so that the next walk to
# reach it transfers to rs2, and pops.  On the xfun machine that is one store:
# the cell becomes the word elink(rs2).  Here a cell is code, so the memo is
# the three instructions that materialize the target and jump to it, written
# over the head of the cell; because they are instructions the write needs a
# fence.i before anything can execute them.  The rest of the old cell stays
# where it is, dead from the moment the jump is in place.
#
# The point of the mechanism is that the update is visible to the very next
# walk of that cell.  A stale read re-reduces a spent redex -- extra
# allocation, extra update, a diverging heap pointer -- which is the
# Knuthbendix stale-root failure; check 2 is that read.
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

    # ---- check 1: an updated cell transfers to its new target -----------
    li   gp, 1
    FN_DEPTH s4
    fn_link k1                      # the continuation to arrive at
    fn_link rr                      # the redex root, as a value on the spine
    la   a0, n1
    fn_update a0                    # rr now transfers to n1; the entry pops
    j    rr
    .balign 4
rr:
    fn_link n2                      # only reached if the update did not take
    j    _fail
k1:
    fn_tor a0
    li   t0, 0x11                   # n1's payload: the walk went to n1
    bne  a0, t0, _fail
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 2: the update is visible to every later walk -------------
    li   gp, 2
    fn_link rr2
    la   a0, n3
    fn_update a0
    li   s5, 3                      # walk it three times over
.Lagain:
    fn_link k2
    j    rr2
    .balign 4
rr2:
    fn_link n2
    j    _fail
k2:
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    addi s5, s5, -1
    bnez s5, .Lagain
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 3: the memo names the top VALUE, not the one below -------
    li   gp, 3
    fn_link c3keep                  # deeper entry: must be left alone
    fn_link c3upd                   # top entry: this is the root
    la   a0, n3
    fn_update a0
    fn_pop a0
    la   t1, c3keep
    bne  a0, t1, _fail              # the deeper entry survived unchanged
    fn_link k3
    j    c3upd
    .balign 4
c3upd:
    fn_link n2
    j    _fail
k3:
    fn_tor a0
    li   t0, 0x33
    bne  a0, t0, _fail
    # and the cell that was NOT updated still does what it always did
    fn_link k3b
    j    c3keep
    .balign 4
c3keep:
    fn_link n2
    fn_enter
k3b:
    fn_tor a0
    li   t0, 0x22
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
