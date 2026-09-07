# enter.S - rv64 mechanism test: fn_enter.
#
# fn_enter pops the top of the spine and continues at the popped VALUE.  The
# entry leaves no trace: depth drops by one and control resumes at the value's
# own cell, not at a return address.  With an empty spine there is nothing to
# enter and the machine is in normal form, so fn_enter goes to fn_nfa instead
# -- that path ends the program, so it is not exercised here; the suite's
# programs reach it on every run.
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

    # ---- check 1: enter goes to the value on top ------------------------
    li   gp, 1
    FN_DEPTH s4
    fn_link t1tgt                   # push a code cell as a value
    fn_enter
    j    _fail                      # must have gone to the target
t1tgt:
    FN_DEPTH a4
    bne  a4, s4, _fail              # the entry consumed its entry

    # ---- check 2: enter takes the TOP, not the bottom -------------------
    li   gp, 2
    fn_link t2wrong
    fn_link t2right
    fn_enter
    j    _fail
t2wrong:
    li   gp, 22
    j    _fail
t2right:
    FN_DEPTH a4
    addi t1, s4, 1                  # t2wrong is still there
    bne  a4, t1, _fail
    fn_pop a0
    la   t1, t2wrong
    bne  a0, t1, _fail              # and it is exactly what was left

    # ---- check 3: entering a box hands the box to the continuation ------
    # A box is a value like any other, so entering one runs its body, which
    # is the WHNF hand-off: it pops the continuation and arrives there with
    # the box on top.
    li   gp, 3
    fn_link t3k                     # the continuation
    fn_link n1                      # the box
    fn_enter
    j    _fail
t3k:
    fn_tor a1
    li   t0, 0x11
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
