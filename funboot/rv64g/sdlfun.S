# sdlfun.S - the fun-side half of libsdlfun.
#
# mhs emits a reference to _unimpfi_<name> for a foreign import and defines
# nothing; these are those symbols.  Each is entered as a graph node with its
# arguments on the spine, so each is the io.putb shape: pop the argument,
# force it to an unboxed Int in a0, call the C half, enter the continuation.
#
# Entered through the SAME gate every primitive uses (pm64: fn_seq then an
# fn_elink to the body).  Jumping straight at the body instead segfaults in
# _fforce_resume: the gate is what leaves the argument in the state _fforce
# expects, so it is part of the calling convention, not decoration.
#
# TWO CONVENTIONS, because the two dialects apply an import differently:
#
#   IO      (import typed Int -> IO ()): the graph is a bare
#           `fn_elink _unimpfi_x`, so the Int is on top of the spine.
#   CPS     (NanoPrelude, import typed Int -> a -> a): there is no IO type, so
#           the desugarer wraps it in primPerform and the node becomes
#           `fn_link <cont> ; fn_elink _unimpfi_x` -- that continuation is
#           pushed ON TOP, and has to come off before the argument.
#
# Getting this wrong is not a link error, it is a segfault in _fforce with a
# combinator where the argument should be, so the two are named apart rather
# than guessed: plain names are IO, _cps names are the NanoPrelude shape.
#
# ra is the only thing that has to survive the C call: the fun machine keeps
# its state in memory (fn_hp, the spine, fn_rsp), and fn_enter is a jump, so
# the blob never returns to its caller.
#
# Assembled into the program's translation unit so the fn_* macros are the
# ones the graph itself was built with; linked with sdl_plot.o and libSDL2.

# IO: argument on top of the spine
.macro  SDLBLOB name
    .balign 4, 0
    .globl  _unimpfi_\name
_unimpfi_\name:
    fn_seq
    fn_elink 8001f
    .balign 4, 0
8001:
    fn_pop  a0
    jal     ra, _fforce
    addi    sp, sp, -16
    sd      ra, 0(sp)
    call    \name
    ld      ra, 0(sp)
    addi    sp, sp, 16
    # BOX THE RESULT AND ENTER IT.  An IO action has to hand a value to its
    # continuation; fn_enter alone jumps there with nothing, which survives
    # while the value is ignored and dies as "normal form, nothing to resume"
    # the moment a >> chain demands it.  Entering the box is what delivers it.
    fn_databox a0, a0
    fn_go   a0
.endm

# CPS: primPerform's continuation is on top, the argument under it
.macro  SDLBLOB_CPS name
    .balign 4, 0
    .globl  _unimpfi_\name\()_cps
_unimpfi_\name\()_cps:
    fn_seq
    fn_elink 8002f
    .balign 4, 0
8002:
    fn_pop  a1
    fn_pop  a0
    jal     ra, _fforce
    addi    sp, sp, -16
    sd      ra, 0(sp)
    call    \name
    ld      ra, 0(sp)
    addi    sp, sp, 16
    fn_enter
.endm

    .text
    SDLBLOB     sdl_open
    SDLBLOB     sdl_put
    SDLBLOB     sdl_dot
    SDLBLOB     sdl_show
    SDLBLOB     sdl_px
    SDLBLOB     sdl_py
    SDLBLOB     sdl_pt
    SDLBLOB     sdl_num
    SDLBLOB     sdl_frame
    SDLBLOB     sdl_scale
    SDLBLOB     sdl_board
    SDLBLOB     sdl_cell
    SDLBLOB     sdl_gcell
    SDLBLOB     sdl_bdot
    SDLBLOB_CPS sdl_open
    SDLBLOB_CPS sdl_put
    SDLBLOB_CPS sdl_show
    SDLBLOB_CPS sdl_board
    SDLBLOB_CPS sdl_cell
    SDLBLOB_CPS sdl_frame
    SDLBLOB_CPS sdl_dot
    SDLBLOB_CPS sdl_px
    SDLBLOB_CPS sdl_py
    SDLBLOB_CPS sdl_pt
    SDLBLOB_CPS sdl_scale
    SDLBLOB_CPS sdl_cr
    SDLBLOB_CPS sdl_cg
    SDLBLOB_CPS sdl_cb
