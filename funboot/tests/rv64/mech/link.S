# link.S - rv64 mechanism test: the link cell.
#
# A link cell is five instructions: lui/addi materialize the value, auipc/addi
# take the cell's OWN address, and jr s10 enters _rt_link, which pushes
# (value, this cell) and returns to the instruction after the cell.  A run of
# link cells therefore pushes left to right and falls through to whatever
# terminates the run, and the source recorded against each entry is the cell
# that pushed it -- that source is what a Turner update overwrites later, so
# it has to be exact.
#
# The rvfun version of this test spends two of its three checks on fetch-line
# geometry: a chunk may push at most min(16 - word-offset, 8 - depth%8) cells
# before the walk continues in the next line.  Neither a fetch line nor a
# chunk cap exists here -- a run of link cells is straight-line code -- so the
# check that carries that intent across is the third one: a run long enough to
# cross any plausible boundary still pushes every entry, in order.
#
# exit status: 0 = PASS, otherwise the number of the check that failed.

    .section .text
    .globl main
main:
    # The collector must not run inside a test: hp is placed by hand below and
    # a pass would relocate the very cells the checks read.
    la   t0, fn_heapend
    ld   t0, 0(t0)
    sd   t0, fn_gclimit, t1
    la   t0, _heap
    fn_csrw 0x7c0, t0

    # ---- check 1: a run of links pushes, and pops LIFO ------------------
    li   gp, 1
    fn_link n1
    fn_link n2
    fn_link n3
    fn_tor  a1                      # the last pushed is the first popped
    li   t0, 0x33
    bne  a1, t0, _fail
    fn_tor  a2
    li   t0, 0x22
    bne  a2, t0, _fail
    fn_tor  a3
    li   t0, 0x11
    bne  a3, t0, _fail

    # ---- check 2: the entry's source is the pushing cell ----------------
    li   gp, 2
l2:
    fn_link n2
    FN_WV t0, 0
    la   t1, n2
    bne  t0, t1, _fail              # the value is the cell it names
    FN_WS t0, 0
    la   t1, l2
    bne  t0, t1, _fail              # the source is the link cell itself
    fn_pop t0

    # ---- check 3: a long run still pushes every entry, in order ---------
    # 20 cells, 100 bytes of code: past any line, page or buffer boundary a
    # fetch on this target could have.
    li   gp, 3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    fn_link n3
    fn_link n1
    fn_link n2
    li   a4, 20                     # pop all 20 and check the cycle 1,2,3
    li   a5, 0x22                   # the 20th pushed was n2
.Lloop:
    fn_tor a1
    bne  a1, a5, _fail
    addi a5, a5, -0x11              # walk back down the cycle 0x33,0x22,0x11
    li   t0, 0
    bne  a5, t0, .Lno
    li   a5, 0x33
.Lno:
    addi a4, a4, -1
    bnez a4, .Lloop

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
