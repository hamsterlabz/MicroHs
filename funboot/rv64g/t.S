    .equ FN_SPINE_CAP, 1048576
    .include "fun_macros.S"
    .include "fun_combi.S"
    .text
    .globl _test
_test:
    fn_link  some_target
    fn_combi_t1 1, 0,0,0,0,0,0
    fn_tor   a0
    fn_databox a1, a0
    fn_enter
some_target:
    ret
