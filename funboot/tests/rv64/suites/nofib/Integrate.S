# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Integrate  (entry @0)
	.text
	.globl	Integrate.bench
	.globl	Integrate.es
	.globl	Integrate.etotal
	.globl	Integrate.integrate1D
	.globl	Integrate.integrate2D
	.globl	Integrate.ints
	.globl	Integrate.is
	.globl	Integrate.itotals
	.globl	Integrate.rtotals
	.globl	Integrate.sumD
	.globl	Integrate.takeD
	.globl	Integrate.zark
	.globl	Integrate.zarks
	.globl	Integrate.zipWD
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.head
	.globl	NanoPrelude.map
	.globl	NanoPrelude.tail
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Integrate.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Integrate.bench:	fn_link  L36
	fn_elink _prim_ftoi
# --- block 3 ---
L36:	fn_link  L44
	fn_elink Integrate.etotal
L44:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
Integrate.etotal:	fn_link  Integrate.es
	fn_link  Integrate.takeD
	fn_link  Integrate.sumD
	fn_combi_t7 4, 0,1,3,2,0,0
# --- block 5 ---
Integrate.sumD:	fn_link  L80
	fn_link  L104
	fn_y
# --- block 6 ---
L80:	fn_link  L88
	fn_elink _prim_itof
L88:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
L96:	fn_link  NanoPrelude.$2b.
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 8 ---
L104:	fn_link  L96
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 9 ---
NanoPrelude.$2b.:	fn_link  L124
	fn_link  L128
	fn_combi_t8 4, 0,3,2,1,0,0
L124:	fn_elink _prim_fadd
L128:	fn_y
# --- block 10 ---
Integrate.takeD:	fn_link  L148
	fn_link  L196
	fn_link  L212
	fn_combi_t24 5, 0,1,3,3,4,2
L148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 11 ---
L152:	fn_link  L168
	fn_link  L192
	fn_link  Integrate.takeD
	fn_combi_t8 4, 0,1,3,2,0,0
L168:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L192:	fn_y
# --- block 12 ---
L196:	fn_link  L152
	fn_link  L208
	fn_combi_t16 5, 0,3,1,2,4,0
L208:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 13 ---
L212:	fn_link  L228
	fn_link  L232
	fn_link  L236
	fn_combi_t44 6, 4,0,1,5,2,3
L228:	fn_elink _error0
L232:	fn_elink _prim_eq
L236:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 14 ---
Integrate.es:	fn_link  L256
	fn_link  L272
	fn_elink NanoPrelude.map
# --- block 15 ---
L256:	fn_link  Integrate.itotals
	fn_link  Integrate.rtotals
	fn_link  NanoPrelude.$2d.
	fn_elink Integrate.zipWD
# --- block 16 ---
L272:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 17 ---
NanoPrelude.map:	fn_link  L308
	fn_link  L292
	fn_combi_t3 3, 0,1,2,0,0,0
L292:	fn_y
# --- block 18 ---
L296:	fn_link  L304
	fn_combi_t15 5, 0,1,3,2,4,0
L304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L308:	fn_link  L296
	fn_link  L320
	fn_combi_t16 5, 4,0,1,2,3,0
L320:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
NanoPrelude.$2a.:	fn_link  L336
	fn_link  L340
	fn_combi_t8 4, 0,3,2,1,0,0
L336:	fn_elink _prim_fmul
L340:	fn_y
# --- block 21 ---
Integrate.zipWD:	fn_link  L396
	fn_link  L356
	fn_combi_t3 3, 0,1,2,0,0,0
L356:	fn_y
# --- block 22 ---
L360:	fn_link  L368
	fn_combi_t40 6, 0,1,2,4,3,5
L368:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L372:	fn_link  L380
	fn_combi_t48 6, 3,0,1,4,2,5
L380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
L384:	fn_link  L360
	fn_link  L372
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 25 ---
L396:	fn_link  L384
	fn_link  L408
	fn_combi_t46 6, 4,0,1,2,3,5
L408:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
NanoPrelude.$2d.:	fn_link  L424
	fn_link  L428
	fn_combi_t8 4, 0,3,2,1,0,0
L424:	fn_elink _prim_fsub
L428:	fn_y
# --- block 27 ---
Integrate.rtotals:	fn_link  L452
	fn_link  L468
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 28 ---
L444:	fn_link  Integrate.zarks
	fn_elink NanoPrelude.tail
# --- block 29 ---
L452:	fn_link  Integrate.rtotals
	fn_link  L444
	fn_link  NanoPrelude.$2b.
	fn_elink Integrate.zipWD
# --- block 30 ---
L468:	fn_link  Integrate.zarks
	fn_elink NanoPrelude.head
# --- block 31 ---
NanoPrelude.head:	fn_link  L488
	fn_link  L492
	fn_combi_t2 3, 2,0,1,0,0,0
L488:	fn_combi_t0 2, 0,0,0,0,0,0
L492:	fn_elink _error0
# --- block 32 ---
Integrate.zarks:	fn_link  L536
	fn_link  Integrate.ints
	fn_link  Integrate.zark
	fn_elink Integrate.zipWD
# --- block 33 ---
L512:	fn_link  L520
	fn_elink _prim_itof
L520:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 34 ---
L528:	fn_link  L512
	fn_elink NanoPrelude.$2a.
# --- block 35 ---
L536:	fn_link  Integrate.ints
	fn_link  L528
	fn_elink NanoPrelude.map
# --- block 36 ---
Integrate.zark:	fn_link  NanoPrelude.$2a.
	fn_link  L560
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 37 ---
L560:	fn_link  L584
	fn_link  L592
	fn_link  L596
	fn_link  L604
	fn_link  Integrate.integrate2D
	fn_combi_t38 6, 0,1,2,5,3,4
L584:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L592:	fn_elink _prim_itof
L596:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L604:	fn_elink _prim_itof
# --- block 38 ---
Integrate.integrate2D:	fn_link  L620
	fn_link  L636
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 39 ---
L620:	fn_link  L632
	fn_link  Integrate.integrate1D
	fn_combi_t42 6, 0,2,3,1,4,5
L632:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 40 ---
L636:	fn_link  Integrate.integrate1D
	fn_combi_t42 6, 0,3,4,1,2,5
# --- block 41 ---
Integrate.integrate1D:	fn_link  L692
	fn_link  L704
	fn_link  L1224
	fn_combi_t11 4, 0,3,1,3,2,0
# --- block 42 ---
L660:	fn_link  L668
	fn_elink _prim_itof
L668:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 43 ---
L676:	fn_link  L684
	fn_elink _prim_itof
L684:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 44 ---
L692:	fn_link  L660
	fn_link  L676
	fn_elink NanoPrelude.$2f.
# --- block 45 ---
L704:	fn_link  L724
	fn_link  L732
	fn_link  NanoPrelude.$2d.
	fn_link  NanoPrelude.$2f.
	fn_combi_t40 6, 0,1,5,4,2,3
L724:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L732:	fn_elink _prim_itof
# --- block 46 ---
L736:	fn_link  L748
	fn_link  NanoPrelude.$2a.
	fn_combi_t33 7, 6,0,3,2,4,1
L748:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
L752:	fn_link  NanoPrelude.$2d.
	fn_link  L764
	fn_combi_t37 6, 0,4,1,2,3,5
L764:	fn_combi_t35 7, 6,0,1,2,4,3
# --- block 48 ---
L768:	fn_link  L736
	fn_link  L752
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 49 ---
L780:	fn_link  L800
	fn_link  L808
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t47 6, 0,4,1,2,3,5
L800:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L808:	fn_elink _prim_itof
# --- block 50 ---
L812:	fn_link  L780
	fn_link  L824
	fn_combi_t3 3, 0,1,2,0,0,0
L824:	fn_combi_t41 6, 5,1,0,3,2,3
# --- block 51 ---
L828:	fn_link  L812
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 52 ---
L836:	fn_link  L768
	fn_link  L828
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 53 ---
L848:	fn_link  L868
	fn_link  L876
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t47 6, 0,4,1,2,3,5
L868:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L876:	fn_elink _prim_itof
# --- block 54 ---
L880:	fn_link  L848
	fn_link  L892
	fn_combi_t3 3, 0,1,2,0,0,0
L892:	fn_combi_t41 6, 5,1,0,3,2,3
# --- block 55 ---
L896:	fn_link  L880
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 56 ---
L904:	fn_link  L836
	fn_link  L896
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 57 ---
L916:	fn_link  L936
	fn_link  L944
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t47 6, 0,4,1,2,3,5
L936:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L944:	fn_elink _prim_itof
# --- block 58 ---
L948:	fn_link  L916
	fn_link  L960
	fn_combi_t3 3, 0,1,2,0,0,0
L960:	fn_combi_t41 6, 5,1,0,3,2,3
# --- block 59 ---
L964:	fn_link  L904
	fn_link  L948
	fn_link  L980
	fn_combi_t5 4, 0,1,3,2,0,0
L980:	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 60 ---
L984:	fn_link  L1004
	fn_link  L1012
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t47 6, 0,4,1,2,3,5
L1004:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1012:	fn_elink _prim_itof
# --- block 61 ---
L1016:	fn_link  L984
	fn_link  L1028
	fn_combi_t3 3, 0,1,2,0,0,0
L1028:	fn_combi_t41 6, 5,1,0,3,2,3
# --- block 62 ---
L1032:	fn_link  L964
	fn_link  L1016
	fn_link  L1048
	fn_combi_t15 4, 0,1,3,2,3,0
L1048:	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 63 ---
L1052:	fn_link  L1072
	fn_link  L1080
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t47 6, 0,4,1,2,3,5
L1072:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1080:	fn_elink _prim_itof
# --- block 64 ---
L1084:	fn_link  L1052
	fn_link  L1096
	fn_combi_t3 3, 0,1,2,0,0,0
L1096:	fn_combi_t41 6, 5,1,0,3,2,3
# --- block 65 ---
L1100:	fn_link  L1032
	fn_link  L1084
	fn_link  L1116
	fn_combi_t15 4, 0,1,3,2,3,0
L1116:	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 66 ---
L1120:	fn_link  NanoPrelude.$2b.
	fn_combi_t35 7, 6,2,0,1,3,4
# --- block 67 ---
L1128:	fn_link  NanoPrelude.$2a.
	fn_combi_t3 3, 0,2,1,0,0,0
# --- block 68 ---
L1136:	fn_link  L1144
	fn_combi_t38 5, 0,1,4,2,3,4
L1144:	fn_combi_t48 6, 5,0,1,3,2,3
# --- block 69 ---
L1148:	fn_link  L1128
	fn_link  L1136
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 70 ---
L1160:	fn_link  L1120
	fn_link  L1148
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 71 ---
L1172:	fn_link  L1160
	fn_combi_t42 5, 0,1,4,2,3,4
# --- block 72 ---
L1180:	fn_link  L1100
	fn_link  L1172
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 73 ---
L1192:	fn_link  Integrate.sumD
	fn_link  NanoPrelude.$2a.
	fn_combi_t49 5, 0,3,1,2,4,3
# --- block 74 ---
L1204:	fn_link  L1192
	fn_combi_t26 6, 0,1,2,5,3,4
# --- block 75 ---
L1212:	fn_link  L1180
	fn_link  L1204
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 76 ---
L1224:	fn_link  L1212
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 77 ---
NanoPrelude.$2f.:	fn_link  L1244
	fn_link  L1248
	fn_combi_t8 4, 0,3,2,1,0,0
L1244:	fn_elink _prim_fdiv
L1248:	fn_y
# --- block 78 ---
Integrate.ints:	fn_link  L1264
	fn_link  L1312
	fn_y
L1264:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 79 ---
L1272:	fn_link  L1284
	fn_link  L1308
	fn_combi_t8 4, 2,0,3,1,0,0
L1284:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1308:	fn_y
# --- block 80 ---
L1312:	fn_link  L1272
	fn_link  L1328
	fn_link  L1332
	fn_combi_t44 5, 0,1,4,2,3,4
L1328:	fn_elink _prim_itof
L1332:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 81 ---
NanoPrelude.tail:	fn_link  L1348
	fn_link  L1352
	fn_combi_t2 3, 2,0,1,0,0,0
L1348:	fn_combi_t0 2, 1,0,0,0,0,0
L1352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 82 ---
Integrate.itotals:	fn_link  L1376
	fn_link  L1392
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 83 ---
L1368:	fn_link  Integrate.is
	fn_elink NanoPrelude.tail
# --- block 84 ---
L1376:	fn_link  Integrate.itotals
	fn_link  L1368
	fn_link  NanoPrelude.$2b.
	fn_elink Integrate.zipWD
# --- block 85 ---
L1392:	fn_link  Integrate.is
	fn_elink NanoPrelude.head
# --- block 86 ---
Integrate.is:	fn_link  Integrate.ints
	fn_link  L1428
	fn_elink NanoPrelude.map
# --- block 87 ---
L1412:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 88 ---
L1420:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 89 ---
L1428:	fn_link  L1412
	fn_link  L1420
	fn_combi_t3 3, 0,1,2,0,0,0

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
