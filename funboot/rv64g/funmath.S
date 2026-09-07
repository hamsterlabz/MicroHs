# funmath.S - real implementations for the math foreign imports.
#
# Data.FloatW's Floating instance imports sqrt/sin/cos/exp/... rather than
# using a primitive, so mhs emits references and the linker asks for them.
# The build stubs whatever is left over to halt naming itself, which is right
# for the ones a program never calls -- but nbody genuinely computes sqrt, so
# it gets the real thing here.
#
# FloatW is binary32 on this target (the runtime's own float prims are fadd.s
# / fsqrt.s), so this is the hardware instruction, not a libm call: same shape
# as _prim_fsqrt in FunBlobs64.unary -- force the argument to a box, take the
# payload, compute, box the result and enter it.  Entering the box is what
# hands the value to the continuation.

    .text
    .balign 4, 0
    .globl  _unimpfi_sqrt
_unimpfi_sqrt:
    fn_force
    fn_tor  a0
    fmv.w.x fa0, a0
    fsqrt.s fa0, fa0
    fmv.x.w a0, fa0
    fn_databox a0, a0
    fn_go   a0
