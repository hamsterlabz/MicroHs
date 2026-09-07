# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/MergeSortPure  (entry @0)
	.text
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3c$3d
	.globl	GExtra.$3e$3d
	.globl	GExtra.drop
	.globl	GExtra.last
	.globl	GExtra.shiftR
	.globl	GExtra.splitAt
	.globl	GExtra.take
	.globl	GExtra.xor
	.globl	MergeSortPure.bench
	.globl	MergeSortPure.drawLcg
	.globl	MergeSortPure.main
	.globl	MergeSortPure.merge
	.globl	MergeSortPure.msort
	.globl	MergeSortPure.splitHalf
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.head
	.globl	NanoPrelude.length
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  MergeSortPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
MergeSortPure.main:	fn_link  L36
	fn_elink MergeSortPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
MergeSortPure.bench:	fn_link  L320
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
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L108:	fn_combi_t0 1, 0,0,0,0,0,0
L112:	fn_y
# --- block 5 ---
L116:	fn_link  L136
	fn_link  L160
	fn_link  L184
	fn_link  L192
	fn_combi_t55 6, 5,0,1,4,2,3
L136:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L160:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L184:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L192:	fn_y
# --- block 6 ---
L196:	fn_link  L116
	fn_link  L208
	fn_combi_t7 4, 0,1,2,3,0,0
L208:	fn_y
# --- block 7 ---
L212:	fn_link  NanoPrelude.head
	fn_link  Common.hashMix
	fn_combi_t20 4, 0,0,2,1,3,0
# --- block 8 ---
L224:	fn_link  GExtra.last
	fn_link  L212
	fn_link  Common.hashMix
	fn_combi_t56 5, 0,1,3,4,2,4
# --- block 9 ---
L240:	fn_link  NanoPrelude.sum
	fn_link  L224
	fn_link  Common.hashMix
	fn_combi_t56 5, 0,1,3,4,2,4
# --- block 10 ---
L256:	fn_link  L280
	fn_link  L196
	fn_link  NanoPrelude.foldl
	fn_link  L240
	fn_link  L288
	fn_combi_t24 6, 0,1,5,2,3,4
L280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L288:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 11 ---
L292:	fn_link  L312
	fn_link  MergeSortPure.drawLcg
	fn_link  MergeSortPure.msort
	fn_link  L256
	fn_combi_t49 6, 0,5,1,2,3,4
L312:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
# --- block 12 ---
L320:	fn_link  L56
	fn_link  L292
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 13 ---
Common.benchFold:	fn_link  L352
	fn_link  L360
	fn_link  L456
	fn_link  L368
	fn_combi_t26 6, 0,1,4,5,2,3
L352:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L368:	fn_y
# --- block 14 ---
L372:	fn_link  L384
	fn_link  L408
	fn_combi_t41 6, 2,0,4,1,3,5
L384:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L408:	fn_y
# --- block 15 ---
L412:	fn_link  L372
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 16 ---
L420:	fn_link  L432
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L432:	fn_elink _error0
# --- block 17 ---
L436:	fn_link  L412
	fn_link  L420
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 18 ---
L448:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 19 ---
L456:	fn_link  L436
	fn_link  L448
	fn_link  L472
	fn_combi_t5 4, 0,1,3,2,0,0
L472:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 20 ---
GExtra.$3e$3d:	fn_link  L484
	fn_combi_t3 3, 2,1,0,0,0,0
L484:	fn_elink _prim_geu
# --- block 21 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 22 ---
Common.hashMix:	fn_link  L508
	fn_link  L616
	fn_link  L644
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 23 ---
L508:	fn_link  L528
	fn_link  GExtra.xor
	fn_link  L552
	fn_link  L560
	fn_combi_t60 6, 0,1,2,4,5,3
L528:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L552:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L560:	fn_y
# --- block 24 ---
L564:	fn_link  L584
	fn_link  L608
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L584:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L608:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 25 ---
L616:	fn_link  L564
	fn_link  L632
	fn_link  L640
	fn_combi_t8 4, 0,1,2,3,0,0
L632:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L640:	fn_y
# --- block 26 ---
L644:	fn_link  L660
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L660:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 27 ---
GExtra.xor:	fn_link  L680
	fn_link  L704
	fn_combi_t8 4, 0,3,2,1,0,0
L680:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L704:	fn_y
# --- block 28 ---
GExtra.shiftR:	fn_link  L720
	fn_link  L744
	fn_combi_t8 4, 0,3,2,1,0,0
L720:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L744:	fn_y
# --- block 29 ---
NanoPrelude.head:	fn_link  L760
	fn_link  L764
	fn_combi_t2 3, 2,0,1,0,0,0
L760:	fn_combi_t0 2, 0,0,0,0,0,0
L764:	fn_elink _error0
# --- block 30 ---
GExtra.last:	fn_link  L792
	fn_link  L780
	fn_combi_t2 3, 2,0,1,0,0,0
L780:	fn_elink _error0
# --- block 31 ---
L784:	fn_link  GExtra.last
	fn_combi_t1 4, 0,1,0,0,0,0
# --- block 32 ---
L792:	fn_link  L784
	fn_combi_t6 3, 2,1,0,2,0,0
# --- block 33 ---
NanoPrelude.sum:	fn_link  L812
	fn_link  L820
	fn_elink NanoPrelude.foldr
L812:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L820:	fn_link  L832
	fn_link  L856
	fn_combi_t8 4, 0,3,2,1,0,0
L832:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L856:	fn_y
# --- block 35 ---
NanoPrelude.foldr:	fn_link  L876
	fn_link  L872
	fn_combi_t7 4, 0,1,2,3,0,0
L872:	fn_y
# --- block 36 ---
L876:	fn_link  L884
	fn_combi_t16 5, 4,2,0,1,3,0
L884:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 37 ---
NanoPrelude.foldl:	fn_link  L904
	fn_link  L900
	fn_combi_t3 3, 0,1,2,0,0,0
L900:	fn_y
# --- block 38 ---
L904:	fn_link  L912
	fn_combi_t46 5, 4,3,0,1,2,3
L912:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 39 ---
MergeSortPure.msort:	fn_link  L984
	fn_link  L928
	fn_combi_t6 3, 2,0,1,2,0,0
L928:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 40 ---
L932:	fn_link  L944
	fn_link  MergeSortPure.msort
	fn_combi_t3 3, 0,2,1,0,0,0
L944:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 41 ---
L948:	fn_link  L932
	fn_link  L968
	fn_link  MergeSortPure.msort
	fn_link  MergeSortPure.merge
	fn_combi_t41 7, 0,1,4,2,3,4
L968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
L972:	fn_link  L980
	fn_combi_t2 4, 3,1,0,0,0,0
L980:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 43 ---
L984:	fn_link  MergeSortPure.splitHalf
	fn_link  L948
	fn_link  L972
	fn_combi_t45 6, 5,0,4,1,2,3
# --- block 44 ---
MergeSortPure.merge:	fn_link  L1148
	fn_combi_t16 3, 1,2,0,1,2,0
# --- block 45 ---
L1008:	fn_link  L1020
	fn_link  MergeSortPure.merge
	fn_combi_t16 5, 0,2,1,3,4,0
L1020:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 46 ---
L1024:	fn_link  L1036
	fn_link  MergeSortPure.merge
	fn_combi_t7 4, 0,1,2,3,0,0
L1036:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 47 ---
L1040:	fn_link  L1056
	fn_link  L1060
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 0,1,2,4,3,5
L1056:	fn_combi_t2 4, 3,0,1,0,0,0
L1060:	fn_elink _error0
# --- block 48 ---
L1064:	fn_link  L1024
	fn_link  L1040
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 49 ---
L1076:	fn_link  GExtra.$3c$3d
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 50 ---
L1084:	fn_link  L1064
	fn_link  L1076
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 51 ---
L1096:	fn_link  L1104
	fn_combi_t26 6, 0,1,4,5,2,3
L1104:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 52 ---
L1108:	fn_link  L1124
	fn_link  L1084
	fn_link  L1096
	fn_combi_t10 4, 0,1,3,2,3,0
L1124:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L1128:	fn_link  L1008
	fn_link  L1108
	fn_link  L1144
	fn_combi_t5 4, 0,1,3,2,0,0
L1144:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 54 ---
L1148:	fn_link  L1128
	fn_combi_t16 5, 2,1,0,3,4,0
# --- block 55 ---
GExtra.$3c$3d:	fn_link  L1164
	fn_combi_t3 3, 2,1,0,0,0,0
L1164:	fn_elink _prim_leu
# --- block 56 ---
MergeSortPure.splitHalf:	fn_link  L1188
	fn_link  NanoPrelude.length
	fn_link  NanoPrelude.quot
	fn_link  GExtra.splitAt
	fn_combi_t33 5, 0,1,2,4,3,4
L1188:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 57 ---
GExtra.splitAt:	fn_link  GExtra.drop
	fn_link  L1208
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 58 ---
L1208:	fn_link  GExtra.take
	fn_combi_t40 5, 4,0,2,3,1,3
# --- block 59 ---
GExtra.take:	fn_link  L1232
	fn_link  L1280
	fn_link  L1296
	fn_combi_t24 5, 0,1,3,3,4,2
L1232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1236:	fn_link  L1252
	fn_link  L1276
	fn_link  GExtra.take
	fn_combi_t8 4, 0,1,3,2,0,0
L1252:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1276:	fn_y
# --- block 61 ---
L1280:	fn_link  L1236
	fn_link  L1292
	fn_combi_t16 5, 0,3,1,2,4,0
L1292:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 62 ---
L1296:	fn_link  L1312
	fn_link  L1316
	fn_link  GExtra.$3c$3d
	fn_combi_t42 6, 0,4,1,5,2,3
L1312:	fn_combi_t0 2, 0,0,0,0,0,0
L1316:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 63 ---
GExtra.drop:	fn_link  L1336
	fn_link  L1380
	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 64 ---
L1336:	fn_link  L1352
	fn_link  L1376
	fn_link  GExtra.drop
	fn_combi_t8 5, 0,1,3,2,0,0
L1352:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1376:	fn_y
# --- block 65 ---
L1380:	fn_link  L1396
	fn_link  L1400
	fn_link  GExtra.$3c$3d
	fn_combi_t42 6, 0,4,1,5,2,3
L1396:	fn_combi_t0 2, 0,0,0,0,0,0
L1400:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 66 ---
NanoPrelude.quot:	fn_link  L1420
	fn_link  L1444
	fn_combi_t8 4, 0,3,2,1,0,0
L1420:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1444:	fn_y
# --- block 67 ---
NanoPrelude.length:	fn_link  L1460
	fn_link  L1508
	fn_y
L1460:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 68 ---
L1468:	fn_link  L1480
	fn_link  L1504
	fn_combi_t8 5, 2,0,3,1,0,0
L1480:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1504:	fn_y
# --- block 69 ---
L1508:	fn_link  L1468
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 70 ---
MergeSortPure.drawLcg:	fn_link  L1528
	fn_link  L1616
	fn_combi_t4 4, 0,2,3,1,0,0
L1528:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 71 ---
L1532:	fn_link  L1548
	fn_link  L1572
	fn_link  MergeSortPure.drawLcg
	fn_combi_t8 4, 0,1,3,2,0,0
L1548:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1572:	fn_y
# --- block 72 ---
L1576:	fn_link  L1532
	fn_link  L1588
	fn_combi_t16 4, 0,3,1,2,3,0
L1588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 73 ---
L1592:	fn_link  L1604
	fn_link  L1608
	fn_combi_t45 6, 4,0,1,2,3,5
L1604:	fn_elink _prim_eq
L1608:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 74 ---
L1616:	fn_link  Common.lcgNext
	fn_link  L1576
	fn_link  L1592
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 75 ---
Common.lcgNext:	fn_link  L1648
	fn_link  L1644
	fn_combi_t3 3, 0,1,2,0,0,0
L1644:	fn_y
# --- block 76 ---
L1648:	fn_link  L1672
	fn_link  L1696
	fn_link  L1720
	fn_link  L1728
	fn_link  L1732
	fn_combi_t55 6, 0,1,2,5,3,4
L1672:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1696:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1720:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1728:	fn_y
L1732:	fn_box
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
