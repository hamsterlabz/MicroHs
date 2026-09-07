# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Cryptarithm1  (entry @0)
	.text
	.globl	Cryptarithm1.append
	.globl	Cryptarithm1.bench
	.globl	Cryptarithm1.commaSep
	.globl	Cryptarithm1.condition
	.globl	Cryptarithm1.expand
	.globl	Cryptarithm1.fromTo
	.globl	Cryptarithm1.hashS
	.globl	Cryptarithm1.p0
	.globl	Cryptarithm1.permutations
	.globl	Cryptarithm1.showIntList
	.globl	Cryptarithm1.showListList
	.globl	Cryptarithm1.showN
	.globl	Cryptarithm1.takeL
	.globl	Data.Bool_Type.True
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Cryptarithm1.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Cryptarithm1.bench:	fn_link  L108
	fn_elink Cryptarithm1.hashS
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L52
L44:	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
L52:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
L60:	fn_link  Cryptarithm1.p0
	fn_elink Cryptarithm1.permutations
# --- block 5 ---
L68:	fn_link  L60
	fn_link  L80
	fn_elink Cryptarithm1.takeL
L80:	fn_box
	.word 0x000007d0	# raw word 2000
	fn_box_body
# --- block 6 ---
L88:	fn_link  L68
L92:	fn_link  Cryptarithm1.condition
	fn_elink NanoPrelude.filter
# --- block 7 ---
L100:	fn_link  L88
	fn_elink Cryptarithm1.showListList
# --- block 8 ---
L108:	fn_link  L36
	fn_link  L100
	fn_elink Cryptarithm1.append
# --- block 9 ---
Cryptarithm1.hashS:	fn_link  L132
	fn_link  L220
	fn_elink NanoPrelude.foldl
L132:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 10 ---
L140:	fn_link  L160
	fn_link  L184
	fn_link  L208
	fn_link  L216
	fn_combi_t41 6, 0,1,4,2,5,3
L160:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L184:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L208:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L216:	fn_y
# --- block 11 ---
L220:	fn_link  L140
	fn_link  L232
	fn_combi_t7 4, 0,1,2,3,0,0
L232:	fn_y
# --- block 12 ---
NanoPrelude.foldl:	fn_link  L252
	fn_link  L248
	fn_combi_t3 3, 0,1,2,0,0,0
L248:	fn_y
# --- block 13 ---
L252:	fn_link  L260
	fn_combi_t46 5, 4,3,0,1,2,3
L260:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 14 ---
Cryptarithm1.append:	fn_link  L272
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 15 ---
L272:	fn_link  Cryptarithm1.append
	fn_link  L284
	fn_combi_t16 5, 0,3,1,4,2,0
L284:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
Cryptarithm1.showListList:	fn_link  L340
	fn_link  L304
	fn_link  L312
	fn_combi_t6 4, 0,1,2,3,0,0
L304:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L312:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L316:	fn_link  L328
	fn_link  L332
	fn_combi_t2 4, 3,0,1,0,0,0
L328:	fn_combi_t0 2, 0,0,0,0,0,0
L332:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 18 ---
L340:	fn_link  L316
	fn_link  Cryptarithm1.showIntList
	fn_link  NanoPrelude.map
	fn_link  Cryptarithm1.commaSep
	fn_link  Cryptarithm1.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 19 ---
Cryptarithm1.commaSep:	fn_link  L420
	fn_link  L376
	fn_combi_t2 3, 2,0,1,0,0,0
L376:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
L380:	fn_link  Cryptarithm1.commaSep
	fn_link  L400
	fn_link  L408
	fn_link  Cryptarithm1.append
	fn_combi_t48 7, 0,4,1,2,3,5
L400:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L408:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
L412:	fn_link  L380
	fn_combi_t2 4, 0,1,2,0,0,0
# --- block 22 ---
L420:	fn_link  L412
	fn_combi_t16 3, 2,1,0,1,2,0
# --- block 23 ---
NanoPrelude.map:	fn_link  L456
	fn_link  L440
	fn_combi_t3 3, 0,1,2,0,0,0
L440:	fn_y
# --- block 24 ---
L444:	fn_link  L452
	fn_combi_t15 5, 0,1,3,2,4,0
L452:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 25 ---
L456:	fn_link  L444
	fn_link  L468
	fn_combi_t16 5, 4,0,1,2,3,0
L468:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
Cryptarithm1.showIntList:	fn_link  L524
	fn_link  L488
	fn_link  L496
	fn_combi_t6 4, 0,1,2,3,0,0
L488:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L496:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 27 ---
L500:	fn_link  L512
	fn_link  L516
	fn_combi_t2 4, 3,0,1,0,0,0
L512:	fn_combi_t0 2, 0,0,0,0,0,0
L516:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 28 ---
L524:	fn_link  L500
	fn_link  Cryptarithm1.showN
	fn_link  NanoPrelude.map
	fn_link  Cryptarithm1.commaSep
	fn_link  Cryptarithm1.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 29 ---
Cryptarithm1.showN:	fn_link  L560
	fn_link  L720
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 30 ---
L560:	fn_link  L576
	fn_link  L580
	fn_link  L604
	fn_combi_t13 6, 5,0,3,1,2,0
L576:	fn_combi_t0 2, 0,0,0,0,0,0
L580:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L604:	fn_y
# --- block 31 ---
L608:	fn_link  L628
	fn_link  L652
	fn_link  NanoPrelude.rem
	fn_link  L660
	fn_combi_t18 5, 0,1,4,2,3,0
L628:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L652:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L660:	fn_y
# --- block 32 ---
L664:	fn_link  L676
	fn_link  L608
	fn_combi_t5 5, 4,0,2,1,0,0
L676:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L680:	fn_link  L700
	fn_link  NanoPrelude.quot
	fn_link  Cryptarithm1.showN
	fn_link  Cryptarithm1.append
	fn_combi_t21 5, 0,1,2,4,3,0
L700:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 34 ---
L708:	fn_link  L664
	fn_link  L680
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 35 ---
L720:	fn_link  L708
	fn_link  L736
	fn_link  L740
	fn_combi_t15 4, 0,3,1,2,3,0
L736:	fn_elink _prim_lt
L740:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 36 ---
NanoPrelude.quot:	fn_link  L760
	fn_link  L784
	fn_combi_t8 4, 0,3,2,1,0,0
L760:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L784:	fn_y
# --- block 37 ---
NanoPrelude.rem:	fn_link  L800
	fn_link  L824
	fn_combi_t8 4, 0,3,2,1,0,0
L800:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L824:	fn_y
# --- block 38 ---
NanoPrelude.filter:	fn_link  L892
	fn_link  L840
	fn_combi_t3 3, 0,1,2,0,0,0
L840:	fn_y
# --- block 39 ---
L844:	fn_link  L856
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L856:	fn_elink _error0
# --- block 40 ---
L860:	fn_link  L868
	fn_combi_t24 5, 0,1,4,2,3,4
L868:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 41 ---
L872:	fn_link  L888
	fn_link  L844
	fn_link  L860
	fn_combi_t26 5, 0,1,3,4,2,4
L888:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L892:	fn_link  L872
	fn_link  L904
	fn_combi_t16 5, 4,0,1,2,3,0
L904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 43 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 44 ---
Cryptarithm1.condition:	fn_link  L1532
	fn_link  L924
	fn_combi_t2 3, 2,0,1,0,0,0
L924:	fn_elink _error0
# --- block 45 ---
L928:	fn_link  L936
	fn_combi_t0 3, 0,0,0,0,0,0
L936:	fn_elink _error0
# --- block 46 ---
L940:	fn_link  Cryptarithm1.expand
	fn_combi_t23 5, 0,1,2,3,4,1
# --- block 47 ---
L948:	fn_link  L956
	fn_combi_t56 6, 0,1,5,2,3,4
L956:	fn_y
# --- block 48 ---
L960:	fn_link  L948
	fn_combi_t24 6, 0,1,5,4,2,3
# --- block 49 ---
L968:	fn_link  L960
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 50 ---
L976:	fn_link  L996
	fn_link  L1020
	fn_link  Cryptarithm1.expand
	fn_link  L968
	fn_combi_t26 6, 0,1,4,5,2,3
L996:	fn_tor a0
L1000:	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1020:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 51 ---
L1028:	fn_link  L1036
	fn_combi_t24 6, 0,1,5,2,3,4
L1036:	fn_combi_t42 6, 0,4,5,1,2,3
# --- block 52 ---
L1040:	fn_link  L1028
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 53 ---
L1048:	fn_link  L976
	fn_link  L1040
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L1060:	fn_link  L1080
	fn_link  L940
	fn_link  L1048
	fn_link  L1084
	fn_combi_t45 5, 0,1,4,2,3,4
L1080:	fn_combi_t0 1, 0,0,0,0,0,0
L1084:	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 55 ---
L1088:	fn_link  Cryptarithm1.expand
	fn_combi_t23 5, 0,4,2,4,3,1
# --- block 56 ---
L1096:	fn_link  L1104
	fn_combi_t26 6, 0,1,3,5,4,2
L1104:	fn_combi_t42 6, 0,5,1,2,3,4
# --- block 57 ---
L1108:	fn_link  L1124
	fn_link  L1088
	fn_link  L1096
	fn_combi_t5 4, 0,1,3,2,0,0
L1124:	fn_y
# --- block 58 ---
L1128:	fn_link  L1108
	fn_link  L1140
	fn_combi_t18 5, 0,1,2,3,4,0
L1140:	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 59 ---
L1144:	fn_link  L1152
	fn_combi_t29 5, 0,1,4,2,4,3
L1152:	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 60 ---
L1156:	fn_link  L1144
	fn_combi_t29 6, 0,1,2,3,5,4
# --- block 61 ---
L1164:	fn_link  L1128
	fn_link  L1156
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 62 ---
L1176:	fn_link  L1196
	fn_link  L1060
	fn_link  L1164
	fn_link  L1220
	fn_combi_t44 5, 0,1,4,2,4,3
L1196:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1220:	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 63 ---
L1224:	fn_link  L1236
	fn_link  L1176
	fn_combi_t2 3, 0,2,1,0,0,0
L1236:	fn_elink _prim_eq
# --- block 64 ---
L1240:	fn_link  L1248
	fn_combi_t24 6, 0,1,5,2,3,4
L1248:	fn_combi_t32 6, 5,0,4,1,2,3
# --- block 65 ---
L1252:	fn_link  L1240
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 66 ---
L1260:	fn_link  L1252
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 67 ---
L1268:	fn_link  L1260
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 68 ---
L1276:	fn_link  L1268
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 69 ---
L1284:	fn_link  L1276
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 70 ---
L1292:	fn_link  L1284
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 71 ---
L1300:	fn_link  L1292
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 72 ---
L1308:	fn_link  L928
	fn_link  L1332
	fn_link  L1336
	fn_link  L1224
	fn_link  L1300
	fn_combi_t24 6, 0,1,5,2,3,4
L1332:	fn_combi_t0 2, 1,0,0,0,0,0
L1336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 73 ---
L1340:	fn_link  L1348
	fn_combi_t46 6, 5,0,1,2,3,4
L1348:	fn_elink _error0
# --- block 74 ---
L1352:	fn_link  L1340
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 75 ---
L1360:	fn_link  L1308
	fn_link  L1352
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 76 ---
L1372:	fn_link  L1380
	fn_combi_t46 6, 5,0,1,2,3,4
L1380:	fn_elink _error0
# --- block 77 ---
L1384:	fn_link  L1372
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 78 ---
L1392:	fn_link  L1360
	fn_link  L1384
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 79 ---
L1404:	fn_link  L1412
	fn_combi_t46 6, 5,0,1,2,3,4
L1412:	fn_elink _error0
# --- block 80 ---
L1416:	fn_link  L1392
	fn_link  L1404
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 81 ---
L1428:	fn_link  L1436
	fn_combi_t46 6, 5,0,1,2,3,4
L1436:	fn_elink _error0
# --- block 82 ---
L1440:	fn_link  L1416
	fn_link  L1428
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 83 ---
L1452:	fn_link  L1460
	fn_combi_t46 6, 5,0,1,2,3,4
L1460:	fn_elink _error0
# --- block 84 ---
L1464:	fn_link  L1440
	fn_link  L1452
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 85 ---
L1476:	fn_link  L1484
	fn_combi_t46 6, 5,0,1,2,3,4
L1484:	fn_elink _error0
# --- block 86 ---
L1488:	fn_link  L1464
	fn_link  L1476
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 87 ---
L1500:	fn_link  L1488
	fn_link  L1512
	fn_combi_t46 6, 5,0,1,2,3,4
L1512:	fn_elink _error0
# --- block 88 ---
L1516:	fn_link  L1500
	fn_link  L1528
	fn_combi_t16 5, 4,0,1,2,3,0
L1528:	fn_elink _error0
# --- block 89 ---
L1532:	fn_link  L1516
	fn_link  L1544
	fn_combi_t6 4, 3,0,1,2,0,0
L1544:	fn_elink _error0
# --- block 90 ---
Cryptarithm1.expand:	fn_link  L1980
	fn_link  L2020
	fn_link  L2072
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 91 ---
L1564:	fn_link  L1584
	fn_link  L1608
	fn_link  L1632
	fn_link  L1640
	fn_combi_t41 6, 0,1,4,2,5,3
L1584:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1608:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1632:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1640:	fn_y
# --- block 92 ---
L1644:	fn_link  L1660
	fn_link  L1564
	fn_link  L1684
	fn_combi_t12 5, 0,1,3,4,2,0
L1660:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1684:	fn_y
# --- block 93 ---
L1688:	fn_link  L1704
	fn_link  L1728
	fn_link  L1736
	fn_combi_t41 6, 0,1,3,2,4,5
L1704:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1728:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
L1736:	fn_y
# --- block 94 ---
L1740:	fn_link  L1748
	fn_combi_t33 6, 0,1,2,4,5,3
L1748:	fn_y
# --- block 95 ---
L1752:	fn_link  L1772
	fn_link  L1644
	fn_link  L1688
	fn_link  L1740
	fn_combi_t10 5, 0,1,4,2,3,0
L1772:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 96 ---
L1796:	fn_link  L1812
	fn_link  L1836
	fn_link  L1844
	fn_combi_t41 6, 0,1,3,2,4,5
L1812:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1836:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L1844:	fn_y
# --- block 97 ---
L1848:	fn_link  L1856
	fn_combi_t33 6, 0,1,2,4,5,3
L1856:	fn_y
# --- block 98 ---
L1860:	fn_link  L1880
	fn_link  L1752
	fn_link  L1796
	fn_link  L1848
	fn_combi_t29 6, 0,1,4,2,5,3
L1880:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 99 ---
L1904:	fn_link  L1920
	fn_link  L1944
	fn_link  L1952
	fn_combi_t41 6, 0,1,3,2,4,5
L1920:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1944:	fn_box
	.word 0x00002710	# raw word 10000
	fn_box_body
L1952:	fn_y
# --- block 100 ---
L1956:	fn_link  L1964
	fn_combi_t33 6, 0,1,2,4,5,3
L1964:	fn_y
# --- block 101 ---
L1968:	fn_link  L1904
	fn_link  L1956
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 102 ---
L1980:	fn_link  L1996
	fn_link  L1860
	fn_link  L1968
	fn_combi_t30 6, 0,3,1,4,5,2
L1996:	fn_tor a0
L2000:	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 103 ---
L2020:	fn_link  L2036
	fn_link  L2060
	fn_link  L2068
	fn_combi_t41 6, 0,1,3,2,4,5
L2036:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2060:	fn_box
	.word 0x000186a0	# raw word 100000
	fn_box_body
L2068:	fn_y
# --- block 104 ---
L2072:	fn_link  L2080
	fn_combi_t54 6, 0,1,2,3,4,5
L2080:	fn_y
# --- block 105 ---
Cryptarithm1.takeL:	fn_link  L2100
	fn_link  L2148
	fn_link  L2164
	fn_combi_t24 5, 0,1,3,3,4,2
L2100:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
L2104:	fn_link  L2120
	fn_link  L2144
	fn_link  Cryptarithm1.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L2120:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2144:	fn_y
# --- block 107 ---
L2148:	fn_link  L2104
	fn_link  L2160
	fn_combi_t16 5, 0,3,1,2,4,0
L2160:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 108 ---
L2164:	fn_link  L2180
	fn_link  L2184
	fn_link  L2188
	fn_combi_t44 6, 0,4,1,5,2,3
L2180:	fn_combi_t0 2, 0,0,0,0,0,0
L2184:	fn_elink _prim_le
L2188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 109 ---
Cryptarithm1.permutations:	fn_link  L2384
	fn_link  L2408
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 110 ---
L2208:	fn_link  L2216
	fn_combi_t40 5, 0,0,1,3,2,4
L2216:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 111 ---
L2220:	fn_link  L2208
	fn_link  L2232
	fn_combi_t16 5, 4,0,1,2,3,0
L2232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
L2236:	fn_link  L2244
	fn_combi_t58 4, 0,0,1,0,2,3
L2244:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 113 ---
L2248:	fn_link  L2256
	fn_combi_t38 5, 0,1,4,2,3,4
L2256:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 114 ---
L2260:	fn_link  L2220
	fn_link  L2280
	fn_link  L2236
	fn_link  L2248
	fn_combi_t10 5, 0,1,4,2,3,0
L2280:	fn_y
# --- block 115 ---
L2284:	fn_link  L2260
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 116 ---
L2292:	fn_link  L2300
	fn_combi_t2 4, 3,1,0,0,0,0
L2300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 117 ---
L2304:	fn_link  L2316
	fn_link  L2292
	fn_combi_t5 5, 4,0,2,1,0,0
L2316:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 118 ---
L2320:	fn_link  L2284
	fn_link  L2304
	fn_combi_t44 5, 4,0,2,1,2,3
# --- block 119 ---
L2332:	fn_link  L2340
	fn_combi_t6 4, 0,2,1,3,0,0
L2340:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 120 ---
L2344:	fn_link  L2332
	fn_combi_t15 5, 4,1,2,0,3,0
# --- block 121 ---
L2352:	fn_link  L2360
	fn_combi_t44 5, 0,1,4,0,2,3
L2360:	fn_y
# --- block 122 ---
L2364:	fn_link  L2344
	fn_link  L2352
	fn_link  L2380
	fn_combi_t47 6, 5,0,1,2,4,3
L2380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 123 ---
L2384:	fn_link  Cryptarithm1.permutations
	fn_link  L2320
	fn_link  L2364
	fn_link  L2404
	fn_combi_t41 6, 0,1,2,4,3,5
L2404:	fn_y
# --- block 124 ---
L2408:	fn_link  L2420
	fn_link  L2424
	fn_combi_t2 4, 3,0,1,0,0,0
L2420:	fn_combi_t0 2, 0,0,0,0,0,0
L2424:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 125 ---
Cryptarithm1.p0:	fn_link  L2492
	fn_link  L2440
	fn_elink Cryptarithm1.takeL
L2440:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 126 ---
L2448:	fn_link  L2460
	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L2460:	fn_force
	fn_tor a0
	addiw a0,a0,9
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 127 ---
L2484:	fn_link  L2448
	fn_y
# --- block 128 ---
L2492:	fn_link  L2484
	fn_link  L2504
	fn_elink Cryptarithm1.fromTo
L2504:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 129 ---
Cryptarithm1.fromTo:	fn_link  L2528
	fn_link  L2576
	fn_link  L2592
	fn_combi_t10 4, 0,1,3,2,3,0
L2528:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 130 ---
L2532:	fn_link  L2548
	fn_link  L2572
	fn_link  Cryptarithm1.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L2548:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2572:	fn_y
# --- block 131 ---
L2576:	fn_link  L2532
	fn_link  L2588
	fn_combi_t16 4, 0,2,1,2,3,0
L2588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 132 ---
L2592:	fn_link  L2600
	fn_combi_t29 5, 4,3,0,1,4,2
L2600:	fn_elink _prim_gt

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
_unimpprim_addiw$2048:
	la a0, _unimpprim_addiw$2048$name
	tail _unimpfi_halt
_unimpprim_addiw$2048$name:
	.asciz "addiw 48"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$209:
	la a0, _unimpprim_addiw$209$name
	tail _unimpfi_halt
_unimpprim_addiw$209$name:
	.asciz "addiw 9"
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
