# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/RoseTreePure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3e$3d
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	GExtra.zipWith
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	RoseTreePure.bench
	.globl	RoseTreePure.main
	.globl	RoseTreePure.roseDeleteFirstChild
	.globl	RoseTreePure.roseFoldl
	.globl	RoseTreePure.roseFoldr
	.globl	RoseTreePure.roseInsertChild
	.globl	RoseTreePure.roseMap
	.globl	RoseTreePure.roseZipSumWith
	.globl	RoseTreePure.vals
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  RoseTreePure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
RoseTreePure.main:	fn_link  L36
	fn_elink RoseTreePure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
RoseTreePure.bench:	fn_link  L476
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
	fn_link  L108
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
L116:	fn_link  L140
	fn_link  Common.lcgNext
	fn_link  L144
	fn_link  RoseTreePure.roseInsertChild
	fn_link  NanoPrelude.foldl
	fn_combi_t47 6, 0,1,2,3,5,4
L140:	fn_combi_t0 2, 0,0,0,0,0,0
L144:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 6 ---
L148:	fn_link  L164
	fn_link  RoseTreePure.vals
	fn_link  L116
	fn_combi_t16 4, 0,3,1,2,3,0
L164:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 7 ---
L172:	fn_link  L192
	fn_link  L216
	fn_link  L224
	fn_link  L228
	fn_combi_t20 5, 0,1,4,2,3,0
L192:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L216:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L224:	fn_combi_t0 1, 0,0,0,0,0,0
L228:	fn_y
# --- block 8 ---
L232:	fn_link  L256
	fn_link  Common.lcgNext
	fn_link  L260
	fn_link  RoseTreePure.roseInsertChild
	fn_link  NanoPrelude.foldl
	fn_combi_t47 6, 0,1,2,3,5,4
L256:	fn_combi_t0 2, 0,0,0,0,0,0
L260:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 9 ---
L264:	fn_link  L284
	fn_link  RoseTreePure.vals
	fn_link  L232
	fn_link  RoseTreePure.roseDeleteFirstChild
	fn_combi_t58 5, 0,1,4,2,3,4
L284:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 10 ---
L292:	fn_link  L264
	fn_link  RoseTreePure.roseDeleteFirstChild
	fn_link  Common.mul3plus1
	fn_link  RoseTreePure.roseMap
	fn_combi_t17 5, 0,1,2,3,4,0
# --- block 11 ---
L312:	fn_link  GExtra.xor
	fn_link  RoseTreePure.roseZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 12 ---
L324:	fn_link  L344
	fn_link  Common.addW
	fn_link  RoseTreePure.roseFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L344:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 13 ---
L352:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 14 ---
L360:	fn_link  L384
	fn_link  GExtra.xor
	fn_link  RoseTreePure.roseFoldr
	fn_link  L324
	fn_link  L352
	fn_combi_t44 6, 0,1,5,2,3,4
L384:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 15 ---
L392:	fn_link  Common.addW
	fn_link  RoseTreePure.roseZipSumWith
	fn_link  L360
	fn_link  L412
	fn_combi_t10 5, 0,1,4,2,3,0
L412:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 16 ---
L416:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 17 ---
L424:	fn_link  L392
	fn_link  L416
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 18 ---
L436:	fn_link  L292
	fn_link  L312
	fn_link  L424
	fn_link  L456
	fn_combi_t24 6, 0,1,5,2,3,4
L456:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 19 ---
L460:	fn_link  L148
	fn_link  L172
	fn_link  L436
	fn_combi_t38 6, 0,1,3,5,2,4
# --- block 20 ---
L476:	fn_link  L56
	fn_link  L460
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 21 ---
Common.benchFold:	fn_link  L508
	fn_link  L516
	fn_link  L612
	fn_link  L524
	fn_combi_t26 6, 0,1,4,5,2,3
L508:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L516:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L524:	fn_y
# --- block 22 ---
L528:	fn_link  L540
	fn_link  L564
	fn_combi_t41 6, 2,0,4,1,3,5
L540:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L564:	fn_y
# --- block 23 ---
L568:	fn_link  L528
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 24 ---
L576:	fn_link  L588
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L588:	fn_elink _error0
# --- block 25 ---
L592:	fn_link  L568
	fn_link  L576
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 26 ---
L604:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 27 ---
L612:	fn_link  L592
	fn_link  L604
	fn_link  L628
	fn_combi_t5 4, 0,1,3,2,0,0
L628:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 28 ---
GExtra.$3e$3d:	fn_link  L640
	fn_combi_t3 3, 2,1,0,0,0,0
L640:	fn_elink _prim_geu
# --- block 29 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 30 ---
Common.hashMix:	fn_link  L664
	fn_link  L772
	fn_link  L800
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 31 ---
L664:	fn_link  L684
	fn_link  GExtra.xor
	fn_link  L708
	fn_link  L716
	fn_combi_t60 6, 0,1,2,4,5,3
L684:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L708:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L716:	fn_y
# --- block 32 ---
L720:	fn_link  L740
	fn_link  L764
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L740:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L764:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 33 ---
L772:	fn_link  L720
	fn_link  L788
	fn_link  L796
	fn_combi_t8 4, 0,1,2,3,0,0
L788:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L796:	fn_y
# --- block 34 ---
L800:	fn_link  L816
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L816:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 35 ---
GExtra.xor:	fn_link  L836
	fn_link  L860
	fn_combi_t8 4, 0,3,2,1,0,0
L836:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L860:	fn_y
# --- block 36 ---
GExtra.shiftR:	fn_link  L876
	fn_link  L900
	fn_combi_t8 4, 0,3,2,1,0,0
L876:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L900:	fn_y
# --- block 37 ---
RoseTreePure.roseFoldl:	fn_link  L928
	fn_link  L916
	fn_combi_t3 3, 0,1,2,0,0,0
L916:	fn_y
# --- block 38 ---
L920:	fn_link  NanoPrelude.foldl
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 39 ---
L928:	fn_link  L920
	fn_combi_t18 5, 4,0,1,2,3,0
# --- block 40 ---
NanoPrelude.foldl:	fn_link  L952
	fn_link  L948
	fn_combi_t3 3, 0,1,2,0,0,0
L948:	fn_y
# --- block 41 ---
L952:	fn_link  L960
	fn_combi_t46 5, 4,3,0,1,2,3
L960:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 42 ---
Common.addW:	fn_link  L976
	fn_link  L1000
	fn_combi_t8 4, 0,3,2,1,0,0
L976:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1000:	fn_y
# --- block 43 ---
RoseTreePure.roseFoldr:	fn_link  L1044
	fn_link  L1016
	fn_combi_t3 3, 0,1,2,0,0,0
L1016:	fn_y
# --- block 44 ---
L1020:	fn_link  L1032
	fn_link  NanoPrelude.foldr
	fn_combi_t3 3, 0,1,2,0,0,0
L1032:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 45 ---
L1036:	fn_link  L1020
	fn_combi_t46 6, 1,4,0,2,3,5
# --- block 46 ---
L1044:	fn_link  L1036
	fn_combi_t18 5, 4,0,1,2,3,0
# --- block 47 ---
NanoPrelude.foldr:	fn_link  L1068
	fn_link  L1064
	fn_combi_t7 4, 0,1,2,3,0,0
L1064:	fn_y
# --- block 48 ---
L1068:	fn_link  L1076
	fn_combi_t16 5, 4,2,0,1,3,0
L1076:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 49 ---
RoseTreePure.roseZipSumWith:	fn_link  L1172
	fn_link  L1092
	fn_combi_t3 3, 0,1,2,0,0,0
L1092:	fn_y
# --- block 50 ---
L1096:	fn_link  L1104
	fn_combi_t4 4, 1,2,3,0,0,0
L1104:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 51 ---
L1128:	fn_link  GExtra.zipWith
	fn_link  NanoPrelude.sum
	fn_combi_t32 6, 0,1,2,3,5,4
# --- block 52 ---
L1140:	fn_link  L1148
	fn_combi_t53 6, 0,1,3,2,4,5
L1148:	fn_y
# --- block 53 ---
L1152:	fn_link  L1128
	fn_link  L1140
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L1164:	fn_link  L1152
	fn_combi_t53 6, 3,0,2,1,4,5
# --- block 55 ---
L1172:	fn_link  L1096
	fn_link  L1164
	fn_combi_t52 6, 4,0,1,2,3,5
# --- block 56 ---
NanoPrelude.sum:	fn_link  L1196
	fn_link  L1204
	fn_elink NanoPrelude.foldr
L1196:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 57 ---
L1204:	fn_link  L1216
	fn_link  L1240
	fn_combi_t8 4, 0,3,2,1,0,0
L1216:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1240:	fn_y
# --- block 58 ---
GExtra.zipWith:	fn_link  L1296
	fn_link  L1256
	fn_combi_t3 3, 0,1,2,0,0,0
L1256:	fn_y
# --- block 59 ---
L1260:	fn_link  L1268
	fn_combi_t40 6, 0,1,2,4,3,5
L1268:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 60 ---
L1272:	fn_link  L1280
	fn_combi_t48 6, 3,0,1,4,2,5
L1280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 61 ---
L1284:	fn_link  L1260
	fn_link  L1272
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 62 ---
L1296:	fn_link  L1284
	fn_link  L1308
	fn_combi_t46 6, 4,0,1,2,3,5
L1308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 63 ---
RoseTreePure.roseMap:	fn_link  L1344
	fn_link  L1324
	fn_combi_t3 3, 0,1,2,0,0,0
L1324:	fn_y
# --- block 64 ---
L1328:	fn_link  NanoPrelude.map
	fn_link  L1340
	fn_combi_t44 6, 0,2,4,1,3,5
L1340:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 65 ---
L1344:	fn_link  L1328
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 66 ---
NanoPrelude.map:	fn_link  L1380
	fn_link  L1364
	fn_combi_t3 3, 0,1,2,0,0,0
L1364:	fn_y
# --- block 67 ---
L1368:	fn_link  L1376
	fn_combi_t15 5, 0,1,3,2,4,0
L1376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 68 ---
L1380:	fn_link  L1368
	fn_link  L1392
	fn_combi_t16 5, 4,0,1,2,3,0
L1392:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 69 ---
Common.mul3plus1:	fn_link  L1420
	fn_link  L1444
	fn_link  L1468
	fn_link  L1476
	fn_link  L1480
	fn_combi_t55 6, 0,1,2,5,3,4
L1420:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1444:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1468:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1476:	fn_y
L1480:	fn_y
# --- block 70 ---
RoseTreePure.roseDeleteFirstChild:	fn_link  L1504
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 71 ---
L1492:	fn_link  L1500
	fn_combi_t1 3, 0,1,0,0,0,0
L1500:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 72 ---
L1504:	fn_link  L1492
	fn_link  L1520
	fn_link  L1524
	fn_combi_t40 5, 4,0,3,1,2,3
L1520:	fn_combi_t0 2, 0,0,0,0,0,0
L1524:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 73 ---
RoseTreePure.roseInsertChild:	fn_link  L1564
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 74 ---
L1536:	fn_link  L1552
	fn_link  L1556
	fn_link  L1560
	fn_combi_t7 4, 0,1,3,2,0,0
L1552:	fn_combi_t0 2, 0,0,0,0,0,0
L1556:	fn_combi_t2 3, 2,0,1,0,0,0
L1560:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 75 ---
L1564:	fn_link  L1536
	fn_link  L1576
	fn_combi_t16 5, 0,3,1,2,4,0
L1576:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 76 ---
Common.lcgNext:	fn_link  L1596
	fn_link  L1592
	fn_combi_t3 3, 0,1,2,0,0,0
L1592:	fn_y
# --- block 77 ---
L1596:	fn_link  L1620
	fn_link  L1644
	fn_link  L1668
	fn_link  L1676
	fn_link  L1680
	fn_combi_t55 6, 0,1,2,5,3,4
L1620:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1644:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1668:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1676:	fn_y
L1680:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
	fn_box_body
# --- block 78 ---
RoseTreePure.vals:	fn_link  L1700
	fn_link  L1788
	fn_combi_t4 4, 0,2,3,1,0,0
L1700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 79 ---
L1704:	fn_link  L1720
	fn_link  L1744
	fn_link  RoseTreePure.vals
	fn_combi_t8 4, 0,1,3,2,0,0
L1720:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1744:	fn_y
# --- block 80 ---
L1748:	fn_link  L1704
	fn_link  L1760
	fn_combi_t16 4, 0,3,1,2,3,0
L1760:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 81 ---
L1764:	fn_link  L1776
	fn_link  L1780
	fn_combi_t45 6, 4,0,1,2,3,5
L1776:	fn_elink _prim_eq
L1780:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 82 ---
L1788:	fn_link  Common.lcgNext
	fn_link  L1748
	fn_link  L1764
	fn_combi_t10 4, 0,1,3,2,3,0

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
