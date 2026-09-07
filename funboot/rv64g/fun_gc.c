/* fun_gc.c - the mark-compact collector for the -rv64g fun runtime.
 *
 * Linked alongside the program's .S.  The runtime keeps the machine state in
 * globals (fun_macros.S), so the collector needs no argument: it reads the
 * spine, the shadow root stack, the memoized graph cells and the exception
 * records, and it rewrites all of them.
 *
 * WHEN.  Every combinator reduction checks the heap before it reduces and
 * calls fun_gc() when it is full; at that point the reduction has not touched
 * a base yet, so the only live references are the ones listed above and
 * nothing has to be described about the register state.
 *
 * WHAT AN OBJECT IS.  The heap is bump-allocated 4-byte fun words, and the
 * extents are reconstructed by walking it linearly rather than recorded at
 * allocation time -- every object says what it is in its first word:
 *
 *   [0x0605b][payload]        a box; the payload is DATA (an Int, a Char, a
 *                             float) and is never followed or rewritten
 *   [0x1605b][arena]          a box whose payload is a pointer to an arena
 *   [0x3605b][n][e0..e(n-1)]  an arena: n elements, each a value or a byte
 *   [link]...[elink]          a block: every word is a link or an elink, and
 *                             the block ends at the first elink -- the same
 *                             grouping the reference collector records in
 *                             gc_note_groups()
 *
 * That is what makes a MOVING collector possible here: which words are
 * pointers is known exactly, so relocating one can never corrupt an Int that
 * happened to look like an address.  Byte elements of a ByteString arena are
 * below the heap base and are filtered out by the range test.
 *
 * INTERIOR POINTERS are normal, not an approximation: a spine entry's source
 * is the address of the CELL a value came from, which sits inside a block.
 * Marking rounds them down to the containing object through the start bitmap,
 * and because every word of a live object is marked, the same popcount that
 * gives an object's new address gives an interior address its new address.
 */

typedef unsigned int   u32;
typedef unsigned long  u64;
typedef long           i64;

/* ---- the runtime state (fun_macros.S / the runtime blobs) ---------------- */
extern u64 fn_hp, fn_heapbase, fn_heapend, fn_gclimit;
extern u32 fn_rsp, fn_frame, fn_rootsp, fn_cafn, fn_gcverbose;
extern u64 fn_sv[], fn_ss[], fn_roots[], fn_caf[];
extern u64 _exc_top;
extern u64 _argv_base;

/* The heap holds CODE, so an object is recognised by the instructions it
 * begins with -- exactly the forms a reduction writes:
 *
 *   link  : lui t4,hi ; addi t4,t4,lo ; auipc t5,0 ; addi t5,t5,-8 ; jr s10
 *   elink : lui t4,hi ; addi t4,t4,lo ; jr t4
 *   box   : j .+8 ; payload ; auipc t6,0 ; jr s9   (jr s8 = payload is a ptr)
 *   arena : 0x3605b ; count ; elements...          (data, never entered)
 */
#define I_JOVER 0x0080006fu               /* j .+8                           */
#define I_JR_T4 0x000e8067u               /* jr t4                           */
#define I_JR_S10 0x000d0067u              /* jr s10  (link tail)             */
#define I_JR_S9 0x000c8067u               /* jr s9   (box tail, data)        */
#define I_JR_S8 0x000c0067u               /* jr s8   (box tail, pointer)     */
#define ARENAW  0x0003605bu               /* arena header                    */
#define ARENAD  0x0004605bu               /* data arena: payload is NOT ptrs  */
#define SZ_LINK  5u                       /* in WORDS                        */
#define SZ_ELINK 5u                     /* padded to the common cell size */
#define SZ_BOX   4u

static u32 hw(u64 i);
static void hw_set(u64 i, u32 v);

static inline int is_lui_t4(u32 w) { return (w & 0x7fu) == 0x37u && ((w >> 7) & 0x1fu) == 29u; }

/* the target a lui/addi pair materialises */
static u64 pair_get(u64 i)
{
    i64 hi = (i64)(int)(hw(i) & 0xfffff000u);
    i64 lo = (i64)((int)hw(i + 1) >> 20);
    return (u64)(u32)(hi + lo);
}

static void pair_put(u64 i, u64 x)
{
    u64 hi = (x + 0x800ul) & 0xfffff000ul;
    i64 lo = (i64)x - (i64)hi;
    hw_set(i,     (u32)(hi | (29u << 7) | 0x37u));
    hw_set(i + 1, (u32)(((u32)(lo & 0xfffu) << 20) | (29u << 15) | (29u << 7) | 0x13u));
}
#define MAXOBJ  1024u                     /* defensive cap on a block        */
#define GC_MINBUDGET (32ul << 20)         /* allocate at least this between   */
#define GC_MARGIN    (8ul << 20)          /* passes; keep this much in hand   */
                                          /* for what a blob allocates        */

/* ---- freestanding odds and ends ----------------------------------------- */
static i64 syscall6(i64 n, i64 a, i64 b, i64 c, i64 d, i64 e, i64 f)
{
    register i64 a7 __asm__("a7") = n;
    register i64 a0 __asm__("a0") = a;
    register i64 a1 __asm__("a1") = b;
    register i64 a2 __asm__("a2") = c;
    register i64 a3 __asm__("a3") = d;
    register i64 a4 __asm__("a4") = e;
    register i64 a5 __asm__("a5") = f;
    __asm__ __volatile__("ecall"
                         : "+r"(a0)
                         : "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5), "r"(a7)
                         : "memory");
    return a0;
}

static void *gc_map(u64 len)                     /* anonymous, kernel-placed */
{
    i64 r = syscall6(222, 0, (i64)len, 3, 0x22, -1, 0);
    return (r >= -4095 && r < 0) ? (void *)0 : (void *)r;
}

static void gc_die(const char *m)
{
    u64 n = 0;
    while (m[n]) n++;
    syscall6(64, 2, (i64)m, (i64)n, 0, 0, 0);
    syscall6(93, 70, 0, 0, 0, 0, 0);
}

static void gc_say(const char *m, u64 v)         /* one line, only if asked  */
{
    char b[32];
    int i = 0, j;
    u64 n = 0;
    while (m[n]) n++;
    syscall6(64, 2, (i64)m, (i64)n, 0, 0, 0);
    if (!v) { b[i++] = '0'; }
    while (v) { b[i++] = (char)('0' + v % 10); v /= 10; }
    for (j = 0; j < i / 2; j++) { char t = b[j]; b[j] = b[i-1-j]; b[i-1-j] = t; }
    b[i++] = '\n';
    syscall6(64, 2, (i64)b, i, 0, 0, 0);
}

/* ---- the maps ------------------------------------------------------------ */
static u32 *g_start;                  /* 1 bit per heap word: object starts  */
static u32 *g_mark;                   /* 1 bit per heap word: live           */
static u32 *g_pfx;                    /* live words before each 1024-word run */
static u32 *g_stk;                    /* the mark stack, in object indices   */
static u64  g_stk_n, g_stk_cap;
static u64  g_cap;                    /* heap capacity in words              */
static u64  g_runs;
static int  g_over;                   /* the mark stack overflowed           */

static inline u32 *heap(void)         { return (u32 *)fn_heapbase; }
static inline u64  used(void)         { return (fn_hp - fn_heapbase) >> 2; }
static u32  hw(u64 i)          { return heap()[i]; }
static void hw_set(u64 i, u32 v) { heap()[i] = v; }

static inline int  bit(const u32 *m, u64 i)  { return (m[i >> 5] >> (i & 31)) & 1; }
static inline void bset(u32 *m, u64 i)       { m[i >> 5] |= 1u << (i & 31); }

static void gc_init(void)
{
    g_cap = (fn_heapend - fn_heapbase) >> 2;
    g_start = gc_map((g_cap + 31) / 32 * 4 + 4096);
    g_mark  = gc_map((g_cap + 31) / 32 * 4 + 4096);
    g_pfx   = gc_map((g_cap / 1024 + 2) * 4);
    g_stk_cap = 1u << 22;
    g_stk   = gc_map(g_stk_cap * 4);
    if (!g_start || !g_mark || !g_pfx || !g_stk) {
        gc_die("fun-gc: cannot map the collector maps\n");
    }
    /* FUNGC=1 in the environment turns the one-line summary on.  The
     * environment is where _start left it: argc, argv[], NULL, envp[]. */
    {
        u64 *p = (u64 *)_argv_base;
        if (p) {
            u64 argc = *p++;
            p += argc + 1;
            for (; *p; p++) {
                const char *e = (const char *)*p;
                if (e[0]=='F'&&e[1]=='U'&&e[2]=='N'&&e[3]=='G'&&e[4]=='C'&&
                    e[5]=='='&&e[6]=='1') {
                    fn_gcverbose = 1;
                }
            }
        }
    }
}

static int g_markonly = -1;
static int getenv_marker_only(void)
{
    if (g_markonly < 0) {
        u64 *p = (u64 *)_argv_base;
        g_markonly = 0;
        if (p) {
            u64 argc = *p++;
            p += argc + 1;
            for (; *p; p++) {
                const char *e = (const char *)*p;
                if (e[0]=='F'&&e[1]=='U'&&e[2]=='N'&&e[3]=='M'&&e[4]=='A'&&
                    e[5]=='R'&&e[6]=='K'&&e[7]=='='&&e[8]=='1') g_markonly = 1;
            }
        }
    }
    return g_markonly;
}

static void gc_zero(u32 *m, u64 words)          /* clear a bitmap prefix */
{
    u64 n = (words + 31) / 32, k;
    for (k = 0; k < n; k++) m[k] = 0;
}

/* ---- extents ------------------------------------------------------------- */
static u64 objsize(u64 i, u64 n)
{
    u32 w = hw(i);
    u64 k;
    if (w == I_JOVER)  return SZ_BOX;
    if (w == ARENAW) { u64 c = hw(i + 1); return ((2 + c + 3) / 4) * 4; }
    if (w == ARENAD) { u64 c = hw(i + 1); return ((2 + c + 3) / 4) * 4; }
    if (is_lui_t4(w)) {
        /* A BLOCK, not a cell: the machine reaches a block's later cells by
         * falling through the previous one (_rt_link returns to cell+20), so
         * they are reachable without any pointer to them and must move
         * together.  The block ends at its transfer cell -- the same grouping
         * the reference records in gc_note_groups. */
        for (k = 0; k < MAXOBJ && i + k + 2 < n; k += SZ_LINK) {
            if (hw(i + k + 2) == I_JR_T4) return k + SZ_ELINK;   /* the elink */
            if (!is_lui_t4(hw(i + k))) break;
        }
        return SZ_LINK;
    }
    return 1;                            /* not a cell start: step past it */
}

static void gc_scan_extents(u64 n)
{
    u64 i = 0;
    gc_zero(g_start, n);
    while (i < n) {
        u32 w0 = hw(i);
        if (!(w0 == I_JOVER || w0 == ARENAW || w0 == ARENAD || is_lui_t4(w0))) {
            gc_say("fun-gc: unparseable object at word ", i);
            gc_say("  word = ", w0);
            gc_say("  addr = ", fn_heapbase + i * 4);
            gc_die("fun-gc: heap walk lost sync\n");
        }
        u64 s = objsize(i, n);
        bset(g_start, i);
        i += s;
    }
}

/* ---- mark ---------------------------------------------------------------- */
static void gc_push(u64 a, u64 n)
{
    u64 i, j, back;
    if ((a & 3ul) > 1ul) return;                  /* not a link/elink word */
    a &= ~3ul;
    if (a < fn_heapbase || a >= fn_hp) return;
    i = (a - fn_heapbase) >> 2;
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
        u64 s = objsize(i, n), k;
        for (k = 0; k < s && i + k < n; k++) bset(g_mark, i + k);
    }
    if (g_stk_n == g_stk_cap) { g_over = 1; return; }
    g_stk[g_stk_n++] = (u32)i;
}

static void gc_trace_obj(u64 i, u64 n)
{
    u32 w = hw(i);
    u64 k, sz;
    if (w == I_JOVER) {                          /* a box */
        if (hw(i + 3) == I_JR_S8) gc_push(hw(i + 1), n);   /* payload is a ptr */
        return;                                            /* else it is data */
    }
    if (w == ARENAW) {
        u64 cnt = hw(i + 1);
        for (k = 0; k < cnt; k++) gc_push(hw(i + 2 + k), n);
        return;
    }
    if (w == ARENAD) return;                     /* payload is data, not ptrs */
    if (is_lui_t4(w)) {                          /* every cell of the block */
        sz = objsize(i, n);
        for (k = 0; k + 1 < sz; k += SZ_LINK)
            if (is_lui_t4(hw(i + k))) gc_push(pair_get(i + k), n);
        return;
    }
}

static void gc_drain(u64 n)
{
    while (g_stk_n) gc_trace_obj(g_stk[--g_stk_n], n);
    /* A mark stack overflow is not a failure, only a slower pass: sweep the
     * heap for marked objects whose children are not marked yet, until a pass
     * adds nothing. */
    while (g_over) {
        u64 i = 0;
        g_over = 0;
        while (i < n) {
            u64 s = objsize(i, n);
            if (bit(g_mark, i)) gc_trace_obj(i, n);
            while (g_stk_n) gc_trace_obj(g_stk[--g_stk_n], n);
            i += s;
        }
    }
}

/* the pointer a memoized graph cell holds: FN_MEMO wrote lui/addi/jalr there */
static u64 caf_get(u64 cell)
{
    u32 lui = *(u32 *)cell, adi = *(u32 *)(cell + 4);
    i64 hi = (i64)(int)(lui & 0xfffff000u);
    i64 lo = (i64)((int)adi >> 20);
    return (u64)(u32)(hi + lo);
}

static void caf_put(u64 cell, u64 x)
{
    u32 *p = (u32 *)cell;
    u64 hi = (x + 0x800ul) & 0xfffff000ul;
    i64 lo = (i64)x - (i64)hi;
    p[0] = (u32)(hi | (29u << 7) | 0x37u);
    p[1] = (u32)(((u32)(lo & 0xfffu) << 20) | (29u << 15) | (29u << 7) | 0x13u);
}

static void gc_roots(u64 n)
{
    u32 i;
    for (i = 0; i < fn_rsp; i++) { gc_push(fn_sv[i], n); gc_push(fn_ss[i], n); }
    for (i = 0; i < fn_rootsp; i++) gc_push(fn_roots[i], n);
    for (i = 0; i < fn_cafn; i++) gc_push(caf_get(fn_caf[i]), n);
    {   /* the exception records: a C-stack chain, walked precisely */
        u64 *r = (u64 *)_exc_top;
        /* [0]prev [1]depth [2]sp [3]handler [4]continuation [5]frame
         * [6]SAVED _force_resume [7]rootsp.  Words 3 and 4 are not the only
         * graph pointers: word 6 is the enclosing forcer's resume, which
         * _catch_done and _raise both write back to the global.  Marking only
         * the global leaves every record installed before this pass holding a
         * stale resume, and the forcer jumps into a relocated object the
         * moment that catch returns.  Same defect the rv32 collector had. */
        while (r) { gc_push(r[3], n); gc_push(r[4], n); gc_push(r[6], n);
                    r = (u64 *)r[0]; }
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

static u64 gc_prefix(u64 n)                       /* live words, and the table */
{
    u64 blk = 0, live = 0, i;
    for (i = 0; i < n; i += 1024) {
        u64 k, end = (i + 1024 <= n) ? i + 1024 : n;
        g_pfx[blk++] = (u32)live;
        for (k = i; k < end; k += 32) {
            u32 m = g_mark[k >> 5];
            u64 rest = end - k;
            if (rest < 32) m &= (1u << rest) - 1u;
            live += popcnt(m);
        }
    }
    g_pfx[blk] = (u32)live;
    return live;
}

static u64 gc_new(u64 i)                          /* the new word index of i */
{
    u64 b = i >> 10, k, live = g_pfx[b];
    for (k = b << 10; k + 32 <= i; k += 32) live += popcnt(g_mark[k >> 5]);
    if (k < i) live += popcnt(g_mark[k >> 5] & ((1u << (i - k)) - 1u));
    return live;
}

static u64 gc_fwd(u64 a)
{
    u64 i;
    if ((a & 3ul) > 1ul) return a;
    if ((a & ~3ul) < fn_heapbase || (a & ~3ul) >= fn_hp) return a;
    i = ((a & ~3ul) - fn_heapbase) >> 2;
    if (!bit(g_mark, i)) return a;                /* dead: leave it alone */
    return (fn_heapbase + gc_new(i) * 4ul) | (a & 3ul);
}

/* ---- collect ------------------------------------------------------------- */
void fun_gc(void)
{
    u64 n, live, i, dst;

    if (!g_start) gc_init();
    n = used();
    g_stk_n = 0; g_over = 0;
    gc_zero(g_mark, n);
    gc_scan_extents(n);
    gc_roots(n);
    gc_drain(n);

    /* the mark must be closed: every pointer inside a live object has to
     * point at something live, or a root is missing */
    {
        u64 j = 0;
        while (j < n) {
            u64 sz = objsize(j, n);
            if (bit(g_mark, j) && is_lui_t4(hw(j))) {
                u64 t = pair_get(j) & ~3ul;
                if (t >= fn_heapbase && t < fn_hp) {
                    u64 ti = (t - fn_heapbase) >> 2;
                    if (!bit(g_mark, ti)) {
                        gc_say("fun-gc: live cell points at an UNMARKED object", j);
                        gc_say("  from addr = ", fn_heapbase + j * 4);
                        gc_say("  target    = ", t);
                        gc_die("fun-gc: mark closure violated\n");
                    }
                }
            }
            j += sz;
        }
    }

    live = gc_prefix(n);
    /* rewrite every pointer BEFORE anything moves: the maps still describe the
     * heap as it is */
    for (i = 0; i < fn_rsp; i++) { fn_sv[i] = gc_fwd(fn_sv[i]); fn_ss[i] = gc_fwd(fn_ss[i]); }
    for (i = 0; i < fn_rootsp; i++) fn_roots[i] = gc_fwd(fn_roots[i]);
    for (i = 0; i < fn_cafn; i++) {
        u64 c = fn_caf[i], old = caf_get(c), nw = gc_fwd(old);
        if (nw != old) caf_put(c, nw);
    }
    {
        u64 *r = (u64 *)_exc_top;
        while (r) { r[3] = gc_fwd(r[3]); r[4] = gc_fwd(r[4]);
                    r[6] = gc_fwd(r[6]); r = (u64 *)r[0]; }
    }
    for (i = 0; i < n; ) {
        u64 s = objsize(i, n), k;
        if (bit(g_mark, i)) {
            u32 w = hw(i);
            if (w == I_JOVER) {
                if (hw(i + 3) == I_JR_S8)
                    hw_set(i + 1, (u32)gc_fwd(hw(i + 1)));
            } else if (w == ARENAW) {
                u64 cnt = hw(i + 1);
                for (k = 0; k < cnt; k++)
                    hw_set(i + 2 + k, (u32)gc_fwd(hw(i + 2 + k)));
            } else if (w == ARENAD) {            /* data: nothing to forward */
            } else if (is_lui_t4(w)) {
                for (k = 0; k + 1 < s; k += SZ_LINK)
                    if (is_lui_t4(hw(i + k)))
                        pair_put(i + k, gc_fwd(pair_get(i + k)));
            }
        }
        i += s;
    }

    /* slide.  Objects keep their order, so the destination never runs ahead of
     * the source and a forward copy is safe. */
    dst = 0;
    for (i = 0; i < n; ) {
        u64 s = objsize(i, n), k;
        if (bit(g_mark, i)) {
            if (dst != i) for (k = 0; k < s; k++) hw_set(dst + k, hw(i + k));
            dst += s;
        }
        i += s;
    }

    fn_hp = fn_heapbase + live * 4ul;
    __asm__ __volatile__("fence.i" ::: "memory");   /* the CAF cells are code */

    /* Pace the next collection by what survived rather than by the end of the
     * heap: collecting only when the heap is full costs the whole address
     * space in resident pages, and a reduction that keeps almost nothing --
     * which is the common case -- would pay for touching all of it first. */
    {
        u64 budget = live * 4ul * 2ul;
        u64 room   = (fn_heapend - fn_heapbase) / 2ul;
        if (budget < GC_MINBUDGET) budget = GC_MINBUDGET;
        if (budget > room)         budget = room;
        fn_gclimit = fn_hp + budget;
        if (fn_gclimit > fn_heapend - GC_MARGIN) fn_gclimit = fn_heapend - GC_MARGIN;
    }

    /* verify: after compaction every pointer must land on a live cell start */
    {
        u64 live_n = live, j;
        for (j = 0; j < live_n; ) {
            u64 sz = objsize(j, live_n);
            u32 w0 = hw(j);
            if (!(w0 == I_JOVER || w0 == ARENAW || w0 == ARENAD || is_lui_t4(w0))) {
                gc_say("fun-gc: BAD object after compaction at word ", j);
                gc_say("  word = ", w0);
                gc_die("fun-gc: compaction produced an unparseable heap\n");
            }
            if (is_lui_t4(w0)) {
                u64 t = pair_get(j);
                if (t >= fn_heapbase && t < fn_hp) {
                    u64 ti = (t - fn_heapbase) >> 2;
                    if (!bit(g_start, ti)) {
                        /* the start map still describes the PRE-slide heap, so
                         * only flag targets outside the heap entirely */
                    }
                } else if (t < 0x10000ul) {
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
    if (live * 8ul > g_cap * 7ul) {
        gc_die("fun-gc: heap exhausted (live set does not fit)\n");
    }
}

/* The bare-metal convention the rvfun target uses: a benchmark's main is a
 * value, not an IO action, and the harness reads the answer out of the machine
 * at WHNF.  There is no harness here, so the epilogue reports it -- on stderr,
 * so that a program's own output is exactly what it printed. */
void fun_result(u64 v)
{
    /* the answer is a 32-bit word the epilogue loaded with lw, so it arrives
     * sign-extended: print it as the Int it is */
    i64 x = (i64)(int)v;
    if (x < 0) {
        syscall6(64, 2, (i64)"fun: result -", 13, 0, 0, 0);
        gc_say("", (u64)(-x));
    } else {
        gc_say("fun: result ", (u64)x);
    }
}

/* Debug build only: every blob entry announces itself, with the spine depth,
 * so a divergence can be read as a sequence of runtime calls rather than
 * guessed at from the heap. */
void fun_blob(const char *name)
{
    u64 n = 0;
    char b[24];
    int i = 0, j;
    u32 d = fn_rsp - fn_frame;
    while (name[n]) n++;
    syscall6(64, 2, (i64)"blob ", 5, 0, 0, 0);
    syscall6(64, 2, (i64)name, (i64)n, 0, 0, 0);
    syscall6(64, 2, (i64)" rsp=", 5, 0, 0, 0);
    if (!d) b[i++] = '0';
    while (d) { b[i++] = (char)('0' + d % 10); d /= 10; }
    for (j = 0; j < i / 2; j++) { char t = b[j]; b[j] = b[i-1-j]; b[i-1-j] = t; }
    b[i++] = '\n';
    syscall6(64, 2, (i64)b, i, 0, 0, 0);
}

/* the two payloads a comparison blob actually got */
void fun_blob2(const char *name, u64 a, u64 b)
{
    u64 n = 0;
    while (name[n]) n++;
    syscall6(64, 2, (i64)"blob ", 5, 0, 0, 0);
    syscall6(64, 2, (i64)name, (i64)n, 0, 0, 0);
    gc_say(" a=", a);
    gc_say(" b=", b);
}

/* each combinator reduction: the packed word it decoded and where it went */
void fun_combi_trace(u64 w, u64 tgt)
{
    gc_say("w ", w);
    gc_say("rsp ", fn_rsp);
}

/* Diagnostic: a transfer into the graph must land on a CELL START.  On the
 * rvfun machine every cell is 4 bytes, so "cell+4" is the next cell; here a
 * cell is a macro expansion of 16-24 bytes, and landing 4 bytes in means
 * executing an expansion from its middle.  Every opener is recognisable:
 * fn_link starts auipc t4,0; a combinator starts lui/addi t4; a box starts
 * j .+8; an elink is auipc/jr. */
void fun_check_target(u64 a)
{
    u32 w = *(u32 *)a;
    u32 op = w & 0x7f, rd = (w >> 7) & 0x1f;
    if (op == 0x17 && rd == 29) return;           /* auipc t4  (fn_link/elink) */
    if (op == 0x37 && rd == 29) return;           /* lui   t4  (combinator)    */
    if (op == 0x13 && rd == 29 && ((w >> 15) & 0x1f) == 0) return;  /* li t4   */
    if (w == 0x0080006f) return;                  /* j .+8     (box header)    */
    if (op == 0x6f || op == 0x67) return;         /* a jump                    */
    if (op == 0x17) return;                       /* auipc (other blob code)   */
    gc_say("fun: transfer into a non-cell at ", a);
    gc_say("  word there = ", w);
    syscall6(93, 66, 0, 0, 0, 0, 0);
}

/* Diagnostic: a memoization target must be a CELL START.  With 4-byte cells
 * every address is one; here a cell is 12-20 bytes and writing into the middle
 * of one corrupts it. */
void fun_check_memo(u64 a, u64 pc)
{
    u32 w = *(u32 *)a;
    if (w == I_JOVER || w == ARENAW || w == ARENAD || is_lui_t4(w)) return;
    gc_say("fun: memo into a non-cell at ", a);
    gc_say("  word there = ", w);
    gc_say("  from pc = ", pc);
    syscall6(93, 67, 0, 0, 0, 0, 0);
}

extern char _funtext_end[];
/* Diagnostic: a transfer target must be a cell of the image or of the heap. */
void fun_check_range(u64 a, u64 w)
{
    if (a >= 0x10000ul && a < (u64)_funtext_end) return;
    if (a >= fn_heapbase && a < fn_hp) return;
    gc_say("fun: transfer out of range ", a);
    gc_say("  combi word = ", w);
    gc_say("  hp = ", fn_hp);
    syscall6(93, 68, 0, 0, 0, 0, 0);
}

/* Diagnostic: report a memoization that makes a cell reach ITSELF through
 * indirections -- a black hole the reduction can never leave. */
void fun_check_cycle(u64 cell, u64 val)
{
    u64 t = val & ~3ul, n = 0;
    while (t >= fn_heapbase && t < fn_hp && n < 64) {
        u32 w = *(u32 *)t;
        if (!((w & 0x7fu) == 0x37u && ((w >> 7) & 0x1fu) == 29u)) break;
        if (*(u32 *)(t + 8) != 0x000e8067u) break;        /* not a transfer */
        {
            i64 hi = (i64)(int)(*(u32 *)t & 0xfffff000u);
            i64 lo = (i64)((int)*(u32 *)(t + 4) >> 20);
            t = (u64)(u32)(hi + lo) & ~3ul;
        }
        if (t == (cell & ~3ul)) {
            gc_say("fun: memo closes a cycle at cell ", cell);
            gc_say("  value = ", val);
            gc_say("  after hops = ", n + 1);
            syscall6(93, 69, 0, 0, 0, 0, 0);
        }
        n++;
    }
}

/* Diagnostic:每 cell the walk steps through, and what it pushed. */
void fun_walk(u64 cell, u64 target)
{
    gc_say("walk ", cell);
    gc_say("  push ", target);
}

/* How many combinator reductions the run performed.  Reported on stderr at
 * exit so a program's own output is exactly what it printed. */
extern u64 fn_reductions;
void fun_report_reductions(void)
{
    gc_say("fun: reductions ", fn_reductions);
}
