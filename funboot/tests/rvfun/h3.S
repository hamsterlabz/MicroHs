  .text
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
  li a1, 0x10011000
1:
  lbu a2, 0x14(a1)
  andi a2, a2, 0x20
  beqz a2, 1b
  sb a0, 0(a1)
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
  li a1, 0x10011000
1:
  lbu a2, 0x14(a1)
  andi a2, a2, 0x20
  beqz a2, 1b
  sb a0, 0(a1)
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
  .balign 8
_iobuf:
  .skip 8
  .balign 8
_cur_fd:
  .skip 8
  .globl _fungraph_start
_fungraph_start:
# fun assembly : funboot/h3  (entry @0)
	.text
	.globl	Control.Applicative.$2a$3e
	.globl	Control.Applicative.$2a$3e$24dflt
	.globl	Control.Applicative.$3c$2a
	.globl	Control.Applicative.$3c$2a$24dflt
	.globl	Control.Applicative.$3c$2a$3e
	.globl	Control.Applicative.$3c$7c$3e
	.globl	Control.Applicative.Alternative$24super1
	.globl	Control.Applicative.Applicative$24C
	.globl	Control.Applicative.Applicative$24super1
	.globl	Control.Applicative.asum
	.globl	Control.Applicative.empty
	.globl	Control.Applicative.guard
	.globl	Control.Applicative.liftA2$24dflt
	.globl	Control.Applicative.many
	.globl	Control.Applicative.many$24dflt
	.globl	Control.Applicative.optional
	.globl	Control.Applicative.pure
	.globl	Control.Applicative.some
	.globl	Control.Applicative.some$24dflt
	.globl	Control.Arrow.first
	.globl	Control.Error.error
	.globl	Control.Error.inst$24$28Control.Exception.Internal.Exception$40Control.Error.ErrorCall$29
	.globl	Control.Error.inst$24$28Data.Typeable.Typeable$40Control.Error.ErrorCall$29
	.globl	Control.Error.inst$24$28Text.Show.Show$40Control.Error.ErrorCall$29
	.globl	Control.Error.undefined
	.globl	Control.Exception.Internal.Exception$24super1
	.globl	Control.Exception.Internal.SomeException
	.globl	Control.Exception.Internal.catch
	.globl	Control.Exception.Internal.displayException
	.globl	Control.Exception.Internal.displayException$24dflt
	.globl	Control.Exception.Internal.fromException
	.globl	Control.Exception.Internal.fromException$24dflt
	.globl	Control.Exception.Internal.inst$24$28Control.Exception.Internal.Exception$40Control.Exception.Internal.NoMethodError$29
	.globl	Control.Exception.Internal.inst$24$28Data.Typeable.Typeable$40Control.Exception.Internal.NoMethodError$29
	.globl	Control.Exception.Internal.inst$24$28Data.Typeable.Typeable$40Control.Exception.Internal.SomeException$29
	.globl	Control.Exception.Internal.inst$24$28Text.Show.Show$40Control.Exception.Internal.NoMethodError$29
	.globl	Control.Exception.Internal.noMethodError
	.globl	Control.Exception.Internal.throw
	.globl	Control.Exception.Internal.toException
	.globl	Control.Exception.inst$24$28Control.Exception.Internal.Exception$40Control.Exception.Internal.SomeException$29
	.globl	Control.Exception.inst$24$28Text.Show.Show$40Control.Exception.Internal.SomeException$29
	.globl	Control.Exception.try
	.globl	Control.Monad.$3d$3c$3c
	.globl	Control.Monad.$3e$3e
	.globl	Control.Monad.$3e$3e$24dflt
	.globl	Control.Monad.$3e$3e$3d
	.globl	Control.Monad.Fail.fail
	.globl	Control.Monad.Monad$24super1
	.globl	Control.Monad.ap
	.globl	Control.Monad.mapM
	.globl	Control.Monad.mapM_
	.globl	Control.Monad.return
	.globl	Control.Monad.return$24dflt
	.globl	Control.Monad.sequence
	.globl	Control.Monad.sequence_
	.globl	Control.Monad.when
	.globl	Control.Monad.zipWithM_
	.globl	Data.Bits..$26.
	.globl	Data.Bits..$7c.
	.globl	Data.Bits.Bits$24C
	.globl	Data.Bits.bit
	.globl	Data.Bits.clearBit$24dflt
	.globl	Data.Bits.complement
	.globl	Data.Bits.complementBit$24dflt
	.globl	Data.Bits.inst$24$28Data.Bits.Bits$40Primitives.Int$29
	.globl	Data.Bits.popCount$24dflt
	.globl	Data.Bits.rotate
	.globl	Data.Bits.rotate$24dflt
	.globl	Data.Bits.rotateL
	.globl	Data.Bits.rotateR
	.globl	Data.Bits.rotateR$24dflt
	.globl	Data.Bits.setBit$24dflt
	.globl	Data.Bits.shift$24dflt
	.globl	Data.Bits.shiftL
	.globl	Data.Bits.shiftR
	.globl	Data.Bits.testBit$24dflt
	.globl	Data.Bits.xor
	.globl	Data.Bool.$26$26
	.globl	Data.Bool.$7c$7c
	.globl	Data.Bool.inst$24$28Data.Eq.Eq$40Data.Bool_Type.Bool$29
	.globl	Data.Bool.inst$24$28Text.Show.Show$40Data.Bool_Type.Bool$29
	.globl	Data.Bool.not
	.globl	Data.Bool_Type.False
	.globl	Data.Char.cmpString
	.globl	Data.Char.digitToInt
	.globl	Data.Char.encodeChar
	.globl	Data.Char.eqString
	.globl	Data.Char.inst$24$28Data.Eq.Eq$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	Data.Char.inst$24$28Data.Eq.Eq$40Primitives.Char$29
	.globl	Data.Char.inst$24$28Data.Ord.Ord$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	Data.Char.inst$24$28Data.Ord.Ord$40Primitives.Char$29
	.globl	Data.Char.inst$24$28Text.Show.Show$40Primitives.Char$29
	.globl	Data.Char.intToDigit
	.globl	Data.Char.isAlpha
	.globl	Data.Char.isDigit
	.globl	Data.Char.isHexDigit
	.globl	Data.Char.isLower
	.globl	Data.Char.isOctDigit
	.globl	Data.Char.isPrint
	.globl	Data.Char.isSpace
	.globl	Data.Char.isUpper
	.globl	Data.Char.toLower
	.globl	Data.Char.toUpper
	.globl	Data.Double.bin
	.globl	Data.Double.cmp
	.globl	Data.Double.inst$24$28Data.Eq.Eq$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Data.Floating.Floating$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Data.Fractional.Fractional$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Data.Num.Num$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Data.Ord.Ord$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Data.RealFloat.RealFloat$40Data.Double.Double$29
	.globl	Data.Double.inst$24$28Text.Show.Show$40Data.Double.Double$29
	.globl	Data.Double.un
	.globl	Data.Enum.Enum$24C
	.globl	Data.Enum.enumFrom
	.globl	Data.Enum.enumFrom$24dflt
	.globl	Data.Enum.enumFromThen
	.globl	Data.Enum.enumFromThen$24dflt
	.globl	Data.Enum.enumFromThenTo
	.globl	Data.Enum.enumFromThenTo$24dflt
	.globl	Data.Enum.enumFromTo
	.globl	Data.Enum.enumFromTo$24dflt
	.globl	Data.Enum.fromEnum
	.globl	Data.Enum.inst$24$28Data.Enum.Enum$40Primitives.Char$29
	.globl	Data.Enum.inst$24$28Data.Enum.Enum$40Primitives.Int$29
	.globl	Data.Enum.numericEnumFrom
	.globl	Data.Enum.numericEnumFromThen
	.globl	Data.Enum.numericEnumFromThenTo
	.globl	Data.Enum.numericEnumFromTo
	.globl	Data.Enum.pred$24dflt
	.globl	Data.Enum.succ
	.globl	Data.Enum.succ$24dflt
	.globl	Data.Enum.toEnum
	.globl	Data.Eq.$2f$3d
	.globl	Data.Eq.$2f$3d$24dflt
	.globl	Data.Eq.$3d$3d
	.globl	Data.FloatW.decodeFloat32
	.globl	Data.FloatW.decodeFloat64
	.globl	Data.FloatW.encodeFloat32
	.globl	Data.FloatW.encodeFloat64
	.globl	Data.FloatW.flt
	.globl	Data.FloatW.inst$24$28Data.Eq.Eq$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Data.Floating.Floating$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Data.Fractional.Fractional$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Data.Num.Num$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Data.Ord.Ord$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Data.RealFloat.RealFloat$40Primitives.FloatW$29
	.globl	Data.FloatW.inst$24$28Text.Show.Show$40Primitives.FloatW$29
	.globl	Data.FloatW.isDenFloat32
	.globl	Data.FloatW.isDenFloat64
	.globl	Data.FloatW.isInfFloat32
	.globl	Data.FloatW.isInfFloat64
	.globl	Data.FloatW.isNaNFloat32
	.globl	Data.FloatW.isNaNFloat64
	.globl	Data.FloatW.isNegZeroFloat32
	.globl	Data.FloatW.isNegZeroFloat64
	.globl	Data.Floating.$2a$2a$24dflt
	.globl	Data.Floating.Floating$24C
	.globl	Data.Floating.Floating$24super1
	.globl	Data.Floating.acos
	.globl	Data.Floating.acosh$24dflt
	.globl	Data.Floating.asin
	.globl	Data.Floating.asinh$24dflt
	.globl	Data.Floating.atan
	.globl	Data.Floating.atanh$24dflt
	.globl	Data.Floating.cos
	.globl	Data.Floating.cosh
	.globl	Data.Floating.cosh$24dflt
	.globl	Data.Floating.exp
	.globl	Data.Floating.expm1$24dflt
	.globl	Data.Floating.log
	.globl	Data.Floating.log1mexp$24dflt
	.globl	Data.Floating.log1p
	.globl	Data.Floating.log1p$24dflt
	.globl	Data.Floating.log1pexp$24dflt
	.globl	Data.Floating.logBase$24dflt
	.globl	Data.Floating.pi
	.globl	Data.Floating.sin
	.globl	Data.Floating.sinh
	.globl	Data.Floating.sinh$24dflt
	.globl	Data.Floating.sqrt
	.globl	Data.Floating.tan
	.globl	Data.Floating.tanh$24dflt
	.globl	Data.Fractional.$2f
	.globl	Data.Fractional.$5e$5e
	.globl	Data.Fractional.Fractional$24super1
	.globl	Data.Fractional.fromRational
	.globl	Data.Fractional.recip
	.globl	Data.Fractional.recip$24dflt
	.globl	Data.Function.$24$21
	.globl	Data.Function.on
	.globl	Data.Functor.$3c$24
	.globl	Data.Functor.$3c$24$24dflt
	.globl	Data.Functor.fmap
	.globl	Data.Functor.void
	.globl	Data.IORef.newIORef
	.globl	Data.IORef.readIORef
	.globl	Data.IORef.writeIORef
	.globl	Data.Int._showUnsignedNegInt
	.globl	Data.Int.inst$24$28Data.Eq.Eq$40Primitives.Int$29
	.globl	Data.Int.inst$24$28Data.Integral.Integral$40Primitives.Int$29
	.globl	Data.Int.inst$24$28Data.Num.Num$40Primitives.Int$29
	.globl	Data.Int.inst$24$28Data.Ord.Ord$40Primitives.Int$29
	.globl	Data.Int.inst$24$28Data.Real.Real$40Primitives.Int$29
	.globl	Data.Int.inst$24$28Text.Show.Show$40Primitives.Int$29
	.globl	Data.Int.showInt_
	.globl	Data.Integer._intListToInteger
	.globl	Data.Integer._integerToIntList
	.globl	Data.Integer.absI
	.globl	Data.Integer.add
	.globl	Data.Integer.add$27
	.globl	Data.Integer.addD
	.globl	Data.Integer.addI
	.globl	Data.Integer.digits
	.globl	Data.Integer.eqI
	.globl	Data.Integer.geI
	.globl	Data.Integer.gtI
	.globl	Data.Integer.inst$24$28Data.Eq.Eq$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.inst$24$28Data.Eq.Eq$40Data.Integer_Type.Sign$29
	.globl	Data.Integer.inst$24$28Data.Integral.Integral$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.inst$24$28Data.Num.Num$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.inst$24$28Data.Ord.Ord$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.inst$24$28Data.Real.Real$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.inst$24$28Text.Show.Show$40Data.Integer_Type.Integer$29
	.globl	Data.Integer.integerListBase
	.globl	Data.Integer.leI
	.globl	Data.Integer.ltI
	.globl	Data.Integer.ltW
	.globl	Data.Integer.mulD
	.globl	Data.Integer.mulI
	.globl	Data.Integer.mulM
	.globl	Data.Integer.mulSign
	.globl	Data.Integer.neI
	.globl	Data.Integer.negOneI
	.globl	Data.Integer.negateI
	.globl	Data.Integer.oneI
	.globl	Data.Integer.qrRes
	.globl	Data.Integer.quotI
	.globl	Data.Integer.quotRemB
	.globl	Data.Integer.quotRemD
	.globl	Data.Integer.quotRemI
	.globl	Data.Integer.sI
	.globl	Data.Integer.sub
	.globl	Data.Integer.sub$27
	.globl	Data.Integer.subI
	.globl	Data.Integer.subW
	.globl	Data.Integer.trim0
	.globl	Data.Integer.twoI
	.globl	Data.Integer.zeroI
	.globl	Data.Integer_Type._intToInteger
	.globl	Data.Integer_Type._integerToFloatW
	.globl	Data.Integer_Type._integerToInt
	.globl	Data.Integer_Type._wordToInteger
	.globl	Data.Integer_Type.maxD
	.globl	Data.Integral.$5e
	.globl	Data.Integral.Integral$24C
	.globl	Data.Integral.Integral$24super1
	.globl	Data.Integral.div
	.globl	Data.Integral.div$24dflt
	.globl	Data.Integral.divMod
	.globl	Data.Integral.divMod$24dflt
	.globl	Data.Integral.even
	.globl	Data.Integral.fromIntegral
	.globl	Data.Integral.gcd
	.globl	Data.Integral.mod$24dflt
	.globl	Data.Integral.odd
	.globl	Data.Integral.quot
	.globl	Data.Integral.quot$24dflt
	.globl	Data.Integral.quotRem
	.globl	Data.Integral.quotRem$24dflt
	.globl	Data.Integral.rem
	.globl	Data.Integral.rem$24dflt
	.globl	Data.Integral.toInteger
	.globl	Data.List.$21$21
	.globl	Data.List.$5c$5c
	.globl	Data.List.all
	.globl	Data.List.and
	.globl	Data.List.any
	.globl	Data.List.breakEnd
	.globl	Data.List.concat
	.globl	Data.List.deleteBy
	.globl	Data.List.deleteFirstsBy
	.globl	Data.List.drop
	.globl	Data.List.dropWhile
	.globl	Data.List.dropWhileEnd
	.globl	Data.List.elem
	.globl	Data.List.elemBy
	.globl	Data.List.elemIndex
	.globl	Data.List.filter
	.globl	Data.List.find
	.globl	Data.List.findIndex
	.globl	Data.List.findIndices
	.globl	Data.List.foldl
	.globl	Data.List.foldl$27
	.globl	Data.List.foldl1
	.globl	Data.List.foldr
	.globl	Data.List.foldr1
	.globl	Data.List.group
	.globl	Data.List.groupBy
	.globl	Data.List.head
	.globl	Data.List.init
	.globl	Data.List.inits
	.globl	Data.List.inst$24$28Data.Eq.Eq$40$28Data.List_Type.$5b$5d$40a$29$29
	.globl	Data.List.inst$24$28Text.Show.Show$40$28Data.List_Type.$5b$5d$40a$29$29
	.globl	Data.List.intercalate
	.globl	Data.List.intersect
	.globl	Data.List.intersectBy
	.globl	Data.List.intersperse
	.globl	Data.List.isInfixOf
	.globl	Data.List.isInfixOfBy
	.globl	Data.List.isPrefixOf
	.globl	Data.List.isPrefixOfBy
	.globl	Data.List.isSuffixOf
	.globl	Data.List.isSuffixOfBy
	.globl	Data.List.last
	.globl	Data.List.length
	.globl	Data.List.lines
	.globl	Data.List.lookup
	.globl	Data.List.lookupBy
	.globl	Data.List.map
	.globl	Data.List.mapAccumL
	.globl	Data.List.minimum
	.globl	Data.List.notElem
	.globl	Data.List.nub
	.globl	Data.List.nubBy
	.globl	Data.List.null
	.globl	Data.List.or
	.globl	Data.List.partition
	.globl	Data.List.repeat
	.globl	Data.List.replicate
	.globl	Data.List.reverse
	.globl	Data.List.scanl
	.globl	Data.List.scanl1
	.globl	Data.List.sort
	.globl	Data.List.sortBy
	.globl	Data.List.sortLE
	.globl	Data.List.span
	.globl	Data.List.spanEnd
	.globl	Data.List.splitAt
	.globl	Data.List.stripPrefix
	.globl	Data.List.stripPrefixBy
	.globl	Data.List.stripSuffix
	.globl	Data.List.sum
	.globl	Data.List.tail
	.globl	Data.List.tails
	.globl	Data.List.take
	.globl	Data.List.takeWhile
	.globl	Data.List.takeWhileEnd
	.globl	Data.List.union
	.globl	Data.List.unionBy
	.globl	Data.List.unlines
	.globl	Data.List.unwords
	.globl	Data.List.unzip
	.globl	Data.List.unzip3
	.globl	Data.List.words
	.globl	Data.List.zip
	.globl	Data.List.zip3
	.globl	Data.List.zipWith
	.globl	Data.List.zipWith3
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$3a
	.globl	Data.List_Type.concatMap
	.globl	Data.Maybe.catMaybes
	.globl	Data.Maybe.fromJust
	.globl	Data.Maybe.fromMaybe
	.globl	Data.Maybe.inst$24$28Control.Applicative.Alternative$40Data.Maybe_Type.Maybe$29
	.globl	Data.Maybe.inst$24$28Control.Applicative.Applicative$40Data.Maybe_Type.Maybe$29
	.globl	Data.Maybe.inst$24$28Control.Monad.Monad$40Data.Maybe_Type.Maybe$29
	.globl	Data.Maybe.inst$24$28Data.Eq.Eq$40$28Data.Maybe_Type.Maybe$40a$29$29
	.globl	Data.Maybe.inst$24$28Data.Functor.Functor$40Data.Maybe_Type.Maybe$29
	.globl	Data.Maybe.inst$24$28Text.Show.Show$40$28Data.Maybe_Type.Maybe$40a$29$29
	.globl	Data.Maybe.isJust
	.globl	Data.Maybe.isNothing
	.globl	Data.Maybe.mapMaybe
	.globl	Data.Maybe.maybeToList
	.globl	Data.Num.$2a
	.globl	Data.Num.$2b
	.globl	Data.Num.$2d
	.globl	Data.Num.Num$24C
	.globl	Data.Num.abs
	.globl	Data.Num.fromInteger
	.globl	Data.Num.negate
	.globl	Data.Num.negate$24dflt
	.globl	Data.Num.signum
	.globl	Data.Num.subtract
	.globl	Data.Ord.$3c
	.globl	Data.Ord.$3c$24dflt
	.globl	Data.Ord.$3c$3d
	.globl	Data.Ord.$3c$3d$24dflt
	.globl	Data.Ord.$3e
	.globl	Data.Ord.$3e$24dflt
	.globl	Data.Ord.$3e$3d
	.globl	Data.Ord.$3e$3d$24dflt
	.globl	Data.Ord.Ord$24C
	.globl	Data.Ord.Ord$24super1
	.globl	Data.Ord.compare
	.globl	Data.Ord.compare$24dflt
	.globl	Data.Ord.inst$24$28Data.Eq.Eq$40Data.Ordering_Type.Ordering$29
	.globl	Data.Ord.max
	.globl	Data.Ord.max$24dflt
	.globl	Data.Ord.min
	.globl	Data.Ord.min$24dflt
	.globl	Data.Ratio.$25
	.globl	Data.Ratio.denominator
	.globl	Data.Ratio.inst$24$28Data.Eq.Eq$40$28Data.Ratio_Type.Ratio$40a$29$29
	.globl	Data.Ratio.inst$24$28Data.Fractional.Fractional$40$28Data.Ratio_Type.Ratio$40a$29$29
	.globl	Data.Ratio.inst$24$28Data.Num.Num$40$28Data.Ratio_Type.Ratio$40a$29$29
	.globl	Data.Ratio.inst$24$28Text.Show.Show$40$28Data.Ratio_Type.Ratio$40a$29$29
	.globl	Data.Ratio.numerator
	.globl	Data.Ratio.rationalInfinity
	.globl	Data.Ratio.rationalNaN
	.globl	Data.Ratio.reduce
	.globl	Data.Ratio_Type.$3a$25
	.globl	Data.Ratio_Type._integerToRational
	.globl	Data.Real.Real$24super1
	.globl	Data.Real.toRational
	.globl	Data.RealFloat.RealFloat$24C
	.globl	Data.RealFloat.RealFloat$24super1
	.globl	Data.RealFloat.atan2
	.globl	Data.RealFloat.clamp
	.globl	Data.RealFloat.decodeFloat
	.globl	Data.RealFloat.encodeFloat
	.globl	Data.RealFloat.exponent$24dflt
	.globl	Data.RealFloat.floatDigits
	.globl	Data.RealFloat.floatRadix
	.globl	Data.RealFloat.floatRange
	.globl	Data.RealFloat.isDenormalized
	.globl	Data.RealFloat.isIEEE
	.globl	Data.RealFloat.isInfinite
	.globl	Data.RealFloat.isNaN
	.globl	Data.RealFloat.isNegativeZero
	.globl	Data.RealFloat.scaleFloat$24dflt
	.globl	Data.RealFloat.significand$24dflt
	.globl	Data.Records.setField
	.globl	Data.String.fromString
	.globl	Data.String.inst$24$28Data.String.IsString$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	Data.Text.T
	.globl	Data.Text.append
	.globl	Data.Text.head
	.globl	Data.Text.inst$24$28Data.Eq.Eq$40Data.Text.Text$29
	.globl	Data.Text.inst$24$28Data.Ord.Ord$40Data.Text.Text$29
	.globl	Data.Tuple.fst
	.globl	Data.Tuple.inst$24$28Text.Show.Show$40$28$2c$2c$40a$40b$40c$29$29
	.globl	Data.Tuple.snd
	.globl	Data.Typeable.cast
	.globl	Data.Typeable.inst$24$28Data.Eq.Eq$40Data.Typeable.TypeRep$29
	.globl	Data.Typeable.mkTyCon
	.globl	Data.Typeable.mkTyConApp
	.globl	Data.Typeable.trMd5
	.globl	Data.Typeable.typeRep
	.globl	Data.Version.Version
	.globl	Data.Version.get.Version.versionBranch
	.globl	Data.Version.showVersion
	.globl	Data.Word.inst$24$28Data.Bits.Bits$40Primitives.Word$29
	.globl	Data.Word.inst$24$28Data.Eq.Eq$40Primitives.Word$29
	.globl	Data.Word.inst$24$28Data.Integral.Integral$40Primitives.Word$29
	.globl	Data.Word.inst$24$28Data.Num.Num$40Primitives.Word$29
	.globl	Data.Word.inst$24$28Data.Ord.Ord$40Primitives.Word$29
	.globl	Data.Word.inst$24$28Data.Real.Real$40Primitives.Word$29
	.globl	Debug.Trace.trace
	.globl	Debug.Trace.traceM
	.globl	Foreign.C.String.newCAString
	.globl	Foreign.C.String.withCAString
	.globl	Foreign.Marshal.Alloc.free
	.globl	Foreign.Ptr.inst$24$28Data.Eq.Eq$40$28Primitives.Ptr$40a$29$29
	.globl	Foreign.Ptr.inst$24$28Text.Show.Show$40$28Primitives.Ptr$40a$29$29
	.globl	Foreign.Ptr.nullPtr
	.globl	GHC.Stack.HasCallStack$24C
	.globl	MicroHs.Abstract.abstractLazy
	.globl	MicroHs.Abstract.abstractSc
	.globl	MicroHs.Abstract.addSc
	.globl	MicroHs.Abstract.argCompress
	.globl	MicroHs.Abstract.argReorder
	.globl	MicroHs.Abstract.combineLazy
	.globl	MicroHs.Abstract.combineSc
	.globl	MicroHs.Abstract.compileExpLazy
	.globl	MicroHs.Abstract.compileExpSc
	.globl	MicroHs.Abstract.compileOpt
	.globl	MicroHs.Abstract.discardSc
	.globl	MicroHs.Abstract.dupPair
	.globl	MicroHs.Abstract.etaApply
	.globl	MicroHs.Abstract.etaRewrite
	.globl	MicroHs.Abstract.etaShrink
	.globl	MicroHs.Abstract.fits12
	.globl	MicroHs.Abstract.fitsSh
	.globl	MicroHs.Abstract.immOpL
	.globl	MicroHs.Abstract.immOpR
	.globl	MicroHs.Abstract.intLit
	.globl	MicroHs.Abstract.isArithOp
	.globl	MicroHs.Abstract.isOp
	.globl	MicroHs.Abstract.isPrim
	.globl	MicroHs.Abstract.noDuplicates
	.globl	MicroHs.Abstract.opInfix
	.globl	MicroHs.Abstract.removeSKI
	.globl	MicroHs.Abstract.scA
	.globl	MicroHs.Abstract.scB
	.globl	MicroHs.Abstract.scB$27
	.globl	MicroHs.Abstract.scC
	.globl	MicroHs.Abstract.scC$27
	.globl	MicroHs.Abstract.scC$27B
	.globl	MicroHs.Abstract.scI
	.globl	MicroHs.Abstract.scK
	.globl	MicroHs.Abstract.scK2
	.globl	MicroHs.Abstract.scK3
	.globl	MicroHs.Abstract.scK4
	.globl	MicroHs.Abstract.scO
	.globl	MicroHs.Abstract.scP
	.globl	MicroHs.Abstract.scR
	.globl	MicroHs.Abstract.scS
	.globl	MicroHs.Abstract.scS$27
	.globl	MicroHs.Abstract.scU
	.globl	MicroHs.Abstract.scZ
	.globl	MicroHs.Abstract.standardCombine
	.globl	MicroHs.Builtin.builtinMdl
	.globl	MicroHs.Builtin.mkBuiltin
	.globl	MicroHs.Compile.addPreludeImport
	.globl	MicroHs.Compile.compile
	.globl	MicroHs.Compile.compileBootModule
	.globl	MicroHs.Compile.compileCacheTop
	.globl	MicroHs.Compile.compileMany
	.globl	MicroHs.Compile.compileModule
	.globl	MicroHs.Compile.compileModuleCached
	.globl	MicroHs.Compile.findModulePath
	.globl	MicroHs.Compile.findPkgModule
	.globl	MicroHs.Compile.getCached
	.globl	MicroHs.Compile.getFileName
	.globl	MicroHs.Compile.getMhsDir
	.globl	MicroHs.Compile.hasLangCPP
	.globl	MicroHs.Compile.invertGraph
	.globl	MicroHs.Compile.loadDependencies
	.globl	MicroHs.Compile.loadDeps
	.globl	MicroHs.Compile.loadPkg
	.globl	MicroHs.Compile.maybeSaveCache
	.globl	MicroHs.Compile.mhsCacheName
	.globl	MicroHs.Compile.mhsDefines
	.globl	MicroHs.Compile.mhsVersion
	.globl	MicroHs.Compile.moduleToFile
	.globl	MicroHs.Compile.noSymbols
	.globl	MicroHs.Compile.openFilePath
	.globl	MicroHs.Compile.packageDir
	.globl	MicroHs.Compile.packageSuffix
	.globl	MicroHs.Compile.packageTxtSuffix
	.globl	MicroHs.Compile.putStrInd
	.globl	MicroHs.Compile.putStrLnInd
	.globl	MicroHs.Compile.readModulePath
	.globl	MicroHs.Compile.runCPP
	.globl	MicroHs.Compile.runCPPTmp
	.globl	MicroHs.Compile.validateCache
	.globl	MicroHs.CompileCache.addBoot
	.globl	MicroHs.CompileCache.addPackage
	.globl	MicroHs.CompileCache.addWorking
	.globl	MicroHs.CompileCache.cachedModuleNames
	.globl	MicroHs.CompileCache.cachedModules
	.globl	MicroHs.CompileCache.chksumOf
	.globl	MicroHs.CompileCache.deleteFromCache
	.globl	MicroHs.CompileCache.emptyCache
	.globl	MicroHs.CompileCache.forceCache
	.globl	MicroHs.CompileCache.get.Cache.boots
	.globl	MicroHs.CompileCache.get.Cache.cache
	.globl	MicroHs.CompileCache.get.Cache.pkgs
	.globl	MicroHs.CompileCache.get.Cache.tables
	.globl	MicroHs.CompileCache.get.Cache.working
	.globl	MicroHs.CompileCache.getCompMdls
	.globl	MicroHs.CompileCache.getImportDeps
	.globl	MicroHs.CompileCache.getPkgs
	.globl	MicroHs.CompileCache.inst$24$28Data.Records.SetField$40$22boots$22$40MicroHs.CompileCache.Cache$40$28Data.List_Type.$5b$5d$40MicroHs.Ident.Ident$29$29
	.globl	MicroHs.CompileCache.inst$24$28Data.Records.SetField$40$22cache$22$40MicroHs.CompileCache.Cache$40$28MicroHs.IdentMap.Map$40MicroHs.CompileCache.CacheEntry$29$29
	.globl	MicroHs.CompileCache.inst$24$28Data.Records.SetField$40$22pkgs$22$40MicroHs.CompileCache.Cache$40$28Data.List_Type.$5b$5d$40$28$2c$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$40MicroHs.Package.Package$29$29$29
	.globl	MicroHs.CompileCache.inst$24$28Data.Records.SetField$40$22tables$22$40MicroHs.CompileCache.Cache$40MicroHs.TypeCheck.GlobTables$29
	.globl	MicroHs.CompileCache.inst$24$28Data.Records.SetField$40$22working$22$40MicroHs.CompileCache.Cache$40$28Data.List_Type.$5b$5d$40MicroHs.Ident.Ident$29$29
	.globl	MicroHs.CompileCache.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.CompileCache.Cache$29
	.globl	MicroHs.CompileCache.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.CompileCache.CacheEntry$29
	.globl	MicroHs.CompileCache.loadCached
	.globl	MicroHs.CompileCache.lookupCache
	.globl	MicroHs.CompileCache.lookupCacheChksum
	.globl	MicroHs.CompileCache.saveCache
	.globl	MicroHs.CompileCache.setCacheTables
	.globl	MicroHs.CompileCache.tModuleOf
	.globl	MicroHs.CompileCache.workToDone
	.globl	MicroHs.Deriving.cannotDerive
	.globl	MicroHs.Deriving.decomp
	.globl	MicroHs.Deriving.derBounded
	.globl	MicroHs.Deriving.derData
	.globl	MicroHs.Deriving.derEnum
	.globl	MicroHs.Deriving.derEq
	.globl	MicroHs.Deriving.derLift
	.globl	MicroHs.Deriving.derNotYet
	.globl	MicroHs.Deriving.derOrd
	.globl	MicroHs.Deriving.derRead
	.globl	MicroHs.Deriving.derShow
	.globl	MicroHs.Deriving.derTypeable
	.globl	MicroHs.Deriving.deriveHdr
	.globl	MicroHs.Deriving.deriveNoHdr
	.globl	MicroHs.Deriving.deriveNoHdr$27
	.globl	MicroHs.Deriving.derivers
	.globl	MicroHs.Deriving.expandField
	.globl	MicroHs.Deriving.genHasField
	.globl	MicroHs.Deriving.genHasFields
	.globl	MicroHs.Deriving.getFieldTys
	.globl	MicroHs.Deriving.isNullary
	.globl	MicroHs.Deriving.mkGetName
	.globl	MicroHs.Deriving.mkHdr
	.globl	MicroHs.Deriving.mkPat
	.globl	MicroHs.Deriving.nameHasField
	.globl	MicroHs.Deriving.nameSetField
	.globl	MicroHs.Deriving.namegetField
	.globl	MicroHs.Deriving.namesetField
	.globl	MicroHs.Deriving.notYet
	.globl	MicroHs.Deriving.unIdentPar
	.globl	MicroHs.Desugar.cheap
	.globl	MicroHs.Desugar.checkDup
	.globl	MicroHs.Desugar.consCon
	.globl	MicroHs.Desugar.desugar
	.globl	MicroHs.Desugar.dsAlt
	.globl	MicroHs.Desugar.dsAlts
	.globl	MicroHs.Desugar.dsAltsL
	.globl	MicroHs.Desugar.dsBind
	.globl	MicroHs.Desugar.dsBinds
	.globl	MicroHs.Desugar.dsCase
	.globl	MicroHs.Desugar.dsCaseExp
	.globl	MicroHs.Desugar.dsCompr
	.globl	MicroHs.Desugar.dsDef
	.globl	MicroHs.Desugar.dsEqns
	.globl	MicroHs.Desugar.dsExpr
	.globl	MicroHs.Desugar.dsLazy
	.globl	MicroHs.Desugar.dsMatrix
	.globl	MicroHs.Desugar.dsMatrixL
	.globl	MicroHs.Desugar.dsPat
	.globl	MicroHs.Desugar.dsPatBind
	.globl	MicroHs.Desugar.eLet
	.globl	MicroHs.Desugar.eMatchErr
	.globl	MicroHs.Desugar.eSeq
	.globl	MicroHs.Desugar.encodeInteger
	.globl	MicroHs.Desugar.encodeRational
	.globl	MicroHs.Desugar.getDups
	.globl	MicroHs.Desugar.groupEq
	.globl	MicroHs.Desugar.iCons
	.globl	MicroHs.Desugar.iNil
	.globl	MicroHs.Desugar.lazier
	.globl	MicroHs.Desugar.letBind
	.globl	MicroHs.Desugar.letRecE
	.globl	MicroHs.Desugar.mkCase
	.globl	MicroHs.Desugar.mkTupleE
	.globl	MicroHs.Desugar.mkTupleSelE
	.globl	MicroHs.Desugar.mutualRec
	.globl	MicroHs.Desugar.newIdent
	.globl	MicroHs.Desugar.newIdents
	.globl	MicroHs.Desugar.newVar
	.globl	MicroHs.Desugar.newVars
	.globl	MicroHs.Desugar.nilCon
	.globl	MicroHs.Desugar.oneAlt
	.globl	MicroHs.Desugar.pArgs
	.globl	MicroHs.Desugar.pConOf
	.globl	MicroHs.Desugar.patVarsQ
	.globl	MicroHs.Desugar.showLDef
	.globl	MicroHs.Desugar.showLDefs
	.globl	MicroHs.Desugar.substAlpha
	.globl	MicroHs.Desugar.tupleCon
	.globl	MicroHs.Desugar.wrapTick
	.globl	MicroHs.EncodeData.cCons
	.globl	MicroHs.EncodeData.cNil
	.globl	MicroHs.EncodeData.caseTree
	.globl	MicroHs.EncodeData.conNo
	.globl	MicroHs.EncodeData.encCase
	.globl	MicroHs.EncodeData.encCaseNo
	.globl	MicroHs.EncodeData.encCaseScott
	.globl	MicroHs.EncodeData.encConstr
	.globl	MicroHs.EncodeData.encConstrNo
	.globl	MicroHs.EncodeData.encConstrScott
	.globl	MicroHs.EncodeData.encIfScott
	.globl	MicroHs.EncodeData.encList
	.globl	MicroHs.EncodeData.numConstr
	.globl	MicroHs.EncodeData.tuple
	.globl	MicroHs.Exp.App
	.globl	MicroHs.Exp.Lam
	.globl	MicroHs.Exp.Lit
	.globl	MicroHs.Exp.Morph
	.globl	MicroHs.Exp.Sc
	.globl	MicroHs.Exp.Var
	.globl	MicroHs.Exp.allVarsExp
	.globl	MicroHs.Exp.app2
	.globl	MicroHs.Exp.apps
	.globl	MicroHs.Exp.freeVars
	.globl	MicroHs.Exp.fromPat
	.globl	MicroHs.Exp.fromSpine
	.globl	MicroHs.Exp.getHoles
	.globl	MicroHs.Exp.inst$24$28Data.Eq.Eq$40MicroHs.Exp.Exp$29
	.globl	MicroHs.Exp.inst$24$28Data.Eq.Eq$40MicroHs.Exp.MScheme$29
	.globl	MicroHs.Exp.inst$24$28Data.Eq.Eq$40MicroHs.Exp.Pat$29
	.globl	MicroHs.Exp.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Exp.Exp$29
	.globl	MicroHs.Exp.inst$24$28Text.Show.Show$40MicroHs.Exp.Exp$29
	.globl	MicroHs.Exp.inst$24$28Text.Show.Show$40MicroHs.Exp.Pat$29
	.globl	MicroHs.Exp.lams
	.globl	MicroHs.Exp.lookupMorphMarker
	.globl	MicroHs.Exp.morphMarker
	.globl	MicroHs.Exp.ppExp
	.globl	MicroHs.Exp.schemeIx
	.globl	MicroHs.Exp.schemeName
	.globl	MicroHs.Exp.spine
	.globl	MicroHs.Exp.substExp
	.globl	MicroHs.ExpPrint.combVersion
	.globl	MicroHs.ExpPrint.encodeString
	.globl	MicroHs.ExpPrint.quoteString
	.globl	MicroHs.ExpPrint.toStringCMdl
	.globl	MicroHs.ExpPrint.toStringP
	.globl	MicroHs.ExpPrint.utf8Char
	.globl	MicroHs.ExpPrint.utf8encode
	.globl	MicroHs.Expr.Class
	.globl	MicroHs.Expr.Data
	.globl	MicroHs.Expr.Default
	.globl	MicroHs.Expr.Deriving
	.globl	MicroHs.Expr.DfltSign
	.globl	MicroHs.Expr.EApp
	.globl	MicroHs.Expr.EAt
	.globl	MicroHs.Expr.ECase
	.globl	MicroHs.Expr.ECon
	.globl	MicroHs.Expr.EDo
	.globl	MicroHs.Expr.EForall
	.globl	MicroHs.Expr.EIf
	.globl	MicroHs.Expr.ELam
	.globl	MicroHs.Expr.ELazy
	.globl	MicroHs.Expr.ELet
	.globl	MicroHs.Expr.EListish
	.globl	MicroHs.Expr.ELit
	.globl	MicroHs.Expr.EMultiIf
	.globl	MicroHs.Expr.ENegApp
	.globl	MicroHs.Expr.EOper
	.globl	MicroHs.Expr.EOr
	.globl	MicroHs.Expr.EParen
	.globl	MicroHs.Expr.EQVar
	.globl	MicroHs.Expr.ESectL
	.globl	MicroHs.Expr.ESectR
	.globl	MicroHs.Expr.ESelect
	.globl	MicroHs.Expr.ESign
	.globl	MicroHs.Expr.ETuple
	.globl	MicroHs.Expr.ETypeArg
	.globl	MicroHs.Expr.EUVar
	.globl	MicroHs.Expr.EUpdate
	.globl	MicroHs.Expr.EVar
	.globl	MicroHs.Expr.EViewPat
	.globl	MicroHs.Expr.Fcn
	.globl	MicroHs.Expr.ForImp
	.globl	MicroHs.Expr.Import
	.globl	MicroHs.Expr.Infix
	.globl	MicroHs.Expr.Instance
	.globl	MicroHs.Expr.KindSign
	.globl	MicroHs.Expr.LChar
	.globl	MicroHs.Expr.LCompr
	.globl	MicroHs.Expr.LDouble
	.globl	MicroHs.Expr.LExn
	.globl	MicroHs.Expr.LForImp
	.globl	MicroHs.Expr.LFrom
	.globl	MicroHs.Expr.LFromThen
	.globl	MicroHs.Expr.LFromThenTo
	.globl	MicroHs.Expr.LFromTo
	.globl	MicroHs.Expr.LInt
	.globl	MicroHs.Expr.LInteger
	.globl	MicroHs.Expr.LList
	.globl	MicroHs.Expr.LPrim
	.globl	MicroHs.Expr.LRat
	.globl	MicroHs.Expr.LStr
	.globl	MicroHs.Expr.LTick
	.globl	MicroHs.Expr.LUStr
	.globl	MicroHs.Expr.LazyP
	.globl	MicroHs.Expr.Newtype
	.globl	MicroHs.Expr.PatBind
	.globl	MicroHs.Expr.Pattern
	.globl	MicroHs.Expr.Sign
	.globl	MicroHs.Expr.Type
	.globl	MicroHs.Expr.allVarsAlt
	.globl	MicroHs.Expr.allVarsAlts
	.globl	MicroHs.Expr.allVarsBind
	.globl	MicroHs.Expr.allVarsBind$27
	.globl	MicroHs.Expr.allVarsCaseArm
	.globl	MicroHs.Expr.allVarsEqn
	.globl	MicroHs.Expr.allVarsEqns
	.globl	MicroHs.Expr.allVarsExpr
	.globl	MicroHs.Expr.allVarsExpr$27
	.globl	MicroHs.Expr.allVarsListish
	.globl	MicroHs.Expr.allVarsStmt
	.globl	MicroHs.Expr.composeMap
	.globl	MicroHs.Expr.conArity
	.globl	MicroHs.Expr.conFields
	.globl	MicroHs.Expr.conIdent
	.globl	MicroHs.Expr.eApp2
	.globl	MicroHs.Expr.eApp3
	.globl	MicroHs.Expr.eAppI2
	.globl	MicroHs.Expr.eApps
	.globl	MicroHs.Expr.eDummy
	.globl	MicroHs.Expr.eEqn
	.globl	MicroHs.Expr.eEqns
	.globl	MicroHs.Expr.eForall
	.globl	MicroHs.Expr.eForall$27
	.globl	MicroHs.Expr.eLam
	.globl	MicroHs.Expr.eLamWithSLoc
	.globl	MicroHs.Expr.eqEType
	.globl	MicroHs.Expr.eqExpr
	.globl	MicroHs.Expr.errorMessage
	.globl	MicroHs.Expr.freeTyVars
	.globl	MicroHs.Expr.getAppM
	.globl	MicroHs.Expr.getArrow
	.globl	MicroHs.Expr.getArrows
	.globl	MicroHs.Expr.getBindVars
	.globl	MicroHs.Expr.getBindsVars
	.globl	MicroHs.Expr.getImplies
	.globl	MicroHs.Expr.getSLoc
	.globl	MicroHs.Expr.getTupleConstr
	.globl	MicroHs.Expr.idKindIdent
	.globl	MicroHs.Expr.impossible
	.globl	MicroHs.Expr.impossibleShow
	.globl	MicroHs.Expr.inst$24$28Data.Eq.Eq$40MicroHs.Expr.Assoc$29
	.globl	MicroHs.Expr.inst$24$28Data.Eq.Eq$40MicroHs.Expr.CType$29
	.globl	MicroHs.Expr.inst$24$28Data.Eq.Eq$40MicroHs.Expr.Con$29
	.globl	MicroHs.Expr.inst$24$28Data.Eq.Eq$40MicroHs.Expr.ImpType$29
	.globl	MicroHs.Expr.inst$24$28Data.Eq.Eq$40MicroHs.Expr.Lit$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40$28$2c$40$28Data.List_Type.$5b$5d$40MicroHs.Expr.EStmt$29$40MicroHs.Expr.Expr$29$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40$28Data.List_Type.$5b$5d$40a$29$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.Con$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.EAlts$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.EDef$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.EStmt$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.Eqn$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.Expr$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.IdKind$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Expr.Listish$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.Expr.HasLoc$40MicroHs.Ident.Ident$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Assoc$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.CType$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Con$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Constr$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.EAlts$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.EDef$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.EField$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.EStmt$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Eqn$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Expr$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.IdKind$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.ImpType$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.ImportItem$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.ImportSpec$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Listish$29
	.globl	MicroHs.Expr.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Expr.Lit$29
	.globl	MicroHs.Expr.inst$24$28Text.Show.Show$40MicroHs.Expr.EModule$29
	.globl	MicroHs.Expr.inst$24$28Text.Show.Show$40MicroHs.Expr.Expr$29
	.globl	MicroHs.Expr.inst$24$28Text.Show.Show$40MicroHs.Expr.IdKind$29
	.globl	MicroHs.Expr.isPConApp
	.globl	MicroHs.Expr.kConstraint
	.globl	MicroHs.Expr.kType
	.globl	MicroHs.Expr.lhsToType
	.globl	MicroHs.Expr.mkEStr
	.globl	MicroHs.Expr.mkExn
	.globl	MicroHs.Expr.mkTupleSel
	.globl	MicroHs.Expr.patVars
	.globl	MicroHs.Expr.ppAlt
	.globl	MicroHs.Expr.ppAlts
	.globl	MicroHs.Expr.ppAltsL
	.globl	MicroHs.Expr.ppCaseArm
	.globl	MicroHs.Expr.ppCommaSep
	.globl	MicroHs.Expr.ppCon
	.globl	MicroHs.Expr.ppConstr
	.globl	MicroHs.Expr.ppCtx
	.globl	MicroHs.Expr.ppDeriving
	.globl	MicroHs.Expr.ppEDef
	.globl	MicroHs.Expr.ppEDefs
	.globl	MicroHs.Expr.ppEStmt
	.globl	MicroHs.Expr.ppEType
	.globl	MicroHs.Expr.ppEqns
	.globl	MicroHs.Expr.ppExpr
	.globl	MicroHs.Expr.ppExprR
	.globl	MicroHs.Expr.ppExprRaw
	.globl	MicroHs.Expr.ppField
	.globl	MicroHs.Expr.ppForall
	.globl	MicroHs.Expr.ppFunDeps
	.globl	MicroHs.Expr.ppIdKind
	.globl	MicroHs.Expr.ppImportItem
	.globl	MicroHs.Expr.ppLHS
	.globl	MicroHs.Expr.ppList
	.globl	MicroHs.Expr.ppListish
	.globl	MicroHs.Expr.ppSType
	.globl	MicroHs.Expr.ppWhere
	.globl	MicroHs.Expr.sKind
	.globl	MicroHs.Expr.setSLocCon
	.globl	MicroHs.Expr.setSLocExpr
	.globl	MicroHs.Expr.showEDefs
	.globl	MicroHs.Expr.showEType
	.globl	MicroHs.Expr.showExpr
	.globl	MicroHs.Expr.showExprRaw
	.globl	MicroHs.Expr.showLit
	.globl	MicroHs.Expr.subst
	.globl	MicroHs.Expr.tupleConstr
	.globl	MicroHs.Expr.unEField
	.globl	MicroHs.Expr.unForall
	.globl	MicroHs.Fixity.eNeg
	.globl	MicroHs.Fixity.negFixity
	.globl	MicroHs.Fixity.resolveFixity
	.globl	MicroHs.Flags.Flags
	.globl	MicroHs.Flags.defaultFlags
	.globl	MicroHs.Flags.get.Flags.buildPkg
	.globl	MicroHs.Flags.get.Flags.cArgs
	.globl	MicroHs.Flags.get.Flags.cppArgs
	.globl	MicroHs.Flags.get.Flags.doCPP
	.globl	MicroHs.Flags.get.Flags.installPkg
	.globl	MicroHs.Flags.get.Flags.listPkg
	.globl	MicroHs.Flags.get.Flags.loading
	.globl	MicroHs.Flags.get.Flags.mmorph
	.globl	MicroHs.Flags.get.Flags.morph
	.globl	MicroHs.Flags.get.Flags.output
	.globl	MicroHs.Flags.get.Flags.paths
	.globl	MicroHs.Flags.get.Flags.pkgPath
	.globl	MicroHs.Flags.get.Flags.readCache
	.globl	MicroHs.Flags.get.Flags.runIt
	.globl	MicroHs.Flags.get.Flags.rvfun
	.globl	MicroHs.Flags.get.Flags.rvfun32
	.globl	MicroHs.Flags.get.Flags.rvfunBox
	.globl	MicroHs.Flags.get.Flags.rvfunIO
	.globl	MicroHs.Flags.get.Flags.rvfunLinux
	.globl	MicroHs.Flags.get.Flags.speed
	.globl	MicroHs.Flags.get.Flags.useLazy
	.globl	MicroHs.Flags.get.Flags.useSE
	.globl	MicroHs.Flags.get.Flags.useTicks
	.globl	MicroHs.Flags.get.Flags.verbose
	.globl	MicroHs.Flags.get.Flags.writeCache
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22buildPkg$22$40MicroHs.Flags.Flags$40$28Data.Maybe_Type.Maybe$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22cArgs$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22compress$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22cppArgs$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22doCPP$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22installPkg$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22listPkg$22$40MicroHs.Flags.Flags$40$28Data.Maybe_Type.Maybe$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22loading$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22mmorph$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22morph$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22output$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22paths$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22pkgPath$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22readCache$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22runIt$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22rvfun$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22rvfun32$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22rvfunBox$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22rvfunIO$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22rvfunLinux$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22speed$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22target$22$40MicroHs.Flags.Flags$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22useLazy$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22useSE$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22useTicks$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22verbose$22$40MicroHs.Flags.Flags$40Primitives.Int$29
	.globl	MicroHs.Flags.inst$24$28Data.Records.SetField$40$22writeCache$22$40MicroHs.Flags.Flags$40Data.Bool_Type.Bool$29
	.globl	MicroHs.Flags.inst$24$28Text.Show.Show$40MicroHs.Flags.Flags$29
	.globl	MicroHs.Flags.verbosityGT
	.globl	MicroHs.GenRomCommon.finalEtaApply
	.globl	MicroHs.GenRomCommon.getPatNum
	.globl	MicroHs.GenRomCommon.idxHole
	.globl	MicroHs.GenRomCommon.idxSplit
	.globl	MicroHs.GenRomCommon.inlineSingle
	.globl	MicroHs.GenRomCommon.varHole
	.globl	MicroHs.GenRomMem.asmOf
	.globl	MicroHs.GenRomMem.asmSys
	.globl	MicroHs.GenRomMem.blockOf
	.globl	MicroHs.GenRomMem.blockSize
	.globl	MicroHs.GenRomMem.dotWord
	.globl	MicroHs.GenRomMem.effSym
	.globl	MicroHs.GenRomMem.emitBlock
	.globl	MicroHs.GenRomMem.f32Bits
	.globl	MicroHs.GenRomMem.gasSym
	.globl	MicroHs.GenRomMem.genRomMem
	.globl	MicroHs.GenRomMem.hex8
	.globl	MicroHs.GenRomMem.litWord
	.globl	MicroHs.GenRomMem.litWordsOf
	.globl	MicroHs.GenRomMem.morphMnemonic
	.globl	MicroHs.GenRomMem.needsLit
	.globl	MicroHs.GenRomMem.noDup
	.globl	MicroHs.GenRomMem.primArith
	.globl	MicroHs.GenRomMem.primEff
	.globl	MicroHs.GenRomMem.primImm
	.globl	MicroHs.GenRomMem.roundShR
	.globl	MicroHs.GenRomMem.termCount
	.globl	MicroHs.GenRomMem.unW
	.globl	MicroHs.GenRomMem.wCombi
	.globl	MicroHs.GenRomMem.wDataMarker
	.globl	MicroHs.GenRomMem.wDataPayload
	.globl	MicroHs.GenRomMem.wEff
	.globl	MicroHs.GenRomMem.wElinkSym
	.globl	MicroHs.GenRomMem.wEptr
	.globl	MicroHs.GenRomMem.wInt
	.globl	MicroHs.GenRomMem.wMorph
	.globl	MicroHs.GenRomMem.wPtr
	.globl	MicroHs.GenRomMem.wY
	.globl	MicroHs.Graph.buildG
	.globl	MicroHs.Graph.dff
	.globl	MicroHs.Graph.dfs
	.globl	MicroHs.Graph.edges
	.globl	MicroHs.Graph.graphFromEdges
	.globl	MicroHs.Graph.postOrd
	.globl	MicroHs.Graph.postorder
	.globl	MicroHs.Graph.postorderF
	.globl	MicroHs.Graph.reverseE
	.globl	MicroHs.Graph.scc
	.globl	MicroHs.Graph.stronglyConnComp
	.globl	MicroHs.Graph.stronglyConnCompR
	.globl	MicroHs.Graph.transposeG
	.globl	MicroHs.Ident.addIdentSuffix
	.globl	MicroHs.Ident.dummyIdent
	.globl	MicroHs.Ident.headIdent
	.globl	MicroHs.Ident.inst$24$28Data.Eq.Eq$40MicroHs.Ident.Ident$29
	.globl	MicroHs.Ident.inst$24$28Data.Ord.Ord$40MicroHs.Ident.Ident$29
	.globl	MicroHs.Ident.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Ident.Ident$29
	.globl	MicroHs.Ident.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Ident.SLoc$29
	.globl	MicroHs.Ident.inst$24$28Text.Show.Show$40MicroHs.Ident.Ident$29
	.globl	MicroHs.Ident.inst$24$28Text.Show.Show$40MicroHs.Ident.SLoc$29
	.globl	MicroHs.Ident.isConIdent
	.globl	MicroHs.Ident.isDummyIdent
	.globl	MicroHs.Ident.isIdent
	.globl	MicroHs.Ident.isIdentChar
	.globl	MicroHs.Ident.isLower_
	.globl	MicroHs.Ident.isOperChar
	.globl	MicroHs.Ident.mkIdent
	.globl	MicroHs.Ident.mkIdentSLoc
	.globl	MicroHs.Ident.noSLoc
	.globl	MicroHs.Ident.ppIdent
	.globl	MicroHs.Ident.qualIdent
	.globl	MicroHs.Ident.qualOf
	.globl	MicroHs.Ident.setSLocIdent
	.globl	MicroHs.Ident.showIdent
	.globl	MicroHs.Ident.showSLoc
	.globl	MicroHs.Ident.slocFile
	.globl	MicroHs.Ident.slocIdent
	.globl	MicroHs.Ident.unIdent
	.globl	MicroHs.Ident.unQualIdent
	.globl	MicroHs.Ident.unQualString
	.globl	MicroHs.IdentMap.Nil
	.globl	MicroHs.IdentMap.Node
	.globl	MicroHs.IdentMap.One
	.globl	MicroHs.IdentMap.balance
	.globl	MicroHs.IdentMap.delete
	.globl	MicroHs.IdentMap.doubleL
	.globl	MicroHs.IdentMap.doubleR
	.globl	MicroHs.IdentMap.elems
	.globl	MicroHs.IdentMap.extractMax
	.globl	MicroHs.IdentMap.extractMin
	.globl	MicroHs.IdentMap.fromList
	.globl	MicroHs.IdentMap.fromListWith
	.globl	MicroHs.IdentMap.insert
	.globl	MicroHs.IdentMap.insertWith
	.globl	MicroHs.IdentMap.inst$24$28MicroHs.MRnf.MRnf$40$28MicroHs.IdentMap.Map$40a$29$29
	.globl	MicroHs.IdentMap.keys
	.globl	MicroHs.IdentMap.lookup
	.globl	MicroHs.IdentMap.mapM
	.globl	MicroHs.IdentMap.merge
	.globl	MicroHs.IdentMap.mergeWith
	.globl	MicroHs.IdentMap.node
	.globl	MicroHs.IdentMap.null
	.globl	MicroHs.IdentMap.singleL
	.globl	MicroHs.IdentMap.singleR
	.globl	MicroHs.IdentMap.size
	.globl	MicroHs.IdentMap.toList
	.globl	MicroHs.IntMap.$21
	.globl	MicroHs.IntMap.Empty
	.globl	MicroHs.IntMap.div4
	.globl	MicroHs.IntMap.fromList
	.globl	MicroHs.IntMap.insert
	.globl	MicroHs.IntMap.insertWith
	.globl	MicroHs.IntMap.keys
	.globl	MicroHs.IntMap.lookup
	.globl	MicroHs.IntMap.merge
	.globl	MicroHs.IntMap.mod4
	.globl	MicroHs.IntMap.single
	.globl	MicroHs.IntMap.toList
	.globl	MicroHs.IntSet.empty
	.globl	MicroHs.IntSet.insert
	.globl	MicroHs.IntSet.member
	.globl	MicroHs.Interactive.command
	.globl	MicroHs.Interactive.commands
	.globl	MicroHs.Interactive.complete
	.globl	MicroHs.Interactive.err
	.globl	MicroHs.Interactive.err$27
	.globl	MicroHs.Interactive.evalExpr
	.globl	MicroHs.Interactive.get.IState.isCache
	.globl	MicroHs.Interactive.get.IState.isFlags
	.globl	MicroHs.Interactive.get.IState.isLines
	.globl	MicroHs.Interactive.get.IState.isSymbols
	.globl	MicroHs.Interactive.getCModule
	.globl	MicroHs.Interactive.getKindInCache
	.globl	MicroHs.Interactive.getTypeInCache
	.globl	MicroHs.Interactive.helpText
	.globl	MicroHs.Interactive.inst$24$28Data.Records.SetField$40$22isCache$22$40MicroHs.Interactive.IState$40MicroHs.CompileCache.Cache$29
	.globl	MicroHs.Interactive.inst$24$28Data.Records.SetField$40$22isLines$22$40MicroHs.Interactive.IState$40$28Data.List_Type.$5b$5d$40Primitives.Char$29$29
	.globl	MicroHs.Interactive.inst$24$28Data.Records.SetField$40$22isSymbols$22$40MicroHs.Interactive.IState$40$28$2c$40MicroHs.SymTab.SymTab$40MicroHs.SymTab.SymTab$29$29
	.globl	MicroHs.Interactive.interactiveId
	.globl	MicroHs.Interactive.interactiveName
	.globl	MicroHs.Interactive.itIOName
	.globl	MicroHs.Interactive.itName
	.globl	MicroHs.Interactive.itTypeName
	.globl	MicroHs.Interactive.mainInteractive
	.globl	MicroHs.Interactive.mkIt
	.globl	MicroHs.Interactive.mkItIO
	.globl	MicroHs.Interactive.mkTypeIt
	.globl	MicroHs.Interactive.noSymbols
	.globl	MicroHs.Interactive.oneline
	.globl	MicroHs.Interactive.preamble
	.globl	MicroHs.Interactive.reload
	.globl	MicroHs.Interactive.repl
	.globl	MicroHs.Interactive.setSyms
	.globl	MicroHs.Interactive.showKind
	.globl	MicroHs.Interactive.showType
	.globl	MicroHs.Interactive.start
	.globl	MicroHs.Interactive.tryCompile
	.globl	MicroHs.Interactive.tryParse
	.globl	MicroHs.Interactive.updateCache
	.globl	MicroHs.Interactive.updateLines
	.globl	MicroHs.Lex.TBrace
	.globl	MicroHs.Lex.TChar
	.globl	MicroHs.Lex.TEnd
	.globl	MicroHs.Lex.TError
	.globl	MicroHs.Lex.TIdent
	.globl	MicroHs.Lex.TIndent
	.globl	MicroHs.Lex.TInt
	.globl	MicroHs.Lex.TPragma
	.globl	MicroHs.Lex.TRat
	.globl	MicroHs.Lex.TRaw
	.globl	MicroHs.Lex.TSpec
	.globl	MicroHs.Lex.TString
	.globl	MicroHs.Lex.addCol
	.globl	MicroHs.Lex.conv
	.globl	MicroHs.Lex.ctlCodes
	.globl	MicroHs.Lex.decodeEsc
	.globl	MicroHs.Lex.decodeEscs
	.globl	MicroHs.Lex.getCol
	.globl	MicroHs.Lex.incrLine
	.globl	MicroHs.Lex.inst$24$28Text.ParserComb.TokenMachine$40MicroHs.Lex.LexState$40MicroHs.Lex.Token$29
	.globl	MicroHs.Lex.isSpec
	.globl	MicroHs.Lex.isSpecSing
	.globl	MicroHs.Lex.layoutLS
	.globl	MicroHs.Lex.lex
	.globl	MicroHs.Lex.lexLitStr
	.globl	MicroHs.Lex.lexNumBasePrefix
	.globl	MicroHs.Lex.lexStart
	.globl	MicroHs.Lex.lexTopLS
	.globl	MicroHs.Lex.mkLocEOF
	.globl	MicroHs.Lex.multiLine
	.globl	MicroHs.Lex.nested
	.globl	MicroHs.Lex.popLayout
	.globl	MicroHs.Lex.pragma
	.globl	MicroHs.Lex.readBase
	.globl	MicroHs.Lex.readInt
	.globl	MicroHs.Lex.readIntBase
	.globl	MicroHs.Lex.readNumDec
	.globl	MicroHs.Lex.showToken
	.globl	MicroHs.Lex.skipLine
	.globl	MicroHs.Lex.skipNest
	.globl	MicroHs.Lex.tBrace
	.globl	MicroHs.Lex.tIdent
	.globl	MicroHs.Lex.tIndent
	.globl	MicroHs.Lex.tLam
	.globl	MicroHs.Lex.tabCol
	.globl	MicroHs.Lex.tokensLoc
	.globl	MicroHs.Lex.upperIdent
	.globl	MicroHs.List.anySame
	.globl	MicroHs.List.anySameByLE
	.globl	MicroHs.List.deleteAllBy
	.globl	MicroHs.List.deleteAllsBy
	.globl	MicroHs.List.dropEnd
	.globl	MicroHs.List.elemBy
	.globl	MicroHs.List.findCommonPrefix
	.globl	MicroHs.List.groupSort
	.globl	MicroHs.List.padLeft
	.globl	MicroHs.List.showListS
	.globl	MicroHs.List.sortLE
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28$2c$40a$40b$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28Data.Either.Either$40a$40b$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28Data.List_Type.$5b$5d$40a$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28Data.Maybe_Type.Maybe$40a$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28Data.Ratio_Type.Ratio$40Data.Integer_Type.Integer$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40$28Primitives.$2d$3e$40a$40b$29$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Data.Bool_Type.Bool$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Data.Double.Double$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Data.Integer_Type.Integer$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Data.Text.Text$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Data.Version.Version$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Primitives.Char$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40Primitives.Int$29
	.globl	MicroHs.MRnf.inst$24$28MicroHs.MRnf.MRnf$40System.IO.MD5.MD5CheckSum$29
	.globl	MicroHs.MRnf.mrnf
	.globl	MicroHs.MRnf.mrnf$24dflt
	.globl	MicroHs.Main.cmpBlobs
	.globl	MicroHs.Main.csrBlobs
	.globl	MicroHs.Main.csrRegs
	.globl	MicroHs.Main.decodeArgs
	.globl	MicroHs.Main.effBlobs
	.globl	MicroHs.Main.floatBlobs
	.globl	MicroHs.Main.hasTheExtension
	.globl	MicroHs.Main.linuxStartS
	.globl	MicroHs.Main.main
	.globl	MicroHs.Main.mainBuildPkg
	.globl	MicroHs.Main.mainCompile
	.globl	MicroHs.Main.mainInstallPackage
	.globl	MicroHs.Main.mainListPackages
	.globl	MicroHs.Main.mainListPkg
	.globl	MicroHs.Main.mainListPkg$27
	.globl	MicroHs.Main.primBlobs
	.globl	MicroHs.Main.splitNameVer
	.globl	MicroHs.Main.usage
	.globl	MicroHs.Morph.allSelfScruts
	.globl	MicroHs.Morph.apps
	.globl	MicroHs.Morph.caseArms
	.globl	MicroHs.Morph.caseOnParam
	.globl	MicroHs.Morph.cataArm
	.globl	MicroHs.Morph.chooseScheme
	.globl	MicroHs.Morph.classifyColumn
	.globl	MicroHs.Morph.classifyOne
	.globl	MicroHs.Morph.collectCtors
	.globl	MicroHs.Morph.countVar
	.globl	MicroHs.Morph.detectAnaX
	.globl	MicroHs.Morph.detectCataX
	.globl	MicroHs.Morph.detectMendler
	.globl	MicroHs.Morph.detectParaX
	.globl	MicroHs.Morph.elideSelf
	.globl	MicroHs.Morph.emitExplicit
	.globl	MicroHs.Morph.eqVarI
	.globl	MicroHs.Morph.extractCall
	.globl	MicroHs.Morph.findScrutPos
	.globl	MicroHs.Morph.freshField
	.globl	MicroHs.Morph.fstE
	.globl	MicroHs.Morph.funShape
	.globl	MicroHs.Morph.functorArm
	.globl	MicroHs.Morph.fuseBody
	.globl	MicroHs.Morph.fuseDef
	.globl	MicroHs.Morph.gId
	.globl	MicroHs.Morph.goId
	.globl	MicroHs.Morph.insertAt
	.globl	MicroHs.Morph.isConHead
	.globl	MicroHs.Morph.isReserved
	.globl	MicroHs.Morph.mentionsId
	.globl	MicroHs.Morph.morphProgram
	.globl	MicroHs.Morph.oneAlt
	.globl	MicroHs.Morph.oneBody
	.globl	MicroHs.Morph.orElse
	.globl	MicroHs.Morph.paraArm
	.globl	MicroHs.Morph.paraFunctorArm
	.globl	MicroHs.Morph.paraRewrite
	.globl	MicroHs.Morph.recId
	.globl	MicroHs.Morph.req
	.globl	MicroHs.Morph.resultArms
	.globl	MicroHs.Morph.sId
	.globl	MicroHs.Morph.scrutId
	.globl	MicroHs.Morph.selfScrut
	.globl	MicroHs.Morph.simpleVar
	.globl	MicroHs.Morph.sndE
	.globl	MicroHs.Morph.spineE
	.globl	MicroHs.Morph.substRecToMendler
	.globl	MicroHs.Morph.substVarExpr
	.globl	MicroHs.Morph.unParen
	.globl	MicroHs.Package.Package
	.globl	MicroHs.Package.forcePackage
	.globl	MicroHs.Package.get.Package.pkgCompiler
	.globl	MicroHs.Package.get.Package.pkgDepends
	.globl	MicroHs.Package.get.Package.pkgExported
	.globl	MicroHs.Package.get.Package.pkgName
	.globl	MicroHs.Package.get.Package.pkgOther
	.globl	MicroHs.Package.get.Package.pkgTables
	.globl	MicroHs.Package.get.Package.pkgVersion
	.globl	MicroHs.Package.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.Package.Package$29
	.globl	MicroHs.Parse.dcolon
	.globl	MicroHs.Parse.dotDotIdent
	.globl	MicroHs.Parse.dsGADT
	.globl	MicroHs.Parse.eLamCase
	.globl	MicroHs.Parse.eTuple
	.globl	MicroHs.Parse.eof
	.globl	MicroHs.Parse.formatFailed
	.globl	MicroHs.Parse.getSLoc
	.globl	MicroHs.Parse.guardM
	.globl	MicroHs.Parse.isAlpha_
	.globl	MicroHs.Parse.isExp
	.globl	MicroHs.Parse.isUOper
	.globl	MicroHs.Parse.keywords
	.globl	MicroHs.Parse.pAExpr
	.globl	MicroHs.Parse.pAExpr$27
	.globl	MicroHs.Parse.pAPat
	.globl	MicroHs.Parse.pAType
	.globl	MicroHs.Parse.pAlt
	.globl	MicroHs.Parse.pAlts
	.globl	MicroHs.Parse.pAltsL
	.globl	MicroHs.Parse.pBind
	.globl	MicroHs.Parse.pBind$27
	.globl	MicroHs.Parse.pBlock
	.globl	MicroHs.Parse.pBraces
	.globl	MicroHs.Parse.pCase
	.globl	MicroHs.Parse.pCaseArm
	.globl	MicroHs.Parse.pClsBind
	.globl	MicroHs.Parse.pConList
	.globl	MicroHs.Parse.pConstr
	.globl	MicroHs.Parse.pContext
	.globl	MicroHs.Parse.pDRArrow
	.globl	MicroHs.Parse.pData
	.globl	MicroHs.Parse.pDef
	.globl	MicroHs.Parse.pDeriving
	.globl	MicroHs.Parse.pDo
	.globl	MicroHs.Parse.pEqn
	.globl	MicroHs.Parse.pEqnLHS
	.globl	MicroHs.Parse.pEqns
	.globl	MicroHs.Parse.pEqns$27
	.globl	MicroHs.Parse.pEqnsU
	.globl	MicroHs.Parse.pExportItem
	.globl	MicroHs.Parse.pExprApp
	.globl	MicroHs.Parse.pExprArg
	.globl	MicroHs.Parse.pExprArgNeg
	.globl	MicroHs.Parse.pExprOp
	.globl	MicroHs.Parse.pExprTop
	.globl	MicroHs.Parse.pFields
	.globl	MicroHs.Parse.pForall
	.globl	MicroHs.Parse.pGADT
	.globl	MicroHs.Parse.pGADTconstr
	.globl	MicroHs.Parse.pIdKind
	.globl	MicroHs.Parse.pIf
	.globl	MicroHs.Parse.pImportItem
	.globl	MicroHs.Parse.pImportSpec
	.globl	MicroHs.Parse.pInstBind
	.globl	MicroHs.Parse.pKeyword
	.globl	MicroHs.Parse.pLHS
	.globl	MicroHs.Parse.pLIdent
	.globl	MicroHs.Parse.pLIdentSym
	.globl	MicroHs.Parse.pLQIdent
	.globl	MicroHs.Parse.pLQIdentSym
	.globl	MicroHs.Parse.pLQSymOper
	.globl	MicroHs.Parse.pLQSymOperArr
	.globl	MicroHs.Parse.pLSymOper
	.globl	MicroHs.Parse.pLam
	.globl	MicroHs.Parse.pLazyPragma
	.globl	MicroHs.Parse.pLet
	.globl	MicroHs.Parse.pListish
	.globl	MicroHs.Parse.pLit
	.globl	MicroHs.Parse.pModule
	.globl	MicroHs.Parse.pModuleEmpty
	.globl	MicroHs.Parse.pNumLit
	.globl	MicroHs.Parse.pOper
	.globl	MicroHs.Parse.pOperComma
	.globl	MicroHs.Parse.pOperCommaNoMinus
	.globl	MicroHs.Parse.pOperators
	.globl	MicroHs.Parse.pOperators$27
	.globl	MicroHs.Parse.pParens
	.globl	MicroHs.Parse.pPatApp
	.globl	MicroHs.Parse.pPatArg
	.globl	MicroHs.Parse.pPatNotVar
	.globl	MicroHs.Parse.pPatOp
	.globl	MicroHs.Parse.pPatSyn
	.globl	MicroHs.Parse.pPragma
	.globl	MicroHs.Parse.pQArrow
	.globl	MicroHs.Parse.pQIdent
	.globl	MicroHs.Parse.pQSymOper
	.globl	MicroHs.Parse.pQualDo
	.globl	MicroHs.Parse.pSAType
	.globl	MicroHs.Parse.pSLArrow
	.globl	MicroHs.Parse.pSRArrow
	.globl	MicroHs.Parse.pSType
	.globl	MicroHs.Parse.pSTypeApp
	.globl	MicroHs.Parse.pSelect
	.globl	MicroHs.Parse.pSpec
	.globl	MicroHs.Parse.pStmt
	.globl	MicroHs.Parse.pStrict
	.globl	MicroHs.Parse.pString
	.globl	MicroHs.Parse.pSymOper
	.globl	MicroHs.Parse.pSymbol
	.globl	MicroHs.Parse.pTop
	.globl	MicroHs.Parse.pTopModule
	.globl	MicroHs.Parse.pType
	.globl	MicroHs.Parse.pTypeApp
	.globl	MicroHs.Parse.pTypeIdentSym
	.globl	MicroHs.Parse.pTypeOp
	.globl	MicroHs.Parse.pTypeOper
	.globl	MicroHs.Parse.pUIdent
	.globl	MicroHs.Parse.pUIdentA
	.globl	MicroHs.Parse.pUIdentSpecial
	.globl	MicroHs.Parse.pUIdentSym
	.globl	MicroHs.Parse.pUOper
	.globl	MicroHs.Parse.pUQIdent
	.globl	MicroHs.Parse.pUQIdentA
	.globl	MicroHs.Parse.pUQIdentSym
	.globl	MicroHs.Parse.pUQSymOper
	.globl	MicroHs.Parse.pUSymOper
	.globl	MicroHs.Parse.pUpdate
	.globl	MicroHs.Parse.pWhere
	.globl	MicroHs.Parse.parse
	.globl	MicroHs.Parse.parseDie
	.globl	MicroHs.Parse.qualName
	.globl	MicroHs.Parse.reservedOps
	.globl	MicroHs.State.evalState
	.globl	MicroHs.State.get
	.globl	MicroHs.State.gets
	.globl	MicroHs.State.inst$24$28Control.Applicative.Applicative$40$28MicroHs.State.State$40s$29$29
	.globl	MicroHs.State.inst$24$28Control.Monad.Fail.MonadFail$40$28MicroHs.State.State$40s$29$29
	.globl	MicroHs.State.inst$24$28Control.Monad.Monad$40$28MicroHs.State.State$40s$29$29
	.globl	MicroHs.State.inst$24$28Data.Functor.Functor$40$28MicroHs.State.State$40s$29$29
	.globl	MicroHs.State.modify
	.globl	MicroHs.State.put
	.globl	MicroHs.State.runState
	.globl	MicroHs.StateIO.execStateIO
	.globl	MicroHs.StateIO.get
	.globl	MicroHs.StateIO.gets
	.globl	MicroHs.StateIO.inst$24$28Control.Applicative.Applicative$40$28MicroHs.StateIO.StateIO$40s$29$29
	.globl	MicroHs.StateIO.inst$24$28Control.Monad.Monad$40$28MicroHs.StateIO.StateIO$40s$29$29
	.globl	MicroHs.StateIO.inst$24$28Data.Functor.Functor$40$28MicroHs.StateIO.StateIO$40s$29$29
	.globl	MicroHs.StateIO.liftIO
	.globl	MicroHs.StateIO.modify
	.globl	MicroHs.StateIO.runStateIO
	.globl	MicroHs.SymTab.entryType
	.globl	MicroHs.SymTab.getIdent
	.globl	MicroHs.SymTab.hackBuiltin
	.globl	MicroHs.SymTab.inst$24$28Data.Eq.Eq$40MicroHs.SymTab.Entry$29
	.globl	MicroHs.SymTab.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.SymTab.Entry$29
	.globl	MicroHs.SymTab.isQual
	.globl	MicroHs.SymTab.mapMSymTab
	.globl	MicroHs.SymTab.stElemsLcl
	.globl	MicroHs.SymTab.stEmpty
	.globl	MicroHs.SymTab.stFromList
	.globl	MicroHs.SymTab.stInsertGlbA
	.globl	MicroHs.SymTab.stInsertGlbQ
	.globl	MicroHs.SymTab.stInsertGlbU
	.globl	MicroHs.SymTab.stInsertLcl
	.globl	MicroHs.SymTab.stKeysGlbU
	.globl	MicroHs.SymTab.stKeysLcl
	.globl	MicroHs.SymTab.stLookup
	.globl	MicroHs.TCMonad.TC
	.globl	MicroHs.TCMonad.addConstraints
	.globl	MicroHs.TCMonad.argDicts
	.globl	MicroHs.TCMonad.assertTCMode
	.globl	MicroHs.TCMonad.builtinLoc
	.globl	MicroHs.TCMonad.etImplies
	.globl	MicroHs.TCMonad.get.TCState.assocTable
	.globl	MicroHs.TCMonad.get.TCState.classTable
	.globl	MicroHs.TCMonad.get.TCState.constraints
	.globl	MicroHs.TCMonad.get.TCState.ctxTables
	.globl	MicroHs.TCMonad.get.TCState.dataTable
	.globl	MicroHs.TCMonad.get.TCState.defaults
	.globl	MicroHs.TCMonad.get.TCState.fixTable
	.globl	MicroHs.TCMonad.get.TCState.moduleName
	.globl	MicroHs.TCMonad.get.TCState.synTable
	.globl	MicroHs.TCMonad.get.TCState.tcMode
	.globl	MicroHs.TCMonad.get.TCState.typeTable
	.globl	MicroHs.TCMonad.get.TCState.unique
	.globl	MicroHs.TCMonad.get.TCState.uvarSubst
	.globl	MicroHs.TCMonad.get.TCState.valueTable
	.globl	MicroHs.TCMonad.getAppCon
	.globl	MicroHs.TCMonad.inst$24$28Data.Enum.Enum$40MicroHs.TCMonad.TCMode$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Eq.Eq$40MicroHs.TCMonad.TCMode$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Ord.Ord$40MicroHs.TCMonad.TCMode$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22assocTable$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40$28Data.List_Type.$5b$5d$40MicroHs.TCMonad.ValueExport$29$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22classTable$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40MicroHs.TCMonad.ClassInfo$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22constraints$22$40MicroHs.TCMonad.TCState$40$28Data.List_Type.$5b$5d$40$28$2c$40MicroHs.Ident.Ident$40MicroHs.Expr.Expr$29$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22ctxTables$22$40MicroHs.TCMonad.TCState$40$28$2c$2c$2c$40$28MicroHs.IdentMap.Map$40MicroHs.TCMonad.InstInfo$29$40$28Data.List_Type.$5b$5d$40$28$2c$40MicroHs.Ident.Ident$40MicroHs.Expr.Expr$29$29$40$28Data.List_Type.$5b$5d$40$28$2c$40MicroHs.Expr.Expr$40MicroHs.Expr.Expr$29$29$40$28Data.List_Type.$5b$5d$40$28$2c$40MicroHs.Ident.Ident$40MicroHs.Expr.Expr$29$29$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22dataTable$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40MicroHs.Expr.EDef$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22defaults$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40$28Data.List_Type.$5b$5d$40MicroHs.Expr.Expr$29$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22fixTable$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40$28$2c$40MicroHs.Expr.Assoc$40Primitives.Int$29$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22synTable$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IdentMap.Map$40MicroHs.Expr.Expr$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22tcMode$22$40MicroHs.TCMonad.TCState$40MicroHs.TCMonad.TCMode$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22typeTable$22$40MicroHs.TCMonad.TCState$40MicroHs.SymTab.SymTab$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22unique$22$40MicroHs.TCMonad.TCState$40Primitives.Int$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22uvarSubst$22$40MicroHs.TCMonad.TCState$40$28MicroHs.IntMap.IntMap$40MicroHs.Expr.Expr$29$29
	.globl	MicroHs.TCMonad.inst$24$28Data.Records.SetField$40$22valueTable$22$40MicroHs.TCMonad.TCState$40MicroHs.SymTab.SymTab$29
	.globl	MicroHs.TCMonad.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.TCMonad.ClassInfo$29
	.globl	MicroHs.TCMonad.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.TCMonad.InstInfo$29
	.globl	MicroHs.TCMonad.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.TCMonad.TypeExport$29
	.globl	MicroHs.TCMonad.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.TCMonad.ValueExport$29
	.globl	MicroHs.TCMonad.inst$24$28Text.Show.Show$40MicroHs.TCMonad.TCMode$29
	.globl	MicroHs.TCMonad.instTable
	.globl	MicroHs.TCMonad.metaTable
	.globl	MicroHs.TCMonad.newUniq
	.globl	MicroHs.TCMonad.putArgDicts
	.globl	MicroHs.TCMonad.putConstraints
	.globl	MicroHs.TCMonad.putCtxTables
	.globl	MicroHs.TCMonad.putDataTable
	.globl	MicroHs.TCMonad.putDefaults
	.globl	MicroHs.TCMonad.putInstTable
	.globl	MicroHs.TCMonad.putMetaTable
	.globl	MicroHs.TCMonad.putSynTable
	.globl	MicroHs.TCMonad.putTCMode
	.globl	MicroHs.TCMonad.putTypeEqTable
	.globl	MicroHs.TCMonad.putTypeTable
	.globl	MicroHs.TCMonad.putUvarSubst
	.globl	MicroHs.TCMonad.putValueTable
	.globl	MicroHs.TCMonad.tApps
	.globl	MicroHs.TCMonad.tArrow
	.globl	MicroHs.TCMonad.tConI
	.globl	MicroHs.TCMonad.tImplies
	.globl	MicroHs.TCMonad.tVarK
	.globl	MicroHs.TCMonad.tupleConstraints
	.globl	MicroHs.TCMonad.typeEqTable
	.globl	MicroHs.Translate.translate
	.globl	MicroHs.Translate.translateAndRun
	.globl	MicroHs.TypeCheck.TModule
	.globl	MicroHs.TypeCheck.addArgDict
	.globl	MicroHs.TypeCheck.addAssocTable
	.globl	MicroHs.TypeCheck.addAssocs
	.globl	MicroHs.TypeCheck.addClassTable
	.globl	MicroHs.TypeCheck.addConstraint
	.globl	MicroHs.TypeCheck.addDict
	.globl	MicroHs.TypeCheck.addEqConstraint
	.globl	MicroHs.TypeCheck.addEqDict
	.globl	MicroHs.TypeCheck.addInstDict
	.globl	MicroHs.TypeCheck.addInstTable
	.globl	MicroHs.TypeCheck.addMetaDict
	.globl	MicroHs.TypeCheck.addMetaDicts
	.globl	MicroHs.TypeCheck.addPatSyn
	.globl	MicroHs.TypeCheck.addPatSynMatch
	.globl	MicroHs.TypeCheck.addPrimFixs
	.globl	MicroHs.TypeCheck.addTypeAndData
	.globl	MicroHs.TypeCheck.addTypeEq
	.globl	MicroHs.TypeCheck.addTypeKind
	.globl	MicroHs.TypeCheck.addValueClass
	.globl	MicroHs.TypeCheck.addValueType
	.globl	MicroHs.TypeCheck.adictPrefix
	.globl	MicroHs.TypeCheck.allBinders
	.globl	MicroHs.TypeCheck.boolPrefix
	.globl	MicroHs.TypeCheck.canonPatSynType
	.globl	MicroHs.TypeCheck.checkBad
	.globl	MicroHs.TypeCheck.checkConstraints
	.globl	MicroHs.TypeCheck.checkSigma
	.globl	MicroHs.TypeCheck.combineTySubsts
	.globl	MicroHs.TypeCheck.defaultOneTyVar
	.globl	MicroHs.TypeCheck.defaultSuffix
	.globl	MicroHs.TypeCheck.derefUVar
	.globl	MicroHs.TypeCheck.dictPrefix
	.globl	MicroHs.TypeCheck.dictPrefixDollar
	.globl	MicroHs.TypeCheck.doDeriving
	.globl	MicroHs.TypeCheck.dsEField
	.globl	MicroHs.TypeCheck.dsEFields
	.globl	MicroHs.TypeCheck.dsType
	.globl	MicroHs.TypeCheck.dsUpdate
	.globl	MicroHs.TypeCheck.eBinds
	.globl	MicroHs.TypeCheck.eCannotHappen
	.globl	MicroHs.TypeCheck.eFalse
	.globl	MicroHs.TypeCheck.eGetField
	.globl	MicroHs.TypeCheck.eHasField
	.globl	MicroHs.TypeCheck.eProxy
	.globl	MicroHs.TypeCheck.eSetField
	.globl	MicroHs.TypeCheck.eSetFields
	.globl	MicroHs.TypeCheck.eTrue
	.globl	MicroHs.TypeCheck.eVarI
	.globl	MicroHs.TypeCheck.emptyCtx
	.globl	MicroHs.TypeCheck.emptyGlobTables
	.globl	MicroHs.TypeCheck.enum
	.globl	MicroHs.TypeCheck.eqInstDict
	.globl	MicroHs.TypeCheck.eqTyTy
	.globl	MicroHs.TypeCheck.expLookup
	.globl	MicroHs.TypeCheck.expandClass
	.globl	MicroHs.TypeCheck.expandDict
	.globl	MicroHs.TypeCheck.expandDict$27
	.globl	MicroHs.TypeCheck.expandInst
	.globl	MicroHs.TypeCheck.expandPatSyn
	.globl	MicroHs.TypeCheck.expandSyn
	.globl	MicroHs.TypeCheck.extData
	.globl	MicroHs.TypeCheck.extFix
	.globl	MicroHs.TypeCheck.extNewtypeSyns
	.globl	MicroHs.TypeCheck.extSyn
	.globl	MicroHs.TypeCheck.extTyp
	.globl	MicroHs.TypeCheck.extTyps
	.globl	MicroHs.TypeCheck.extVal
	.globl	MicroHs.TypeCheck.extValE
	.globl	MicroHs.TypeCheck.extValETop
	.globl	MicroHs.TypeCheck.extValQTop
	.globl	MicroHs.TypeCheck.extVals
	.globl	MicroHs.TypeCheck.failureFree
	.globl	MicroHs.TypeCheck.failureFreeAp
	.globl	MicroHs.TypeCheck.filterImports
	.globl	MicroHs.TypeCheck.findMatches
	.globl	MicroHs.TypeCheck.genCoerce
	.globl	MicroHs.TypeCheck.get.GlobTables.gClassTable
	.globl	MicroHs.TypeCheck.get.GlobTables.gDataTable
	.globl	MicroHs.TypeCheck.get.GlobTables.gInstInfo
	.globl	MicroHs.TypeCheck.get.GlobTables.gSynTable
	.globl	MicroHs.TypeCheck.get.TModule.tBindingsOf
	.globl	MicroHs.TypeCheck.get.TModule.tDefaults
	.globl	MicroHs.TypeCheck.get.TModule.tFixDefs
	.globl	MicroHs.TypeCheck.get.TModule.tModuleName
	.globl	MicroHs.TypeCheck.get.TModule.tTypeExps
	.globl	MicroHs.TypeCheck.get.TModule.tValueExps
	.globl	MicroHs.TypeCheck.getApp
	.globl	MicroHs.TypeCheck.getAssocs
	.globl	MicroHs.TypeCheck.getBestMatches
	.globl	MicroHs.TypeCheck.getEnvTypes
	.globl	MicroHs.TypeCheck.getFixity
	.globl	MicroHs.TypeCheck.getFreeTyVars
	.globl	MicroHs.TypeCheck.getKindSigns
	.globl	MicroHs.TypeCheck.getMetaTyVars
	.globl	MicroHs.TypeCheck.getSuperClasses
	.globl	MicroHs.TypeCheck.getTVExps
	.globl	MicroHs.TypeCheck.getUVar
	.globl	MicroHs.TypeCheck.getUnsolved
	.globl	MicroHs.TypeCheck.guessIsKind
	.globl	MicroHs.TypeCheck.hasFromInteger
	.globl	MicroHs.TypeCheck.identArrow
	.globl	MicroHs.TypeCheck.identChar
	.globl	MicroHs.TypeCheck.identFloatW
	.globl	MicroHs.TypeCheck.identImplies
	.globl	MicroHs.TypeCheck.identInt
	.globl	MicroHs.TypeCheck.identInteger
	.globl	MicroHs.TypeCheck.identList
	.globl	MicroHs.TypeCheck.identTypeEq
	.globl	MicroHs.TypeCheck.identWord
	.globl	MicroHs.TypeCheck.inst$24$28MicroHs.MRnf.MRnf$40$28MicroHs.TypeCheck.TModule$40a$29$29
	.globl	MicroHs.TypeCheck.inst$24$28MicroHs.MRnf.MRnf$40MicroHs.TypeCheck.GlobTables$29
	.globl	MicroHs.TypeCheck.instPatSigma
	.globl	MicroHs.TypeCheck.instPrefix
	.globl	MicroHs.TypeCheck.instSigma
	.globl	MicroHs.TypeCheck.isDefaultMethodId
	.globl	MicroHs.TypeCheck.isEUVar
	.globl	MicroHs.TypeCheck.isEmptyCtx
	.globl	MicroHs.TypeCheck.isInstId
	.globl	MicroHs.TypeCheck.isMatchDataTypeName
	.globl	MicroHs.TypeCheck.kTypeTypeS
	.globl	MicroHs.TypeCheck.kTypeTypeTypeS
	.globl	MicroHs.TypeCheck.listPrefix
	.globl	MicroHs.TypeCheck.mapEType
	.globl	MicroHs.TypeCheck.matchType
	.globl	MicroHs.TypeCheck.matchTypes
	.globl	MicroHs.TypeCheck.matchTypesFD
	.globl	MicroHs.TypeCheck.mergeDefaults
	.globl	MicroHs.TypeCheck.mergeGlobTables
	.globl	MicroHs.TypeCheck.mergeInstInfo
	.globl	MicroHs.TypeCheck.metaTvs
	.globl	MicroHs.TypeCheck.mkClassConstructor
	.globl	MicroHs.TypeCheck.mkCoercible
	.globl	MicroHs.TypeCheck.mkConstDict
	.globl	MicroHs.TypeCheck.mkDefaultMethodId
	.globl	MicroHs.TypeCheck.mkEqType
	.globl	MicroHs.TypeCheck.mkIFunDeps
	.globl	MicroHs.TypeCheck.mkIdentB
	.globl	MicroHs.TypeCheck.mkInstId
	.globl	MicroHs.TypeCheck.mkMatchDataTypeConstr
	.globl	MicroHs.TypeCheck.mkMatchDataTypeName
	.globl	MicroHs.TypeCheck.mkPatSynMatch
	.globl	MicroHs.TypeCheck.mkPatSynMatchType
	.globl	MicroHs.TypeCheck.mkSuperSel
	.globl	MicroHs.TypeCheck.mkTCState
	.globl	MicroHs.TypeCheck.mkTModule
	.globl	MicroHs.TypeCheck.msgTCMode
	.globl	MicroHs.TypeCheck.msgTCMode$27
	.globl	MicroHs.TypeCheck.multCheck
	.globl	MicroHs.TypeCheck.munify
	.globl	MicroHs.TypeCheck.nameArrow
	.globl	MicroHs.TypeCheck.nameChar
	.globl	MicroHs.TypeCheck.nameCoercible
	.globl	MicroHs.TypeCheck.nameConstraint
	.globl	MicroHs.TypeCheck.nameFloatW
	.globl	MicroHs.TypeCheck.nameImplies
	.globl	MicroHs.TypeCheck.nameInt
	.globl	MicroHs.TypeCheck.nameInteger
	.globl	MicroHs.TypeCheck.nameKind
	.globl	MicroHs.TypeCheck.nameKnownNat
	.globl	MicroHs.TypeCheck.nameKnownSymbol
	.globl	MicroHs.TypeCheck.nameList
	.globl	MicroHs.TypeCheck.nameNat
	.globl	MicroHs.TypeCheck.nameSymbol
	.globl	MicroHs.TypeCheck.nameType
	.globl	MicroHs.TypeCheck.nameTypeEq
	.globl	MicroHs.TypeCheck.nameWord
	.globl	MicroHs.TypeCheck.newADictIdent
	.globl	MicroHs.TypeCheck.newDictIdent
	.globl	MicroHs.TypeCheck.newIdent
	.globl	MicroHs.TypeCheck.newSkolemTyVar
	.globl	MicroHs.TypeCheck.newUVar
	.globl	MicroHs.TypeCheck.primKindTable
	.globl	MicroHs.TypeCheck.primSortTable
	.globl	MicroHs.TypeCheck.primTypes
	.globl	MicroHs.TypeCheck.primValues
	.globl	MicroHs.TypeCheck.quantify
	.globl	MicroHs.TypeCheck.rSort
	.globl	MicroHs.TypeCheck.sKindKindKind
	.globl	MicroHs.TypeCheck.setBindings
	.globl	MicroHs.TypeCheck.setDefault
	.globl	MicroHs.TypeCheck.setUVar
	.globl	MicroHs.TypeCheck.shallowSkolemise
	.globl	MicroHs.TypeCheck.showTModule
	.globl	MicroHs.TypeCheck.simpleAlts
	.globl	MicroHs.TypeCheck.simpleEqn
	.globl	MicroHs.TypeCheck.skolemise
	.globl	MicroHs.TypeCheck.solveAndDefault
	.globl	MicroHs.TypeCheck.solveCoercible
	.globl	MicroHs.TypeCheck.solveConstraints
	.globl	MicroHs.TypeCheck.solveEq
	.globl	MicroHs.TypeCheck.solveGen
	.globl	MicroHs.TypeCheck.solveInst
	.globl	MicroHs.TypeCheck.solveKnownNat
	.globl	MicroHs.TypeCheck.solveKnownSymbol
	.globl	MicroHs.TypeCheck.solveLocalConstraints
	.globl	MicroHs.TypeCheck.solveMany
	.globl	MicroHs.TypeCheck.solveTuple
	.globl	MicroHs.TypeCheck.solveTypeEq
	.globl	MicroHs.TypeCheck.solvers
	.globl	MicroHs.TypeCheck.splitInst
	.globl	MicroHs.TypeCheck.splitPatSynType
	.globl	MicroHs.TypeCheck.standaloneDeriving
	.globl	MicroHs.TypeCheck.subsCheck
	.globl	MicroHs.TypeCheck.subsCheckFun
	.globl	MicroHs.TypeCheck.subsCheckRho
	.globl	MicroHs.TypeCheck.substEUVar
	.globl	MicroHs.TypeCheck.tBool
	.globl	MicroHs.TypeCheck.tCheck
	.globl	MicroHs.TypeCheck.tCheckExpr
	.globl	MicroHs.TypeCheck.tCheckExprAndSolve
	.globl	MicroHs.TypeCheck.tCheckPat
	.globl	MicroHs.TypeCheck.tCheckPatC
	.globl	MicroHs.TypeCheck.tCheckTypeT
	.globl	MicroHs.TypeCheck.tCheckTypeTImpl
	.globl	MicroHs.TypeCheck.tGetExpType
	.globl	MicroHs.TypeCheck.tGetRefType
	.globl	MicroHs.TypeCheck.tInfer
	.globl	MicroHs.TypeCheck.tInferDefs
	.globl	MicroHs.TypeCheck.tInferExpr
	.globl	MicroHs.TypeCheck.tInferPat
	.globl	MicroHs.TypeCheck.tInferTypeT
	.globl	MicroHs.TypeCheck.tInst
	.globl	MicroHs.TypeCheck.tInst$27
	.globl	MicroHs.TypeCheck.tInstForall
	.globl	MicroHs.TypeCheck.tList
	.globl	MicroHs.TypeCheck.tListI
	.globl	MicroHs.TypeCheck.tLookup
	.globl	MicroHs.TypeCheck.tLookupV
	.globl	MicroHs.TypeCheck.tModule
	.globl	MicroHs.TypeCheck.tSetRefType
	.globl	MicroHs.TypeCheck.tcAddInfix
	.globl	MicroHs.TypeCheck.tcAlt
	.globl	MicroHs.TypeCheck.tcAlts
	.globl	MicroHs.TypeCheck.tcArm
	.globl	MicroHs.TypeCheck.tcBind
	.globl	MicroHs.TypeCheck.tcBindVarT
	.globl	MicroHs.TypeCheck.tcBinds
	.globl	MicroHs.TypeCheck.tcConstr
	.globl	MicroHs.TypeCheck.tcCtx
	.globl	MicroHs.TypeCheck.tcDefType
	.globl	MicroHs.TypeCheck.tcDefValue
	.globl	MicroHs.TypeCheck.tcDefs
	.globl	MicroHs.TypeCheck.tcDefsType
	.globl	MicroHs.TypeCheck.tcDefsValue
	.globl	MicroHs.TypeCheck.tcEqn
	.globl	MicroHs.TypeCheck.tcEqns
	.globl	MicroHs.TypeCheck.tcErrorTK
	.globl	MicroHs.TypeCheck.tcExpandClassInst
	.globl	MicroHs.TypeCheck.tcExpr
	.globl	MicroHs.TypeCheck.tcExprLam
	.globl	MicroHs.TypeCheck.tcExprR
	.globl	MicroHs.TypeCheck.tcGuard
	.globl	MicroHs.TypeCheck.tcGuards
	.globl	MicroHs.TypeCheck.tcKind
	.globl	MicroHs.TypeCheck.tcKindT
	.globl	MicroHs.TypeCheck.tcLSect
	.globl	MicroHs.TypeCheck.tcLit
	.globl	MicroHs.TypeCheck.tcLit$27
	.globl	MicroHs.TypeCheck.tcOper
	.globl	MicroHs.TypeCheck.tcPat
	.globl	MicroHs.TypeCheck.tcPatAp
	.globl	MicroHs.TypeCheck.tcPatApCon
	.globl	MicroHs.TypeCheck.tcPatBind
	.globl	MicroHs.TypeCheck.tcPatSyn
	.globl	MicroHs.TypeCheck.tcPats
	.globl	MicroHs.TypeCheck.tcRSect
	.globl	MicroHs.TypeCheck.tcReset
	.globl	MicroHs.TypeCheck.tcType
	.globl	MicroHs.TypeCheck.tcTypeT
	.globl	MicroHs.TypeCheck.tyQIdent
	.globl	MicroHs.TypeCheck.tyVarSubst
	.globl	MicroHs.TypeCheck.typeCheck
	.globl	MicroHs.TypeCheck.unArrow
	.globl	MicroHs.TypeCheck.unify
	.globl	MicroHs.TypeCheck.unifyR
	.globl	MicroHs.TypeCheck.unifyUnboundVar
	.globl	MicroHs.TypeCheck.unifyVar
	.globl	MicroHs.TypeCheck.uniqIdentSep
	.globl	MicroHs.TypeCheck.unsetField
	.globl	MicroHs.TypeCheck.withDict
	.globl	MicroHs.TypeCheck.withDicts
	.globl	MicroHs.TypeCheck.withExtTyps
	.globl	MicroHs.TypeCheck.withExtVal
	.globl	MicroHs.TypeCheck.withExtVals
	.globl	MicroHs.TypeCheck.withFixes
	.globl	MicroHs.TypeCheck.withLHS
	.globl	MicroHs.TypeCheck.withTypeTable
	.globl	MicroHs.TypeCheck.withVks
	.globl	Numeric.Show.showHex
	.globl	Numeric.Show.showInt
	.globl	Numeric.Show.showIntAtBase
	.globl	Numeric.Show.showIntegral
	.globl	Numeric.Show.showSigned
	.globl	Paths_MicroHs.getDataDir
	.globl	Paths_MicroHs.version
	.globl	Primitives._wordSize
	.globl	Primitives.primAddFinalizer
	.globl	Primitives.primBind
	.globl	Primitives.primBranchEQ
	.globl	Primitives.primBranchGE
	.globl	Primitives.primBranchGT
	.globl	Primitives.primBranchLE
	.globl	Primitives.primBranchLT
	.globl	Primitives.primBranchNE
	.globl	Primitives.primBranchUEQ
	.globl	Primitives.primBranchULT
	.globl	Primitives.primCharCompare
	.globl	Primitives.primCharEQ
	.globl	Primitives.primCharGE
	.globl	Primitives.primCharGT
	.globl	Primitives.primCharLE
	.globl	Primitives.primCharLT
	.globl	Primitives.primCharNE
	.globl	Primitives.primFloatWAdd
	.globl	Primitives.primFloatWDiv
	.globl	Primitives.primFloatWEQ
	.globl	Primitives.primFloatWGE
	.globl	Primitives.primFloatWGT
	.globl	Primitives.primFloatWLE
	.globl	Primitives.primFloatWLT
	.globl	Primitives.primFloatWMul
	.globl	Primitives.primFloatWNE
	.globl	Primitives.primFloatWSub
	.globl	Primitives.primGetArgRef
	.globl	Primitives.primIntAdd
	.globl	Primitives.primIntAnd
	.globl	Primitives.primIntCompare
	.globl	Primitives.primIntEQ
	.globl	Primitives.primIntGE
	.globl	Primitives.primIntGT
	.globl	Primitives.primIntInv
	.globl	Primitives.primIntLE
	.globl	Primitives.primIntLT
	.globl	Primitives.primIntMul
	.globl	Primitives.primIntNE
	.globl	Primitives.primIntOr
	.globl	Primitives.primIntQuot
	.globl	Primitives.primIntRem
	.globl	Primitives.primIntShl
	.globl	Primitives.primIntShr
	.globl	Primitives.primIntSub
	.globl	Primitives.primIntXor
	.globl	Primitives.primNewForeignPtr
	.globl	Primitives.primPerformIO
	.globl	Primitives.primReturn
	.globl	Primitives.primRnfErr
	.globl	Primitives.primThen
	.globl	Primitives.primUnsafeCoerce
	.globl	Primitives.primWordAdd
	.globl	Primitives.primWordAnd
	.globl	Primitives.primWordCompare
	.globl	Primitives.primWordEQ
	.globl	Primitives.primWordGE
	.globl	Primitives.primWordGT
	.globl	Primitives.primWordInv
	.globl	Primitives.primWordLE
	.globl	Primitives.primWordLT
	.globl	Primitives.primWordMul
	.globl	Primitives.primWordNE
	.globl	Primitives.primWordOr
	.globl	Primitives.primWordQuot
	.globl	Primitives.primWordRem
	.globl	Primitives.primWordShl
	.globl	Primitives.primWordShr
	.globl	Primitives.primWordSub
	.globl	Primitives.primWordXor
	.globl	System.Console.SimpleReadline.getInputLineHistComp
	.globl	System.Console.SimpleReadline.getRaw
	.globl	System.Console.SimpleReadline.loop
	.globl	System.Console.SimpleReadline.loop$27
	.globl	System.Directory.copyFile
	.globl	System.Directory.createDirectoryIfMissing
	.globl	System.Directory.doesDirectoryExist
	.globl	System.Directory.doesFileExist
	.globl	System.Directory.getDirectoryContents
	.globl	System.Directory.removeFile
	.globl	System.Environment.argRdK
	.globl	System.Environment.argSelK
	.globl	System.Environment.argcK
	.globl	System.Environment.argsFromK
	.globl	System.Environment.getArgs
	.globl	System.Environment.goK
	.globl	System.Environment.lookupEnv
	.globl	System.Environment.readArgK
	.globl	System.Environment.withArgs
	.globl	System.FilePath.addExtension
	.globl	System.FilePath.combineAlways
	.globl	System.FilePath.dropFileName
	.globl	System.FilePath.dropTrailingPathSeparator
	.globl	System.FilePath.isExtSeparator
	.globl	System.FilePath.isPathSeparator
	.globl	System.FilePath.splitFileName
	.globl	System.FilePath.splitFileName_
	.globl	System.FilePath.takeDirectory
	.globl	System.IO.Error.EOF
	.globl	System.IO.Error.IOError
	.globl	System.IO.Error.NoSuchThing
	.globl	System.IO.Error.OtherError
	.globl	System.IO.Error.inst$24$28Control.Exception.Internal.Exception$40System.IO.Error.IOException$29
	.globl	System.IO.Error.inst$24$28Data.Typeable.Typeable$40System.IO.Error.IOException$29
	.globl	System.IO.Error.inst$24$28Text.Show.Show$40System.IO.Error.IOErrorType$29
	.globl	System.IO.Error.inst$24$28Text.Show.Show$40System.IO.Error.IOException$29
	.globl	System.IO.Error.ioException
	.globl	System.IO.Internal.addTransducer
	.globl	System.IO.Internal.c_close
	.globl	System.IO.Internal.getHandleState
	.globl	System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Data.Eq.Eq$40System.IO_Handle.Handle$29
	.globl	System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Text.Show.Show$40System.IO_Handle.Handle$29
	.globl	System.IO.Internal.ioModeToHMode
	.globl	System.IO.Internal.killHandle
	.globl	System.IO.Internal.mkHandle
	.globl	System.IO.Internal.setHandleState
	.globl	System.IO.Internal.unsafeHandle
	.globl	System.IO.Internal.withHandle
	.globl	System.IO.Internal.withHandleM
	.globl	System.IO.Internal.withHandleRd
	.globl	System.IO.Internal.withHandleWr
	.globl	System.IO.MD5.inst$24$28Data.Eq.Eq$40System.IO.MD5.MD5CheckSum$29
	.globl	System.IO.MD5.md5Combine
	.globl	System.IO.MD5.md5File
	.globl	System.IO.MD5.md5Handle
	.globl	System.IO.MD5.md5String
	.globl	System.IO.Serialize.hDeserialize
	.globl	System.IO.Serialize.hSerialize
	.globl	System.IO.Serialize.readSerialized
	.globl	System.IO.Serialize.writeSerializedCompressed
	.globl	System.IO.TimeMilli.getTimeMilli
	.globl	System.IO.c_add_FILE
	.globl	System.IO.c_closeb
	.globl	System.IO.c_flushb
	.globl	System.IO.c_getb
	.globl	System.IO.c_putb
	.globl	System.IO.c_ungetb
	.globl	System.IO.cgetbK
	.globl	System.IO.contentsK
	.globl	System.IO.hClose
	.globl	System.IO.hCloseReal
	.globl	System.IO.hFlush
	.globl	System.IO.hGetChar
	.globl	System.IO.hGetContents
	.globl	System.IO.hLookAhead
	.globl	System.IO.hPutChar
	.globl	System.IO.hPutStr
	.globl	System.IO.hPutStrLn
	.globl	System.IO.ioErr
	.globl	System.IO.ioErrH
	.globl	System.IO.ioOpenFd
	.globl	System.IO.ioPathc
	.globl	System.IO.openBinaryFile
	.globl	System.IO.openFILEM
	.globl	System.IO.openFile
	.globl	System.IO.openFileM
	.globl	System.IO.openTmpFile
	.globl	System.IO.primStderr
	.globl	System.IO.primStdin
	.globl	System.IO.primStdout
	.globl	System.IO.putChar
	.globl	System.IO.putStr
	.globl	System.IO.putStrLn
	.globl	System.IO.readFile
	.globl	System.IO.splitTmp
	.globl	System.IO.stderr
	.globl	System.IO.stdin
	.globl	System.IO.stdout
	.globl	System.IO.writeFile
	.globl	System.IO_Handle.inst$24$28Data.Eq.Eq$40System.IO_Handle.HandleState$29
	.globl	System.Process.callCommand
	.globl	Text.ParserComb.$3c$7c$3c
	.globl	Text.ParserComb.emany
	.globl	Text.ParserComb.eoptional
	.globl	Text.ParserComb.esepBy
	.globl	Text.ParserComb.esepBy1
	.globl	Text.ParserComb.esepEndBy
	.globl	Text.ParserComb.esepEndBy1
	.globl	Text.ParserComb.esome
	.globl	Text.ParserComb.firstToken
	.globl	Text.ParserComb.inst$24$28Control.Applicative.Alternative$40$28Text.ParserComb.Prsr$40tm$40t$29$29
	.globl	Text.ParserComb.inst$24$28Control.Applicative.Applicative$40$28Text.ParserComb.Prsr$40tm$40t$29$29
	.globl	Text.ParserComb.inst$24$28Control.Monad.Fail.MonadFail$40$28Text.ParserComb.Prsr$40tm$40t$29$29
	.globl	Text.ParserComb.inst$24$28Control.Monad.Monad$40$28Text.ParserComb.Prsr$40tm$40t$29$29
	.globl	Text.ParserComb.inst$24$28Data.Functor.Functor$40$28Text.ParserComb.Prsr$40tm$40t$29$29
	.globl	Text.ParserComb.longest
	.globl	Text.ParserComb.longests
	.globl	Text.ParserComb.mapTokenState
	.globl	Text.ParserComb.nextToken
	.globl	Text.ParserComb.noFail
	.globl	Text.ParserComb.runP
	.globl	Text.ParserComb.runPrsr
	.globl	Text.ParserComb.satisfy
	.globl	Text.ParserComb.satisfyM
	.globl	Text.ParserComb.tmLeft
	.globl	Text.ParserComb.tmNextToken
	.globl	Text.ParserComb.tmRawTokens
	.globl	Text.PrettyPrint.HughesPJLite.$24$24
	.globl	Text.PrettyPrint.HughesPJLite.$24$2b$24
	.globl	Text.PrettyPrint.HughesPJLite.$3c$2b$3e
	.globl	Text.PrettyPrint.HughesPJLite.$3c$3e
	.globl	Text.PrettyPrint.HughesPJLite.Above
	.globl	Text.PrettyPrint.HughesPJLite.Beside
	.globl	Text.PrettyPrint.HughesPJLite.Empty
	.globl	Text.PrettyPrint.HughesPJLite.Nest
	.globl	Text.PrettyPrint.HughesPJLite.NilAbove
	.globl	Text.PrettyPrint.HughesPJLite.NoDoc
	.globl	Text.PrettyPrint.HughesPJLite.TextBeside
	.globl	Text.PrettyPrint.HughesPJLite.Union
	.globl	Text.PrettyPrint.HughesPJLite.above
	.globl	Text.PrettyPrint.HughesPJLite.aboveNest
	.globl	Text.PrettyPrint.HughesPJLite.above_
	.globl	Text.PrettyPrint.HughesPJLite.beside
	.globl	Text.PrettyPrint.HughesPJLite.beside_
	.globl	Text.PrettyPrint.HughesPJLite.best
	.globl	Text.PrettyPrint.HughesPJLite.