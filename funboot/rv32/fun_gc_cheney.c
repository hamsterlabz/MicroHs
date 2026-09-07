/* fun_gc_cheney.c - a two-space copying collector for the fun runtime.
 *
 * Cheney. No mark bitmap, no start bitmap, no prefix table, no mark stack,
 * and no object-extent oracle that a mark phase and a move phase have to
 * agree about. The to-space IS the work list.
 *
 * The node rule, which is the whole of it:
 *   link / elink  -> copy the target, write the new address back
 *   combi or any other instruction -> just move
 *   fn.databox    -> move the box AND its payload (the payload is DATA and
 *                    is never followed: an Int may look like an address)
 * A block ends at its first elink or at an instruction; the machine reaches
 * a block's later cells by falling through the earlier ones, so nothing
 * points at them and they must travel together.
 *
 * Forwarding pointers live in the from-space cell itself, tagged low2 = 10.
 * That encoding is free: a link is 00, an elink 01, a 32-bit RV instruction
 * 11. A forwarded cell is never executed -- after the flip nothing points
 * into from-space.
 */

typedef unsigned int u32;

#define CSRR(a)    ({ u32 v_; __asm__ __volatile__("csrr %0, " #a : "=r"(v_)); v_; })
#define CSRW(a, v) __asm__ __volatile__("csrw " #a ", %0" :: "r"(v) : "memory")

static inline u32  hp_get(void)       { return CSRR(0x7c0); }
static inline void hp_set(u32 v)      { CSRW(0x7c0, v); }
/* CSR 0x7d3 IS THE ARCHITECTURAL DEPTH, NOT THE LIVE ONE.  Core.Fun exposes
 * fRsp here, and says in as many words that fRsp does not count the nodes the
 * fetch has gathered into the vspine ("fiWinAt now counts the gathered nodes,
 * which fRsp by definition does not yet").  fn.rfence spills those nodes to
 * RSTACK_START along with the rest -- they are IN MEMORY -- but they sit at
 * indices at or above what this CSR reports, so a collector that walks
 * [0, rsp) leaves them holding pre-collection addresses.  The machine then
 * resumes, pops one, and fetches out of the space just evacuated: on Queens
 * at a 1 MiB heap the fetch left the correctly-forwarded box in to-space and
 * went straight to hp-0x34 in from-space, with every root the collector CAN
 * see verified clean.
 *
 * GC_SPINE_SLACK extends every spine walk that far past the reported depth.
 * MEASURED, AND IT IS NOT THE FIX: with slack 8 on Queens at 1 MiB the live
 * set grows by exactly the eight extra slots (0xa00 -> 0xa20) and the machine
 * still resumes into from-space.  So those slots are the stack's own dead
 * tail, not uncounted live entries, and the stale reference the fetch uses is
 * not in RSTACK memory at all -- it is r-cache or IF/ID vspine state that no
 * fence in the collector's reach clears.  DEFAULT 0: walking them only copies
 * phantom blocks.  The knob stays because the measurement is worth repeating
 * against any change to the fetch's spine handling. */
#ifndef GC_SPINE_SLACK
#define GC_SPINE_SLACK 0u
#endif
static inline u32  rsp_get(void)      { return CSRR(0x7d3); }
/* the depth every spine WALK uses: reported depth plus the fetch's uncounted
 * gather window */
static inline u32  rsp_walk(void)     { return rsp_get() + GC_SPINE_SLACK; }
static inline u32  spine_base(void)   { return CSRR(0x7e4); }
static inline u32  gcepc_get(void)    { return CSRR(0x7ff); }
/* THE HARDWARE REMEMBERED SET (Core.Remset).  0x7d9/0x7db are the window, and
 * a store of a pointer INTO that window from an address OUTSIDE it is recorded.
 * Reading is pure -- write 0x7dd to select an index, read 0x7dd for the entry --
 * because a CSR access can be replayed and a destructive read cannot be undone.
 * 0x7df: count [15:0], overflow [16], armed [17]; write bit0 arms the nursery
 * drop, bit1 clears the set. */
static inline void rs_window(u32 lo, u32 hi) { CSRW(0x7d9, lo); CSRW(0x7db, hi); }
static inline u32  rs_stat(void)             { return CSRR(0x7df); }
static inline u32  rs_count(void)            { return rs_stat() & 0xFFFFu; }
static inline int  rs_overflowed(void)       { return (rs_stat() >> 16) & 1; }
static inline int  rs_armed(void)            { return (rs_stat() >> 17) & 1; }
static inline u32  rs_entry(u32 i)           { CSRW(0x7dd, i); return CSRR(0x7dd); }
static inline void rs_clear(void)            { CSRW(0x7df, 2u); }
extern u32 fn_gc_trig;                    /* the SOFTWARE safepoint trigger:
                                           * polled by the arith blobs. CSR
                                           * 0x7fd stays unarmed (see
                                           * startup_perf.S). */
/* AND IT LIVES INSIDE THE STATIC GRAPH.  The codegen emits fn_gc_trig into
 * .text, beside the blob that polls it, so it lands between _fungraph_start
 * and _fungraph_end -- the exact region the collector walks cell by cell,
 * forwarding every word that reads as a link into from-space.
 *
 * The trigger IS such a word by construction: it holds the heap address the
 * next collection fires at, tag 00, always below the frontier.  So every
 * pass called fwd() on it and copied a phantom "block" out of whatever the
 * mutator happened to have allocated at that address -- stamping forwarding
 * pointers across cells that belong to real objects, and claiming a block
 * boundary wherever the walk happened to stop.  On Queens at a 1 MiB heap
 * this shows up as `gcstat: @0x80005c54 0x8046cf60->0x8038cfd4`, 0x80005c54
 * being fn_gc_trig itself.
 *
 * The word is the collector's own state, not a graph cell.  Every walk over
 * the static region skips it: the forwarding walk in roots(), the post-pass
 * verifier, and the fingerprint.  IS_RT_WORD names the rule in one place so
 * the three cannot drift apart. */
/* -DGC_RT_SKIP=0 puts the old behaviour back, so the difference the skip
 * makes can be measured rather than argued about. */
#ifndef GC_RT_SKIP
#define GC_RT_SKIP 1
#endif
#define IS_RT_WORD(p) (GC_RT_SKIP && (u32 *)(p) == &fn_gc_trig)
static inline void trigger_set(u32 v)
{
    fn_gc_trig = v;                 /* the software poll */
    /* AND THE HARDWARE COMPARATOR, IF IT IS ARMED.  Leaving CSR 0x7fd behind is
     * what made an armed guard fail: the comparator is fHp + 64 >= limit, hp is
     * reseeded into the OTHER semispace at the end of a pass, and a limit still
     * holding the previous epoch's value is then permanently exceeded.  Every
     * combinator redirects to GC_ENTRY, the collector re-enters on each one, and
     * after a dozen or so passes the machine is fetching from a semispace that
     * has been abandoned -- which is the forwarding pointer it was seen to
     * execute (mcause=2, mtval in the other space), not a lost update and not
     * stale fetch state.
     *
     * CONDITIONAL, because arming it here unprompted was its own bug once: an
     * image whose startup leaves 0x7fd clear must stay on the software path
     * entirely, or the first collection arrives through the poll, arms the
     * hardware behind its back, and the second lands at _gc_entry and jumps to
     * the software path's resume of 0.  So: keep it in step when armed, never
     * arm it. */
    if (CSRR(0x7fd) != 0) CSRW(0x7fd, v);
}

/* fn.rfence: put the spine in memory and drop it from the r-cache. */
static inline void fn_rfence(void) { __asm__ __volatile__(".word 0x0200205b" ::: "memory"); }
/* AND IT DOES NOT FINISH BEFORE IT RETIRES.  The instruction only RAISES the
 * r-cache's fence flag; the engine then sweeps its 16 lines one at a time,
 * writing each dirty one back over its OWN AXI port -- hundreds of cycles.
 * Only a spine OP stalls on rcBusy (Core.Fun stall1), and the collector runs
 * entirely in RV32 code, so its very next load of the spine races the drain
 * and can read the pre-fence RAM.  GC_FENCE_SPIN is the probe that measures
 * whether that race is the one biting; a real fix belongs in the ISA, not in
 * a delay loop. */
#ifndef GC_FENCE_SPIN
#define GC_FENCE_SPIN 0
#endif
static inline void fn_rfence_wait(void)
{
    fn_rfence();
#if GC_FENCE_SPIN > 0
    { volatile int k; for (k = 0; k < GC_FENCE_SPIN; k++) { } }
#endif
}

extern u32 _heap, _heap_end, _fungraph_start, _fungraph_end, _estack;
extern u32 _fun_frames, _fun_frame_sp;
extern u32 _force_resume;
extern u32 fn_rootsp, fn_cafn, fn_gcverbose;
/* TWO LEVELS, because the two diagnostics differ in cost by two orders of
 * magnitude and only one of them is affordable while chasing a bug.
 *
 *   fn_gcverbose >= 1  the CHEAP verifier: the post-pass scan for a word
 *                      still pointing into the space just evacuated, the
 *                      phase meters, the state dump.  Bounded by the live
 *                      set and the root sets -- microseconds.
 *   fn_gcverbose >= 2  the fingerprint: two full DFS walks of the graph
 *                      per pass plus a 2.5 MB hash-table clear on each,
 *                      ~10 M cycles a pass on a live set of 2.7 KB.  That
 *                      is 20 minutes of simulation per collection, which
 *                      is not a debugging loop.  Ask for it explicitly.
 *
 * fp_live() answers only after fp_run() has populated the cell table, so
 * every diagnostic that consults it belongs at level 2 too. */
#define GC_FP  (fn_gcverbose >= 2u)
extern u32 fn_roots[], fn_caf[];
extern u32 _exc_top;
/* fn.array chain head (FunBlobs _array_next/fn_array_root).  Arrays are
 * Augustsson ioarray structs behind an fn.array header, bump-allocated in
 * the ARRAY HEAP [0xB8000000, _heap_end) ABOVE the copying semispaces: they
 * never move, handles are stable addresses, and every element slot is a
 * root.  Weak: bench images without the thin runtime have no arrays. */
extern u32 fn_array_root __attribute__((weak));
extern u32 tohost;

#define BOXHEAD 0x0000605bu               /* fn.box header, payload follows */
/* The header carries the box length in bits[31:20] (DATABOX_SIZE_SPEC.md), so
 * a header is matched on its low 20 bits and the extent comes from the field;
 * SIZE = 0 encodes one payload word. This replaces a guess that was wrong both
 * ways: skipping payloads lost graph references, following them corrupted
 * integers that merely look like addresses -- which is precisely what codegen
 * boxes, since it emits graph words as data. */
/* EXACT match. The masked form treats any heap word ending in 0x0605b as a
 * header and copies (w>>20) words verbatim, which corrupts live cells; nothing
 * emits a non-zero SIZE yet, so the mask buys nothing and costs false
 * positives. Re-enable the mask only together with an emitter. */
#define HANDLEBOX 0x0010605bu             /* fn.databox SIZE=1: an ARRAY HANDLE.
 * Same one-word layout as SIZE=0; the SIZE bit only marks the payload as a
 * reference-block pointer the collector must trace UNCONDITIONALLY.  The old
 * read-the-target heuristic was order-dependent inside the Cheney sweep and
 * went stale across semispace epochs (mcause=2, 2026-08-12). */
#define IS_BOXHEAD(w)  ((w) == BOXHEAD || (w) == HANDLEBOX)
#define BOX_PAYLOAD(w) (((w) >> 20) ? ((w) >> 20) : 1u)
#define BOX_WORDS(w)   (1u + BOX_PAYLOAD(w))
/* REFERENCE BLOCK: a SOFTWARE structure, not an instruction --
 * [0x0003605b][count][count references]. fn.databox declares its payload to be
 * DATA of a given length and never followed; an array is the opposite, so it
 * carries this header instead and every element is followed. Written by
 * _arr_alloc / _arr_copy in FunBlobs.hs, read here, and nowhere else. */
#define REFBLOCK  0x0003605bu
#define FWD     2u                        /* forwarding tag (low2 = 10)     */

/* GC_MARGIN: how much room the trigger leaves at the end of the semispace.
 *
 * It is NOT one node. The safepoint poll sits at the BOX allocation sites,
 * while the reducer bumps hp for every combi node it allocates with no poll
 * at all, so hp overshoots the trigger by however much the reduction
 * allocates between two boxings. Measured on Braun: 4.4 KB past a 64-byte
 * margin, which put hp beyond the end of from-space -- every root then failed
 * fwd()'s from-space test, nothing was forwarded, and the program livelocked
 * on a graph the collector had quietly abandoned. 64 KB of slack. */
/* MEASURED worst overshoot on Braun: 419,260 bytes -- the reducer ran 410 KB
 * of combi allocation between two box-site polls. 512 KB is above that, with
 * headroom. The bound is WORKLOAD-DEPENDENT and the software poll cannot make
 * it tight; gc_overshoot in the report is what to watch. */
/* scaled: semispace/4, capped at 16 MB -- the fixed 16 MB bound
 * underflowed cap for every heap below 32 MB (small-heap sweeps) */
#define GC_MARGIN  (g_half/4 < 0x1000000u ? g_half/4 : 0x1000000u)
/* (was) 0x1000000u                          16 MB: the poll lives only in the
                                           * arith blobs, so hp overshoots the
                                           * trigger by whatever a stretch
                                           * without arithmetic allocates */
/* DROP_WINDOW: how far back from the frontier the dead-line drop reaches.
 * DEFAULT 0 = OFF, because MEASURED IT DOES NOT PAY. Braun with a 32 KB
 * nursery (GC_STRESS, so the nursery is smaller than the 64 KB h-cache --
 * the only condition under which a dead line can still be resident when the
 * collector rules it dead), 12 passes, answer identical:
 *
 *   drop off: 6,158,334 cyc  38,326 write-backs  957,140 mem stall
 *   drop on : 6,179,329 cyc  33,803 write-backs  942,474 mem stall
 *
 * The mechanism works -- 11.8 % of the write-backs go away -- but it drops
 * 1024 lines x 12 passes = 12,288 lines to remove only 4,523 write-backs
 * (the rest were clean, or already evicted during mutation), and the loop
 * that issues them is SOFTWARE: 12,288 cbo.inval instructions cost more
 * cache-FSM cycles than the RAM traffic they save. Net +0.34 % cycles.
 *
 * The idea is right and the code is correct (gated: Braun GC_STRESS PASS,
 * no gcbad, flite 88/210/1/16383). What it needs is for the drop to be
 * O(1) instead of O(lines) -- a generation tag per line that the flip
 * bumps, or a single range-invalidate -- i.e. hardware. Set DROP_WINDOW to
 * the cache size to re-enable and re-measure against such a change. */
#ifndef DROP_WINDOW
#define DROP_WINDOW 0u
#endif

#ifndef GC_GROW
#define GC_GROW    4u                     /* allocate 4x live between passes */
#endif
#ifndef GC_STEP
#define GC_STEP    0x2000000u              /* and collect every 8 MB rather than
                                           * only when the semispace fills: a
                                           * late first collection is what let
                                           * hp reach the RTL heap ceiling */
#endif

static inline int is_link(u32 w)  { return w != 0 && (w & 3u) == 0u; }
static inline int is_elink(u32 w) { return (w & 3u) == 1u; }
static inline int is_ptr(u32 w)   { return is_link(w) || is_elink(w); }
/* NB tag 10 is NOT free: fn.combi words end in 10 (0x0010e022,
 * 0x01322052, ...). A forwarding pointer is tag 10 AND a to-space
 * payload -- a combi word never points into the live to-space. */
static u32 g_toB, g_toE;   /* current to-space bounds, set per pass */
static inline int is_fwd(u32 w)
{ return (w & 3u) == FWD && (w & ~3u) >= g_toB && (w & ~3u) < g_toE; }

#define UART 0x10011000u
static void gc_putc(u32 c)
{
    volatile unsigned char *u = (volatile unsigned char *)UART;
    while (!(u[0x14] & 0x20)) { }      /* THR empty: the bench UART is 16
                                          cycles/bit and drops anything
                                          written without this poll */
    u[0] = (unsigned char)c;
}
static void gc_puts(const char *s) { while (*s) gc_putc((u32)(unsigned char)*s++); }
static void gc_putx(u32 v)
{
    int i; gc_puts("0x");
    for (i = 28; i >= 0; i -= 4) { u32 d = (v >> i) & 15u; gc_putc(d < 10u ? '0' + d : 'a' + d - 10u); }
}
static void gc_say(const char *m, u32 v) { if (fn_gcverbose) { gc_puts(m); gc_putx(v); gc_putc('\n'); } }
static void gc_die(const char *m) { gc_puts(m); gc_putc('\n'); tohost = 3; for (;;) {} }

static u32 g_stitches;              /* shape-changing splices this pass */

static u32 g_frontier;              /* hp at entry: nothing above it is live */
static u32 g_span;                  /* g_frontier - g_from: fwd()'s one-compare
                                     * live-object window (set per pass) */
static u32 g_lo, g_hi, g_half;      /* the whole region, and one semispace  */
static u32 g_from, g_to;            /* base of each                          */
#if defined(GC_SURVEY) || defined(GC_METER)
#define GC_METER 1
#endif

static u32 g_alloc, g_scan, g_liveBase;
/* where allocation in the CURRENT from-space actually began.  It is not
 * always the semispace base: a pass whose destination had to float (below)
 * leaves the live run starting above it. */
static u32 g_fromLive;
static u32 g_spill;             /* bytes hp ran past the end of from-space */
#ifdef GC_METER
static u32 stw_at[16], stw_n;   /* addresses the static walk rewrote */
static u32 rs_snap[128], rs_snap_n, rs_snap_cnt, rs_snap_ovf, rs_snap_armed;
static u32 rs_miss;             /* walk-rewritten cells the barrier did NOT hold */
static u32 g_epcRaw;            /* GC_EPC as latched, to compare with the graph */
/* WORK UNITS (GC_METER): how often fwd is entered, how often it gets past the range
 * test, how many words the copy loops move, how many scan positions we visit.
 * These turn 180-instructions-per-word into a per-unit cost. */
static u32 n_fwd, n_deep, n_cpyw, n_scan;
#endif

#ifdef GC_SURVEY
/* NURSERY SURVEY -- measurement only, never in a gated image.
 *
 * The question a nursery answers or fails to answer is entirely quantitative:
 * of the bytes allocated in the last N before a collection, how many are still
 * live when the collection comes?  Those are the ones a cache-resident nursery
 * would have to promote (and therefore write to RAM anyway); the rest are the
 * dead-on-arrival writes the nursery is meant to delete.
 *
 * g_sv[k] = words of SURVIVING object copied out of the window
 *           [frontier - 2^(15+k), frontier), cumulative across the run.
 * The denominator is the window itself: allocation is a bump pointer with no
 * gaps, so a window of W bytes held exactly W/4 words.
 *
 * g_oy[k] = pointer cells in a surviving object BELOW the window that point
 *           INTO it: exactly the remembered set a generational barrier would
 *           have to maintain for a nursery of that size.  This is the Turner
 *           update measured -- an old redex root overwritten with the address
 *           of a fresh node -- which both Marlow papers identify as the only
 *           source of old-to-young edges in a lazy language.
 */
#define SVB 8u                                  /* 32K,64K,128K...4M */

static u32 g_sv[SVB], g_oy[SVB], g_svTot, g_oyTot;
static inline void sv_obj(u32 a, u32 n)
{
    u32 d = g_frontier - a, k, w = 0x8000u;
    g_svTot += n;
    for (k = 0; k < SVB; k++, w <<= 1) if (d < w) g_sv[k] += n;
}
static inline void sv_edge(u32 src, u32 c)
{
    u32 t, ds, dt, k, w = 0x8000u;
    if (!is_ptr(c)) return;
    t = c & ~3u;
    if (t - g_from >= g_span) return;          /* not a from-space object */
    ds = g_frontier - src; dt = g_frontier - t;
    g_oyTot++;
    for (k = 0; k < SVB; k++, w <<= 1) if (ds >= w && dt < w) g_oy[k]++;
}
#else
#define sv_obj(a,n)     ((void)0)
#define sv_edge(s,c)    ((void)0)
#endif
/* GC PMCs. fn_gc_cycles runs ONLY inside the collector: started at entry,
 * stopped at exit, accumulated across every pass and never reset. The
 * epilogue reads both out of memory like any other counter row. Stopped
 * BEFORE the debug prints so UART polling is not charged to the GC. */
u32 fn_gc_cycles, fn_gc_count;
/* fn_gc_over: the WORST overshoot seen, hp at entry minus the trigger it
 * passed. The safepoint polls at box allocations only, so this is how far the
 * reducer ran on combi allocations alone before the next poll. It is the
 * lower bound on a safe GC_MARGIN. */
u32 fn_gc_over;         /* to-space bump and Cheney scan pointer */
static u32 g_runs;
static int g_init;

static void space_init(void)
{
    g_lo   = (u32)&_heap;
    /* THE HEAP ENDS WHERE THE LINKER SAYS IT ENDS.  g_hi was hardcoded to
     * 0xB8000000 -- the base of the thin runtime's ARRAY HEAP -- which is the
     * top of the copying region only for an image whose _heap_end lies above
     * it.  A bench image linked with -Wl,--defsym=HEAP_BYTES=N has _heap_end
     * = _heap + N, far below 0xB8000000, and the hardcoded bound made g_half
     * ~448 MB: to-space landed at _heap + 0x1be39880, outside the SoC's RAM
     * decode entirely.  The pass itself completed (those stores went nowhere
     * quietly), then the mutator resumed, FETCHED the copied graph out of the
     * unmapped space, and the bus request never returned -- both stage PCs
     * frozen with every tracker counter idle.  Queens at a 1 MiB heap froze
     * at 0x9c1c7194, which is g_to + live to the byte.  Take the lower of the
     * two bounds: the array heap still caps the semispaces for a thin-runtime
     * image, HEAP_BYTES caps them for a bench image. */
    g_hi   = (u32)&_heap_end;
    if (g_hi > 0xB8000000u) g_hi = 0xB8000000u;
    g_half = ((g_hi - g_lo) / 2u) & ~31u;
    g_from = g_lo;                  /* the runtime started allocating here  */
    g_to   = g_lo + g_half;
    g_fromLive = g_lo;
    g_init = 1;
#ifdef GC_METER
    /* VERIFICATION WINDOW = the whole heap, not a nursery.  Armed this wide the
     * barrier must record every store that puts a heap pointer somewhere
     * outside the heap -- which is a SUPERSET of what the static-graph walk
     * rewrites, so "every address the walk rewrote is in the set" is a real
     * test of the hardware and not a restatement of it.  Armed here rather than
     * at startup, so pass 1 is expected incomplete and is not checked. */
    rs_window(g_lo, g_hi);
#endif
}


/* copy the block at p into to-space if it is not there yet; return its new
   address with the tag preserved */
/* PER-CELL FORWARDING (the ~/work/sw/gc.c scheme): every copied cell gets
 * its own forwarding pointer, so an interior pointer -- an fn.update
 * target, a spine source, an update-queue address -- translates by itself
 * to the exact corresponding cell of the copy. No head search, no bitmap.
 * A copy that starts at a head and runs into a tail some earlier interior
 * reference already moved is STITCHED with an fn.elink to that copy: the
 * walk falls through the elink without pushing, which is exactly what
 * falling through the original cells did. */
/* ALWAYS INLINED: the copy loop calls this once per scanned word, and the
 * call itself was the cost -- prologue, register shuffling, and the three
 * range constants reloaded per call. Inlined, gcc keeps g_from/g_half/
 * g_frontier in registers across the whole scan loop. Measured (puzzlebits
 * pass 0): 5.77M cycles with only 1.1M of memory stalls -- the pass was
 * instruction-bound on per-word dispatch, not miss-bound. */
__attribute__((always_inline)) static inline u32 fwd(u32 p)
{
    u32 a = p & ~3u, tag = p & 3u, w, n, i, dst;
#ifdef GC_METER
    n_fwd++;
#endif
    if (!is_ptr(p)) return p;
    /* ONE span compare replaces three range branches per word.  The old
     * chain was (a < g_from), (a >= g_from + g_half), (a >= g_frontier);
     * g_frontier never exceeds g_from + g_half, so the middle test is
     * subsumed by the third, and unsigned wrap folds the first into the
     * same compare: a below g_from wraps to a huge offset.  NOTHING AT OR
     * ABOVE THE ALLOCATION FRONTIER IS AN OBJECT -- the safepoint poll
     * leaves hp in t1, and the conservative C-stack scan cannot tell that
     * from a graph pointer; following it would copy uninitialised memory
     * as a block AND stamp forwarding pointers over cells at hp. */
    if (a - g_from >= g_span) return p;                 /* static, to-space,
                                                         * or at/past hp */
    w = *(volatile u32 *)a;
    if (is_fwd(w)) return (w & ~3u) | tag;
#ifdef GC_METER
    n_deep++;
#endif
    dst = g_alloc;
    if (IS_BOXHEAD(w) || w == REFBLOCK) {  /* payload is DATA: copy as a unit */
        n = IS_BOXHEAD(w) ? BOX_WORDS(w) : 2u + *(volatile u32 *)(a + 4u);
        /* Copy the unit -- but a cell that is ALREADY forwarded must be
         * translated, not copied. An interior reference (an update target, a
         * spine source) can have moved a cell of this block before the block
         * itself was reached; copying the forwarding pointer verbatim puts it
         * in to-space, where the machine later executes it and traps with
         * mcause=2 on a word tagged 10.
         * ONE sweep, not two: read the cell, translate, store the copy, stamp
         * the forwarding word -- the source line is hot for the stamp, and the
         * copy loop is 95% of a pass (measured tsc/cyc, 2026-08-12). */
        for (i = 0; i < n; i++) {
            u32 c = *(volatile u32 *)(a + i * 4u);
            if (is_fwd(c)) c = (c & ~3u); else sv_edge(a + i * 4u, c);
            *(volatile u32 *)(dst + i * 4u) = c;
            *(volatile u32 *)(a + i * 4u) = (dst + i * 4u) | FWD;
        }
    } else {
        for (i = 0; ; i++) {
            u32 c = *(volatile u32 *)(a + i * 4u);
            if (is_fwd(c)) {             /* tail already moved: stitch */
                g_stitches++;
                *(volatile u32 *)(dst + i * 4u) = (c & ~3u) | 1u;
                i++; break;
            }
            sv_edge(a + i * 4u, c);
            *(volatile u32 *)(dst + i * 4u) = c;
            /* The DOUBLE-COPY probe that used to sit here is gone. It could
             * never fire: c was just read from a + i*4 and the top of the loop
             * already broke out when is_fwd(c), so re-reading the same word
             * cannot report forwarded. What it did cost was real -- gcc kept
             * no copy of fn_gcverbose, so the loop reloaded the flag from
             * memory on EVERY WORD MOVED: lui + lw + beq, 3 of the 15
             * instructions the loop spends per word, one of them a load. */
            *(volatile u32 *)(a + i * 4u) = (dst + i * 4u) | FWD;
            if (is_elink(c) || !is_link(c)) { i++; break; }   /* block end */
        }
        n = i;
    }
    g_alloc = dst + n * 4u;
#ifdef GC_METER
    n_cpyw += n;
#endif
    sv_obj(a, n);
    if (g_alloc > g_to + g_half) gc_die("fun-gc: to-space overflow");
    return dst | tag;
}

/* defined with the fingerprint below, used by the conservative scan here */
static int fp_live(u32 a);
extern u32 fp_unk, fp_kno, fp_stw, fp_snk, fp_stwSave;

/* Phase meters: cycles per roots() section, reported behind fn_gcverbose.
 * The measured split that drove the streamline (puzzlebits pass 0,
 * 2026-08-12): copy 95.4%, static walk 3.6%, cbo 0.4%, all else noise. */
static u32 t_cst, t_spn, t_stc, t_arr;
#ifdef GC_METER
static u32 t_sc1, t_src;   /* copy vs update-source resolution */
#endif

/* static-graph cells rewritten THIS pass: 0 = the static cbo.flush is skipped */
static u32 stw_now;
#if DROP_WINDOW > 0
/* lines dropped (invalidated, not written back) by the last pass */
static u32 g_dropped;
#endif

static void roots(u32 *resume, u32 sp0)
{
    u32 i, rsp = rsp_walk(), b = spine_base();
    u32 tm;

    *resume = fwd(*resume);
    tm = CSRR(0xB00);

    /* THE C STACK IS A ROOT SET. The runtime spills live graph refs there
     * across nested forces (seqBlob saves b with "the collector scans the
     * C stack"), and the save area below sp0 holds the interrupted
     * blob's registers. Conservative by tag+range; fwd() is a no-op for
     * anything outside from-space. */
    for (i = sp0; i < (u32)&_estack; i += 4u) {
        u32 c = *(volatile u32 *)i;
        if (is_ptr(c)) {
            u32 a = c & ~3u, nw;
            /* IS THIS WORD REALLY A POINTER?  The precise DFS above already
             * enumerated every live cell; a word that points at none of them
             * is an integer that merely looks like an address, and rewriting
             * it destroys a value the program is still using. */
            if (GC_FP
                && a >= g_from && a < g_from + g_half && a < g_frontier) {
                if (fp_live(a)) fp_kno++;
                else {
                    if (fp_unk < 6) {
                        gc_puts("gcconsv: @"); gc_putx(i);
                        gc_puts(" = "); gc_putx(c); gc_putc(10);
                    }
                    fp_unk++;
                }
            }
            nw = fwd(c);
            *(volatile u32 *)i = nw;
        }
    }

    t_cst = CSRR(0xB00) - tm; tm = CSRR(0xB00);

    /* both lanes: the value AND the source (the Turner update target).
     * fwd() is interior-safe, so a source or an update address pointing
     * into the middle of a block maps to the copy's same cell. */
    for (i = 0; i < rsp; i++) {
        volatile u32 *v = (volatile u32 *)(b + i * 8u);
        /* THE SOURCE LANE IS AN UPDATE TARGET, and an update target must be a
         * cell of a block something else still points at.  If it is not, fwd()
         * copies it as a block of its own, the update lands in a copy no
         * reader holds, the redex root is never overwritten and the reducer
         * rebuilds the same redex forever -- allocating, never progressing. */
        {   u32 k;
            for (k = 0; k < 2u; k++) {
                u32 c = v[k], a2 = c & ~3u;
                if (GC_FP && is_ptr(c) && a2 >= g_from && a2 < g_from + g_half
                    && a2 < g_frontier && !fp_live(a2)) {
                    if (fp_snk < 8) {
                        gc_puts(k ? "gcsrc: spine.s " : "gcsrc: spine.v ");
                        gc_putx(i); gc_puts(" = "); gc_putx(c); gc_putc(10);
                    }
                    fp_snk++;
                }
            }
        }
        /* VALUE ONLY.  The source lane is resolved after scan() -- see
         * sources() below. */
        v[0] = fwd(v[0]);
    }
    t_spn = CSRR(0xB00) - tm; tm = CSRR(0xB00);
    {   /* the static graph is not copied; its cells are rewritten in place */
        u32 *p = &_fungraph_start, *e = &_fungraph_end;
        while (p < e) {
            u32 w = *p;
            if (IS_RT_WORD(p)) { p++; continue; }   /* collector state, not graph */
            /* a box is DATA of known extent: skip it, never follow it */
            if (IS_BOXHEAD(w)) { p += BOX_WORDS(w); continue; }
            if (w == REFBLOCK)  { u32 c = p[1], k; for (k = 0; k < c; k++) p[2 + k] = fwd(p[2 + k]); p += 2 + c; continue; }
            {   u32 nw = fwd(w);
                /* STORE ONLY WHAT CHANGED. This used to write every word of
                 * the static graph back unconditionally, which dirtied every
                 * line of it on every pass -- so the whole graph was written
                 * to RAM each collection whether or not a single cell moved.
                 * Measured on Braun (GC_STRESS, 12 passes): the collector
                 * owned 67 % of all write-backs and the fixed cost of a pass
                 * was 174,361 cycles, independent of the live set. Most
                 * static cells never point into the heap at all, so most of
                 * that traffic carried unchanged data. */
                if (nw != w) {
                    if (fn_gcverbose && fp_stw < 6) {
                        gc_puts("gcstat: @"); gc_putx((u32)p);
                        gc_puts(" "); gc_putx(w); gc_puts("->"); gc_putx(nw); gc_putc(10);
                    }
                    fp_stw++;
                    stw_now++;          /* per-pass: gates the static cbo.flush */
#ifdef GC_METER
                    if (stw_n < 16u) stw_at[stw_n++] = (u32)p;
#endif
                    *p = nw;
                }
            }
            p++;
        }
    }
    t_stc = CSRR(0xB00) - tm; tm = CSRR(0xB00);
    {   /* THE FRAME STACK IS A ROOT SET. Each 12-byte frame is [resume pc,
         * drain-to spine value, enclosing frame base]. The first two are graph
         * pointers -- _whnf_epi pops a frame, drains the spine comparing
         * against the second and jumps to the first. The third is a spine
         * DEPTH and must be left alone. */
        u32 *f = &_fun_frames, *top = (u32 *)_fun_frame_sp;
        for (; f < top; f += 3) { f[0] = fwd(f[0]); f[1] = fwd(f[1]); }
    }
    {   /* THE ARRAY CHAIN IS A ROOT SET.  Every fn.array node's element
         * slots hold graph references; the nodes themselves never move.
         * Byte arrays are safe under fwd(): a byte value is below the heap
         * and comes back unchanged.  Dead-array sweep (marked/permanent) is
         * future work -- arrays leak until then. */
        if (&fn_array_root) {
            u32 *ar = (u32 *)fn_array_root;
            while (ar) {
                u32 n = ar[4], k;
                for (k = 0; k < n; k++) ar[5 + k] = fwd(ar[5 + k]);
                ar = (u32 *)ar[1];
            }
        }
    }
    t_arr = CSRR(0xB00) - tm;
    /* the standalone forcer's resume is a graph address too */
    _force_resume = fwd(_force_resume);
    for (i = 0; i < fn_rootsp; i++) fn_roots[i] = fwd(fn_roots[i]);
    if (fn_cafn) gc_die("fun-gc: CAF table unsupported in the copying collector");
    {
        u32 *r = (u32 *)_exc_top;
        /* [0]prev [4]depth [8]sp [12]handler [16]continuation [20]frame
         * [24]ENCLOSING FORCER'S RESUME [28]frame_sp.  Words 3 and 4 are not
         * the only graph pointers: word 6 is a saved _force_resume, which
         * _catch_done and _raise both write back to the global.  Forwarding
         * only the global leaves every record installed before this pass
         * holding a from-space resume, and the forcer jumps into evacuated
         * memory the moment that catch returns. */
        while (r) { r[3] = fwd(r[3]); r[4] = fwd(r[4]); r[6] = fwd(r[6]); r = (u32 *)r[0]; }
    }
}

/* UPDATE TARGETS, RESOLVED AGAINST THE CLOSED GRAPH.
 *
 * A spine source is not a reference: it names the cell a Turner update will
 * overwrite.  Forwarding it alongside the value lanes lets it reach a cell
 * before anything that actually references it does, and fwd() then copies a
 * block starting THERE -- from a block interior if that is where the update
 * points, which splits the real block down the stitch path, and from nowhere
 * at all if the target is unreferenced, which spends to-space on a copy no
 * reader holds.  Measured: 8 of 195 sources pointed at cells no other root
 * reaches.
 *
 * Run after scan(), when every referenced cell already carries a forwarding
 * pointer, and fwd() TRANSLATES every live target instead of copying it.
 * Whatever is still unforwarded here was genuinely unreferenced and its
 * update is dead either way. */
static void sources(void)
{
    u32 i, rsp = rsp_walk(), b = spine_base();
    for (i = 0; i < rsp; i++) {
        volatile u32 *v = (volatile u32 *)(b + i * 8u);
        v[1] = fwd(v[1]);
    }
}

static void scan(void)
{
    while (g_scan < g_alloc) {
        u32 w = *(volatile u32 *)g_scan;
#ifdef GC_METER
        n_scan++;
#endif
        /* CELLS DOMINATE: take the pointer path first. At a scan position the
         * word is a box head, a REFBLOCK head, or a cell -- mutually
         * exclusive (a box head's low bits are 11, so is_ptr rejects it) --
         * and the box-head constant compare on every cell was measured
         * dispatch overhead, not safety. */
        if (is_ptr(w)) {
            *(volatile u32 *)g_scan = fwd(w);
            g_scan += 4u;
            continue;
        }
        if (IS_BOXHEAD(w)) {
            /* A box payload is data of known extent -- with one exception the
             * runtime really does create: _arr_alloc and _arr_copy hand an
             * ARENA back inside a box. An reference block is self-identifying (its first
             * word is REFBLOCK, or a forwarding pointer once moved), so that
             * case is recognised rather than guessed: no integer is going to
             * point at a word that is literally REFBLOCK. */
            if (BOX_PAYLOAD(w) == 1u) {
                volatile u32 *q = (volatile u32 *)(g_scan + 4u);
                u32 a2 = *q & ~3u;
                if (is_ptr(*q) && a2 >= g_from && a2 < g_from + g_half
                    && a2 < g_frontier) {
                    u32 t2 = *(volatile u32 *)a2;
                    if (w == HANDLEBOX) {
                        /* a handle's payload IS a refblock base: trace it,
                         * and SAY SO if the header does not read as one --
                         * that would be independent corruption, not a rule. */
                        if (t2 == REFBLOCK || is_fwd(t2)) *q = fwd(*q);
                        else {
                            gc_puts("gcbad: HANDLE->raw @"); gc_putx(g_scan);
                            gc_puts(" -> "); gc_putx(*q);
                            gc_puts(" tgt="); gc_putx(t2); gc_putc(10);
                        }
                    }
                    else if (t2 == REFBLOCK || is_fwd(t2)) *q = fwd(*q);
                }
            }
            g_scan += 4u * BOX_WORDS(w);
            continue;
        }
        if (w == REFBLOCK) {
            u32 c = *(volatile u32 *)(g_scan + 4u), k;
            for (k = 0; k < c; k++) {
                volatile u32 *q = (volatile u32 *)(g_scan + 8u + k * 4u);
                *q = fwd(*q);
            }
            g_scan += 8u + c * 4u;
            continue;
        }
        g_scan += 4u;   /* a non-pointer, non-head word (0, int marker) */
    }
}


/* ---------------------------------------------------------------------------
 * STRUCTURAL FINGERPRINT -- does the copy preserve the graph?
 *
 * Every invariant the collector checks so far is INTERNAL: no cell copied
 * twice, no forwarding word left in to-space, every root in range.  A copy can
 * satisfy all of them and still be wrong, because the property that actually
 * matters is that the new graph is ISOMORPHIC to the old one -- same shape,
 * same sharing, same cycles.  Sharing and cycles are the whole point here:
 * fn.y knots a cell to itself and Turner update rewrites a redex root in
 * place, so a copy that duplicates one shared node turns an update into a
 * write nobody reads and the reducer loops forever on work it already did.
 *
 * So hash the SHAPE, not the addresses.  A DFS numbers each node as it is
 * discovered and mixes that number in when an edge reaches an already-seen
 * node, which makes the hash sensitive to exactly sharing and cycles while
 * being blind to relocation.  Run it over from-space before the copy and
 * to-space after: equal hashes mean the copy is an isomorphism, and a
 * mismatch is proof it is not -- no internal invariant can argue with it.
 * ------------------------------------------------------------------------ */
#define FPN (1u << 17)
static u32 fp_key[FPN], fp_val[FPN];
/* every CELL of every live block, not just block entries: a conservative root
 * that points at no live cell at all was never a pointer. */
#define FPC (1u << 19)
static u32 fp_cell[FPC];
/* FILL GUARDS.  Open addressing with a FULL table probes forever: the mhs
 * codegen phase grew live past 2^17 cells and fp_mark spun 150M+ cycles
 * inside a 24-byte loop (2026-08-11).  Track the load and STOP INSERTING at
 * 7/8 full: fp_ovf goes up, the pass prints FPOVF instead of an iso verdict,
 * and the collector -- which never depended on the fingerprint -- proceeds.
 * A diagnostic may degrade; it may not hang the machine. */
static u32 fp_cn, fp_kn;
static u32 fp_ovf;
u32 fp_unk, fp_kno, fp_stw, fp_snk, fp_stwSave;
static void fp_mark(u32 a)
{
    u32 i;
    if (fp_cn >= FPC - (FPC >> 3)) { fp_ovf++; return; }
    i = ((a >> 2) * 2654435761u) & (FPC - 1u);
    while (fp_cell[i] && fp_cell[i] != a) i = (i + 1u) & (FPC - 1u);
    if (!fp_cell[i]) { fp_cell[i] = a; fp_cn++; }
}
static int fp_live(u32 a)
{
    u32 i = ((a >> 2) * 2654435761u) & (FPC - 1u);
    while (fp_cell[i]) { if (fp_cell[i] == a) return 1; i = (i + 1u) & (FPC - 1u); }
    return 0;
}
static u32 fp_stk[FPN];
static u32 fp_h, fp_n, fp_sp;
static u32 fp_lo, fp_hi, fp_fr;          /* the space this walk is looking at */

static void fp_mix(u32 x) { fp_h = (fp_h ^ x) * 16777619u; }

/* address -> discovery index; 0 means empty, so indices start at 1 */
static u32 *fp_slot(u32 a)
{
    u32 i = ((a >> 2) * 2654435761u) & (FPN - 1u);
    while (fp_key[i] && fp_key[i] != a) i = (i + 1u) & (FPN - 1u);
    return &fp_key[i];
}

/* discover: returns the node's index, and pushes it the first time */
static u32 fp_see(u32 a)
{
    u32 *k;
    if (fp_kn >= FPN - (FPN >> 3)) { fp_ovf++; return 0; }
    k = fp_slot(a);
    if (*k) return fp_val[k - fp_key];
    *k = a; fp_kn++;
    fp_val[k - fp_key] = ++fp_n;
    if (fp_sp < FPN) fp_stk[fp_sp++] = a; else fp_ovf++;
    return fp_n;
}

/* is this word an edge INSIDE the space being walked? */
static int fp_inside(u32 a) { return a >= fp_lo && a < fp_hi && a < fp_fr; }

static void fp_edge(u32 c)
{
    u32 a = c & ~3u;
    if (!is_ptr(c) || !fp_inside(a)) { fp_mix(c); return; }
    fp_mix(0xE0000000u | (c & 3u));
    fp_mix(fp_see(a));
}

static void fp_walk(void)
{
    while (fp_sp) {
        u32 a = fp_stk[--fp_sp], w = *(volatile u32 *)a, i;
        fp_mix(0xA0000000u);
        fp_mark(a);
        if (IS_BOXHEAD(w)) {                    /* payload is DATA */
            u32 n = BOX_WORDS(w);
            fp_mix(w);
            /* one-word boxes may hold a reference block, exactly as scan() */
            if (BOX_PAYLOAD(w) == 1u) {
                u32 q = *(volatile u32 *)(a + 4u), a2 = q & ~3u;
                if (is_ptr(q) && fp_inside(a2)
                    && (w == HANDLEBOX
                        || *(volatile u32 *)a2 == REFBLOCK)) { fp_edge(q); continue; }
            }
            for (i = 1; i < n; i++) { fp_mark(a + i * 4u); fp_mix(*(volatile u32 *)(a + i * 4u)); }
            continue;
        }
        if (w == REFBLOCK) {
            u32 c = *(volatile u32 *)(a + 4u);
            fp_mix(w); fp_mix(c);
            fp_mark(a + 4u);
            for (i = 0; i < c; i++) { fp_mark(a + 8u + i * 4u); fp_edge(*(volatile u32 *)(a + 8u + i * 4u)); }
            continue;
        }
        for (i = 0; ; i++) {                    /* a block, as fwd() reads it */
            u32 c = *(volatile u32 *)(a + i * 4u);
            fp_mark(a + i * 4u);
            fp_edge(c);
            if (is_elink(c) || !is_link(c)) break;
            if (i > 4096u) { fp_ovf++; break; }
        }
    }
}

/* the machine's own live state, in a fixed order, walked identically in both
 * spaces -- roots() rewrites these in place, so re-reading them after the copy
 * yields the to-space graph with no separate bookkeeping. */
static void fp_run(u32 lo, u32 hi, u32 frontier)
{
    u32 i, rsp = rsp_walk(), b = spine_base();
    for (i = 0; i < FPN; i++) fp_key[i] = 0;
    for (i = 0; i < FPC; i++) fp_cell[i] = 0;
    fp_unk = 0; fp_kno = 0; fp_stw = 0; fp_snk = 0; fp_cn = 0; fp_kn = 0;
    fp_h = 2166136261u; fp_n = 0; fp_sp = 0; fp_ovf = 0;
    fp_lo = lo; fp_hi = hi; fp_fr = frontier;

    for (i = 0; i < rsp; i++) {
        volatile u32 *v = (volatile u32 *)(b + i * 8u);
        fp_edge(v[0]); fp_walk();       /* VALUE lane only: the source lane is
                                         * an update TARGET, and whether it is
                                         * referenced is the question. */
    }
    {   /* the static graph references live cells too, so it belongs in the
         * live set -- read only, no rewriting here. */
        u32 *p2 = &_fungraph_start, *e2 = &_fungraph_end;
        while (p2 < e2) {
            u32 w2 = *p2;
            if (IS_RT_WORD(p2)) { p2++; continue; }
            if (IS_BOXHEAD(w2)) { p2 += BOX_WORDS(w2); continue; }
            if (w2 == REFBLOCK) { u32 c2 = p2[1], k2;
                for (k2 = 0; k2 < c2; k2++) { fp_edge(p2[2 + k2]); fp_walk(); }
                p2 += 2 + c2; continue; }
            fp_edge(w2); fp_walk();
            p2++;
        }
    }
    {   u32 *f = &_fun_frames, *top = (u32 *)_fun_frame_sp;
        for (; f < top; f += 3) { fp_edge(f[0]); fp_walk(); fp_edge(f[1]); fp_walk(); }
    }
    if (&fn_array_root) {
        u32 *ar = (u32 *)fn_array_root;
        while (ar) { u32 n2 = ar[4], k2;
            for (k2 = 0; k2 < n2; k2++) { fp_edge(ar[5 + k2]); fp_walk(); }
            ar = (u32 *)ar[1]; }
    }
    fp_edge(_force_resume); fp_walk();
    for (i = 0; i < fn_rootsp; i++) { fp_edge(fn_roots[i]); fp_walk(); }
    {   u32 *r = (u32 *)_exc_top;
        while (r) { fp_edge(r[3]); fp_walk(); fp_edge(r[4]); fp_walk();
                    fp_edge(r[6]); fp_walk(); r = (u32 *)r[0]; }
    }
}

u32 fun_gc_run(u32 sp0)
{
    u32 resume, live, hp0_in, g_liveBase0;
    u32 t_ro = 0, t_sc = 0, t_cb = 0;   /* phase meters (verbose report) */
    u32 t_in = CSRR(0xB00);         /* the GC clock starts here */
#ifdef GC_METER
    u32 i_in = CSRR(0xB02);      /* instructions, to separate too-many-instructions
                                 * from high-CPI as the reason a pass is slow */
#endif
    /* D-cache PMCs across the pass: where the copy's cycles actually go.
     * 0x7e6 dc_fill, 0x7e7 dc_writeback, 0x7d6 stall_mem, 0x7dc stall_ld. */
    u32 p_fl = CSRR(0x7e6), p_wb = CSRR(0x7e7),
        p_sm = CSRR(0x7d6), p_sl = CSRR(0x7dc);
    /* BRING-UP: unconditional, and with the numbers that decide whether the
     * collector can even see the machine's state. */
    gc_puts("[gc ");  gc_putx(hp_get());
    hp0_in = hp_get();
    {   u32 h = hp_get(), tg = fn_gc_trig;
        if (h > tg && (h - tg) > fn_gc_over) fn_gc_over = h - tg;
    }

    fn_rfence_wait();               /* the spine becomes ordinary memory */

    /* DISARM THE CACHE'S DROP RANGE BEFORE COPYING ANYTHING. The space this
     * pass is about to fill is the one the previous pass abandoned and marked
     * droppable; a dirty line of it evicted mid-copy would be thrown away
     * with a live survivor in it. Cleared here, re-armed after the flip. */
    CSRW(0x7d7, 0);

#ifdef GC_METER
    /* snapshot BEFORE the pass disturbs anything */
    rs_snap_n = 0; rs_snap_cnt = rs_count(); rs_snap_ovf = rs_overflowed();
    rs_snap_armed = rs_armed();
    {   u32 k, c = rs_snap_cnt;
        for (k = 0; k < c && k < 128u; k++) {
            u32 e = rs_entry(k);
            if (rs_snap_n < 128u) rs_snap[rs_snap_n++] = e;
        }
    }
#endif
    if (!g_init) space_init();
    g_frontier = hp_get();
    g_span = g_frontier - g_from;
    g_stitches = 0;
    stw_now = 0;
    g_liveBase0 = g_fromLive;           /* where this space's allocation began */
    /* THE MARGIN IS A GUESS, AND IT IS SOMETIMES WRONG.
     *
     * The safepoint poll lives only at box-allocation sites, so hp overshoots
     * the trigger by whatever a poll-free stretch of reduction allocates.  That
     * distance is a property of the PROGRAM, not of the heap -- yet GC_MARGIN
     * is a fraction of the semispace, so it shrinks with the heap while the
     * overshoot does not.  Clausify at a 4 MiB heap overshoots by 597 KB
     * against a 512 KB margin and lands 87,132 bytes into to-space.
     *
     * That used to be fatal ("hp past from-space -- GC_MARGIN too small"), and
     * it need not be.  The spill is ordinary allocation: those cells are live
     * graph, they sit above the semispace boundary, and fwd()'s window is
     * [g_from, hp) -- which already covers them.  The only thing that actually
     * breaks is copying INTO a region the mutator has already filled.  So float
     * the destination: start the copy at hp rather than at g_to whenever hp is
     * the higher of the two.  Source and destination then never overlap, the
     * pass proceeds exactly as before, and the margin goes back to being what
     * it should always have been -- a pacing parameter, not a correctness one.
     *
     * What is left fatal is the case no split can survive: not enough room
     * above the spill for the live set.  The HEAP EXHAUSTED guard below says
     * so with the numbers. */
    /* AND ONLY IN ONE DIRECTION.  A spill is hp running INTO to-space, which
     * can only happen while to-space is the HIGHER half; on the flip back the
     * copy goes downwards and hp, being above from-space's base, is greater
     * than g_to as a matter of course.  Testing hp > g_to alone floated the
     * destination to hp on every downward pass and walked straight into
     * "to-space overflow" (Queens' second collection).  When to-space is the
     * lower half, hp past the top of from-space is past the HEAP, and there is
     * no destination to float to -- that one really is fatal. */
    g_spill = 0;
    /* WHERE TO GO BACK TO. Entered from the allocation guard, the hardware
     * latched GC_EPC = the instruction after the box that tripped it; that
     * address is in emitted static code, which the collector rewrites in
     * place and never moves, so forwarding it is a no-op -- but roots()
     * forwards it anyway so there is one path, not two. Entered from the
     * old software safepoint instead, _gc_safepoint supplies its own return
     * in the saved t0 and this value is unused. */
    /* 0 = entered from the software safepoint, which supplies its own
     * return in the saved t0. Reading GC_EPC here instead is WRONG on that
     * path: the register is stale, roots() forwards whatever is in it, and
     * fwd() then copies whatever that garbage addresses as if it were a
     * graph node. Only the (currently disarmed) allocation guard latches a
     * meaningful GC_EPC -- see ALLOC_GUARD_SPEC. */
    /* GC_EPC IS NOW CONSUMED, WHICH IS WHAT LETS THE TWO ENTRY PATHS COEXIST.
     * The hardware comparator latches a resume address; the software safepoint
     * supplies its own return in the saved t0 and leaves this at 0.  Reading it
     * unconditionally used to be wrong precisely because it was never cleared --
     * a stale value is forwarded as a graph pointer and fwd() copies whatever it
     * addresses.  So: read it, clear it, and let roots() forward it like any
     * other root.  Zero means the software path and stays zero, which is the
     * behaviour every existing image sees. */
    resume = gcepc_get();
    if (resume) CSRW(0x7ff, 0);
#ifdef GC_METER
    g_epcRaw = resume;          /* what the comparator latched, before forwarding */
#endif

    /* THE SPINE STAYS WHERE IT IS: the r-cache spill region, {value,
     * source} pairs, restored IN PLACE by roots() and re-read by the
     * r-cache after the rfence invalidate. */
    {   u32 base = g_to;
        if (g_to > g_from) {                    /* to-space is the upper half */
            if (g_frontier > g_to) {            /* ...and hp spilled into it */
                g_spill = g_frontier - g_to;
                base = (g_frontier + 31u) & ~31u;
            }
        } else if (g_frontier > g_from + g_half) {
            gc_die("fun-gc: hp past the heap end -- raise HEAP_BYTES");
        }
        g_alloc = base;
        g_scan  = base;
        g_liveBase = base;
        g_toB = base; g_toE = g_to + g_half;
    }

    if (fn_gcverbose) {
        gc_puts("gcdbg from "); gc_putx(g_from); gc_puts(" half "); gc_putx(g_half);
        gc_puts(" hp "); gc_putx(hp_get()); gc_puts(" rsp "); gc_putx(rsp_get());
        gc_puts(" sb "); gc_putx(spine_base());
        /* NF_ADDR and the frame base ride along: a machine that resumes into
         * address 0 has either an empty spine and a lost NF_ADDR, or a spine
         * top of 0, and only printing both tells the two apart. */
        gc_puts(" nf "); gc_putx(CSRR(0x7c1));
        gc_puts(" fb "); gc_putx(CSRR(0x7cb)); gc_putc(10);
    }
    /* SHAPE BEFORE (from-space) -- BRING-UP DIAGNOSTIC (fn_gcverbose):
     * two full graph walks + hash tables per pass, 50-100M cycles on MB-scale
     * live sets.  The production image arms fn_gcverbose=0 and pays only for
     * the copy itself. */
    if (GC_FP) fp_run(g_from, g_from + g_half, g_frontier);
    { u32 n0 = fp_n, h0 = fp_h, v0 = fp_ovf;
      u32 tR0 = CSRR(0xB00);
      roots(&resume, sp0);
      t_ro = CSRR(0xB00) - tR0; tR0 = CSRR(0xB00);
      scan();
#ifdef GC_METER
      t_sc1 = CSRR(0xB00) - tR0;
#endif
      sources();        /* update targets, against the closed graph */
#ifdef GC_METER
      t_src = CSRR(0xB00) - tR0 - t_sc1;
#endif
      scan();           /* anything a dead target dragged in */
      t_sc = CSRR(0xB00) - tR0;
      /* SAVE the roots()-phase counters BEFORE the second fp_run resets them.
       * consv= printed fp_kno/fp_unk AFTER that reset, so it read 0/0 on every
       * pass ever logged -- the "no C-stack word points into from-space"
       * conclusion was the instrument reading a cleared counter. */
      if (GC_FP) {
      fp_stwSave = fp_stw; { u32 sk = fp_snk, ck = fp_kno, cu = fp_unk;
      /* SHAPE AFTER (to-space): same roots, now forwarded */
      fp_run(g_to, g_to + g_half, g_alloc);
      gc_puts(" statw="); gc_putx(fp_stwSave);
      gc_puts(" srcbad="); gc_putx(sk);
      gc_puts(" consv="); gc_putx(ck); gc_puts("/"); gc_putx(cu); }
      gc_puts(" shape="); gc_putx(n0); gc_puts("/"); gc_putx(h0);
      gc_puts("->"); gc_putx(fp_n); gc_puts("/"); gc_putx(fp_h);
      if (v0 || fp_ovf) { gc_puts(" FPOVF"); }
      else if (n0 != fp_n || h0 != fp_h)
          gc_puts(" GCBAD-SHAPE-CHANGED");
      else gc_puts(" iso"); } }

    live = g_alloc - g_liveBase;   /* the copied region, BEFORE the flip */

    { u32 t = g_from; g_from = g_to; g_to = t; }   /* flip */
    g_fromLive = g_liveBase;    /* ...and that is where the new from-space's
                                 * allocation run begins */

    /* THE ABANDONED SEMISPACE IS DEAD, AND THE CACHE MUST STOP CARRYING IT
     * TO RAM. After the flip g_to names the space just evacuated: nothing
     * points into it, and a copying collector never leaves live data behind.
     * Every dirty line of it still sitting in the h-cache is therefore pure
     * waste, and measurement says that waste is the bulk of the machine's
     * write traffic -- 71 to 99 per cent of every line the cache writes to
     * RAM is never read back.
     *
     * TWO CSR WRITES, not a loop. The software version of this -- cbo.inval
     * over the evacuated space -- removed 11.8 % of Braun's write-backs and
     * COST 0.34 % in cycles, because 12,288 invalidate instructions are
     * dearer than the RAM traffic they save. The range compare in the
     * eviction path has no instruction cost at all.
     *
     * Sound because it is disarmed on entry to the next pass, above, before
     * that pass copies anything into this space. */
    CSRW(0x7d5, g_to);
    CSRW(0x7d7, g_to + g_half);

    {   /* the spine is NOT coherent with these stores: sv/ss went through
         * the CPU h-cache and the r-cache reads them over its OWN AXI port.
         * 64-byte blocks (Soc.HcacheWord: Vec 16 W32 per line). */
        u32 b, lim, a;
        t_cb = CSRR(0xB00);
        b = spine_base(); lim = b + rsp_walk() * 8u + 64u;
        for (a = b & ~63u; a < lim; a += 64u)
            __asm__ __volatile__("cbo.flush (%0)" :: "r"(a) : "memory");
        __asm__ __volatile__("fence" ::: "memory");
    }
    {   /* THE COPIED GRAPH MUST BE VISIBLE TO EVERY READER. The collector
         * writes to-space with ordinary stores, which land in the CPU
         * h-cache; the fun side reaches the heap over its own path, so a
         * cell still sitting dirty in the cache is a cell some reader sees
         * stale. Write the live region back the same way the spine region
         * is handled, 64-byte blocks (Soc.HcacheWord: Vec 16 W32 per line).
         * Bounded by the LIVE set, not by the heap: a few KB, tens of
         * lines. Without it Queens livelocks after its first pass -- two
         * boxes returning into each other forever -- and merely READING
         * the region (an invariant pass) was enough to hide it. */
        u32 a2, lim2 = g_alloc + 64u;
        for (a2 = g_liveBase & ~63u; a2 < lim2; a2 += 64u)
            __asm__ __volatile__("cbo.flush (%0)" :: "r"(a2) : "memory");
        /* the STATIC graph is rewritten in place by roots() with the same
         * ordinary stores, and it is fetched as code: it needs the same
         * write-back -- but only on a pass that actually rewrote a static
         * cell (stw_now). Most passes rewrite none and skip the walk. */
        if (stw_now) {
            lim2 = (u32)&_fungraph_end + 64u;
            for (a2 = (u32)&_fungraph_start & ~63u; a2 < lim2; a2 += 64u)
                __asm__ __volatile__("cbo.flush (%0)" :: "r"(a2) : "memory");
        }
        /* DROP THE DEAD. The space just evacuated is garbage: after the
         * flip nothing reads it again, and when it is next used as to-space
         * every line is write-validated rather than filled. Any of its lines
         * still sitting dirty in the cache would be written back to RAM on
         * eviction -- 64 bytes of RAM traffic to preserve data that is
         * provably dead. cbo.inval drops them instead.
         *
         * Bounded by the CACHE, not by the space: only what is still
         * resident can cost a write-back, and that is at most the cache
         * (DROP_WINDOW). The tail of the allocation is what is resident,
         * allocation being a bump pointer, so walk back from the frontier.
         *
         * This is why the young generation wants to be cache-sized: with a
         * nursery far larger than the cache, most lines are evicted (and
         * written back) during mutation, long before the collector can rule
         * them dead, and there is nothing left here to drop. */
#if DROP_WINDOW > 0
        {   u32 dead = g_to;                    /* g_to is the space just left */
            u32 top  = hp0_in;                  /* the frontier it reached */
            u32 lo   = (top > dead + DROP_WINDOW) ? top - DROP_WINDOW : dead;
            u32 a3;
            for (a3 = lo & ~63u; a3 < top + 64u; a3 += 64u)
                __asm__ __volatile__("cbo.inval (%0)" :: "r"(a3) : "memory");
            g_dropped = (top - lo) >> 6;
        }
#endif
        __asm__ __volatile__("fence" ::: "memory");
        t_cb = CSRR(0xB00) - t_cb;
    }
    /* POST-PASS VERIFIER.  After the flip nothing anywhere may still point
     * into the space we just evacuated -- any such word is a root set the
     * collector does not know about, and the machine will execute or follow
     * it and meet a forwarding pointer.  Name the region rather than leave it
     * to be inferred from a trap address. */
    /* Verbose-gated AGAIN (2026-08-12): during bring-up it had to be
     * unconditional (a gated verifier reports nothing and reads like a clean
     * bill of health), and unconditional it caught bug 3 (the dangling array
     * handle) one pass before the trap.  The production image turns it off
     * for speed; any GC suspicion starts by arming fn_gcverbose=1. */
    if (fn_gcverbose)
    {   u32 oldFrom = g_to, i2, bad = 0;      /* g_to is the space just left */
        u32 lo = oldFrom, hi = oldFrom + g_half;
/* same frontier rule as fwd(): a word at or above where hp stood is not an
 * object, so hp itself (which the safepoint leaves in t1) is not a finding */
#define BADP(w) (is_ptr(w) && ((w) & ~3u) >= lo && ((w) & ~3u) < hi \
                 && ((w) & ~3u) < g_frontier)
        for (i2 = sp0; i2 < (u32)&_estack; i2 += 4u)
            if (BADP(*(volatile u32 *)i2)) { gc_puts("gcbad: cstack "); gc_putx(i2); gc_putc(10); bad++; }
        {   u32 b2 = spine_base(), n2 = rsp_walk();
            for (i2 = 0; i2 < n2; i2++) {
                volatile u32 *v = (volatile u32 *)(b2 + i2 * 8u);
                if (BADP(v[0])) { gc_puts("gcbad: spine.v "); gc_putx(i2); gc_putc(10); bad++; }
                if (BADP(v[1])) { gc_puts("gcbad: spine.s "); gc_putx(i2); gc_putc(10); bad++; }
            } }
        {   u32 *p2 = &_fungraph_start, *e2 = &_fungraph_end;
            while (p2 < e2) {
                u32 w2 = *p2;
                if (IS_RT_WORD(p2)) { p2++; continue; }
                if (IS_BOXHEAD(w2)) { p2 += BOX_WORDS(w2); continue; }
                if (w2 == REFBLOCK)  { p2 += 2 + p2[1]; continue; }
                if (BADP(w2)) { gc_puts("gcbad: static "); gc_putx((u32)p2); gc_putc(10); bad++; }
                p2++;
            } }
        {   u32 *f2 = &_fun_frames, *t2 = (u32 *)_fun_frame_sp;
            for (; f2 < t2; f2 += 3)
                if (BADP(f2[0]) || BADP(f2[1])) { gc_puts("gcbad: frame "); gc_putx((u32)f2); gc_putc(10); bad++; }
        }
        /* A FORWARDING POINTER LEFT IN TO-SPACE is the failure we keep hitting,
         * and BADP cannot see it: is_ptr matches tags 00 and 01, a forwarding
         * word is tag 10. Look for one explicitly -- any cell in the copied
         * region whose tag is 10 and which addresses the space just evacuated
         * is a word the machine will execute and trap on. */
        for (i2 = g_liveBase; i2 < g_alloc; i2 += 4u) {
            u32 c3 = *(volatile u32 *)i2;
            if ((c3 & 3u) == FWD) {
                u32 t3 = c3 & ~3u;
                if ((t3 >= lo && t3 < hi) || (t3 >= g_from && t3 < g_from + g_half)) {
                    gc_puts("gcbad: FWD-in-tospace at "); gc_putx(i2);
                    gc_puts(" = "); gc_putx(c3);
                    gc_puts(" ctx:");
                    { u32 k4; for (k4 = (i2 >= g_liveBase + 8u) ? i2 - 8u : g_liveBase;
                                   k4 <= i2 + 4u && k4 < g_alloc; k4 += 4u)
                        { gc_puts(k4 == i2 ? " *" : " "); gc_putx(*(volatile u32 *)k4); } }
                    gc_putc(10); bad++;
                }
            }
        }
        for (i2 = g_liveBase; i2 < g_alloc; i2 += 4u)
            if (BADP(*(volatile u32 *)i2)) {
                u32 k3;
                gc_puts("gcbad: tospace "); gc_putx(i2);
                gc_puts(" ctx:");
                for (k3 = (i2 >= g_liveBase + 12u) ? i2 - 12u : g_liveBase;
                     k3 <= i2 + 8u && k3 < g_alloc; k3 += 4u) {
                    gc_puts(k3 == i2 ? " *" : " ");
                    gc_putx(*(volatile u32 *)k3);
                }
                {   u32 tgt = *(volatile u32 *)i2 & ~3u;
                    gc_puts(" tgt@"); gc_putx(tgt);
                    gc_puts("="); gc_putx(*(volatile u32 *)tgt);
                    gc_puts(is_fwd(*(volatile u32 *)tgt) ? " FWD" : " raw");
                }
                gc_putc(10); bad++;
            }
        if (&fn_array_root) {
            u32 *ar = (u32 *)fn_array_root;
            while (ar) { u32 n3 = ar[4], k3;
                for (k3 = 0; k3 < n3; k3++)
                    if (BADP(ar[5 + k3])) { gc_puts("gcbad: array @"); gc_putx((u32)&ar[5 + k3]); gc_putc(10); bad++; }
                ar = (u32 *)ar[1]; } }
        if (BADP(_force_resume)) { gc_puts("gcbad: _force_resume\n"); bad++; }
        /* THE TOP OF THE SPINE, VERBATIM.  The value lane of the top entry is
         * what every WHNF transfer returns through (funFetchTarget's `wv 0`),
         * so if the machine resumes into a bad address this is the first
         * thing to read -- and a zero here is not something BADP can flag,
         * because zero is not a pointer. */
        {   u32 b2 = spine_base(), n2 = rsp_get(), k2;
            gc_puts("gcspine rsp="); gc_putx(n2); gc_puts(" top:");
            for (k2 = 0; k2 < 8u && k2 < n2; k2++) {
                volatile u32 *v = (volatile u32 *)(b2 + (n2 - 1u - k2) * 8u);
                gc_putc(' '); gc_putx(v[0]); gc_putc('@'); gc_putx(v[1]);
            }
            gc_putc(10);
        }
        /* ABOVE THE ARCHITECTURAL DEPTH.  CSR 0x7d3 reports fRsp, and Core.Fun
         * says in as many words that fRsp does not count the nodes the fetch
         * has gathered into the IF/ID vspine.  If the machine resumes on a
         * spine entry the collector never saw, it is at an index at or above
         * rsp -- so look there, and say what is in those slots rather than
         * inferring it from the address the fetch later trapped on. */
        {   u32 b2 = spine_base(), n2 = rsp_walk(), k2;
            for (k2 = 0; k2 < 8u; k2++) {
                volatile u32 *v = (volatile u32 *)(b2 + (n2 + k2) * 8u);
                if (BADP(v[0]) || BADP(v[1])) {
                    gc_puts("gcbad: spine ABOVE rsp +"); gc_putx(k2);
                    gc_puts(" v="); gc_putx(v[0]);
                    gc_puts(" s="); gc_putx(v[1]); gc_putc(10); bad++;
                }
            }
        }
        if (bad) { gc_puts("gcbad: total "); gc_putx(bad); gc_putc(10); }
#undef BADP
    }
    /* THE SPINE REWRITE MUST REACH THE R-CACHE.  fn_rfence() at entry spills
     * the spine to memory, but the r-cache keeps its copies: the collector
     * then rewrites those entries with ordinary stores, and on resume the
     * machine is served the PRE-collection values and jumps into from-space.
     * Fence again, after the rewrite and its write-back, so the r-cache drops
     * what it holds and refills from the corrected memory.  (Found by dumping
     * the spine: the faulting pc was exactly the stale value lane of sp[2].) */
    fn_rfence();

    /* THE VALUE THE SAFEPOINT WILL RESUME ON. _gc_safepoint saves t0 -- the
     * return address into the blob -- at sp0+76 and restores it to jump back.
     * If that still addresses the space just evacuated, the C-stack scan
     * missed it; if it is live, the resume came from somewhere the collector
     * cannot see. Printed every pass so the answer is never inferred from a
     * trap address twenty minutes later. */
    {   u32 t0slot = *(volatile u32 *)(sp0 + 76u);
        u32 a = t0slot & ~3u;
        /* the check runs every pass; the print only when it matters */
        if (a >= g_to && a < g_to + g_half)
            { gc_puts(" resume="); gc_putx(t0slot); gc_puts(" DEAD"); }
        else if (fn_gcverbose)
            { gc_puts(" resume="); gc_putx(t0slot); gc_puts(" ok"); }
    }

    /* THE SPIN LIVES HERE. The RTL pc monitor puts the loop in 0x805524bc-
     * 0x80552abc after pass 5, with writes collapsed: the machine is executing
     * copied graph that points back into itself. Dump the region once so the
     * cycle can be read directly instead of inferred. */

    hp_set(g_alloc);
#ifdef GC_STRESS
    /* THE INTERVAL IS THE LEVER for the drop range. Only lines of the
     * abandoned space still resident in the h-cache can be dropped instead
     * of written back; anything evicted during mutation was already paid
     * for. So the shorter the interval, the more of the dead space is still
     * in the cache when the flip declares it dead -- traded against copying
     * the live set more often. Overridable so that trade can be measured
     * rather than guessed. */
#ifndef GC_STRESS_STEP
#define GC_STRESS_STEP 0x8000u                /* 32 KB */
#endif
    trigger_set(g_alloc + GC_STRESS_STEP);
#else
    {   /* PROPORTIONAL PACING.  A Cheney pass costs time in proportion to the
         * LIVE set, so a fixed step keeps the passes equally frequent while
         * each one gets dearer as the program's live data grows -- on a
         * compiler, whose parse tree only accumulates, that is most of the
         * run.  Allocate a multiple of live between passes instead: GC then
         * stays a bounded fraction of the work however big live gets, with
         * GC_STEP as the floor for small live sets. */
        /* AND A MARGIN THAT LEARNS.  GC_MARGIN is a fraction of the
         * semispace, but the overshoot it has to cover is a property of the
         * PROGRAM -- how much reduction allocates between two box-site polls.
         * Clausify's is 611,420 bytes against a 512 KB static margin, so it
         * spilled 87,132 bytes into to-space on its first pass.  The spill is
         * survivable (the destination floats above hp) but it costs to-space
         * and it will simply happen again at the same trigger.  fn_gc_over is
         * the worst overshoot MEASURED so far: pace against 1.5x that when it
         * exceeds the static floor, and never past the semispace midpoint --
         * beyond there the pacing is not what is wrong. */
        u32 mrg  = GC_MARGIN;
        u32 seen = fn_gc_over + (fn_gc_over >> 1);
        if (seen > mrg) mrg = seen;
        if (mrg > (g_half >> 1)) mrg = g_half >> 1;
        u32 cap  = g_from + g_half - mrg;
        u32 want = live * GC_GROW;
        u32 nxt  = g_alloc + (want > GC_STEP ? want : GC_STEP);
        trigger_set(nxt < cap ? nxt : cap);
    }
#endif

    /* HEAP EXHAUSTION IS A TRAP, NEVER A SILENT DEATH. A pass that leaves
     * the semispace nearly full cannot be followed by useful work: the next
     * trigger fires immediately, every pass copies the same live set, and
     * the program livelocks with no output at all (queens at a 1 MiB heap:
     * live 1,018,388 bytes against a 512 KB semispace, ran to the harness
     * timeout with no tohost). Die loudly instead, with the numbers needed
     * to size the heap. */
    if (live > (g_half - (g_half >> 3))) {          /* > 7/8 of a semispace */
        gc_puts("fun-gc: HEAP EXHAUSTED live="); gc_putx(live);
        gc_puts(" semispace="); gc_putx(g_half);
        gc_puts(" -- raise HEAP_BYTES\n");
        tohost = 3; for (;;) {}
    }
    /* NO-PROGRESS GUARD: two consecutive passes that each reclaim less than
     * an eighth of a semispace are collecting the same graph over and over. */
    {
        static u32 stuck;
        u32 got = (hp0_in - g_liveBase0) - live;
        if (got < (g_half >> 3)) {
            if (++stuck >= 2) {
                gc_puts("fun-gc: NO PROGRESS reclaimed="); gc_putx(got);
                gc_puts(" live="); gc_putx(live);
                gc_puts(" semispace="); gc_putx(g_half);
                gc_puts(" -- raise HEAP_BYTES\n");
                tohost = 3; for (;;) {}
            }
        } else stuck = 0;
    }

    /* one line per pass, always: hp in, live out, and the new trigger. Without
     * these a run that collects once and then dies is indistinguishable from a
     * run whose collector reclaimed nothing. */
    /* one line per pass, always -- but the ESSENTIALS only. The full state
     * dump (over/hp'/trig/rsp/frames/stitch/rsp') rides behind fn_gcverbose:
     * at 16 cycles/bit every extra character is 160 cycles of UART polling
     * charged to the pass. */
    gc_puts(" #"); gc_putx(g_runs);
    gc_puts(" live="); gc_putx(live);
    gc_puts(" reclaimed="); gc_putx((hp0_in - g_liveBase0) - live);
#if DROP_WINDOW > 0
    gc_puts(" drop="); gc_putx(g_dropped);
#endif
    if (g_spill) { gc_puts(" SPILL="); gc_putx(g_spill); }
    gc_puts(" cyc="); gc_putx(CSRR(0xB00) - t_in);
    gc_puts(" fill="); gc_putx(CSRR(0x7e6) - p_fl);
    gc_puts(" wb=");   gc_putx(CSRR(0x7e7) - p_wb);
    gc_puts(" stm=");  gc_putx(CSRR(0x7d6) - p_sm);
    gc_puts(" stl=");  gc_putx(CSRR(0x7dc) - p_sl);
#ifdef GC_METER
    /* THE FIXED COST OF A PASS, split. A generational minor collection
     * pays this on every nursery flip, so if roots() dominates then no
     * survival rate can save a nursery: the WHOLE Braun run is 493,775
     * cycles and one pass here costs 449,633. */
    gc_puts(" ro="); gc_putx(t_ro);
    gc_puts(" sc="); gc_putx(t_sc);
    gc_puts(" cst="); gc_putx(t_cst);
    gc_puts(" spn="); gc_putx(t_spn);
    gc_puts(" stc="); gc_putx(t_stc);
    gc_puts(" arr="); gc_putx(t_arr);
    /* HOW MANY static cells the 215k-cycle walk actually found. If this
     * is a handful, the walk is pure search cost for a set a write
     * barrier would already know -- the same barrier the old-to-young
     * edges need, so one mechanism removes both. */
    gc_puts(" ins="); gc_putx(CSRR(0xB02) - i_in);
    gc_puts(" nfwd="); gc_putx(n_fwd);
    gc_puts(" ndeep="); gc_putx(n_deep);
    gc_puts(" ncpyw="); gc_putx(n_cpyw);
    gc_puts(" nscan="); gc_putx(n_scan);
    gc_puts(" sc1="); gc_putx(t_sc1);
    gc_puts(" src="); gc_putx(t_src);
    gc_puts(" stw="); gc_putx(stw_now);
    gc_puts(" gsz="); gc_putx((u32)&_fungraph_end - (u32)&_fungraph_start);
    /* THE TEST: every cell the walk rewrote must be in the barrier snapshot.
     * rsmiss=0 with rsn>0 means the hardware saw everything the 138k-636k-cycle
     * walk went looking for. */
    {   u32 k, j;
        rs_miss = 0;
        for (k = 0; k < stw_n && k < 16u; k++) {
            int found = 0;
            for (j = 0; j < rs_snap_n; j++) if (rs_snap[j] == stw_at[k]) { found = 1; break; }
            if (!found) rs_miss++;
        }
        gc_puts(" rsarm="); gc_putx(rs_snap_armed);
        gc_puts(" rsn="); gc_putx(rs_snap_cnt);
        gc_puts(" rsovf="); gc_putx(rs_snap_ovf);
        gc_puts(" rsmiss="); gc_putx(rs_miss);
        /* the walk rewrote stw_now static cells DURING this pass; each was a
         * store of a heap pointer to an address outside the heap, so the
         * barrier must have caught them. This is the hardware self-test. */
        gc_puts(" rsend="); gc_putx(rs_count());
        gc_puts(" rsendovf="); gc_putx(rs_overflowed());
        /* THE RESUME, BEFORE AND AFTER FORWARDING.  epcraw is what the fetch
         * latched as the combinator's successor; resume is that address after
         * the compaction moved it.  A resume of 0, or one outside to-space when
         * the raw value was a heap pointer, is the bug rather than a symptom. */
        gc_puts(" epcraw="); gc_putx(g_epcRaw);
        gc_puts(" epcfwd="); gc_putx(resume);
        gc_puts(" toB="); gc_putx(g_to);
        gc_puts(" alloc="); gc_putx(g_alloc);
    }
    rs_clear();
    /* THE SET THE 166k-CYCLE WALK EXISTS TO FIND, against the CAF list the
     * runtime already keeps. If they coincide the walk is redundant. */
    {   u32 k;
        gc_puts(" stwat=");
        for (k = 0; k < stw_n; k++) { gc_putx(stw_at[k]); gc_putc(44); }
        stw_n = 0;
        gc_puts(" cafn="); gc_putx(fn_cafn);
        gc_puts(" caf=");
        for (k = 0; k < fn_cafn && k < 16u; k++) { gc_putx((u32)&fn_caf[k]);
            gc_putc(61); gc_putx(fn_caf[k]); gc_putc(44); }
    }
#endif
#ifdef GC_SURVEY
    /* cumulative, so the LAST line of the run is the answer. Per window:
     * surviving words / remembered-set edges. Denominator is window/4. */
    {   u32 k, w = 0x8000u;
        gc_puts("\nsurvey tot="); gc_putx(g_svTot); gc_puts(" oy="); gc_putx(g_oyTot);
        for (k = 0; k < SVB; k++, w <<= 1) {
            gc_puts("\n  win="); gc_putx(w);
            gc_puts(" live="); gc_putx(g_sv[k]);
            gc_puts(" oy=");   gc_putx(g_oy[k]);
        }
        gc_putc(10);
    }
#endif
    if (fn_gcverbose) {
        gc_puts(" over="); gc_putx(fn_gc_over);
        gc_puts(" hp'="); gc_putx(g_alloc);
        gc_puts(" trig="); gc_putx(fn_gc_trig);
        gc_puts(" rsp="); gc_putx(rsp_get());
        gc_puts(" frames="); gc_putx((_fun_frame_sp - (u32)&_fun_frames) / 12u);
        gc_puts(" stitch="); gc_putx(g_stitches);
        /* THE SPINE MUST SURVIVE THE PASS. Reaching "normal form" means the
         * reducer found the spine empty; if rsp is not what it was on entry,
         * the collector (or the fence around it) destroyed the machine's
         * stack rather than relocating it. */
        gc_puts(" rsp'="); gc_putx(rsp_get());
        gc_puts(" tro="); gc_putx(t_ro);
        gc_puts(" tsc="); gc_putx(t_sc);
        gc_puts(" tcb="); gc_putx(t_cb);
        gc_puts(" tcst="); gc_putx(t_cst);
        gc_puts(" tspn="); gc_putx(t_spn);
        gc_puts(" tstc="); gc_putx(t_stc);
        gc_puts(" tarr="); gc_putx(t_arr);
    }
    gc_puts("]\n");
    /* Say it plainly rather than let the heap walk into the RTL ceiling and
     * halt with a bare 0x7CF: if the live set is most of a semispace, no
     * pacing helps and the answer is a bigger heap or less retention. */
    if (live > (g_half >> 1))
        { gc_puts("fun-gc: live "); gc_putx(live);
          gc_puts(" is over half the semispace "); gc_putx(g_half);
          gc_puts(" -- collection cannot keep up\n"); }
    fn_gc_cycles += CSRR(0xB00) - t_in;   /* ...and pauses here */
    fn_gc_count++;
    g_runs++;
    if (fn_gcverbose) {
        gc_puts("gc#"); gc_putx(g_runs); gc_puts(" live "); gc_putx(live); gc_putc('\n');
    }
    gc_say("fun-gc: hp now ", g_alloc);
    return resume;
}
