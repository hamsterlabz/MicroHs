# rt_linux.S - the fun runtime for Linux (rv32), linked with a graph built by
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

  .section .text.rt,"ax",@progbits
# Runtime entry points, exported for the separately assembled graph.
  .globl _start
  .globl _graph_entry
  .globl _epilogue
  .globl _heap_fail
  .globl _heapmsg
  .globl _argv_base
  .globl _funtext_start
  .globl _prim_add
  .globl _prim_sub
  .globl _prim_mul
  .globl _prim_div
  .globl _prim_divu
  .globl _prim_rem
  .globl _prim_remu
  .globl _prim_and
  .globl _prim_or
  .globl _prim_xor
  .globl _prim_sll
  .globl _prim_srl
  .globl _prim_sra
  .globl _fforce
  .globl _fforce_resume
  .globl _fforce_nf
  .globl _fforce_msg
  .globl _seq
  .globl _seq_resume
  .globl _force_resume
  .globl _prim_eq
  .globl _prim_ne
  .globl _prim_lt
  .globl _prim_ge
  .globl _prim_le
  .globl _prim_gt
  .globl _prim_ltu
  .globl _prim_geu
  .globl _prim_leu
  .globl _prim_gtu
  .globl _prim_fadd
  .globl _prim_fsub
  .globl _prim_fmul
  .globl _prim_fdiv
  .globl _prim_feq
  .globl _prim_fne
  .globl _prim_flt
  .globl _prim_fle
  .globl _prim_fgt
  .globl _prim_fge
  .globl _prim_fneg
  .globl _prim_fsqrt
  .globl _prim_itof
  .globl _prim_ftoi
  .globl _pm_putb
  .globl _io_putb
  .globl _pm_setfd
  .globl _io_setfd
  .globl _pm_putbf
  .globl _io_putbf
  .globl _csrr_0xb00
  .globl _csrr_0xb02
  .globl _csrr_0xc00
  .globl _csrr_0xc02
  .globl _csrr_0x320
  .globl _csrr_0x7d0
  .globl _csrr_0x7d2
  .globl _csrr_0x7d4
  .globl _csrr_0x7d6
  .globl _csrr_0x7d8
  .globl _csrr_0x7da
  .globl _csrr_0x7dc
  .globl _csrr_0x7de
  .globl _csrr_0x7e0
  .globl _csrr_0x7e2
  .globl _csrr_0x7e4
  .globl _csrr_0x7e6
  .globl _csrr_0x7e7
  .globl _csrr_0x7e8
  .globl _csrr_0x7e9
  .globl _csrr_0x7ea
  .globl _csrr_0x7eb
  .globl _csrr_0x7ec
  .globl _csrr_0x7ed
  .globl _csrr_0x7ee
  .globl _csrr_0x7ef
  .globl _pm_csrw_0xb00
  .globl _csrw_0xb00
  .globl _pm_csrw_0xb02
  .globl _csrw_0xb02
  .globl _pm_csrw_0xc00
  .globl _csrw_0xc00
  .globl _pm_csrw_0xc02
  .globl _csrw_0xc02
  .globl _pm_csrw_0x320
  .globl _csrw_0x320
  .globl _pm_csrw_0x7d0
  .globl _csrw_0x7d0
  .globl _pm_csrw_0x7d2
  .globl _csrw_0x7d2
  .globl _pm_csrw_0x7d4
  .globl _csrw_0x7d4
  .globl _pm_csrw_0x7d6
  .globl _csrw_0x7d6
  .globl _pm_csrw_0x7d8
  .globl _csrw_0x7d8
  .globl _pm_csrw_0x7da
  .globl _csrw_0x7da
  .globl _pm_csrw_0x7dc
  .globl _csrw_0x7dc
  .globl _pm_csrw_0x7de
  .globl _csrw_0x7de
  .globl _pm_csrw_0x7e0
  .globl _csrw_0x7e0
  .globl _pm_csrw_0x7e2
  .globl _csrw_0x7e2
  .globl _pm_csrw_0x7e4
  .globl _csrw_0x7e4
  .globl _pm_csrw_0x7e6
  .globl _csrw_0x7e6
  .globl _pm_csrw_0x7e7
  .globl _csrw_0x7e7
  .globl _pm_csrw_0x7e8
  .globl _csrw_0x7e8
  .globl _pm_csrw_0x7e9
  .globl _csrw_0x7e9
  .globl _pm_csrw_0x7ea
  .globl _csrw_0x7ea
  .globl _pm_csrw_0x7eb
  .globl _csrw_0x7eb
  .globl _pm_csrw_0x7ec
  .globl _csrw_0x7ec
  .globl _pm_csrw_0x7ed
  .globl _csrw_0x7ed
  .globl _pm_csrw_0x7ee
  .globl _csrw_0x7ee
  .globl _pm_csrw_0x7ef
  .globl _csrw_0x7ef
  .globl _pm_arr_setn
  .globl _arr_setn
  .globl _pm_arr_setsl
  .globl _arr_setsl
  .globl _pm_arr_wr
  .globl _arr_wr
  .globl _pm_arr_rd
  .globl _arr_rd
  .globl _pm_arr_size
  .globl _arr_size
  .globl _pm_arr_alloc
  .globl _arr_alloc
  .globl _pm_arr_copy
  .globl _arr_copy
  .globl _arr_n
  .globl _arr_sl
  .globl _error0
  .globl _unimpfi_halt
  .globl _errmsg
  .globl _nlmsg
  .globl _iobuf
  .globl _cur_fd
  .globl _io_pathc
  .globl _io_open
  .globl _io_close
  .globl _io_getbf
  .globl _io_getb
  .globl _io_argc
  .globl _io_argsel
  .globl _io_argrd
  .globl _pathbuf
  .globl _pathlen
  .globl _arg_ptr
  .globl _arg_off
  .globl _start
_start:
  la   t0, _argv_base
  sw   sp, 0(t0)               # sp at entry: argc, then argv[], then envp[]

  li   a0, 0x30000000          # the reducer heap, at a fixed address
  li   a1, 0x40000000
  li   a2, 7                   # PROT_READ|PROT_WRITE|PROT_EXEC: heap cells are
                               # entered as code as well as read and written
  li   a3, 0x32                # MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED
  li   a4, -1
  li   a5, 0
  li   a7, 222                 # mmap
  ecall
  li   t0, -4096               # failure is -errno; a valid address can be
  bgeu a0, t0, _heap_fail      # negative as an int32, so compare UNSIGNED

  la   a0, _funtext_start      # make the graph writable (Turner updates)
  li   t0, -4096
  and  a0, a0, t0
  la   a1, _funtext_end
  sub  a1, a1, a0
  li   a2, 7
  li   a7, 226                 # mprotect
  ecall

  la   t0, _funtext_start      # fault the pages in, one touch per page
  la   t1, _funtext_end
  li   t6, 4096
1:
  lb   t2, 0(t0)
  sb   t2, 0(t0)
  add  t0, t0, t6
  bltu t0, t1, 1b

  li   a0, 0x70000000          # a 192 MB C stack of our own: the nested-frame
  li   a1, 0x0c000000          # force spills the spine here, one word per entry
  li   a2, 3                   # PROT_READ|PROT_WRITE
  li   a3, 0x32                # MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED
  li   a4, -1
  li   a5, 0
  li   a7, 222                 # mmap
  ecall
  li   t0, -4096
  bgeu a0, t0, _heap_fail
  li   sp, 0x7bfffff0          # sp at its top

  li   t0, 0x30000000
  csrw 0x7c0, t0               # seed the heap pointer
  la   t0, _nf_epi
  csrw 0x7c1, t0               # NF_ADDR: the NORMAL_FORM epilogue
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

_nf_epi:                       # NORMAL FORM: an under-applied head.  Inside a
1:                             # nested force the spine holds only that frame:
  fn.pop t0                    # drain it and resume the forcer, which discards
  bnez t0, 1b                  # or inspects the value as it sees fit.
  la   t1, _force_resume
  lw   t1, 0(t1)
  beqz t1, _nf_top
  jr   t1

_nf_top:                       # no force in flight: the program IS a function
  la   a1, _nfmsg
  li   a2, 33
  li   a0, 2
  li   a7, 64
  ecall
  li   a0, 71
  li   a7, 93
  ecall
  .balign 4
_nfmsg:
  .asciz "fun: normal form, nothing to resume\n"
  .balign 4

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
  .asciz "fun: no heap\n"
  .balign 8
_argv_base:
  .skip 8

  .balign 4
_funtext_start:
  .balign 4
_prim_add:
  .word 0x0000255b
  .word 0x000025db
  add a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_sub:
  .word 0x0000255b
  .word 0x000025db
  sub a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_mul:
  .word 0x0000255b
  .word 0x000025db
  mul a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_div:
  .word 0x0000255b
  .word 0x000025db
  div a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_divu:
  .word 0x0000255b
  .word 0x000025db
  divu a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_rem:
  .word 0x0000255b
  .word 0x000025db
  rem a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_remu:
  .word 0x0000255b
  .word 0x000025db
  remu a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_and:
  .word 0x0000255b
  .word 0x000025db
  and a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_or:
  .word 0x0000255b
  .word 0x000025db
  or a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_xor:
  .word 0x0000255b
  .word 0x000025db
  xor a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_sll:
  .word 0x0000255b
  .word 0x000025db
  sll a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_srl:
  .word 0x0000255b
  .word 0x000025db
  srl a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_sra:
  .word 0x0000255b
  .word 0x000025db
  sra a0,a0,a1
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_fforce:
  fn.databox t2, zero
  la   t1, _fforce_plain
  sw   t1, 0(t2)
  andi a0, a0, -4
  ori  a0, a0, 1
  sw   a0, 4(t2)
  jr   t2
  .balign 4
_fforce_plain:
  .word 0x0000255b
  ret
  .balign 4
_unused_fforce_resume:

  .word 0x0000255b
  lw   t1, 0(sp)
  csrw 0x7c2, t1
  la   t0, _force_resume
  lw   t1, 4(sp)
  sw   t1, 0(t0)
  lw   ra, 8(sp)
  addi sp, sp, 12
  ret
  .balign 4
_fforce_nf:
  la   a0, _fforce_msg
  j    _unimpfi_halt
  .balign 4
_fforce_msg:
  .asciz "fforce: non-data WHNF"
  .balign 4
  .balign 4
_seq:
  fn.pop a0
  fn.pop a1
  beqz a1, _error0
  addi sp, sp, -12
  sw   a1, 8(sp)
  la   t0, _force_resume
  lw   t1, 0(t0)
  sw   t1, 4(sp)
  csrr t1, 0x7c2
  sw   t1, 0(sp)
  la   t1, _seq_resume
  sw   t1, 0(t0)
  li   t1, -1
  csrw 0x7c2, t1
  andi a0, a0, -4
  jr   a0
  .balign 4
_seq_resume:
  la   t0, _force_resume
  lw   t1, 4(sp)
  sw   t1, 0(t0)
  lw   t1, 0(sp)
  csrw 0x7c2, t1
  lw   t2, 8(sp)
  addi sp, sp, 12
  andi t2, t2, -4
  jr   t2
  .balign 8
_force_resume:
  .skip 8
  .balign 4
_prim_eq:
  .word 0x0000255b
  .word 0x000025db
  beq a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_ne:
  .word 0x0000255b
  .word 0x000025db
  bne a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_lt:
  .word 0x0000255b
  .word 0x000025db
  blt a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_ge:
  .word 0x0000255b
  .word 0x000025db
  bge a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_le:
  .word 0x0000255b
  .word 0x000025db
  bge a1,a0,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_gt:
  .word 0x0000255b
  .word 0x000025db
  blt a1,a0,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_ltu:
  .word 0x0000255b
  .word 0x000025db
  bltu a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_geu:
  .word 0x0000255b
  .word 0x000025db
  bgeu a0,a1,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_leu:
  .word 0x0000255b
  .word 0x000025db
  bgeu a1,a0,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_gtu:
  .word 0x0000255b
  .word 0x000025db
  bltu a1,a0,1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fadd:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fadd.s fa0, fa0, fa1
  fmv.x.w a0, fa0
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_fsub:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fsub.s fa0, fa0, fa1
  fmv.x.w a0, fa0
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_fmul:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fmul.s fa0, fa0, fa1
  fmv.x.w a0, fa0
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_fdiv:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fdiv.s fa0, fa0, fa1
  fmv.x.w a0, fa0
  .word 0x0005755b
  .word 0x00a5305b
  jr a0
  .balign 4
_prim_feq:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  feq.s a0, fa0, fa1
  bnez a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fne:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  feq.s a0, fa0, fa1
  beqz a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_flt:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  flt.s a0, fa0, fa1
  bnez a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fle:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fle.s a0, fa0, fa1
  bnez a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fgt:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  flt.s a0, fa1, fa0
  bnez a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fge:
  .word 0x0000255b
  .word 0x000025db
  fmv.w.x fa0, a0
  fmv.w.x fa1, a1
  fle.s a0, fa1, fa0
  bnez a0, 1f
  fn.combi.t0 2, [0,0,0,0,0,0]
1:
  fn.combi.t0 2, [1,0,0,0,0,0]
  .balign 4
_prim_fneg:
  .word 0x0000505b
  .word 0x0000255b
  fmv.w.x fa0, a0
  fneg.s fa0, fa0
  fmv.x.w a0, fa0
  .word 0x0005755b
  jr a0
  .balign 4
_prim_fsqrt:
  .word 0x0000505b
  .word 0x0000255b
  fmv.w.x fa0, a0
  fsqrt.s fa0, fa0
  fmv.x.w a0, fa0
  .word 0x0005755b
  jr a0
  .balign 4
_prim_itof:
  .word 0x0000505b
  .word 0x0000255b
  fcvt.s.w fa0, a0
  fmv.x.w a0, fa0
  .word 0x0005755b
  jr a0
  .balign 4
_prim_ftoi:
  .word 0x0000505b
  .word 0x0000255b
  fmv.w.x fa0, a0
  fcvt.w.s a0, fa0, rtz
  .word 0x0005755b
  jr a0
  .balign 4
_pm_putb:
  .word 0x0000105b
  .word _io_putb+1
  .balign 4
_io_putb:
  fn.pop a0
  jal ra, _fforce
  la a1, _iobuf
  sb a0, 0(a1)
  li a0, 1
  li a2, 1
  li a7, 64
  ecall
  .word 0x0000000b
  .balign 4
_pm_setfd:
  .word 0x0000105b
  .word _io_setfd+1
  .balign 4
_io_setfd:
  fn.pop a0
  jal ra, _fforce
  la a1, _cur_fd
  sw a0, 0(a1)
  .word 0x0000000b
  .balign 4
_pm_putbf:
  .word 0x0000105b
  .word _io_putbf+1
  .balign 4
_io_putbf:
  fn.pop a0
  jal ra, _fforce
  la a1, _iobuf
  sb a0, 0(a1)
  la a2, _cur_fd
  lw a0, 0(a2)
  li a2, 1
  li a7, 64
  ecall
  .word 0x0000000b
  .balign 4
_csrr_0xb00:
  csrr a0, 0xb00
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0xb02:
  csrr a0, 0xb02
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0xc00:
  csrr a0, 0xc00
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0xc02:
  csrr a0, 0xc02
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x320:
  csrr a0, 0x320
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7d0:
  csrr a0, 0x7d0
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7d2:
  csrr a0, 0x7d2
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7d4:
  csrr a0, 0x7d4
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7d6:
  csrr a0, 0x7d6
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7d8:
  csrr a0, 0x7d8
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7da:
  csrr a0, 0x7da
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7dc:
  csrr a0, 0x7dc
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7de:
  csrr a0, 0x7de
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e0:
  csrr a0, 0x7e0
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e2:
  csrr a0, 0x7e2
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e4:
  csrr a0, 0x7e4
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e6:
  csrr a0, 0x7e6
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e7:
  csrr a0, 0x7e7
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e8:
  csrr a0, 0x7e8
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7e9:
  csrr a0, 0x7e9
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7ea:
  csrr a0, 0x7ea
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7eb:
  csrr a0, 0x7eb
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7ec:
  csrr a0, 0x7ec
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7ed:
  csrr a0, 0x7ed
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7ee:
  csrr a0, 0x7ee
  .word 0x0005755b
  jr a0
  .balign 4
_csrr_0x7ef:
  csrr a0, 0x7ef
  .word 0x0005755b
  jr a0
  .balign 4
_pm_csrw_0xb00:
  .word 0x0000105b
  .word _csrw_0xb00+1
  .balign 4
_csrw_0xb00:
  fn.pop a0
  jal ra, _fforce
  csrw 0xb00, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xb02:
  .word 0x0000105b
  .word _csrw_0xb02+1
  .balign 4
_csrw_0xb02:
  fn.pop a0
  jal ra, _fforce
  csrw 0xb02, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xc00:
  .word 0x0000105b
  .word _csrw_0xc00+1
  .balign 4
_csrw_0xc00:
  fn.pop a0
  jal ra, _fforce
  csrw 0xc00, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xc02:
  .word 0x0000105b
  .word _csrw_0xc02+1
  .balign 4
_csrw_0xc02:
  fn.pop a0
  jal ra, _fforce
  csrw 0xc02, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x320:
  .word 0x0000105b
  .word _csrw_0x320+1
  .balign 4
_csrw_0x320:
  fn.pop a0
  jal ra, _fforce
  csrw 0x320, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d0:
  .word 0x0000105b
  .word _csrw_0x7d0+1
  .balign 4
_csrw_0x7d0:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7d0, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d2:
  .word 0x0000105b
  .word _csrw_0x7d2+1
  .balign 4
_csrw_0x7d2:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7d2, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d4:
  .word 0x0000105b
  .word _csrw_0x7d4+1
  .balign 4
_csrw_0x7d4:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7d4, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d6:
  .word 0x0000105b
  .word _csrw_0x7d6+1
  .balign 4
_csrw_0x7d6:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7d6, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d8:
  .word 0x0000105b
  .word _csrw_0x7d8+1
  .balign 4
_csrw_0x7d8:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7d8, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7da:
  .word 0x0000105b
  .word _csrw_0x7da+1
  .balign 4
_csrw_0x7da:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7da, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7dc:
  .word 0x0000105b
  .word _csrw_0x7dc+1
  .balign 4
_csrw_0x7dc:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7dc, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7de:
  .word 0x0000105b
  .word _csrw_0x7de+1
  .balign 4
_csrw_0x7de:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7de, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e0:
  .word 0x0000105b
  .word _csrw_0x7e0+1
  .balign 4
_csrw_0x7e0:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e0, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e2:
  .word 0x0000105b
  .word _csrw_0x7e2+1
  .balign 4
_csrw_0x7e2:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e2, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e4:
  .word 0x0000105b
  .word _csrw_0x7e4+1
  .balign 4
_csrw_0x7e4:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e4, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e6:
  .word 0x0000105b
  .word _csrw_0x7e6+1
  .balign 4
_csrw_0x7e6:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e6, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e7:
  .word 0x0000105b
  .word _csrw_0x7e7+1
  .balign 4
_csrw_0x7e7:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e7, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e8:
  .word 0x0000105b
  .word _csrw_0x7e8+1
  .balign 4
_csrw_0x7e8:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e8, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e9:
  .word 0x0000105b
  .word _csrw_0x7e9+1
  .balign 4
_csrw_0x7e9:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7e9, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ea:
  .word 0x0000105b
  .word _csrw_0x7ea+1
  .balign 4
_csrw_0x7ea:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7ea, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7eb:
  .word 0x0000105b
  .word _csrw_0x7eb+1
  .balign 4
_csrw_0x7eb:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7eb, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ec:
  .word 0x0000105b
  .word _csrw_0x7ec+1
  .balign 4
_csrw_0x7ec:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7ec, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ed:
  .word 0x0000105b
  .word _csrw_0x7ed+1
  .balign 4
_csrw_0x7ed:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7ed, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ee:
  .word 0x0000105b
  .word _csrw_0x7ee+1
  .balign 4
_csrw_0x7ee:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7ee, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ef:
  .word 0x0000105b
  .word _csrw_0x7ef+1
  .balign 4
_csrw_0x7ef:
  fn.pop a0
  jal ra, _fforce
  csrw 0x7ef, a0
  .word 0x0000000b
  .balign 4
_pm_arr_setn:
  .word 0x0000105b
  .word _arr_setn+1
  .balign 4
_arr_setn:
  fn.pop a0
  jal ra, _fforce
  la t0, _arr_n
  sw a0, 0(t0)
  .word 0x0000000b
  .balign 4
_pm_arr_setsl:
  .word 0x0000105b
  .word _arr_setsl+1
  .balign 4
_arr_setsl:
  fn.pop a0
  jal ra, _fforce
  la t0, _arr_sl
  sw a0, 0(t0)
  .word 0x0000000b
  .balign 4
_pm_arr_wr:
  .word 0x0000105b
  .word _arr_wr+1
  .balign 4
_arr_wr:
  fn.pop a0
  la t0, _arr_sl
  lw t0, 0(t0)
  sw a0, 0(t0)
  .word 0x0000000b
  .balign 4
_pm_arr_rd:
  .word 0x0000105b
  .word _arr_rd+1
  .balign 4
_arr_rd:
  fn.pop a0
  jal ra, _fforce
  lw a0, 0(a0)
  andi a0, a0, -4
  fn.pop a1
  andi a1, a1, -4
  fn.databox t0,zero
  sw a0, 0(t0)
  ori a1, a1, 1
  sw a1, 4(t0)
  jr t0
  .balign 4
_pm_arr_size:
  .word 0x0000105b
  .word _arr_size+1
  .balign 4
_arr_size:
  fn.pop a0
  jal ra, _fforce
  lw a0, 0(a0)
  fn.databox a0,a0
  jr a0
  .balign 4
_pm_arr_alloc:
  .word 0x0000105b
  .word _arr_alloc+1
  .balign 4
_arr_alloc:
  fn.pop a0
  la t0, _arr_n
  lw a2, 0(t0)
  addi t1, a2, 2
  srli t1, t1, 1
  fn.databox t4,zero
  addi t1, t1, -1
1:
  beqz t1, 2f
  fn.databox t5,zero
  addi t1, t1, -1
  j 1b
2:
  sw a2, 0(t4)
  addi t2, t4, 4
  mv t3, a2
3:
  beqz t3, 4f
  sw a0, 0(t2)
  addi t2, t2, 4
  addi t3, t3, -1
  j 3b
4:
  fn.databox a0,t4
  jr a0
  .balign 4
_pm_arr_copy:
  .word 0x0000105b
  .word _arr_copy+1
  .balign 4
_arr_copy:
  fn.pop a0
  jal ra, _fforce
  lw a2, 0(a0)
  mv a1, a0
  addi t1, a2, 2
  srli t1, t1, 1
  fn.databox t4,zero
  addi t1, t1, -1
1:
  beqz t1, 2f
  fn.databox t5,zero
  addi t1, t1, -1
  j 1b
2:
  sw a2, 0(t4)
  addi t2, t4, 4
  addi t0, a1, 4
  mv t3, a2
3:
  beqz t3, 4f
  lw t1, 0(t0)
  sw t1, 0(t2)
  addi t2, t2, 4
  addi t0, t0, 4
  addi t3, t3, -1
  j 3b
4:
  fn.databox a0,t4
  jr a0
  .balign 8
_arr_n:
  .skip 8
  .balign 8
_arr_sl:
  .skip 8
  .balign 4
_error0:
  la a0, _errmsg
  j _unimpfi_halt
  .balign 4
_unimpfi_halt:
  mv a1, a0
  mv a2, zero
1:
  add a3, a1, a2
  lbu a3, 0(a3)
  beqz a3, 2f
  addi a2, a2, 1
  j 1b
2:
  li a0, 2
  li a7, 64
  ecall
  la a1, _nlmsg
  li a2, 1
  li a0, 2
  li a7, 64
  ecall
  li a0, 1
  li a7, 93
  ecall
  .balign 4
_errmsg:
  .asciz "mhs (fun): error"
  .balign 4
_nlmsg:
  .asciz "\n"
  .balign 4
  .balign 8
_iobuf:
  .skip 8
  .balign 8
_cur_fd:
  .skip 8
# --- host effects: files by path, and argv -------------------------------
# The path arrives one byte at a time (io.pathc) because the graph has no way
# to hand over a buffer; io.open consumes it and resets the buffer.
  .balign 4
_io_pathc:
  fn.pop a0
  jal ra, _fforce
  la t0, _pathbuf
  la t1, _pathlen
  lw t2, 0(t1)
  li t4, 1023
  bgeu t2, t4, 1f
  add t3, t0, t2
  sb a0, 0(t3)
  addi t2, t2, 1
  sw t2, 0(t1)
1:
  .word 0x0000000b
  .balign 4
_io_open:
  fn.pop a0
  jal ra, _fforce               # a0 = the IOMode
  la t0, _pathbuf
  la t1, _pathlen
  lw t2, 0(t1)
  add t3, t0, t2
  sb zero, 0(t3)                 # NUL-terminate
  sw zero, 0(t1)                 # reset for the next path
  li t4, 0                       # ReadMode: O_RDONLY
  beqz a0, 1f
  li t5, 1
  bne a0, t5, 2f
  li t4, 0x241                   # WriteMode:  O_WRONLY|O_CREAT|O_TRUNC
  j 1f
2:
  li t5, 2
  bne a0, t5, 3f
  li t4, 0x441                   # AppendMode: O_WRONLY|O_CREAT|O_APPEND
  j 1f
3:
  li t4, 0x42                    # ReadWriteMode: O_RDWR|O_CREAT
1:
  li a0, -100                    # AT_FDCWD
  la a1, _pathbuf
  mv a2, t4
  li a3, 0x1b6                   # 0666
  li a7, 56                      # openat -> fd, negative on failure
  ecall
  .word 0x0005755b
  jr a0
  .balign 4
_io_close:
  fn.pop a0
  jal ra, _fforce
  li a7, 57
  ecall
  .word 0x0000000b
  .balign 4
_io_getbf:                       # one byte from the current fd
  la a2, _cur_fd
  lw a0, 0(a2)
  la a1, _iobuf
  li a2, 1
  li a7, 63                      # read
  ecall
  blez a0, 1f                    # 0 = EOF, <0 = error
  la a1, _iobuf
  lbu a0, 0(a1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0
  .balign 4
_io_getb:                        # one byte from stdin
  li a0, 0
  la a1, _iobuf
  li a2, 1
  li a7, 63
  ecall
  blez a0, 1f
  la a1, _iobuf
  lbu a0, 0(a1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0
  .balign 4
_io_argc:
  la t0, _argv_base
  lw t0, 0(t0)
  lw a0, 0(t0)
  .word 0x0005755b
  jr a0
  .balign 4
_io_argsel:
  fn.pop a0
  jal ra, _fforce               # a0 = the argv index
  la t0, _argv_base
  lw t0, 0(t0)
  addi t0, t0, 4
  slli t1, a0, 2
  add t0, t0, t1
  lw t0, 0(t0)
  la t1, _arg_ptr
  sw t0, 0(t1)
  la t1, _arg_off
  sw zero, 0(t1)
  .word 0x0000000b
  .balign 4
_io_argrd:                       # next byte of the selected arg, -1 at the end
  la t0, _arg_ptr
  lw t0, 0(t0)
  la t1, _arg_off
  lw t2, 0(t1)
  add t3, t0, t2
  lbu a0, 0(t3)
  beqz a0, 1f
  addi t2, t2, 1
  sw t2, 0(t1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0

  .balign 8
_pathbuf:
  .skip 1024
_pathlen:
  .skip 8
_arg_ptr:
  .skip 8
_arg_off:
  .skip 8
