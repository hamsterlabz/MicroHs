"""Assemble the linux (rv32) fun runtime support file.

The graph comes from `mhs --rvfun-io --rv32`, which emits the graph ONLY, so this
file is the whole runtime: process start-up, the primitive blobs and the host
effects.  Blob bodies are taken verbatim from the compiler's own generators so
the encodings cannot drift -- arithmetic/compare/float from an rv32 build, and
effect/CSR/array/halt from a Linux build (those are width-neutral: ecalls and
word loads).  Start-up, the graph entry and the host effects are written here.

The entry follows sw/xfun/hs/startup_check.S: a LINK CELL holding the WHNF
continuation, then an fn.elink into the graph.
"""
import re

base = "/home/cecil/work/lambdalinux/MicroHs/funboot/"
rv32 = open(base + "pre32.S").read()
rv64 = open(base + "pre64.S").read()

i = rv32.index("_pm_putb:")
i = rv32.rindex("  .balign 4", 0, i)
arith = rv32[:i].replace("  .text\n", "", 1)

j = rv64.index("_pm_putb:")
j = rv64.rindex("  .balign 4", 0, j)
k = rv64.index("  .globl _fungraph_start")
effects = rv64[j:k]

HEAP_SIZE = "0x60000000"        # 1.5 GiB: the reducer bump-allocates, there is no GC

start = f'''# rt_linux.S - the fun runtime for Linux (rv32), linked with a graph built by
# `mhs --rvfun-io --rv32`.
#
# Start-up does what the reducer cannot do for itself:
#   * maps its heap RWX -- the machine ENTERS heap cells (a box is jumped to),
#     so the heap is executed as well as read and written;
#   * makes the graph writable -- a Turner update memoizes a redex by writing the
#     reduct back into the graph cell it came from, and the graph is in .text;
#   * records argv for the io.arg* effects.
# It then enters the graph the way startup_check.S does and exits from the WHNF
# continuation.

  .text
  .globl _start
_start:
  mv   s2, sp                  # sp AT ENTRY -- argc, then argv[], then envp[].
                               # Taken before anything else: the C stack below
                               # replaces sp, and the store that keeps this has
                               # to wait for the mprotect.
  li   a0, 0                   # the C stack first, and at a FIXED size: the
  li   a1, 0x0c000000          # framed forcers nest on it, and whatever is left
  li   a2, 3                   # of the address space after it goes to the heap.
  li   a3, 0x22                # PLACED BY THE KERNEL -- MAP_FIXED anywhere big
  li   a4, -1                  # enough lands on the loader stack, and replacing
  li   a5, 0                   # that mapping takes argv with it.
  li   a7, 222                 # mmap
  ecall
  li   t0, -4096
  bgeu a0, t0, _heap_fail
  add  sp, a0, a1              # sp at the top of what we were given
  addi sp, sp, -16

  li   s1, 0xf0000000          # the heap: bump-allocated with no GC, so take
1:                             # the LARGEST the kernel will give, stepping down
  li   a0, 0                   # 256 MiB at a time.  PROT_EXEC because the
  mv   a1, s1                  # machine ENTERS heap cells: a box is jumped to.
  li   a2, 7
  li   a3, 0x22                # MAP_PRIVATE|MAP_ANONYMOUS
  li   a4, -1
  li   a5, 0
  li   a7, 222                 # mmap
  ecall
  li   t0, -4096               # failure is -errno; a valid address can be
  bltu a0, t0, 2f              # negative as an int32, so compare UNSIGNED
  li   t1, 0x10000000
  sub  s1, s1, t1
  bgeu s1, t1, 1b
  j    _heap_fail
2:
  mv   s0, a0                  # the seed, kept across mprotect

  la   a0, _start              # make the whole image writable: Turner updates
  li   t0, -4096               # land in the graph, and _argv_base is ours to
  and  a0, a0, t0              # write.  ld gives the segment write permission
  la   a1, _funtext_end        # only when some input section asks for it, which
  sub  a1, a1, a0              # depends on what the graph happens to contain --
  li   a2, 7                   # so take it here rather than depend on that.
  li   a7, 226                 # mprotect
  ecall

  la   t0, _argv_base          # NOW the store is safe
  sw   s2, 0(t0)

  la   t0, _start              # fault the pages in, one touch per page
  li   t2, -4096
  and  t0, t0, t2
  la   t1, _funtext_end
  li   t6, 4096
1:
  lb   t2, 0(t0)
  sb   t2, 0(t0)
  add  t0, t0, t6
  bltu t0, t1, 1b

  csrw 0x7c0, s0               # seed the heap pointer
  la   t0, _fungraph_start
  csrw 0x7c1, t0               # graph base (bookkeeping)
  la   t1, _graph_entry
  jalr x0, 0(t1)               # ID-resolved: csrw retired before the fn.* fetch
  nop
  nop
  nop
  nop

  .balign 32
  .globl _graph_entry
_graph_entry:
  .word _epilogue              # link cell: the WHNF continuation
  fn.elink main                # enter the graph

  .balign 4
  .globl _epilogue
_epilogue:                     # the reduction ended: main's IO has run
  li   a0, 0
  li   a7, 93                  # exit(0)
  ecall

_heap_fail:
  la   a1, _heapmsg
  li   a2, 14
  li   a0, 2
  li   a7, 64
  ecall
  li   a0, 70
  li   a7, 93
  ecall
  .balign 4
_heapmsg:
  .asciz "fun: no heap\\n"
  .balign 8
_argv_base:
  .skip 8

'''

host = open(base + "host_effects.S").read()

out = start + "  .balign 4\n_funtext_start:\n" + arith + effects + host

# every runtime entry point the graph references must be exported: the graph is a
# separate object, and a bare label is local to its own assembly unit
labels, seen, order = re.findall(r"^(_[A-Za-z0-9_.$]+):", out, re.M), set(), []
for l in labels:
    if l not in seen:
        seen.add(l)
        order.append(l)
hdr = ("# Runtime entry points, exported for the separately assembled graph.\n"
       + "".join("  .globl %s\n" % l for l in order))
m = "  .text\n"
p = out.index(m)
out = out[:p] + m + hdr + out[p + len(m):]

open(base + "rt_linux.S", "w").write(out)
print("wrote rt_linux.S:", len(out), "bytes;", len(order), "symbols exported")
for sym in ["_prim_add", "_prim_eq", "_pm_arr_alloc", "_error0", "_io_putb",
            "_io_open", "_io_argc", "_graph_entry", "_seq", "_seq_resume",
            "_force_resume"]:
    assert sym + ":" in out, "missing " + sym
print("runtime symbol check ok")
