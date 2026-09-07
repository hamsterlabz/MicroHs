# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/ListPure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3c$3d
	.globl	GExtra.$3e$3d
	.globl	GExtra.drop
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	GExtra.zipWith
	.globl	ListPure.bench
	.globl	ListPure.draws
	.globl	ListPure.listZipSumWith
	.globl	ListPure.main
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  ListPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
ListPure.main:	fn_link  L36
	fn_elink ListPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
ListPure.bench:	fn_link  L408
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
L64:	fn_link  L108
	fn_link  L112
	fn_combi_t20 5, 0,1,4,2,3,0
L76:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_box
	.word 0x5ee9d4b2	# raw word 1592382642
	fn_box_body
L108:	fn_combi_t0 1, 0,0,0,0,0,0
L112:	fn_y
# --- block 5 ---
L116:	fn_link  L136
	fn_link  L56
	fn_link  L140
	fn_link  ListPure.draws
	fn_combi_t11 5, 0,1,2,4,3,0
L136:	fn_combi_t0 2, 0,0,0,0,0,0
L140:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
# --- block 6 ---
L148:	fn_link  L168
	fn_link  L192
	fn_link  L200
	fn_link  L204
	fn_combi_t20 5, 0,1,4,2,3,0
L168:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L192:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L200:	fn_combi_t0 1, 0,0,0,0,0,0
L204:	fn_y
# --- block 7 ---
L208:	fn_link  L228
	fn_link  L148
	fn_link  L232
	fn_link  ListPure.draws
	fn_combi_t11 5, 0,1,2,4,3,0
L228:	fn_combi_t0 2, 0,0,0,0,0,0
L232:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
# --- block 8 ---
L240:	fn_link  L208
	fn_link  L264
	fn_link  GExtra.drop
	fn_link  Common.mul3plus1
	fn_link  NanoPrelude.map
	fn_combi_t48 6, 0,1,2,3,4,5
L264:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 9 ---
L272:	fn_link  GExtra.xor
	fn_link  ListPure.listZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 10 ---
L284:	fn_link  L304
	fn_link  Common.addW
	fn_link  NanoPrelude.foldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L304:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L312:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 12 ---
L320:	fn_link  L344
	fn_link  GExtra.xor
	fn_link  NanoPrelude.foldr
	fn_link  L284
	fn_link  L312
	fn_combi_t44 6, 0,1,5,2,3,4
L344:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 13 ---
L352:	fn_link  Common.addW
	fn_link  ListPure.listZipSumWith
	fn_link  L320
	fn_link  L372
	fn_combi_t10 5, 0,1,4,2,3,0
L372:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 14 ---
L376:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 15 ---
L384:	fn_link  L352
	fn_link  L376
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 16 ---
L396:	fn_link  L272
	fn_link  L384
	fn_combi_t28 5, 0,4,3,1,3,2
# --- block 17 ---
L408:	fn_link  L116
	fn_link  L240
	fn_link  L396
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 18 ---
Common.benchFold:	fn_link  L444
	fn_link  L452
	fn_link  L548
	fn_link  L460
	fn_combi_t26 6, 0,1,4,5,2,3
L444:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L452:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L460:	fn_y
# --- block 19 ---
L464:	fn_link  L476
	fn_link  L500
	fn_combi_t41 6, 2,0,4,1,3,5
L476:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L500:	fn_y
# --- block 20 ---
L504:	fn_link  L464
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 21 ---
L512:	fn_link  L524
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L524:	fn_elink _error0
# --- block 22 ---
L528:	fn_link  L504
	fn_link  L512
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 23 ---
L540:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 24 ---
L548:	fn_link  L528
	fn_link  L540
	fn_link  L564
	fn_combi_t5 4, 0,1,3,2,0,0
L564:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 25 ---
GExtra.$3e$3d:	fn_link  L576
	fn_combi_t3 3, 2,1,0,0,0,0
L576:	fn_elink _prim_geu
# --- block 26 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 27 ---
Common.hashMix:	fn_link  L600
	fn_link  L708
	fn_link  L736
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 28 ---
L600:	fn_link  L620
	fn_link  GExtra.xor
	fn_link  L644
	fn_link  L652
	fn_combi_t60 6, 0,1,2,4,5,3
L620:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L644:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L652:	fn_y
# --- block 29 ---
L656:	fn_link  L676
	fn_link  L700
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L676:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L700:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 30 ---
L708:	fn_link  L656
	fn_link  L724
	fn_link  L732
	fn_combi_t8 4, 0,1,2,3,0,0
L724:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L732:	fn_y
# --- block 31 ---
L736:	fn_link  L752
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L752:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 32 ---
GExtra.xor:	fn_link  L772
	fn_link  L796
	fn_combi_t8 4, 0,3,2,1,0,0
L772:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L796:	fn_y
# --- block 33 ---
GExtra.shiftR:	fn_link  L812
	fn_link  L836
	fn_combi_t8 4, 0,3,2,1,0,0
L812:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L836:	fn_y
# --- block 34 ---
NanoPrelude.foldl:	fn_link  L856
	fn_link  L852
	fn_combi_t3 3, 0,1,2,0,0,0
L852:	fn_y
# --- block 35 ---
L856:	fn_link  L864
	fn_combi_t46 5, 4,3,0,1,2,3
L864:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 36 ---
Common.addW:	fn_link  L880
	fn_link  L904
	fn_combi_t8 4, 0,3,2,1,0,0
L880:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L904:	fn_y
# --- block 37 ---
NanoPrelude.foldr:	fn_link  L924
	fn_link  L920
	fn_combi_t7 4, 0,1,2,3,0,0
L920:	fn_y
# --- block 38 ---
L924:	fn_link  L932
	fn_combi_t16 5, 4,2,0,1,3,0
L932:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 39 ---
ListPure.listZipSumWith:	fn_link  GExtra.zipWith
	fn_link  NanoPrelude.sum
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 40 ---
NanoPrelude.sum:	fn_link  L960
	fn_link  L968
	fn_elink NanoPrelude.foldr
L960:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 41 ---
L968:	fn_link  L980
	fn_link  L1004
	fn_combi_t8 4, 0,3,2,1,0,0
L980:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1004:	fn_y
# --- block 42 ---
GExtra.zipWith:	fn_link  L1060
	fn_link  L1020
	fn_combi_t3 3, 0,1,2,0,0,0
L1020:	fn_y
# --- block 43 ---
L1024:	fn_link  L1032
	fn_combi_t40 6, 0,1,2,4,3,5
L1032:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 44 ---
L1036:	fn_link  L1044
	fn_combi_t48 6, 3,0,1,4,2,5
L1044:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L1048:	fn_link  L1024
	fn_link  L1036
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 46 ---
L1060:	fn_link  L1048
	fn_link  L1072
	fn_combi_t46 6, 4,0,1,2,3,5
L1072:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
NanoPrelude.map:	fn_link  L1104
	fn_link  L1088
	fn_combi_t3 3, 0,1,2,0,0,0
L1088:	fn_y
# --- block 48 ---
L1092:	fn_link  L1100
	fn_combi_t15 5, 0,1,3,2,4,0
L1100:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 49 ---
L1104:	fn_link  L1092
	fn_link  L1116
	fn_combi_t16 5, 4,0,1,2,3,0
L1116:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 50 ---
Common.mul3plus1:	fn_link  L1144
	fn_link  L1168
	fn_link  L1192
	fn_link  L1200
	fn_link  L1204
	fn_combi_t55 6, 0,1,2,5,3,4
L1144:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1168:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1192:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1200:	fn_y
L1204:	fn_y
# --- block 51 ---
GExtra.drop:	fn_link  L1220
	fn_link  L1264
	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 52 ---
L1220:	fn_link  L1236
	fn_link  L1260
	fn_link  GExtra.drop
	fn_combi_t8 5, 0,1,3,2,0,0
L1236:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1260:	fn_y
# --- block 53 ---
L1264:	fn_link  L1280
	fn_link  L1284
	fn_link  GExtra.$3c$3d
	fn_combi_t42 6, 0,4,1,5,2,3
L1280:	fn_combi_t0 2, 0,0,0,0,0,0
L1284:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 54 ---
GExtra.$3c$3d:	fn_link  L1300
	fn_combi_t3 3, 2,1,0,0,0,0
L1300:	fn_elink _prim_leu
# --- block 55 ---
ListPure.draws:	fn_link  L1320
	fn_link  L1440
	fn_link  L1324
	fn_combi_t9 5, 0,1,3,4,2,0
L1320:	fn_combi_t0 2, 0,0,0,0,0,0
L1324:	fn_y
# --- block 56 ---
L1328:	fn_link  L1340
	fn_link  L1364
	fn_combi_t8 4, 2,0,3,1,0,0
L1340:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1364:	fn_y
# --- block 57 ---
L1368:	fn_link  L1384
	fn_link  L1328
	fn_link  L1388
	fn_combi_t5 4, 0,1,3,2,0,0
L1384:	fn_combi_t2 4, 3,0,1,0,0,0
L1388:	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 58 ---
L1392:	fn_link  Common.lcgNext
	fn_link  L1368
	fn_combi_t14 5, 0,2,3,1,4,0
# --- block 59 ---
L1404:	fn_link  L1416
	fn_link  L1420
	fn_combi_t44 6, 3,0,1,2,4,5
L1416:	fn_elink _prim_eq
L1420:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 60 ---
L1428:	fn_link  L1392
	fn_link  L1404
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 61 ---
L1440:	fn_link  L1456
	fn_link  L1428
	fn_link  L1460
	fn_combi_t12 5, 0,1,3,4,2,0
L1456:	fn_combi_t2 3, 2,1,0,0,0,0
L1460:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 62 ---
Common.lcgNext:	fn_link  L1480
	fn_link  L1476
	fn_combi_t3 3, 0,1,2,0,0,0
L1476:	fn_y
# --- block 63 ---
L1480:	fn_link  L1504
	fn_link  L1528
	fn_link  L1552
	fn_link  L1560
	fn_link  L1564
	fn_combi_t55 6, 0,1,2,5,3,4
L1504:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1528:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1552:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1560:	fn_y
L1564:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
	fn_box_body

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
