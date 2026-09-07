# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Queens  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.concatMap
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.length
	.globl	Primitives.primPerformIO
	.globl	Queens.gen
	.globl	Queens.gen1
	.globl	Queens.gen2
	.globl	Queens.main
	.globl	Queens.nsoln
	.globl	Queens.safe
	.globl	Queens.toOne
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Queens.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Queens.main:	fn_link  L36
	fn_elink Queens.nsoln
L36:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 3 ---
Queens.nsoln:	fn_link  Queens.gen
	fn_link  NanoPrelude.length
	fn_combi_t7 3, 0,1,2,2,0,0
# --- block 4 ---
NanoPrelude.length:	fn_link  L68
	fn_link  L116
	fn_y
L68:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L76:	fn_link  L88
	fn_link  L112
	fn_combi_t8 5, 2,0,3,1,0,0
L88:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L112:	fn_y
# --- block 6 ---
L116:	fn_link  L76
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 7 ---
Queens.gen:	fn_link  L240
	fn_link  L136
	fn_combi_t3 3, 0,1,2,0,0,0
L136:	fn_y
# --- block 8 ---
L140:	fn_link  L152
	fn_link  L156
	fn_combi_t2 4, 3,0,1,0,0,0
L152:	fn_combi_t0 2, 0,0,0,0,0,0
L156:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 9 ---
L160:	fn_link  L172
	fn_link  L196
	fn_combi_t8 4, 2,0,3,1,0,0
L172:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L196:	fn_y
# --- block 10 ---
L200:	fn_link  L160
	fn_link  Queens.gen1
	fn_link  Data.List_Type.concatMap
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 11 ---
L216:	fn_link  L228
	fn_link  L232
	fn_combi_t29 5, 0,4,1,2,4,3
L228:	fn_elink _prim_eq
L232:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 12 ---
L240:	fn_link  L140
	fn_link  L200
	fn_link  L216
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 13 ---
Data.List_Type.concatMap:	fn_link  L280
	fn_link  L268
	fn_combi_t3 3, 0,1,2,0,0,0
L268:	fn_y
# --- block 14 ---
L272:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 15 ---
L280:	fn_link  L272
	fn_link  L292
	fn_combi_t16 5, 4,0,1,2,3,0
L292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
Data.List_Type.$2b$2b:	fn_link  L324
	fn_link  L308
	fn_combi_t5 4, 0,1,3,2,0,0
L308:	fn_y
# --- block 17 ---
L312:	fn_link  L320
	fn_combi_t6 4, 0,2,1,3,0,0
L320:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 18 ---
L324:	fn_link  L312
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 19 ---
Queens.gen1:	fn_link  Queens.toOne
	fn_link  L344
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 20 ---
L344:	fn_link  Queens.gen2
	fn_link  Data.List_Type.concatMap
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 21 ---
Queens.gen2:	fn_link  L368
	fn_link  L388
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 22 ---
L368:	fn_link  L380
	fn_link  L384
	fn_combi_t12 6, 5,0,3,2,1,0
L380:	fn_combi_t0 2, 0,0,0,0,0,0
L384:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L388:	fn_link  L404
	fn_link  L408
	fn_link  Queens.safe
	fn_combi_t9 5, 0,4,1,3,2,0
L404:	fn_combi_t0 2, 0,0,0,0,0,0
L408:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 24 ---
Queens.safe:	fn_link  L748
	fn_link  L428
	fn_combi_t3 3, 0,1,2,0,0,0
L428:	fn_y
# --- block 25 ---
L432:	fn_link  L444
	fn_link  L468
	fn_combi_t8 4, 2,0,3,1,0,0
L444:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L468:	fn_y
# --- block 26 ---
L472:	fn_link  L488
	fn_link  L492
	fn_link  L516
	fn_combi_t41 6, 0,4,5,1,3,2
L488:	fn_elink _prim_ne
L492:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L516:	fn_y
# --- block 27 ---
L520:	fn_link  L532
	fn_link  L472
	fn_combi_t9 5, 0,2,3,4,1,0
L532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 28 ---
L536:	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 29 ---
L544:	fn_link  L536
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 30 ---
L552:	fn_link  L432
	fn_link  L572
	fn_link  L520
	fn_link  L544
	fn_combi_t38 6, 0,1,4,2,3,5
L572:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 31 ---
L576:	fn_link  L592
	fn_link  L596
	fn_link  L620
	fn_combi_t41 6, 0,4,5,1,3,2
L592:	fn_elink _prim_ne
L596:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L620:	fn_y
# --- block 32 ---
L624:	fn_link  L636
	fn_link  L576
	fn_combi_t9 5, 0,2,3,4,1,0
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L640:	fn_link  L660
	fn_link  L664
	fn_link  L668
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L660:	fn_combi_t0 2, 1,0,0,0,0,0
L664:	fn_combi_t0 2, 0,0,0,0,0,0
L668:	fn_elink _prim_ne
# --- block 34 ---
L672:	fn_link  L680
	fn_combi_t38 5, 0,1,4,2,3,4
L680:	fn_combi_t57 6, 0,1,2,3,4,5
# --- block 35 ---
L684:	fn_link  NanoPrelude.$26$26
	fn_link  L640
	fn_link  L672
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 36 ---
L700:	fn_link  L624
	fn_link  L684
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 37 ---
L712:	fn_link  L728
	fn_link  L700
	fn_link  L732
	fn_combi_t5 4, 0,1,3,2,0,0
L728:	fn_combi_t0 2, 1,0,0,0,0,0
L732:	fn_combi_t37 5, 0,2,4,1,3,4
# --- block 38 ---
L736:	fn_link  L744
	fn_combi_t48 5, 4,0,1,3,2,3
L744:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 39 ---
L748:	fn_link  L552
	fn_link  L712
	fn_link  L736
	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 40 ---
NanoPrelude.$26$26:	fn_link  L772
	fn_combi_t1 2, 1,0,0,0,0,0
L772:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
Queens.toOne:	fn_link  L808
	fn_link  L832
	fn_link  L796
	fn_link  L800
	fn_combi_t29 5, 0,4,1,2,4,3
L796:	fn_elink _prim_eq
L800:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 42 ---
L808:	fn_link  L820
	fn_link  L824
	fn_combi_t2 4, 3,0,1,0,0,0
L820:	fn_combi_t0 2, 0,0,0,0,0,0
L824:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 43 ---
L832:	fn_link  L852
	fn_link  L876
	fn_link  Queens.toOne
	fn_link  L880
	fn_combi_t50 5, 0,4,1,2,4,3
L852:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L876:	fn_y
L880:	fn_combi_t2 4, 3,0,1,0,0,0

# --- unimplemented foreign-import / primitive stubs ---
	.balign 4
_unimpfi_iswindows:
	la a0, _unimpfi_iswindows$name
	tail _unimpfi_halt
_unimpfi_iswindows$name:
	.asciz "iswindows"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$20$2d1:
	la a0, _unimpprim_addiw$20$2d1$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d1$name:
	.asciz "addiw -1"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$201:
	la a0, _unimpprim_addiw$201$name
	tail _unimpfi_halt
_unimpprim_addiw$201$name:
	.asciz "addiw 1"
	.balign 4, 0
	.balign 4
_unimpprim_fread:
	la a0, _unimpprim_fread$name
	tail _unimpfi_halt
_unimpprim_fread$name:
	.asciz "fread"
	.balign 4, 0
	.balign 4
_unimpprim_fshow:
	la a0, _unimpprim_fshow$name
	tail _unimpfi_halt
_unimpprim_fshow$name:
	.asciz "fshow"
	.balign 4, 0
	.balign 4
_unimpprim_newCAStringLen:
	la a0, _unimpprim_newCAStringLen$name
	tail _unimpfi_halt
_unimpprim_newCAStringLen$name:
	.asciz "newCAStringLen"
	.balign 4, 0
	.balign 4
_unimpprim_peekCAString:
	la a0, _unimpprim_peekCAString$name
	tail _unimpfi_halt
_unimpprim_peekCAString$name:
	.asciz "peekCAString"
	.balign 4, 0
	.balign 4
_unimpprim_peekCAStringLen:
	la a0, _unimpprim_peekCAStringLen$name
	tail _unimpfi_halt
_unimpprim_peekCAStringLen$name:
	.asciz "peekCAStringLen"
	.balign 4, 0
	.balign 4
_unimpprim_scmp:
	la a0, _unimpprim_scmp$name
	tail _unimpfi_halt
_unimpprim_scmp$name:
	.asciz "scmp"
	.balign 4, 0
	.balign 4
_unimpprim_sequal:
	la a0, _unimpprim_sequal$name
	tail _unimpfi_halt
_unimpprim_sequal$name:
	.asciz "sequal"
	.balign 4, 0
	.balign 4
_unimpprim_try:
	la a0, _unimpprim_try$name
	tail _unimpfi_halt
_unimpprim_try$name:
	.asciz "try"
	.balign 4, 0
