# elink.S - rv64 mechanism test: the elink (transfer) cell.
#
# An elink cell is lui/addi to materialize the target and jr t4 -- a plain
# jump.  It pushes nothing and leaves no trace: control simply continues at
# the target with the spine as it was.
#
# On the xfun machine an elink means two different things depending on where
# it sits in a chunk (an inline redirect that does not retire, or a dispatch
# at the cap that does).  That distinction is a property of the fetch unit and
# has no counterpart here: the cell is a jump, always.  What survives the move
# is the observable contract, which is what these checks state -- the spine is
# untouched across a transfer, and a chain of transfers arrives at the end.
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

    # ---- check 1: a transfer arrives, and the spine is unchanged --------
    li   gp, 1
    FN_DEPTH s4                     # depth before
    fn_link n1
    fn_elink t1tgt
    j    _fail                      # the elink must not fall through
t1tgt:
    FN_DEPTH a4
    addi t1, s4, 1                  # the link pushed one, the elink nothing
    bne  a4, t1, _fail
    fn_tor a1
    li   t0, 0x11
    bne  a1, t0, _fail

    # ---- check 2: a chain of transfers ----------------------------------
    li   gp, 2
    fn_elink t2a
    j    _fail
t2a:
    fn_elink t2b
    j    _fail
t2b:
    fn_elink t2c
    j    _fail
t2c:
    FN_DEPTH a4
    bne  a4, s4, _fail              # nothing pushed by any of them

    # ---- check 3: a transfer into a run of links ------------------------
    # The target is an ordinary cell, so a transfer may land on a link and
    # the run continues from there.
    li   gp, 3
    fn_elink t3c
    j    _fail
t3c:
    fn_link n2
    fn_link n1
    fn_tor a1
    li   t0, 0x11
    bne  a1, t0, _fail
    fn_tor a1
    li   t0, 0x22
    bne  a1, t0, _fail
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
