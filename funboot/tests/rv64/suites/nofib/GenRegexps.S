# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/GenRegexps  (entry @0)
	.text
	.globl	GenRegexps.alphabeticRule
	.globl	GenRegexps.app
	.globl	GenRegexps.bench
	.globl	GenRegexps.concatS
	.globl	GenRegexps.constantRule
	.globl	GenRegexps.expand
	.globl	GenRegexps.hashS
	.globl	GenRegexps.numericRule
	.globl	GenRegexps.pat0
	.globl	GenRegexps.revS
	.globl	GenRegexps.spanNe
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.max
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  GenRegexps.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
GenRegexps.bench:	fn_link  L44
	fn_elink GenRegexps.hashS
# --- block 3 ---
L36:	fn_link  GenRegexps.pat0
	fn_elink GenRegexps.expand
# --- block 4 ---
L44:	fn_link  L36
L48:	fn_elink GenRegexps.concatS
# --- block 5 ---
GenRegexps.hashS:	fn_link  L64
L56:	fn_link  L152
L60:	fn_elink NanoPrelude.foldl
L64:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
L72:	fn_link  L92
	fn_link  L116
	fn_link  L140
	fn_link  L148
	fn_combi_t41 6, 0,1,4,2,5,3
L92:	fn_tor a0
L96:	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L116:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L140:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L148:	fn_y
# --- block 7 ---
L152:	fn_link  L72
	fn_link  L164
	fn_combi_t7 4, 0,1,2,3,0,0
L164:	fn_y
# --- block 8 ---
NanoPrelude.foldl:	fn_link  L184
	fn_link  L180
	fn_combi_t3 3, 0,1,2,0,0,0
L180:	fn_y
# --- block 9 ---
L184:	fn_link  L192
	fn_combi_t46 5, 4,3,0,1,2,3
L192:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 10 ---
GenRegexps.concatS:	fn_link  L212
	fn_link  L208
	fn_combi_t2 3, 2,0,1,0,0,0
L208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 11 ---
L212:	fn_link  GenRegexps.concatS
	fn_link  GenRegexps.app
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 12 ---
GenRegexps.app:	fn_link  L232
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 13 ---
L232:	fn_link  GenRegexps.app
	fn_link  L244
	fn_combi_t16 5, 0,3,1,4,2,0
L244:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 14 ---
GenRegexps.expand:	fn_link  L328
	fn_link  L340
	fn_combi_t6 3, 2,0,1,2,0,0
# --- block 15 ---
L260:	fn_link  GenRegexps.constantRule
	fn_link  L276
	fn_link  L280
	fn_combi_t15 5, 4,0,1,2,3,0
L276:	fn_elink _prim_eq
L280:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 16 ---
L288:	fn_link  L300
	fn_link  L304
	fn_combi_t45 6, 4,0,1,2,3,5
L300:	fn_elink _prim_eq
L304:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
# --- block 17 ---
L312:	fn_link  GenRegexps.alphabeticRule
	fn_link  L260
	fn_link  L288
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 18 ---
L328:	fn_link  GenRegexps.numericRule
	fn_link  L312
	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 19 ---
L340:	fn_link  L352
	fn_link  L356
	fn_combi_t2 4, 3,0,1,0,0,0
L352:	fn_combi_t0 2, 0,0,0,0,0,0
L356:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
GenRegexps.constantRule:	fn_link  L404
	fn_link  L372
	fn_combi_t2 3, 2,0,1,0,0,0
L372:	fn_elink _error0
# --- block 21 ---
L376:	fn_link  L384
	fn_combi_t40 5, 0,0,1,3,2,4
L384:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 22 ---
L388:	fn_link  L376
	fn_link  L400
	fn_combi_t16 5, 4,0,1,2,3,0
L400:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 23 ---
L404:	fn_link  GenRegexps.expand
	fn_link  L388
	fn_link  L420
	fn_combi_t15 5, 0,1,3,2,4,0
L420:	fn_y
# --- block 24 ---
GenRegexps.alphabeticRule:	fn_link  L764
	fn_link  L436
	fn_combi_t2 3, 2,0,1,0,0,0
L436:	fn_elink _error0
# --- block 25 ---
L440:	fn_link  L448
	fn_combi_t40 5, 0,0,1,3,2,4
L448:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
L452:	fn_link  L440
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 27 ---
L460:	fn_link  L468
	fn_combi_t40 6, 0,1,4,5,2,3
L468:	fn_y
# --- block 28 ---
L472:	fn_link  GenRegexps.expand
	fn_link  L452
	fn_link  L460
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 29 ---
L488:	fn_link  L472
	fn_link  L500
	fn_combi_t16 5, 4,0,1,2,3,0
L500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 30 ---
L504:	fn_link  NanoPrelude.enumFromTo
	fn_link  L488
	fn_link  L520
	fn_combi_t44 6, 0,1,5,2,3,4
L520:	fn_y
# --- block 31 ---
L524:	fn_link  NanoPrelude.enumFromTo
	fn_link  GenRegexps.revS
	fn_combi_t7 4, 0,1,3,2,0,0
# --- block 32 ---
L536:	fn_link  L544
	fn_combi_t40 5, 0,0,1,3,2,4
L544:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 33 ---
L548:	fn_link  L536
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 34 ---
L556:	fn_link  L564
	fn_combi_t40 6, 0,1,4,5,2,3
L564:	fn_y
# --- block 35 ---
L568:	fn_link  GenRegexps.expand
	fn_link  L548
	fn_link  L556
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 36 ---
L584:	fn_link  L568
	fn_link  L596
	fn_combi_t16 5, 4,0,1,2,3,0
L596:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L600:	fn_link  L524
	fn_link  L584
	fn_link  L616
	fn_combi_t44 6, 0,1,5,2,3,4
L616:	fn_y
# --- block 38 ---
L620:	fn_link  L628
	fn_combi_t44 5, 3,2,0,1,3,4
L628:	fn_elink _prim_le
# --- block 39 ---
L632:	fn_link  L600
	fn_link  L620
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 40 ---
L644:	fn_link  L504
	fn_link  L632
	fn_link  L660
	fn_combi_t15 4, 0,1,3,2,3,0
L660:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 41 ---
L664:	fn_link  L680
	fn_link  L684
	fn_link  L688
	fn_combi_t38 6, 4,0,1,2,3,5
L680:	fn_elink _error0
L684:	fn_elink _prim_eq
L688:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 42 ---
L696:	fn_link  L644
	fn_link  L664
	fn_link  L712
	fn_combi_t49 6, 5,0,1,2,3,4
L712:	fn_elink _error0
# --- block 43 ---
L716:	fn_link  L696
	fn_link  L728
	fn_combi_t6 4, 3,0,1,2,0,0
L728:	fn_elink _error0
# --- block 44 ---
L732:	fn_link  L748
	fn_link  L752
	fn_link  L756
	fn_combi_t38 6, 4,0,1,2,3,5
L748:	fn_elink _error0
L752:	fn_elink _prim_eq
L756:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 45 ---
L764:	fn_link  L716
	fn_link  L732
	fn_link  L780
	fn_combi_t17 5, 4,0,1,2,3,0
L780:	fn_elink _error0
# --- block 46 ---
GenRegexps.revS:	fn_link  L796
	fn_link  L812
	fn_y
L796:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
L800:	fn_link  L808
	fn_combi_t7 4, 1,0,3,2,0,0
L808:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 48 ---
L812:	fn_link  L800
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 49 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L836
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 50 ---
L836:	fn_link  L852
	fn_link  L856
	fn_link  L860
	fn_combi_t10 5, 3,4,0,1,2,0
L852:	fn_combi_t0 2, 1,0,0,0,0,0
L856:	fn_combi_t0 2, 0,0,0,0,0,0
L860:	fn_elink _prim_le
# --- block 51 ---
NanoPrelude.takeWhile:	fn_link  L904
	fn_link  L876
	fn_combi_t3 3, 0,1,2,0,0,0
L876:	fn_y
# --- block 52 ---
L880:	fn_link  L888
	fn_combi_t6 4, 0,2,1,3,0,0
L888:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L892:	fn_link  L900
	fn_combi_t42 5, 1,3,0,2,3,4
L900:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L904:	fn_link  L880
	fn_link  L892
	fn_link  L920
	fn_combi_t48 6, 5,0,1,3,2,4
L920:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 55 ---
NanoPrelude.enumFrom:	fn_link  L944
	fn_link  L968
	fn_link  NanoPrelude.enumFrom
	fn_link  L972
	fn_combi_t50 5, 0,4,1,2,4,3
L944:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L968:	fn_y
L972:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 56 ---
GenRegexps.numericRule:	fn_link  L1180
	fn_link  L992
	fn_link  L1908
	fn_combi_t6 4, 0,3,1,2,0,0
L992:	fn_y
# --- block 57 ---
L996:	fn_link  L1012
	fn_link  L1016
	fn_link  L1040
	fn_combi_t13 6, 5,0,3,1,2,0
L1012:	fn_combi_t0 2, 0,0,0,0,0,0
L1016:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1040:	fn_y
# --- block 58 ---
L1044:	fn_link  L1064
	fn_link  L1088
	fn_link  NanoPrelude.rem
	fn_link  L1096
	fn_combi_t18 5, 0,1,4,2,3,0
L1064:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1088:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1096:	fn_y
# --- block 59 ---
L1100:	fn_link  L1112
	fn_link  L1044
	fn_combi_t5 5, 4,0,2,1,0,0
L1112:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1116:	fn_link  L1132
	fn_link  NanoPrelude.quot
	fn_link  GenRegexps.app
	fn_combi_t21 5, 0,3,1,4,2,0
L1132:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 61 ---
L1140:	fn_link  L1100
	fn_link  L1116
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 62 ---
L1152:	fn_link  L1140
	fn_link  L1168
	fn_link  L1172
	fn_combi_t44 5, 0,4,1,2,3,4
L1168:	fn_elink _prim_lt
L1172:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 63 ---
L1180:	fn_link  L996
	fn_link  L1152
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 64 ---
L1192:	fn_link  L1212
	fn_link  L1236
	fn_link  L1260
	fn_link  L1268
	fn_combi_t13 5, 0,1,4,2,3,0
L1212:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1236:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1260:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1268:	fn_y
# --- block 65 ---
L1272:	fn_link  L1192
	fn_link  L1288
	fn_link  L1312
	fn_combi_t57 5, 0,0,4,1,2,3
L1288:	fn_force
	fn_tor a0
	addiw a0,a0,-48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1312:	fn_y
# --- block 66 ---
L1316:	fn_link  L1324
	fn_elink GenRegexps.spanNe
L1324:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 67 ---
L1332:	fn_link  L1344
	fn_link  L1348
	fn_combi_t2 4, 3,0,1,0,0,0
L1344:	fn_combi_t0 2, 1,0,0,0,0,0
L1348:	fn_elink _error0
# --- block 68 ---
L1352:	fn_link  L1332
	fn_link  L1368
	fn_link  GenRegexps.spanNe
	fn_combi_t6 4, 0,1,3,2,0,0
L1368:	fn_box
	.word 0x0000003e	# raw word 62
	fn_box_body
# --- block 69 ---
L1376:	fn_link  L1388
	fn_link  L1392
	fn_combi_t6 4, 3,0,1,2,0,0
L1388:	fn_combi_t0 3, 0,0,0,0,0,0
L1392:	fn_elink _error0
# --- block 70 ---
L1396:	fn_link  L1376
	fn_combi_t3 3, 1,2,0,0,0,0
# --- block 71 ---
L1404:	fn_link  L1416
	fn_link  L1420
	fn_combi_t6 4, 3,0,1,2,0,0
L1416:	fn_combi_t0 3, 0,0,0,0,0,0
L1420:	fn_elink _error0
# --- block 72 ---
L1424:	fn_link  L1404
	fn_combi_t41 6, 5,2,3,0,1,4
# --- block 73 ---
L1432:	fn_link  L1396
	fn_link  L1424
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 74 ---
L1444:	fn_link  L1452
	fn_combi_t1 2, 1,0,0,0,0,0
L1452:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 75 ---
L1456:	fn_link  NanoPrelude.enumFromTo
	fn_link  GenRegexps.revS
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 76 ---
L1468:	fn_link  L1456
	fn_link  L1480
	fn_combi_t44 4, 2,3,0,1,2,3
L1480:	fn_elink _prim_lt
# --- block 77 ---
L1484:	fn_link  NanoPrelude.enumFromTo
	fn_link  L1468
	fn_combi_t42 4, 0,2,3,1,3,2
# --- block 78 ---
L1496:	fn_link  L1508
	fn_link  L1512
	fn_combi_t2 4, 3,0,1,0,0,0
L1508:	fn_combi_t0 2, 1,0,0,0,0,0
L1512:	fn_elink _error0
# --- block 79 ---
L1516:	fn_link  NanoPrelude.length
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 80 ---
L1524:	fn_link  NanoPrelude.length
	fn_link  NanoPrelude.max
	fn_combi_t27 6, 0,1,2,5,3,4
# --- block 81 ---
L1536:	fn_link  NanoPrelude.length
	fn_link  L1556
	fn_link  L1560
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t49 6, 0,1,2,3,5,4
L1556:	fn_y
L1560:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 82 ---
L1568:	fn_link  L1536
	fn_combi_t52 6, 0,1,2,4,3,5
# --- block 83 ---
L1576:	fn_link  L1596
	fn_link  L1516
	fn_link  L1524
	fn_link  L1568
	fn_combi_t29 5, 0,1,4,2,4,3
L1596:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 84 ---
L1620:	fn_link  L1640
	fn_link  L1648
	fn_link  NanoPrelude.map
	fn_link  GenRegexps.app
	fn_combi_t57 6, 0,1,2,3,4,5
L1640:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
L1648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 85 ---
L1652:	fn_link  L1576
	fn_link  L1620
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 86 ---
L1664:	fn_link  GenRegexps.app
	fn_link  L1676
	fn_combi_t54 5, 0,1,2,3,3,4
L1676:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 87 ---
L1680:	fn_link  L1652
	fn_link  L1664
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 88 ---
L1692:	fn_link  L1680
	fn_link  L1704
	fn_combi_t32 5, 0,1,2,3,4,2
L1704:	fn_combi_t38 6, 0,1,2,4,3,5
# --- block 89 ---
L1708:	fn_link  L1692
	fn_link  L1720
	fn_combi_t18 5, 0,1,2,3,4,0
L1720:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 90 ---
L1724:	fn_link  L1732
	fn_combi_t45 6, 0,1,5,2,3,4
L1732:	fn_y
# --- block 91 ---
L1736:	fn_link  L1724
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 92 ---
L1744:	fn_link  L1736
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 93 ---
L1752:	fn_link  L1744
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 94 ---
L1760:	fn_link  L1752
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 95 ---
L1768:	fn_link  L1496
	fn_link  GenRegexps.expand
	fn_link  L1708
	fn_link  L1760
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 96 ---
L1788:	fn_link  L1796
	fn_combi_t46 6, 5,0,1,2,3,4
L1796:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 97 ---
L1800:	fn_link  L1768
	fn_link  L1788
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 98 ---
L1812:	fn_link  L1820
	fn_combi_t40 5, 0,1,2,4,3,4
L1820:	fn_y
# --- block 99 ---
L1824:	fn_link  L1800
	fn_link  L1812
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 100 ---
L1836:	fn_link  L1856
	fn_link  L1484
	fn_link  L1824
	fn_link  L1860
	fn_combi_t26 6, 0,1,4,5,2,3
L1856:	fn_combi_t0 2, 0,0,0,0,0,0
L1860:	fn_combi_t39 5, 0,4,1,4,3,2
# --- block 101 ---
L1864:	fn_link  L1444
	fn_link  L1836
	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 102 ---
L1876:	fn_link  L1432
	fn_link  L1864
	fn_link  L1892
	fn_combi_t5 4, 0,1,3,2,0,0
L1892:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 103 ---
L1896:	fn_link  L1352
	fn_link  L1876
	fn_combi_t37 5, 0,4,3,2,1,2
# --- block 104 ---
L1908:	fn_link  L1932
	fn_link  L1272
	fn_link  NanoPrelude.foldl
	fn_link  L1316
	fn_link  L1896
	fn_combi_t44 6, 0,1,5,2,3,4
L1932:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 105 ---
NanoPrelude.map:	fn_link  L1968
	fn_link  L1952
	fn_combi_t3 3, 0,1,2,0,0,0
L1952:	fn_y
# --- block 106 ---
L1956:	fn_link  L1964
	fn_combi_t15 5, 0,1,3,2,4,0
L1964:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 107 ---
L1968:	fn_link  L1956
	fn_link  L1980
	fn_combi_t16 5, 4,0,1,2,3,0
L1980:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 108 ---
NanoPrelude.length:	fn_link  L1996
	fn_link  L2044
	fn_y
L1996:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 109 ---
L2004:	fn_link  L2016
	fn_link  L2040
	fn_combi_t8 5, 2,0,3,1,0,0
L2016:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2040:	fn_y
# --- block 110 ---
L2044:	fn_link  L2004
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 111 ---
NanoPrelude.max:	fn_link  L2064
	fn_link  L2068
	fn_combi_t3 3, 0,1,2,0,0,0
L2064:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 112 ---
L2068:	fn_link  L2076
	fn_combi_t10 3, 2,1,0,1,2,0
L2076:	fn_elink _prim_le
# --- block 113 ---
GenRegexps.spanNe:	fn_link  L2216
	fn_link  L2092
	fn_combi_t3 3, 0,1,2,0,0,0
L2092:	fn_y
# --- block 114 ---
L2096:	fn_link  L2104
	fn_combi_t1 2, 1,0,0,0,0,0
L2104:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 115 ---
L2108:	fn_link  L2120
	fn_link  L2124
	fn_combi_t34 6, 5,0,2,4,1,3
L2120:	fn_combi_t0 2, 0,0,0,0,0,0
L2124:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 116 ---
L2128:	fn_link  L2096
	fn_link  L2108
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 117 ---
L2140:	fn_link  L2152
	fn_link  L2156
	fn_combi_t16 5, 4,0,1,2,3,0
L2152:	fn_combi_t2 4, 3,0,1,0,0,0
L2156:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 118 ---
L2160:	fn_link  L2140
	fn_link  L2172
	fn_combi_t44 5, 2,3,0,1,3,4
L2172:	fn_elink _prim_ne
# --- block 119 ---
L2176:	fn_link  L2160
	fn_link  L2188
	fn_combi_t3 3, 0,1,2,0,0,0
L2188:	fn_combi_t43 5, 0,1,4,2,3,4
# --- block 120 ---
L2192:	fn_link  L2128
	fn_link  L2176
	fn_combi_t28 5, 0,2,4,1,4,3
# --- block 121 ---
L2204:	fn_link  L2212
	fn_combi_t2 2, 1,0,0,0,0,0
L2212:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
L2216:	fn_link  L2192
	fn_link  L2204
	fn_combi_t16 5, 4,0,1,2,3,0
# --- block 123 ---
NanoPrelude.quot:	fn_link  L2240
	fn_link  L2264
	fn_combi_t8 4, 0,3,2,1,0,0
L2240:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2264:	fn_y
# --- block 124 ---
NanoPrelude.rem:	fn_link  L2280
	fn_link  L2304
	fn_combi_t8 4, 0,3,2,1,0,0
L2280:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2304:	fn_y
# --- block 125 ---
GenRegexps.pat0:	fn_link  L2692
	fn_link  L2320
	fn_combi_t2 4, 3,0,1,0,0,0
L2320:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 126 ---
L2328:	fn_link  L2340
	fn_link  L2344
	fn_combi_t2 4, 3,0,1,0,0,0
L2340:	fn_combi_t0 2, 0,0,0,0,0,0
L2344:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 127 ---
L2352:	fn_link  L2328
	fn_link  L2364
	fn_combi_t2 4, 3,0,1,0,0,0
L2364:	fn_box
	.word 0x00000039	# raw word 57
	fn_box_body
# --- block 128 ---
L2372:	fn_link  L2352
	fn_link  L2384
	fn_combi_t2 4, 3,0,1,0,0,0
L2384:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 129 ---
L2392:	fn_link  L2372
	fn_link  L2404
	fn_combi_t2 4, 3,0,1,0,0,0
L2404:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 130 ---
L2412:	fn_link  L2392
	fn_link  L2424
	fn_combi_t2 4, 3,0,1,0,0,0
L2424:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 131 ---
L2432:	fn_link  L2412
	fn_link  L2444
	fn_combi_t2 4, 3,0,1,0,0,0
L2444:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 132 ---
L2452:	fn_link  L2432
	fn_link  L2464
	fn_combi_t2 4, 3,0,1,0,0,0
L2464:	fn_box
	.word 0x0000006a	# raw word 106
	fn_box_body
# --- block 133 ---
L2472:	fn_link  L2452
	fn_link  L2484
	fn_combi_t2 4, 3,0,1,0,0,0
L2484:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 134 ---
L2492:	fn_link  L2472
	fn_link  L2504
	fn_combi_t2 4, 3,0,1,0,0,0
L2504:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 135 ---
L2512:	fn_link  L2492
	fn_link  L2524
	fn_combi_t2 4, 3,0,1,0,0,0
L2524:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 136 ---
L2532:	fn_link  L2512
	fn_link  L2544
	fn_combi_t2 4, 3,0,1,0,0,0
L2544:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 137 ---
L2552:	fn_link  L2532
	fn_link  L2564
	fn_combi_t2 4, 3,0,1,0,0,0
L2564:	fn_box
	.word 0x0000006a	# raw word 106
	fn_box_body
# --- block 138 ---
L2572:	fn_link  L2552
	fn_link  L2584
	fn_combi_t2 4, 3,0,1,0,0,0
L2584:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 139 ---
L2592:	fn_link  L2572
	fn_link  L2604
	fn_combi_t2 4, 3,0,1,0,0,0
L2604:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 140 ---
L2612:	fn_link  L2592
	fn_link  L2624
	fn_combi_t2 4, 3,0,1,0,0,0
L2624:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 141 ---
L2632:	fn_link  L2612
	fn_link  L2644
	fn_combi_t2 4, 3,0,1,0,0,0
L2644:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 142 ---
L2652:	fn_link  L2632
	fn_link  L2664
	fn_combi_t2 4, 3,0,1,0,0,0
L2664:	fn_box
	.word 0x0000006a	# raw word 106
	fn_box_body
# --- block 143 ---
L2672:	fn_link  L2652
	fn_link  L2684
	fn_combi_t2 4, 3,0,1,0,0,0
L2684:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 144 ---
L2692:	fn_link  L2672
	fn_link  L2704
	fn_combi_t2 4, 3,0,1,0,0,0
L2704:	fn_box
	.word 0x00000061	# raw word 97
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
_unimpprim_addiw$20$2d48:
	la a0, _unimpprim_addiw$20$2d48$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d48$name:
	.asciz "addiw -48"
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
