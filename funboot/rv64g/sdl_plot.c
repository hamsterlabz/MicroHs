/* sdl_plot.c - the C half of the sdl.* blobs.
 *
 * "FFI = asm/C blobs": the graph is native rv64 assembled by gas and linked by
 * ld, so a foreign call is a call.  The asm half (FunBlobs64.effBlobs64) pops
 * its argument, forces it to an unboxed Int in a0 and jumps here; this half
 * talks to SDL.
 *
 * There is no SDL2 development package on this machine -- the runtime
 * libSDL2-2.0.so.0 is there but no headers -- so the entry points used are
 * declared here.  All of them take and return pointers and ints, so no struct
 * layout is depended on; the one struct that appears (SDL_Event) is only ever
 * read through its first word, which is the event type in every SDL2 release,
 * and the buffer is oversized deliberately.
 *
 * No malloc and no dlopen: the pixel buffer is static and the library is
 * linked directly, so this half needs nothing from libc that the dynamic
 * loader has not already set up by the time the graph's _start runs.
 */

typedef unsigned int   u32;
typedef unsigned char  u8;

/* ---- the SDL2 entry points, declared rather than included ---------------- */
extern int   SDL_Init(u32 flags);
extern void *SDL_CreateWindow(const char *title, int x, int y, int w, int h, u32 f);
extern void *SDL_CreateRenderer(void *win, int index, u32 flags);
extern void *SDL_CreateTexture(void *ren, u32 format, int access, int w, int h);
extern int   SDL_UpdateTexture(void *tex, const void *rect, const void *pix, int pitch);
extern int   SDL_RenderClear(void *ren);
extern int   SDL_RenderCopy(void *ren, void *tex, const void *src, const void *dst);
extern void  SDL_RenderPresent(void *ren);
extern int   SDL_PollEvent(void *event);
extern void  SDL_Delay(u32 ms);
extern void  SDL_Quit(void);
extern const char *SDL_GetError(void);
extern void *SDL_CreateRGBSurfaceFrom(void *pixels, int w, int h, int depth, int pitch,
                                      u32 rmask, u32 gmask, u32 bmask, u32 amask);
extern void *SDL_RWFromFile(const char *file, const char *mode);
extern int   SDL_SaveBMP_RW(void *surface, void *dst, int freedst);
extern void  SDL_FreeSurface(void *surface);

#define SDL_INIT_VIDEO        0x00000020u
#define SDL_WINDOWPOS_CENTERED 0x2FFF0000u
#define SDL_WINDOW_SHOWN      0x00000004u
/* SDL_DEFINE_PIXELFORMAT(ARRAYU8=6, ARRAYORDER_RGB=1, 0, 24, 3) */
#define SDL_PIXELFORMAT_RGB24 0x17101803u
#define SDL_TEXTUREACCESS_STATIC 0
#define SDL_QUIT_EVENT        0x100u
#define SDL_KEYDOWN_EVENT     0x300u

/* Output lands in the project tree, in a directory named for the program.
 * Never /tmp.  Both are set by build_plot.sh; the defaults just keep this
 * file compilable on its own. */
#ifndef OUTDIR
#define OUTDIR "/home/cecil/work/MicroHs/funboot/rv64g/mandel/"
#endif
#ifndef PLOTBASE
#define PLOTBASE "plot"
#endif

#define MAXW 2048
#define MAXH 2048
static u8   g_pix[MAXW * MAXH * 3];
static int  g_w, g_h;
static long g_cursor;                 /* pixels written so far, row-major */
static void *g_win, *g_ren, *g_tex;
static int  g_live;

/* write(2) without libc: this half must not assume stdio is up */
static long sys_write(long fd, const void *buf, long n)
{
    register long a0 __asm__("a0") = fd;
    register long a1 __asm__("a1") = (long)buf;
    register long a2 __asm__("a2") = n;
    register long a7 __asm__("a7") = 64;
    __asm__ __volatile__("ecall" : "+r"(a0) : "r"(a1), "r"(a2), "r"(a7) : "memory");
    return a0;
}
static void say(const char *s)
{
    long n = 0; while (s[n]) n++;
    sys_write(2, s, n);
}

/* A colour for an escape count.  The graph hands over the iteration count and
 * the ramp lives here, so the Haskell side stays the mandelbrot and nothing
 * else. */
static void ramp(long v, u8 *out)
{
    if (v <= 0) { out[0] = 0; out[1] = 0; out[2] = 0; return; }   /* inside */
    out[0] = (u8)((v * 9)  & 0xff);
    out[1] = (u8)((v * 23) & 0xff);
    out[2] = (u8)((v * 61) & 0xff);
}

/* sdl.open: a0 = (width << 16) | height */
long sdl_open(long packed)
{
    g_w = (int)((packed >> 16) & 0xffff);
    g_h = (int)(packed & 0xffff);
    if (g_w <= 0 || g_h <= 0 || g_w > MAXW || g_h > MAXH) { say("sdl: bad size\n"); return -1; }
    g_cursor = 0;
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        say("sdl: init failed: "); say(SDL_GetError()); say("\n"); return -1;
    }
    g_win = SDL_CreateWindow("mandelbrot (mhs, fun backend)",
                             SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                             g_w, g_h, SDL_WINDOW_SHOWN);
    if (!g_win) { say("sdl: no window: "); say(SDL_GetError()); say("\n"); return -1; }
    g_ren = SDL_CreateRenderer(g_win, -1, 0);
    if (!g_ren) { say("sdl: no renderer\n"); return -1; }
    g_tex = SDL_CreateTexture(g_ren, SDL_PIXELFORMAT_RGB24,
                              SDL_TEXTUREACCESS_STATIC, g_w, g_h);
    if (!g_tex) { say("sdl: no texture\n"); return -1; }
    g_live = 1;
    return 0;
}

/* sdl.put: a0 = the escape count for the NEXT pixel, row-major.  Streaming
 * suits the generator: mandelset produces its points in exactly that order,
 * so no coordinate has to be carried across the call. */
long sdl_put(long v)
{
    if (g_cursor >= (long)g_w * g_h) return g_cursor;
    ramp(v, &g_pix[g_cursor * 3]);
    g_cursor++;
    /* show the image as it fills, a row at a time */
    if (g_live && (g_cursor % g_w) == 0) {
        SDL_UpdateTexture(g_tex, 0, g_pix, g_w * 3);
        SDL_RenderClear(g_ren);
        SDL_RenderCopy(g_ren, g_tex, 0, 0);
        SDL_RenderPresent(g_ren);
    }
    return g_cursor;
}

/* Dump what the graph actually drew, as a binary PPM.  Raw syscalls: this
 * half must not assume stdio, and a file on disk is the only proof of the
 * picture that survives a headless run. */
static long sys_open(const char *path, long flags, long mode)
{
    register long a0 __asm__("a0") = -100;          /* AT_FDCWD */
    register long a1 __asm__("a1") = (long)path;
    register long a2 __asm__("a2") = flags;         /* O_WRONLY|O_CREAT|O_TRUNC */
    register long a3 __asm__("a3") = mode;
    register long a7 __asm__("a7") = 56;            /* openat */
    __asm__ __volatile__("ecall" : "+r"(a0) : "r"(a1), "r"(a2), "r"(a3), "r"(a7) : "memory");
    return a0;
}
static void sys_close(long fd)
{
    register long a0 __asm__("a0") = fd;
    register long a7 __asm__("a7") = 57;
    __asm__ __volatile__("ecall" : "+r"(a0) : "r"(a7) : "memory");
}
static void dump_ppm(void)
{
    char hdr[64]; int i = 0, d; long fd;
    const char *m = "P6\n";
    while (*m) hdr[i++] = *m++;
    d = g_w; { char t[8]; int n = 0; if(!d) t[n++]='0'; while(d){t[n++]=(char)('0'+d%10);d/=10;}
               while(n) hdr[i++]=t[--n]; }
    hdr[i++] = ' ';
    d = g_h; { char t[8]; int n = 0; if(!d) t[n++]='0'; while(d){t[n++]=(char)('0'+d%10);d/=10;}
               while(n) hdr[i++]=t[--n]; }
    hdr[i++] = '\n'; hdr[i++]='2'; hdr[i++]='5'; hdr[i++]='5'; hdr[i++]='\n';
    fd = sys_open(OUTDIR PLOTBASE ".ppm", 01 | 0100 | 01000, 0644);
    if (fd < 0) { say("sdl: cannot write ppm\n"); return; }
    sys_write(fd, hdr, i);
    sys_write(fd, g_pix, (long)g_w * g_h * 3);
    sys_close(fd);
    say("sdl: wrote " OUTDIR PLOTBASE ".ppm\n");
}

/* sdl.show: a0 = 0 waits for the window to be closed, n > 0 shows for n ms */
long sdl_show(long hold)
{
    unsigned char ev[256];
    dump_ppm();
    /* SDL's OWN bitmap: hand the buffer to SDL as a surface and let it write
     * the .bmp, so the file on disk is what SDL rendered, not a format this
     * file invented.  RGB24 in memory is R,G,B ascending, which on a
     * little-endian host is mask R=0x0000ff, G=0x00ff00, B=0xff0000. */
    {   void *surf = SDL_CreateRGBSurfaceFrom(g_pix, g_w, g_h, 24, g_w * 3,
                                              0x0000ffu, 0x00ff00u, 0xff0000u, 0u);
        if (surf) {
            void *rw = SDL_RWFromFile(OUTDIR PLOTBASE ".bmp", "wb");
            if (rw && SDL_SaveBMP_RW(surf, rw, 1) == 0) say("sdl: wrote " OUTDIR PLOTBASE ".bmp\n");
            else { say("sdl: SaveBMP failed: "); say(SDL_GetError()); say("\n"); }
            SDL_FreeSurface(surf);
        } else { say("sdl: no surface: "); say(SDL_GetError()); say("\n"); }
    }
    if (!g_live) return -1;
    SDL_UpdateTexture(g_tex, 0, g_pix, g_w * 3);
    SDL_RenderClear(g_ren);
    SDL_RenderCopy(g_ren, g_tex, 0, 0);
    SDL_RenderPresent(g_ren);
    if (hold > 0) { SDL_Delay((u32)hold); SDL_Quit(); g_live = 0; return 0; }
    for (;;) {
        while (SDL_PollEvent(ev)) {
            u32 t = *(u32 *)ev;
            if (t == SDL_QUIT_EVENT || t == SDL_KEYDOWN_EVENT) {
                SDL_Quit(); g_live = 0; return 0;
            }
        }
        SDL_Delay(16);
    }
}

/* sdl.dot: a0 = (x << 20) | (y << 10) | colour, screen coordinates.
 *
 * Int is 32 bits on this target, so the fields have to fit in 32: ten bits
 * each for x and y (0..1023, enough for the 640-square window) and ten for
 * the colour.  Packing x at bit 32 instead silently lost it -- every dot
 * landed at x = 0 and the plot was one vertical line.
 *
 * The raster cursor sdl_put uses suits a generator that walks the image in
 * order; an orbit does not -- it revisits the canvas at arbitrary points over
 * time.  So this addresses a pixel directly and NEVER clears, which is what
 * makes the successive positions accumulate into a visible path.
 */
long sdl_dot(long packed)
{
    long x = (packed >> 20) & 0x3ff;
    long y = (packed >> 10) & 0x3ff;
    long c = packed & 0x3ff;
    long dx, dy;
    if (x >= g_w || y >= g_h || x < 0 || y < 0) return 0;   /* off-canvas */
    /* a 2x2 dot: one pixel is invisible at this scale */
    for (dy = 0; dy < 2; dy++) for (dx = 0; dx < 2; dx++) {
        long px = x + dx, py = y + dy;
        if (px < g_w && py < g_h) ramp(c, &g_pix[(py * g_w + px) * 3]);
    }
    return 1;
}

/* the CPS blobs call the same implementations */
long sdl_open_cps(long p) { return sdl_open(p); }
long sdl_put_cps(long p)  { return sdl_put(p);  }
long sdl_show_cps(long p) { return sdl_show(p); }

/* ---- RGB pixels from float components ------------------------------------
 * A ray tracer produces a colour, not an index: three floats in [0,1] per
 * pixel, in raster order.  Its own conversion (roundU8 = truncate (x + 0.5))
 * cannot be used here because truncate is broken on this backend, so the
 * components cross as binary32 payloads and the scaling to 0..255 happens
 * here.  cb commits the pixel, so one pixel is three calls.
 */
static float bits2f(long b);
static float g_cr, g_cg, g_cb;
static unsigned char clamp8(float v)
{
    float x = v * 255.0f + 0.5f;
    if (x <= 0.0f) return 0;
    if (x >= 255.0f) return 255;
    return (unsigned char)x;
}
long sdl_cr(long b) { g_cr = bits2f(b); return 0; }
long sdl_cg(long b) { g_cg = bits2f(b); return 0; }
long sdl_cb(long b)
{
    long idx = g_cursor;
    g_cb = bits2f(b);
    if (idx >= (long)g_w * g_h) return idx;
    g_pix[idx * 3 + 0] = clamp8(g_cr);
    g_pix[idx * 3 + 1] = clamp8(g_cg);
    g_pix[idx * 3 + 2] = clamp8(g_cb);
    g_cursor++;
    return g_cursor;
}
long sdl_cr_cps(long b) { return sdl_cr(b); }
long sdl_cg_cps(long b) { return sdl_cg(b); }
long sdl_cb_cps(long b) { return sdl_cb(b); }

/* ---- Life: a board of cells, and one file per generation ----------------
 *
 * The board is small and the window is not, so a cell is a block: the scale
 * comes from sdl_board, and sdl_cell streams cells in the order the generator
 * produces them (row-major), exactly as sdl_put does for the raster.  A frame
 * is written and the canvas cleared by sdl_frame, so the caller never has to
 * name a file or track a cursor.
 */
static int  g_board, g_cellpx;
static long g_frame;

long sdl_board(long n)
{
    if (n <= 0) return -1;
    g_board = (int)n;
    g_cellpx = g_w / (int)n;
    if (g_cellpx < 1) g_cellpx = 1;
    g_cursor = 0;
    return g_cellpx;
}

/* A FIELD VECTOR POINTING OUT OF THE SCREEN, drawn the way it is drawn on
 * paper: a circle with a dot in it, an arrow tip coming at the viewer.  (Into
 * the screen would be a cross -- the flights of an arrow going away.)  Filled
 * cells showed magnitude and said nothing about direction, which is the half
 * that matters here: the whole grid points at you, and only the strength
 * varies.  The dot grows and brightens with |B|.
 */
long sdl_bdot(long g)
{
    long idx = g_cursor, cx, cy, dx, dy, R, rdot;
    unsigned char v = (unsigned char)(g < 40 ? 40 : (g > 255 ? 255 : g));
    if (g_board <= 0) return -1;
    cx = (idx % g_board) * g_cellpx + g_cellpx / 2;
    cy = (idx / g_board) * g_cellpx + g_cellpx / 2;
    g_cursor++;
    if (cy >= g_h) return 0;
    R    = g_cellpx / 3; if (R < 3) R = 3;
    rdot = 1 + (g * R) / (3 * 255); if (rdot < 1) rdot = 1;
    for (dy = -R - 1; dy <= R + 1; dy++)
        for (dx = -R - 1; dx <= R + 1; dx++) {
            long px = cx + dx, py = cy + dy;
            long d2 = dx*dx + dy*dy;
            int on = 0;
            if (d2 <= rdot*rdot) on = 1;                       /* the dot     */
            else if (d2 >= (R-1)*(R-1) && d2 <= (R+1)*(R+1)) on = 1;  /* ring */
            if (on && px >= 0 && py >= 0 && px < g_w && py < g_h) {
                g_pix[(py * g_w + px) * 3 + 0] = (unsigned char)(v / 2);
                g_pix[(py * g_w + px) * 3 + 1] = (unsigned char)(v / 2);
                g_pix[(py * g_w + px) * 3 + 2] = v;
            }
        }
    return g_cursor;
}

/* a cell in GREY, 0..255, for fields where the value is a magnitude: ramp()
 * cycles hue and is unreadable as a scale. */
long sdl_gcell(long g)
{
    long idx = g_cursor, cx, cy, dx, dy;
    unsigned char v = (unsigned char)(g < 0 ? 0 : (g > 255 ? 255 : g));
    if (g_board <= 0) return -1;
    cx = (idx % g_board) * g_cellpx;
    cy = (idx / g_board) * g_cellpx;
    g_cursor++;
    if (cy >= g_h) return 0;
    for (dy = 0; dy < g_cellpx; dy++)
        for (dx = 0; dx < g_cellpx; dx++) {
            long px = cx + dx, py = cy + dy;
            if (px < g_w && py < g_h) {
                g_pix[(py * g_w + px) * 3 + 0] = v;
                g_pix[(py * g_w + px) * 3 + 1] = v;
                g_pix[(py * g_w + px) * 3 + 2] = (unsigned char)(v + 20 > 255 ? 255 : v + 20);
            }
        }
    return g_cursor;
}

long sdl_cell(long v)
{
    long idx = g_cursor, cx, cy, dx, dy;
    if (g_board <= 0) return -1;
    cx = (idx % g_board) * g_cellpx;
    cy = (idx / g_board) * g_cellpx;
    g_cursor++;
    if (cy >= g_h) return 0;
    for (dy = 0; dy < g_cellpx; dy++)
        for (dx = 0; dx < g_cellpx; dx++) {
            long px = cx + dx, py = cy + dy;
            if (px < g_w && py < g_h) ramp(v, &g_pix[(py * g_w + px) * 3]);
        }
    return g_cursor;
}

/* Write the canvas as frameNNNN.ppm.
 *
 * The argument says what to do with the canvas afterwards, because the two
 * animations want opposite things: Life draws a whole board per frame and
 * needs a clean canvas each time (keep = 0), while nbody is building up
 * orbits and the trail IS the picture (keep = 1). */
long sdl_frame(long keep)
{
    char path[256]; int i = 0, k; long fd, n;
    const char *dir = OUTDIR "frame";
    while (dir[i]) { path[i] = dir[i]; i++; }
    n = g_frame;
    for (k = 3; k >= 0; k--) {
        long p10 = 1, q; for (q = 0; q < k; q++) p10 *= 10;
        path[i++] = (char)('0' + ((n / p10) % 10));
    }
    path[i++] = '.'; path[i++] = 'p'; path[i++] = 'p'; path[i++] = 'm'; path[i] = 0;
    {   char hdr[64]; int j = 0, d; const char *m = "P6\n";
        while (*m) hdr[j++] = *m++;
        d = g_w; { char t[8]; int c2 = 0; if(!d) t[c2++]='0'; while(d){t[c2++]=(char)('0'+d%10);d/=10;}
                   while(c2) hdr[j++]=t[--c2]; }
        hdr[j++] = ' ';
        d = g_h; { char t[8]; int c2 = 0; if(!d) t[c2++]='0'; while(d){t[c2++]=(char)('0'+d%10);d/=10;}
                   while(c2) hdr[j++]=t[--c2]; }
        hdr[j++] = '\n'; hdr[j++]='2'; hdr[j++]='5'; hdr[j++]='5'; hdr[j++]='\n';
        fd = sys_open(path, 01 | 0100 | 01000, 0644);
        if (fd < 0) { say("sdl: cannot write frame\n"); return -1; }
        sys_write(fd, hdr, j);
        sys_write(fd, g_pix, (long)g_w * g_h * 3);
        sys_close(fd);
    }
    g_frame++;
    if (!keep) {
        for (i = 0; i < g_w * g_h * 3; i++) g_pix[i] = 0;
        g_cursor = 0;
    }
    return g_frame;
}

long sdl_board_cps(long n) { return sdl_board(n); }
long sdl_cell_cps(long v)  { return sdl_cell(v);  }
long sdl_frame_cps(long v) { return sdl_frame(v); }

/* ---- float entry points -------------------------------------------------
 * truncate (float -> Int) is broken on this backend -- every arithmetic
 * operation checks out by comparison, but a truncated value comes back
 * garbage -- so nothing here asks the graph to convert.  The blob forces a
 * FloatW box and hands over its payload, which IS the binary32 bit pattern,
 * and the scaling and rounding happen on this side.
 */
static float g_fx, g_fy;
static float bits2f(long b) { union { unsigned u; float f; } v; v.u = (unsigned)b; return v.f; }

long sdl_px(long b) { g_fx = bits2f(b); return 0; }
long sdl_py(long b) { g_fy = bits2f(b); return 0; }

/* draw the pending (x,y) in world units, scaled to the window */
#ifndef PLOTSCALE
#define PLOTSCALE 9.0f
#endif
/* px per world unit; sdl_scale overrides it, since AU and a unit-amplitude
 * oscillator do not want the same number */
static float g_scale = PLOTSCALE;
long sdl_scale(long b) { g_scale = bits2f(b); return 0; }
long sdl_pt(long colour)
{
    float fx = (float)(g_w / 2) + g_fx * g_scale;
    float fy = (float)(g_h / 2) + g_fy * g_scale;
    long x = (long)fx, y = (long)fy, dx, dy;
    if (fx < 0.0f || fy < 0.0f || x >= g_w || y >= g_h) return 0;
    for (dy = 0; dy < 2; dy++) for (dx = 0; dx < 2; dx++) {
        long px = x + dx, py = y + dy;
        if (px < g_w && py < g_h) ramp(colour, &g_pix[(py * g_w + px) * 3]);
    }
    return 1;
}

/* print a float scaled by 1e9 as an integer -- the benchmark reports energy
 * that way, and its own show/truncate path cannot be trusted here. */
long sdl_num(long b)
{
    char buf[32]; int i = 30; long v;
    double d = (double)bits2f(b) * 1000000000.0;
    v = (long)d;
    buf[31] = 10;
    if (v == 0) { buf[i--] = 48; }
    else {
        int neg = v < 0; unsigned long u = (unsigned long)(neg ? -v : v);
        while (u) { buf[i--] = (char)(48 + (u % 10)); u /= 10; }
        if (neg) buf[i--] = 45;
    }
    sys_write(1, buf + i + 1, 31 - i);
    return 0;
}

/* the pixel buffer, for a caller that wants to save rather than show */
const unsigned char *sdl_pixels(void) { return g_pix; }

/* CPS aliases for the float point entry points -- same implementations,
 * different blob convention (NanoPrelude ports apply an import through
 * primPerform, which pushes its continuation on top). */
long sdl_dot_cps(long p)   { return sdl_dot(p);   }
long sdl_px_cps(long b)    { return sdl_px(b);    }
long sdl_py_cps(long b)    { return sdl_py(b);    }
long sdl_pt_cps(long b)    { return sdl_pt(b);    }
long sdl_scale_cps(long b) { return sdl_scale(b); }
