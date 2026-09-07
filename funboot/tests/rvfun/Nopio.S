  .text
  .globl _start
_start:
  la   t0, _argv_base
  sw   sp, 0(t0)
  la   a0, _heap_page
  la   a1, _heap_bytes
  li   a2, 7
  li   a3, 0x4022
  li   a4, -1
  li   a5, 0
  li   a7, 222
  ecall
  li   t0, -4096
  bgeu a0, t0, _heap_fail
  csrw 0x7c0, a0
  la   t0, _fungraph_start
  csrw 0x7c1, t0
  jal  ra, main
  li   a0, 0
  li   a7, 93
  ecall
_heap_fail:
  la   a1, _heapmsg
  li   a2, 24
  li   a0, 2
  li   a7, 64
  ecall
  li   a0, 70
  li   a7, 93
  ecall
  .balign 4
_heapmsg:
  .asciz "mhs (fun): no heap\n"
  .balign 8
_argv_base:
  .skip 8
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
_seq:
  .word 0x0000505b
  fn.combi.t0 2, [1,0,0,0,0,0]
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
  .word 0x0000505b
  .word 0x0000255b
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
  .word 0x0000505b
  .word 0x0000255b
  la a1, _cur_fd
  sw a0, 0(a1)
  .word 0x0000000b
  .balign 4
_pm_putbf:
  .word 0x0000105b
  .word _io_putbf+1
  .balign 4
_io_putbf:
  .word 0x0000505b
  .word 0x0000255b
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
  .word 0x0000505b
  .word 0x0000255b
  csrw 0xb00, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xb02:
  .word 0x0000105b
  .word _csrw_0xb02+1
  .balign 4
_csrw_0xb02:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0xb02, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xc00:
  .word 0x0000105b
  .word _csrw_0xc00+1
  .balign 4
_csrw_0xc00:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0xc00, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0xc02:
  .word 0x0000105b
  .word _csrw_0xc02+1
  .balign 4
_csrw_0xc02:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0xc02, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x320:
  .word 0x0000105b
  .word _csrw_0x320+1
  .balign 4
_csrw_0x320:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x320, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d0:
  .word 0x0000105b
  .word _csrw_0x7d0+1
  .balign 4
_csrw_0x7d0:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7d0, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d2:
  .word 0x0000105b
  .word _csrw_0x7d2+1
  .balign 4
_csrw_0x7d2:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7d2, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d4:
  .word 0x0000105b
  .word _csrw_0x7d4+1
  .balign 4
_csrw_0x7d4:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7d4, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d6:
  .word 0x0000105b
  .word _csrw_0x7d6+1
  .balign 4
_csrw_0x7d6:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7d6, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7d8:
  .word 0x0000105b
  .word _csrw_0x7d8+1
  .balign 4
_csrw_0x7d8:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7d8, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7da:
  .word 0x0000105b
  .word _csrw_0x7da+1
  .balign 4
_csrw_0x7da:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7da, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7dc:
  .word 0x0000105b
  .word _csrw_0x7dc+1
  .balign 4
_csrw_0x7dc:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7dc, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7de:
  .word 0x0000105b
  .word _csrw_0x7de+1
  .balign 4
_csrw_0x7de:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7de, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e0:
  .word 0x0000105b
  .word _csrw_0x7e0+1
  .balign 4
_csrw_0x7e0:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e0, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e2:
  .word 0x0000105b
  .word _csrw_0x7e2+1
  .balign 4
_csrw_0x7e2:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e2, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e4:
  .word 0x0000105b
  .word _csrw_0x7e4+1
  .balign 4
_csrw_0x7e4:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e4, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e6:
  .word 0x0000105b
  .word _csrw_0x7e6+1
  .balign 4
_csrw_0x7e6:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e6, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e7:
  .word 0x0000105b
  .word _csrw_0x7e7+1
  .balign 4
_csrw_0x7e7:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e7, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e8:
  .word 0x0000105b
  .word _csrw_0x7e8+1
  .balign 4
_csrw_0x7e8:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e8, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7e9:
  .word 0x0000105b
  .word _csrw_0x7e9+1
  .balign 4
_csrw_0x7e9:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7e9, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ea:
  .word 0x0000105b
  .word _csrw_0x7ea+1
  .balign 4
_csrw_0x7ea:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7ea, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7eb:
  .word 0x0000105b
  .word _csrw_0x7eb+1
  .balign 4
_csrw_0x7eb:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7eb, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ec:
  .word 0x0000105b
  .word _csrw_0x7ec+1
  .balign 4
_csrw_0x7ec:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7ec, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ed:
  .word 0x0000105b
  .word _csrw_0x7ed+1
  .balign 4
_csrw_0x7ed:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7ed, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ee:
  .word 0x0000105b
  .word _csrw_0x7ee+1
  .balign 4
_csrw_0x7ee:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7ee, a0
  .word 0x0000000b
  .balign 4
_pm_csrw_0x7ef:
  .word 0x0000105b
  .word _csrw_0x7ef+1
  .balign 4
_csrw_0x7ef:
  .word 0x0000505b
  .word 0x0000255b
  csrw 0x7ef, a0
  .word 0x0000000b
  .balign 4
_pm_arr_setn:
  .word 0x0000105b
  .word _arr_setn+1
  .balign 4
_arr_setn:
  .word 0x0000505b
  .word 0x0000255b
  la t0, _arr_n
  sw a0, 0(t0)
  .word 0x0000000b
  .balign 4
_pm_arr_setsl:
  .word 0x0000105b
  .word _arr_setsl+1
  .balign 4
_arr_setsl:
  .word 0x0000505b
  .word 0x0000255b
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
  .word 0x0000505b
  .word 0x0000255b
  lw a0, 0(a0)
  andi a0, a0, -4
  jr a0
  .balign 4
_pm_arr_size:
  .word 0x0000105b
  .word _arr_size+1
  .balign 4
_arr_size:
  .word 0x0000505b
  .word 0x0000255b
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
  csrr t0, 0x7c0
  sw a2, 0(t0)
  addi t1, t0, 4
  mv t3, a2
1:
  beqz t3, 2f
  sw a0, 0(t1)
  addi t1, t1, 4
  addi t3, t3, -1
  j 1b
2:
  addi t1, t1, 7
  andi t1, t1, -8
  csrw 0x7c0, t1
  fn.databox a0,t0
  jr a0
  .balign 4
_pm_arr_copy:
  .word 0x0000105b
  .word _arr_copy+1
  .balign 4
_arr_copy:
  .word 0x0000505b
  .word 0x0000255b
  lw a2, 0(a0)
  csrr t0, 0x7c0
  sw a2, 0(t0)
  addi t1, t0, 4
  addi t4, a0, 4
  mv t3, a2
1:
  beqz t3, 2f
  lw t5, 0(t4)
  sw t5, 0(t1)
  addi t1, t1, 4
  addi t4, t4, 4
  addi t3, t3, -1
  j 1b
2:
  addi t1, t1, 7
  andi t1, t1, -8
  csrw 0x7c0, t1
  fn.databox a0,t0
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
  .balign 4
_io_pathc:
  .word 0x0000505b
  .word 0x0000255b
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
  .word 0x0000505b
  .word 0x0000255b
  la t0, _pathbuf
  la t1, _pathlen
  lw t2, 0(t1)
  add t3, t0, t2
  sb zero, 0(t3)
  sw zero, 0(t1)
  li t4, 0
  beqz a0, 1f
  li t5, 1
  bne a0, t5, 2f
  li t4, 0x241
  j 1f
2:
  li t5, 2
  bne a0, t5, 3f
  li t4, 0x441
  j 1f
3:
  li t4, 0x42
1:
  li a0, -100
  la a1, _pathbuf
  mv a2, t4
  li a3, 0x1b6
  li a7, 56
  ecall
  .word 0x0005755b
  jr a0
  .balign 4
_io_close:
  .word 0x0000505b
  .word 0x0000255b
  li a7, 57
  ecall
  .word 0x0000000b
  .balign 4
_io_getbf:
  la a2, _cur_fd
  lw a0, 0(a2)
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
_io_getb:
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
  .word 0x0000505b
  .word 0x0000255b
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
_io_argrd:
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
  .balign 8
_pathlen:
  .skip 8
  .balign 8
_arg_ptr:
  .skip 8
  .balign 8
_arg_off:
  .skip 8
  .globl _fungraph_start
_fungraph_start:
# fun assembly : funboot/Nopio  (entry @0)
	.text
	.globl	Control.Applicative.$2a$3e$24dflt
	.globl	Control.Applicative.$3c$2a$24dflt
	.globl	Control.Applicative.$3c$2a$3e
	.globl	Control.Applicative.Applicative$24C
	.globl	Control.Applicative.Applicative$24super1
	.globl	Control.Applicative.liftA2$24dflt
	.globl	Control.Monad.$3e$3e$3d
	.globl	Control.Monad.ap
	.globl	Control.Monad.return
	.globl	Data.Functor.$3c$24
	.globl	Data.Functor.$3c$24$24dflt
	.globl	Data.Functor.fmap
	.globl	Nop.main
	.globl	Primitives.primBind
	.globl	Primitives.primPerformIO
	.globl	Primitives.primReturn
	.globl	Primitives.primThen
	.globl	System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  Nop.main
	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
Nop.main:	fn.link  L40
	fn.link  System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	fn.elink Control.Monad.return
L40:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 3 ---
Control.Monad.return:	fn.link  L52
	fn.combi.t1 2, [1,0,0,0,0,0]
L52:	fn.combi.t0 4, [3,0,0,0,0,0]
# --- block 4 ---
System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29:	fn.link  Primitives.primReturn
	fn.link  Primitives.primThen
	fn.link  Primitives.primBind
	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.combi.t9 5, [4,0,1,2,3,0]
# --- block 5 ---
System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29:	fn.link  L104
	fn.link  L112
	fn.link  L120
	fn.link  L128
	fn.link  Primitives.primReturn
	fn.link  System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	fn.elink Control.Applicative.Applicative$24C
# --- block 6 ---
L104:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.liftA2$24dflt
# --- block 7 ---
L112:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.$3c$2a$24dflt
# --- block 8 ---
L120:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.$2a$3e$24dflt
# --- block 9 ---
L128:	fn.link  System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	fn.elink Control.Monad.ap
# --- block 10 ---
Control.Applicative.Applicative$24C:	fn.link  L148
	fn.link  L152
	fn.combi.t7 4, [0,1,2,3,0,0]
L148:	fn.combi.t23 6, [5,0,1,2,3,4]
L152:	fn.combi.t23 6, [0,1,2,3,5,4]
# --- block 11 ---
System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29:	fn.link  L168
	fn.link  L184
	fn.combi.t2 3, [2,0,1,0,0,0]
# --- block 12 ---
L168:	fn.link  System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	fn.elink Data.Functor.$3c$24$24dflt
# --- block 13 ---
L176:	fn.link  Primitives.primReturn
	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 14 ---
L184:	fn.link  L176
	fn.link  Primitives.primBind
	fn.combi.t6 4, [0,3,1,2,0,0]
# --- block 15 ---
Primitives.primBind:	fn.link  L224
	fn.link  L208
	fn.combi.t7 4, [0,1,2,3,0,0]
L208:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 16 ---
L212:	fn.link  L220
	fn.combi.t5 4, [0,1,3,2,0,0]
L220:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 17 ---
L224:	fn.link  L212
	fn.link  L236
	fn.combi.t16 5, [0,2,1,3,4,0]
L236:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 18 ---
Primitives.primReturn:	fn.link  L252
	fn.link  L256
	fn.combi.t3 3, [0,1,2,0,0,0]
L252:	fn.combi.t1 2, [1,0,0,0,0,0]
L256:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 19 ---
Data.Functor.$3c$24$24dflt:	fn.link  L276
	fn.link  Data.Functor.fmap
	fn.link  L280
	fn.combi.t5 4, [0,1,3,2,0,0]
L276:	fn.combi.t0 2, [0,0,0,0,0,0]
L280:	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 20 ---
Data.Functor.fmap:	fn.link  L292
	fn.combi.t1 2, [1,0,0,0,0,0]
L292:	fn.combi.t0 2, [0,0,0,0,0,0]
# --- block 21 ---
Control.Monad.ap:	fn.link  L316
	fn.link  Control.Monad.$3e$3e$3d
	fn.combi.t42 5, [0,2,3,1,2,4]
# --- block 22 ---
L308:	fn.link  Control.Monad.return
	fn.combi.t6 4, [0,1,2,3,0,0]
# --- block 23 ---
L316:	fn.link  L308
	fn.link  Control.Monad.$3e$3e$3d
	fn.combi.t42 5, [0,2,3,1,2,4]
# --- block 24 ---
Control.Monad.$3e$3e$3d:	fn.link  L336
	fn.combi.t1 2, [1,0,0,0,0,0]
L336:	fn.combi.t0 4, [1,0,0,0,0,0]
# --- block 25 ---
Control.Applicative.$2a$3e$24dflt:	fn.link  L352
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t16 4, [0,2,1,2,3,0]
# --- block 26 ---
L352:	fn.link  L368
	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.$3c$24
	fn.combi.t5 4, [0,1,3,2,0,0]
L368:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 27 ---
Control.Applicative.$3c$2a$3e:	fn.link  L380
	fn.combi.t1 2, [1,0,0,0,0,0]
L380:	fn.combi.t0 6, [2,0,0,0,0,0]
# --- block 28 ---
Data.Functor.$3c$24:	fn.link  L392
	fn.combi.t1 2, [1,0,0,0,0,0]
L392:	fn.combi.t0 2, [1,0,0,0,0,0]
# --- block 29 ---
Control.Applicative.Applicative$24super1:	fn.link  L404
	fn.combi.t1 2, [1,0,0,0,0,0]
L404:	fn.combi.t0 6, [0,0,0,0,0,0]
# --- block 30 ---
Control.Applicative.$3c$2a$24dflt:	fn.link  L420
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t16 4, [0,2,1,2,3,0]
# --- block 31 ---
L420:	fn.link  L436
	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.fmap
	fn.combi.t5 4, [0,1,3,2,0,0]
L436:	fn.combi.t0 2, [0,0,0,0,0,0]
# --- block 32 ---
Control.Applicative.liftA2$24dflt:	fn.link  L452
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t46 5, [0,2,1,2,3,4]
# --- block 33 ---
L452:	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.fmap
	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 34 ---
Primitives.primThen:	fn.link  L492
	fn.link  L476
	fn.combi.t7 4, [0,1,2,3,0,0]
L476:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 35 ---
L480:	fn.link  L488
	fn.combi.t2 4, [0,1,2,0,0,0]
L488:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 36 ---
L492:	fn.link  L480
	fn.link  L504
	fn.combi.t16 5, [0,2,1,3,4,0]
L504:	fn.combi.t0 1, [0,0,0,0,0,0]

# --- unimplemented foreign-import / primitive stubs ---
	.balign 4
_unimpfi__$26closeb:
	la a0, _unimpfi__$26closeb$name
	j _unimpfi_halt
_unimpfi__$26closeb$name:
	.asciz "&closeb"
	.balign 4
	.balign 4
_unimpfi_acos:
	la a0, _unimpfi_acos$name
	j _unimpfi_halt
_unimpfi_acos$name:
	.asciz "acos"
	.balign 4
	.balign 4
_unimpfi_asin:
	la a0, _unimpfi_asin$name
	j _unimpfi_halt
_unimpfi_asin$name:
	.asciz "asin"
	.balign 4
	.balign 4
_unimpfi_atan:
	la a0, _unimpfi_atan$name
	j _unimpfi_halt
_unimpfi_atan$name:
	.asciz "atan"
	.balign 4
	.balign 4
_unimpfi_atan2:
	la a0, _unimpfi_atan2$name
	j _unimpfi_halt
_unimpfi_atan2$name:
	.asciz "atan2"
	.balign 4
	.balign 4
_unimpfi_calloc:
	la a0, _unimpfi_calloc$name
	j _unimpfi_halt
_unimpfi_calloc$name:
	.asciz "calloc"
	.balign 4
	.balign 4
_unimpfi_cos:
	la a0, _unimpfi_cos$name
	j _unimpfi_halt
_unimpfi_cos$name:
	.asciz "cos"
	.balign 4
	.balign 4
_unimpfi_exp:
	la a0, _unimpfi_exp$name
	j _unimpfi_halt
_unimpfi_exp$name:
	.asciz "exp"
	.balign 4
	.balign 4
_unimpfi_free:
	la a0, _unimpfi_free$name
	j _unimpfi_halt
_unimpfi_free$name:
	.asciz "free"
	.balign 4
	.balign 4
_unimpfi_iswindows:
	la a0, _unimpfi_iswindows$name
	j _unimpfi_halt
_unimpfi_iswindows$name:
	.asciz "iswindows"
	.balign 4
	.balign 4
_unimpfi_log:
	la a0, _unimpfi_log$name
	j _unimpfi_halt
_unimpfi_log$name:
	.asciz "log"
	.balign 4
	.balign 4
_unimpfi_malloc:
	la a0, _unimpfi_malloc$name
	j _unimpfi_halt
_unimpfi_malloc$name:
	.asciz "malloc"
	.balign 4
	.balign 4
_unimpfi_peekPtr:
	la a0, _unimpfi_peekPtr$name
	j _unimpfi_halt
_unimpfi_peekPtr$name:
	.asciz "peekPtr"
	.balign 4
	.balign 4
_unimpfi_peekWord:
	la a0, _unimpfi_peekWord$name
	j _unimpfi_halt
_unimpfi_peekWord$name:
	.asciz "peekWord"
	.balign 4
	.balign 4
_unimpfi_peek_flt:
	la a0, _unimpfi_peek_flt$name
	j _unimpfi_halt
_unimpfi_peek_flt$name:
	.asciz "peek_flt"
	.balign 4
	.balign 4
_unimpfi_peek_int:
	la a0, _unimpfi_peek_int$name
	j _unimpfi_halt
_unimpfi_peek_int$name:
	.asciz "peek_int"
	.balign 4
	.balign 4
_unimpfi_peek_int16:
	la a0, _unimpfi_peek_int16$name
	j _unimpfi_halt
_unimpfi_peek_int16$name:
	.asciz "peek_int16"
	.balign 4
	.balign 4
_unimpfi_peek_int32:
	la a0, _unimpfi_peek_int32$name
	j _unimpfi_halt
_unimpfi_peek_int32$name:
	.asciz "peek_int32"
	.balign 4
	.balign 4
_unimpfi_peek_int64:
	la a0, _unimpfi_peek_int64$name
	j _unimpfi_halt
_unimpfi_peek_int64$name:
	.asciz "peek_int64"
	.balign 4
	.balign 4
_unimpfi_peek_int8:
	la a0, _unimpfi_peek_int8$name
	j _unimpfi_halt
_unimpfi_peek_int8$name:
	.asciz "peek_int8"
	.balign 4
	.balign 4
_unimpfi_peek_llong:
	la a0, _unimpfi_peek_llong$name
	j _unimpfi_halt
_unimpfi_peek_llong$name:
	.asciz "peek_llong"
	.balign 4
	.balign 4
_unimpfi_peek_long:
	la a0, _unimpfi_peek_long$name
	j _unimpfi_halt
_unimpfi_peek_long$name:
	.asciz "peek_long"
	.balign 4
	.balign 4
_unimpfi_peek_uint:
	la a0, _unimpfi_peek_uint$name
	j _unimpfi_halt
_unimpfi_peek_uint$name:
	.asciz "peek_uint"
	.balign 4
	.balign 4
_unimpfi_peek_uint16:
	la a0, _unimpfi_peek_uint16$name
	j _unimpfi_halt
_unimpfi_peek_uint16$name:
	.asciz "peek_uint16"
	.balign 4
	.balign 4
_unimpfi_peek_uint32:
	la a0, _unimpfi_peek_uint32$name
	j _unimpfi_halt
_unimpfi_peek_uint32$name:
	.asciz "peek_uint32"
	.balign 4
	.balign 4
_unimpfi_peek_uint64:
	la a0, _unimpfi_peek_uint64$name
	j _unimpfi_halt
_unimpfi_peek_uint64$name:
	.asciz "peek_uint64"
	.balign 4
	.balign 4
_unimpfi_peek_uint8:
	la a0, _unimpfi_peek_uint8$name
	j _unimpfi_halt
_unimpfi_peek_uint8$name:
	.asciz "peek_uint8"
	.balign 4
	.balign 4
_unimpfi_peek_ullong:
	la a0, _unimpfi_peek_ullong$name
	j _unimpfi_halt
_unimpfi_peek_ullong$name:
	.asciz "peek_ullong"
	.balign 4
	.balign 4
_unimpfi_peek_ulong:
	la a0, _unimpfi_peek_ulong$name
	j _unimpfi_halt
_unimpfi_peek_ulong$name:
	.asciz "peek_ulong"
	.balign 4
	.balign 4
_unimpfi_pokePtr:
	la a0, _unimpfi_pokePtr$name
	j _unimpfi_halt
_unimpfi_pokePtr$name:
	.asciz "pokePtr"
	.balign 4
	.balign 4
_unimpfi_pokeWord:
	la a0, _unimpfi_pokeWord$name
	j _unimpfi_halt
_unimpfi_pokeWord$name:
	.asciz "pokeWord"
	.balign 4
	.balign 4
_unimpfi_poke_flt:
	la a0, _unimpfi_poke_flt$name
	j _unimpfi_halt
_unimpfi_poke_flt$name:
	.asciz "poke_flt"
	.balign 4
	.balign 4
_unimpfi_poke_int:
	la a0, _unimpfi_poke_int$name
	j _unimpfi_halt
_unimpfi_poke_int$name:
	.asciz "poke_int"
	.balign 4
	.balign 4
_unimpfi_poke_int16:
	la a0, _unimpfi_poke_int16$name
	j _unimpfi_halt
_unimpfi_poke_int16$name:
	.asciz "poke_int16"
	.balign 4
	.balign 4
_unimpfi_poke_int32:
	la a0, _unimpfi_poke_int32$name
	j _unimpfi_halt
_unimpfi_poke_int32$name:
	.asciz "poke_int32"
	.balign 4
	.balign 4
_unimpfi_poke_int64:
	la a0, _unimpfi_poke_int64$name
	j _unimpfi_halt
_unimpfi_poke_int64$name:
	.asciz "poke_int64"
	.balign 4
	.balign 4
_unimpfi_poke_int8:
	la a0, _unimpfi_poke_int8$name
	j _unimpfi_halt
_unimpfi_poke_int8$name:
	.asciz "poke_int8"
	.balign 4
	.balign 4
_unimpfi_poke_llong:
	la a0, _unimpfi_poke_llong$name
	j _unimpfi_halt
_unimpfi_poke_llong$name:
	.asciz "poke_llong"
	.balign 4
	.balign 4
_unimpfi_poke_long:
	la a0, _unimpfi_poke_long$name
	j _unimpfi_halt
_unimpfi_poke_long$name:
	.asciz "poke_long"
	.balign 4
	.balign 4
_unimpfi_poke_uint:
	la a0, _unimpfi_poke_uint$name
	j _unimpfi_halt
_unimpfi_poke_uint$name:
	.asciz "poke_uint"
	.balign 4
	.balign 4
_unimpfi_poke_uint16:
	la a0, _unimpfi_poke_uint16$name
	j _unimpfi_halt
_unimpfi_poke_uint16$name:
	.asciz "poke_uint16"
	.balign 4
	.balign 4
_unimpfi_poke_uint32:
	la a0, _unimpfi_poke_uint32$name
	j _unimpfi_halt
_unimpfi_poke_uint32$name:
	.asciz "poke_uint32"
	.balign 4
	.balign 4
_unimpfi_poke_uint64:
	la a0, _unimpfi_poke_uint64$name
	j _unimpfi_halt
_unimpfi_poke_uint64$name:
	.asciz "poke_uint64"
	.balign 4
	.balign 4
_unimpfi_poke_uint8:
	la a0, _unimpfi_poke_uint8$name
	j _unimpfi_halt
_unimpfi_poke_uint8$name:
	.asciz "poke_uint8"
	.balign 4
	.balign 4
_unimpfi_poke_ullong:
	la a0, _unimpfi_poke_ullong$name
	j _unimpfi_halt
_unimpfi_poke_ullong$name:
	.asciz "poke_ullong"
	.balign 4
	.balign 4
_unimpfi_poke_ulong:
	la a0, _unimpfi_poke_ulong$name
	j _unimpfi_halt
_unimpfi_poke_ulong$name:
	.asciz "poke_ulong"
	.balign 4
	.balign 4
_unimpfi_sin:
	la a0, _unimpfi_sin$name
	j _unimpfi_halt
_unimpfi_sin$name:
	.asciz "sin"
	.balign 4
	.balign 4
_unimpfi_sizeof_int:
	la a0, _unimpfi_sizeof_int$name
	j _unimpfi_halt
_unimpfi_sizeof_int$name:
	.asciz "sizeof_int"
	.balign 4
	.balign 4
_unimpfi_sizeof_llong:
	la a0, _unimpfi_sizeof_llong$name
	j _unimpfi_halt
_unimpfi_sizeof_llong$name:
	.asciz "sizeof_llong"
	.balign 4
	.balign 4
_unimpfi_sizeof_long:
	la a0, _unimpfi_sizeof_long$name
	j _unimpfi_halt
_unimpfi_sizeof_long$name:
	.asciz "sizeof_long"
	.balign 4
	.balign 4
_unimpfi_sqrt:
	la a0, _unimpfi_sqrt$name
	j _unimpfi_halt
_unimpfi_sqrt$name:
	.asciz "sqrt"
	.balign 4
	.balign 4
_unimpfi_tan:
	la a0, _unimpfi_tan$name
	j _unimpfi_halt
_unimpfi_tan$name:
	.asciz "tan"
	.balign 4
	.balign 4
_unimpfi_tmpname:
	la a0, _unimpfi_tmpname$name
	j _unimpfi_halt
_unimpfi_tmpname$name:
	.asciz "tmpname"
	.balign 4
	.balign 4
_unimpprim_catch:
	la a0, _unimpprim_catch$name
	j _unimpfi_halt
_unimpprim_catch$name:
	.asciz "catch"
	.balign 4
	.balign 4
_unimpprim_fread:
	la a0, _unimpprim_fread$name
	j _unimpfi_halt
_unimpprim_fread$name:
	.asciz "fread"
	.balign 4
	.balign 4
_unimpprim_fshow:
	la a0, _unimpprim_fshow$name
	j _unimpfi_halt
_unimpprim_fshow$name:
	.asciz "fshow"
	.balign 4
	.balign 4
_unimpprim_newCAStringLen:
	la a0, _unimpprim_newCAStringLen$name
	j _unimpfi_halt
_unimpprim_newCAStringLen$name:
	.asciz "newCAStringLen"
	.balign 4
	.balign 4
_unimpprim_peekCAString:
	la a0, _unimpprim_peekCAString$name
	j _unimpfi_halt
_unimpprim_peekCAString$name:
	.asciz "peekCAString"
	.balign 4
	.balign 4
_unimpprim_peekCAStringLen:
	la a0, _unimpprim_peekCAStringLen$name
	j _unimpfi_halt
_unimpprim_peekCAStringLen$name:
	.asciz "peekCAStringLen"
	.balign 4
	.balign 4
_unimpprim_rnf:
	la a0, _unimpprim_rnf$name
	j _unimpfi_halt
_unimpprim_rnf$name:
	.asciz "rnf"
	.balign 4
	.balign 4
_unimpprim_scmp:
	la a0, _unimpprim_scmp$name
	j _unimpfi_halt
_unimpprim_scmp$name:
	.asciz "scmp"
	.balign 4
	.balign 4
_unimpprim_sequal:
	la a0, _unimpprim_sequal$name
	j _unimpfi_halt
_unimpprim_sequal$name:
	.asciz "sequal"
	.balign 4

_funtext_end:
