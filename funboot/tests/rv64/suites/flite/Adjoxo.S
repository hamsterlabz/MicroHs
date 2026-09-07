# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Adjoxo  (entry @0)
	.text
	.globl	Adjoxo.adjudicate
	.globl	Adjoxo.analysis
	.globl	Adjoxo.bestOf
	.globl	Adjoxo.cmp
	.globl	Adjoxo.diff
	.globl	Adjoxo.gridFull
	.globl	Adjoxo.hasLine
	.globl	Adjoxo.insert
	.globl	Adjoxo.inverse
	.globl	Adjoxo.main
	.globl	Adjoxo.moveval
	.globl	Adjoxo.opp
	.globl	Adjoxo.report
	.globl	Adjoxo.side
	.globl	Adjoxo.subset
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.foldr1
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.null
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Adjoxo.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Adjoxo.main:	fn_link  L64
	fn_link  L108
	fn_elink Adjoxo.adjudicate
# --- block 3 ---
L40:	fn_link  L52
	fn_link  L56
	fn_combi_t2 4, 3,0,1,0,0,0
L52:	fn_combi_t0 2, 0,0,0,0,0,0
L56:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 4 ---
L64:	fn_link  L40
	fn_link  L76
	fn_combi_t2 4, 3,0,1,0,0,0
L76:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 5 ---
L84:	fn_link  L96
L88:	fn_link  L100
	fn_combi_t2 4, 3,0,1,0,0,0
L96:	fn_combi_t0 2, 0,0,0,0,0,0
L100:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 6 ---
L108:	fn_link  L84
	fn_link  L120
	fn_combi_t2 4, 3,0,1,0,0,0
L120:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 7 ---
Adjoxo.adjudicate:	fn_link  L140
	fn_link  L304
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 8 ---
L140:	fn_link  L156
	fn_link  Adjoxo.analysis
	fn_link  Adjoxo.report
	fn_combi_t12 5, 0,1,4,3,2,0
L156:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 9 ---
L160:	fn_link  L176
	fn_link  Adjoxo.analysis
	fn_link  Adjoxo.report
	fn_combi_t12 5, 0,1,3,4,2,0
L176:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 10 ---
L180:	fn_link  L192
	fn_link  L196
	fn_elink Adjoxo.report
L192:	fn_combi_t0 2, 1,0,0,0,0,0
L196:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 11 ---
L200:	fn_link  L212
	fn_link  L216
	fn_elink Adjoxo.report
L212:	fn_combi_t0 2, 0,0,0,0,0,0
L216:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 12 ---
L220:	fn_link  L236
	fn_link  Adjoxo.analysis
	fn_link  Adjoxo.report
	fn_combi_t12 5, 0,1,4,3,2,0
L236:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 13 ---
L240:	fn_link  L200
	fn_link  L220
	fn_link  Adjoxo.hasLine
	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 14 ---
L256:	fn_link  L180
	fn_link  L240
	fn_link  Adjoxo.hasLine
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 15 ---
L272:	fn_link  NanoPrelude.length
	fn_link  Adjoxo.cmp
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 16 ---
L284:	fn_link  L256
	fn_link  L272
	fn_link  L300
	fn_combi_t15 4, 0,1,3,2,3,0
L300:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 17 ---
L304:	fn_link  L160
	fn_link  L284
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 18 ---
Adjoxo.cmp:	fn_link  L332
	fn_link  L336
	fn_link  L364
	fn_combi_t10 4, 0,1,3,2,3,0
L332:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 19 ---
L336:	fn_link  L352
	fn_link  L356
	fn_link  L360
	fn_combi_t10 5, 4,3,0,1,2,0
L352:	fn_combi_t0 3, 1,0,0,0,0,0
L356:	fn_combi_t0 3, 2,0,0,0,0,0
L360:	fn_elink _prim_le
# --- block 20 ---
L364:	fn_link  L372
	fn_combi_t29 5, 4,3,0,1,4,2
L372:	fn_elink _prim_eq
# --- block 21 ---
NanoPrelude.length:	fn_link  L388
	fn_link  L436
	fn_y
L388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 22 ---
L396:	fn_link  L408
	fn_link  L432
	fn_combi_t8 5, 2,0,3,1,0,0
L408:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L432:	fn_y
# --- block 23 ---
L436:	fn_link  L396
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 24 ---
Adjoxo.hasLine:	fn_link  L1020
	fn_link  L1084
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 25 ---
L464:	fn_link  L476
	fn_link  L480
	fn_combi_t2 4, 3,0,1,0,0,0
L476:	fn_combi_t0 2, 0,0,0,0,0,0
L480:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 26 ---
L488:	fn_link  L464
	fn_link  L500
	fn_combi_t2 4, 3,0,1,0,0,0
L500:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 27 ---
L508:	fn_link  L488
	fn_link  L520
	fn_combi_t2 4, 3,0,1,0,0,0
L520:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 28 ---
L528:	fn_link  L508
	fn_elink Adjoxo.subset
# --- block 29 ---
L536:	fn_link  L548
	fn_link  L552
	fn_combi_t2 4, 3,0,1,0,0,0
L548:	fn_combi_t0 2, 0,0,0,0,0,0
L552:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 30 ---
L560:	fn_link  L536
	fn_link  L572
	fn_combi_t2 4, 3,0,1,0,0,0
L572:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 31 ---
L580:	fn_link  L560
	fn_link  L592
	fn_combi_t2 4, 3,0,1,0,0,0
L592:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 32 ---
L600:	fn_link  L528
	fn_link  L580
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 33 ---
L620:	fn_link  L632
	fn_link  L636
	fn_combi_t2 4, 3,0,1,0,0,0
L632:	fn_combi_t0 2, 0,0,0,0,0,0
L636:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 34 ---
L644:	fn_link  L620
	fn_link  L656
	fn_combi_t2 4, 3,0,1,0,0,0
L656:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 35 ---
L664:	fn_link  L644
	fn_link  L676
	fn_combi_t2 4, 3,0,1,0,0,0
L676:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 36 ---
L684:	fn_link  L600
	fn_link  L664
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 37 ---
L704:	fn_link  L716
	fn_link  L720
	fn_combi_t2 4, 3,0,1,0,0,0
L716:	fn_combi_t0 2, 0,0,0,0,0,0
L720:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 38 ---
L728:	fn_link  L704
	fn_link  L740
	fn_combi_t2 4, 3,0,1,0,0,0
L740:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 39 ---
L748:	fn_link  L728
	fn_link  L760
	fn_combi_t2 4, 3,0,1,0,0,0
L760:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 40 ---
L768:	fn_link  L684
	fn_link  L748
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 41 ---
L788:	fn_link  L800
	fn_link  L804
	fn_combi_t2 4, 3,0,1,0,0,0
L800:	fn_combi_t0 2, 0,0,0,0,0,0
L804:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 42 ---
L812:	fn_link  L788
	fn_link  L824
	fn_combi_t2 4, 3,0,1,0,0,0
L824:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 43 ---
L832:	fn_link  L812
	fn_link  L844
	fn_combi_t2 4, 3,0,1,0,0,0
L844:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 44 ---
L852:	fn_link  L768
	fn_link  L832
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 45 ---
L872:	fn_link  L884
	fn_link  L888
	fn_combi_t2 4, 3,0,1,0,0,0
L884:	fn_combi_t0 2, 0,0,0,0,0,0
L888:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 46 ---
L896:	fn_link  L872
	fn_link  L908
	fn_combi_t2 4, 3,0,1,0,0,0
L908:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 47 ---
L916:	fn_link  L896
	fn_link  L928
	fn_combi_t2 4, 3,0,1,0,0,0
L928:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 48 ---
L936:	fn_link  L852
	fn_link  L916
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 49 ---
L956:	fn_link  L968
	fn_link  L972
	fn_combi_t2 4, 3,0,1,0,0,0
L968:	fn_combi_t0 2, 0,0,0,0,0,0
L972:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 50 ---
L980:	fn_link  L956
	fn_link  L992
	fn_combi_t2 4, 3,0,1,0,0,0
L992:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 51 ---
L1000:	fn_link  L980
	fn_link  L1012
	fn_combi_t2 4, 3,0,1,0,0,0
L1012:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 52 ---
L1020:	fn_link  L936
	fn_link  L1000
	fn_link  Adjoxo.subset
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 53 ---
L1040:	fn_link  L1052
	fn_link  L1056
	fn_combi_t2 4, 3,0,1,0,0,0
L1052:	fn_combi_t0 2, 0,0,0,0,0,0
L1056:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 54 ---
L1064:	fn_link  L1040
	fn_link  L1076
	fn_combi_t2 4, 3,0,1,0,0,0
L1076:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 55 ---
L1084:	fn_link  L1064
	fn_link  L1096
	fn_combi_t2 4, 3,0,1,0,0,0
L1096:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 56 ---
NanoPrelude.$7c$7c:	fn_link  L1112
	fn_combi_t2 3, 1,2,0,0,0,0
L1112:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 57 ---
Adjoxo.subset:	fn_link  Adjoxo.diff
	fn_link  NanoPrelude.null
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 58 ---
NanoPrelude.null:	fn_link  L1144
	fn_link  L1140
	fn_combi_t2 3, 2,0,1,0,0,0
L1140:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 59 ---
L1144:	fn_link  L1152
	fn_combi_t0 3, 0,0,0,0,0,0
L1152:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
Adjoxo.diff:	fn_link  L1308
	fn_link  L1168
	fn_combi_t6 4, 2,0,1,3,0,0
L1168:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 61 ---
L1172:	fn_link  L1184
	fn_link  Adjoxo.diff
	fn_combi_t7 4, 0,1,2,3,0,0
L1184:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 62 ---
L1188:	fn_link  L1200
	fn_link  Adjoxo.diff
	fn_combi_t16 5, 0,2,1,3,4,0
L1200:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 63 ---
L1204:	fn_link  Adjoxo.diff
	fn_link  Adjoxo.cmp
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 64 ---
L1216:	fn_link  L1224
	fn_combi_t26 6, 0,1,4,5,2,3
L1224:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 65 ---
L1228:	fn_link  L1244
	fn_link  L1204
	fn_link  L1216
	fn_combi_t10 4, 0,1,3,2,3,0
L1244:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 66 ---
L1248:	fn_link  L1188
	fn_link  L1228
	fn_link  L1264
	fn_combi_t5 4, 0,1,3,2,0,0
L1264:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 67 ---
L1268:	fn_link  L1248
	fn_link  L1280
	fn_combi_t38 5, 0,1,2,4,3,4
L1280:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 68 ---
L1284:	fn_link  L1172
	fn_link  L1268
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 69 ---
L1296:	fn_link  L1304
	fn_combi_t40 5, 1,0,3,4,2,4
L1304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 70 ---
L1308:	fn_link  L1284
	fn_link  L1296
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 71 ---
Adjoxo.report:	fn_link  Adjoxo.side
	fn_link  L1332
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 72 ---
L1332:	fn_link  Adjoxo.opp
	fn_link  Adjoxo.side
	fn_link  L1348
	fn_combi_t17 5, 3,0,1,2,4,0
L1348:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 73 ---
Adjoxo.side:	fn_link  L1368
	fn_link  L1376
	fn_combi_t2 3, 2,0,1,0,0,0
L1368:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
L1376:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 74 ---
Adjoxo.opp:	fn_link  L1396
	fn_link  L1400
	fn_combi_t2 3, 2,0,1,0,0,0
L1396:	fn_combi_t0 2, 0,0,0,0,0,0
L1400:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 75 ---
Adjoxo.analysis:	fn_link  L1420
	fn_link  L1512
	fn_link  Adjoxo.hasLine
	fn_combi_t30 5, 0,4,1,3,4,2
L1420:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 76 ---
L1424:	fn_link  L1448
	fn_link  L1456
	fn_link  NanoPrelude.enumFromTo
	fn_link  Adjoxo.diff
	fn_link  Adjoxo.diff
	fn_combi_t54 6, 0,1,2,3,4,5
L1448:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L1456:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 77 ---
L1464:	fn_link  Adjoxo.moveval
	fn_link  NanoPrelude.map
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 78 ---
L1476:	fn_link  L1424
	fn_link  L1464
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 79 ---
L1488:	fn_link  L1476
	fn_link  Adjoxo.bestOf
	fn_link  NanoPrelude.foldr1
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 80 ---
L1504:	fn_link  Adjoxo.gridFull
	fn_combi_t28 5, 0,3,4,1,4,2
# --- block 81 ---
L1512:	fn_link  L1528
	fn_link  L1488
	fn_link  L1504
	fn_combi_t10 4, 0,1,3,2,3,0
L1528:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 82 ---
Adjoxo.gridFull:	fn_link  L1556
	fn_link  L1560
	fn_link  L1564
	fn_link  L1568
	fn_link  L1612
	fn_combi_t24 6, 0,1,5,2,3,4
L1556:	fn_combi_t0 2, 1,0,0,0,0,0
L1560:	fn_combi_t0 2, 0,0,0,0,0,0
L1564:	fn_elink _prim_eq
# --- block 83 ---
L1568:	fn_link  L1584
	fn_link  NanoPrelude.length
	fn_link  L1608
	fn_combi_t58 5, 0,1,4,1,3,2
L1584:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1608:	fn_y
# --- block 84 ---
L1612:	fn_link  L1620
	fn_combi_t26 6, 0,1,5,2,3,4
L1620:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 85 ---
NanoPrelude.foldr1:	fn_link  L1644
	fn_link  L1640
	fn_combi_t3 3, 0,1,2,0,0,0
L1640:	fn_y
# --- block 86 ---
L1644:	fn_link  L1660
	fn_link  L1664
	fn_link  L1668
	fn_combi_t47 6, 5,0,1,2,3,4
L1660:	fn_combi_t6 6, 0,2,1,3,0,0
L1664:	fn_combi_t46 4, 3,2,0,1,2,3
L1668:	fn_elink _error0
# --- block 87 ---
Adjoxo.bestOf:	fn_link  L1684
	fn_link  L1688
	fn_combi_t4 4, 0,2,3,1,0,0
L1684:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 88 ---
L1688:	fn_link  L1700
	fn_link  L1704
	fn_combi_t32 4, 2,3,0,0,1,3
L1700:	fn_combi_t0 3, 2,0,0,0,0,0
L1704:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 89 ---
NanoPrelude.map:	fn_link  L1736
	fn_link  L1720
	fn_combi_t3 3, 0,1,2,0,0,0
L1720:	fn_y
# --- block 90 ---
L1724:	fn_link  L1732
	fn_combi_t15 5, 0,1,3,2,4,0
L1732:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 91 ---
L1736:	fn_link  L1724
	fn_link  L1748
	fn_combi_t16 5, 4,0,1,2,3,0
L1748:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 92 ---
Adjoxo.moveval:	fn_link  Adjoxo.insert
	fn_link  Adjoxo.analysis
	fn_link  Adjoxo.inverse
	fn_combi_t58 6, 0,1,4,2,5,3
# --- block 93 ---
Adjoxo.inverse:	fn_link  L1784
	fn_link  L1788
	fn_link  L1792
	fn_combi_t4 4, 3,0,1,2,0,0
L1784:	fn_combi_t0 3, 1,0,0,0,0,0
L1788:	fn_combi_t0 3, 2,0,0,0,0,0
L1792:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 94 ---
Adjoxo.insert:	fn_link  L1864
	fn_link  L1884
	fn_link  L1812
	fn_combi_t19 4, 0,1,2,3,3,0
L1812:	fn_y
# --- block 95 ---
L1816:	fn_link  L1824
	fn_combi_t16 4, 0,1,0,2,3,0
L1824:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1828:	fn_link  L1836
	fn_combi_t6 4, 0,2,1,3,0,0
L1836:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 97 ---
L1840:	fn_link  L1848
	fn_combi_t44 5, 3,1,0,2,3,4
L1848:	fn_elink _prim_le
# --- block 98 ---
L1852:	fn_link  L1828
	fn_link  L1840
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 99 ---
L1864:	fn_link  L1816
	fn_link  L1852
	fn_link  L1880
	fn_combi_t40 5, 0,1,3,4,2,3
L1880:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 100 ---
L1884:	fn_link  L1896
	fn_link  L1900
	fn_combi_t40 6, 5,0,3,1,2,4
L1896:	fn_combi_t0 2, 0,0,0,0,0,0
L1900:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 101 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L1920
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 102 ---
L1920:	fn_link  L1936
	fn_link  L1940
	fn_link  L1944
	fn_combi_t10 5, 3,4,0,1,2,0
L1936:	fn_combi_t0 2, 1,0,0,0,0,0
L1940:	fn_combi_t0 2, 0,0,0,0,0,0
L1944:	fn_elink _prim_le
# --- block 103 ---
NanoPrelude.takeWhile:	fn_link  L1988
	fn_link  L1960
	fn_combi_t3 3, 0,1,2,0,0,0
L1960:	fn_y
# --- block 104 ---
L1964:	fn_link  L1972
	fn_combi_t6 4, 0,2,1,3,0,0
L1972:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 105 ---
L1976:	fn_link  L1984
	fn_combi_t42 5, 1,3,0,2,3,4
L1984:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
L1988:	fn_link  L1964
	fn_link  L1976
	fn_link  L2004
	fn_combi_t48 6, 5,0,1,3,2,4
L2004:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 107 ---
NanoPrelude.enumFrom:	fn_link  L2028
	fn_link  L2052
	fn_link  NanoPrelude.enumFrom
	fn_link  L2056
	fn_combi_t50 5, 0,4,1,2,4,3
L2028:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2052:	fn_y
L2056:	fn_combi_t2 4, 3,0,1,0,0,0

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
