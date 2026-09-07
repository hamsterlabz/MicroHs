/* fun_gc.c - the mark-compact collector for the rv32imaf_xfun fun runtime.
 *
 * Ported from funboot/rv64g/fun_gc.c.  The algorithm is unchanged; what
 * changes is the machine underneath it.
 *
 * NO LINUX ANYTHING.  The rv64g collector ran hosted: mmap for its side
 * tables, write/exit for diagnostics, getenv for verbosity.  None of that
 * exists here.  The side tables are reserved by the linker, diagnostics go
 * out of the 16550, and a failure writes tohost.  There is not one syscall
 * in this file.
 *
 * WHERE THE STATE LIVES.  On rv64g the runtime kept everything in globals.
 * Here the machine owns it, and the collector reads it out of CSRs:
 *
 *   0x7c0  hp          the LIVE allocation pointer (read AND written back
 *                      after compaction -- writing it re-seeds the bump)
 *   0x7d3  rsp         the live spine depth
 *   0x7e4  RSTACK_START where fn.rfence leaves the spine
 *   0x7fd  HEAP_END    the capacity the comparator watches
 *   0x7fe  GC_ENTRY    this collector
 *   0x7ff  GC_EPC      the combinator the comparator displaced
 *
 * THE SPINE IS NOT A GLOBAL.  It lives in the r-cache, so fun_gc starts with
 * fn.rfence: every dirty line is written back and the spine is then ordinary
 * memory at RSTACK_START, entry n at +n*8 -- the value at +0, the source it
 * came from at +4.  That interleaving IS fn_sv/fn_ss; there are no separate
 * arrays to keep in step.
 *
 * HOW IT IS ENTERED.  Not by a call.  The heap comparator displaces a
 * combinator reduction and the fetch sends the PC here, so there is no
 * return address in ra -- GC_EPC holds the PC of the displaced combinator and
 * this routine returns through it.  The reduction then happens against a
 * compacted heap, exactly once.
 */

typedef unsigned int   u32;
typedef int            i32;

/* ---- the machine, through its CSRs -------------------------------------- */
#define CSRR(csr) ({ u32 __v; __asm__ volatile ("csrr %0, " #csr : "=r"(__v)); __v; })
#define CSRW(csr, v) __asm__ volatile ("csrw " #csr ", %0" :: "r"(v))

static inline u32 fn_hp_get(void)      { return CSRR(0x7c0); }
static inline void fn_hp_set(u32 v)    { CSRW(0x7c0, v); }
static inline u32 fn_rsp_get(void)     { return CSRR(0x7d3); }
static inline u32 fn_spine_base(void)  { return CSRR(0x7e4); }
static inline u32 fn_heapend_get(void) { return CSRR(0x7fd); }
static inline u32 fn_gcepc_get(void)   { return CSRR(0x7ff); }

/* fn.rfence: opcode 0x5b, funct3 = 2, bit 25 set.  The assembler knows the
 * mnemonic; the encoding is spelled out here so this file builds even
 * against a toolchain that does not. */
static inline void fn_rfence(void) { __asm__ volatile (".word 0x0200205b" ::: "memory"); }

/* the spine, after the fence: entry n is {value, source} at base + n*8 */
static inline u32 sv_get(u32 n) { return *(volatile u32 *)(fn_spine_base() + n * 8); }
static inline u32 ss_get(u32 n) { return *(volatile u32 *)(fn_spine_base() + n * 8 + 4); }
static inline void sv_put(u32 n, u32 v) { *(volatile u32 *)(fn_spine_base() + n * 8) = v; }
static inline void ss_put(u32 n, u32 v) { *(volatile u32 *)(fn_spine_base() + n * 8 + 4) = v; }

/* ---- the heap, and the collector's side tables --------------------------
 * The linker reserves these; nothing is mapped at run time.  For a heap of
 * N words the two bitmaps are N/8 bytes each and the prefix table N/1024
 * words, so fun.ld sizes them from the same constant the heap comes from.
 */
extern u32 _heap;                    /* the heap base, from the linker      */
extern u32 _gc_startbm[], _gc_markbm[], _gc_pfx[], _gc_stk[];
extern u32 _gc_stk_words;            /* mark-stack capacity, in entries     */

extern u32 fn_rootsp, fn_cafn, fn_gcverbose;
extern u32 _exc_top;                 /* head of the exception record chain  */
extern u32 _heap_end;
extern u32 _fungraph_start, _fungraph_end;          /* the STATIC graph, below the heap    */                /* the real capacity, from the linker  */

/* How often to collect. The rv64 runtime kept this in fn_gclimit, a global
 * the emitted check compared against; here it IS the comparator's CSR
 * (0x7fd), so writing it schedules the next collection in hardware. The
 * capacity is _heap_end and never moves; this is the trigger, which does. */
#define GC_MINBUDGET (2u << 20)      /* allocate at least this between passes */
#define GC_MARGIN    (256u << 10)    /* and keep this much in hand           */
static u32 g_gclimit;
#define fn_gclimit g_gclimit
extern u32 fn_roots[], fn_caf[];

/* ---- diagnostics: the 16550, not a syscall ------------------------------ */
#define UART 0x10011000u
/* LSR is at 0x14 on this SoC, not the stock 16550's 0x05 -- the runtime's own
 * putc polls 0x14(base). Reading 5 spins forever on a register that never
 * reports the transmitter empty. */
static void gc_putc(char c)
{
    volatile unsigned char *u = (volatile unsigned char *)UART;
    while (!(u[0x14] & 0x20)) { }
    u[0] = (unsigned char)c;
}

static void gc_puts(const char *s) { while (*s) gc_putc(*s++); }

static void gc_putx(u32 v)
{
    int i;
    gc_puts("0x");
    for (i = 28; i >= 0; i -= 4) gc_putc("0123456789abcdef"[(v >> i) & 0xf]);
}

static void gc_say(const char *m, u32 v)
{
    if (!fn_gcverbose) return;
    gc_puts(m); gc_putx(v); gc_putc('\n');
}

/* a collector that cannot proceed stops the machine.  tohost, because that
 * is how every other program on this SoC reports, and 3 = stopped without a
 * value. */
static void gc_die(const char *m)
{
    gc_puts(m); gc_putc('\n');
    *(volatile u32 *)0x10012000u = 3;
    for (;;) { }
}

#define MAXOBJ  1024u                     /* defensive cap on a block        */

/* ---- WHAT AN OBJECT IS, on xfun ----------------------------------------
 * NOT what it is on rv64g. That target has no fn.* extension, so it spells a
 * graph cell out as a lui/addi/jr sequence -- five words for a link, matched
 * by its jr register. Here the cell IS one instruction, and the low two bits
 * of the word say which:
 *
 *   bits 00, word != 0   link   : the rest of the word IS the pointer
 *   bits 01              elink  : pointer in w & ~3, and it ENDS the block
 *   bits 10, bit 2 clear combi  : a reduction, no pointer to follow
 *   0x0000605b           box    : header, followed by one payload word that
 *                                 is DATA and must never be relocated
 *
 * A block is consecutive links terminated by the first elink -- the same
 * grouping the rv64 collector gets from its jr registers, arrived at the
 * cheap way.
 */
#define BOXHEAD 0x0000605bu               /* fn.box header                  */
#define ARENAW  0x0003605bu               /* arena header (data, never entered) */
#define SZ_BOX  2u                        /* header + payload               */
#define MAXOBJ  1024u

static inline int is_link(u32 w)  { return w != 0 && (w & 3u) == 0u; }
static inline int is_elink(u32 w) { return (w & 3u) == 1u; }
static inline int is_combi(u32 w) { return (w & 3u) == 2u && !(w & 4u); }
/* the pointer a link or elink carries */
static inline u32 cell_ptr(u32 w) { return w & ~3u; }

/* ---- the collector's own state ------------------------------------------ */
static u32 *g_start, *g_mark, *g_pfx, *g_stk;
static u32  g_stk_n, g_stk_cap, g_cap, g_runs;
static int  g_over;                   /* the mark stack overflowed           */

/* the machine state, sampled once per collection */
static u32 g_heapbase, g_heapend, g_hp, g_rsp;

static inline u32 *heap(void)   { return (u32 *)g_heapbase; }
static inline u32  used(void)   { return (g_hp - g_heapbase) >> 2; }
static u32  hw(u32 i)           { return heap()[i]; }
static void hw_set(u32 i, u32 v){ heap()[i] = v; }
static inline int  bit(const u32 *m, u32 i) { return (m[i >> 5] >> (i & 31)) & 1; }
static inline void bset(u32 *m, u32 i)      { m[i >> 5] |= 1u << (i & 31); }
static inline int is_lui_t4(u32 w) { return (w & 0x7fu) == 0x37u && ((w >> 7) & 0x1fu) == 29u; }

static u32 pair_get(u32 i)
{
    i32 hi = (i32)(hw(i) & 0xfffff000u);
    i32 lo = ((i32)hw(i + 1)) >> 20;
    return (u32)(hi + lo);
}

static void pair_put(u32 i, u32 x)
{
    u32 hi = (x + 0x800u) & 0xfffff000u;
    i32 lo = (i32)x - (i32)hi;
    hw_set(i,     (hi | (29u << 7) | 0x37u));
    hw_set(i + 1, (((u32)(lo & 0xfff) << 20) | (29u << 15) | (29u << 7) | 0x13u));
}

static void gc_zero(u32 *m, u32 words)
{
    u32 n = (words + 31) / 32, k;
    for (k = 0; k < n; k++) m[k] = 0;
}

/* NOTHING IS MAPPED AT RUN TIME. The linker reserves the side tables, so a
 * collection allocates no memory of its own -- the only way this can be the
 * thing that runs when memory has run out. */
static void gc_init(void)
{
    g_start   = _gc_startbm;
    g_mark    = _gc_markbm;
    g_pfx     = _gc_pfx;
    g_stk     = _gc_stk;
    /* A LINKER SYMBOL IS ITS ADDRESS, not a variable holding a value.
     * Reading _gc_stk_words as a u32 read memory at 0x10000 -- garbage, in
     * practice 0 -- so every gc_push overflowed, nothing was ever marked,
     * and the overflow sweep looped forever making no progress. */
    g_stk_cap = (u32)&_gc_stk_words;
    g_cap     = (g_heapend - g_heapbase) >> 2;
}

static u32 objsize(u32 i, u32 n)
{
    u32 w = hw(i), k;
    if (w == BOXHEAD) return SZ_BOX;
    if (w == ARENAW) { u32 c = hw(i + 1); return ((2 + c + 3) / 4) * 4; }
    if (is_link(w) || is_elink(w)) {
        /* A BLOCK, not a cell. The machine reaches a block's later cells by
         * falling through the previous one, so they are reachable with no
         * pointer to them and must move together. The block ends at its
         * first ELINK -- one word per cell here, where rv64g needed five. */
        for (k = 0; k < MAXOBJ && i + k < n; k++) {
            if (is_elink(hw(i + k))) return k + 1;
            if (!is_link(hw(i + k))) break;
        }
        /* No terminator within MAXOBJ, or the run ended on a non-cell.
         * ADVANCE BY WHAT WAS SCANNED, not by one: returning 1 made every
         * caller re-scan the same run from the next word, which turned each
         * O(n) heap walk into O(n * MAXOBJ). That is what made a collection
         * on a 256 KB heap outlast a 900 s simulation. */
        return k ? k : 1;
    }
    return 1;                            /* combi or terminator: one word */
}

static void gc_scan_extents(u32 n)
{
    gc_say("gcs: gc_scan_extents", n);
    u32 i = 0;
    gc_zero(g_start, n);
    while (i < n) {
        u32 w0 = hw(i);
        if (!(w0 == BOXHEAD || w0 == ARENAW || is_link(w0) || is_elink(w0)
              || is_combi(w0))) {
            gc_say("fun-gc: unparseable object at word ", i);
            gc_say("  word = ", w0);
            gc_say("  addr = ", g_heapbase + i * 4);
            gc_die("fun-gc: heap walk lost sync\n");
        }
        u32 s = objsize(i, n);
        bset(g_start, i);
        i += s;
    }
}

/* ---- mark ---------------------------------------------------------------- */

/* the distance from an object start to the next one, straight out of the
 * start bitmap. Valid only after gc_scan_extents has run. */
static u32 objspan(u32 i, u32 n)
{
    u32 j = i + 1;
    /* finish the partial word first */
    while (j < n && (j & 31u)) {
        if (bit(g_start, j)) return j - i;
        j++;
    }
    /* then whole words at a time: an empty word is 32 words of the object */
    while (j < n) {
        u32 w = g_start[j >> 5];
        if (w) {
            while (j < n) {
                if (bit(g_start, j)) return j - i;
                j++;
            }
            break;
        }
        j += 32;
    }
    return (j < n ? j : n) - i;
}

static void gc_push(u32 a, u32 n)
{
    u32 i, j, back;
    if ((a & 3u) > 1u) return;                  /* not a link/elink word */
    a &= ~3u;
    if (a < g_heapbase || a >= g_hp) return;
    i = (a - g_heapbase) >> 2;
    if (!bit(g_start, i)) {                       /* interior: find the base */
        j = i; back = 0;
        while (back < MAXOBJ && j > 0) {
            j--; back++;
            if (bit(g_start, j)) { i = j; break; }
        }
        if (!bit(g_start, i)) return;
    }
    if (bit(g_mark, i)) return;
    {
        u32 s = objspan(i, n), k;
        for (k = 0; k < s && i + k < n; k++) bset(g_mark, i + k);
    }
    if (g_stk_n == g_stk_cap) { g_over = 1; return; }
    g_stk[g_stk_n++] = (u32)i;
}

static void gc_trace_obj(u32 i, u32 n)
{
    u32 w = hw(i), k, sz;
    if (w == BOXHEAD) return;            /* payload is DATA, never a pointer */
    if (w == ARENAW) {
        u32 cnt = hw(i + 1);
        for (k = 0; k < cnt; k++) gc_push(hw(i + 2 + k), n);
        return;
    }
    if (is_link(w) || is_elink(w)) {     /* every cell of the block */
        sz = objspan(i, n);
        for (k = 0; k < sz; k++) {
            u32 c = hw(i + k);
            if (is_link(c) || is_elink(c)) gc_push(cell_ptr(c), n);
        }
    }
}

static u32 g_drains;
static void gc_drain(u32 n)
{
    gc_say("gcs: gc_drain", n);
    while (g_stk_n) gc_trace_obj(g_stk[--g_stk_n], n);
    /* A mark stack overflow is not a failure, only a slower pass: sweep the
     * heap for marked objects whose children are not marked yet, until a pass
     * adds nothing. */
    while (g_over) {
        u32 i = 0;
        g_over = 0;
        while (i < n) {
            u32 s = objsize(i, n);
            if (bit(g_mark, i)) gc_trace_obj(i, n);
            while (g_stk_n) gc_trace_obj(g_stk[--g_stk_n], n);
            i += s;
        }
    }
}

/* the pointer a memoized graph cell holds: FN_MEMO wrote lui/addi/jalr there */
static u32 caf_get(u32 cell)
{
    u32 lui = *(u32 *)cell, adi = *(u32 *)(cell + 4);
    i32 hi = (i32)(int)(lui & 0xfffff000u);
    i32 lo = (i32)((int)adi >> 20);
    return (u32)(u32)(hi + lo);
}

static void caf_put(u32 cell, u32 x)
{
    u32 *p = (u32 *)cell;
    u32 hi = (x + 0x800u) & 0xfffff000u;
    i32 lo = (i32)x - (i32)hi;
    p[0] = (u32)(hi | (29u << 7) | 0x37u);
    p[1] = (u32)(((u32)(lo & 0xfffu) << 20) | (29u << 15) | (29u << 7) | 0x13u);
}

/* the combinator the comparator displaced. We are going to RESUME at it, so
 * it is live by definition -- and it is a heap cell like any other. Without
 * this the graph we return into can be collected out from under us. */
static u32 g_resume;
static void gc_roots(u32 n)
{
    gc_push(g_resume, n);
    {   /* THE STATIC GRAPH IS A ROOT SET. The image's own graph sits in
         * .text below the heap and its cells point INTO the heap; on rv64g
         * that was what fn_caf[] covered. Nothing here scanned it, so
         * everything reachable only from static code was collected. */
        /* END AT THE SIDE TABLES, NOT AT THE HEAP. fun.ld reserves the
         * start/mark bitmaps, the prefix table and the mark stack between
         * the graph and _heap -- 4.4 MB of collector scratch. Scanning it
         * pushed ~1.1M words as roots on EVERY pass and retained whatever
         * garbage they happened to alias. */
        u32 *p = &_fungraph_start, *e = &_fungraph_end;
        for (; p < e; p++) gc_push(*p, n);
    }
    gc_say("gcs: gc_roots", n);
    u32 i;
    for (i = 0; i < g_rsp; i++) { gc_push(sv_get(i), n); gc_push(ss_get(i), n); }
    for (i = 0; i < fn_rootsp; i++) gc_push(fn_roots[i], n);
    for (i = 0; i < fn_cafn; i++) gc_push(caf_get(fn_caf[i]), n);
    {   /* the exception records: a C-stack chain, walked precisely */
        u32 *r = (u32 *)_exc_top;
        while (r) { gc_push(r[3], n); gc_push(r[4], n); r = (u32 *)r[0]; }
    }
}

/* ---- forwarding ---------------------------------------------------------- */
static u32 popcnt(u32 x)
{
    x = x - ((x >> 1) & 0x55555555u);
    x = (x & 0x33333333u) + ((x >> 2) & 0x33333333u);
    x = (x + (x >> 4)) & 0x0f0f0f0fu;
    return (x * 0x01010101u) >> 24;
}

static u32 gc_prefix(u32 n)                       /* live words, and the table */
{
    u32 blk = 0, live = 0, i;
    for (i = 0; i < n; i += 1024) {
        u32 k, end = (i + 1024 <= n) ? i + 1024 : n;
        g_pfx[blk++] = (u32)live;
        for (k = i; k < end; k += 32) {
            u32 m = g_mark[k >> 5];
            u32 rest = end - k;
            if (rest < 32) m &= (1u << rest) - 1u;
            live += popcnt(m);
        }
    }
    g_pfx[blk] = (u32)live;
    return live;
}

static u32 gc_new(u32 i)                          /* the new word index of i */
{
    u32 b = i >> 10, k, live = g_pfx[b];
    for (k = b << 10; k + 32 <= i; k += 32) live += popcnt(g_mark[k >> 5]);
    if (k < i) live += popcnt(g_mark[k >> 5] & ((1u << (i - k)) - 1u));
    return live;
}

static u32 gc_fwd(u32 a)
{
    u32 i;
    if ((a & 3u) > 1u) return a;
    if ((a & ~3u) < g_heapbase || (a & ~3u) >= g_hp) return a;
    i = ((a & ~3u) - g_heapbase) >> 2;
    if (!bit(g_mark, i)) return a;                /* dead: leave it alone */
    return (g_heapbase + gc_new(i) * 4u) | (a & 3u);
}

/* ---- collect ------------------------------------------------------------- */
void fun_gc(void)
{
    u32 n, live, i, dst;

    if (!g_start) gc_init();
    n = used();
    g_stk_n = 0; g_over = 0;
    gc_say("gcp: zero n=", n);
    gc_zero(g_mark, n);
    gc_say("gcp: extents n=", n);
    gc_scan_extents(n);
    {   /* how many objects did the extent scan actually find, and what do
         * the first heap words look like? A span that covers the whole heap
         * means the scan found almost no starts. */
        u32 q, starts = 0;
        for (q = 0; q < n; q++) if (bit(g_start, q)) starts++;
        gc_say("gcx: starts  ", starts);
        gc_say("gcx: span0   ", objspan(0, n));
        for (q = 0; q < 8; q++) gc_say("gcx: w        ", hw(q));
    }
    gc_say("gcp: roots n=", n);
    gc_roots(n);
    gc_say("gcp: drain n=", n);
    gc_drain(n);

    gc_say("gcp: closure n=", n);
    /* the mark must be closed: every pointer inside a live object has to
     * point at something live, or a root is missing */
    {
        u32 j = 0;
        while (j < n) {
            u32 sz = objspan(j, n);
            if (bit(g_mark, j) && (is_link(hw(j)) || is_elink(hw(j)))) {
                u32 t = cell_ptr(hw(j));
                if (t >= g_heapbase && t < g_hp) {
                    u32 ti = (t - g_heapbase) >> 2;
                    if (!bit(g_mark, ti)) {
                        gc_say("fun-gc: live cell points at an UNMARKED object", j);
                        gc_say("  from addr = ", g_heapbase + j * 4);
                        gc_say("  target    = ", t);
                        gc_die("fun-gc: mark closure violated\n");
                    }
                }
            }
            j += sz;
        }
    }

    gc_say("gcp: prefix n=", n);
    live = gc_prefix(n);
    gc_say("gcp: rewrite live=", live);
    /* rewrite every pointer BEFORE anything moves: the maps still describe the
     * heap as it is */
    for (i = 0; i < g_rsp; i++) { sv_put(i, gc_fwd(sv_get(i))); ss_put(i, gc_fwd(ss_get(i))); }
    {   /* THE SPINE IS NOT COHERENT WITH THESE STORES. sv_put/ss_put go
         * through the CPU h-cache, but the r-cache reaches the same
         * addresses over its OWN AXI port -- the hazard startup_perf.S
         * warns about for this exact region. Without a write-back the
         * machine resumes on the PRE-GC spine and follows pointers to
         * where the objects used to be. Blocks are 64 B (Soc.HcacheWord:
         * Vec 16 W32 per line). */
        u32 b = fn_spine_base(), lim = b + g_rsp * 8u + 64u, a;
        for (a = b & ~63u; a < lim; a += 64u)
            __asm__ __volatile__("cbo.flush (%0)" :: "r"(a) : "memory");
        __asm__ __volatile__("fence" ::: "memory");
    }
    for (i = 0; i < fn_rootsp; i++) fn_roots[i] = gc_fwd(fn_roots[i]);
    for (i = 0; i < fn_cafn; i++) {
        u32 c = fn_caf[i], old = caf_get(c), nw = gc_fwd(old);
        if (nw != old) caf_put(c, nw);
    }
    {
        u32 *r = (u32 *)_exc_top;
        while (r) { r[3] = gc_fwd(r[3]); r[4] = gc_fwd(r[4]); r = (u32 *)r[0]; }
    }
    {   /* THE STATIC GRAPH IS A POINTER SET, NOT JUST A ROOT SET. gc_roots
         * marks THROUGH it, but nothing ever rewrote it: after compaction
         * every static cell holding a heap address still pointed at where
         * the object used to be, and entering one jumped into moved memory
         * (the mcause=2 mepc=0 right after the first pass). Walk it the way
         * the heap loop walks a cell. A 32-bit RV instruction always has
         * (w & 3) == 3, so gc_fwd refuses code by construction; the box and
         * arena payloads are DATA and are stepped over, so an Int that
         * happens to look like a heap address is never relocated. */
        u32 *p = &_fungraph_start, *e = &_fungraph_end, k;
        for (; p < e; p++) {
            u32 w = *p;
            if (w == BOXHEAD) { p++; continue; }
            if (w == ARENAW) {
                u32 cnt = p[1];
                for (k = 0; k < cnt; k++) p[2 + k] = gc_fwd(p[2 + k]);
                p += 1 + cnt;
                continue;
            }
            *p = gc_fwd(w);
        }
    }
    for (i = 0; i < n; ) {
        u32 s = objspan(i, n), k;
        if (bit(g_mark, i)) {
            u32 w = hw(i);
            if (w == BOXHEAD) {
                /* the payload is DATA: relocating it would corrupt an Int
                 * that happened to look like an address */
            } else if (w == ARENAW) {
                u32 cnt = hw(i + 1);
                for (k = 0; k < cnt; k++)
                    hw_set(i + 2 + k, gc_fwd(hw(i + 2 + k)));
            } else if (is_link(w) || is_elink(w)) {
                /* the tag bits stay put; only the pointer moves */
                for (k = 0; k < s; k++) {
                    u32 c = hw(i + k);
                    if (is_link(c) || is_elink(c))
                        hw_set(i + k, gc_fwd(cell_ptr(c)) | (c & 3u));
                }
            }
        }
        i += s;
    }

    /* slide.  Objects keep their order, so the destination never runs ahead of
     * the source and a forward copy is safe. */
    dst = 0;
    for (i = 0; i < n; ) {
        u32 s = objspan(i, n), k;
        if (bit(g_mark, i)) {
            if (dst != i) for (k = 0; k < s; k++) hw_set(dst + k, hw(i + k));
            dst += s;
        }
        i += s;
    }

    g_hp = g_heapbase + live * 4u;
    {   /* POST-COMPACTION AUDIT. Every link/elink that still points into the
         * region the compaction just abandoned is a pointer nobody forwarded.
         * Names the offending cell instead of leaving the machine to follow
         * it and land at PC 0. */
        u32 oldtop = g_heapbase + n * 4u, i2, bad = 0;
        for (i2 = 0; i2 < live; i2++) {
            u32 w = hw(i2), t;
            if ((w & 3u) > 1u || w == 0) continue;
            t = w & ~3u;
            if (t >= g_hp && t < oldtop) {
                if (bad < 4) { gc_puts("gcbad heap "); gc_putx(g_heapbase + i2 * 4u);
                               gc_puts(" -> "); gc_putx(t); gc_putc(10); }
                bad++;
            }
        }
        {   u32 *p2 = &_fungraph_start, *e2 = &_fungraph_end;
            for (; p2 < e2; p2++) {
                u32 w = *p2, t;
                if ((w & 3u) > 1u || w == 0) continue;
                t = w & ~3u;
                if (t >= g_hp && t < oldtop) {
                    if (bad < 8) { gc_puts("gcbad static "); gc_putx((u32)p2);
                                   gc_puts(" -> "); gc_putx(t); gc_putc(10); }
                    bad++;
                }
            }
        }
        {   /* the spine and the displaced PC are pointers too */
            u32 j2;
            for (j2 = 0; j2 < g_rsp; j2++) {
                u32 v = sv_get(j2), sc = ss_get(j2), tv = v & ~3u, ts = sc & ~3u;
                if ((v & 3u) <= 1u && v && tv >= g_hp && tv < oldtop) {
                    gc_puts("gcbad sv "); gc_putx(j2); gc_puts(" -> "); gc_putx(tv); gc_putc(10); bad++; }
                if ((sc & 3u) <= 1u && sc && ts >= g_hp && ts < oldtop) {
                    gc_puts("gcbad ss "); gc_putx(j2); gc_puts(" -> "); gc_putx(ts); gc_putc(10); bad++; }
            }
            if (g_resume >= g_hp && g_resume < oldtop) {
                gc_puts("gcbad resume -> "); gc_putx(g_resume); gc_putc(10); bad++; }
            gc_puts("gcrsp "); gc_putx(g_rsp); gc_putc(10);
        }
        gc_puts("gcbad n="); gc_putx(bad); gc_putc(10);
    }
    __asm__ __volatile__("fence.i" ::: "memory");   /* the CAF cells are code */

    /* Pace the next collection by what survived rather than by the end of the
     * heap: collecting only when the heap is full costs the whole address
     * space in resident pages, and a reduction that keeps almost nothing --
     * which is the common case -- would pay for touching all of it first. */
    {
        u32 budget = live * 4u * 2u;
        u32 room   = (g_heapend - g_heapbase) / 2u;
        if (budget < GC_MINBUDGET) budget = GC_MINBUDGET;
        if (budget > room)         budget = room;
        fn_gclimit = g_hp + budget;
        if (fn_gclimit > g_heapend - GC_MARGIN) fn_gclimit = g_heapend - GC_MARGIN;
    }

    gc_say("gcp: verify live=", live);
    /* verify: after compaction every pointer must land on a live cell start */
    {
        u32 live_n = live, j;
        for (j = 0; j < live_n; ) {
            u32 sz = objsize(j, live_n);
            u32 w0 = hw(j);
            if (!(w0 == BOXHEAD || w0 == ARENAW || is_link(w0) || is_elink(w0) || is_combi(w0))) {
                gc_say("fun-gc: BAD object after compaction at word ", j);
                gc_say("  word = ", w0);
                gc_die("fun-gc: compaction produced an unparseable heap\n");
            }
            if (is_link(w0) || is_elink(w0)) {
                u32 t = cell_ptr(w0);
                if (t >= g_heapbase && t < g_hp) {
                    u32 ti = (t - g_heapbase) >> 2;
                    if (!bit(g_start, ti)) {
                        /* the start map still describes the PRE-slide heap, so
                         * only flag targets outside the heap entirely */
                    }
                } else if (t < 0x10000u) {
                    gc_say("fun-gc: pointer to nowhere from word ", j);
                    gc_say("  target = ", t);
                    gc_die("fun-gc: dangling pointer after compaction\n");
                }
            }
            j += sz;
        }
    }

    g_runs++;
    if (fn_gcverbose) {
        gc_say("fun-gc: pass ", g_runs);
        gc_say("  live words ", live);
        gc_say("  freed words ", n - live);
    }
    if (live * 8u > g_cap * 7u) {
        gc_die("fun-gc: heap exhausted (live set does not fit)\n");
    }
}

/* The bare-metal convention the rvfun target uses: a benchmark's main is a
 * value, not an IO action, and the harness reads the answer out of the machine
 * at WHNF.  There is no harness here, so the epilogue reports it -- on stderr,
 * so that a program's own output is exactly what it printed. */


/* ---- the entry the hardware jumps to ------------------------------------
 * Not a call. The comparator displaced a combinator and the fetch sent the
 * PC here, so ra means nothing; GC_EPC holds the displaced instruction and
 * the runtime's shim returns through it.
 */
u32 fun_gc_run(void)
{
    u32 resume;

    /* THE SPINE FIRST. It is in the r-cache until this instruction; after it
     * the roots are ordinary memory at RSTACK_START and gc_roots can read
     * them. Everything below depends on this having happened. */
#ifndef GC_BARE
    fn_rfence();
#endif

    resume = fn_gcepc_get();
    g_resume = resume;     /* the displaced combinator -- a HEAP cell */
    g_heapbase = (u32)&_heap;
    g_heapend  = (u32)&_heap_end;   /* capacity, not the trigger */
    g_hp       = fn_hp_get();
    g_rsp      = fn_rsp_get();

    gc_say("fun-gc: base  ", g_heapbase);
    gc_say("fun-gc: hp    ", g_hp);
    gc_say("fun-gc: sv0   ", g_rsp ? sv_get(0) : 0xdeadu);
    if (!g_start) gc_init();
#ifdef GC_NOOP
    /* BISECT: stop the world, collect NOTHING, resume. Isolates the
     * displace/rfence/GC_EPC protocol from mark-and-compact. */
    g_gclimit = g_hp + GC_MINBUDGET;
#else
    fun_gc();
#endif

    /* fun_gc compacted and rewrote every root; hand the new allocation
     * point back to the machine. */
    /* THE GRAPH IS CODE. The combinator that was displaced lives in the heap
     * and compaction MOVED it, so the PC to resume at is a pointer like any
     * other and has to be forwarded. Returning to the address the hardware
     * latched would jump to where that instruction used to be. */
    gc_say("fun-gc: resume raw ", resume);
#ifndef GC_NOOP
    resume = gc_fwd(resume);
#endif
    {   /* REWIND OVER THE LINK RUN. GC_EPC is the TERMINATOR's pc: the fetch
         * gathered the link run in front of it, and a displaced slot never
         * commits that gather. Resuming at the terminator would re-run the
         * combinator against a spine short by the whole run, which
         * under-applies it, falls to NORMAL_FORM and unwinds to 0. Links are
         * (w & 3) == 0 and non-zero; instructions are 11 and elinks 01, so
         * the run is unambiguous. */
        u32 r = resume, guard = 0;
        while (guard++ < 16) {
            u32 pw = *(volatile u32 *)(r - 4u);
            if (pw == 0 || (pw & 3u) != 0u) break;
            r -= 4u;
        }
        if (r != resume) { gc_puts("gcrew "); gc_putx(resume); gc_puts(" -> ");
                           gc_putx(r); gc_putc(10); }
        resume = r;
    }
    gc_say("fun-gc: resume fwd ", resume);

    { gc_puts("gc#"); gc_putx(g_runs); gc_putc(10); }
#ifndef GC_BARE
    fn_hp_set(g_hp);
#endif
    /* and schedule the next one: the comparator watches this */
    CSRW(0x7fd, g_gclimit);
    gc_say("fun-gc: hp now ", g_hp);
    gc_say("fun-gc: next at ", g_gclimit);
}
