# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Mandel2  (entry @0)
	.text
	.globl	Mandel2.bench
	.globl	Mandel2.build_tree
	.globl	Mandel2.check_perim
	.globl	Mandel2.check_radius
	.globl	Mandel2.delta_p
	.globl	Mandel2.delta_q
	.globl	Mandel2.down
	.globl	Mandel2.eqStr
	.globl	Mandel2.equalp
	.globl	Mandel2.ewStr
	.globl	Mandel2.finite
	.globl	Mandel2.left
	.globl	Mandel2.maxI
	.globl	Mandel2.new_x
	.globl	Mandel2.new_y
	.globl	Mandel2.np
	.globl	Mandel2.nq
	.globl	Mandel2.nsStr
	.globl	Mandel2.pmn
	.globl	Mandel2.pmx
	.globl	Mandel2.point_colour
	.globl	Mandel2.qmn
	.globl	Mandel2.qmx
	.globl	Mandel2.radius
	.globl	Mandel2.right
	.globl	Mandel2.simSize
	.globl	Mandel2.up
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.$3e.
	.globl	NanoPrelude.quot
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Mandel2.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Mandel2.bench:	fn_link  L44
	fn_link  L52
	fn_link  L120
	fn_elink Mandel2.finite
L44:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L52:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
L60:	fn_link  Mandel2.simSize
	fn_link  L72
L68:	fn_elink Mandel2.maxI
L72:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 4 ---
L80:	fn_link  L60
	fn_link  L96
	fn_link  NanoPrelude.quot
	fn_combi_t16 4, 3,2,0,2,1,0
L96:	fn_box
L100:	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 5 ---
L104:	fn_link  L112
	fn_combi_t2 2, 1,0,0,0,0,0
L112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
L120:	fn_link  L80
	fn_link  L104
	fn_elink Mandel2.build_tree
# --- block 7 ---
Mandel2.finite:	fn_link  L148
	fn_link  L176
	fn_link  L188
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 8 ---
L148:	fn_link  L164
	fn_link  L168
	fn_link  L172
	fn_combi_t10 4, 3,3,0,1,2,0
L164:	fn_combi_t0 2, 1,0,0,0,0,0
L168:	fn_combi_t0 2, 0,0,0,0,0,0
L172:	fn_elink _prim_eq
# --- block 9 ---
L176:	fn_link  Mandel2.finite
	fn_link  NanoPrelude.$26$26
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 10 ---
L188:	fn_link  Mandel2.finite
	fn_link  NanoPrelude.$26$26
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 11 ---
NanoPrelude.$26$26:	fn_link  L208
	fn_combi_t1 2, 1,0,0,0,0,0
L208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
Mandel2.build_tree:	fn_link  Mandel2.check_perim
	fn_link  L1184
	fn_link  L232
L224:	fn_link  L236
	fn_combi_t52 5, 0,1,2,4,3,4
L232:	fn_combi_t42 5, 0,3,4,1,2,4
L236:	fn_y
# --- block 13 ---
L240:	fn_link  L248
	fn_combi_t1 2, 1,0,0,0,0,0
L248:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L252:	fn_link  L260
	fn_combi_t1 2, 1,0,0,0,0,0
L260:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 15 ---
L264:	fn_link  L284
	fn_link  L292
	fn_link  L316
	fn_link  NanoPrelude.quot
	fn_combi_t36 6, 0,1,5,4,2,3
L284:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L292:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L316:	fn_y
# --- block 16 ---
L320:	fn_link  L328
	fn_combi_t7 4, 1,0,2,3,0,0
L328:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 17 ---
L332:	fn_link  L352
	fn_link  L360
	fn_link  L384
	fn_link  NanoPrelude.quot
	fn_combi_t36 6, 0,1,5,4,2,3
L352:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L360:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L384:	fn_y
# --- block 18 ---
L388:	fn_link  L400
	fn_link  L424
	fn_combi_t13 5, 4,0,3,1,2,0
L400:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L424:	fn_y
# --- block 19 ---
L428:	fn_link  L388
	fn_link  Mandel2.build_tree
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 20 ---
L440:	fn_link  L448
	fn_combi_t7 4, 1,0,2,3,0,0
L448:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 21 ---
L452:	fn_link  L464
	fn_link  L488
	fn_combi_t17 5, 4,3,0,2,1,0
L464:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L488:	fn_y
# --- block 22 ---
L492:	fn_link  L504
	fn_link  L508
	fn_combi_t16 4, 0,2,1,3,2,0
L504:	fn_combi_t2 5, 2,0,1,0,0,0
L508:	fn_elink _seq
# --- block 23 ---
L512:	fn_link  L524
	fn_link  L528
	fn_combi_t16 4, 0,3,1,2,3,0
L524:	fn_combi_t2 5, 3,0,1,0,0,0
L528:	fn_elink _seq
# --- block 24 ---
L532:	fn_link  L512
	fn_link  L544
	fn_combi_t16 4, 0,2,1,2,3,0
L544:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 25 ---
L548:	fn_link  L564
	fn_link  L568
	fn_link  L592
	fn_combi_t13 5, 0,4,3,1,2,0
L564:	fn_elink _prim_ge
L568:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L592:	fn_y
# --- block 26 ---
L596:	fn_link  L608
	fn_link  L632
	fn_combi_t41 6, 0,4,2,1,3,5
L608:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L632:	fn_y
# --- block 27 ---
L636:	fn_link  Mandel2.ewStr
	fn_link  L548
	fn_link  L596
	fn_link  L656
	fn_combi_t10 5, 0,1,4,2,3,0
L656:	fn_combi_t24 6, 0,1,3,4,5,2
# --- block 28 ---
L660:	fn_link  Mandel2.eqStr
	fn_combi_t38 5, 0,1,2,2,3,4
# --- block 29 ---
L668:	fn_link  L660
	fn_combi_t38 6, 0,1,5,2,3,4
# --- block 30 ---
L676:	fn_link  L668
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 31 ---
L684:	fn_link  L532
	fn_link  Mandel2.nsStr
	fn_link  L636
	fn_link  L676
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 32 ---
L704:	fn_link  L724
	fn_link  L728
	fn_link  L752
	fn_link  L760
	fn_combi_t15 5, 0,1,2,4,3,0
L724:	fn_elink _prim_ne
L728:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L752:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L760:	fn_y
# --- block 33 ---
L764:	fn_link  L704
	fn_link  L776
	fn_combi_t3 3, 0,1,2,0,0,0
L776:	fn_combi_t58 6, 0,1,5,2,4,3
# --- block 34 ---
L780:	fn_link  L764
	fn_link  L792
	fn_combi_t3 3, 0,1,2,0,0,0
L792:	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 35 ---
L796:	fn_link  L812
	fn_link  L684
	fn_link  L780
	fn_combi_t30 6, 0,3,1,4,5,2
L812:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 36 ---
L816:	fn_link  L824
	fn_combi_t26 6, 0,1,4,5,2,3
L824:	fn_combi_t33 5, 0,1,2,3,4,4
# --- block 37 ---
L828:	fn_link  L816
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 38 ---
L836:	fn_link  L856
	fn_link  L492
	fn_link  L796
	fn_link  L828
	fn_combi_t26 6, 0,1,4,5,2,3
L856:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 39 ---
L860:	fn_link  L868
	fn_combi_t26 6, 0,1,4,5,2,3
L868:	fn_combi_t37 6, 0,5,4,3,1,2
# --- block 40 ---
L872:	fn_link  L860
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 41 ---
L880:	fn_link  L896
	fn_link  L836
	fn_link  L872
	fn_combi_t26 5, 0,1,3,4,2,3
L896:	fn_combi_t1 4, 3,0,0,0,0,0
# --- block 42 ---
L900:	fn_link  L908
	fn_combi_t24 6, 0,1,5,2,3,4
L908:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 43 ---
L912:	fn_link  L900
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 44 ---
L920:	fn_link  Mandel2.build_tree
	fn_link  L880
	fn_link  L912
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 45 ---
L936:	fn_link  L452
	fn_link  L920
	fn_link  L952
	fn_combi_t26 6, 0,1,4,5,2,3
L952:	fn_combi_t28 6, 0,3,4,1,5,2
# --- block 46 ---
L956:	fn_link  L964
	fn_combi_t26 6, 0,1,4,5,2,3
L964:	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 47 ---
L968:	fn_link  L956
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 48 ---
L976:	fn_link  L968
	fn_combi_t26 6, 0,1,2,5,3,4
# --- block 49 ---
L984:	fn_link  L936
	fn_link  L976
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 50 ---
L996:	fn_link  L984
	fn_link  L1008
	fn_combi_t38 5, 0,1,4,2,3,4
L1008:	fn_combi_t28 5, 0,3,4,1,4,2
# --- block 51 ---
L1012:	fn_link  L428
	fn_link  L440
	fn_link  L996
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 52 ---
L1028:	fn_link  L1036
	fn_combi_t38 6, 0,1,5,2,4,3
L1036:	fn_combi_t37 5, 0,3,4,2,1,2
# --- block 53 ---
L1040:	fn_link  L1028
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 54 ---
L1048:	fn_link  L1040
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 55 ---
L1056:	fn_link  L1076
	fn_link  L332
	fn_link  L1012
	fn_link  L1048
	fn_combi_t26 6, 0,1,4,5,2,3
L1076:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 56 ---
L1080:	fn_link  L1088
	fn_combi_t40 5, 0,1,3,4,2,4
L1088:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 57 ---
L1092:	fn_link  L1056
	fn_link  L1080
	fn_combi_t32 6, 0,1,2,4,5,3
# --- block 58 ---
L1104:	fn_link  L320
	fn_link  L1092
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 59 ---
L1116:	fn_link  L1124
	fn_combi_t40 5, 0,1,3,4,2,4
L1124:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 60 ---
L1128:	fn_link  L264
	fn_link  L1104
	fn_link  L1116
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 61 ---
L1144:	fn_link  L1152
	fn_combi_t26 6, 0,1,4,5,2,3
L1152:	fn_combi_t37 5, 0,4,3,2,1,2
# --- block 62 ---
L1156:	fn_link  L252
	fn_link  L1128
	fn_link  L1144
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 63 ---
L1172:	fn_link  L1180
	fn_combi_t24 5, 0,1,4,2,3,4
L1180:	fn_combi_t39 5, 0,4,1,3,3,2
# --- block 64 ---
L1184:	fn_link  L1204
	fn_link  L240
	fn_link  L1156
	fn_link  L1172
	fn_combi_t26 6, 0,1,4,5,2,3
L1204:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 65 ---
Mandel2.eqStr:	fn_link  L1272
	fn_link  L1288
	fn_link  L1224
	fn_combi_t40 5, 3,4,0,1,2,4
L1224:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 66 ---
L1228:	fn_link  L1248
	fn_link  L1252
	fn_link  L1256
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L1248:	fn_combi_t0 2, 1,0,0,0,0,0
L1252:	fn_combi_t0 2, 0,0,0,0,0,0
L1256:	fn_elink _prim_eq
# --- block 67 ---
L1260:	fn_link  Mandel2.eqStr
	fn_link  L1228
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 68 ---
L1272:	fn_link  L1260
	fn_link  L1284
	fn_combi_t16 5, 2,0,1,3,4,0
L1284:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 69 ---
L1288:	fn_link  L1296
	fn_combi_t0 3, 0,0,0,0,0,0
L1296:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
Mandel2.ewStr:	fn_link  L1320
	fn_link  L1312
	fn_combi_t2 4, 3,0,1,0,0,0
L1312:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 71 ---
L1320:	fn_link  L1332
	fn_link  L1336
	fn_combi_t2 4, 3,0,1,0,0,0
L1332:	fn_combi_t0 2, 0,0,0,0,0,0
L1336:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 72 ---
Mandel2.nsStr:	fn_link  L1364
	fn_link  L1356
	fn_combi_t2 4, 3,0,1,0,0,0
L1356:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 73 ---
L1364:	fn_link  L1376
	fn_link  L1380
	fn_combi_t2 4, 3,0,1,0,0,0
L1376:	fn_combi_t0 2, 0,0,0,0,0,0
L1380:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 74 ---
NanoPrelude.quot:	fn_link  L1400
	fn_link  L1424
	fn_combi_t8 4, 0,3,2,1,0,0
L1400:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1424:	fn_y
# --- block 75 ---
Mandel2.check_perim:	fn_link  Mandel2.point_colour
	fn_link  L3072
	fn_combi_t14 4, 0,2,3,1,2,0
# --- block 76 ---
L1440:	fn_link  L1448
	fn_combi_t1 2, 1,0,0,0,0,0
L1448:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
L1452:	fn_link  L1460
	fn_combi_t1 2, 1,0,0,0,0,0
L1460:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 78 ---
L1464:	fn_link  L1480
	fn_link  L1504
	fn_link  L1508
	fn_combi_t20 5, 0,3,1,4,2,0
L1480:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1504:	fn_combi_t0 2, 1,0,0,0,0,0
L1508:	fn_y
# --- block 79 ---
L1512:	fn_link  L1528
	fn_link  L1552
	fn_link  L1556
	fn_combi_t62 6, 5,0,3,1,4,2
L1528:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1552:	fn_combi_t0 2, 0,0,0,0,0,0
L1556:	fn_y
# --- block 80 ---
L1560:	fn_link  L1512
	fn_combi_t37 6, 0,1,4,5,2,3
# --- block 81 ---
L1568:	fn_link  L1464
	fn_link  L1560
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 82 ---
L1580:	fn_link  L1568
	fn_combi_t32 6, 1,0,3,4,5,2
# --- block 83 ---
L1588:	fn_link  L1600
	fn_link  Mandel2.point_colour
	fn_combi_t40 6, 2,0,3,1,4,5
L1600:	fn_elink _prim_ne
# --- block 84 ---
L1604:	fn_link  L1612
	fn_combi_t29 6, 0,1,4,2,5,3
L1612:	fn_combi_t26 6, 0,1,3,4,5,2
# --- block 85 ---
L1616:	fn_link  L1636
	fn_link  L1580
	fn_link  L1588
	fn_link  L1604
	fn_combi_t29 6, 0,1,4,2,5,3
L1636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 86 ---
L1640:	fn_link  L1656
	fn_link  L1660
	fn_link  L1664
	fn_combi_t10 5, 3,4,0,1,2,0
L1656:	fn_combi_t0 2, 1,0,0,0,0,0
L1660:	fn_combi_t0 2, 0,0,0,0,0,0
L1664:	fn_elink _prim_ge
# --- block 87 ---
L1668:	fn_link  L1684
	fn_link  L1688
	fn_link  L1692
	fn_combi_t10 5, 3,4,0,1,2,0
L1684:	fn_combi_t0 2, 1,0,0,0,0,0
L1688:	fn_combi_t0 2, 0,0,0,0,0,0
L1692:	fn_elink _prim_le
# --- block 88 ---
L1696:	fn_link  L1712
	fn_link  L1716
	fn_link  L1720
	fn_combi_t10 5, 3,4,0,1,2,0
L1712:	fn_combi_t0 2, 1,0,0,0,0,0
L1716:	fn_combi_t0 2, 0,0,0,0,0,0
L1720:	fn_elink _prim_le
# --- block 89 ---
L1724:	fn_link  L1740
	fn_link  L1744
	fn_link  L1748
	fn_combi_t10 5, 3,4,0,1,2,0
L1740:	fn_combi_t0 2, 1,0,0,0,0,0
L1744:	fn_combi_t0 2, 0,0,0,0,0,0
L1748:	fn_elink _prim_ge
# --- block 90 ---
L1752:	fn_link  Mandel2.left
	fn_link  Mandel2.equalp
	fn_combi_t37 6, 0,2,1,3,4,5
# --- block 91 ---
L1764:	fn_link  L1752
	fn_combi_t39 6, 0,4,1,5,2,3
# --- block 92 ---
L1772:	fn_link  L1696
	fn_link  L1724
	fn_link  L1764
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 93 ---
L1788:	fn_link  Mandel2.down
	fn_link  Mandel2.equalp
	fn_combi_t28 6, 0,2,1,3,5,4
# --- block 94 ---
L1800:	fn_link  L1788
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 95 ---
L1808:	fn_link  L1800
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 96 ---
L1816:	fn_link  L1668
	fn_link  L1772
	fn_link  L1808
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 97 ---
L1832:	fn_link  Mandel2.right
	fn_link  Mandel2.equalp
	fn_combi_t42 6, 0,3,1,2,4,5
# --- block 98 ---
L1844:	fn_link  L1832
	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 99 ---
L1852:	fn_link  L1816
	fn_link  L1844
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 100 ---
L1864:	fn_link  L1872
	fn_combi_t38 5, 0,1,4,2,3,4
L1872:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 101 ---
L1876:	fn_link  L1864
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 102 ---
L1884:	fn_link  L1876
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 103 ---
L1892:	fn_link  L1640
	fn_link  L1852
	fn_link  L1884
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 104 ---
L1908:	fn_link  L1916
	fn_combi_t32 6, 0,1,3,4,5,2
L1916:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 105 ---
L1920:	fn_link  L1616
	fn_link  L1892
	fn_link  L1908
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 106 ---
L1936:	fn_link  L1944
	fn_combi_t24 6, 0,1,5,2,3,4
L1944:	fn_combi_t29 5, 0,4,3,4,2,1
# --- block 107 ---
L1948:	fn_link  L1936
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 108 ---
L1956:	fn_link  L1948
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 109 ---
L1964:	fn_link  L1956
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 110 ---
L1972:	fn_link  L1964
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 111 ---
L1980:	fn_link  L1972
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 112 ---
L1988:	fn_link  L1980
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 113 ---
L1996:	fn_link  L1988
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 114 ---
L2004:	fn_link  L2028
	fn_link  L2032
	fn_link  L2036
	fn_link  L1920
	fn_link  L1996
	fn_combi_t24 6, 0,1,5,2,3,4
L2028:	fn_combi_t0 2, 1,0,0,0,0,0
L2032:	fn_combi_t0 2, 0,0,0,0,0,0
L2036:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 115 ---
L2040:	fn_link  L2052
	fn_link  L2076
	fn_combi_t17 5, 4,3,0,2,1,0
L2052:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2076:	fn_y
# --- block 116 ---
L2080:	fn_link  L2088
	fn_combi_t24 6, 0,1,5,2,3,4
L2088:	fn_combi_t43 6, 5,0,1,2,3,4
# --- block 117 ---
L2092:	fn_link  L2116
	fn_link  L2124
	fn_link  Mandel2.up
	fn_link  L2040
	fn_link  L2080
	fn_combi_t24 6, 0,1,5,2,3,4
L2116:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2124:	fn_y
# --- block 118 ---
L2128:	fn_link  L2140
	fn_link  L2092
	fn_combi_t4 4, 0,2,3,1,0,0
L2140:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 119 ---
L2164:	fn_link  L2176
	fn_link  L2200
	fn_combi_t13 5, 4,0,3,1,2,0
L2176:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2200:	fn_y
# --- block 120 ---
L2204:	fn_link  L2212
	fn_combi_t24 6, 0,1,5,2,3,4
L2212:	fn_combi_t43 6, 5,0,1,2,3,4
# --- block 121 ---
L2216:	fn_link  L2240
	fn_link  L2248
	fn_link  Mandel2.left
	fn_link  L2164
	fn_link  L2204
	fn_combi_t24 6, 0,1,5,2,3,4
L2240:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2248:	fn_y
# --- block 122 ---
L2252:	fn_link  L2264
	fn_link  L2216
	fn_combi_t4 4, 0,2,3,1,0,0
L2264:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 123 ---
L2288:	fn_link  L2252
	fn_link  L2300
	fn_combi_t26 6, 0,1,2,5,3,4
L2300:	fn_combi_t46 5, 0,4,1,3,4,2
# --- block 124 ---
L2304:	fn_link  L2128
	fn_link  L2288
	fn_combi_t11 4, 0,3,1,3,2,0
# --- block 125 ---
L2316:	fn_link  L2328
	fn_link  L2352
	fn_combi_t17 5, 4,2,0,3,1,0
L2328:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2352:	fn_y
# --- block 126 ---
L2356:	fn_link  L2364
	fn_combi_t24 6, 0,1,5,2,3,4
L2364:	fn_combi_t43 6, 5,0,1,2,3,4
# --- block 127 ---
L2368:	fn_link  L2392
	fn_link  L2400
	fn_link  Mandel2.down
	fn_link  L2316
	fn_link  L2356
	fn_combi_t24 6, 0,1,5,2,3,4
L2392:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2400:	fn_y
# --- block 128 ---
L2404:	fn_link  L2416
	fn_link  L2440
	fn_combi_t13 5, 4,0,3,1,2,0
L2416:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2440:	fn_y
# --- block 129 ---
L2444:	fn_link  L2452
	fn_combi_t24 6, 0,1,5,2,3,4
L2452:	fn_combi_t43 6, 5,0,1,2,3,4
# --- block 130 ---
L2456:	fn_link  L2480
	fn_link  L2488
	fn_link  Mandel2.right
	fn_link  L2404
	fn_link  L2444
	fn_combi_t24 6, 0,1,5,2,3,4
L2480:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2488:	fn_y
# --- block 131 ---
L2492:	fn_link  L2504
	fn_link  L2456
	fn_combi_t4 4, 0,2,3,1,0,0
L2504:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 132 ---
L2528:	fn_link  L2536
	fn_combi_t38 5, 0,1,4,2,3,4
L2536:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 133 ---
L2540:	fn_link  L2492
	fn_link  L2528
	fn_combi_t44 5, 0,1,4,2,4,3
# --- block 134 ---
L2552:	fn_link  L2568
	fn_link  L2368
	fn_link  L2540
	fn_combi_t5 4, 0,1,3,2,0,0
L2568:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 135 ---
L2592:	fn_link  Mandel2.point_colour
	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 136 ---
L2600:	fn_link  L2620
	fn_link  L2624
	fn_link  L2628
	fn_link  L2592
	fn_combi_t24 6, 0,1,5,4,2,3
L2620:	fn_combi_t0 2, 1,0,0,0,0,0
L2624:	fn_elink _prim_eq
L2628:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 137 ---
L2632:	fn_link  Mandel2.point_colour
	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 138 ---
L2640:	fn_link  L2660
	fn_link  L2664
	fn_link  L2668
	fn_link  L2632
	fn_combi_t24 6, 0,1,5,4,2,3
L2660:	fn_combi_t0 2, 1,0,0,0,0,0
L2664:	fn_elink _prim_eq
L2668:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 139 ---
L2672:	fn_link  L2680
	fn_combi_t29 4, 0,1,3,2,3,2
L2680:	fn_combi_t49 6, 0,4,1,2,5,3
# --- block 140 ---
L2684:	fn_link  L2640
	fn_link  L2672
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 141 ---
L2696:	fn_link  L2684
	fn_combi_t25 6, 0,1,2,4,5,3
# --- block 142 ---
L2704:	fn_link  L2720
	fn_link  L2600
	fn_link  L2696
	fn_combi_t11 4, 0,3,1,3,2,0
L2720:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 143 ---
L2724:	fn_link  L2732
	fn_combi_t29 5, 0,1,4,2,4,3
L2732:	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 144 ---
L2736:	fn_link  L2724
	fn_combi_t44 5, 0,1,4,2,4,3
# --- block 145 ---
L2744:	fn_link  L2736
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 146 ---
L2752:	fn_link  L2552
	fn_link  L2704
	fn_link  L2744
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 147 ---
L2768:	fn_link  L2304
	fn_link  L2752
	fn_link  L2784
	fn_combi_t15 4, 0,1,3,2,3,0
L2784:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 148 ---
L2788:	fn_link  L2796
	fn_combi_t24 6, 0,1,5,2,3,4
L2796:	fn_combi_t23 6, 0,4,1,5,2,3
# --- block 149 ---
L2800:	fn_link  L2788
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 150 ---
L2808:	fn_link  L2832
	fn_link  L2856
	fn_link  L2864
	fn_link  L2768
	fn_link  L2800
	fn_combi_t24 6, 0,1,5,2,3,4
L2832:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2856:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2864:	fn_y
# --- block 151 ---
L2868:	fn_link  Mandel2.equalp
	fn_combi_t28 6, 0,1,2,3,5,4
# --- block 152 ---
L2876:	fn_link  L2868
	fn_link  L2888
	fn_combi_t7 4, 0,1,2,3,0,0
L2888:	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 153 ---
L2892:	fn_link  L2876
	fn_link  L2904
	fn_combi_t7 4, 0,1,2,3,0,0
L2904:	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 154 ---
L2908:	fn_link  Mandel2.point_colour
	fn_link  L2808
	fn_link  L2892
	fn_link  L2928
	fn_combi_t24 5, 0,1,4,2,3,4
L2928:	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 155 ---
L2932:	fn_link  L2940
	fn_combi_t26 6, 0,1,4,5,2,3
L2940:	fn_combi_t50 5, 0,4,1,2,3,4
# --- block 156 ---
L2944:	fn_link  L2932
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 157 ---
L2952:	fn_link  L2972
	fn_link  L2976
	fn_link  L2908
	fn_link  L2944
	fn_combi_t26 6, 0,1,4,5,2,3
L2972:	fn_combi_t23 4, 0,1,2,3,3,2
L2976:	fn_y
# --- block 158 ---
L2980:	fn_link  L2988
	fn_combi_t29 5, 0,1,4,2,4,3
L2988:	fn_combi_t39 5, 0,4,1,4,3,2
# --- block 159 ---
L2992:	fn_link  L2980
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 160 ---
L3000:	fn_link  L2992
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 161 ---
L3008:	fn_link  L3028
	fn_link  L2004
	fn_link  L2952
	fn_link  L3000
	fn_combi_t26 6, 0,1,4,5,2,3
L3028:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 162 ---
L3032:	fn_link  L3040
	fn_combi_t26 6, 0,1,4,5,2,3
L3040:	fn_combi_t37 5, 0,4,3,2,1,2
# --- block 163 ---
L3044:	fn_link  L1452
	fn_link  L3008
	fn_link  L3032
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 164 ---
L3060:	fn_link  L3068
	fn_combi_t24 5, 0,1,4,2,3,4
L3068:	fn_combi_t39 5, 0,4,1,3,3,2
# --- block 165 ---
L3072:	fn_link  L3092
	fn_link  L1440
	fn_link  L3044
	fn_link  L3060
	fn_combi_t10 5, 0,1,4,2,3,0
L3092:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 166 ---
Mandel2.equalp:	fn_link  L3192
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 167 ---
L3104:	fn_link  L3124
	fn_link  L3128
	fn_link  L3132
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L3124:	fn_combi_t0 2, 1,0,0,0,0,0
L3128:	fn_combi_t0 2, 0,0,0,0,0,0
L3132:	fn_elink _prim_eq
# --- block 168 ---
L3136:	fn_link  L3144
	fn_combi_t24 6, 0,1,5,4,2,3
L3144:	fn_combi_t52 6, 0,5,1,2,3,4
# --- block 169 ---
L3148:	fn_link  L3168
	fn_link  L3172
	fn_link  L3104
	fn_link  L3136
	fn_combi_t10 5, 0,1,4,2,3,0
L3168:	fn_combi_t0 2, 0,0,0,0,0,0
L3172:	fn_elink _prim_eq
# --- block 170 ---
L3176:	fn_link  L3188
	fn_link  L3148
	fn_combi_t9 5, 0,2,3,4,1,0
L3188:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 171 ---
L3192:	fn_link  L3176
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 172 ---
Mandel2.point_colour:	fn_link  L3236
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 173 ---
L3208:	fn_link  L3228
	fn_link  Mandel2.nq
	fn_link  Mandel2.np
	fn_link  Mandel2.check_radius
	fn_combi_t29 6, 0,1,4,2,5,3
L3228:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 174 ---
L3236:	fn_link  L3256
	fn_link  L3264
	fn_link  L3208
	fn_link  L3268
	fn_combi_t10 5, 0,1,4,2,3,0
L3256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3264:	fn_elink _prim_itof
L3268:	fn_combi_t39 4, 0,3,1,2,1,2
# --- block 175 ---
Mandel2.check_radius:	fn_link  L3300
	fn_link  L3472
	fn_link  L3292
	fn_link  L3296
	fn_combi_t57 6, 0,1,2,4,3,5
L3292:	fn_combi_t37 5, 0,2,3,4,1,4
L3296:	fn_y
# --- block 176 ---
L3300:	fn_link  Mandel2.new_y
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 177 ---
L3308:	fn_link  Mandel2.new_x
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 178 ---
L3316:	fn_link  L3328
	fn_link  L3352
	fn_combi_t3 3, 0,2,1,0,0,0
L3328:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3352:	fn_y
# --- block 179 ---
L3356:	fn_link  L3376
	fn_link  L3384
	fn_link  Mandel2.radius
	fn_link  NanoPrelude.$3e.
	fn_combi_t40 6, 0,1,5,4,2,3
L3376:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
L3384:	fn_elink _prim_itof
# --- block 180 ---
L3388:	fn_link  L3396
	fn_combi_t24 5, 0,1,4,2,3,4
L3396:	fn_combi_t32 5, 0,1,4,3,2,4
# --- block 181 ---
L3400:	fn_link  L3356
	fn_link  L3388
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 182 ---
L3412:	fn_link  L3424
	fn_link  L3428
	fn_combi_t29 5, 0,4,1,2,4,3
L3424:	fn_elink _prim_eq
L3428:	fn_box
	.word 0x0000001a	# raw word 26
	fn_box_body
# --- block 183 ---
L3436:	fn_link  L3412
	fn_combi_t26 6, 0,1,5,4,2,3
# --- block 184 ---
L3444:	fn_link  L3316
	fn_link  L3464
	fn_link  L3400
	fn_link  L3436
	fn_combi_t38 6, 0,1,4,2,3,5
L3464:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 185 ---
L3472:	fn_link  L3308
	fn_link  L3444
	fn_link  L3488
	fn_combi_t40 6, 0,1,4,5,2,3
L3488:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 186 ---
NanoPrelude.$3e.:	fn_link  L3500
	fn_combi_t3 3, 2,1,0,0,0,0
L3500:	fn_elink _prim_fgt
# --- block 187 ---
Mandel2.radius:	fn_link  L3516
	fn_link  L3528
	fn_combi_t3 3, 0,1,2,0,0,0
L3516:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 188 ---
L3520:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 189 ---
L3528:	fn_link  L3520
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 5, 0,1,3,3,2,4
# --- block 190 ---
NanoPrelude.$2b.:	fn_link  L3556
	fn_link  L3560
	fn_combi_t8 4, 0,3,2,1,0,0
L3556:	fn_elink _prim_fadd
L3560:	fn_y
# --- block 191 ---
NanoPrelude.$2a.:	fn_link  L3576
	fn_link  L3580
	fn_combi_t8 4, 0,3,2,1,0,0
L3576:	fn_elink _prim_fmul
L3580:	fn_y
# --- block 192 ---
Mandel2.new_x:	fn_link  L3600
	fn_link  L3612
	fn_link  NanoPrelude.$2b.
	fn_combi_t19 5, 0,1,2,3,4,0
L3600:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 193 ---
L3604:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 194 ---
L3612:	fn_link  L3604
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t40 5, 0,1,3,3,2,4
# --- block 195 ---
NanoPrelude.$2d.:	fn_link  L3640
	fn_link  L3644
	fn_combi_t8 4, 0,3,2,1,0,0
L3640:	fn_elink _prim_fsub
L3644:	fn_y
# --- block 196 ---
Mandel2.new_y:	fn_link  L3660
	fn_link  NanoPrelude.$2b.
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 197 ---
L3660:	fn_link  L3680
	fn_link  L3688
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2a.
	fn_combi_t19 5, 0,1,2,3,4,0
L3680:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L3688:	fn_elink _prim_itof
# --- block 198 ---
Mandel2.np:	fn_link  Mandel2.delta_p
	fn_link  L3716
	fn_link  NanoPrelude.$2a.
	fn_link  Mandel2.pmn
	fn_link  NanoPrelude.$2b.
	fn_combi_t47 6, 0,1,2,3,5,4
L3716:	fn_elink _prim_itof
# --- block 199 ---
Mandel2.pmn:	fn_link  L3760
	fn_elink _prim_fneg
# --- block 200 ---
L3728:	fn_link  L3736
	fn_elink _prim_itof
L3736:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 201 ---
L3744:	fn_link  L3752
	fn_elink _prim_itof
L3752:	fn_box
	.word 0x000000e1	# raw word 225
	fn_box_body
# --- block 202 ---
L3760:	fn_link  L3728
	fn_link  L3744
	fn_elink NanoPrelude.$2f.
# --- block 203 ---
NanoPrelude.$2f.:	fn_link  L3784
	fn_link  L3788
	fn_combi_t8 4, 0,3,2,1,0,0
L3784:	fn_elink _prim_fdiv
L3788:	fn_y
# --- block 204 ---
Mandel2.delta_p:	fn_link  L3844
	fn_link  L3852
	fn_elink NanoPrelude.$2f.
# --- block 205 ---
L3804:	fn_link  L3812
	fn_elink Mandel2.simSize
L3812:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 206 ---
L3836:	fn_link  L3804
	fn_y
# --- block 207 ---
L3844:	fn_link  L3836
	fn_elink _prim_itof
# --- block 208 ---
L3852:	fn_link  Mandel2.pmn
	fn_link  Mandel2.pmx
	fn_elink NanoPrelude.$2d.
# --- block 209 ---
Mandel2.pmx:	fn_link  L3876
	fn_link  L3892
	fn_elink NanoPrelude.$2f.
# --- block 210 ---
L3876:	fn_link  L3884
	fn_elink _prim_itof
L3884:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 211 ---
L3892:	fn_link  L3900
	fn_elink _prim_itof
L3900:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
# --- block 212 ---
Mandel2.simSize:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 213 ---
Mandel2.nq:	fn_link  Mandel2.delta_q
	fn_link  L3940
	fn_link  NanoPrelude.$2a.
	fn_link  Mandel2.qmn
	fn_link  NanoPrelude.$2b.
	fn_combi_t47 6, 0,1,2,3,5,4
L3940:	fn_elink _prim_itof
# --- block 214 ---
Mandel2.qmn:	fn_link  L3984
	fn_elink _prim_fneg
# --- block 215 ---
L3952:	fn_link  L3960
	fn_elink _prim_itof
L3960:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 216 ---
L3968:	fn_link  L3976
	fn_elink _prim_itof
L3976:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 217 ---
L3984:	fn_link  L3952
	fn_link  L3968
	fn_elink NanoPrelude.$2f.
# --- block 218 ---
Mandel2.delta_q:	fn_link  L4048
	fn_link  L4056
	fn_elink NanoPrelude.$2f.
# --- block 219 ---
L4008:	fn_link  L4016
	fn_elink Mandel2.simSize
L4016:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 220 ---
L4040:	fn_link  L4008
	fn_y
# --- block 221 ---
L4048:	fn_link  L4040
	fn_elink _prim_itof
# --- block 222 ---
L4056:	fn_link  Mandel2.qmn
	fn_link  Mandel2.qmx
	fn_elink NanoPrelude.$2d.
# --- block 223 ---
Mandel2.qmx:	fn_link  L4080
	fn_link  L4096
	fn_elink NanoPrelude.$2f.
# --- block 224 ---
L4080:	fn_link  L4088
	fn_elink _prim_itof
L4088:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 225 ---
L4096:	fn_link  L4104
	fn_elink _prim_itof
L4104:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 226 ---
Mandel2.right:	fn_link  L4124
	fn_link  L4132
	fn_combi_t2 3, 2,0,1,0,0,0
L4124:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4132:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 227 ---
Mandel2.down:	fn_link  L4152
	fn_link  L4160
	fn_combi_t2 3, 2,0,1,0,0,0
L4152:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4160:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 228 ---
Mandel2.left:	fn_link  L4188
	fn_link  L4196
	fn_link  L4220
	fn_link  L4228
	fn_combi_t13 5, 4,0,1,2,3,0
L4188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4196:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4220:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4228:	fn_y
# --- block 229 ---
Mandel2.up:	fn_link  L4252
	fn_link  L4276
	fn_link  L4284
	fn_link  L4288
	fn_combi_t17 5, 4,0,1,2,3,0
L4252:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4276:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4284:	fn_y
L4288:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 230 ---
Mandel2.maxI:	fn_link  L4308
	fn_link  L4312
	fn_combi_t3 3, 0,1,2,0,0,0
L4308:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 231 ---
L4312:	fn_link  L4320
	fn_combi_t10 3, 2,1,0,2,1,0
L4320:	fn_elink _prim_ge

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
