# fun_macros.S - the fn.* instruction set as assembly macros for a stock RV64GC
# host.  There is no xfun extension here: every fun instruction expands to real
# RISC-V.  The semantics are those of the reducer in qemu
# (target/riscv/fun_helper.c) and clash-rvfun (src/Core/Fun.hs), which are the
# references.
#
# The machine state that the hardware holds becomes memory:
#
#   the r-stack   fn_sv[]/fn_ss[]   value and SOURCE of each spine entry; the
#                                   source is the cell a Turner update writes
#   fn_rsp                          spine depth
#   fn_frame      CSR 0x7c2         evaluation frame base; every depth test is
#                                   relative to it
#   fn_hp         CSR 0x7c0         the allocation pointer
#   fn_nfa        CSR 0x7c1         NORMAL_FORM handler
#
# Register use inside the macros is confined to t0-t4; a5 carries the spine
# depth nowhere -- everything is read from memory, so a macro can appear
# anywhere in the instruction stream, which is what makes the graph ordinary
# code here.

    # rvfun: NO instruction -- rsp is a hardware register.
    .macro  FN_RSP_LOAD reg          # \reg <- rsp
    la      t0, fn_rsp
    lw      \reg, 0(t0)
    .endm

    # rvfun: NO instruction -- rsp is a hardware register.
    .macro  FN_RSP_STORE reg
    la      t0, fn_rsp
    sw      \reg, 0(t0)
    .endm

# rdepth() = rsp - frame: the spine below the frame is invisible, exactly as in
# fun_helper.c
    # rvfun: NO instruction -- the depth is a hardware counter (fRsp).
    .macro  FN_DEPTH reg
    la      t0, fn_rsp
    lw      \reg, 0(t0)
    la      t0, fn_frame
    lw      t1, 0(t0)
    sub     \reg, \reg, t1
    .endm

# push (value, source): rpush() in the reference
    # rvfun: NO instruction -- the spine is the r-cache/vspine window and every
    #         fn.* op pushes and pops it implicitly.  Here it is memory traffic.
    .macro  FN_PUSH val, src
    la      t0, fn_rsp
    lw      t1, 0(t0)
    la      t2, fn_sv
    slli    t3, t1, 3
    add     t2, t2, t3
    sd      \val, 0(t2)
    la      t2, fn_ss
    add     t2, t2, t3
    sd      \src, 0(t2)
    addi    t1, t1, 1
    sw      t1, 0(t0)
    .endm

# wv(i) / ws(i): the window is indexed with the TOP at 0, and a read that
# falls below the frame yields 0 -- wv(i) = i < rdepth() ? sv[rsp-1-i] : 0 in
# the reference.  The drain loops depend on it: they pop until they read 0.
    # rvfun: NO instruction -- a spine window read (value lane).
    .macro  FN_WV reg, i
    la      t0, fn_rsp
    lw      t1, 0(t0)
    addi    t1, t1, -1-\i
    la      t2, fn_frame
    lw      t3, 0(t2)
    blt     t1, t3, .Lx\@_61
    la      t2, fn_sv
    slli    t3, t1, 3
    add     t2, t2, t3
    ld      \reg, 0(t2)
    j       .Lx\@_62
.Lx\@_61: li  \reg, 0
.Lx\@_62:
    .endm

    # rvfun: NO instruction -- a spine window read (source lane, the update target).
    .macro  FN_WS reg, i
    la      t0, fn_rsp
    lw      t1, 0(t0)
    addi    t1, t1, -1-\i
    la      t2, fn_frame
    lw      t3, 0(t2)
    blt     t1, t3, .Lx\@_63
    la      t2, fn_ss
    slli    t3, t1, 3
    add     t2, t2, t3
    ld      \reg, 0(t2)
    j       .Lx\@_64
.Lx\@_63: li  \reg, 0
.Lx\@_64:
    .endm

# wv(i) with the index in a REGISTER: the shared combinator routines take
# their selectors from the packed word, not from a macro argument.
    # rvfun: NO instruction -- a spine window read, frame-relative.
    .macro  FN_WVR reg, idx
    la      t0, fn_rsp
    lw      t1, 0(t0)
    sub     t1, t1, \idx
    addi    t1, t1, -1
    la      t2, fn_frame
    lw      t3, 0(t2)
    blt     t1, t3, .Lv\@_0
    la      t2, fn_sv
    slli    t3, t1, 3
    add     t2, t2, t3
    ld      \reg, 0(t2)
    j       .Lv\@_1
.Lv\@_0: li  \reg, 0
.Lv\@_1:
    .endm

# rpop(n) with the count in a REGISTER
    # rvfun: NO instruction -- frame-relative pop, implicit in the op.
    .macro  FN_POPN_RR n
    la      t0, fn_rsp
    lw      t1, 0(t0)
    la      t2, fn_frame
    lw      t2, 0(t2)
    sub     t3, t1, t2
    sub     t3, t3, \n
    bltz    t3, .Lq\@_1
    sub     t1, t1, \n
    j       .Lq\@_2
.Lq\@_1: mv  t1, t2
.Lq\@_2: sw  t1, 0(t0)
    .endm

# rpop(n), clamped at the frame like the reference.  Scratches t0-t3 ONLY:
# every transfer holds the value it is about to enter in t4 across the pop.
    # rvfun: NO instruction -- the pop count rides in the fun op itself.
    .macro  FN_POPN n
    la      t0, fn_rsp
    lw      t1, 0(t0)
    la      t2, fn_frame
    lw      t2, 0(t2)
    sub     t3, t1, t2               # rdepth
    addi    t3, t3, -\n
    bltz    t3, .Lx\@_8               # more than the frame holds: clamp
    addi    t1, t1, -\n
    j       .Lx\@_9
.Lx\@_8:  mv      t1, t2
.Lx\@_9:  sw      t1, 0(t0)
    .endm

# The three fun CSRs are globals here, so the blobs' csrr/csrw become these.
# Writing ~0 to the frame means "capture the current depth" -- the reference
# does that in fun_helper.c's csr write path, not in the caller.

# rvfun: csrr rd, csr   -- the fun CSRs are REAL CSRs on the fun core
#         (0x7C0 hp, 0x7C1 nf, 0x7C2 frame base); globals here.
.macro  fn_csrr rd, csr
.if     \csr == 0x7c0
    ld      \rd, fn_hp
.elseif \csr == 0x7c1
    ld      \rd, fn_nfa
.else
    lw      \rd, fn_frame
.endif
.endm

# rvfun: csrw csr, rs   -- as above, one instruction there.
.macro  fn_csrw csr, rs
.if     \csr == 0x7c0
    sd      \rs, fn_hp, t6
.elseif \csr == 0x7c1
    sd      \rs, fn_nfa, t6
.else
    li      t6, -1
    bne     \rs, t6, .Lc\@_1
    lw      t6, fn_rsp                  # frame := the current depth
    sw      t6, fn_frame, t5
    j       .Lc\@_2
.Lc\@_1:
    sw      \rs, fn_frame, t6
.Lc\@_2:
.endif
.endm

# A transfer target is either a CELL OF THE COMPILED GRAPH -- which on this
# host is native code and is entered by jumping to it -- or a cell the runtime
# ALLOCATED, which holds fun words in the reference encoding and has to be
# interpreted.  _rt_go tells them apart by the heap base and dispatches; s11
# holds its address so that a memoized cell can reach it from anywhere.
#
# This is the one place where the port differs from the reference in kind: on
# the rvfun machine every cell is a fun word and the hardware walks all of
# them, while here the compiler's output is instructions and only what the
# runtime builds at run time -- boxes, knots, the little blocks the blobs
# assemble -- stays as data.

# ---- the collector ----------------------------------------------------------
# Every combinator reduction checks the heap BEFORE it reduces: at the top of
# the macro no base has been read yet, so the live references are exactly the
# spine, the shadow root stack, the memoized graph cells and the exception
# records -- all of which fun_gc() walks precisely.  That is what lets the
# collector MOVE objects.
    # rvfun: SOFTWARE ONLY -- the collector trigger; no fun opcode.
    .macro  FN_GCCHECK
    la      t0, fn_hp
    ld      t1, 0(t0)
    la      t0, fn_gclimit
    ld      t0, 0(t0)
    bltu    t1, t0, .Lg\@_ok
    addi    sp, sp, -16
    sd      ra, 8(sp)
    call    fun_gc
    ld      ra, 8(sp)
    addi    sp, sp, 16
.Lg\@_ok:
    .endm

# The shadow root stack.  A blob that keeps a heap reference across a nested
# force cannot leave it on the C stack: the collector moves objects, so every
# reference has to be one it can find AND rewrite.
    # rvfun: SOFTWARE ONLY -- the shadow root stack the collector walks.
    .macro  FN_ROOT_PUSH rs
    la      t0, fn_rootsp
    lw      t1, 0(t0)
    slli    t2, t1, 3
    addi    t1, t1, 1
    sw      t1, 0(t0)
    la      t0, fn_roots
    add     t2, t0, t2
    sd      \rs, 0(t2)
    .endm

    # rvfun: SOFTWARE ONLY -- see FN_ROOT_PUSH.
    .macro  FN_ROOT_POP rd
    la      t0, fn_rootsp
    lw      t1, 0(t0)
    addi    t1, t1, -1
    sw      t1, 0(t0)
    slli    t2, t1, 3
    la      t0, fn_roots
    add     t2, t0, t2
    ld      \rd, 0(t2)
    .endm

# ---- THE RTL's GC PROTOCOL, on this target -----------------------------------
# The blob emitter (FunBlobs.gcPoll) splices a poll after every box tail, for
# EVERY target:
#
#     la t0, fn_gc_trig ; lw t0, 0(t0) ; csrr t1, 0x7c0
#     bltu t1, t0, 8f ; jal t0, _gc_safepoint ; 8:
#
# so this runtime has to answer to the same two symbols the RTL runtime does,
# or nothing links.  Providing them is also the point: FN_GCCHECK collects at
# the TOP of a combinator, where no base has been read and no reference is in
# a register, while the RTL collects MID-BLOB, right after a databox, with the
# fresh box live in a0.  Those are different moments with different live sets,
# and only the second one reproduces what the RTL collector has to survive.
#
# The poll reads hp with a REAL csrr on 0x7c0, which is a custom CSR this
# stock RV64 host does not have.  fn_csrr already maps that number to fn_hp,
# so shadow the bare mnemonic the same way; .insn keeps the general case from
# recursing into this macro.
.macro  csrr rd, csr
.if     \csr == 0x7c0
    ld      \rd, fn_hp
.else
    .insn   i 0x73, 2, \rd, x0, \csr
.endif
.endm

    .globl  fn_gc_trig
# lw SIGN-EXTENDS on rv64, so -1 reads back as all ones and the poll's
# unsigned compare never fires: unarmed until something stores a real trigger.
fn_gc_trig:  .word -1

# Entered with 'jal t0, _gc_safepoint', returns through t0.
#
# a0 IS LIVE HERE -- it is the box the poll was spliced behind, and the
# collector MOVES it.  This collector is precise: it does not scan the C
# stack, so spilling a0 there would hide it rather than protect it.  The
# shadow root stack is the structure it does walk AND rewrite, which is
# exactly what a moving collector needs, so a0 goes there and comes back
# forwarded.  Everything else at a box tail is dead (t0/t1 by the poll's own
# contract) or callee-saved across the call.
    .weak   fun_gc                  # an image with no collector still links
    .globl  _gc_safepoint
_gc_safepoint:
    addi    sp, sp, -32
    sd      ra, 0(sp)
    sd      t0, 8(sp)
    FN_ROOT_PUSH a0                 # clobbers t0-t2; t0 is already saved
    la      t1, fun_gc
    beqz    t1, 1f
    jalr    ra, 0(t1)
1:  FN_ROOT_POP a0                  # comes back FORWARDED
    ld      t0, 8(sp)
    ld      ra, 0(sp)
    addi    sp, sp, 32
    jr      t0




# FN_MEMOWORD rd, rs: the FIRST WORD a memoized graph cell holds for target
# rs.  On the rvfun machine an update writes the elink word and a test can
# compare against ori(target,1); here it writes instructions, so the same
# assertion compares against the lui that FN_MEMO emits.
    # rvfun: NO instruction -- see FN_MEMO.
    .macro  FN_MEMOWORD rd, rs
    mv      \rd, \rs                 # scratch-free, so rd and rs may coincide
    addi    \rd, \rd, 0x7ff
    addi    \rd, \rd, 1              # + 0x800
    srli    \rd, \rd, 12
    slli    \rd, \rd, 12             # the hi20, in place
    addi    \rd, \rd, 0x7ff
    addi    \rd, \rd, 0x6b8          # | (29<<7)|0x37 : lui t4
    .endm

# ---- the emitted cell forms -------------------------------------------------
# A cell this runtime ALLOCATES is RV64 code, exactly like a cell the compiler
# emitted: there is one representation, so nothing has to interpret fun words
# and no cell is ever "data that must be walked".  The three forms below are
# what a reduction writes; the pinned registers keep each of them short.
#
#   link  v : lui t4,hi(v); addi t4,t4,lo(v); auipc t5,0; addi t5,t5,-8; jr s10
#   elink v : lui t4,hi(v); addi t4,t4,lo(v); jr s11
#   box   p : j .+8; .word p; auipc t6,0; jr s9      (payload stays at cell+4)
    .equ FN_CELL_LINK,  20
    .equ FN_CELL_ELINK, 20   # padded: one cell size everywhere
    .equ FN_CELL_BOX,   16

# FN_EMIT_HI/LO rd, val: the lui and addi words for a 32-bit target
    # rvfun: NO instruction -- materialising an address into a cell; on the fun
    #         core the address simply IS the cell word.
    .macro  FN_EMIT_LUI rd, val, tmp
    li      \tmp, 0x800
    add     \rd, \val, \tmp
    li      \tmp, 0xfffff000
    and     \rd, \rd, \tmp
    li      \tmp, (29<<7)|0x37
    or      \rd, \rd, \tmp
    .endm

    # rvfun: NO instruction -- see FN_EMIT_LUI.
    .macro  FN_EMIT_ADDI rd, val, tmp
    li      \tmp, 0x800
    add     \rd, \val, \tmp
    li      \tmp, 0xfffff000
    and     \rd, \rd, \tmp
    sub     \rd, \val, \rd               # lo12, signed
    slli    \rd, \rd, 52
    srli    \rd, \rd, 52
    slli    \rd, \rd, 20
    li      \tmp, (29<<15)|(29<<7)|0x13
    or      \rd, \rd, \tmp
    .endm

# FN_WCELL_LINK at, val: write a link cell for \val at address \at (clobbers
# t0-t3; \at and \val must be elsewhere)
    # rvfun: NO instruction -- a cell is written by the wide node burst
    #         (foWideGo/Base/N/W), up to six words in one commit.
    .macro  FN_WCELL_LINK at, val
    FN_EMIT_LUI  t2, \val, t3
    sw      t2, 0(\at)
    FN_EMIT_ADDI t2, \val, t3
    sw      t2, 4(\at)
    li      t2, (30<<7)|0x17             # auipc t5, 0
    sw      t2, 8(\at)
    li      t2, ((-8 & 0xfff)<<20)|(30<<15)|(30<<7)|0x13
    sw      t2, 12(\at)
    li      t2, (26<<15)|0x67            # jr s10  (_rt_link)
    sw      t2, 16(\at)
    .endm

# FN_WCELL_ELINK at, val: write a transfer cell
    # rvfun: NO instruction -- part of the same wide node burst.
    .macro  FN_WCELL_ELINK at, val
.ifdef FN_CHECK_CYCLE
    addi    sp, sp, -48
    sd      ra, 0(sp)
    sd      \at, 8(sp)
    sd      \val, 16(sp)
    mv      a0, \at
    mv      a1, \val
    call    fun_check_cycle
    ld      ra, 0(sp)
    ld      \at, 8(sp)
    ld      \val, 16(sp)
    addi    sp, sp, 48
.endif
    FN_EMIT_LUI  t2, \val, t3
    sw      t2, 0(\at)
    FN_EMIT_ADDI t2, \val, t3
    sw      t2, 4(\at)
    li      t2, (29<<15)|0x67            # jr t4: the target is in hand
    sw      t2, 8(\at)
    li      t2, 0x00000013               # nop, nop: pad to one cell size, so
    sw      t2, 12(\at)                  # a cell address is always k*20 and
    sw      t2, 16(\at)                  # no offset arithmetic can disagree
    .endm

# FN_WCELL_BOX at, payload: write a box whose payload keeps the cell+4 slot
    # rvfun: NO instruction -- fn.databox emits the box in one commit.
    .macro  FN_WCELL_BOX at, payload
    li      t2, 0x0080006f               # j .+8
    sw      t2, 0(\at)
    sw      \payload, 4(\at)
    li      t2, (31<<7)|0x17             # auipc t6, 0
    sw      t2, 8(\at)
    li      t2, (25<<15)|0x67            # jr s9   (_rt_boxbody)
    sw      t2, 12(\at)
    .endm

# ---- the instructions -------------------------------------------------------

# fn.link <target>: push the target with THIS CELL as the source, then fall
# through to the next word.  The source is what the Turner update overwrites,
# so it has to be the address of this macro's own cell.
    # rvfun: a LINK cell    -- ONE word, low2=00, holding the target address.
    #         Here it takes lui/addi plus the tail that makes the cell runnable.
    .macro  fn_link target
    lui     t4, %hi(\target)         # the SAME five instructions a reduction
    addi    t4, t4, %lo(\target)     # writes for a link cell: one cell form
    auipc   t5, 0                    # everywhere, so _rt_link's stride is
    addi    t5, t5, -8               # a single constant
    jr      s10
    .endm

# fn.elink <target>: transfer.  A constant target, so a plain jump.
    # rvfun: an ELINK cell  -- ONE word, low2=01.  Ends a block.
    .macro  fn_elink target
    lui     t4, %hi(\target)
    addi    t4, t4, %lo(\target)
    jr      t4
    .endm


# FN_MEMO cell, val: memoize -- make the walk that next reaches \cell transfer
# to \val instead.  In an allocated cell that is the reference's elink word.
# In the graph it has to be something the CPU can execute, so it is the three
# instructions that materialize the target and enter _rt_go; the shortest
# fn.link expansion is longer than that, and the rest of it is dead once the
# jump is in place.  Writing instructions means fence.i.
    # rvfun: NO instruction -- this IS fn.update's hardware side: the redex-root
    #         write the reduction unit queues on every committing fun op.
    .macro  FN_MEMO cell, val
.ifdef FN_CHECK_CYCLE
    addi    sp, sp, -48
    sd      ra, 0(sp)
    sd      \cell, 8(sp)
    sd      \val, 16(sp)
    mv      a0, \cell
    mv      a1, \val
    call    fun_check_cycle
    ld      ra, 0(sp)
    ld      \cell, 8(sp)
    ld      \val, 16(sp)
    addi    sp, sp, 48
.endif
.ifdef FN_CHECK_MEMO
    addi    sp, sp, -48
    sd      ra, 0(sp)
    sd      \cell, 8(sp)
    sd      \val, 16(sp)
    mv      a0, \cell
    auipc   a1, 0
    call    fun_check_memo
    ld      ra, 0(sp)
    ld      \cell, 8(sp)
    ld      \val, 16(sp)
    addi    sp, sp, 48
.endif
    andi    t3, \val, -4                # x, a 32-bit address
    FN_EMIT_LUI  t1, t3, t0
    sw      t1, 0(\cell)
    FN_EMIT_ADDI t1, t3, t0
    sw      t1, 4(\cell)
    li      t1, (29<<15)|0x67           # jr t4
    sw      t1, 8(\cell)
    fence.i
    la      t0, fn_heapbase             # only a cell of the compiled IMAGE is
    ld      t0, 0(t0)                   # a root the collector cannot reach by
    bgeu    \cell, t0, .Lm\@_done       # tracing; it finds allocated cells
    la      t0, fn_cafn                 # itself
    lw      t1, 0(t0)
    li      t3, (1<<22)
    bgeu    t1, t3, .Lm\@_full
    slli    t3, t1, 3
    addi    t1, t1, 1
    sw      t1, 0(t0)
    la      t0, fn_caf
    add     t3, t0, t3
    sd      \cell, 0(t3)
    j       .Lm\@_done
.Lm\@_full:
    tail    _caf_overflow
.Lm\@_done:
    .endm

# fn.cata / fn.ana / fn.para / fn.hylo: explicit morphism dispatch (--morph).
# custom-3 on the xfun machine; here each is an ordinary cell that transfers to
# the routine building its reduct.  The cell takes its OWN address first: the
# reduct plants a recursive reference back to it, which is what makes the
# morphism unfold rather than run once.  para shares cata's rewrite -- the
# schemes differ only in which cell that back-reference names, and that is the
# cell itself, so the routine needs no scheme index to tell them apart.
    # rvfun: fn.cata        -- opcode 0x7B (custom-3), funct3=0.
    .macro  fn_cata
    auipc   t3, 0
    tail    _rt_cata
    .endm

    # rvfun: fn.para        -- opcode 0x7B (custom-3), funct3=2.
    .macro  fn_para
    auipc   t3, 0
    tail    _rt_cata
    .endm

    # rvfun: fn.ana         -- opcode 0x7B (custom-3), funct3=1.
    .macro  fn_ana
    auipc   t3, 0
    tail    _rt_cata
    .endm

    # rvfun: fn.hylo        -- opcode 0x7B (custom-3), funct3=3.
    .macro  fn_hylo
    auipc   t3, 0
    tail    _rt_hylo
    .endm

# fn.tor rd: rd <- the payload of the box on top, then pop.
# The destination is written LAST, through a memory temp: the pop scratches
# t0-t4, so a destination among them would otherwise come back clobbered.
    # rvfun: fn.tor rd      -- opcode 0x5B, funct3=2, bit25=0.  ONE instruction:
    #         the reduction unit reads mem[top+4] and pops the spine itself.
    .macro  fn_tor rd
    FN_WV   t4, 0
    andi    t4, t4, -4
    lw      t4, 4(t4)
    la      t0, fn_tmp
    sd      t4, 0(t0)
    FN_POPN 1
    la      t0, fn_tmp
    ld      \rd, 0(t0)
    .endm

# fn.pop rd: rd <- the raw top of the spine, then pop (destination last, as above)
    # rvfun: fn.pop rd      -- opcode 0x5B, funct3=4.  One instruction.
    .macro  fn_pop rd
    FN_WV   t4, 0
    la      t0, fn_tmp
    sd      t4, 0(t0)
    FN_POPN 1
    la      t0, fn_tmp
    ld      \rd, 0(t0)
    .endm

# fn.torp rd / fn.pushp rs -- raw graph-pointer moves (caml-insn.md).  MicroHs
# never needs them: everything it moves through a register is a data box, so
# fn_tor (which dereferences) covers it.  MinCaml stores CLOSURES in memory --
# not boxes -- so it needs to take an address off the spine and put one back
# without boxing either way.
#
# fn.torp IS fn_pop: pop the top without dereferencing.  It is spelled
# separately because the two names mean different things in the ISA and a
# reader should not have to know they coincide here.
    # rvfun: fn.torp rd     -- the raw-pointer sibling of fn.tor (no deref).
    .macro  fn_torp rd
    fn_pop  \rd
    .endm

# fn.pushp rs: push the address in \rs onto the spine as a raw pointer, no box
# and no allocation.  The source is the address itself: a pointer pushed from a
# register has no cell that produced it, and the documented use is a pushp
# immediately consumed by fn_enter, which pops and tail-jumps -- so no update
# can land on it.  Should one ever be able to, it would memoize into the node
# the pointer names, which is the only cell that could sensibly receive it.
    # rvfun: fn.pushp rs    -- opcode 0x5B, funct3=3, bit25=1.  One instruction;
    #         bit25 is what separates it from fn.update.
    .macro  fn_pushp rs
    mv      t6, \rs                  # FN_PUSH scratches t0-t3, so a caller
    FN_PUSH t6, zero                 # passing one of those (fn_pushp t0) would
    .endm                            # otherwise push the scratch, not the node.
                                     # src is zero: fn_enter consumes this push
                                     # immediately, so there is nothing to update.

# fn.update rs2: memoize the cell on top to rs2, then pop
    # rvfun: fn.update rs2  -- opcode 0x5B, funct3=3, bit25=0.  One instruction:
    #         the redex-root write is queued by the hardware (foUpd) in parallel
    #         with the node burst, so it costs no extra cycle there.
    .macro  fn_update rs2
    FN_WV   t4, 0
    andi    t4, t4, -4
    beqz    t4, .Lu\@_none              # no source: nothing to memoize
    FN_MEMO t4, \rs2
.Lu\@_none:
    FN_POPN 1
    .endm

# fn.databox rd, rs1: two words at hp -- the box marker and the payload
    # rvfun: fn.databox rd, rs1 -- opcode 0x5B, funct3=7.  One instruction: the
    #         header and payload go out as a wide write and hp advances by
    #         4*(1+SIZE), SIZE being bits[31:20] of the instruction.
    .macro  fn_databox rd, rs1
    la      t0, fn_hp
    ld      t1, 0(t0)
    FN_WCELL_BOX t1, \rs1
    addi    t2, t1, FN_CELL_BOX
    sd      t2, 0(t0)
    fence.i
    mv      \rd, t1                  # last, so any destination is safe
    .endm

    # rvfun: fn.databox with a POINTER payload (header 0x0001605B rather than
    #         0x0000605B), so the collector traces it instead of skipping it.
    .macro  fn_pbox rd, rs1          # a box whose payload is an arena pointer
    la      t0, fn_hp
    ld      t1, 0(t0)
    FN_WCELL_BOX t1, \rs1
    li      t2, (24<<15)|0x67        # tail through s8 instead of s9: the two
    sw      t2, 12(t1)               # registers hold the SAME routine, so this
    addi    t2, t1, FN_CELL_BOX      # is only a mark for the collector -- the
    sd      t2, 0(t0)                # payload is a pointer, not data
    fence.i
    mv      \rd, t1
    .endm

# fn_go rs: transfer to the value in \rs -- what a bare jr would be on a
# machine where every cell is a fun word.
    # rvfun: entering a node -- on the fun core a cell address IS executable,
    #         so this is the machine simply fetching there.
    .macro  fn_go rs
    mv      t4, \rs
    andi    t4, t4, -4
    jr      t4
    .endm

# fn.enter: enter the value on top of the spine (NORMAL_FORM if it is empty)
    # rvfun: fn.enter       -- the whole word is 0x0000000B (opcode 0x0B).
    #         Pops the continuation and tail-jumps; empty spine = NORMAL FORM.
    .macro  fn_enter
    FN_DEPTH t4
    beqz    t4, .Lx\@_7
    FN_WV   t4, 0
    FN_POPN 1
    andi    t4, t4, -4
    jr      t4                       # native code: just go there
.Lx\@_7:  la      t4, fn_nfa
    ld      t4, 0(t4)
    jr      t4
    .endm

# rpop(n) where n is a macro parameter rather than a literal
    # rvfun: NO instruction -- frame-relative pop, implicit in the op.
    .macro  FN_POPN_R n
    la      t0, fn_rsp
    lw      t1, 0(t0)
    la      t2, fn_frame
    lw      t2, 0(t2)
    sub     t3, t1, t2
    addi    t3, t3, -\n
    bltz    t3, .Lx\@_81
    addi    t1, t1, -\n
    j       .Lx\@_82
.Lx\@_81: mv      t1, t2
.Lx\@_82: sw      t1, 0(t0)
    .endm

# fn.y, fn.seq, fn.force, fn.box: the remaining transfers.  Semantics from
# fun_helper.c's fun_lite/fun_fetch_target.

# fn.force: pop the value, push the continuation (this cell + 4) keeping the
# value's SOURCE, and enter the value
    # rvfun: no single instruction -- force to WHNF inside a frame.
    .macro  fn_force
    FN_DEPTH t4
    beqz    t4, .Lx\@_71
    FN_WV   t4, 0
    FN_WS   t5, 0
    FN_POPN 1
.Lx\@_98: lla     t6, .Lx\@_97
    FN_PUSH t6, t5
    andi    t4, t4, -4
    jr      t4
.Lx\@_71: la      t4, fn_nfa
    ld      t4, 0(t4)
    jr      t4
.Lx\@_97:
    .endm

# fn.seq: the arity gate.  Two or more arguments and it falls through to the
# blob; exactly one and it forces that argument; none is NORMAL_FORM.
    # rvfun: no single instruction -- a framed reduction, the same shape the
    #         hardware drives through the frame stack and NF_ADDR.
    .macro  fn_seq
    FN_DEPTH t4
    li      t5, 2
    bge     t4, t5, .Lx\@_96              # >= 2: fall through
    beqz    t4, .Lx\@_72
    FN_WV   t4, 0
    FN_POPN 1
.Lx\@_95: lla     t6, .Lx\@_96
    FN_PUSH t6, zero
    andi    t4, t4, -4
    jr      t4
.Lx\@_72: la      t4, fn_nfa
    ld      t4, 0(t4)
    jr      t4
.Lx\@_96:
    .endm

# fn.box.  A box is two cells -- the marker and the payload -- and fn.tor
# reads the payload at cell+4, so the payload has to KEEP that slot.  A macro
# expansion cannot promise it, so the box is split: fn_box is the single jump
# that occupies the marker cell, the compiler's payload word follows it
# untouched, and fn_box_body -- emitted after the payload -- carries the
# semantics.  A box hands ITSELF to the continuation: pop the continuation,
# push this box with that entry's source, and enter the continuation.
    .macro  fn_box
    j       .+8                      # over the payload, into the body
    .endm

    .macro  fn_box_body
    auipc   t6, 0                    # t6 = the box cell + 8
    jr      s9
    .endm

# fn.y: tie the knot.  Two words at hp: the first points at itself, the second
# is an elink to the top; the redex root is memoized to the knot, the top is
# replaced by it, and we enter the top.
    .macro  fn_y
    FN_DEPTH t4
    beqz    t4, .Lx\@_74
    FN_WV   t4, 0                    # the function
    FN_WS   t5, 0                    # its source
    la      t0, fn_tmp2
    sd      t4, 0(t0)
    sd      t5, 8(t0)
    la      t0, fn_hp
    ld      t1, 0(t0)                # the knot
    FN_WCELL_LINK t1, t1             # ties to itself
    la      t0, fn_tmp2
    ld      t4, 0(t0)
    andi    t4, t4, -4
    la      t0, fn_hp
    ld      t1, 0(t0)
    addi    t6, t1, FN_CELL_LINK
    FN_WCELL_ELINK t6, t4            # then the transfer to the function
    la      t0, fn_hp
    ld      t1, 0(t0)
    addi    t2, t1, FN_CELL_LINK + FN_CELL_ELINK
    sd      t2, 0(t0)
    fence.i
    la      t0, fn_tmp2
    ld      t5, 8(t0)                # the redex root
    beqz    t5, .Lx\@_75
    andi    t5, t5, -4
    FN_MEMO t5, t1                   # memoize it to the knot
.Lx\@_75:
    FN_POPN 1
    la      t0, fn_hp
    ld      t5, 0(t0)
    addi    t5, t5, -(FN_CELL_LINK + FN_CELL_ELINK)
    FN_PUSH t5, t5                   # the knot replaces the top
    la      t0, fn_tmp2
    ld      t4, 0(t0)
    andi    t4, t4, -4
    jr      t4                       # enter the function
.Lx\@_74: la      t4, fn_nfa
    ld      t4, 0(t4)
    jr      t4
    .endm

# The runtime state lives in exactly ONE object, the way a C library defines
# its globals in one .c and every other file sees them through the header.
# An object compiled with -c defines FN_EXTERN_STATE and just references them.
    .ifndef FN_EXTERN_STATE
    .section .data
    .balign 8
    .globl  fn_hp, fn_nfa, fn_frame, fn_rsp
fn_hp:      .dword 0                 # CSR 0x7c0, the allocation pointer
fn_nfa:     .dword 0                 # CSR 0x7c1, the NORMAL_FORM handler
fn_frame:   .word  0                 # CSR 0x7c2, the evaluation frame base
fn_rsp:     .word  0                 # spine depth
fn_tmp:     .dword 0                 # carries a result across a macro's scratch
fn_tmp2:    .dword 0
            .dword 0
    .globl  fn_heapbase, fn_heapend, fn_gclimit, fn_gcverbose
    .globl  fn_rootsp, fn_cafn, fn_cw, fn_car, fn_reductions
    .globl  fn_tmp
    .globl  fn_mp
fn_heapbase: .dword 0                # allocated cells start here
fn_heapend:  .dword 0                # and end here
fn_gclimit:  .dword 0                # a reduction that passes this collects
fn_gcverbose: .word 0                # FUNGC=1 in the environment
fn_rootsp:   .word 0
fn_cafn:     .word 0
fn_reductions: .dword 0               # combinator reductions performed
fn_mp:       .dword 0                # a morphism cell's own address, across
                                     # the scratch the cell writers use
fn_cw:       .word 0                 # the packed combinator word being reduced
fn_car:      .word 0                 # and its arity
             .word 0
    .balign 8
fn_bases:   .space 16*8              # the combinator's base vector
    .section .bss                # the spine is megabytes: keep it out of the
    .balign 8                    # object file
    .globl  fn_sv, fn_ss, fn_roots, fn_caf
fn_sv:      .space FN_SPINE_CAP*8    # spine values
fn_ss:      .space FN_SPINE_CAP*8    # and the cell each came from
fn_roots:   .space (1<<20)*8         # heap references a blob holds across a force
fn_caf:     .space (1<<22)*8         # graph cells a Turner update memoized
    .endif
    .text
