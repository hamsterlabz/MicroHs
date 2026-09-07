# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/QuadTreePure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3c$3d
	.globl	GExtra.$3e$3d
	.globl	GExtra..$26.
	.globl	GExtra.shiftR
	.globl	GExtra.take
	.globl	GExtra.xor
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	Primitives.primPerformIO
	.globl	QuadTreePure.bench
	.globl	QuadTreePure.main
	.globl	QuadTreePure.mkOps
	.globl	QuadTreePure.q4FromQT
	.globl	QuadTreePure.q4Idx
	.globl	QuadTreePure.q4Put
	.globl	QuadTreePure.qtDelete
	.globl	QuadTreePure.qtDeleteAt
	.globl	QuadTreePure.qtFoldl
	.globl	QuadTreePure.qtFoldr
	.globl	QuadTreePure.qtInsert
	.globl	QuadTreePure.qtInsertAt
	.globl	QuadTreePure.qtMap
	.globl	QuadTreePure.qtZipSumWith
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  QuadTreePure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
QuadTreePure.main:	fn_link  L36
	fn_elink QuadTreePure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
QuadTreePure.bench:	fn_link  L568
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
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L108:	fn_combi_t0 1, 0,0,0,0,0,0
L112:	fn_y
# --- block 5 ---
L116:	fn_link  L136
	fn_link  L160
	fn_link  L168
	fn_link  L172
	fn_combi_t20 5, 0,1,4,2,3,0
L136:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L160:	fn_box
	.word 0x5ee9d4b2	# raw word 1592382642
	fn_box_body
L168:	fn_combi_t0 1, 0,0,0,0,0,0
L172:	fn_y
# --- block 6 ---
L176:	fn_link  L116
	fn_link  L192
	fn_link  QuadTreePure.mkOps
	fn_combi_t6 4, 0,1,2,3,0,0
L192:	fn_box
	.word 0x00000018	# raw word 24
	fn_box_body
# --- block 7 ---
L200:	fn_link  QuadTreePure.qtInsert
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 8 ---
L208:	fn_link  L176
	fn_link  L228
	fn_link  L200
	fn_link  NanoPrelude.foldl
	fn_combi_t14 5, 0,1,2,3,4,0
L228:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 9 ---
L232:	fn_link  L252
	fn_link  GExtra.xor
	fn_link  L260
	fn_link  QuadTreePure.mkOps
	fn_combi_t16 5, 0,1,2,4,3,0
L252:	fn_box
	.word 0x0000cafe	# raw word 51966
	fn_box_body
L260:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 10 ---
L268:	fn_link  L276
	fn_combi_t6 5, 0,3,1,2,0,0
L276:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L280:	fn_link  L268
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 12 ---
L288:	fn_link  L280
	fn_link  L300
	fn_combi_t6 4, 3,0,1,2,0,0
L300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 13 ---
L304:	fn_link  L232
	fn_link  L288
	fn_link  L328
	fn_link  L332
	fn_link  GExtra.take
	fn_combi_t48 6, 0,1,2,3,4,5
L328:	fn_y
L332:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 14 ---
L340:	fn_link  QuadTreePure.qtInsert
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 15 ---
L348:	fn_link  L372
	fn_link  QuadTreePure.mkOps
	fn_link  L380
	fn_link  L340
	fn_link  NanoPrelude.foldl
	fn_combi_t42 6, 0,1,2,3,4,5
L372:	fn_box
	.word 0x00000018	# raw word 24
	fn_box_body
L380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
L384:	fn_link  L304
	fn_link  L348
	fn_link  QuadTreePure.qtDelete
	fn_link  NanoPrelude.foldl
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 17 ---
L404:	fn_link  L384
	fn_link  Common.mul3plus1
	fn_link  QuadTreePure.qtMap
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 18 ---
L420:	fn_link  GExtra.xor
	fn_link  QuadTreePure.qtZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 19 ---
L432:	fn_link  L452
	fn_link  Common.addW
	fn_link  QuadTreePure.qtFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L452:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 20 ---
L460:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 21 ---
L468:	fn_link  L492
	fn_link  GExtra.xor
	fn_link  QuadTreePure.qtFoldr
	fn_link  L432
	fn_link  L460
	fn_combi_t44 6, 0,1,5,2,3,4
L492:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 22 ---
L500:	fn_link  Common.addW
	fn_link  QuadTreePure.qtZipSumWith
	fn_link  L468
	fn_link  L520
	fn_combi_t10 5, 0,1,4,2,3,0
L520:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 23 ---
L524:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 24 ---
L532:	fn_link  L500
	fn_link  L524
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 25 ---
L544:	fn_link  L404
	fn_link  L420
	fn_link  L532
	fn_link  L564
	fn_combi_t24 6, 0,1,5,2,3,4
L564:	fn_combi_t39 5, 0,3,1,3,2,4
# --- block 26 ---
L568:	fn_link  L56
	fn_link  L208
	fn_link  L544
	fn_combi_t38 5, 0,1,3,4,2,3
# --- block 27 ---
Common.benchFold:	fn_link  L604
	fn_link  L612
	fn_link  L708
	fn_link  L620
	fn_combi_t26 6, 0,1,4,5,2,3
L604:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L612:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L620:	fn_y
# --- block 28 ---
L624:	fn_link  L636
	fn_link  L660
	fn_combi_t41 6, 2,0,4,1,3,5
L636:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L660:	fn_y
# --- block 29 ---
L664:	fn_link  L624
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 30 ---
L672:	fn_link  L684
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L684:	fn_elink _error0
# --- block 31 ---
L688:	fn_link  L664
	fn_link  L672
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 32 ---
L700:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 33 ---
L708:	fn_link  L688
	fn_link  L700
	fn_link  L724
	fn_combi_t5 4, 0,1,3,2,0,0
L724:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 34 ---
GExtra.$3e$3d:	fn_link  L736
	fn_combi_t3 3, 2,1,0,0,0,0
L736:	fn_elink _prim_geu
# --- block 35 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 36 ---
Common.hashMix:	fn_link  L760
	fn_link  L868
	fn_link  L896
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 37 ---
L760:	fn_link  L780
	fn_link  GExtra.xor
	fn_link  L804
	fn_link  L812
	fn_combi_t60 6, 0,1,2,4,5,3
L780:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L804:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L812:	fn_y
# --- block 38 ---
L816:	fn_link  L836
	fn_link  L860
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L836:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L860:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 39 ---
L868:	fn_link  L816
	fn_link  L884
	fn_link  L892
	fn_combi_t8 4, 0,1,2,3,0,0
L884:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L892:	fn_y
# --- block 40 ---
L896:	fn_link  L912
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L912:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 41 ---
GExtra.xor:	fn_link  L932
	fn_link  L956
	fn_combi_t8 4, 0,3,2,1,0,0
L932:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L956:	fn_y
# --- block 42 ---
GExtra.shiftR:	fn_link  L972
	fn_link  L996
	fn_combi_t8 4, 0,3,2,1,0,0
L972:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L996:	fn_y
# --- block 43 ---
QuadTreePure.qtFoldl:	fn_link  L1088
	fn_link  L1012
	fn_combi_t3 3, 0,1,2,0,0,0
L1012:	fn_y
# --- block 44 ---
L1016:	fn_link  L1024
	fn_combi_t2 4, 3,1,0,0,0,0
L1024:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L1028:	fn_link  L1016
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 46 ---
L1036:	fn_link  L1028
	fn_combi_t16 6, 5,1,0,2,3,0
# --- block 47 ---
L1044:	fn_link  NanoPrelude.foldl
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 48 ---
L1052:	fn_link  L1060
	fn_combi_t40 6, 0,1,4,5,2,3
L1060:	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 49 ---
L1064:	fn_link  L1036
	fn_link  L1084
	fn_link  L1044
	fn_link  L1052
	fn_combi_t26 6, 0,1,4,5,2,3
L1084:	fn_combi_t46 7, 6,1,0,2,3,4
# --- block 50 ---
L1088:	fn_link  L1064
	fn_combi_t46 5, 4,3,0,1,2,3
# --- block 51 ---
NanoPrelude.foldl:	fn_link  L1112
	fn_link  L1108
	fn_combi_t3 3, 0,1,2,0,0,0
L1108:	fn_y
# --- block 52 ---
L1112:	fn_link  L1120
	fn_combi_t46 5, 4,3,0,1,2,3
L1120:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 53 ---
Common.addW:	fn_link  L1136
	fn_link  L1160
	fn_combi_t8 4, 0,3,2,1,0,0
L1136:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1160:	fn_y
# --- block 54 ---
QuadTreePure.qtFoldr:	fn_link  L1276
	fn_link  L1176
	fn_combi_t3 3, 0,1,2,0,0,0
L1176:	fn_y
# --- block 55 ---
L1180:	fn_link  L1188
	fn_combi_t2 4, 3,1,0,0,0,0
L1188:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 56 ---
L1192:	fn_link  L1180
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 57 ---
L1200:	fn_link  L1192
	fn_combi_t16 6, 5,1,0,2,3,0
# --- block 58 ---
L1208:	fn_link  L1220
	fn_link  NanoPrelude.foldr
	fn_combi_t38 6, 0,1,2,3,4,5
L1220:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 59 ---
L1224:	fn_link  L1208
	fn_link  L1236
	fn_combi_t16 5, 0,2,1,3,4,0
L1236:	fn_combi_t47 6, 0,2,1,3,4,5
# --- block 60 ---
L1240:	fn_link  L1248
	fn_combi_t26 6, 0,1,4,5,2,3
L1248:	fn_combi_t46 6, 0,3,1,2,4,5
# --- block 61 ---
L1252:	fn_link  L1200
	fn_link  L1272
	fn_link  L1224
	fn_link  L1240
	fn_combi_t10 5, 0,1,4,2,3,0
L1272:	fn_combi_t46 7, 6,1,0,2,3,4
# --- block 62 ---
L1276:	fn_link  L1252
	fn_combi_t46 5, 4,3,0,1,2,3
# --- block 63 ---
NanoPrelude.foldr:	fn_link  L1300
	fn_link  L1296
	fn_combi_t7 4, 0,1,2,3,0,0
L1296:	fn_y
# --- block 64 ---
L1300:	fn_link  L1308
	fn_combi_t16 5, 4,2,0,1,3,0
L1308:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 65 ---
QuadTreePure.qtZipSumWith:	fn_link  L1656
	fn_link  L1324
	fn_combi_t3 3, 0,1,2,0,0,0
L1324:	fn_y
# --- block 66 ---
L1328:	fn_link  L1336
	fn_combi_t4 4, 1,2,3,0,0,0
L1336:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 67 ---
L1360:	fn_link  L1368
	fn_combi_t32 6, 0,1,2,5,3,4
L1368:	fn_y
# --- block 68 ---
L1372:	fn_link  L1392
	fn_link  L1328
	fn_link  L1360
	fn_link  L1416
	fn_combi_t29 6, 0,1,5,2,4,3
L1392:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1416:	fn_combi_t30 6, 0,4,1,3,5,2
# --- block 69 ---
L1420:	fn_link  L1428
	fn_combi_t32 6, 0,1,2,5,3,4
L1428:	fn_y
# --- block 70 ---
L1432:	fn_link  L1420
	fn_link  L1444
	fn_combi_t3 3, 0,1,2,0,0,0
L1444:	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 71 ---
L1448:	fn_link  L1432
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 72 ---
L1456:	fn_link  L1472
	fn_link  L1372
	fn_link  L1448
	fn_combi_t30 5, 0,4,1,3,4,2
L1472:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 73 ---
L1496:	fn_link  L1504
	fn_combi_t32 6, 0,1,2,5,3,4
L1504:	fn_y
# --- block 74 ---
L1508:	fn_link  L1516
	fn_combi_t29 6, 0,1,5,2,4,3
L1516:	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 75 ---
L1520:	fn_link  L1496
	fn_link  L1508
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 76 ---
L1532:	fn_link  L1540
	fn_combi_t56 6, 0,1,2,5,3,4
L1540:	fn_y
# --- block 77 ---
L1544:	fn_link  L1532
	fn_link  L1556
	fn_combi_t3 3, 0,1,2,0,0,0
L1556:	fn_combi_t46 6, 0,2,1,3,4,5
# --- block 78 ---
L1560:	fn_link  L1568
	fn_combi_t47 6, 2,0,1,3,4,5
L1568:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 79 ---
L1576:	fn_link  L1544
	fn_link  L1560
	fn_link  L1592
	fn_combi_t33 6, 0,1,2,3,5,4
L1592:	fn_combi_t52 6, 0,1,2,4,3,5
# --- block 80 ---
L1596:	fn_link  L1520
	fn_link  L1576
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 81 ---
L1608:	fn_link  L1596
	fn_combi_t28 6, 0,1,4,2,5,3
# --- block 82 ---
L1616:	fn_link  L1632
	fn_link  L1456
	fn_link  L1608
	fn_combi_t30 5, 0,4,1,3,4,2
L1632:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 83 ---
L1656:	fn_link  L1616
	fn_link  L1668
	fn_combi_t46 6, 4,0,1,2,3,5
L1668:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 84 ---
QuadTreePure.qtMap:	fn_link  L1732
	fn_link  L1688
	fn_combi_t3 3, 0,1,2,0,0,0
L1688:	fn_y
# --- block 85 ---
L1692:	fn_link  L1700
	fn_combi_t15 5, 0,1,3,2,4,0
L1700:	fn_combi_t23 7, 6,0,1,2,3,4
# --- block 86 ---
L1704:	fn_link  L1692
	fn_link  L1716
	fn_combi_t3 3, 0,1,2,0,0,0
L1716:	fn_combi_t37 5, 0,1,2,3,1,4
# --- block 87 ---
L1720:	fn_link  L1728
	fn_combi_t32 5, 0,1,2,3,4,2
L1728:	fn_combi_t39 5, 0,2,1,3,1,4
# --- block 88 ---
L1732:	fn_link  L1704
	fn_link  L1720
	fn_link  L1748
	fn_combi_t47 6, 5,0,1,2,3,4
L1748:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 89 ---
Common.mul3plus1:	fn_link  L1776
	fn_link  L1800
	fn_link  L1824
	fn_link  L1832
	fn_link  L1836
	fn_combi_t55 6, 0,1,2,5,3,4
L1776:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1800:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1824:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1832:	fn_y
L1836:	fn_y
# --- block 90 ---
QuadTreePure.qtDelete:	fn_link  L1852
	fn_link  QuadTreePure.qtDeleteAt
	fn_combi_t4 4, 0,2,3,1,0,0
L1852:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 91 ---
QuadTreePure.qtDeleteAt:	fn_link  L2332
	fn_link  L1872
	fn_combi_t46 5, 2,0,1,2,3,4
L1872:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 92 ---
L1876:	fn_link  L1896
	fn_link  L1900
	fn_link  L1904
	fn_link  L1912
	fn_combi_t39 5, 0,1,4,2,4,3
L1896:	fn_combi_t0 4, 1,0,0,0,0,0
L1900:	fn_combi_t0 4, 0,0,0,0,0,0
L1904:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1912:	fn_combi_t23 7, 6,0,1,2,3,4
# --- block 93 ---
L1916:	fn_link  L1932
	fn_link  L1936
	fn_link  L1876
	fn_combi_t39 4, 0,3,3,1,3,2
L1932:	fn_combi_t0 4, 3,0,0,0,0,0
L1936:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 94 ---
L1940:	fn_link  QuadTreePure.q4FromQT
	fn_link  L1916
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 95 ---
L1952:	fn_link  L1972
	fn_link  L1996
	fn_link  L2020
	fn_link  L2028
	fn_combi_t61 5, 0,1,0,4,2,3
L1972:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1996:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2020:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L2028:	fn_y
# --- block 96 ---
L2032:	fn_link  L2052
	fn_link  L1952
	fn_link  GExtra.shiftR
	fn_link  GExtra..$26.
	fn_combi_t34 6, 0,1,4,2,5,3
L2052:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 97 ---
L2060:	fn_link  L2032
	fn_link  L2076
	fn_link  L2080
	fn_combi_t16 5, 0,1,2,3,4,0
L2076:	fn_combi_t0 1, 0,0,0,0,0,0
L2080:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 98 ---
L2084:	fn_link  L2096
	fn_link  L2120
	fn_combi_t3 3, 0,2,1,0,0,0
L2096:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2120:	fn_y
# --- block 99 ---
L2124:	fn_link  QuadTreePure.q4Idx
	fn_link  QuadTreePure.qtDeleteAt
	fn_combi_t26 6, 0,1,5,4,2,3
# --- block 100 ---
L2136:	fn_link  L2084
	fn_link  L2124
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 101 ---
L2148:	fn_link  QuadTreePure.q4Put
	fn_combi_t42 4, 0,3,2,1,2,3
# --- block 102 ---
L2156:	fn_link  L2148
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 103 ---
L2164:	fn_link  L2060
	fn_link  L2136
	fn_link  L2156
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 104 ---
L2180:	fn_link  QuadTreePure.q4FromQT
	fn_link  L2164
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 105 ---
L2192:	fn_link  L2212
	fn_link  L2216
	fn_link  L2220
	fn_link  L2228
	fn_combi_t40 6, 0,4,1,2,5,3
L2212:	fn_combi_t0 4, 0,0,0,0,0,0
L2216:	fn_combi_t0 5, 0,0,0,0,0,0
L2220:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2228:	fn_combi_t23 7, 6,0,1,2,3,4
# --- block 106 ---
L2232:	fn_link  L2252
	fn_link  L2256
	fn_link  L2192
	fn_link  L2260
	fn_combi_t10 5, 0,1,4,2,3,0
L2252:	fn_combi_t0 4, 2,0,0,0,0,0
L2256:	fn_combi_t0 4, 1,0,0,0,0,0
L2260:	fn_combi_t39 4, 0,3,3,1,3,2
# --- block 107 ---
L2264:	fn_link  L2276
	fn_link  L2232
	fn_combi_t14 4, 0,2,3,3,1,0
L2276:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 108 ---
L2280:	fn_link  L2180
	fn_link  L2264
	fn_combi_t46 5, 0,2,1,2,3,4
# --- block 109 ---
L2292:	fn_link  L2312
	fn_link  L2316
	fn_link  L2324
	fn_link  L2328
	fn_combi_t37 6, 0,1,2,3,4,5
L2312:	fn_elink _prim_eq
L2316:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2324:	fn_combi_t10 7, 0,1,2,3,4,0
L2328:	fn_combi_t23 7, 0,5,1,2,3,4
# --- block 110 ---
L2332:	fn_link  L1940
	fn_link  L2280
	fn_link  L2292
	fn_link  L2352
	fn_combi_t39 5, 0,1,2,4,3,4
L2352:	fn_combi_t24 7, 0,1,3,4,2,4
# --- block 111 ---
QuadTreePure.q4Put:	fn_link  L2372
	fn_link  L2588
	fn_link  L2612
	fn_combi_t52 6, 3,0,1,4,2,5
L2372:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 112 ---
L2376:	fn_link  L2384
	fn_combi_t4 4, 0,2,3,1,0,0
L2384:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 113 ---
L2388:	fn_link  L2396
	fn_combi_t9 5, 0,2,3,4,1,0
L2396:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 114 ---
L2400:	fn_link  L2412
	fn_link  L2416
	fn_combi_t38 6, 2,0,1,3,4,5
L2412:	fn_elink _prim_eq
L2416:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 115 ---
L2424:	fn_link  L2400
	fn_link  L2436
	fn_combi_t3 3, 0,1,2,0,0,0
L2436:	fn_combi_t40 5, 0,1,3,4,2,3
# --- block 116 ---
L2440:	fn_link  L2388
	fn_link  L2424
	fn_link  L2456
	fn_combi_t5 4, 0,1,3,2,0,0
L2456:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 117 ---
L2460:	fn_link  L2376
	fn_link  L2440
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 118 ---
L2472:	fn_link  L2484
	fn_link  L2488
	fn_combi_t44 6, 2,0,1,3,4,5
L2484:	fn_elink _prim_eq
L2488:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 119 ---
L2496:	fn_link  L2472
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 120 ---
L2504:	fn_link  L2460
	fn_link  L2496
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 121 ---
L2516:	fn_link  L2524
	fn_combi_t44 6, 0,1,5,2,4,3
L2524:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 122 ---
L2528:	fn_link  L2516
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 123 ---
L2536:	fn_link  L2552
	fn_link  L2504
	fn_link  L2528
	fn_combi_t26 5, 0,1,3,4,2,4
L2552:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 124 ---
L2556:	fn_link  L2568
	fn_link  L2572
	fn_combi_t44 6, 2,0,1,3,4,5
L2568:	fn_elink _prim_eq
L2572:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 125 ---
L2580:	fn_link  L2556
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 126 ---
L2588:	fn_link  L2536
	fn_link  L2580
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 127 ---
L2600:	fn_link  L2608
	fn_combi_t44 5, 0,1,4,2,3,4
L2608:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 128 ---
L2612:	fn_link  L2600
	fn_combi_t26 5, 0,1,3,4,2,3
# --- block 129 ---
QuadTreePure.q4Idx:	fn_link  L2680
	fn_link  L2716
	fn_combi_t20 4, 2,0,3,1,3,0
# --- block 130 ---
L2632:	fn_link  L2644
	fn_link  L2648
	fn_combi_t10 5, 2,0,1,4,3,0
L2644:	fn_elink _prim_eq
L2648:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 131 ---
L2656:	fn_link  L2668
	fn_link  L2672
	fn_combi_t29 6, 2,0,1,3,5,4
L2668:	fn_elink _prim_eq
L2672:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 132 ---
L2680:	fn_link  L2632
	fn_link  L2656
	fn_combi_t30 5, 0,2,1,2,4,3
# --- block 133 ---
L2692:	fn_link  L2704
	fn_link  L2708
	fn_combi_t29 6, 2,0,1,3,5,4
L2704:	fn_elink _prim_eq
L2708:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 134 ---
L2716:	fn_link  L2692
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 135 ---
GExtra..$26.:	fn_link  L2736
	fn_link  L2760
	fn_combi_t8 4, 0,3,2,1,0,0
L2736:	fn_tor a0
	fn_tor a1
	and a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2760:	fn_y
# --- block 136 ---
QuadTreePure.q4FromQT:	fn_link  L2776
	fn_link  L2788
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 137 ---
L2776:	fn_link  L2784
	fn_combi_t0 2, 0,0,0,0,0,0
L2784:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 138 ---
L2788:	fn_link  L2812
	fn_link  L2816
	fn_link  L2820
	fn_link  L2824
	fn_link  L2828
	fn_combi_t51 6, 5,0,1,2,3,4
L2812:	fn_combi_t0 2, 0,0,0,0,0,0
L2816:	fn_combi_t0 2, 0,0,0,0,0,0
L2820:	fn_combi_t0 2, 0,0,0,0,0,0
L2824:	fn_combi_t0 2, 0,0,0,0,0,0
L2828:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 139 ---
QuadTreePure.qtInsert:	fn_link  L2844
	fn_link  QuadTreePure.qtInsertAt
	fn_combi_t4 4, 0,2,3,1,0,0
L2844:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 140 ---
QuadTreePure.qtInsertAt:	fn_link  QuadTreePure.q4FromQT
	fn_link  L2904
	fn_link  L3332
	fn_link  L2872
	fn_combi_t45 5, 0,1,4,2,3,4
L2872:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 141 ---
L2876:	fn_link  L2892
	fn_link  L2896
	fn_link  L2900
	fn_combi_t39 5, 0,3,4,1,4,2
L2892:	fn_combi_t0 4, 1,0,0,0,0,0
L2896:	fn_combi_t0 4, 0,0,0,0,0,0
L2900:	fn_combi_t23 7, 6,0,1,2,3,4
# --- block 142 ---
L2904:	fn_link  L2924
	fn_link  L2928
	fn_link  L2876
	fn_link  L2932
	fn_combi_t24 6, 0,1,5,2,3,4
L2924:	fn_combi_t0 4, 3,0,0,0,0,0
L2928:	fn_combi_t0 4, 2,0,0,0,0,0
L2932:	fn_combi_t39 4, 0,3,3,1,3,2
# --- block 143 ---
L2936:	fn_link  L2956
	fn_link  L2980
	fn_link  L3004
	fn_link  L3012
	fn_combi_t61 5, 0,1,0,4,2,3
L2956:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2980:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3004:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L3012:	fn_y
# --- block 144 ---
L3016:	fn_link  L3036
	fn_link  L2936
	fn_link  GExtra.shiftR
	fn_link  GExtra..$26.
	fn_combi_t34 6, 0,1,4,2,5,3
L3036:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 145 ---
L3044:	fn_link  L3056
	fn_link  L3080
	fn_combi_t3 3, 0,2,1,0,0,0
L3056:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3080:	fn_y
# --- block 146 ---
L3084:	fn_link  QuadTreePure.q4Idx
	fn_link  QuadTreePure.qtInsertAt
	fn_combi_t26 6, 0,1,5,4,2,3
# --- block 147 ---
L3096:	fn_link  L3044
	fn_link  L3084
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 148 ---
L3108:	fn_link  QuadTreePure.q4Put
	fn_combi_t42 5, 0,4,3,1,4,2
# --- block 149 ---
L3116:	fn_link  L3108
	fn_combi_t26 5, 0,1,2,4,3,4
# --- block 150 ---
L3124:	fn_link  L3096
	fn_link  L3116
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 151 ---
L3136:	fn_link  L3156
	fn_link  L3160
	fn_link  L3164
	fn_link  L3172
	fn_combi_t40 6, 0,4,1,2,5,3
L3156:	fn_combi_t0 4, 0,0,0,0,0,0
L3160:	fn_combi_t0 5, 0,0,0,0,0,0
L3164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3172:	fn_combi_t23 7, 6,0,1,2,3,4
# --- block 152 ---
L3176:	fn_link  L3196
	fn_link  L3200
	fn_link  L3136
	fn_link  L3204
	fn_combi_t10 5, 0,1,4,2,3,0
L3196:	fn_combi_t0 4, 2,0,0,0,0,0
L3200:	fn_combi_t0 4, 1,0,0,0,0,0
L3204:	fn_combi_t39 4, 0,3,3,1,3,2
# --- block 153 ---
L3208:	fn_link  L3220
	fn_link  L3176
	fn_combi_t14 4, 0,2,3,3,1,0
L3220:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 154 ---
L3224:	fn_link  L3208
	fn_link  L3236
	fn_combi_t3 3, 0,1,2,0,0,0
L3236:	fn_combi_t56 6, 0,1,5,4,2,3
# --- block 155 ---
L3240:	fn_link  QuadTreePure.q4FromQT
	fn_link  L3124
	fn_link  L3224
	fn_link  L3260
	fn_combi_t24 5, 0,1,4,2,3,4
L3260:	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 156 ---
L3264:	fn_link  L3284
	fn_link  L3288
	fn_link  L3240
	fn_link  L3292
	fn_combi_t26 6, 0,1,4,5,2,3
L3284:	fn_combi_t0 1, 0,0,0,0,0,0
L3288:	fn_combi_t0 1, 0,0,0,0,0,0
L3292:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 157 ---
L3296:	fn_link  L3016
	fn_link  L3264
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 158 ---
L3308:	fn_link  L3320
	fn_link  L3324
	fn_combi_t44 5, 3,0,1,2,3,4
L3320:	fn_elink _prim_eq
L3324:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 159 ---
L3332:	fn_link  L3296
	fn_link  L3308
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 160 ---
QuadTreePure.mkOps:	fn_link  L3356
	fn_link  L3480
	fn_combi_t4 4, 0,2,3,1,0,0
L3356:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 161 ---
L3360:	fn_link  L3376
	fn_link  L3400
	fn_link  QuadTreePure.mkOps
	fn_combi_t8 4, 0,1,3,2,0,0
L3376:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3400:	fn_y
# --- block 162 ---
L3404:	fn_link  L3416
	fn_link  GExtra..$26.
	fn_combi_t12 5, 4,0,2,1,3,0
L3416:	fn_box
	.word 0x000000ff	# raw word 255
	fn_box_body
# --- block 163 ---
L3424:	fn_link  L3404
	fn_link  L3436
	fn_combi_t40 5, 0,1,3,4,2,4
L3436:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 164 ---
L3440:	fn_link  Common.lcgNext
	fn_link  L3360
	fn_link  L3424
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 165 ---
L3456:	fn_link  L3468
	fn_link  L3472
	fn_combi_t45 6, 4,0,1,2,3,5
L3468:	fn_elink _prim_eq
L3472:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 166 ---
L3480:	fn_link  Common.lcgNext
	fn_link  L3440
	fn_link  L3456
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 167 ---
Common.lcgNext:	fn_link  L3512
	fn_link  L3508
	fn_combi_t3 3, 0,1,2,0,0,0
L3508:	fn_y
# --- block 168 ---
L3512:	fn_link  L3536
	fn_link  L3560
	fn_link  L3584
	fn_link  L3592
	fn_link  L3596
	fn_combi_t55 6, 0,1,2,5,3,4
L3536:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3560:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3584:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L3592:	fn_y
L3596:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
	fn_box_body
# --- block 169 ---
GExtra.take:	fn_link  L3620
	fn_link  L3668
	fn_link  L3684
	fn_combi_t24 5, 0,1,3,3,4,2
L3620:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 170 ---
L3624:	fn_link  L3640
	fn_link  L3664
	fn_link  GExtra.take
	fn_combi_t8 4, 0,1,3,2,0,0
L3640:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3664:	fn_y
# --- block 171 ---
L3668:	fn_link  L3624
	fn_link  L3680
	fn_combi_t16 5, 0,3,1,2,4,0
L3680:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 172 ---
L3684:	fn_link  L3700
	fn_link  L3704
	fn_link  GExtra.$3c$3d
	fn_combi_t42 6, 0,4,1,5,2,3
L3700:	fn_combi_t0 2, 0,0,0,0,0,0
L3704:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 173 ---
GExtra.$3c$3d:	fn_link  L3720
	fn_combi_t3 3, 2,1,0,0,0,0
L3720:	fn_elink _prim_leu

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
