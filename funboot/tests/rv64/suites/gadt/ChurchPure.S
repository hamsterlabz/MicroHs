# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/ChurchPure  (entry @0)
	.text
	.globl	ChurchPure.bench
	.globl	ChurchPure.exp_
	.globl	ChurchPure.intToNat
	.globl	ChurchPure.main
	.globl	ChurchPure.natToInt
	.globl	ChurchPure.plus
	.globl	ChurchPure.pred_
	.globl	ChurchPure.times
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3e$3d
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  ChurchPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
ChurchPure.main:	fn_link  L36
	fn_elink ChurchPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
ChurchPure.bench:	fn_link  L384
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L80
	fn_link  L104
	fn_link  L112
	fn_link  NanoPrelude.rem
	fn_link  L116
	fn_combi_t52 6, 0,1,2,5,3,4
L80:	fn_force
	fn_tor a0
	addiw a0,a0,3
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L104:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L112:	fn_combi_t0 1, 0,0,0,0,0,0
L116:	fn_y
# --- block 5 ---
L120:	fn_link  L144
	fn_link  L168
	fn_link  L176
	fn_link  NanoPrelude.rem
	fn_link  L180
	fn_combi_t52 6, 0,1,2,5,3,4
L144:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L168:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L176:	fn_combi_t0 1, 0,0,0,0,0,0
L180:	fn_y
# --- block 6 ---
L184:	fn_link  ChurchPure.times
	fn_link  ChurchPure.natToInt
	fn_link  L200
	fn_combi_t21 5, 0,1,2,4,3,0
L200:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 7 ---
L204:	fn_link  L212
	fn_elink ChurchPure.intToNat
L212:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 8 ---
L220:	fn_link  L228
	fn_elink ChurchPure.intToNat
L228:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 9 ---
L236:	fn_link  L204
	fn_link  L220
	fn_elink ChurchPure.exp_
# --- block 10 ---
L248:	fn_link  L236
	fn_elink ChurchPure.natToInt
# --- block 11 ---
L256:	fn_link  L248
	fn_link  L272
	fn_link  Common.hashMix
	fn_combi_t20 4, 0,0,3,1,2,0
L272:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 12 ---
L276:	fn_link  ChurchPure.plus
	fn_link  ChurchPure.natToInt
	fn_link  L300
	fn_link  L256
	fn_link  L304
	fn_combi_t24 6, 0,1,5,2,3,4
L300:	fn_combi_t0 1, 0,0,0,0,0,0
L304:	fn_combi_t63 6, 0,1,2,3,5,4
# --- block 13 ---
L308:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 14 ---
L316:	fn_link  L184
	fn_link  L276
	fn_link  L308
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 15 ---
L332:	fn_link  L340
	fn_combi_t24 6, 0,1,5,2,3,4
L340:	fn_combi_t50 5, 0,4,1,2,3,4
# --- block 16 ---
L344:	fn_link  ChurchPure.pred_
	fn_link  ChurchPure.natToInt
	fn_link  L368
	fn_link  L316
	fn_link  L332
	fn_combi_t24 6, 0,1,5,2,3,4
L368:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 17 ---
L372:	fn_link  ChurchPure.intToNat
	fn_link  L344
	fn_combi_t39 5, 0,4,1,3,1,2
# --- block 18 ---
L384:	fn_link  L56
	fn_link  L120
	fn_link  L372
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 19 ---
Common.benchFold:	fn_link  L420
	fn_link  L428
	fn_link  L524
	fn_link  L436
	fn_combi_t26 6, 0,1,4,5,2,3
L420:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L428:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L436:	fn_y
# --- block 20 ---
L440:	fn_link  L452
	fn_link  L476
	fn_combi_t41 6, 2,0,4,1,3,5
L452:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L476:	fn_y
# --- block 21 ---
L480:	fn_link  L440
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 22 ---
L488:	fn_link  L500
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L500:	fn_elink _error0
# --- block 23 ---
L504:	fn_link  L480
	fn_link  L488
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 24 ---
L516:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 25 ---
L524:	fn_link  L504
	fn_link  L516
	fn_link  L540
	fn_combi_t5 4, 0,1,3,2,0,0
L540:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 26 ---
GExtra.$3e$3d:	fn_link  L552
	fn_combi_t3 3, 2,1,0,0,0,0
L552:	fn_elink _prim_geu
# --- block 27 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 28 ---
Common.hashMix:	fn_link  L576
	fn_link  L684
	fn_link  L712
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 29 ---
L576:	fn_link  L596
	fn_link  GExtra.xor
	fn_link  L620
	fn_link  L628
	fn_combi_t60 6, 0,1,2,4,5,3
L596:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L620:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L628:	fn_y
# --- block 30 ---
L632:	fn_link  L652
	fn_link  L676
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L652:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L676:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 31 ---
L684:	fn_link  L632
	fn_link  L700
	fn_link  L708
	fn_combi_t8 4, 0,1,2,3,0,0
L700:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L708:	fn_y
# --- block 32 ---
L712:	fn_link  L728
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L728:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 33 ---
GExtra.xor:	fn_link  L748
	fn_link  L772
	fn_combi_t8 4, 0,3,2,1,0,0
L748:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L772:	fn_y
# --- block 34 ---
GExtra.shiftR:	fn_link  L788
	fn_link  L812
	fn_combi_t8 4, 0,3,2,1,0,0
L788:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L812:	fn_y
# --- block 35 ---
ChurchPure.natToInt:	fn_link  L836
	fn_link  L828
	fn_combi_t2 3, 2,0,1,0,0,0
L828:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 36 ---
L836:	fn_link  L852
	fn_link  ChurchPure.natToInt
	fn_link  L876
	fn_combi_t7 4, 0,1,3,2,0,0
L852:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L876:	fn_y
# --- block 37 ---
ChurchPure.exp_:	fn_link  L904
	fn_link  L892
	fn_combi_t3 3, 0,1,2,0,0,0
L892:	fn_y
# --- block 38 ---
L896:	fn_link  ChurchPure.times
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 39 ---
L904:	fn_link  L896
	fn_link  L920
	fn_link  L924
	fn_combi_t44 6, 5,0,1,2,3,4
L920:	fn_combi_t0 2, 0,0,0,0,0,0
L924:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 40 ---
ChurchPure.times:	fn_link  L944
	fn_link  L952
	fn_link  L948
	fn_combi_t17 5, 3,0,1,2,4,0
L944:	fn_combi_t0 1, 0,0,0,0,0,0
L948:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
L952:	fn_link  ChurchPure.times
	fn_link  ChurchPure.plus
	fn_combi_t16 4, 0,2,1,3,2,0
# --- block 42 ---
ChurchPure.plus:	fn_link  L972
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 43 ---
L972:	fn_link  ChurchPure.plus
	fn_link  L984
	fn_combi_t7 4, 0,1,3,2,0,0
L984:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 44 ---
ChurchPure.intToNat:	fn_link  L1008
	fn_link  L1024
	fn_link  L1012
	fn_link  L1016
	fn_combi_t29 5, 4,0,1,2,4,3
L1008:	fn_combi_t0 2, 0,0,0,0,0,0
L1012:	fn_elink _prim_eq
L1016:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 45 ---
L1024:	fn_link  L1044
	fn_link  L1068
	fn_link  ChurchPure.intToNat
	fn_link  L1072
	fn_combi_t22 5, 0,1,2,4,3,0
L1044:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1068:	fn_y
L1072:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 46 ---
ChurchPure.pred_:	fn_link  L1088
	fn_link  L1092
	fn_combi_t2 3, 2,0,1,0,0,0
L1088:	fn_combi_t0 1, 0,0,0,0,0,0
L1092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
NanoPrelude.rem:	fn_link  L1108
	fn_link  L1132
	fn_combi_t8 4, 0,3,2,1,0,0
L1108:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1132:	fn_y

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
_unimpprim_addiw$202:
	la a0, _unimpprim_addiw$202$name
	tail _unimpfi_halt
_unimpprim_addiw$202$name:
	.asciz "addiw 2"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$203:
	la a0, _unimpprim_addiw$203$name
	tail _unimpfi_halt
_unimpprim_addiw$203$name:
	.asciz "addiw 3"
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
