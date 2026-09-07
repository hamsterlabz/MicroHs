# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/PrettyN  (entry @0)
	.text
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.length
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	PrettyN.CAppend
	.globl	PrettyN.CCh
	.globl	PrettyN.CIndent
	.globl	PrettyN.CNewline
	.globl	PrettyN.CNil
	.globl	PrettyN.CStr
	.globl	PrettyN.andL
	.globl	PrettyN.append
	.globl	PrettyN.bench
	.globl	PrettyN.cShow
	.globl	PrettyN.flatten
	.globl	PrettyN.flattenS
	.globl	PrettyN.foldr1L
	.globl	PrettyN.hashS
	.globl	PrettyN.mkIndent
	.globl	PrettyN.orL
	.globl	PrettyN.pp$27SP
	.globl	PrettyN.ppAbove
	.globl	PrettyN.ppAboves
	.globl	PrettyN.ppBeside
	.globl	PrettyN.ppBesideSP
	.globl	PrettyN.ppBesides
	.globl	PrettyN.ppCat
	.globl	PrettyN.ppChar
	.globl	PrettyN.ppHang
	.globl	PrettyN.ppInt
	.globl	PrettyN.ppNil
	.globl	PrettyN.ppShow
	.globl	PrettyN.ppStr
	.globl	PrettyN.prettyPage
	.globl	PrettyN.showI
	.globl	PrettyN.takeL
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  PrettyN.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
PrettyN.bench:	fn_link  PrettyN.prettyPage
L32:	fn_elink PrettyN.hashS
# --- block 3 ---
PrettyN.hashS:	fn_link  L48
	fn_link  L136
L44:	fn_elink NanoPrelude.foldl
L48:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
L64:	fn_link  L124
	fn_link  L132
	fn_combi_t41 6, 0,1,4,2,5,3
L76:	fn_tor a0
L80:	fn_tor a1
L84:	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
L96:	fn_go a0
L100:	fn_tor a0
L104:	fn_tor a1
L108:	mulw a0,a0,a1
	fn_databox a0,a0
L116:	fn_update a0
L120:	fn_go a0
L124:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L132:	fn_y
# --- block 5 ---
L136:	fn_link  L56
	fn_link  L148
	fn_combi_t7 4, 0,1,2,3,0,0
L148:	fn_y
# --- block 6 ---
NanoPrelude.foldl:	fn_link  L168
	fn_link  L164
	fn_combi_t3 3, 0,1,2,0,0,0
L164:	fn_y
# --- block 7 ---
L168:	fn_link  L176
	fn_combi_t46 5, 4,3,0,1,2,3
L176:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 8 ---
PrettyN.prettyPage:	fn_link  L192
	fn_link  L1244
	fn_elink PrettyN.append
# --- block 9 ---
L192:	fn_link  L204
	fn_link  L208
	fn_combi_t2 4, 3,0,1,0,0,0
L204:	fn_combi_t0 2, 0,0,0,0,0,0
L208:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 10 ---
L216:	fn_link  L228
	fn_link  L232
	fn_combi_t2 4, 3,0,1,0,0,0
L228:	fn_combi_t0 2, 0,0,0,0,0,0
L232:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 11 ---
L240:	fn_link  L216
	fn_link  L252
	fn_combi_t2 4, 3,0,1,0,0,0
L252:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 12 ---
L260:	fn_link  L240
	fn_link  L272
	fn_combi_t2 4, 3,0,1,0,0,0
L272:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 13 ---
L280:	fn_link  L260
	fn_link  L292
	fn_combi_t2 4, 3,0,1,0,0,0
L292:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 14 ---
L300:	fn_link  L280
	fn_link  L312
	fn_combi_t2 4, 3,0,1,0,0,0
L312:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 15 ---
L320:	fn_link  L300
	fn_elink PrettyN.ppStr
# --- block 16 ---
L328:	fn_link  L320
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L336:	fn_link  L328
	fn_y
# --- block 18 ---
L344:	fn_link  L336
	fn_link  L356
	fn_elink PrettyN.takeL
L356:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 19 ---
L364:	fn_link  L344
	fn_elink PrettyN.ppCat
# --- block 20 ---
L372:	fn_link  L384
	fn_link  L388
	fn_combi_t2 4, 3,0,1,0,0,0
L384:	fn_combi_t0 2, 0,0,0,0,0,0
L388:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 21 ---
L396:	fn_link  L372
	fn_link  L408
	fn_combi_t2 4, 3,0,1,0,0,0
L408:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 22 ---
L416:	fn_link  L396
	fn_link  L428
	fn_combi_t2 4, 3,0,1,0,0,0
L428:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 23 ---
L436:	fn_link  L416
	fn_link  L448
	fn_combi_t2 4, 3,0,1,0,0,0
L448:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 24 ---
L456:	fn_link  L436
	fn_link  L468
	fn_combi_t2 4, 3,0,1,0,0,0
L468:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 25 ---
L476:	fn_link  L456
	fn_link  L488
	fn_combi_t2 4, 3,0,1,0,0,0
L488:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 26 ---
L496:	fn_link  L476
	fn_link  L508
	fn_combi_t2 4, 3,0,1,0,0,0
L508:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 27 ---
L516:	fn_link  L496
	fn_link  L528
	fn_combi_t2 4, 3,0,1,0,0,0
L528:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 28 ---
L536:	fn_link  L516
	fn_link  L548
	fn_combi_t2 4, 3,0,1,0,0,0
L548:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 29 ---
L556:	fn_link  L536
	fn_link  L568
	fn_combi_t2 4, 3,0,1,0,0,0
L568:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 30 ---
L576:	fn_link  L556
	fn_link  L588
	fn_combi_t2 4, 3,0,1,0,0,0
L588:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 31 ---
L596:	fn_link  L576
	fn_link  L608
	fn_combi_t2 4, 3,0,1,0,0,0
L608:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 32 ---
L616:	fn_link  L596
	fn_link  L628
	fn_combi_t2 4, 3,0,1,0,0,0
L628:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 33 ---
L636:	fn_link  L616
	fn_link  L648
	fn_combi_t2 4, 3,0,1,0,0,0
L648:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 34 ---
L656:	fn_link  L636
	fn_link  L668
	fn_combi_t2 4, 3,0,1,0,0,0
L668:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 35 ---
L676:	fn_link  L656
	fn_link  L688
	fn_combi_t2 4, 3,0,1,0,0,0
L688:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 36 ---
L696:	fn_link  L676
	fn_link  L708
	fn_combi_t2 4, 3,0,1,0,0,0
L708:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 37 ---
L716:	fn_link  L696
	fn_elink PrettyN.ppStr
# --- block 38 ---
L724:	fn_link  L364
	fn_link  L740
	fn_link  L716
	fn_elink PrettyN.ppHang
L740:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 39 ---
L748:	fn_link  L760
	fn_link  L724
	fn_combi_t2 4, 3,0,1,0,0,0
L760:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 40 ---
L764:	fn_link  L748
	fn_link  PrettyN.pp$27SP
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L776:	fn_link  L788
	fn_link  L792
	fn_combi_t2 4, 3,0,1,0,0,0
L788:	fn_combi_t0 2, 0,0,0,0,0,0
L792:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 42 ---
L800:	fn_link  L776
	fn_link  L812
	fn_combi_t2 4, 3,0,1,0,0,0
L812:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 43 ---
L820:	fn_link  L800
	fn_link  L832
	fn_combi_t2 4, 3,0,1,0,0,0
L832:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 44 ---
L840:	fn_link  L820
	fn_link  L852
	fn_combi_t2 4, 3,0,1,0,0,0
L852:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 45 ---
L860:	fn_link  L840
	fn_link  L872
	fn_combi_t2 4, 3,0,1,0,0,0
L872:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 46 ---
L880:	fn_link  L860
	fn_link  L892
	fn_combi_t2 4, 3,0,1,0,0,0
L892:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 47 ---
L900:	fn_link  L880
	fn_link  L912
	fn_combi_t2 4, 3,0,1,0,0,0
L912:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 48 ---
L920:	fn_link  L900
	fn_link  L932
	fn_combi_t2 4, 3,0,1,0,0,0
L932:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 49 ---
L940:	fn_link  L920
	fn_link  L952
	fn_combi_t2 4, 3,0,1,0,0,0
L952:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 50 ---
L960:	fn_link  L940
	fn_link  L972
	fn_combi_t2 4, 3,0,1,0,0,0
L972:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 51 ---
L980:	fn_link  L960
	fn_link  L992
	fn_combi_t2 4, 3,0,1,0,0,0
L992:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 52 ---
L1000:	fn_link  L980
	fn_link  L1012
	fn_combi_t2 4, 3,0,1,0,0,0
L1012:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 53 ---
L1020:	fn_link  L1000
	fn_link  L1032
	fn_combi_t2 4, 3,0,1,0,0,0
L1032:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 54 ---
L1040:	fn_link  L1020
	fn_link  L1052
	fn_combi_t2 4, 3,0,1,0,0,0
L1052:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 55 ---
L1060:	fn_link  L1040
	fn_link  L1072
	fn_combi_t2 4, 3,0,1,0,0,0
L1072:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 56 ---
L1080:	fn_link  L1060
	fn_link  L1092
	fn_combi_t2 4, 3,0,1,0,0,0
L1092:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 57 ---
L1100:	fn_link  L1080
	fn_elink PrettyN.ppStr
# --- block 58 ---
L1108:	fn_link  L1120
	fn_link  L1100
	fn_combi_t2 4, 3,0,1,0,0,0
L1120:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 59 ---
L1124:	fn_link  L1132
	fn_elink PrettyN.ppChar
L1132:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
# --- block 60 ---
L1140:	fn_link  L1108
	fn_link  L1124
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 61 ---
L1152:	fn_link  L1164
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1164:	fn_force
	fn_tor a0
	addiw a0,a0,-42
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 62 ---
L1188:	fn_link  L1152
	fn_y
# --- block 63 ---
L1196:	fn_link  L1188
	fn_elink PrettyN.ppInt
# --- block 64 ---
L1204:	fn_link  L1140
	fn_link  L1196
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 65 ---
L1216:	fn_link  L1204
	fn_elink PrettyN.ppBesides
# --- block 66 ---
L1224:	fn_link  L764
	fn_link  L1216
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 67 ---
L1236:	fn_link  L1224
	fn_elink PrettyN.ppAboves
# --- block 68 ---
L1244:	fn_link  L1236
	fn_link  L1256
	fn_elink PrettyN.ppShow
L1256:	fn_box
	.word 0x00000050	# raw word 80
	fn_box_body
# --- block 69 ---
PrettyN.append:	fn_link  L1272
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 70 ---
L1272:	fn_link  PrettyN.append
	fn_link  L1284
	fn_combi_t16 5, 0,3,1,4,2,0
L1284:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 71 ---
PrettyN.ppShow:	fn_link  L1304
	fn_link  L1308
	fn_link  PrettyN.cShow
	fn_combi_t18 5, 0,4,3,1,2,0
L1304:	fn_combi_t0 4, 0,0,0,0,0,0
L1308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 72 ---
PrettyN.cShow:	fn_link  L1332
	fn_link  L1336
	fn_link  L1340
	fn_link  PrettyN.flatten
	fn_combi_t9 5, 0,1,2,4,3,0
L1332:	fn_combi_t0 2, 0,0,0,0,0,0
L1336:	fn_combi_t0 2, 1,0,0,0,0,0
L1340:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 73 ---
PrettyN.flatten:	fn_link  L1440
	fn_link  L2012
	fn_link  L2044
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 74 ---
L1364:	fn_link  L1372
	fn_combi_t47 6, 2,4,0,1,5,3
L1372:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 75 ---
L1376:	fn_link  L1388
	fn_link  L1392
	fn_combi_t45 6, 0,4,1,5,2,3
L1388:	fn_elink _prim_lt
L1392:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 76 ---
L1400:	fn_link  L1416
	fn_link  L1364
	fn_link  L1376
	fn_combi_t19 5, 0,1,2,3,4,0
L1416:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 77 ---
L1420:	fn_link  L1428
	fn_combi_t24 6, 0,1,5,2,3,4
L1428:	fn_combi_t49 5, 0,4,4,1,2,3
# --- block 78 ---
L1432:	fn_link  L1420
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 79 ---
L1440:	fn_link  PrettyN.flattenS
	fn_link  L1400
	fn_link  L1432
	fn_combi_t26 6, 0,1,3,5,2,4
# --- block 80 ---
L1456:	fn_link  L1472
	fn_link  L1496
	fn_link  PrettyN.flatten
	fn_combi_t36 6, 0,1,3,5,2,4
L1472:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1496:	fn_y
# --- block 81 ---
L1500:	fn_link  L1456
	fn_combi_t23 6, 0,1,2,4,5,3
# --- block 82 ---
L1508:	fn_link  L1528
	fn_link  PrettyN.flattenS
	fn_link  L1532
	fn_link  L1540
	fn_combi_t58 6, 5,0,1,2,3,4
L1528:	fn_combi_t0 2, 1,0,0,0,0,0
L1532:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1540:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 83 ---
L1544:	fn_link  L1560
	fn_link  PrettyN.flattenS
	fn_link  PrettyN.append
	fn_combi_t16 5, 0,4,1,2,3,0
L1560:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 84 ---
L1564:	fn_link  L1544
	fn_link  PrettyN.mkIndent
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 85 ---
L1576:	fn_link  L1592
	fn_link  L1596
	fn_link  L1600
	fn_combi_t38 6, 0,4,1,2,5,3
L1592:	fn_elink _error0
L1596:	fn_elink _prim_eq
L1600:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 86 ---
L1608:	fn_link  L1624
	fn_link  PrettyN.flattenS
	fn_link  L1628
	fn_combi_t16 5, 0,4,1,2,3,0
L1624:	fn_combi_t0 2, 0,0,0,0,0,0
L1628:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 87 ---
L1632:	fn_link  L1608
	fn_link  PrettyN.mkIndent
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 88 ---
L1644:	fn_link  L1656
	fn_link  L1660
	fn_combi_t45 6, 0,4,1,5,2,3
L1656:	fn_elink _prim_lt
L1660:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 89 ---
L1668:	fn_link  L1632
	fn_link  L1644
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 90 ---
L1680:	fn_link  L1688
	fn_combi_t45 5, 0,1,4,2,3,4
L1688:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 91 ---
L1692:	fn_link  L1564
	fn_link  L1576
	fn_link  L1668
	fn_link  L1680
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 92 ---
L1712:	fn_link  L1692
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 93 ---
L1720:	fn_link  L1736
	fn_link  PrettyN.flattenS
	fn_link  PrettyN.append
	fn_combi_t16 5, 0,4,1,2,3,0
L1736:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 94 ---
L1740:	fn_link  L1756
	fn_link  L1760
	fn_link  L1764
	fn_combi_t38 6, 0,4,1,2,5,3
L1756:	fn_elink _error0
L1760:	fn_elink _prim_eq
L1764:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 95 ---
L1772:	fn_link  L1788
	fn_link  PrettyN.flattenS
	fn_link  L1792
	fn_combi_t16 5, 0,4,1,2,3,0
L1788:	fn_combi_t0 2, 0,0,0,0,0,0
L1792:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1796:	fn_link  L1772
	fn_link  L1812
	fn_link  L1816
	fn_combi_t45 6, 0,4,1,5,2,3
L1812:	fn_elink _prim_lt
L1816:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 97 ---
L1824:	fn_link  L1720
	fn_link  L1740
	fn_link  L1796
	fn_link  L1844
	fn_combi_t45 5, 0,1,4,2,3,4
L1844:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 98 ---
L1848:	fn_link  L1824
	fn_combi_t41 5, 1,3,0,4,2,4
# --- block 99 ---
L1856:	fn_link  L1712
	fn_link  L1848
	fn_combi_t30 5, 0,3,1,2,4,4
# --- block 100 ---
L1868:	fn_link  L1880
	fn_link  L1884
	fn_combi_t38 6, 0,4,1,2,3,5
L1880:	fn_elink _prim_eq
L1884:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 101 ---
L1892:	fn_link  L1868
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 102 ---
L1900:	fn_link  L1508
	fn_link  L1856
	fn_link  L1892
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 103 ---
L1916:	fn_link  L1928
	fn_link  L1932
	fn_combi_t44 5, 0,3,1,2,3,4
L1928:	fn_elink _prim_lt
L1932:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 104 ---
L1940:	fn_link  L1900
	fn_link  L1916
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 105 ---
L1952:	fn_link  L1960
	fn_combi_t38 5, 0,1,3,4,2,4
L1960:	fn_combi_t37 5, 0,1,3,4,4,2
# --- block 106 ---
L1964:	fn_link  L1940
	fn_link  L1952
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 107 ---
L1976:	fn_link  L1500
	fn_link  L1964
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 108 ---
L1988:	fn_link  L2000
	fn_link  L2004
	fn_combi_t44 5, 0,3,1,2,3,4
L2000:	fn_elink _prim_lt
L2004:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 109 ---
L2012:	fn_link  L1976
	fn_link  L1988
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 110 ---
L2024:	fn_link  L2032
	fn_combi_t57 5, 3,0,1,4,2,4
L2032:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 111 ---
L2036:	fn_link  L2024
	fn_combi_t29 5, 0,1,4,2,3,4
# --- block 112 ---
L2044:	fn_link  L2036
	fn_link  L2056
	fn_combi_t57 5, 0,1,2,4,3,4
L2056:	fn_y
# --- block 113 ---
PrettyN.flattenS:	fn_link  L2084
	fn_link  L2072
	fn_combi_t6 4, 3,0,1,2,0,0
L2072:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 114 ---
L2076:	fn_link  PrettyN.flatten
	fn_combi_t9 5, 0,3,1,4,2,0
# --- block 115 ---
L2084:	fn_link  L2076
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 116 ---
PrettyN.mkIndent:	fn_link  L2240
	fn_link  L2288
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 117 ---
L2104:	fn_link  L2120
	fn_link  L2144
	fn_link  PrettyN.mkIndent
	fn_combi_t8 4, 0,1,3,2,0,0
L2120:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2144:	fn_y
# --- block 118 ---
L2148:	fn_link  L2104
	fn_link  L2164
	fn_link  L2172
	fn_combi_t16 5, 0,1,2,3,4,0
L2164:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
L2172:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 119 ---
L2176:	fn_link  L2148
	fn_link  L2192
	fn_link  L2196
	fn_combi_t44 5, 0,3,1,2,3,4
L2192:	fn_elink _prim_ge
L2196:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 120 ---
L2204:	fn_link  L2224
	fn_link  L2232
	fn_link  L2176
	fn_link  L2236
	fn_combi_t10 5, 0,1,4,2,3,0
L2224:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L2232:	fn_combi_t2 4, 3,0,1,0,0,0
L2236:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 121 ---
L2240:	fn_link  L2260
	fn_link  L2284
	fn_link  PrettyN.mkIndent
	fn_link  L2204
	fn_combi_t50 5, 0,4,1,2,4,3
L2260:	fn_force
	fn_tor a0
	addiw a0,a0,-8
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2284:	fn_y
# --- block 122 ---
L2288:	fn_link  L2300
	fn_link  L2304
	fn_combi_t29 5, 3,0,1,2,4,4
L2300:	fn_elink _prim_eq
L2304:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 123 ---
PrettyN.ppAboves:	fn_link  L2324
	fn_link  PrettyN.ppNil
	fn_combi_t6 3, 2,0,1,2,0,0
# --- block 124 ---
L2324:	fn_link  PrettyN.ppAbove
	fn_link  PrettyN.foldr1L
	fn_combi_t2 5, 0,1,2,0,0,0
# --- block 125 ---
PrettyN.ppNil:	fn_link  L2376
	fn_link  L2360
	fn_link  L2364
	fn_link  PrettyN.CNil
	fn_link  L2372
	fn_combi_t37 7, 0,1,2,3,4,5
L2360:	fn_combi_t0 2, 1,0,0,0,0,0
L2364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2372:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 126 ---
L2376:	fn_link  L2396
	fn_link  L2400
	fn_link  L2404
	fn_link  L2408
	fn_combi_t10 5, 0,4,1,2,3,0
L2396:	fn_combi_t0 2, 1,0,0,0,0,0
L2400:	fn_combi_t0 2, 0,0,0,0,0,0
L2404:	fn_elink _prim_ge
L2408:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 127 ---
PrettyN.CNil:	fn_link  L2428
	fn_link  L2432
	fn_combi_t2 3, 2,0,1,0,0,0
L2428:	fn_combi_t0 1, 0,0,0,0,0,0
L2432:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 128 ---
PrettyN.foldr1L:	fn_link  L2456
	fn_link  L2452
	fn_combi_t3 3, 0,1,2,0,0,0
L2452:	fn_y
# --- block 129 ---
L2456:	fn_link  L2472
	fn_link  L2476
	fn_link  L2480
	fn_combi_t47 6, 5,0,1,2,3,4
L2472:	fn_combi_t6 6, 0,2,1,3,0,0
L2476:	fn_combi_t46 4, 3,2,0,1,2,3
L2480:	fn_elink _error0
# --- block 130 ---
PrettyN.ppAbove:	fn_link  L2496
	fn_link  L2684
	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 131 ---
L2496:	fn_link  L2504
	fn_combi_t2 3, 1,2,0,0,0,0
L2504:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 132 ---
L2508:	fn_link  L2516
	fn_combi_t2 3, 1,2,0,0,0,0
L2516:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 133 ---
L2520:	fn_link  PrettyN.andL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 134 ---
L2528:	fn_link  PrettyN.CNil
	fn_link  PrettyN.CNewline
	fn_link  PrettyN.orL
	fn_link  PrettyN.CAppend
	fn_combi_t51 6, 0,1,5,4,2,3
# --- block 135 ---
L2548:	fn_link  L2560
	fn_link  L2528
	fn_combi_t14 5, 0,3,4,2,1,0
L2560:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 136 ---
L2564:	fn_link  L2580
	fn_link  PrettyN.CAppend
	fn_link  L2584
	fn_combi_t57 6, 0,1,4,2,3,5
L2580:	fn_combi_t0 4, 0,0,0,0,0,0
L2584:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 137 ---
L2588:	fn_link  L2548
	fn_link  L2564
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 138 ---
L2600:	fn_link  L2608
	fn_combi_t24 6, 0,1,5,2,3,4
L2608:	fn_combi_t39 5, 0,4,1,2,3,4
# --- block 139 ---
L2612:	fn_link  L2628
	fn_link  L2588
	fn_link  L2600
	fn_combi_t26 5, 0,1,3,4,3,2
L2628:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 140 ---
L2632:	fn_link  L2520
	fn_link  L2612
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 141 ---
L2644:	fn_link  L2664
	fn_link  L2668
	fn_link  L2632
	fn_link  L2672
	fn_combi_t24 6, 0,1,5,2,3,4
L2664:	fn_combi_t0 4, 2,0,0,0,0,0
L2668:	fn_combi_t0 2, 0,0,0,0,0,0
L2672:	fn_combi_t28 5, 0,4,3,3,2,1
# --- block 142 ---
L2676:	fn_link  L2644
	fn_combi_t38 6, 0,1,3,4,4,2
# --- block 143 ---
L2684:	fn_link  L2700
	fn_link  L2508
	fn_link  L2676
	fn_combi_t5 4, 0,1,3,2,0,0
L2700:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 144 ---
PrettyN.CAppend:	fn_link  L2716
	fn_link  L2720
	fn_combi_t16 5, 4,0,1,2,3,0
L2716:	fn_combi_t2 3, 2,0,1,0,0,0
L2720:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 145 ---
PrettyN.orL:	fn_link  L2736
	fn_combi_t2 3, 1,2,0,0,0,0
L2736:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 146 ---
PrettyN.CNewline:	fn_link  L2752
	fn_link  L2756
	fn_combi_t2 3, 2,0,1,0,0,0
L2752:	fn_combi_t0 1, 0,0,0,0,0,0
L2756:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 147 ---
PrettyN.andL:	fn_link  L2772
	fn_combi_t1 2, 1,0,0,0,0,0
L2772:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 148 ---
PrettyN.ppBesides:	fn_link  L2788
	fn_link  PrettyN.ppNil
	fn_combi_t6 3, 2,0,1,2,0,0
# --- block 149 ---
L2788:	fn_link  PrettyN.ppBeside
	fn_link  PrettyN.foldr1L
	fn_combi_t2 5, 0,1,2,0,0,0
# --- block 150 ---
PrettyN.ppBeside:	fn_link  L2812
	fn_link  L3144
	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 151 ---
L2812:	fn_link  L2820
	fn_combi_t2 3, 1,2,0,0,0,0
L2820:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 152 ---
L2824:	fn_link  L2832
	fn_combi_t1 2, 1,0,0,0,0,0
L2832:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 153 ---
L2836:	fn_link  L2852
	fn_link  L2856
	fn_link  L2880
	fn_combi_t36 6, 3,0,5,4,1,2
L2852:	fn_combi_t0 2, 0,0,0,0,0,0
L2856:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2880:	fn_y
# --- block 154 ---
L2884:	fn_link  L2908
	fn_link  L2912
	fn_link  L2916
	fn_link  L2920
	fn_link  PrettyN.andL
	fn_combi_t52 6, 0,1,5,2,3,4
L2908:	fn_combi_t0 2, 1,0,0,0,0,0
L2912:	fn_combi_t0 2, 0,0,0,0,0,0
L2916:	fn_elink _prim_ge
L2920:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 155 ---
L2928:	fn_link  L2948
	fn_link  PrettyN.andL
	fn_link  L2884
	fn_link  L2952
	fn_combi_t10 5, 0,1,4,2,3,0
L2948:	fn_combi_t0 4, 3,0,0,0,0,0
L2952:	fn_combi_t57 5, 0,1,3,2,4,2
# --- block 156 ---
L2956:	fn_link  L2968
	fn_link  PrettyN.andL
	fn_combi_t15 4, 0,2,1,3,1,0
L2968:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 157 ---
L2972:	fn_link  L2988
	fn_link  L3012
	fn_link  L3016
	fn_combi_t20 5, 0,4,1,3,2,0
L2988:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3012:	fn_combi_t0 4, 1,0,0,0,0,0
L3016:	fn_y
# --- block 158 ---
L3020:	fn_link  L3032
	fn_link  PrettyN.CIndent
	fn_combi_t6 4, 0,2,3,1,0,0
L3032:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 159 ---
L3036:	fn_link  L3052
	fn_link  PrettyN.CAppend
	fn_link  L3056
	fn_combi_t57 6, 0,1,3,2,4,5
L3052:	fn_combi_t0 4, 0,0,0,0,0,0
L3056:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 160 ---
L3060:	fn_link  L3020
	fn_link  L3036
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 161 ---
L3072:	fn_link  L3080
	fn_combi_t29 5, 0,1,4,2,4,3
L3080:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 162 ---
L3084:	fn_link  L2956
	fn_link  L2972
	fn_link  L3060
	fn_link  L3072
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 163 ---
L3104:	fn_link  L3084
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 164 ---
L3112:	fn_link  L2928
	fn_link  L3104
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 165 ---
L3124:	fn_link  L3112
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 166 ---
L3132:	fn_link  L2836
	fn_link  L3124
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 167 ---
L3144:	fn_link  L2824
	fn_link  L3132
	fn_combi_t37 6, 0,2,3,4,1,4
# --- block 168 ---
PrettyN.CIndent:	fn_link  L3168
	fn_link  L3172
	fn_combi_t16 5, 4,0,1,2,3,0
L3168:	fn_combi_t2 3, 2,0,1,0,0,0
L3172:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 169 ---
PrettyN.ppInt:	fn_link  PrettyN.showI
	fn_link  PrettyN.ppStr
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 170 ---
PrettyN.ppStr:	fn_link  NanoPrelude.length
	fn_link  L3256
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 171 ---
L3204:	fn_link  L3220
	fn_link  L3224
	fn_link  L3228
	fn_combi_t10 5, 4,3,0,1,2,0
L3220:	fn_combi_t0 2, 1,0,0,0,0,0
L3224:	fn_combi_t0 2, 0,0,0,0,0,0
L3228:	fn_elink _prim_ge
# --- block 172 ---
L3232:	fn_link  L3248
	fn_link  PrettyN.CStr
	fn_link  L3252
	fn_combi_t10 5, 0,1,3,4,2,0
L3248:	fn_combi_t0 2, 0,0,0,0,0,0
L3252:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 173 ---
L3256:	fn_link  L3204
	fn_link  L3232
	fn_combi_t42 6, 0,2,3,1,4,3
# --- block 174 ---
PrettyN.CStr:	fn_link  L3280
	fn_link  L3284
	fn_combi_t6 4, 3,0,1,2,0,0
L3280:	fn_combi_t1 2, 1,0,0,0,0,0
L3284:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 175 ---
NanoPrelude.length:	fn_link  L3304
	fn_link  L3352
	fn_y
L3304:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 176 ---
L3312:	fn_link  L3324
	fn_link  L3348
	fn_combi_t8 5, 2,0,3,1,0,0
L3324:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3348:	fn_y
# --- block 177 ---
L3352:	fn_link  L3312
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 178 ---
PrettyN.showI:	fn_link  L3568
	fn_link  L3380
	fn_link  L3580
	fn_link  L3672
	fn_combi_t39 5, 0,4,1,4,2,3
L3380:	fn_y
# --- block 179 ---
L3384:	fn_link  L3400
	fn_link  L3404
	fn_link  L3428
	fn_combi_t13 6, 5,0,3,1,2,0
L3400:	fn_combi_t0 2, 0,0,0,0,0,0
L3404:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3428:	fn_y
# --- block 180 ---
L3432:	fn_link  L3452
	fn_link  L3476
	fn_link  NanoPrelude.rem
	fn_link  L3484
	fn_combi_t18 5, 0,1,4,2,3,0
L3452:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3476:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3484:	fn_y
# --- block 181 ---
L3488:	fn_link  L3500
	fn_link  L3432
	fn_combi_t5 5, 4,0,2,1,0,0
L3500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 182 ---
L3504:	fn_link  L3520
	fn_link  NanoPrelude.quot
	fn_link  PrettyN.append
	fn_combi_t21 5, 0,3,1,4,2,0
L3520:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 183 ---
L3528:	fn_link  L3488
	fn_link  L3504
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 184 ---
L3540:	fn_link  L3528
	fn_link  L3556
	fn_link  L3560
	fn_combi_t44 5, 0,4,1,2,3,4
L3556:	fn_elink _prim_lt
L3560:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 185 ---
L3568:	fn_link  L3384
	fn_link  L3540
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 186 ---
L3580:	fn_link  L3596
	fn_link  L3620
	fn_link  L3628
	fn_combi_t22 5, 4,0,3,1,2,0
L3596:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3620:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3628:	fn_y
# --- block 187 ---
L3632:	fn_link  L3644
	fn_link  L3648
	fn_combi_t15 4, 0,2,1,3,2,0
L3644:	fn_elink _prim_lt
L3648:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 188 ---
L3656:	fn_link  L3668
	fn_link  L3632
	fn_combi_t3 3, 0,1,2,0,0,0
L3668:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 189 ---
L3672:	fn_link  L3692
	fn_link  L3700
	fn_link  L3656
	fn_link  L3704
	fn_combi_t10 5, 0,1,4,2,3,0
L3692:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L3700:	fn_combi_t2 4, 3,0,1,0,0,0
L3704:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 190 ---
NanoPrelude.quot:	fn_link  L3720
	fn_link  L3744
	fn_combi_t8 4, 0,3,2,1,0,0
L3720:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3744:	fn_y
# --- block 191 ---
NanoPrelude.rem:	fn_link  L3760
	fn_link  L3784
	fn_combi_t8 4, 0,3,2,1,0,0
L3760:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3784:	fn_y
# --- block 192 ---
PrettyN.ppChar:	fn_link  L3800
	fn_link  L3840
	fn_combi_t2 3, 0,2,1,0,0,0
L3800:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 193 ---
L3804:	fn_link  L3824
	fn_link  L3828
	fn_link  PrettyN.CCh
	fn_link  L3836
	fn_combi_t24 7, 0,1,4,2,3,5
L3824:	fn_combi_t0 2, 0,0,0,0,0,0
L3828:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3836:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 194 ---
L3840:	fn_link  L3864
	fn_link  L3868
	fn_link  L3872
	fn_link  L3804
	fn_link  L3880
	fn_combi_t24 6, 0,1,5,2,3,4
L3864:	fn_combi_t0 2, 0,0,0,0,0,0
L3868:	fn_elink _prim_ge
L3872:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3880:	fn_combi_t52 6, 0,1,5,2,3,4
# --- block 195 ---
PrettyN.CCh:	fn_link  L3896
	fn_link  L3900
	fn_combi_t6 4, 3,0,1,2,0,0
L3896:	fn_combi_t1 2, 1,0,0,0,0,0
L3900:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 196 ---
PrettyN.pp$27SP:	fn_link  L3940
	fn_elink PrettyN.ppStr
# --- block 197 ---
L3916:	fn_link  L3928
	fn_link  L3932
	fn_combi_t2 4, 3,0,1,0,0,0
L3928:	fn_combi_t0 2, 0,0,0,0,0,0
L3932:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 198 ---
L3940:	fn_link  L3916
	fn_link  L3952
	fn_combi_t2 4, 3,0,1,0,0,0
L3952:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 199 ---
PrettyN.ppHang:	fn_link  L3976
	fn_link  L4752
	fn_link  L4776
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 200 ---
L3976:	fn_link  L3992
	fn_link  L3996
	fn_link  L4020
	fn_combi_t36 6, 4,0,3,5,1,2
L3992:	fn_combi_t0 2, 0,0,0,0,0,0
L3996:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4020:	fn_y
# --- block 201 ---
L4024:	fn_link  L4032
	fn_combi_t1 2, 1,0,0,0,0,0
L4032:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 202 ---
L4036:	fn_link  L4052
	fn_link  L4076
	fn_link  L4100
	fn_combi_t57 5, 0,0,4,1,3,2
L4052:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4076:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4100:	fn_y
# --- block 203 ---
L4104:	fn_link  L4116
	fn_link  L4036
	fn_combi_t12 5, 2,0,3,4,1,0
L4116:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 204 ---
L4120:	fn_link  L4128
	fn_combi_t1 2, 1,0,0,0,0,0
L4128:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 205 ---
L4132:	fn_link  L4152
	fn_link  L4176
	fn_link  L4200
	fn_link  L4204
	fn_combi_t47 6, 5,0,1,4,2,3
L4152:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4176:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4200:	fn_y
L4204:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 206 ---
L4208:	fn_link  L4132
	fn_link  L4220
	fn_combi_t7 4, 0,1,2,3,0,0
L4220:	fn_y
# --- block 207 ---
L4224:	fn_link  L4244
	fn_link  L4248
	fn_link  L4272
	fn_link  PrettyN.CIndent
	fn_combi_t41 6, 0,1,4,2,5,3
L4244:	fn_combi_t0 4, 0,0,0,0,0,0
L4248:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4272:	fn_y
# --- block 208 ---
L4276:	fn_link  L4292
	fn_link  PrettyN.CCh
	fn_link  PrettyN.CAppend
	fn_combi_t20 4, 0,0,3,1,2,0
L4292:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 209 ---
L4300:	fn_link  L4308
	fn_combi_t41 5, 0,1,2,4,3,4
L4308:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 210 ---
L4312:	fn_link  L4276
	fn_link  L4300
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 211 ---
L4324:	fn_link  L4208
	fn_link  L4224
	fn_link  L4312
	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 212 ---
L4340:	fn_link  L4352
	fn_link  L4324
	fn_combi_t9 5, 0,2,3,4,1,0
L4352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 213 ---
L4356:	fn_link  L4364
	fn_combi_t24 6, 0,1,5,2,3,4
L4364:	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 214 ---
L4368:	fn_link  L4388
	fn_link  PrettyN.andL
	fn_link  L4340
	fn_link  L4356
	fn_combi_t24 6, 0,1,5,2,4,3
L4388:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 215 ---
L4392:	fn_link  L4412
	fn_link  PrettyN.CIndent
	fn_link  PrettyN.CNewline
	fn_link  PrettyN.CAppend
	fn_combi_t48 6, 0,1,2,4,5,3
L4412:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 216 ---
L4416:	fn_link  PrettyN.CAppend
	fn_link  L4428
	fn_combi_t40 6, 0,1,5,2,4,3
L4428:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 217 ---
L4432:	fn_link  L4448
	fn_link  L4392
	fn_link  L4416
	fn_combi_t26 5, 0,1,3,4,2,4
L4448:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 218 ---
L4452:	fn_link  L4472
	fn_link  L4476
	fn_link  L4480
	fn_link  PrettyN.orL
	fn_combi_t52 6, 0,4,5,1,2,3
L4472:	fn_combi_t0 2, 1,0,0,0,0,0
L4476:	fn_combi_t0 2, 0,0,0,0,0,0
L4480:	fn_elink _prim_le
# --- block 219 ---
L4484:	fn_link  L4452
	fn_link  L4496
	fn_combi_t3 3, 0,1,2,0,0,0
L4496:	fn_combi_t42 5, 0,3,4,1,2,2
# --- block 220 ---
L4500:	fn_link  L4484
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 221 ---
L4508:	fn_link  L4524
	fn_link  L4432
	fn_link  L4500
	fn_combi_t11 4, 0,3,1,3,2,0
L4524:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 222 ---
L4528:	fn_link  L4536
	fn_combi_t48 5, 1,0,2,4,3,4
L4536:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 223 ---
L4540:	fn_link  L4528
	fn_link  L4552
	fn_combi_t3 3, 0,1,2,0,0,0
L4552:	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 224 ---
L4556:	fn_link  L4540
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 225 ---
L4564:	fn_link  L4556
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 226 ---
L4572:	fn_link  L4368
	fn_link  L4508
	fn_link  L4564
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 227 ---
L4588:	fn_link  L4596
	fn_combi_t24 6, 0,1,5,2,3,4
L4596:	fn_combi_t42 6, 0,4,5,1,2,3
# --- block 228 ---
L4600:	fn_link  L4588
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 229 ---
L4608:	fn_link  L4600
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 230 ---
L4616:	fn_link  L4608
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 231 ---
L4624:	fn_link  L4572
	fn_link  L4616
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 232 ---
L4636:	fn_link  L4644
	fn_combi_t32 6, 0,1,3,4,5,2
L4644:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 233 ---
L4648:	fn_link  L4120
	fn_link  L4624
	fn_link  L4636
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 234 ---
L4664:	fn_link  L4672
	fn_combi_t32 6, 0,1,2,4,5,3
L4672:	fn_combi_t37 5, 0,2,4,3,1,3
# --- block 235 ---
L4676:	fn_link  L4664
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 236 ---
L4684:	fn_link  L4104
	fn_link  L4648
	fn_link  L4676
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 237 ---
L4700:	fn_link  L4708
	fn_combi_t24 6, 0,1,5,2,3,4
L4708:	fn_combi_t39 4, 0,3,1,3,3,2
# --- block 238 ---
L4712:	fn_link  L4700
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 239 ---
L4720:	fn_link  L4712
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 240 ---
L4728:	fn_link  L4748
	fn_link  L4024
	fn_link  L4684
	fn_link  L4720
	fn_combi_t10 5, 0,1,4,2,3,0
L4748:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 241 ---
L4752:	fn_link  L4768
	fn_link  L4728
	fn_link  L4772
	fn_combi_t10 5, 0,1,4,3,2,0
L4768:	fn_combi_t0 2, 0,0,0,0,0,0
L4772:	fn_combi_t42 5, 0,3,4,1,4,2
# --- block 242 ---
L4776:	fn_link  L4784
	fn_combi_t38 5, 0,1,2,4,3,4
L4784:	fn_combi_t37 5, 0,1,3,4,2,3
# --- block 243 ---
PrettyN.ppCat:	fn_link  L4800
	fn_link  PrettyN.ppNil
	fn_combi_t6 3, 2,0,1,2,0,0
# --- block 244 ---
L4800:	fn_link  PrettyN.ppBesideSP
	fn_link  PrettyN.foldr1L
	fn_combi_t2 5, 0,1,2,0,0,0
# --- block 245 ---
PrettyN.ppBesideSP:	fn_link  L4824
	fn_link  L5364
	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 246 ---
L4824:	fn_link  L4832
	fn_combi_t2 3, 1,2,0,0,0,0
L4832:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 247 ---
L4836:	fn_link  L4844
	fn_combi_t1 2, 1,0,0,0,0,0
L4844:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 248 ---
L4848:	fn_link  L4868
	fn_link  L4876
	fn_link  L4900
	fn_link  L4904
	fn_combi_t35 6, 5,0,4,1,2,3
L4868:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4876:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4900:	fn_combi_t0 4, 1,0,0,0,0,0
L4904:	fn_y
# --- block 249 ---
L4908:	fn_link  L4924
	fn_link  L4928
	fn_link  L4952
	fn_combi_t36 6, 3,0,5,4,1,2
L4924:	fn_combi_t0 2, 0,0,0,0,0,0
L4928:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4952:	fn_y
# --- block 250 ---
L4956:	fn_link  L4968
	fn_link  PrettyN.andL
	fn_combi_t15 4, 0,2,1,3,1,0
L4968:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 251 ---
L4972:	fn_link  L4992
	fn_link  L4996
	fn_link  L5000
	fn_link  L5008
	fn_combi_t28 6, 5,0,1,4,2,3
L4992:	fn_combi_t0 2, 0,0,0,0,0,0
L4996:	fn_elink _prim_ge
L5000:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5008:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 252 ---
L5016:	fn_link  L5032
	fn_link  L5056
	fn_link  L5060
	fn_combi_t20 5, 0,4,1,3,2,0
L5032:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5056:	fn_combi_t0 4, 1,0,0,0,0,0
L5060:	fn_y
# --- block 253 ---
L5064:	fn_link  L5076
	fn_link  PrettyN.CIndent
	fn_combi_t6 4, 0,2,3,1,0,0
L5076:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 254 ---
L5080:	fn_link  PrettyN.CNil
	fn_link  L5100
	fn_link  PrettyN.CCh
	fn_link  PrettyN.orL
	fn_combi_t28 6, 0,4,5,1,2,3
L5100:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 255 ---
L5108:	fn_link  PrettyN.CAppend
	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 256 ---
L5116:	fn_link  L5064
	fn_link  L5080
	fn_link  L5108
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 257 ---
L5132:	fn_link  L5148
	fn_link  PrettyN.CAppend
	fn_link  L5152
	fn_combi_t57 6, 0,1,3,2,4,5
L5148:	fn_combi_t0 4, 0,0,0,0,0,0
L5152:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 258 ---
L5156:	fn_link  L5116
	fn_link  L5132
	fn_combi_t46 6, 0,2,1,3,4,5
# --- block 259 ---
L5168:	fn_link  L5176
	fn_combi_t29 5, 0,1,4,2,4,3
L5176:	fn_combi_t42 5, 0,4,1,2,3,4
# --- block 260 ---
L5180:	fn_link  L5168
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 261 ---
L5188:	fn_link  PrettyN.andL
	fn_link  L5016
	fn_link  L5156
	fn_link  L5180
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 262 ---
L5208:	fn_link  L5188
	fn_combi_t23 5, 0,1,2,3,4,2
# --- block 263 ---
L5216:	fn_link  L5224
	fn_combi_t24 6, 0,1,5,2,3,4
L5224:	fn_combi_t47 6, 0,5,1,2,3,4
# --- block 264 ---
L5228:	fn_link  L5216
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 265 ---
L5236:	fn_link  L5228
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 266 ---
L5244:	fn_link  L4972
	fn_link  PrettyN.andL
	fn_link  L5208
	fn_link  L5236
	fn_combi_t38 6, 0,1,5,2,3,4
# --- block 267 ---
L5264:	fn_link  L5276
	fn_link  L5244
	fn_combi_t9 5, 0,2,3,4,1,0
L5276:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 268 ---
L5280:	fn_link  L5288
	fn_combi_t26 6, 0,1,4,5,2,3
L5288:	fn_combi_t39 4, 0,3,1,3,3,2
# --- block 269 ---
L5292:	fn_link  L5280
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 270 ---
L5300:	fn_link  L5320
	fn_link  L4956
	fn_link  L5264
	fn_link  L5292
	fn_combi_t10 5, 0,1,4,2,3,0
L5320:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 271 ---
L5324:	fn_link  L4908
	fn_link  L5300
	fn_link  L5340
	fn_combi_t44 5, 0,1,4,2,3,4
L5340:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 272 ---
L5344:	fn_link  L4848
	fn_link  L5324
	fn_link  L5360
	fn_combi_t12 5, 0,1,3,4,2,0
L5360:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 273 ---
L5364:	fn_link  L4836
	fn_link  L5344
	fn_combi_t37 6, 0,2,3,4,1,4
# --- block 274 ---
PrettyN.takeL:	fn_link  L5392
	fn_link  L5440
	fn_link  L5456
	fn_combi_t24 5, 0,1,3,3,4,2
L5392:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 275 ---
L5396:	fn_link  L5412
	fn_link  L5436
	fn_link  PrettyN.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L5412:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5436:	fn_y
# --- block 276 ---
L5440:	fn_link  L5396
	fn_link  L5452
	fn_combi_t16 5, 0,3,1,2,4,0
L5452:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 277 ---
L5456:	fn_link  L5472
	fn_link  L5476
	fn_link  L5480
	fn_combi_t44 6, 0,4,1,5,2,3
L5472:	fn_combi_t0 2, 0,0,0,0,0,0
L5476:	fn_elink _prim_le
L5480:	fn_box
	.word 0x00000000	# raw word 0
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
_unimpprim_addiw$20$2d42:
	la a0, _unimpprim_addiw$20$2d42$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d42$name:
	.asciz "addiw -42"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$20$2d8:
	la a0, _unimpprim_addiw$20$2d8$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d8$name:
	.asciz "addiw -8"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$201:
	la a0, _unimpprim_addiw$201$name
	tail _unimpfi_halt
_unimpprim_addiw$201$name:
	.asciz "addiw 1"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$2048:
	la a0, _unimpprim_addiw$2048$name
	tail _unimpfi_halt
_unimpprim_addiw$2048$name:
	.asciz "addiw 48"
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
