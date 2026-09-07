# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/WheelSieve2  (entry @0)
	.text
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.head
	.globl	NanoPrelude.min
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.tail
	.globl	Primitives.primPerformIO
	.globl	WheelSieve2.bench
	.globl	WheelSieve2.dropW
	.globl	WheelSieve2.nextSize
	.globl	WheelSieve2.prime
	.globl	WheelSieve2.spanL
	.globl	WheelSieve2.spiral
	.globl	WheelSieve2.squares
	.globl	WheelSieve2.wheels
	.globl	WheelSieve2.zipW3
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  WheelSieve2.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
WheelSieve2.bench:	fn_link  L36
	fn_elink WheelSieve2.prime
L36:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 3 ---
WheelSieve2.prime:	fn_link  L88
	fn_link  L64
	fn_link  L176
	fn_link  L68
	fn_combi_t31 5, 0,1,2,3,4,4
L64:	fn_y
L68:	fn_y
# --- block 4 ---
L72:	fn_link  WheelSieve2.squares
	fn_link  WheelSieve2.wheels
	fn_link  WheelSieve2.spiral
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
WheelSieve2.spiral:	fn_link  L224
	fn_link  L760
	fn_link  L772
	fn_link  L208
	fn_combi_t10 5, 0,1,4,2,3,0
L208:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 11 ---
L212:	fn_link  NanoPrelude.tail
	fn_link  WheelSieve2.spiral
	fn_combi_t39 5, 0,4,1,2,1,3
# --- block 12 ---
L224:	fn_link  L212
	fn_combi_t9 5, 0,1,2,4,3,0
# --- block 13 ---
L232:	fn_link  L244
	fn_link  L268
	fn_combi_t55 3, 2,0,2,2,1,1
L244:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L268:	fn_y
# --- block 14 ---
L272:	fn_link  L288
	fn_link  L232
	fn_link  L312
	fn_combi_t61 4, 0,3,0,1,3,2
L288:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L312:	fn_y
# --- block 15 ---
L316:	fn_link  NanoPrelude.head
	fn_link  L272
	fn_link  NanoPrelude.min
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 16 ---
L332:	fn_link  L344
	fn_link  L368
	fn_combi_t8 4, 0,3,2,1,0,0
L344:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L368:	fn_y
# --- block 17 ---
L372:	fn_link  L388
	fn_link  L392
	fn_link  L396
	fn_combi_t10 5, 3,4,0,1,2,0
L388:	fn_combi_t0 2, 1,0,0,0,0,0
L392:	fn_combi_t0 2, 0,0,0,0,0,0
L396:	fn_elink _prim_lt
# --- block 18 ---
L400:	fn_link  L372
	fn_link  WheelSieve2.dropW
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 19 ---
L412:	fn_link  L428
	fn_link  L432
	fn_link  L436
	fn_combi_t10 5, 3,4,0,1,2,0
L428:	fn_combi_t0 2, 1,0,0,0,0,0
L432:	fn_combi_t0 2, 0,0,0,0,0,0
L436:	fn_elink _prim_lt
# --- block 20 ---
L440:	fn_link  L464
	fn_link  L468
	fn_link  L472
	fn_link  L476
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,1,5,2,3,4
L464:	fn_combi_t0 2, 1,0,0,0,0,0
L468:	fn_combi_t0 2, 0,0,0,0,0,0
L472:	fn_elink _prim_eq
L476:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 21 ---
L484:	fn_link  L440
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 22 ---
L492:	fn_link  L400
	fn_link  L412
	fn_link  L484
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 23 ---
L508:	fn_link  L524
	fn_link  L492
	fn_link  L528
	fn_combi_t5 4, 0,1,3,2,0,0
L524:	fn_combi_t2 4, 3,0,1,0,0,0
L528:	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 24 ---
L532:	fn_link  L332
	fn_link  L508
	fn_combi_t42 6, 0,2,3,1,4,5
# --- block 25 ---
L544:	fn_link  L556
	fn_link  L580
	fn_combi_t22 5, 3,0,2,4,1,0
L556:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L580:	fn_y
# --- block 26 ---
L584:	fn_link  NanoPrelude.foldr
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 27 ---
L592:	fn_link  L544
	fn_link  L584
	fn_combi_t30 6, 0,4,1,2,5,3
# --- block 28 ---
L604:	fn_link  NanoPrelude.foldr
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 29 ---
L612:	fn_link  L604
	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 30 ---
L620:	fn_link  L592
	fn_link  L612
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 31 ---
L632:	fn_link  L640
	fn_combi_t38 6, 2,4,0,1,3,5
L640:	fn_elink _prim_lt
# --- block 32 ---
L644:	fn_link  L656
	fn_link  L632
	fn_combi_t28 5, 0,2,3,1,4,4
L656:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 33 ---
L660:	fn_link  NanoPrelude.foldr
	fn_combi_t47 6, 0,1,2,3,5,4
# --- block 34 ---
L668:	fn_link  L660
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 35 ---
L676:	fn_link  L692
	fn_link  L644
	fn_link  L668
	fn_combi_t24 6, 0,1,5,2,3,4
L692:	fn_y
# --- block 36 ---
L696:	fn_link  L620
	fn_link  L676
	fn_combi_t32 5, 0,1,2,3,4,2
# --- block 37 ---
L708:	fn_link  L696
	fn_link  L720
	fn_combi_t32 5, 0,1,2,3,4,4
L720:	fn_combi_t28 5, 0,2,4,3,4,1
# --- block 38 ---
L724:	fn_link  L732
	fn_combi_t24 6, 0,1,5,2,3,4
L732:	fn_combi_t28 5, 0,4,3,1,3,2
# --- block 39 ---
L736:	fn_link  L532
	fn_link  L708
	fn_link  L724
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 40 ---
L752:	fn_link  L736
	fn_combi_t57 6, 4,0,1,2,3,5
# --- block 41 ---
L760:	fn_link  L316
	fn_link  L752
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 42 ---
L772:	fn_link  L780
	fn_combi_t48 5, 1,0,2,4,3,4
L780:	fn_elink _error0
# --- block 43 ---
NanoPrelude.foldr:	fn_link  L800
	fn_link  L796
	fn_combi_t7 4, 0,1,2,3,0,0
L796:	fn_y
# --- block 44 ---
L800:	fn_link  L808
	fn_combi_t16 5, 4,2,0,1,3,0
L808:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 45 ---
NanoPrelude.$7c$7c:	fn_link  L820
	fn_combi_t2 3, 1,2,0,0,0,0
L820:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 46 ---
WheelSieve2.dropW:	fn_link  L876
	fn_link  L836
	fn_combi_t3 3, 0,1,2,0,0,0
L836:	fn_y
# --- block 47 ---
L840:	fn_link  L848
	fn_combi_t16 4, 1,2,0,2,3,0
L848:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 48 ---
L852:	fn_link  L868
	fn_link  L840
	fn_link  L872
	fn_combi_t5 4, 0,1,3,2,0,0
L868:	fn_combi_t0 1, 0,0,0,0,0,0
L872:	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 49 ---
L876:	fn_link  L852
	fn_link  L888
	fn_combi_t16 5, 4,0,1,2,3,0
L888:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 50 ---
NanoPrelude.min:	fn_link  L904
	fn_link  L908
	fn_combi_t3 3, 0,1,2,0,0,0
L904:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 51 ---
L908:	fn_link  L916
	fn_combi_t10 3, 2,1,0,2,1,0
L916:	fn_elink _prim_le
# --- block 52 ---
NanoPrelude.head:	fn_link  L932
	fn_link  L936
	fn_combi_t2 3, 2,0,1,0,0,0
L932:	fn_combi_t0 2, 0,0,0,0,0,0
L936:	fn_elink _error0
# --- block 53 ---
NanoPrelude.tail:	fn_link  L952
	fn_link  L956
	fn_combi_t2 3, 2,0,1,0,0,0
L952:	fn_combi_t0 2, 1,0,0,0,0,0
L956:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
WheelSieve2.wheels:	fn_link  WheelSieve2.squares
	fn_link  L976
	fn_link  L1044
	fn_combi_t20 4, 0,1,3,2,3,0
# --- block 55 ---
L976:	fn_link  WheelSieve2.wheels
	fn_link  WheelSieve2.nextSize
	fn_link  WheelSieve2.zipW3
	fn_combi_t11 4, 0,1,2,3,3,0
# --- block 56 ---
L992:	fn_link  L1004
	fn_link  L1008
	fn_combi_t2 4, 3,0,1,0,0,0
L1004:	fn_combi_t0 2, 0,0,0,0,0,0
L1008:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 57 ---
L1016:	fn_link  L1032
	fn_link  L992
	fn_link  L1036
	fn_combi_t4 4, 3,0,1,2,0,0
L1032:	fn_combi_t0 2, 0,0,0,0,0,0
L1036:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 58 ---
L1044:	fn_link  L1016
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 59 ---
WheelSieve2.zipW3:	fn_link  L1144
	fn_link  L1064
	fn_combi_t3 3, 0,1,2,0,0,0
L1064:	fn_y
# --- block 60 ---
L1068:	fn_link  L1076
	fn_combi_t18 5, 0,1,2,3,4,0
L1076:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 61 ---
L1080:	fn_link  L1088
	fn_combi_t26 6, 0,1,3,5,2,4
L1088:	fn_combi_t46 6, 0,4,1,2,3,5
# --- block 62 ---
L1092:	fn_link  L1100
	fn_combi_t46 6, 1,0,2,3,4,5
L1100:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 63 ---
L1104:	fn_link  L1112
	fn_combi_t47 6, 1,0,2,3,4,5
L1112:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 64 ---
L1116:	fn_link  L1124
	fn_combi_t47 6, 1,0,2,3,5,4
L1124:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 65 ---
L1128:	fn_link  L1092
	fn_link  L1104
	fn_link  L1116
	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 66 ---
L1144:	fn_link  L1068
	fn_link  L1080
	fn_link  L1128
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 67 ---
WheelSieve2.nextSize:	fn_link  L1820
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 68 ---
L1168:	fn_link  L1184
	fn_link  NanoPrelude.rem
	fn_link  L1188
	fn_combi_t18 5, 0,1,4,3,2,0
L1184:	fn_elink _prim_gt
L1188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 69 ---
L1196:	fn_link  L1208
	fn_link  L1232
	fn_combi_t8 4, 0,3,2,1,0,0
L1208:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1232:	fn_y
# --- block 70 ---
L1236:	fn_link  L1252
	fn_link  NanoPrelude.rem
	fn_link  L1256
	fn_combi_t32 6, 0,1,5,3,2,4
L1252:	fn_elink _prim_gt
L1256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 71 ---
L1264:	fn_link  L1280
	fn_link  L1236
	fn_link  L1284
	fn_combi_t5 4, 0,1,3,2,0,0
L1280:	fn_combi_t2 4, 3,0,1,0,0,0
L1284:	fn_combi_t42 4, 0,3,2,1,2,3
# --- block 72 ---
L1288:	fn_link  L1196
	fn_link  L1264
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 73 ---
L1300:	fn_link  L1312
	fn_link  L1336
	fn_combi_t3 3, 0,2,1,0,0,0
L1312:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1336:	fn_y
# --- block 74 ---
L1340:	fn_link  L1352
	fn_link  L1376
	fn_combi_t8 4, 0,2,3,1,0,0
L1352:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1376:	fn_y
# --- block 75 ---
L1380:	fn_link  L1392
	fn_link  L1416
	fn_combi_t41 6, 3,0,4,1,2,5
L1392:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1416:	fn_y
# --- block 76 ---
L1420:	fn_link  L1340
	fn_link  L1380
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 77 ---
L1432:	fn_link  NanoPrelude.foldr
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 78 ---
L1440:	fn_link  L1432
	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 79 ---
L1448:	fn_link  L1420
	fn_link  L1440
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 80 ---
L1460:	fn_link  NanoPrelude.foldr
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 81 ---
L1468:	fn_link  L1460
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 82 ---
L1476:	fn_link  L1468
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 83 ---
L1484:	fn_link  L1448
	fn_link  L1476
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 84 ---
L1496:	fn_link  L1508
	fn_link  L1512
	fn_combi_t29 6, 4,0,1,2,5,3
L1508:	fn_elink _prim_eq
L1512:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 85 ---
L1520:	fn_link  L1496
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 86 ---
L1528:	fn_link  L1520
	fn_link  L1540
	fn_combi_t33 6, 0,1,2,5,3,4
L1540:	fn_y
# --- block 87 ---
L1544:	fn_link  L1528
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 88 ---
L1552:	fn_link  L1300
	fn_link  L1572
	fn_link  L1484
	fn_link  L1544
	fn_combi_t38 6, 0,1,5,2,3,4
L1572:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 89 ---
L1576:	fn_link  NanoPrelude.foldr
	fn_combi_t30 6, 0,4,1,5,2,3
# --- block 90 ---
L1584:	fn_link  L1576
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 91 ---
L1592:	fn_link  L1552
	fn_link  L1584
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 92 ---
L1604:	fn_link  L1620
	fn_link  L1624
	fn_link  L1628
	fn_combi_t10 5, 3,4,0,1,2,0
L1620:	fn_combi_t0 2, 1,0,0,0,0,0
L1624:	fn_combi_t0 2, 0,0,0,0,0,0
L1628:	fn_elink _prim_le
# --- block 93 ---
L1632:	fn_link  WheelSieve2.spanL
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 94 ---
L1640:	fn_link  L1604
	fn_link  L1632
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 95 ---
L1652:	fn_link  L1668
	fn_link  L1692
	fn_link  L1696
	fn_combi_t22 5, 0,1,3,4,2,0
L1668:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1692:	fn_y
L1696:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 96 ---
L1700:	fn_link  L1720
	fn_link  NanoPrelude.foldr
	fn_link  L1652
	fn_link  L1724
	fn_combi_t26 6, 0,1,4,5,2,3
L1720:	fn_combi_t0 2, 0,0,0,0,0,0
L1724:	fn_combi_t53 6, 0,1,4,5,2,3
# --- block 97 ---
L1728:	fn_link  L1744
	fn_link  L1700
	fn_link  L1748
	fn_combi_t12 5, 0,1,3,4,2,0
L1744:	fn_combi_t0 2, 1,0,0,0,0,0
L1748:	fn_combi_t37 5, 0,2,3,4,4,1
# --- block 98 ---
L1752:	fn_link  L1760
	fn_combi_t45 5, 0,1,4,2,3,4
L1760:	fn_combi_t46 5, 0,3,1,4,3,2
# --- block 99 ---
L1764:	fn_link  L1752
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 100 ---
L1772:	fn_link  L1640
	fn_link  L1728
	fn_link  L1764
	fn_combi_t29 6, 0,1,3,2,5,4
# --- block 101 ---
L1788:	fn_link  L1592
	fn_link  L1772
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 102 ---
L1800:	fn_link  L1288
	fn_link  L1788
	fn_link  L1816
	fn_combi_t15 4, 0,1,3,2,3,0
L1816:	fn_combi_t23 6, 0,3,4,5,1,2
# --- block 103 ---
L1820:	fn_link  L1840
	fn_link  L1168
	fn_link  L1844
	fn_link  L1800
	fn_combi_t47 5, 0,4,1,2,4,3
L1840:	fn_combi_t2 4, 3,0,1,0,0,0
L1844:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 104 ---
WheelSieve2.spanL:	fn_link  L1972
	fn_link  L1860
	fn_combi_t3 3, 0,1,2,0,0,0
L1860:	fn_y
# --- block 105 ---
L1864:	fn_link  L1872
	fn_combi_t1 2, 1,0,0,0,0,0
L1872:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 106 ---
L1876:	fn_link  L1888
	fn_link  L1892
	fn_combi_t34 6, 5,0,2,4,1,3
L1888:	fn_combi_t0 2, 0,0,0,0,0,0
L1892:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 107 ---
L1896:	fn_link  L1864
	fn_link  L1876
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 108 ---
L1908:	fn_link  L1896
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 109 ---
L1916:	fn_link  L1928
	fn_link  L1932
	fn_combi_t16 5, 4,0,1,2,3,0
L1928:	fn_combi_t2 4, 3,0,1,0,0,0
L1932:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 110 ---
L1936:	fn_link  L1916
	fn_link  L1952
	fn_link  L1956
	fn_combi_t5 4, 0,1,3,2,0,0
L1952:	fn_combi_t39 5, 0,3,1,4,2,4
L1956:	fn_combi_t29 4, 0,1,3,2,3,3
# --- block 111 ---
L1960:	fn_link  L1968
	fn_combi_t2 2, 1,0,0,0,0,0
L1968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
L1972:	fn_link  L1908
	fn_link  L1936
	fn_link  L1960
	fn_combi_t48 6, 5,0,1,3,2,4
# --- block 113 ---
NanoPrelude.rem:	fn_link  L2000
	fn_link  L2024
	fn_combi_t8 4, 0,3,2,1,0,0
L2000:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2024:	fn_y
# --- block 114 ---
WheelSieve2.squares:	fn_link  L2092
	fn_y
# --- block 115 ---
L2036:	fn_link  L2052
	fn_link  L2076
	fn_link  L2080
	fn_combi_t22 4, 0,1,3,3,2,0
L2052:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2076:	fn_y
L2080:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 116 ---
L2084:	fn_link  L2036
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 117 ---
L2092:	fn_link  L2084
	fn_link  L2104
	fn_combi_t6 4, 3,0,1,2,0,0
L2104:	fn_combi_t0 2, 0,0,0,0,0,0

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
