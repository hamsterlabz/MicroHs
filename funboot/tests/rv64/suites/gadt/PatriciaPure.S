# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/PatriciaPure  (entry @0)
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
	.globl	GExtra..$7c.
	.globl	GExtra.shiftR
	.globl	GExtra.take
	.globl	GExtra.xor
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	PatriciaPure.bench
	.globl	PatriciaPure.branchingBit
	.globl	PatriciaPure.highestBit
	.globl	PatriciaPure.main
	.globl	PatriciaPure.maskOf
	.globl	PatriciaPure.matchPrefix
	.globl	PatriciaPure.pairs
	.globl	PatriciaPure.ptDelete
	.globl	PatriciaPure.ptFoldl
	.globl	PatriciaPure.ptFoldr
	.globl	PatriciaPure.ptInsert
	.globl	PatriciaPure.ptLookup
	.globl	PatriciaPure.ptMap
	.globl	PatriciaPure.ptZipSumWith
	.globl	PatriciaPure.zeroBit
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  PatriciaPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
PatriciaPure.main:	fn_link  L36
	fn_elink PatriciaPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
PatriciaPure.bench:	fn_link  L484
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
	fn_link  PatriciaPure.pairs
	fn_combi_t6 4, 0,1,2,3,0,0
L132:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 6 ---
L140:	fn_link  PatriciaPure.ptInsert
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 7 ---
L148:	fn_link  L116
	fn_link  L168
	fn_link  L140
	fn_link  NanoPrelude.foldl
	fn_combi_t14 5, 0,1,2,3,4,0
L168:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 8 ---
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
# --- block 9 ---
L232:	fn_link  L172
	fn_link  L248
	fn_link  PatriciaPure.pairs
	fn_combi_t6 4, 0,1,2,3,0,0
L248:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 10 ---
L256:	fn_link  L276
	fn_link  GExtra.take
	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.map
	fn_combi_t16 5, 0,1,2,3,4,0
L276:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 11 ---
L284:	fn_link  PatriciaPure.ptInsert
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 12 ---
L292:	fn_link  L312
	fn_link  L284
	fn_link  PatriciaPure.ptDelete
	fn_link  NanoPrelude.foldl
	fn_combi_t46 5, 0,1,0,2,3,4
L312:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 13 ---
L316:	fn_link  L256
	fn_link  L292
	fn_link  Common.mul3plus1
	fn_link  PatriciaPure.ptMap
	fn_combi_t48 5, 0,1,2,4,3,4
# --- block 14 ---
L336:	fn_link  GExtra.xor
	fn_link  PatriciaPure.ptZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 15 ---
L348:	fn_link  L368
	fn_link  Common.addW
	fn_link  PatriciaPure.ptFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L368:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 16 ---
L376:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 17 ---
L384:	fn_link  L408
	fn_link  GExtra.xor
	fn_link  PatriciaPure.ptFoldr
	fn_link  L348
	fn_link  L376
	fn_combi_t44 6, 0,1,5,2,3,4
L408:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 18 ---
L416:	fn_link  Common.addW
	fn_link  PatriciaPure.ptZipSumWith
	fn_link  L384
	fn_link  L436
	fn_combi_t10 5, 0,1,4,2,3,0
L436:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 19 ---
L440:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 20 ---
L448:	fn_link  L416
	fn_link  L440
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 21 ---
L460:	fn_link  L316
	fn_link  L336
	fn_link  L448
	fn_link  L480
	fn_combi_t24 6, 0,1,5,2,3,4
L480:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 22 ---
L484:	fn_link  L148
	fn_link  L232
	fn_link  L460
	fn_combi_t38 5, 0,1,3,4,2,3
# --- block 23 ---
Common.benchFold:	fn_link  L520
	fn_link  L528
	fn_link  L624
	fn_link  L536
	fn_combi_t26 6, 0,1,4,5,2,3
L520:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L528:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L536:	fn_y
# --- block 24 ---
L540:	fn_link  L552
	fn_link  L576
	fn_combi_t41 6, 2,0,4,1,3,5
L552:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L576:	fn_y
# --- block 25 ---
L580:	fn_link  L540
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 26 ---
L588:	fn_link  L600
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L600:	fn_elink _error0
# --- block 27 ---
L604:	fn_link  L580
	fn_link  L588
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 28 ---
L616:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 29 ---
L624:	fn_link  L604
	fn_link  L616
	fn_link  L640
	fn_combi_t5 4, 0,1,3,2,0,0
L640:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 30 ---
GExtra.$3e$3d:	fn_link  L652
	fn_combi_t3 3, 2,1,0,0,0,0
L652:	fn_elink _prim_geu
# --- block 31 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 32 ---
Common.hashMix:	fn_link  L676
	fn_link  L784
	fn_link  L812
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 33 ---
L676:	fn_link  L696
	fn_link  GExtra.xor
	fn_link  L720
	fn_link  L728
	fn_combi_t60 6, 0,1,2,4,5,3
L696:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L720:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L728:	fn_y
# --- block 34 ---
L732:	fn_link  L752
	fn_link  L776
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L752:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L776:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 35 ---
L784:	fn_link  L732
	fn_link  L800
	fn_link  L808
	fn_combi_t8 4, 0,1,2,3,0,0
L800:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L808:	fn_y
# --- block 36 ---
L812:	fn_link  L828
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L828:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 37 ---
GExtra.xor:	fn_link  L848
	fn_link  L872
	fn_combi_t8 4, 0,3,2,1,0,0
L848:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L872:	fn_y
# --- block 38 ---
GExtra.shiftR:	fn_link  L888
	fn_link  L912
	fn_combi_t8 4, 0,3,2,1,0,0
L888:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L912:	fn_y
# --- block 39 ---
PatriciaPure.ptFoldl:	fn_link  L952
	fn_link  L928
	fn_combi_t3 3, 0,1,2,0,0,0
L928:	fn_y
# --- block 40 ---
L932:	fn_link  L944
	fn_link  L948
	fn_combi_t3 3, 0,1,2,0,0,0
L944:	fn_combi_t0 1, 0,0,0,0,0,0
L948:	fn_combi_t7 5, 0,0,1,4,0,0
# --- block 41 ---
L952:	fn_link  L932
	fn_link  L968
	fn_link  L972
	fn_combi_t15 5, 0,1,3,2,4,0
L968:	fn_combi_t1 3, 0,1,0,0,0,0
L972:	fn_combi_t39 4, 3,2,0,2,1,2
# --- block 42 ---
Common.addW:	fn_link  L988
	fn_link  L1012
	fn_combi_t8 4, 0,3,2,1,0,0
L988:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1012:	fn_y
# --- block 43 ---
PatriciaPure.ptFoldr:	fn_link  L1052
	fn_link  L1028
	fn_combi_t3 3, 0,1,2,0,0,0
L1028:	fn_y
# --- block 44 ---
L1032:	fn_link  L1044
	fn_link  L1048
	fn_combi_t3 3, 0,1,2,0,0,0
L1044:	fn_combi_t0 1, 0,0,0,0,0,0
L1048:	fn_combi_t12 6, 0,0,1,5,4,0
# --- block 45 ---
L1052:	fn_link  L1032
	fn_link  L1068
	fn_link  L1072
	fn_combi_t15 5, 0,1,3,2,4,0
L1068:	fn_combi_t2 4, 0,3,1,0,0,0
L1072:	fn_combi_t39 4, 3,2,0,2,1,2
# --- block 46 ---
PatriciaPure.ptZipSumWith:	fn_link  L1192
	fn_link  L1088
	fn_combi_t3 3, 0,1,2,0,0,0
L1088:	fn_y
# --- block 47 ---
L1092:	fn_link  L1100
	fn_combi_t4 4, 1,3,2,0,0,0
L1100:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 48 ---
L1124:	fn_link  L1136
	fn_link  L1140
	fn_combi_t37 6, 0,1,3,4,2,4
L1136:	fn_y
L1140:	fn_combi_t56 7, 0,1,6,2,3,5
# --- block 49 ---
L1144:	fn_link  L1092
	fn_link  L1124
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 50 ---
L1156:	fn_link  L1168
	fn_link  PatriciaPure.ptLookup
	fn_combi_t37 6, 0,3,4,1,2,5
L1168:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 51 ---
L1176:	fn_link  L1184
	fn_combi_t39 5, 3,0,1,4,2,4
L1184:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 52 ---
L1192:	fn_link  L1144
	fn_link  L1156
	fn_link  L1176
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 53 ---
PatriciaPure.ptLookup:	fn_link  L1240
	fn_link  L1280
	fn_link  L1224
	fn_combi_t39 5, 3,0,1,4,2,4
L1224:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1228:	fn_link  PatriciaPure.zeroBit
	fn_link  PatriciaPure.ptLookup
	fn_combi_t51 6, 0,1,2,3,5,4
# --- block 55 ---
L1240:	fn_link  L1228
	fn_combi_t23 6, 0,1,2,4,5,1
# --- block 56 ---
L1248:	fn_link  L1268
	fn_link  L1272
	fn_link  Data.Bool_Type.True
	fn_link  L1276
	fn_combi_t44 6, 4,5,0,1,2,3
L1268:	fn_combi_t0 2, 0,0,0,0,0,0
L1272:	fn_elink _error0
L1276:	fn_elink _prim_eq
# --- block 57 ---
L1280:	fn_link  L1292
	fn_link  L1248
	fn_combi_t14 5, 0,2,3,1,4,0
L1292:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 58 ---
PatriciaPure.zeroBit:	fn_link  L1308
	fn_link  L1312
	fn_combi_t4 4, 0,2,3,1,0,0
L1308:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 59 ---
L1312:	fn_link  L1332
	fn_link  L1336
	fn_link  GExtra..$26.
	fn_link  L1340
	fn_combi_t32 6, 0,1,4,5,2,3
L1332:	fn_combi_t0 2, 0,0,0,0,0,0
L1336:	fn_elink _prim_eq
L1340:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 60 ---
GExtra..$26.:	fn_link  L1360
	fn_link  L1384
	fn_combi_t8 4, 0,3,2,1,0,0
L1360:	fn_tor a0
	fn_tor a1
	and a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1384:	fn_y
# --- block 61 ---
PatriciaPure.ptMap:	fn_link  L1444
	fn_link  L1400
	fn_combi_t3 3, 0,1,2,0,0,0
L1400:	fn_y
# --- block 62 ---
L1404:	fn_link  L1412
	fn_combi_t14 5, 0,2,3,1,4,0
L1412:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 63 ---
L1416:	fn_link  L1404
	fn_link  L1428
	fn_combi_t5 3, 0,1,2,2,0,0
L1428:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 64 ---
L1432:	fn_link  L1440
	fn_combi_t6 4, 0,2,1,3,0,0
L1440:	fn_combi_t2 5, 3,0,1,0,0,0
# --- block 65 ---
L1444:	fn_link  L1416
	fn_link  L1432
	fn_link  L1460
	fn_combi_t39 6, 5,0,1,3,2,4
L1460:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 66 ---
Common.mul3plus1:	fn_link  L1488
	fn_link  L1512
	fn_link  L1536
	fn_link  L1544
	fn_link  L1548
	fn_combi_t55 6, 0,1,2,5,3,4
L1488:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1512:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1536:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1544:	fn_y
L1548:	fn_y
# --- block 67 ---
NanoPrelude.foldl:	fn_link  L1568
	fn_link  L1564
	fn_combi_t3 3, 0,1,2,0,0,0
L1564:	fn_y
# --- block 68 ---
L1568:	fn_link  L1576
	fn_combi_t46 5, 4,3,0,1,2,3
L1576:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 69 ---
PatriciaPure.ptDelete:	fn_link  L1840
	fn_link  L1916
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 70 ---
L1592:	fn_link  PatriciaPure.ptDelete
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 71 ---
L1600:	fn_link  L1608
	fn_combi_t9 5, 0,1,2,4,3,0
L1608:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 72 ---
L1612:	fn_link  L1624
	fn_link  L1628
	fn_combi_t39 5, 3,2,0,4,1,4
L1624:	fn_combi_t0 5, 0,0,0,0,0,0
L1628:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 73 ---
L1632:	fn_link  L1612
	fn_combi_t42 4, 0,3,2,1,3,2
# --- block 74 ---
L1640:	fn_link  PatriciaPure.ptDelete
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 75 ---
L1648:	fn_link  L1660
	fn_link  L1664
	fn_combi_t39 5, 3,2,0,4,1,4
L1660:	fn_combi_t0 5, 0,0,0,0,0,0
L1664:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 76 ---
L1668:	fn_link  L1648
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 77 ---
L1676:	fn_link  L1688
	fn_link  L1668
	fn_combi_t7 4, 0,1,2,3,0,0
L1688:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 78 ---
L1692:	fn_link  L1704
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 0,1,2,4,3,5
L1704:	fn_elink _error0
# --- block 79 ---
L1708:	fn_link  L1640
	fn_link  L1676
	fn_link  L1692
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 80 ---
L1724:	fn_link  PatriciaPure.zeroBit
	fn_combi_t42 6, 0,1,2,3,4,5
# --- block 81 ---
L1732:	fn_link  PatriciaPure.matchPrefix
	fn_link  NanoPrelude.not
	fn_combi_t18 5, 0,1,2,4,3,0
# --- block 82 ---
L1744:	fn_link  L1732
	fn_link  L1756
	fn_combi_t18 5, 0,1,2,3,4,0
L1756:	fn_combi_t34 5, 0,1,4,2,4,3
# --- block 83 ---
L1760:	fn_link  L1768
	fn_combi_t45 5, 0,1,4,2,3,4
L1768:	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 84 ---
L1772:	fn_link  L1744
	fn_link  L1760
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 85 ---
L1784:	fn_link  L1724
	fn_link  L1772
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 86 ---
L1796:	fn_link  L1708
	fn_link  L1784
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 87 ---
L1808:	fn_link  L1816
	fn_combi_t38 5, 0,1,4,2,3,4
L1816:	fn_combi_t31 5, 0,4,1,2,4,3
# --- block 88 ---
L1820:	fn_link  L1600
	fn_link  L1632
	fn_link  L1796
	fn_link  L1808
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 89 ---
L1840:	fn_link  L1592
	fn_link  L1820
	fn_link  L1856
	fn_combi_t29 5, 0,1,4,2,4,3
L1856:	fn_combi_t23 6, 0,3,1,4,5,2
# --- block 90 ---
L1860:	fn_link  L1876
	fn_link  L1880
	fn_link  Data.Bool_Type.True
	fn_combi_t16 5, 0,1,2,3,4,0
L1876:	fn_combi_t2 5, 3,0,1,0,0,0
L1880:	fn_elink _error0
# --- block 91 ---
L1884:	fn_link  L1892
	fn_combi_t29 6, 1,4,0,2,5,3
L1892:	fn_elink _prim_eq
# --- block 92 ---
L1896:	fn_link  L1912
	fn_link  L1860
	fn_link  L1884
	fn_combi_t25 5, 0,3,1,4,2,4
L1912:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 93 ---
L1916:	fn_link  L1896
	fn_link  L1928
	fn_combi_t39 5, 3,0,1,4,2,4
L1928:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 94 ---
NanoPrelude.not:	fn_link  L1944
	fn_link  L1948
	fn_combi_t2 3, 2,0,1,0,0,0
L1944:	fn_combi_t0 2, 0,0,0,0,0,0
L1948:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 95 ---
PatriciaPure.matchPrefix:	fn_link  L1964
	fn_link  L1968
	fn_combi_t9 5, 0,2,3,4,1,0
L1964:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 96 ---
L1968:	fn_link  L1984
	fn_link  L1988
	fn_link  PatriciaPure.maskOf
	fn_combi_t32 6, 4,0,3,5,1,2
L1984:	fn_combi_t0 2, 0,0,0,0,0,0
L1988:	fn_elink _prim_eq
# --- block 97 ---
PatriciaPure.maskOf:	fn_link  L2008
	fn_link  L2032
	fn_link  GExtra..$26.
	fn_combi_t17 5, 0,3,1,4,2,0
L2008:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2032:	fn_y
# --- block 98 ---
PatriciaPure.ptInsert:	fn_link  L2156
	fn_link  L2652
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 99 ---
L2048:	fn_link  PatriciaPure.maskOf
	fn_link  L2060
	fn_combi_t30 5, 0,4,1,2,4,3
L2060:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 100 ---
L2064:	fn_link  PatriciaPure.maskOf
	fn_link  L2076
	fn_combi_t30 5, 0,4,1,3,4,2
L2076:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 101 ---
L2080:	fn_link  PatriciaPure.zeroBit
	fn_combi_t42 5, 0,2,4,1,4,3
# --- block 102 ---
L2088:	fn_link  L2064
	fn_link  L2080
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 103 ---
L2100:	fn_link  L2088
	fn_link  L2112
	fn_combi_t7 4, 0,1,2,3,0,0
L2112:	fn_combi_t42 5, 0,1,4,2,4,3
# --- block 104 ---
L2116:	fn_link  L2124
	fn_combi_t29 5, 0,1,4,2,4,3
L2124:	fn_combi_t25 5, 0,4,1,4,2,3
# --- block 105 ---
L2128:	fn_link  L2048
	fn_link  L2100
	fn_link  L2116
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 106 ---
L2144:	fn_link  L2152
	fn_combi_t29 5, 0,1,4,2,4,3
L2152:	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 107 ---
L2156:	fn_link  L2176
	fn_link  PatriciaPure.branchingBit
	fn_link  L2128
	fn_link  L2144
	fn_combi_t10 5, 0,1,4,2,3,0
L2176:	fn_combi_t2 5, 3,0,1,0,0,0
# --- block 108 ---
L2180:	fn_link  PatriciaPure.ptInsert
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 109 ---
L2188:	fn_link  L2196
	fn_combi_t42 6, 0,3,4,1,2,5
L2196:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 110 ---
L2200:	fn_link  L2180
	fn_link  L2188
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 111 ---
L2212:	fn_link  PatriciaPure.ptInsert
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 112 ---
L2220:	fn_link  L2228
	fn_combi_t37 6, 0,2,3,4,1,5
L2228:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 113 ---
L2232:	fn_link  L2212
	fn_link  L2220
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 114 ---
L2244:	fn_link  L2256
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L2256:	fn_elink _error0
# --- block 115 ---
L2260:	fn_link  PatriciaPure.zeroBit
	fn_combi_t42 6, 0,1,2,3,4,5
# --- block 116 ---
L2268:	fn_link  PatriciaPure.matchPrefix
	fn_link  NanoPrelude.not
	fn_combi_t18 5, 0,1,2,4,3,0
# --- block 117 ---
L2280:	fn_link  L2268
	fn_link  L2292
	fn_combi_t18 5, 0,1,2,3,4,0
L2292:	fn_combi_t34 5, 0,1,4,2,4,3
# --- block 118 ---
L2296:	fn_link  L2304
	fn_combi_t45 5, 0,1,4,2,3,4
L2304:	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 119 ---
L2308:	fn_link  L2280
	fn_link  L2296
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 120 ---
L2320:	fn_link  L2260
	fn_link  L2308
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 121 ---
L2332:	fn_link  L2232
	fn_link  L2244
	fn_link  L2320
	fn_link  L2352
	fn_combi_t38 5, 0,1,4,2,3,4
L2352:	fn_combi_t49 5, 0,4,1,2,3,4
# --- block 122 ---
L2356:	fn_link  L2364
	fn_combi_t29 5, 0,1,4,2,4,3
L2364:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 123 ---
L2368:	fn_link  L2332
	fn_link  L2356
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 124 ---
L2380:	fn_link  L2200
	fn_link  L2368
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 125 ---
L2392:	fn_link  PatriciaPure.branchingBit
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 126 ---
L2400:	fn_link  PatriciaPure.maskOf
	fn_link  L2412
	fn_combi_t30 5, 0,4,1,2,4,3
L2412:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 127 ---
L2416:	fn_link  PatriciaPure.maskOf
	fn_link  L2428
	fn_combi_t30 5, 0,4,1,3,4,2
L2428:	fn_combi_t9 7, 6,0,1,2,3,0
# --- block 128 ---
L2432:	fn_link  PatriciaPure.zeroBit
	fn_combi_t42 5, 0,2,4,1,4,3
# --- block 129 ---
L2440:	fn_link  L2416
	fn_link  L2432
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 130 ---
L2452:	fn_link  L2440
	fn_link  L2464
	fn_combi_t7 4, 0,1,2,3,0,0
L2464:	fn_combi_t42 5, 0,1,4,2,4,3
# --- block 131 ---
L2468:	fn_link  L2476
	fn_combi_t29 5, 0,1,4,2,4,3
L2476:	fn_combi_t25 5, 0,4,1,4,2,3
# --- block 132 ---
L2480:	fn_link  L2400
	fn_link  L2452
	fn_link  L2468
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 133 ---
L2496:	fn_link  L2504
	fn_combi_t29 5, 0,1,4,2,4,3
L2504:	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 134 ---
L2508:	fn_link  L2528
	fn_link  L2392
	fn_link  L2480
	fn_link  L2496
	fn_combi_t10 5, 0,1,4,2,3,0
L2528:	fn_combi_t2 5, 3,0,1,0,0,0
# --- block 135 ---
L2532:	fn_link  L2508
	fn_combi_t4 3, 0,1,2,2,0,0
# --- block 136 ---
L2540:	fn_link  L2552
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L2552:	fn_elink _error0
# --- block 137 ---
L2556:	fn_link  L2564
	fn_combi_t44 5, 2,4,0,1,3,4
L2564:	fn_elink _prim_eq
# --- block 138 ---
L2568:	fn_link  L2532
	fn_link  L2540
	fn_link  L2556
	fn_combi_t33 5, 0,1,2,3,4,4
# --- block 139 ---
L2584:	fn_link  L2600
	fn_link  L2568
	fn_link  L2604
	fn_combi_t26 5, 0,1,3,4,2,4
L2600:	fn_combi_t2 5, 3,0,1,0,0,0
L2604:	fn_combi_t42 6, 0,3,4,1,2,3
# --- block 140 ---
L2608:	fn_link  L2616
	fn_combi_t40 5, 1,0,3,4,2,4
L2616:	fn_combi_t2 5, 3,0,1,0,0,0
# --- block 141 ---
L2620:	fn_link  L2584
	fn_link  L2608
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 142 ---
L2632:	fn_link  L2380
	fn_link  L2620
	fn_link  L2648
	fn_combi_t40 5, 0,1,3,4,2,4
L2648:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 143 ---
L2652:	fn_link  L2632
	fn_combi_t42 4, 0,1,3,2,3,3
# --- block 144 ---
PatriciaPure.branchingBit:	fn_link  GExtra.xor
	fn_link  PatriciaPure.highestBit
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 145 ---
PatriciaPure.highestBit:	fn_link  L2692
	fn_link  L2716
	fn_link  L2740
	fn_link  L2840
	fn_combi_t22 5, 0,1,2,3,4,0
# --- block 146 ---
L2692:	fn_link  L2708
	fn_link  GExtra.shiftR
	fn_link  GExtra..$7c.
	fn_combi_t16 4, 0,3,1,3,2,0
L2708:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 147 ---
L2716:	fn_link  L2732
	fn_link  GExtra.shiftR
	fn_link  GExtra..$7c.
	fn_combi_t16 4, 0,3,1,3,2,0
L2732:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 148 ---
L2740:	fn_link  L2756
	fn_link  GExtra.shiftR
	fn_link  GExtra..$7c.
	fn_combi_t16 4, 0,3,1,3,2,0
L2756:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 149 ---
L2764:	fn_link  L2780
	fn_link  GExtra.shiftR
	fn_link  GExtra..$7c.
	fn_combi_t16 4, 0,3,1,3,2,0
L2780:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 150 ---
L2788:	fn_link  L2808
	fn_link  L2832
	fn_link  GExtra.shiftR
	fn_link  GExtra..$7c.
	fn_combi_t30 5, 0,4,1,4,2,3
L2808:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2832:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 151 ---
L2840:	fn_link  L2764
	fn_link  L2864
	fn_link  L2788
	fn_link  L2872
	fn_link  GExtra.shiftR
	fn_combi_t36 6, 0,1,2,4,5,3
L2864:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L2872:	fn_y
# --- block 152 ---
GExtra..$7c.:	fn_link  L2888
	fn_link  L2912
	fn_combi_t8 4, 0,3,2,1,0,0
L2888:	fn_tor a0
	fn_tor a1
	or a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2912:	fn_y
# --- block 153 ---
NanoPrelude.map:	fn_link  L2944
	fn_link  L2928
	fn_combi_t3 3, 0,1,2,0,0,0
L2928:	fn_y
# --- block 154 ---
L2932:	fn_link  L2940
	fn_combi_t15 5, 0,1,3,2,4,0
L2940:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 155 ---
L2944:	fn_link  L2932
	fn_link  L2956
	fn_combi_t16 5, 4,0,1,2,3,0
L2956:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 156 ---
NanoPrelude.fst:	fn_link  L2968
	fn_combi_t1 2, 1,0,0,0,0,0
L2968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 157 ---
GExtra.take:	fn_link  L2988
	fn_link  L3036
	fn_link  L3052
	fn_combi_t24 5, 0,1,3,3,4,2
L2988:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 158 ---
L2992:	fn_link  L3008
	fn_link  L3032
	fn_link  GExtra.take
	fn_combi_t8 4, 0,1,3,2,0,0
L3008:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3032:	fn_y
# --- block 159 ---
L3036:	fn_link  L2992
	fn_link  L3048
	fn_combi_t16 5, 0,3,1,2,4,0
L3048:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 160 ---
L3052:	fn_link  L3068
	fn_link  L3072
	fn_link  GExtra.$3c$3d
	fn_combi_t42 6, 0,4,1,5,2,3
L3068:	fn_combi_t0 2, 0,0,0,0,0,0
L3072:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 161 ---
GExtra.$3c$3d:	fn_link  L3088
	fn_combi_t3 3, 2,1,0,0,0,0
L3088:	fn_elink _prim_leu
# --- block 162 ---
PatriciaPure.pairs:	fn_link  L3104
	fn_link  L3212
	fn_combi_t4 4, 0,2,3,1,0,0
L3104:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 163 ---
L3108:	fn_link  L3124
	fn_link  L3148
	fn_link  PatriciaPure.pairs
	fn_combi_t8 4, 0,1,3,2,0,0
L3124:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3148:	fn_y
# --- block 164 ---
L3152:	fn_link  L3164
	fn_link  L3168
	fn_combi_t40 5, 0,1,3,4,2,4
L3164:	fn_combi_t2 3, 2,0,1,0,0,0
L3168:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 165 ---
L3172:	fn_link  Common.lcgNext
	fn_link  L3108
	fn_link  L3152
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 166 ---
L3188:	fn_link  L3200
	fn_link  L3204
	fn_combi_t45 6, 4,0,1,2,3,5
L3200:	fn_elink _prim_eq
L3204:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 167 ---
L3212:	fn_link  Common.lcgNext
	fn_link  L3172
	fn_link  L3188
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 168 ---
Common.lcgNext:	fn_link  L3244
	fn_link  L3240
	fn_combi_t3 3, 0,1,2,0,0,0
L3240:	fn_y
# --- block 169 ---
L3244:	fn_link  L3268
	fn_link  L3292
	fn_link  L3316
	fn_link  L3324
	fn_link  L3328
	fn_combi_t55 6, 0,1,2,5,3,4
L3268:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3292:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3316:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L3324:	fn_y
L3328:	fn_box
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
