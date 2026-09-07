# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/WheelSieve1  (entry @0)
	.text
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.head
	.globl	NanoPrelude.min
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.tail
	.globl	Primitives.primPerformIO
	.globl	WheelSieve1.bench
	.globl	WheelSieve1.fromThenTo
	.globl	WheelSieve1.nextSize
	.globl	WheelSieve1.notDivBy
	.globl	WheelSieve1.prime
	.globl	WheelSieve1.sieve
	.globl	WheelSieve1.squares
	.globl	WheelSieve1.wheels
	.globl	WheelSieve1.zipW
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  WheelSieve1.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
WheelSieve1.bench:	fn_link  L36
	fn_elink WheelSieve1.prime
L36:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 3 ---
WheelSieve1.prime:	fn_link  L88
	fn_link  L64
	fn_link  L176
	fn_link  L68
	fn_combi_t31 5, 0,1,2,3,4,4
L64:	fn_y
L68:	fn_y
# --- block 4 ---
L72:	fn_link  WheelSieve1.squares
	fn_link  WheelSieve1.wheels
	fn_link  WheelSieve1.sieve
	fn_combi_t38 4, 0,1,3,3,2,3
# --- block 5 ---
L88:	fn_link  L72
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 6 ---
L96:	fn_link  L108
	fn_link  L132
	fn_combi_t17 5, 2,4,0,3,1,0
L108:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L132:	fn_y
# --- block 7 ---
L136:	fn_link  L148
	fn_link  L152
	fn_combi_t29 6, 3,0,1,2,5,4
L148:	fn_elink _prim_eq
L152:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L160:	fn_link  L136
	fn_link  L172
	fn_combi_t47 5, 3,0,1,2,4,4
L172:	fn_elink _error0
# --- block 9 ---
L176:	fn_link  L96
	fn_link  L160
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 10 ---
WheelSieve1.sieve:	fn_link  L852
	fn_link  L200
	fn_combi_t46 6, 2,0,1,3,4,5
L200:	fn_elink _error0
# --- block 11 ---
L204:	fn_link  NanoPrelude.tail
	fn_link  WheelSieve1.sieve
	fn_combi_t39 5, 0,4,1,2,1,3
# --- block 12 ---
L216:	fn_link  L232
	fn_link  NanoPrelude.head
	fn_link  L256
	fn_combi_t7 4, 0,1,3,2,0,0
L232:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L256:	fn_y
# --- block 13 ---
L260:	fn_link  L276
	fn_link  L300
	fn_link  NanoPrelude.min
	fn_combi_t36 5, 0,1,4,4,2,3
L276:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L300:	fn_y
# --- block 14 ---
L304:	fn_link  L324
	fn_link  L348
	fn_link  L356
	fn_link  WheelSieve1.fromThenTo
	fn_combi_t22 5, 0,1,2,4,3,0
L324:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L348:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L356:	fn_y
# --- block 15 ---
L360:	fn_link  L380
	fn_link  L404
	fn_link  L412
	fn_link  L304
	fn_combi_t50 5, 0,4,1,2,4,3
L380:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L404:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L412:	fn_y
# --- block 16 ---
L416:	fn_link  L428
	fn_link  L360
	fn_combi_t50 5, 0,4,1,4,2,3
L428:	fn_y
# --- block 17 ---
L432:	fn_link  L452
	fn_link  L216
	fn_link  L260
	fn_link  L416
	fn_combi_t33 6, 0,1,2,4,5,3
L452:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 18 ---
L476:	fn_link  WheelSieve1.notDivBy
	fn_link  L492
	fn_link  L496
	fn_combi_t44 6, 0,5,1,2,3,4
L492:	fn_elink _prim_le
L496:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 19 ---
L504:	fn_link  L512
	fn_combi_t26 6, 0,1,4,5,2,3
L512:	fn_combi_t38 6, 0,1,2,5,3,4
# --- block 20 ---
L516:	fn_link  L536
	fn_link  L540
	fn_link  L476
	fn_link  L504
	fn_combi_t10 5, 0,1,4,2,3,0
L536:	fn_combi_t0 2, 1,0,0,0,0,0
L540:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 21 ---
L544:	fn_link  L552
	fn_combi_t24 5, 0,1,4,2,3,4
L552:	fn_combi_t48 5, 0,4,1,4,2,3
# --- block 22 ---
L556:	fn_link  L544
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 23 ---
L564:	fn_link  L580
	fn_link  L516
	fn_link  L556
	fn_combi_t12 5, 0,1,3,4,2,0
L580:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 24 ---
L584:	fn_link  L592
	fn_combi_t24 6, 0,1,5,2,4,3
L592:	fn_combi_t50 6, 0,5,1,2,4,3
# --- block 25 ---
L596:	fn_link  L584
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 26 ---
L604:	fn_link  L624
	fn_link  L648
	fn_link  L564
	fn_link  L596
	fn_combi_t10 5, 0,1,4,2,3,0
L624:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L648:	fn_y
# --- block 27 ---
L652:	fn_link  L604
	fn_link  L664
	fn_combi_t18 5, 0,1,2,3,4,0
L664:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 28 ---
L668:	fn_link  L676
	fn_combi_t32 6, 0,1,3,4,5,2
L676:	fn_y
# --- block 29 ---
L680:	fn_link  L652
	fn_link  L668
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 30 ---
L692:	fn_link  L700
	fn_combi_t46 6, 5,0,1,2,3,4
L700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
L704:	fn_link  L680
	fn_link  L692
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 32 ---
L716:	fn_link  L724
	fn_combi_t44 6, 0,1,5,2,4,3
L724:	fn_y
# --- block 33 ---
L728:	fn_link  L716
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 34 ---
L736:	fn_link  L752
	fn_link  L704
	fn_link  L728
	fn_combi_t12 5, 0,1,3,4,2,0
L752:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 35 ---
L756:	fn_link  L432
	fn_link  L736
	fn_link  L772
	fn_combi_t15 4, 0,1,3,2,3,0
L772:	fn_combi_t25 5, 0,2,1,3,4,4
# --- block 36 ---
L776:	fn_link  L784
	fn_combi_t16 5, 0,3,1,4,2,0
L784:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 37 ---
L788:	fn_link  L776
	fn_combi_t16 4, 2,3,0,1,3,0
# --- block 38 ---
L796:	fn_link  L788
	fn_link  L808
	fn_combi_t39 6, 0,1,2,5,3,4
L808:	fn_y
# --- block 39 ---
L812:	fn_link  L796
	fn_combi_t29 6, 0,1,5,2,4,3
# --- block 40 ---
L820:	fn_link  L812
	fn_combi_t26 5, 0,1,2,4,3,4
# --- block 41 ---
L828:	fn_link  L756
	fn_link  L820
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 42 ---
L840:	fn_link  L204
	fn_link  L828
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 43 ---
L852:	fn_link  L840
	fn_combi_t51 6, 4,0,1,2,3,5
# --- block 44 ---
WheelSieve1.notDivBy:	fn_link  L1020
	fn_link  L872
	fn_combi_t16 5, 2,0,1,3,4,0
L872:	fn_elink _error0
# --- block 45 ---
L876:	fn_link  WheelSieve1.notDivBy
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 46 ---
L884:	fn_link  L904
	fn_link  L908
	fn_link  NanoPrelude.rem
	fn_link  L912
	fn_combi_t32 6, 0,1,4,5,2,3
L904:	fn_combi_t0 2, 0,0,0,0,0,0
L908:	fn_elink _prim_gt
L912:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 47 ---
L920:	fn_link  L940
	fn_link  L944
	fn_link  L948
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,4,5,1,2,3
L940:	fn_combi_t0 2, 1,0,0,0,0,0
L944:	fn_combi_t0 2, 0,0,0,0,0,0
L948:	fn_elink _prim_gt
# --- block 48 ---
L952:	fn_link  L960
	fn_combi_t24 6, 0,1,5,2,3,4
L960:	fn_combi_t57 6, 0,1,2,3,4,5
# --- block 49 ---
L964:	fn_link  NanoPrelude.$26$26
	fn_link  L920
	fn_link  L952
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 50 ---
L980:	fn_link  L996
	fn_link  L884
	fn_link  L964
	fn_combi_t30 5, 0,3,1,3,4,2
L996:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 51 ---
L1000:	fn_link  L980
	fn_combi_t37 6, 0,1,3,5,2,4
# --- block 52 ---
L1008:	fn_link  L876
	fn_link  L1000
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 53 ---
L1020:	fn_link  L1008
	fn_link  L1032
	fn_combi_t46 6, 2,0,1,3,4,5
L1032:	fn_elink _error0
# --- block 54 ---
NanoPrelude.$7c$7c:	fn_link  L1044
	fn_combi_t2 3, 1,2,0,0,0,0
L1044:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 55 ---
NanoPrelude.$26$26:	fn_link  L1056
	fn_combi_t1 2, 1,0,0,0,0,0
L1056:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 56 ---
NanoPrelude.rem:	fn_link  L1072
	fn_link  L1096
	fn_combi_t8 4, 0,3,2,1,0,0
L1072:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1096:	fn_y
# --- block 57 ---
WheelSieve1.fromThenTo:	fn_link  L1236
	fn_link  L1112
	fn_combi_t32 5, 0,1,2,3,4,2
L1112:	fn_y
# --- block 58 ---
L1116:	fn_link  L1132
	fn_link  L1156
	fn_link  L1180
	fn_combi_t41 6, 0,3,4,1,5,2
L1132:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1156:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1180:	fn_y
# --- block 59 ---
L1184:	fn_link  L1196
	fn_link  L1200
	fn_combi_t50 5, 0,4,3,1,2,4
L1196:	fn_y
L1200:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 60 ---
L1204:	fn_link  L1216
	fn_link  L1220
	fn_combi_t38 5, 2,4,0,1,3,4
L1216:	fn_combi_t0 2, 0,0,0,0,0,0
L1220:	fn_elink _prim_le
# --- block 61 ---
L1224:	fn_link  L1184
	fn_link  L1204
	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 62 ---
L1236:	fn_link  L1116
	fn_link  L1224
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 63 ---
NanoPrelude.min:	fn_link  L1260
	fn_link  L1264
	fn_combi_t3 3, 0,1,2,0,0,0
L1260:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 64 ---
L1264:	fn_link  L1272
	fn_combi_t10 3, 2,1,0,2,1,0
L1272:	fn_elink _prim_le
# --- block 65 ---
NanoPrelude.head:	fn_link  L1288
	fn_link  L1292
	fn_combi_t2 3, 2,0,1,0,0,0
L1288:	fn_combi_t0 2, 0,0,0,0,0,0
L1292:	fn_elink _error0
# --- block 66 ---
NanoPrelude.tail:	fn_link  L1308
	fn_link  L1312
	fn_combi_t2 3, 2,0,1,0,0,0
L1308:	fn_combi_t0 2, 1,0,0,0,0,0
L1312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 67 ---
WheelSieve1.wheels:	fn_link  L1336
	fn_link  L1372
	fn_link  L1332
	fn_combi_t8 4, 0,1,2,3,0,0
L1332:	fn_y
# --- block 68 ---
L1336:	fn_link  WheelSieve1.nextSize
	fn_link  WheelSieve1.zipW
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 69 ---
L1348:	fn_link  L1360
	fn_link  L1364
	fn_combi_t2 4, 3,0,1,0,0,0
L1360:	fn_combi_t0 2, 0,0,0,0,0,0
L1364:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 70 ---
L1372:	fn_link  L1348
	fn_link  L1392
	fn_link  L1400
	fn_link  L1404
	fn_combi_t40 6, 0,1,2,3,4,5
L1392:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1400:	fn_combi_t2 3, 2,0,1,0,0,0
L1404:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 71 ---
WheelSieve1.zipW:	fn_link  L1460
	fn_link  L1420
	fn_combi_t3 3, 0,1,2,0,0,0
L1420:	fn_y
# --- block 72 ---
L1424:	fn_link  L1432
	fn_combi_t40 6, 0,1,2,4,3,5
L1432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 73 ---
L1436:	fn_link  L1444
	fn_combi_t48 6, 3,0,1,4,2,5
L1444:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 74 ---
L1448:	fn_link  L1424
	fn_link  L1436
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 75 ---
L1460:	fn_link  L1448
	fn_link  L1472
	fn_combi_t46 6, 4,0,1,2,3,5
L1472:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 76 ---
WheelSieve1.nextSize:	fn_link  L1836
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 77 ---
L1484:	fn_link  L1500
	fn_link  L1524
	fn_link  L1548
	fn_combi_t61 5, 0,4,0,3,1,2
L1500:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1524:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1548:	fn_y
# --- block 78 ---
L1552:	fn_link  L1484
	fn_link  L1568
	fn_link  WheelSieve1.fromThenTo
	fn_combi_t42 5, 0,1,4,2,3,4
L1568:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 79 ---
L1576:	fn_link  L1592
	fn_link  NanoPrelude.rem
	fn_link  L1596
	fn_combi_t32 6, 0,1,5,3,2,4
L1592:	fn_elink _prim_gt
L1596:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 80 ---
L1604:	fn_link  L1576
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 81 ---
L1612:	fn_link  L1620
	fn_combi_t24 5, 0,1,4,2,3,4
L1620:	fn_combi_t48 5, 0,4,1,4,2,3
# --- block 82 ---
L1624:	fn_link  L1640
	fn_link  L1604
	fn_link  L1612
	fn_combi_t26 5, 0,1,3,4,2,4
L1640:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 83 ---
L1644:	fn_link  L1652
	fn_combi_t24 6, 0,1,5,2,4,3
L1652:	fn_combi_t50 6, 0,5,1,2,4,3
# --- block 84 ---
L1656:	fn_link  L1676
	fn_link  L1700
	fn_link  L1624
	fn_link  L1644
	fn_combi_t10 5, 0,1,4,2,3,0
L1676:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1700:	fn_y
# --- block 85 ---
L1704:	fn_link  L1656
	fn_link  L1716
	fn_combi_t3 3, 0,1,2,0,0,0
L1716:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 86 ---
L1720:	fn_link  L1728
	fn_combi_t32 6, 0,1,3,4,5,2
L1728:	fn_y
# --- block 87 ---
L1732:	fn_link  L1704
	fn_link  L1720
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 88 ---
L1744:	fn_link  L1732
	fn_link  L1756
	fn_combi_t46 6, 5,0,1,2,3,4
L1756:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 89 ---
L1760:	fn_link  L1776
	fn_link  L1800
	fn_link  L1804
	fn_combi_t22 5, 0,1,3,4,2,0
L1776:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1800:	fn_y
L1804:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 90 ---
L1808:	fn_link  L1744
	fn_link  L1828
	fn_link  L1760
	fn_link  L1832
	fn_combi_t38 5, 0,1,4,2,3,4
L1828:	fn_y
L1832:	fn_combi_t47 6, 0,3,1,2,5,4
# --- block 91 ---
L1836:	fn_link  L1552
	fn_link  L1808
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 92 ---
WheelSieve1.squares:	fn_link  L1912
	fn_y
# --- block 93 ---
L1856:	fn_link  L1872
	fn_link  L1896
	fn_link  L1900
	fn_combi_t22 4, 0,1,3,3,2,0
L1872:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1896:	fn_y
L1900:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 94 ---
L1904:	fn_link  L1856
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 95 ---
L1912:	fn_link  L1904
	fn_link  L1924
	fn_combi_t6 4, 3,0,1,2,0,0
L1924:	fn_combi_t0 2, 0,0,0,0,0,0

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
