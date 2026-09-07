# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Sumpuz  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$3a
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.curry
	.globl	NanoPrelude.elem
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.fromJust
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.head
	.globl	NanoPrelude.length
	.globl	NanoPrelude.lookup
	.globl	NanoPrelude.map
	.globl	NanoPrelude.repeat
	.globl	NanoPrelude.snd
	.globl	NanoPrelude.tail
	.globl	NanoPrelude.takeWhile
	.globl	NanoPrelude.zip
	.globl	Primitives.primPerformIO
	.globl	Sumpuz.bindings
	.globl	Sumpuz.count
	.globl	Sumpuz.del
	.globl	Sumpuz.diff
	.globl	Sumpuz.divMod10
	.globl	Sumpuz.fx
	.globl	Sumpuz.fy
	.globl	Sumpuz.fz
	.globl	Sumpuz.ifNull
	.globl	Sumpuz.img
	.globl	Sumpuz.isSingleton
	.globl	Sumpuz.main
	.globl	Sumpuz.ofAll
	.globl	Sumpuz.rng
	.globl	Sumpuz.solns
	.globl	Sumpuz.solutions
	.globl	Sumpuz.sumMap
	.globl	Sumpuz.sumMapAcc
	.globl	Sumpuz.valid
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Sumpuz.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Sumpuz.main:	fn_link  L204
	fn_link  Sumpuz.count
	fn_combi_t4 2, 0,1,1,1,0,0
# --- block 3 ---
L40:	fn_link  L52
	fn_link  L56
	fn_combi_t2 4, 3,0,1,0,0,0
L52:	fn_combi_t0 2, 0,0,0,0,0,0
L56:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 4 ---
L64:	fn_link  L40
	fn_link  L76
	fn_combi_t2 4, 3,0,1,0,0,0
L76:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 5 ---
L84:	fn_link  L64
	fn_link  L96
	fn_combi_t2 4, 3,0,1,0,0,0
L96:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 6 ---
L104:	fn_link  L116
	fn_link  L84
	fn_combi_t2 4, 3,0,1,0,0,0
L116:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
L120:	fn_link  L132
	fn_link  L136
	fn_combi_t2 4, 3,0,1,0,0,0
L132:	fn_combi_t0 2, 0,0,0,0,0,0
L136:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 8 ---
L144:	fn_link  L120
	fn_link  L156
	fn_combi_t2 4, 3,0,1,0,0,0
L156:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 9 ---
L164:	fn_link  L144
	fn_link  L176
	fn_combi_t2 4, 3,0,1,0,0,0
L176:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 10 ---
L184:	fn_link  L164
	fn_link  L196
	fn_combi_t2 4, 3,0,1,0,0,0
L196:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L204:	fn_link  L104
	fn_link  L184
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 12 ---
Sumpuz.count:	fn_link  Sumpuz.fx
	fn_link  Sumpuz.sumMap
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 13 ---
Sumpuz.sumMap:	fn_link  L240
	fn_link  Sumpuz.sumMapAcc
	fn_combi_t4 4, 0,2,3,1,0,0
L240:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 14 ---
Sumpuz.sumMapAcc:	fn_link  L312
	fn_link  L260
	fn_combi_t3 3, 0,1,2,0,0,0
L260:	fn_y
# --- block 15 ---
L264:	fn_link  L276
	fn_link  L300
	fn_combi_t21 5, 0,3,2,4,1,0
L276:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L300:	fn_y
# --- block 16 ---
L304:	fn_link  L264
	fn_combi_t46 6, 2,5,0,1,3,4
# --- block 17 ---
L312:	fn_link  L304
	fn_combi_t46 5, 3,4,0,1,2,4
# --- block 18 ---
Sumpuz.fx:	fn_link  Sumpuz.fy
	fn_link  Sumpuz.sumMap
	fn_combi_t12 5, 0,1,4,3,2,0
# --- block 19 ---
Sumpuz.fy:	fn_link  Sumpuz.fz
	fn_link  Sumpuz.sumMap
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 20 ---
Sumpuz.fz:	fn_link  L360
	fn_link  L368
	fn_link  Sumpuz.valid
	fn_combi_t23 6, 0,3,4,5,1,2
L360:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L368:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 21 ---
Sumpuz.valid:	fn_link  L496
	fn_link  L540
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 22 ---
L388:	fn_link  L400
	fn_link  L404
	fn_combi_t2 3, 2,0,1,0,0,0
L400:	fn_combi_t0 2, 0,0,0,0,0,0
L404:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 23 ---
L412:	fn_link  L388
	fn_link  Sumpuz.solutions
	fn_combi_t9 5, 0,2,3,4,1,0
# --- block 24 ---
L424:	fn_link  L412
	fn_link  Sumpuz.isSingleton
	fn_link  L440
	fn_combi_t46 6, 0,1,2,3,4,5
L440:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 25 ---
L444:	fn_link  L460
	fn_link  L464
	fn_link  NanoPrelude.length
	fn_combi_t30 5, 0,4,0,3,1,2
L460:	fn_combi_t0 2, 0,0,0,0,0,0
L464:	fn_elink _prim_eq
# --- block 26 ---
L468:	fn_link  NanoPrelude.$26$26
	fn_combi_t40 5, 0,1,4,2,3,4
# --- block 27 ---
L476:	fn_link  L492
	fn_link  L444
	fn_link  L468
	fn_combi_t38 6, 0,1,3,2,4,5
L492:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 28 ---
L496:	fn_link  L424
	fn_link  L476
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 29 ---
L508:	fn_link  L524
	fn_link  L528
	fn_link  NanoPrelude.length
	fn_combi_t30 5, 0,4,0,3,1,2
L524:	fn_combi_t0 2, 0,0,0,0,0,0
L528:	fn_elink _prim_eq
# --- block 30 ---
L532:	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,3,2,4,5
# --- block 31 ---
L540:	fn_link  L556
	fn_link  L508
	fn_link  L532
	fn_combi_t5 4, 0,1,3,2,0,0
L556:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 32 ---
NanoPrelude.$26$26:	fn_link  L568
	fn_combi_t1 2, 1,0,0,0,0,0
L568:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
NanoPrelude.length:	fn_link  L584
	fn_link  L632
	fn_y
L584:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L592:	fn_link  L604
	fn_link  L628
	fn_combi_t8 5, 2,0,3,1,0,0
L604:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L628:	fn_y
# --- block 35 ---
L632:	fn_link  L592
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 36 ---
Sumpuz.isSingleton:	fn_link  L668
	fn_link  L652
	fn_combi_t2 3, 2,0,1,0,0,0
L652:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L656:	fn_link  L664
	fn_combi_t0 3, 0,0,0,0,0,0
L664:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
L668:	fn_link  L656
	fn_link  L680
	fn_combi_t2 4, 3,0,1,0,0,0
L680:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 39 ---
Sumpuz.solutions:	fn_link  L844
	fn_link  L952
	fn_link  L1172
	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 40 ---
L700:	fn_link  L724
	fn_link  L732
	fn_link  L740
	fn_link  Sumpuz.ifNull
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t32 6, 0,1,5,2,3,4
L724:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L732:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L740:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 41 ---
L748:	fn_link  NanoPrelude.snd
	fn_link  L700
	fn_link  Sumpuz.bindings
	fn_combi_t39 6, 0,4,1,5,2,3
# --- block 42 ---
L764:	fn_link  L788
	fn_link  L796
	fn_link  NanoPrelude.tail
	fn_link  Sumpuz.ifNull
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t52 6, 0,1,2,5,3,4
L788:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L796:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 43 ---
L804:	fn_link  L824
	fn_link  L764
	fn_link  NanoPrelude.head
	fn_link  Sumpuz.bindings
	fn_combi_t44 5, 0,1,4,2,4,3
L824:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 44 ---
L832:	fn_link  L804
	fn_link  Sumpuz.ofAll
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 45 ---
L844:	fn_link  L748
	fn_link  L832
	fn_combi_t46 6, 0,2,1,3,4,5
# --- block 46 ---
L856:	fn_link  NanoPrelude.tail
	fn_link  Sumpuz.solutions
	fn_combi_t6 4, 0,3,1,2,0,0
# --- block 47 ---
L868:	fn_link  NanoPrelude.head
	fn_link  NanoPrelude.fst
	fn_link  Sumpuz.solns
	fn_combi_t38 6, 0,1,4,5,2,3
# --- block 48 ---
L884:	fn_link  Sumpuz.ofAll
	fn_link  L896
	fn_combi_t62 6, 0,1,2,4,3,5
L896:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 49 ---
L900:	fn_link  L868
	fn_link  L884
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 50 ---
L912:	fn_link  L900
	fn_link  L924
	fn_combi_t32 6, 0,1,2,4,5,3
L924:	fn_combi_t24 6, 0,1,2,4,5,3
# --- block 51 ---
L928:	fn_link  L856
	fn_link  L912
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 52 ---
L940:	fn_link  L948
	fn_combi_t48 5, 1,0,2,4,3,4
L948:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 53 ---
L952:	fn_link  L928
	fn_link  L940
	fn_link  L968
	fn_combi_t15 5, 0,1,4,2,3,0
L968:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 54 ---
L972:	fn_link  L980
	fn_combi_t0 3, 0,0,0,0,0,0
L980:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 55 ---
L984:	fn_link  L996
	fn_link  L1000
	fn_combi_t2 4, 3,0,1,0,0,0
L996:	fn_combi_t0 2, 0,0,0,0,0,0
L1000:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 56 ---
L1008:	fn_link  L1028
	fn_link  L1032
	fn_link  NanoPrelude.fst
	fn_link  L1036
	fn_combi_t12 5, 0,1,4,2,3,0
L1028:	fn_combi_t0 2, 0,0,0,0,0,0
L1032:	fn_elink _prim_eq
L1036:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 57 ---
L1044:	fn_link  NanoPrelude.snd
	fn_link  L984
	fn_link  Sumpuz.bindings
	fn_link  L1008
	fn_link  L1068
	fn_combi_t24 6, 0,1,5,2,3,4
L1068:	fn_combi_t56 6, 0,1,5,2,3,4
# --- block 58 ---
L1072:	fn_link  L972
	fn_link  L1044
	fn_combi_t32 5, 4,0,2,2,3,1
# --- block 59 ---
L1084:	fn_link  L1096
	fn_link  NanoPrelude.snd
	fn_combi_t5 5, 4,0,2,1,0,0
L1096:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1100:	fn_link  L1120
	fn_link  L1124
	fn_link  NanoPrelude.fst
	fn_link  L1128
	fn_combi_t12 5, 0,1,4,2,3,0
L1120:	fn_combi_t0 2, 0,0,0,0,0,0
L1124:	fn_elink _prim_eq
L1128:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 61 ---
L1136:	fn_link  L1084
	fn_link  L1100
	fn_combi_t20 4, 2,0,3,1,3,0
# --- block 62 ---
L1148:	fn_link  L1072
	fn_link  L1136
	fn_combi_t56 5, 2,0,3,4,1,4
# --- block 63 ---
L1160:	fn_link  L1168
	fn_combi_t29 5, 0,1,4,2,4,3
L1168:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 64 ---
L1172:	fn_link  L1148
	fn_link  L1160
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 65 ---
NanoPrelude.fst:	fn_link  L1192
	fn_combi_t1 2, 1,0,0,0,0,0
L1192:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 66 ---
NanoPrelude.snd:	fn_link  L1204
	fn_combi_t1 2, 1,0,0,0,0,0
L1204:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 67 ---
Sumpuz.bindings:	fn_link  L1240
	fn_link  L1328
	fn_link  L1224
	fn_combi_t5 4, 0,1,3,2,0,0
L1224:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 68 ---
L1228:	fn_link  L1236
	fn_combi_t2 4, 3,1,0,0,0,0
L1236:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 69 ---
L1240:	fn_link  L1228
	fn_link  L1256
	fn_link  NanoPrelude.elem
	fn_combi_t37 6, 0,5,3,1,2,4
L1256:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
L1260:	fn_link  Sumpuz.rng
	fn_link  Sumpuz.diff
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 71 ---
L1272:	fn_link  L1260
	fn_link  NanoPrelude.repeat
	fn_link  NanoPrelude.zip
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 72 ---
L1288:	fn_link  Data.List_Type.$3a
	fn_link  L1304
	fn_link  NanoPrelude.map
	fn_combi_t40 5, 0,1,2,4,3,4
L1304:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 73 ---
L1308:	fn_link  L1272
	fn_link  L1288
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 74 ---
L1320:	fn_link  NanoPrelude.lookup
	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 75 ---
L1328:	fn_link  L1308
	fn_link  L1320
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 76 ---
NanoPrelude.lookup:	fn_link  L1400
	fn_link  L1352
	fn_combi_t3 3, 0,1,2,0,0,0
L1352:	fn_y
# --- block 77 ---
L1356:	fn_link  L1364
	fn_combi_t15 5, 4,1,0,2,3,0
L1364:	fn_elink _prim_eq
# --- block 78 ---
L1368:	fn_link  L1384
	fn_link  L1356
	fn_link  L1388
	fn_combi_t5 4, 0,1,3,2,0,0
L1384:	fn_combi_t1 3, 2,0,0,0,0,0
L1388:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 79 ---
L1392:	fn_link  L1368
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 80 ---
L1400:	fn_link  L1392
	fn_link  L1412
	fn_combi_t16 5, 4,0,1,2,3,0
L1412:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 81 ---
NanoPrelude.map:	fn_link  L1444
	fn_link  L1428
	fn_combi_t3 3, 0,1,2,0,0,0
L1428:	fn_y
# --- block 82 ---
L1432:	fn_link  L1440
	fn_combi_t15 5, 0,1,3,2,4,0
L1440:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 83 ---
L1444:	fn_link  L1432
	fn_link  L1456
	fn_combi_t16 5, 4,0,1,2,3,0
L1456:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 84 ---
Data.List_Type.$3a:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 85 ---
NanoPrelude.zip:	fn_link  L1512
	fn_link  L1476
	fn_combi_t6 4, 2,0,1,3,0,0
L1476:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 86 ---
L1480:	fn_link  L1488
	fn_combi_t44 6, 0,1,4,2,3,5
L1488:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 87 ---
L1492:	fn_link  NanoPrelude.zip
	fn_link  L1508
	fn_link  L1480
	fn_combi_t5 4, 0,1,3,2,0,0
L1508:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 88 ---
L1512:	fn_link  L1492
	fn_link  L1524
	fn_combi_t16 5, 2,0,1,3,4,0
L1524:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 89 ---
NanoPrelude.repeat:	fn_link  NanoPrelude.repeat
	fn_link  L1540
	fn_combi_t6 3, 0,2,1,2,0,0
L1540:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 90 ---
Sumpuz.diff:	fn_link  L1552
	fn_elink NanoPrelude.foldl
# --- block 91 ---
L1552:	fn_link  Sumpuz.del
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 92 ---
NanoPrelude.foldl:	fn_link  L1576
	fn_link  L1572
	fn_combi_t3 3, 0,1,2,0,0,0
L1572:	fn_y
# --- block 93 ---
L1576:	fn_link  L1584
	fn_combi_t46 5, 4,3,0,1,2,3
L1584:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 94 ---
Sumpuz.del:	fn_link  L1640
	fn_link  L1600
	fn_combi_t3 3, 0,1,2,0,0,0
L1600:	fn_y
# --- block 95 ---
L1604:	fn_link  L1612
	fn_combi_t6 4, 0,2,1,3,0,0
L1612:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1616:	fn_link  L1624
	fn_combi_t29 5, 3,1,0,2,4,4
L1624:	fn_elink _prim_eq
# --- block 97 ---
L1628:	fn_link  L1604
	fn_link  L1616
	fn_combi_t30 5, 0,2,1,3,4,4
# --- block 98 ---
L1640:	fn_link  L1628
	fn_link  L1652
	fn_combi_t16 5, 4,0,1,2,3,0
L1652:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 99 ---
Sumpuz.rng:	fn_link  NanoPrelude.snd
	fn_elink NanoPrelude.map
# --- block 100 ---
NanoPrelude.elem:	fn_link  L1700
	fn_link  L1676
	fn_combi_t3 3, 0,1,2,0,0,0
L1676:	fn_y
# --- block 101 ---
L1680:	fn_link  L1692
	fn_link  L1696
	fn_combi_t29 6, 4,2,0,3,5,1
L1692:	fn_combi_t0 2, 1,0,0,0,0,0
L1696:	fn_elink _prim_eq
# --- block 102 ---
L1700:	fn_link  L1680
	fn_link  L1712
	fn_combi_t16 5, 4,0,1,2,3,0
L1712:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 103 ---
Sumpuz.ofAll:	fn_link  L1740
	fn_link  L1728
	fn_combi_t3 3, 0,1,2,0,0,0
L1728:	fn_y
# --- block 104 ---
L1732:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 105 ---
L1740:	fn_link  L1732
	fn_link  L1752
	fn_combi_t16 5, 4,0,1,2,3,0
L1752:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
Data.List_Type.$2b$2b:	fn_link  L1784
	fn_link  L1768
	fn_combi_t5 4, 0,1,3,2,0,0
L1768:	fn_y
# --- block 107 ---
L1772:	fn_link  L1780
	fn_combi_t6 4, 0,2,1,3,0,0
L1780:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 108 ---
L1784:	fn_link  L1772
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 109 ---
Sumpuz.solns:	fn_link  L1872
	fn_link  L1988
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 110 ---
L1804:	fn_link  L1816
	fn_link  Sumpuz.img
	fn_combi_t4 4, 0,3,2,1,0,0
L1816:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 111 ---
L1840:	fn_link  Sumpuz.img
	fn_link  L1852
	fn_combi_t56 5, 0,1,4,3,2,4
L1852:	fn_y
# --- block 112 ---
L1856:	fn_link  L1868
	fn_link  Sumpuz.divMod10
	fn_combi_t63 6, 0,1,2,3,5,4
L1868:	fn_y
# --- block 113 ---
L1872:	fn_link  L1896
	fn_link  L1804
	fn_link  L1840
	fn_link  L1856
	fn_link  L1920
	fn_combi_t24 6, 0,1,5,2,3,4
L1896:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1920:	fn_combi_t33 6, 0,1,2,4,5,3
# --- block 114 ---
L1924:	fn_link  L1936
	fn_link  NanoPrelude.snd
	fn_combi_t5 5, 4,0,2,1,0,0
L1936:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 115 ---
L1940:	fn_link  L1924
	fn_link  Sumpuz.bindings
	fn_combi_t11 5, 0,2,1,4,3,0
# --- block 116 ---
L1952:	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.curry
	fn_link  Sumpuz.ofAll
	fn_combi_t20 5, 0,1,3,2,4,0
# --- block 117 ---
L1968:	fn_link  L1952
	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 118 ---
L1976:	fn_link  L1940
	fn_link  L1968
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 119 ---
L1988:	fn_link  L1976
	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 120 ---
NanoPrelude.curry:	fn_link  L2004
	fn_combi_t7 4, 1,0,2,3,0,0
L2004:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 121 ---
Sumpuz.divMod10:	fn_link  L2020
	fn_link  L2124
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 122 ---
L2020:	fn_link  L2028
	fn_combi_t2 3, 2,0,1,0,0,0
L2028:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 123 ---
L2036:	fn_link  L2048
	fn_link  L2072
	fn_combi_t13 5, 4,0,2,1,3,0
L2048:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2072:	fn_y
# --- block 124 ---
L2076:	fn_link  L2036
	fn_link  L2096
	fn_link  L2120
	fn_link  Sumpuz.divMod10
	fn_combi_t13 5, 0,1,4,2,3,0
L2096:	fn_force
	fn_tor a0
	addiw a0,a0,-10
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2120:	fn_y
# --- block 125 ---
L2124:	fn_link  L2076
	fn_link  L2140
	fn_link  L2144
	fn_combi_t15 4, 0,3,1,2,3,0
L2140:	fn_elink _prim_le
L2144:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 126 ---
Sumpuz.img:	fn_link  NanoPrelude.lookup
	fn_link  NanoPrelude.fromJust
	fn_combi_t7 4, 0,1,3,2,0,0
# --- block 127 ---
NanoPrelude.fromJust:	fn_link  L2176
	fn_link  L2180
	fn_combi_t2 3, 2,0,1,0,0,0
L2176:	fn_combi_t0 1, 0,0,0,0,0,0
L2180:	fn_elink _error0
# --- block 128 ---
NanoPrelude.head:	fn_link  L2196
	fn_link  L2200
	fn_combi_t2 3, 2,0,1,0,0,0
L2196:	fn_combi_t0 2, 0,0,0,0,0,0
L2200:	fn_elink _error0
# --- block 129 ---
NanoPrelude.tail:	fn_link  L2216
	fn_link  L2220
	fn_combi_t2 3, 2,0,1,0,0,0
L2216:	fn_combi_t0 2, 1,0,0,0,0,0
L2220:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 130 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L2240
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 131 ---
L2240:	fn_link  L2256
	fn_link  L2260
	fn_link  L2264
	fn_combi_t10 5, 3,4,0,1,2,0
L2256:	fn_combi_t0 2, 1,0,0,0,0,0
L2260:	fn_combi_t0 2, 0,0,0,0,0,0
L2264:	fn_elink _prim_le
# --- block 132 ---
NanoPrelude.takeWhile:	fn_link  L2308
	fn_link  L2280
	fn_combi_t3 3, 0,1,2,0,0,0
L2280:	fn_y
# --- block 133 ---
L2284:	fn_link  L2292
	fn_combi_t6 4, 0,2,1,3,0,0
L2292:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 134 ---
L2296:	fn_link  L2304
	fn_combi_t42 5, 1,3,0,2,3,4
L2304:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 135 ---
L2308:	fn_link  L2284
	fn_link  L2296
	fn_link  L2324
	fn_combi_t48 6, 5,0,1,3,2,4
L2324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
NanoPrelude.enumFrom:	fn_link  L2348
	fn_link  L2372
	fn_link  NanoPrelude.enumFrom
	fn_link  L2376
	fn_combi_t50 5, 0,4,1,2,4,3
L2348:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2372:	fn_y
L2376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 137 ---
Sumpuz.ifNull:	fn_link  L2388
	fn_combi_t6 4, 1,2,0,3,0,0
L2388:	fn_combi_t0 3, 0,0,0,0,0,0

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
_unimpprim_addiw$20$2d10:
	la a0, _unimpprim_addiw$20$2d10$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d10$name:
	.asciz "addiw -10"
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
