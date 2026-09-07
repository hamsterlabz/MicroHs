# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/BTreePure  (entry @0)
	.text
	.globl	BTreePure.bDelete
	.globl	BTreePure.bDeleteMin
	.globl	BTreePure.bFoldl
	.globl	BTreePure.bFoldr
	.globl	BTreePure.bInsert
	.globl	BTreePure.bMap
	.globl	BTreePure.bMinKey
	.globl	BTreePure.bZipSumWith
	.globl	BTreePure.bench
	.globl	BTreePure.keys
	.globl	BTreePure.main
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3c
	.globl	GExtra.$3e
	.globl	GExtra.$3e$3d
	.globl	GExtra..$26.
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	NanoPrelude.foldl
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  BTreePure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
BTreePure.main:	fn_link  L36
	fn_elink BTreePure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
BTreePure.bench:	fn_link  L480
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
L116:	fn_link  L56
	fn_link  L132
	fn_link  BTreePure.keys
	fn_combi_t6 4, 0,1,2,3,0,0
L132:	fn_box
	.word 0x00000018	# raw word 24
	fn_box_body
# --- block 6 ---
L140:	fn_link  L116
	fn_link  L160
	fn_link  BTreePure.bInsert
	fn_link  NanoPrelude.foldl
	fn_combi_t14 5, 0,1,2,3,4,0
L160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
L164:	fn_link  L184
	fn_link  L208
	fn_link  L216
	fn_link  L220
	fn_combi_t20 5, 0,1,4,2,3,0
L184:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L208:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L216:	fn_combi_t0 1, 0,0,0,0,0,0
L220:	fn_y
# --- block 8 ---
L224:	fn_link  L244
	fn_link  GExtra.xor
	fn_link  L252
	fn_link  BTreePure.keys
	fn_combi_t16 5, 0,1,2,4,3,0
L244:	fn_box
	.word 0x0000dead	# raw word 57005
	fn_box_body
L252:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 9 ---
L260:	fn_link  L284
	fn_link  BTreePure.keys
	fn_link  L292
	fn_link  BTreePure.bInsert
	fn_link  NanoPrelude.foldl
	fn_combi_t42 6, 0,1,2,3,4,5
L284:	fn_box
	.word 0x00000018	# raw word 24
	fn_box_body
L292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 10 ---
L296:	fn_link  L224
	fn_link  L260
	fn_link  BTreePure.bDelete
	fn_link  NanoPrelude.foldl
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 11 ---
L316:	fn_link  L296
	fn_link  Common.mul3plus1
	fn_link  BTreePure.bMap
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 12 ---
L332:	fn_link  GExtra.xor
	fn_link  BTreePure.bZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 13 ---
L344:	fn_link  L364
	fn_link  Common.addW
	fn_link  BTreePure.bFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 14 ---
L372:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 15 ---
L380:	fn_link  L404
	fn_link  GExtra.xor
	fn_link  BTreePure.bFoldr
	fn_link  L344
	fn_link  L372
	fn_combi_t44 6, 0,1,5,2,3,4
L404:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 16 ---
L412:	fn_link  Common.addW
	fn_link  BTreePure.bZipSumWith
	fn_link  L380
	fn_link  L432
	fn_combi_t10 5, 0,1,4,2,3,0
L432:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 17 ---
L436:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 18 ---
L444:	fn_link  L412
	fn_link  L436
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 19 ---
L456:	fn_link  L316
	fn_link  L332
	fn_link  L444
	fn_link  L476
	fn_combi_t24 6, 0,1,5,2,3,4
L476:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 20 ---
L480:	fn_link  L140
	fn_link  L164
	fn_link  L456
	fn_combi_t38 5, 0,1,3,4,2,3
# --- block 21 ---
Common.benchFold:	fn_link  L516
	fn_link  L524
	fn_link  L620
	fn_link  L532
	fn_combi_t26 6, 0,1,4,5,2,3
L516:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L524:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L532:	fn_y
# --- block 22 ---
L536:	fn_link  L548
	fn_link  L572
	fn_combi_t41 6, 2,0,4,1,3,5
L548:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L572:	fn_y
# --- block 23 ---
L576:	fn_link  L536
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 24 ---
L584:	fn_link  L596
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L596:	fn_elink _error0
# --- block 25 ---
L600:	fn_link  L576
	fn_link  L584
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 26 ---
L612:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 27 ---
L620:	fn_link  L600
	fn_link  L612
	fn_link  L636
	fn_combi_t5 4, 0,1,3,2,0,0
L636:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 28 ---
GExtra.$3e$3d:	fn_link  L648
	fn_combi_t3 3, 2,1,0,0,0,0
L648:	fn_elink _prim_geu
# --- block 29 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 30 ---
Common.hashMix:	fn_link  L672
	fn_link  L780
	fn_link  L808
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 31 ---
L672:	fn_link  L692
	fn_link  GExtra.xor
	fn_link  L716
	fn_link  L724
	fn_combi_t60 6, 0,1,2,4,5,3
L692:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L716:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L724:	fn_y
# --- block 32 ---
L728:	fn_link  L748
	fn_link  L772
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L748:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L772:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 33 ---
L780:	fn_link  L728
	fn_link  L796
	fn_link  L804
	fn_combi_t8 4, 0,1,2,3,0,0
L796:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L804:	fn_y
# --- block 34 ---
L808:	fn_link  L824
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L824:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 35 ---
GExtra.xor:	fn_link  L844
	fn_link  L868
	fn_combi_t8 4, 0,3,2,1,0,0
L844:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L868:	fn_y
# --- block 36 ---
GExtra.shiftR:	fn_link  L884
	fn_link  L908
	fn_combi_t8 4, 0,3,2,1,0,0
L884:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L908:	fn_y
# --- block 37 ---
BTreePure.bFoldl:	fn_link  L932
	fn_link  L936
	fn_link  L940
	fn_link  L944
	fn_combi_t19 5, 0,1,2,4,3,0
L932:	fn_combi_t0 1, 0,0,0,0,0,0
L936:	fn_combi_t54 5, 1,0,1,2,4,3
L940:	fn_combi_t47 5, 4,3,0,1,2,3
L944:	fn_y
# --- block 38 ---
Common.addW:	fn_link  L960
	fn_link  L984
	fn_combi_t8 4, 0,3,2,1,0,0
L960:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L984:	fn_y
# --- block 39 ---
BTreePure.bFoldr:	fn_link  L1040
	fn_link  L1000
	fn_combi_t3 3, 0,1,2,0,0,0
L1000:	fn_y
# --- block 40 ---
L1004:	fn_link  L1016
	fn_link  L1020
	fn_combi_t6 4, 0,2,1,3,0,0
L1016:	fn_combi_t0 1, 0,0,0,0,0,0
L1020:	fn_combi_t58 5, 1,0,3,1,2,4
# --- block 41 ---
L1024:	fn_link  L1004
	fn_link  L1036
	fn_combi_t3 3, 0,1,2,0,0,0
L1036:	fn_combi_t23 6, 0,1,2,3,5,4
# --- block 42 ---
L1040:	fn_link  L1024
	fn_combi_t46 5, 4,3,0,1,2,3
# --- block 43 ---
BTreePure.bZipSumWith:	fn_link  L1172
	fn_link  L1208
	fn_link  L1064
	fn_combi_t8 4, 0,1,2,3,0,0
L1064:	fn_y
# --- block 44 ---
L1068:	fn_link  L1076
	fn_combi_t4 4, 1,2,3,0,0,0
L1076:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 45 ---
L1100:	fn_link  L1108
	fn_combi_t32 6, 0,1,2,5,3,4
L1108:	fn_y
# --- block 46 ---
L1112:	fn_link  L1132
	fn_link  L1068
	fn_link  L1100
	fn_link  L1156
	fn_combi_t29 6, 0,1,5,2,4,3
L1132:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1156:	fn_combi_t30 6, 0,4,1,3,5,2
# --- block 47 ---
L1160:	fn_link  L1168
	fn_combi_t56 6, 0,1,2,5,3,4
L1168:	fn_y
# --- block 48 ---
L1172:	fn_link  L1112
	fn_link  L1160
	fn_link  L1188
	fn_combi_t44 5, 0,1,4,2,3,4
L1188:	fn_combi_t46 6, 0,4,1,2,3,5
# --- block 49 ---
L1192:	fn_link  L1200
	fn_combi_t46 6, 2,0,1,3,4,5
L1200:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 50 ---
L1208:	fn_link  L1192
	fn_link  L1220
	fn_combi_t47 6, 4,0,1,2,3,5
L1220:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 51 ---
BTreePure.bMap:	fn_link  L1256
	fn_link  L1240
	fn_combi_t3 3, 0,1,2,0,0,0
L1240:	fn_y
# --- block 52 ---
L1244:	fn_link  L1252
	fn_combi_t15 5, 0,1,3,2,4,0
L1252:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 53 ---
L1256:	fn_link  L1244
	fn_link  L1272
	fn_link  L1276
	fn_combi_t47 6, 5,0,1,2,3,4
L1272:	fn_combi_t37 5, 0,1,2,3,1,4
L1276:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
Common.mul3plus1:	fn_link  L1304
	fn_link  L1328
	fn_link  L1352
	fn_link  L1360
	fn_link  L1364
	fn_combi_t55 6, 0,1,2,5,3,4
L1304:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1328:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1352:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1360:	fn_y
L1364:	fn_y
# --- block 55 ---
NanoPrelude.foldl:	fn_link  L1384
	fn_link  L1380
	fn_combi_t3 3, 0,1,2,0,0,0
L1380:	fn_y
# --- block 56 ---
L1384:	fn_link  L1392
	fn_combi_t46 5, 4,3,0,1,2,3
L1392:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 57 ---
BTreePure.bDelete:	fn_link  L1416
	fn_link  L1588
	fn_link  L1412
	fn_combi_t48 5, 3,0,1,4,2,4
L1412:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
L1416:	fn_link  BTreePure.bDelete
	fn_link  L1428
	fn_combi_t16 5, 0,3,1,4,2,0
L1428:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 59 ---
L1432:	fn_link  BTreePure.bDelete
	fn_link  L1444
	fn_combi_t42 6, 0,3,4,1,5,2
L1444:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 60 ---
L1448:	fn_link  BTreePure.bMinKey
	fn_link  L1464
	fn_link  L1468
	fn_combi_t23 7, 0,1,2,4,3,5
L1464:	fn_combi_t4 5, 4,0,1,2,0,0
L1468:	fn_combi_t38 7, 0,1,2,3,4,2
# --- block 61 ---
L1472:	fn_link  BTreePure.bDeleteMin
	fn_link  L1448
	fn_link  L1488
	fn_combi_t30 5, 0,3,1,3,4,2
L1488:	fn_combi_t6 7, 3,0,1,2,0,0
# --- block 62 ---
L1492:	fn_link  L1472
	fn_combi_t46 5, 3,2,0,1,2,4
# --- block 63 ---
L1500:	fn_link  L1512
	fn_link  Data.Bool_Type.True
	fn_combi_t46 5, 0,1,2,4,3,4
L1512:	fn_elink _error0
# --- block 64 ---
L1516:	fn_link  L1492
	fn_link  L1500
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 65 ---
L1528:	fn_link  L1516
	fn_link  GExtra.$3e
	fn_combi_t42 6, 0,2,3,1,4,5
# --- block 66 ---
L1540:	fn_link  L1528
	fn_link  L1552
	fn_combi_t40 5, 0,1,2,4,3,4
L1552:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 67 ---
L1556:	fn_link  L1432
	fn_link  L1540
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 68 ---
L1568:	fn_link  GExtra.$3c
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 69 ---
L1576:	fn_link  L1556
	fn_link  L1568
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 70 ---
L1588:	fn_link  L1576
	fn_link  L1600
	fn_combi_t40 5, 0,1,2,4,3,4
L1600:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 71 ---
GExtra.$3c:	fn_link  L1612
	fn_combi_t3 3, 2,1,0,0,0,0
L1612:	fn_elink _prim_ltu
# --- block 72 ---
GExtra.$3e:	fn_link  L1624
	fn_combi_t3 3, 2,1,0,0,0,0
L1624:	fn_elink _prim_gtu
# --- block 73 ---
BTreePure.bMinKey:	fn_link  L1656
	fn_link  L1640
	fn_combi_t2 3, 2,0,1,0,0,0
L1640:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 74 ---
L1648:	fn_link  BTreePure.bMinKey
	fn_combi_t1 5, 0,1,0,0,0,0
# --- block 75 ---
L1656:	fn_link  L1648
	fn_combi_t6 4, 2,1,0,2,0,0
# --- block 76 ---
BTreePure.bDeleteMin:	fn_link  L1704
	fn_link  L1676
	fn_combi_t2 3, 2,0,1,0,0,0
L1676:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
L1680:	fn_link  BTreePure.bDeleteMin
	fn_link  L1696
	fn_link  L1700
	fn_combi_t23 7, 0,1,3,2,4,5
L1696:	fn_combi_t4 5, 4,0,1,2,0,0
L1700:	fn_combi_t11 7, 0,1,2,3,4,0
# --- block 78 ---
L1704:	fn_link  L1680
	fn_combi_t46 4, 2,3,0,1,2,3
# --- block 79 ---
BTreePure.bInsert:	fn_link  L1832
	fn_link  L1852
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 80 ---
L1724:	fn_link  BTreePure.bInsert
	fn_link  L1736
	fn_combi_t16 5, 0,3,1,4,2,0
L1736:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 81 ---
L1740:	fn_link  BTreePure.bInsert
	fn_link  L1752
	fn_combi_t42 6, 0,3,4,1,5,2
L1752:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 82 ---
L1756:	fn_link  L1772
	fn_link  Data.Bool_Type.True
	fn_link  GExtra.$3e
	fn_combi_t42 6, 0,4,5,1,2,3
L1772:	fn_elink _error0
# --- block 83 ---
L1776:	fn_link  GExtra.$3c
	fn_combi_t43 6, 0,1,3,2,4,5
# --- block 84 ---
L1784:	fn_link  L1776
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 85 ---
L1792:	fn_link  L1756
	fn_link  L1784
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 86 ---
L1804:	fn_link  L1812
	fn_combi_t40 5, 0,1,2,4,3,4
L1812:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 87 ---
L1816:	fn_link  L1740
	fn_link  L1792
	fn_link  L1804
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 88 ---
L1832:	fn_link  L1724
	fn_link  L1816
	fn_link  L1848
	fn_combi_t40 5, 0,1,3,4,2,4
L1848:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 89 ---
L1852:	fn_link  L1864
	fn_link  L1868
	fn_combi_t18 4, 2,0,3,1,1,0
L1864:	fn_combi_t0 2, 0,0,0,0,0,0
L1868:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 90 ---
BTreePure.keys:	fn_link  L1884
	fn_link  L1996
	fn_combi_t4 4, 0,2,3,1,0,0
L1884:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 91 ---
L1888:	fn_link  L1904
	fn_link  L1928
	fn_link  BTreePure.keys
	fn_combi_t8 4, 0,1,3,2,0,0
L1904:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1928:	fn_y
# --- block 92 ---
L1932:	fn_link  L1948
	fn_link  GExtra..$26.
	fn_link  L1956
	fn_combi_t40 5, 0,1,4,2,3,4
L1948:	fn_box
	.word 0x00000fff	# raw word 4095
	fn_box_body
L1956:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 93 ---
L1960:	fn_link  L1888
	fn_link  L1932
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 94 ---
L1972:	fn_link  L1984
	fn_link  L1988
	fn_combi_t45 6, 4,0,1,2,3,5
L1984:	fn_elink _prim_eq
L1988:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 95 ---
L1996:	fn_link  Common.lcgNext
	fn_link  L1960
	fn_link  L1972
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 96 ---
GExtra..$26.:	fn_link  L2024
	fn_link  L2048
	fn_combi_t8 4, 0,3,2,1,0,0
L2024:	fn_tor a0
	fn_tor a1
	and a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2048:	fn_y
# --- block 97 ---
Common.lcgNext:	fn_link  L2068
	fn_link  L2064
	fn_combi_t3 3, 0,1,2,0,0,0
L2064:	fn_y
# --- block 98 ---
L2068:	fn_link  L2092
	fn_link  L2116
	fn_link  L2140
	fn_link  L2148
	fn_link  L2152
	fn_combi_t55 6, 0,1,2,5,3,4
L2092:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2116:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2140:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L2148:	fn_y
L2152:	fn_box
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
