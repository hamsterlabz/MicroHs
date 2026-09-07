# spine_deep.S - rv64 mechanism test: a deep spine.
#
# The spine is a pair of arrays in .bss indexed by fn_rsp, so depth costs
# nothing but address space and there is no per-chunk push cap to cross -- the
# rvfun version of this test exists to walk over that machine's 8-entries-per-
# chunk boundary, which has no counterpart here.  What is worth stating on
# this target is that the window still addresses correctly a long way down,
# that the arrays stay in step (a value and its source are written together),
# and that a read below the frame yields zero, which is what every drain loop
# in the runtime relies on to know when to stop.
#
# exit status: 0 = PASS, otherwise the number of the check that failed.

    .equ NDEEP, 300

    .section .text
    .globl main
main:
    la   t0, fn_heapend
    ld   t0, 0(t0)
    sd   t0, fn_gclimit, t1
    la   t0, _heap
    fn_csrw 0x7c0, t0

    # ---- check 1: push NDEEP entries, depth follows ----------------------
    li   gp, 1
    FN_DEPTH s4
    li   s5, NDEEP
    la   s6, n1
    la   s7, mark
.Lpush:
    FN_PUSH s6, s7                  # value n1, source mark
    addi s5, s5, -1
    bnez s5, .Lpush
    FN_DEPTH a4
    li   t1, NDEEP
    add  t1, t1, s4
    bne  a4, t1, _fail

    # ---- check 2: the window reads correctly deep down -------------------
    # wv/ws are indexed with the top at 0, so index NDEEP-1 is the first
    # entry pushed, and both arrays must still agree there.
    li   gp, 2
    li   t2, NDEEP-1
    FN_WVR a4, t2
    bne  a4, s6, _fail
    li   t2, 0
    FN_WVR a4, t2
    bne  a4, s6, _fail
    FN_WS a4, 0
    bne  a4, s7, _fail              # the source array kept in step

    # ---- check 3: a read below the frame yields zero ---------------------
    li   gp, 3
    li   t2, NDEEP+8                # past the bottom of this frame
    FN_WVR a4, t2
    bnez a4, _fail

    # ---- check 4: all NDEEP pop back, in order --------------------------
    li   gp, 4
    li   s5, NDEEP
.Lpop:
    fn_pop a0
    bne  a0, s6, _fail
    addi s5, s5, -1
    bnez s5, .Lpop
    FN_DEPTH a4
    bne  a4, s4, _fail

    # ---- check 5: a deep spine still delivers a value --------------------
    # Depth must not disturb the ordinary hand-off: push filler, then run a
    # box into a continuation underneath all of it.
    li   gp, 5
    fn_link k5
    li   s5, NDEEP
.Lpush2:
    FN_PUSH s6, s7
    addi s5, s5, -1
    bnez s5, .Lpush2
    li   s5, NDEEP
.Lpop2:
    fn_pop a0
    addi s5, s5, -1
    bnez s5, .Lpop2
    fn_link n1
    fn_enter
k5:
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
mark: .dword 0
    .balign 8
n1: fn_box
    .word 0x11
    fn_box_body
