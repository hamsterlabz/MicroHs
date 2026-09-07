# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Multiplier  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Multiplier.add
	.globl	Multiplier.and2
	.globl	Multiplier.append
	.globl	Multiplier.bench
	.globl	Multiplier.bitsi
	.globl	Multiplier.bmux1
	.globl	Multiplier.dec
	.globl	Multiplier.dropL
	.globl	Multiplier.fmtB
	.globl	Multiplier.fmtDec
	.globl	Multiplier.fmtInt
	.globl	Multiplier.fmtStr
	.globl	Multiplier.fmtW
	.globl	Multiplier.forceBit
	.globl	Multiplier.format
	.globl	Multiplier.fulladd
	.globl	Multiplier.go
	.globl	Multiplier.halfadd
	.globl	Multiplier.hashS
	.globl	Multiplier.headL
	.globl	Multiplier.headstrict
	.globl	Multiplier.ibits
	.globl	Multiplier.intrep
	.globl	Multiplier.inv
	.globl	Multiplier.latch
	.globl	Multiplier.lift11
	.globl	Multiplier.lift21
	.globl	Multiplier.multiplier
	.globl	Multiplier.multsys
	.globl	Multiplier.ntrans
	.globl	Multiplier.or2
	.globl	Multiplier.orB
	.globl	Multiplier.regIs0
	.globl	Multiplier.rept
	.globl	Multiplier.revL
	.globl	Multiplier.shl
	.globl	Multiplier.showI
	.globl	Multiplier.shr
	.globl	Multiplier.tailL
	.globl	Multiplier.takeL
	.globl	Multiplier.traceMult
	.globl	Multiplier.transL
	.globl	Multiplier.upfrom
	.globl	Multiplier.wideAnd
	.globl	Multiplier.wideGate
	.globl	Multiplier.wlat
	.globl	Multiplier.wmux1
	.globl	Multiplier.word21
	.globl	Multiplier.xor
	.globl	Multiplier.zerO
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.any
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.null
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.snd
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Multiplier.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Multiplier.bench:	fn_link  L36
L32:	fn_elink Multiplier.hashS
# --- block 3 ---
L36:	fn_link  L44
	fn_elink Multiplier.go
L44:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 4 ---
Multiplier.hashS:	fn_link  L64
	fn_link  L152
L60:	fn_elink NanoPrelude.foldl
L64:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L72:	fn_link  L92
	fn_link  L116
	fn_link  L140
	fn_link  L148
	fn_combi_t41 6, 0,1,4,2,5,3
L92:	fn_tor a0
L96:	fn_tor a1
L100:	addw a0,a0,a1
L104:	fn_databox a0,a0
L108:	fn_update a0
L112:	fn_go a0
L116:	fn_tor a0
L120:	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L140:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L148:	fn_y
# --- block 6 ---
L152:	fn_link  L72
	fn_link  L164
	fn_combi_t7 4, 0,1,2,3,0,0
L164:	fn_y
# --- block 7 ---
NanoPrelude.foldl:	fn_link  L184
	fn_link  L180
	fn_combi_t3 3, 0,1,2,0,0,0
L180:	fn_y
# --- block 8 ---
L184:	fn_link  L192
	fn_combi_t46 5, 4,3,0,1,2,3
L192:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 9 ---
Multiplier.go:	fn_link  L444
	fn_link  L1204
	fn_link  Multiplier.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 10 ---
L212:	fn_link  L220
	fn_elink Multiplier.upfrom
L220:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 11 ---
L228:	fn_link  L248
	fn_link  L272
	fn_link  L296
	fn_link  L304
	fn_combi_t55 5, 0,0,4,1,2,3
L248:	fn_force
	fn_tor a0
	addiw a0,a0,11
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L272:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L296:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L304:	fn_y
# --- block 12 ---
L308:	fn_link  L328
	fn_link  L352
	fn_link  L376
	fn_link  L384
	fn_combi_t55 5, 0,0,4,1,2,3
L328:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L352:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L376:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L384:	fn_y
# --- block 13 ---
L388:	fn_link  L228
	fn_link  L308
	fn_combi_t15 4, 3,0,2,1,2,0
# --- block 14 ---
L400:	fn_link  L388
	fn_link  L412
	fn_combi_t15 5, 0,1,3,2,4,0
L412:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
L416:	fn_link  L400
	fn_link  L428
	fn_combi_t6 4, 3,0,1,2,0,0
L428:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
L432:	fn_link  L212
	fn_link  L416
	fn_y
# --- block 17 ---
L444:	fn_link  L432
	fn_link  L464
	fn_link  L472
	fn_link  Multiplier.traceMult
	fn_combi_t9 5, 0,1,4,2,3,0
L464:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
L472:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 18 ---
L480:	fn_link  L492
	fn_link  L496
	fn_combi_t2 4, 3,0,1,0,0,0
L492:	fn_combi_t0 2, 0,0,0,0,0,0
L496:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 19 ---
L504:	fn_link  L480
	fn_link  L516
	fn_combi_t2 4, 3,0,1,0,0,0
L516:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 20 ---
L524:	fn_link  L504
	fn_link  L536
	fn_combi_t2 4, 3,0,1,0,0,0
L536:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 21 ---
L544:	fn_link  L524
	fn_link  L556
	fn_combi_t2 4, 3,0,1,0,0,0
L556:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 22 ---
L564:	fn_link  L544
	fn_link  L576
	fn_combi_t2 4, 3,0,1,0,0,0
L576:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 23 ---
L584:	fn_link  L564
	fn_link  L596
	fn_combi_t2 4, 3,0,1,0,0,0
L596:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 24 ---
L604:	fn_link  L584
	fn_link  L616
	fn_combi_t2 4, 3,0,1,0,0,0
L616:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 25 ---
L624:	fn_link  L604
	fn_link  L636
	fn_combi_t2 4, 3,0,1,0,0,0
L636:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 26 ---
L644:	fn_link  L624
	fn_link  L656
	fn_combi_t2 4, 3,0,1,0,0,0
L656:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 27 ---
L664:	fn_link  L644
	fn_link  L676
	fn_combi_t2 4, 3,0,1,0,0,0
L676:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 28 ---
L684:	fn_link  L664
	fn_link  L696
	fn_combi_t2 4, 3,0,1,0,0,0
L696:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 29 ---
L704:	fn_link  L684
	fn_link  L716
	fn_combi_t2 4, 3,0,1,0,0,0
L716:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 30 ---
L724:	fn_link  L704
	fn_link  L736
	fn_combi_t2 4, 3,0,1,0,0,0
L736:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 31 ---
L744:	fn_link  L724
	fn_link  L756
	fn_combi_t2 4, 3,0,1,0,0,0
L756:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 32 ---
L764:	fn_link  L744
	fn_link  L776
	fn_combi_t2 4, 3,0,1,0,0,0
L776:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 33 ---
L784:	fn_link  L764
	fn_link  L796
	fn_combi_t2 4, 3,0,1,0,0,0
L796:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 34 ---
L804:	fn_link  L784
	fn_link  L816
	fn_combi_t2 4, 3,0,1,0,0,0
L816:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 35 ---
L824:	fn_link  L804
	fn_link  L836
	fn_combi_t2 4, 3,0,1,0,0,0
L836:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 36 ---
L844:	fn_link  L824
	fn_link  L856
	fn_combi_t2 4, 3,0,1,0,0,0
L856:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 37 ---
L864:	fn_link  L844
	fn_link  L876
	fn_combi_t2 4, 3,0,1,0,0,0
L876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 38 ---
L884:	fn_link  L864
	fn_link  L896
	fn_combi_t2 4, 3,0,1,0,0,0
L896:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 39 ---
L904:	fn_link  L884
	fn_link  L916
	fn_combi_t2 4, 3,0,1,0,0,0
L916:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 40 ---
L924:	fn_link  L904
	fn_link  L936
	fn_combi_t2 4, 3,0,1,0,0,0
L936:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 41 ---
L944:	fn_link  L924
	fn_link  L956
	fn_combi_t2 4, 3,0,1,0,0,0
L956:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 42 ---
L964:	fn_link  L944
	fn_link  L976
	fn_combi_t2 4, 3,0,1,0,0,0
L976:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 43 ---
L984:	fn_link  L964
	fn_link  L996
	fn_combi_t2 4, 3,0,1,0,0,0
L996:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 44 ---
L1004:	fn_link  L984
	fn_link  L1016
	fn_combi_t2 4, 3,0,1,0,0,0
L1016:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 45 ---
L1024:	fn_link  L1004
	fn_link  L1036
	fn_combi_t2 4, 3,0,1,0,0,0
L1036:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 46 ---
L1044:	fn_link  L1024
	fn_link  L1056
	fn_combi_t2 4, 3,0,1,0,0,0
L1056:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 47 ---
L1064:	fn_link  L1044
	fn_link  L1076
	fn_combi_t2 4, 3,0,1,0,0,0
L1076:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 48 ---
L1084:	fn_link  L1064
	fn_link  L1096
	fn_combi_t2 4, 3,0,1,0,0,0
L1096:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 49 ---
L1104:	fn_link  L1084
	fn_link  L1116
	fn_combi_t2 4, 3,0,1,0,0,0
L1116:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 50 ---
L1124:	fn_link  L1104
	fn_link  L1136
	fn_combi_t2 4, 3,0,1,0,0,0
L1136:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 51 ---
L1144:	fn_link  L1124
	fn_link  L1156
	fn_combi_t2 4, 3,0,1,0,0,0
L1156:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 52 ---
L1164:	fn_link  L1144
	fn_link  L1176
	fn_combi_t2 4, 3,0,1,0,0,0
L1176:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 53 ---
L1184:	fn_link  L1164
	fn_link  L1196
	fn_combi_t2 4, 3,0,1,0,0,0
L1196:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 54 ---
L1204:	fn_link  L1184
	fn_link  L1216
	fn_combi_t2 4, 3,0,1,0,0,0
L1216:	fn_box
	.word 0x00000042	# raw word 66
	fn_box_body
# --- block 55 ---
Multiplier.append:	fn_link  L1232
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 56 ---
L1232:	fn_link  Multiplier.append
	fn_link  L1244
	fn_combi_t16 5, 0,3,1,4,2,0
L1244:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 57 ---
Multiplier.traceMult:	fn_link  Multiplier.multsys
	fn_link  L1748
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 58 ---
L1260:	fn_link  L1272
	fn_link  L1276
	fn_combi_t2 4, 3,0,1,0,0,0
L1272:	fn_combi_t0 2, 0,0,0,0,0,0
L1276:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 59 ---
L1284:	fn_link  L1300
	fn_link  L1260
	fn_link  Multiplier.fmtStr
	fn_combi_t5 5, 4,0,1,2,0,0
L1300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1304:	fn_link  L1284
	fn_link  L1320
	fn_link  Multiplier.fmtW
	fn_combi_t34 7, 6,0,3,4,1,2
L1320:	fn_combi_t0 6, 5,0,0,0,0,0
# --- block 61 ---
L1324:	fn_link  L1336
	fn_link  Multiplier.fmtW
	fn_combi_t34 7, 6,0,2,3,1,4
L1336:	fn_combi_t0 6, 4,0,0,0,0,0
# --- block 62 ---
L1340:	fn_link  L1304
	fn_link  L1324
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 63 ---
L1352:	fn_link  L1364
	fn_link  Multiplier.fmtW
	fn_combi_t34 7, 6,0,2,3,1,4
L1364:	fn_combi_t0 6, 3,0,0,0,0,0
# --- block 64 ---
L1368:	fn_link  L1340
	fn_link  L1352
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 65 ---
L1380:	fn_link  L1368
	fn_link  Multiplier.fmtB
	fn_combi_t44 7, 6,0,4,1,2,3
# --- block 66 ---
L1392:	fn_link  L1404
	fn_link  L1408
	fn_combi_t2 4, 3,0,1,0,0,0
L1404:	fn_combi_t0 2, 0,0,0,0,0,0
L1408:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 67 ---
L1416:	fn_link  L1392
	fn_link  L1428
	fn_combi_t2 4, 3,0,1,0,0,0
L1428:	fn_box
	.word 0x0000003e	# raw word 62
	fn_box_body
# --- block 68 ---
L1436:	fn_link  L1416
	fn_link  L1448
	fn_combi_t2 4, 3,0,1,0,0,0
L1448:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 69 ---
L1456:	fn_link  L1436
	fn_link  L1468
	fn_combi_t2 4, 3,0,1,0,0,0
L1468:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 70 ---
L1476:	fn_link  L1456
	fn_link  L1488
	fn_combi_t2 4, 3,0,1,0,0,0
L1488:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 71 ---
L1496:	fn_link  L1476
	fn_link  L1508
	fn_combi_t2 4, 3,0,1,0,0,0
L1508:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 72 ---
L1516:	fn_link  L1380
	fn_link  L1496
	fn_link  Multiplier.fmtStr
	fn_link  L1536
	fn_combi_t14 5, 0,1,2,3,4,0
L1536:	fn_combi_t44 7, 6,0,1,2,3,4
# --- block 73 ---
L1540:	fn_link  L1552
	fn_link  Multiplier.fmtW
	fn_combi_t6 4, 0,2,3,1,0,0
L1552:	fn_combi_t0 6, 1,0,0,0,0,0
# --- block 74 ---
L1556:	fn_link  L1516
	fn_link  L1540
	fn_link  L1572
	fn_combi_t15 4, 0,1,3,2,3,0
L1572:	fn_combi_t44 6, 5,0,2,1,2,3
# --- block 75 ---
L1576:	fn_link  L1588
	fn_link  Multiplier.fmtW
	fn_combi_t6 4, 0,2,3,1,0,0
L1588:	fn_combi_t0 6, 0,0,0,0,0,0
# --- block 76 ---
L1592:	fn_link  L1556
	fn_link  L1576
	fn_link  L1608
	fn_combi_t15 4, 0,1,3,2,3,0
L1608:	fn_combi_t44 6, 5,0,2,1,2,3
# --- block 77 ---
L1612:	fn_link  Multiplier.fmtB
	fn_combi_t44 6, 5,0,3,1,2,3
# --- block 78 ---
L1620:	fn_link  L1632
	fn_link  L1636
	fn_combi_t2 4, 3,0,1,0,0,0
L1632:	fn_combi_t0 2, 0,0,0,0,0,0
L1636:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 79 ---
L1644:	fn_link  L1620
	fn_link  L1656
	fn_combi_t2 4, 3,0,1,0,0,0
L1656:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 80 ---
L1664:	fn_link  L1592
	fn_link  L1612
	fn_link  L1644
	fn_link  Multiplier.fmtStr
	fn_link  L1688
	fn_combi_t43 6, 0,1,2,3,4,5
L1688:	fn_combi_t44 7, 6,0,1,2,3,4
# --- block 81 ---
L1692:	fn_link  L1700
	fn_elink Multiplier.upfrom
L1700:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 82 ---
L1708:	fn_link  L1692
	fn_link  L1720
	fn_elink Multiplier.fmtInt
L1720:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 83 ---
L1728:	fn_link  L1664
	fn_link  L1708
	fn_combi_t46 7, 6,0,1,2,3,4
# --- block 84 ---
L1740:	fn_link  Multiplier.format
	fn_combi_t48 5, 0,3,1,4,4,2
# --- block 85 ---
L1748:	fn_link  L1764
	fn_link  L1728
	fn_link  L1740
	fn_combi_t5 4, 0,1,3,2,0,0
L1764:	fn_combi_t0 6, 2,0,0,0,0,0
# --- block 86 ---
Multiplier.format:	fn_link  L1808
	fn_link  Multiplier.takeL
	fn_link  L1792
	fn_link  NanoPrelude.concat
	fn_link  L1796
	fn_combi_t47 6, 0,1,2,3,5,4
L1792:	fn_combi_t3 3, 0,1,2,0,0,0
L1796:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 87 ---
L1800:	fn_link  NanoPrelude.concat
	fn_elink NanoPrelude.map
# --- block 88 ---
L1808:	fn_link  Multiplier.transL
	fn_link  L1800
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 89 ---
NanoPrelude.concat:	fn_link  L1832
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L1832:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 90 ---
NanoPrelude.foldr:	fn_link  L1852
	fn_link  L1848
	fn_combi_t7 4, 0,1,2,3,0,0
L1848:	fn_y
# --- block 91 ---
L1852:	fn_link  L1860
	fn_combi_t16 5, 4,2,0,1,3,0
L1860:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 92 ---
Data.List_Type.$2b$2b:	fn_link  L1892
	fn_link  L1876
	fn_combi_t5 4, 0,1,3,2,0,0
L1876:	fn_y
# --- block 93 ---
L1880:	fn_link  L1888
	fn_combi_t6 4, 0,2,1,3,0,0
L1888:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 94 ---
L1892:	fn_link  L1880
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 95 ---
Multiplier.takeL:	fn_link  L1916
	fn_link  L1964
	fn_link  L1980
	fn_combi_t24 5, 0,1,3,3,4,2
L1916:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 96 ---
L1920:	fn_link  L1936
	fn_link  L1960
	fn_link  Multiplier.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L1936:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1960:	fn_y
# --- block 97 ---
L1964:	fn_link  L1920
	fn_link  L1976
	fn_combi_t16 5, 0,3,1,2,4,0
L1976:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 98 ---
L1980:	fn_link  L1996
	fn_link  L2000
	fn_link  L2004
	fn_combi_t44 6, 0,4,1,5,2,3
L1996:	fn_combi_t0 2, 0,0,0,0,0,0
L2000:	fn_elink _prim_le
L2004:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 99 ---
NanoPrelude.map:	fn_link  L2040
	fn_link  L2024
	fn_combi_t3 3, 0,1,2,0,0,0
L2024:	fn_y
# --- block 100 ---
L2028:	fn_link  L2036
	fn_combi_t15 5, 0,1,3,2,4,0
L2036:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 101 ---
L2040:	fn_link  L2028
	fn_link  L2052
	fn_combi_t16 5, 4,0,1,2,3,0
L2052:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 102 ---
Multiplier.transL:	fn_link  L2068
	fn_link  L2112
	fn_combi_t2 3, 0,2,1,0,0,0
L2068:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 103 ---
L2072:	fn_link  Multiplier.tailL
	fn_link  NanoPrelude.map
	fn_link  Multiplier.transL
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 104 ---
L2088:	fn_link  L2072
	fn_link  Multiplier.headL
	fn_link  NanoPrelude.map
	fn_link  L2108
	fn_combi_t40 5, 0,1,2,4,3,4
L2108:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 105 ---
L2112:	fn_link  L2088
	fn_link  NanoPrelude.null
	fn_link  NanoPrelude.map
	fn_link  Multiplier.orB
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 106 ---
Multiplier.orB:	fn_link  L2140
	fn_elink NanoPrelude.any
L2140:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 107 ---
NanoPrelude.any:	fn_link  L2168
	fn_link  L2156
	fn_combi_t3 3, 0,1,2,0,0,0
L2156:	fn_y
# --- block 108 ---
L2160:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 109 ---
L2168:	fn_link  L2160
	fn_link  L2180
	fn_combi_t16 5, 4,0,1,2,3,0
L2180:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 110 ---
NanoPrelude.$7c$7c:	fn_link  L2192
	fn_combi_t2 3, 1,2,0,0,0,0
L2192:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 111 ---
NanoPrelude.null:	fn_link  L2212
	fn_link  L2208
	fn_combi_t2 3, 2,0,1,0,0,0
L2208:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 112 ---
L2212:	fn_link  L2220
	fn_combi_t0 3, 0,0,0,0,0,0
L2220:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 113 ---
Multiplier.headL:	fn_link  L2236
	fn_link  L2240
	fn_combi_t2 3, 2,0,1,0,0,0
L2236:	fn_combi_t0 2, 0,0,0,0,0,0
L2240:	fn_elink _error0
# --- block 114 ---
Multiplier.tailL:	fn_link  L2256
	fn_link  L2260
	fn_combi_t2 3, 2,0,1,0,0,0
L2256:	fn_combi_t0 2, 1,0,0,0,0,0
L2260:	fn_elink _error0
# --- block 115 ---
Multiplier.fmtInt:	fn_link  Multiplier.dec
	fn_link  NanoPrelude.map
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 116 ---
Multiplier.dec:	fn_link  Multiplier.showI
	fn_link  L2368
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 117 ---
L2288:	fn_link  L2308
	fn_link  L2316
	fn_link  L2340
	fn_link  Multiplier.rept
	fn_combi_t36 6, 0,1,5,4,2,3
L2308:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
L2316:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2340:	fn_y
# --- block 118 ---
L2344:	fn_link  L2288
	fn_link  Multiplier.append
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 119 ---
L2356:	fn_link  L2364
	fn_combi_t38 5, 1,4,0,3,2,4
L2364:	fn_elink _prim_lt
# --- block 120 ---
L2368:	fn_link  NanoPrelude.length
	fn_link  L2344
	fn_link  L2356
	fn_link  L2388
	fn_combi_t29 5, 0,1,4,2,4,3
L2388:	fn_combi_t38 4, 0,1,3,3,2,3
# --- block 121 ---
Multiplier.rept:	fn_link  L2408
	fn_link  L2456
	fn_link  L2472
	fn_combi_t10 4, 0,1,3,2,3,0
L2408:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
L2412:	fn_link  L2428
	fn_link  L2452
	fn_link  Multiplier.rept
	fn_combi_t8 4, 0,1,3,2,0,0
L2428:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2452:	fn_y
# --- block 123 ---
L2456:	fn_link  L2412
	fn_link  L2468
	fn_combi_t16 4, 0,3,1,2,3,0
L2468:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 124 ---
L2472:	fn_link  L2484
	fn_link  L2488
	fn_combi_t29 6, 4,0,1,2,5,3
L2484:	fn_elink _prim_eq
L2488:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 125 ---
NanoPrelude.length:	fn_link  L2508
	fn_link  L2556
	fn_y
L2508:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 126 ---
L2516:	fn_link  L2528
	fn_link  L2552
	fn_combi_t8 5, 2,0,3,1,0,0
L2528:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2552:	fn_y
# --- block 127 ---
L2556:	fn_link  L2516
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 128 ---
Multiplier.showI:	fn_link  L2772
	fn_link  L2584
	fn_link  L2784
	fn_link  L2876
	fn_combi_t39 5, 0,4,1,4,2,3
L2584:	fn_y
# --- block 129 ---
L2588:	fn_link  L2604
	fn_link  L2608
	fn_link  L2632
	fn_combi_t13 6, 5,0,3,1,2,0
L2604:	fn_combi_t0 2, 0,0,0,0,0,0
L2608:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2632:	fn_y
# --- block 130 ---
L2636:	fn_link  L2656
	fn_link  L2680
	fn_link  NanoPrelude.rem
	fn_link  L2688
	fn_combi_t18 5, 0,1,4,2,3,0
L2656:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2680:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L2688:	fn_y
# --- block 131 ---
L2692:	fn_link  L2704
	fn_link  L2636
	fn_combi_t5 5, 4,0,2,1,0,0
L2704:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 132 ---
L2708:	fn_link  L2724
	fn_link  NanoPrelude.quot
	fn_link  Multiplier.append
	fn_combi_t21 5, 0,3,1,4,2,0
L2724:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 133 ---
L2732:	fn_link  L2692
	fn_link  L2708
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 134 ---
L2744:	fn_link  L2732
	fn_link  L2760
	fn_link  L2764
	fn_combi_t44 5, 0,4,1,2,3,4
L2760:	fn_elink _prim_lt
L2764:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 135 ---
L2772:	fn_link  L2588
	fn_link  L2744
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 136 ---
L2784:	fn_link  L2800
	fn_link  L2824
	fn_link  L2832
	fn_combi_t22 5, 4,0,3,1,2,0
L2800:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2824:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2832:	fn_y
# --- block 137 ---
L2836:	fn_link  L2848
	fn_link  L2852
	fn_combi_t15 4, 0,2,1,3,2,0
L2848:	fn_elink _prim_lt
L2852:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 138 ---
L2860:	fn_link  L2872
	fn_link  L2836
	fn_combi_t3 3, 0,1,2,0,0,0
L2872:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 139 ---
L2876:	fn_link  L2896
	fn_link  L2904
	fn_link  L2860
	fn_link  L2908
	fn_combi_t10 5, 0,1,4,2,3,0
L2896:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L2904:	fn_combi_t2 4, 3,0,1,0,0,0
L2908:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 140 ---
NanoPrelude.quot:	fn_link  L2924
	fn_link  L2948
	fn_combi_t8 4, 0,3,2,1,0,0
L2924:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2948:	fn_y
# --- block 141 ---
NanoPrelude.rem:	fn_link  L2964
	fn_link  L2988
	fn_combi_t8 4, 0,3,2,1,0,0
L2964:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2988:	fn_y
# --- block 142 ---
Multiplier.upfrom:	fn_link  L3012
	fn_link  L3036
	fn_link  Multiplier.upfrom
	fn_link  L3040
	fn_combi_t50 5, 0,4,1,2,4,3
L3012:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3036:	fn_y
L3040:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 143 ---
Multiplier.fmtStr:	fn_link  Multiplier.fmtStr
	fn_link  L3056
	fn_combi_t6 3, 0,2,1,2,0,0
L3056:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 144 ---
Multiplier.fmtB:	fn_link  L3068
	fn_elink NanoPrelude.map
# --- block 145 ---
L3068:	fn_link  L3076
	fn_elink Multiplier.dec
L3076:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 146 ---
Multiplier.fmtW:	fn_link  Multiplier.intrep
	fn_link  Multiplier.fmtDec
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 147 ---
Multiplier.fmtDec:	fn_link  Multiplier.dec
	fn_link  NanoPrelude.map
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 148 ---
Multiplier.intrep:	fn_link  Multiplier.transL
	fn_link  Multiplier.bitsi
	fn_link  NanoPrelude.map
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 149 ---
Multiplier.bitsi:	fn_link  L3136
	fn_link  L3240
	fn_y
L3136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 150 ---
L3144:	fn_link  L3164
	fn_link  L3188
	fn_link  L3212
	fn_link  L3220
	fn_combi_t55 6, 5,0,4,1,2,3
L3164:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3188:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3212:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L3220:	fn_y
# --- block 151 ---
L3224:	fn_link  L3144
	fn_link  L3236
	fn_combi_t21 5, 2,0,1,3,4,0
L3236:	fn_y
# --- block 152 ---
L3240:	fn_link  L3224
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 153 ---
Multiplier.multsys:	fn_link  L3732
	fn_link  L3864
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 154 ---
L3260:	fn_link  L3268
	fn_combi_t1 2, 1,0,0,0,0,0
L3268:	fn_combi_t0 6, 4,0,0,0,0,0
# --- block 155 ---
L3272:	fn_link  NanoPrelude.snd
	fn_link  NanoPrelude.map
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 156 ---
L3284:	fn_link  L3296
	fn_link  L3304
	fn_combi_t16 5, 0,1,2,4,3,0
L3296:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 157 ---
L3308:	fn_link  L3316
	fn_combi_t16 5, 0,3,1,2,4,0
L3316:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 158 ---
L3320:	fn_link  L3308
	fn_link  L3332
	fn_combi_t16 5, 3,0,1,2,4,0
L3332:	fn_elink _error0
# --- block 159 ---
L3336:	fn_link  L3352
	fn_link  L3356
	fn_link  L3360
	fn_combi_t38 6, 4,0,1,2,3,5
L3352:	fn_elink _error0
L3356:	fn_elink _prim_eq
L3360:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 160 ---
L3368:	fn_link  L3320
	fn_link  L3336
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 161 ---
L3380:	fn_link  L3392
	fn_link  L3396
	fn_combi_t44 5, 3,0,1,2,3,4
L3392:	fn_elink _prim_eq
L3396:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 162 ---
L3404:	fn_link  L3368
	fn_link  L3380
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 163 ---
L3416:	fn_link  L3404
	fn_link  L3436
	fn_link  L3440
	fn_link  L3444
	fn_combi_t17 5, 0,1,2,3,4,0
L3436:	fn_combi_t37 5, 0,1,3,4,2,4
L3440:	fn_elink _error0
L3444:	fn_combi_t48 7, 3,0,1,4,2,4
# --- block 164 ---
L3448:	fn_link  L3284
	fn_link  L3416
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 165 ---
L3460:	fn_link  L3448
	fn_link  L3472
	fn_combi_t46 7, 4,0,1,2,3,4
L3472:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 166 ---
L3476:	fn_link  L3460
	fn_link  L3488
	fn_combi_t46 5, 3,0,1,2,3,4
L3488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 167 ---
L3492:	fn_link  L3476
	fn_y
# --- block 168 ---
L3500:	fn_link  L3492
	fn_link  Multiplier.ibits
	fn_link  NanoPrelude.map
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 169 ---
L3516:	fn_link  L3500
	fn_link  Multiplier.ntrans
	fn_combi_t46 5, 0,2,1,2,3,4
# --- block 170 ---
L3528:	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.map
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 171 ---
L3540:	fn_link  L3552
	fn_link  L3556
	fn_combi_t2 3, 2,0,1,0,0,0
L3552:	fn_combi_t0 4, 0,0,0,0,0,0
L3556:	fn_combi_t0 6, 0,0,0,0,0,0
# --- block 172 ---
L3560:	fn_link  L3568
	fn_combi_t1 2, 1,0,0,0,0,0
L3568:	fn_combi_t0 6, 5,0,0,0,0,0
# --- block 173 ---
L3572:	fn_link  L3584
	fn_link  Multiplier.multiplier
	fn_combi_t28 6, 0,2,5,4,1,3
L3584:	fn_combi_t0 6, 3,0,0,0,0,0
# --- block 174 ---
L3588:	fn_link  L3560
	fn_link  L3572
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 175 ---
L3600:	fn_link  L3608
	fn_combi_t24 6, 0,1,5,4,2,3
L3608:	fn_combi_t25 6, 5,0,1,2,3,4
# --- block 176 ---
L3612:	fn_link  L3600
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 177 ---
L3620:	fn_link  L3540
	fn_link  L3640
	fn_link  L3588
	fn_link  L3612
	fn_combi_t10 5, 0,1,4,2,3,0
L3640:	fn_combi_t0 6, 2,0,0,0,0,0
# --- block 178 ---
L3644:	fn_link  L3620
	fn_combi_t4 3, 0,1,2,2,0,0
# --- block 179 ---
L3652:	fn_link  L3660
	fn_combi_t38 5, 0,1,4,2,3,4
L3660:	fn_combi_t24 6, 0,1,3,5,2,4
# --- block 180 ---
L3664:	fn_link  L3652
	fn_combi_t29 6, 0,1,5,2,4,3
# --- block 181 ---
L3672:	fn_link  L3516
	fn_link  L3528
	fn_link  L3644
	fn_link  L3664
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 182 ---
L3692:	fn_link  L3272
	fn_link  L3672
	fn_link  L3708
	fn_combi_t40 5, 0,1,3,4,2,4
L3708:	fn_combi_t37 5, 0,2,4,3,1,3
# --- block 183 ---
L3712:	fn_link  L3724
	fn_link  L3728
	fn_combi_t52 6, 0,1,2,5,3,4
L3724:	fn_combi_t39 4, 0,3,1,3,3,2
L3728:	fn_y
# --- block 184 ---
L3732:	fn_link  L3752
	fn_link  L3260
	fn_link  L3692
	fn_link  L3712
	fn_combi_t10 5, 0,1,4,2,3,0
L3752:	fn_combi_t0 6, 1,0,0,0,0,0
# --- block 185 ---
L3756:	fn_link  L3764
	fn_combi_t1 2, 1,0,0,0,0,0
L3764:	fn_combi_t0 6, 2,0,0,0,0,0
# --- block 186 ---
L3768:	fn_link  L3780
	fn_link  L3784
	fn_combi_t29 5, 4,3,0,3,1,2
L3780:	fn_combi_t0 6, 5,0,0,0,0,0
L3784:	fn_combi_t0 6, 3,0,0,0,0,0
# --- block 187 ---
L3788:	fn_link  L3756
	fn_link  L3768
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 188 ---
L3800:	fn_link  L3820
	fn_link  L3824
	fn_link  L3788
	fn_link  L3828
	fn_combi_t10 5, 0,1,4,2,3,0
L3820:	fn_combi_t0 4, 2,0,0,0,0,0
L3824:	fn_combi_t0 4, 1,0,0,0,0,0
L3828:	fn_combi_t39 5, 0,4,3,1,3,2
# --- block 189 ---
L3832:	fn_link  L3852
	fn_link  L3856
	fn_link  L3800
	fn_link  L3860
	fn_combi_t10 5, 0,1,4,2,3,0
L3852:	fn_combi_t0 4, 3,0,0,0,0,0
L3856:	fn_combi_t0 1, 0,0,0,0,0,0
L3860:	fn_combi_t38 5, 0,1,3,4,3,2
# --- block 190 ---
L3864:	fn_link  L3876
	fn_link  L3832
	fn_combi_t6 3, 0,2,2,1,0,0
L3876:	fn_combi_t0 6, 0,0,0,0,0,0
# --- block 191 ---
Multiplier.multiplier:	fn_link  L3940
	fn_link  L4960
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 192 ---
L3892:	fn_link  Multiplier.shr
	fn_link  Multiplier.wmux1
	fn_combi_t42 5, 0,2,3,1,2,4
# --- block 193 ---
L3904:	fn_link  L3916
	fn_link  L3892
	fn_combi_t3 3, 0,1,2,0,0,0
L3916:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 194 ---
L3920:	fn_link  Multiplier.wlat
	fn_combi_t46 6, 0,2,1,3,5,4
# --- block 195 ---
L3928:	fn_link  L3904
	fn_link  L3920
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 196 ---
L3940:	fn_link  L3928
	fn_link  L3952
	fn_combi_t18 5, 0,1,2,3,4,0
L3952:	fn_y
# --- block 197 ---
L3956:	fn_link  L3976
	fn_link  L4000
	fn_link  L4008
	fn_link  Multiplier.shl
	fn_combi_t22 5, 0,1,4,2,3,0
L3976:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4000:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4008:	fn_y
# --- block 198 ---
L4012:	fn_link  L4032
	fn_link  L4056
	fn_link  L4064
	fn_link  Multiplier.wmux1
	fn_combi_t22 5, 0,1,4,2,3,0
L4032:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4056:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4064:	fn_y
# --- block 199 ---
L4068:	fn_link  L4088
	fn_link  L4112
	fn_link  L4120
	fn_link  Multiplier.wlat
	fn_combi_t22 5, 0,1,4,2,3,0
L4088:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4112:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4120:	fn_y
# --- block 200 ---
L4124:	fn_link  L4068
	fn_link  L4136
	fn_combi_t3 3, 0,1,2,0,0,0
L4136:	fn_combi_t57 6, 0,1,2,5,3,4
# --- block 201 ---
L4140:	fn_link  L4124
	fn_combi_t25 6, 0,1,2,5,3,4
# --- block 202 ---
L4148:	fn_link  L3956
	fn_link  L4012
	fn_link  L4140
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 203 ---
L4164:	fn_link  Multiplier.zerO
	fn_link  Multiplier.rept
	fn_link  Multiplier.append
	fn_link  L4148
	fn_combi_t49 5, 0,4,1,2,4,3
# --- block 204 ---
L4184:	fn_link  Multiplier.zerO
	fn_link  L4208
	fn_link  L4232
	fn_link  L4240
	fn_link  Multiplier.rept
	fn_combi_t36 6, 0,1,5,2,3,4
L4208:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4232:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4240:	fn_y
# --- block 205 ---
L4244:	fn_link  L4264
	fn_link  L4288
	fn_link  L4296
	fn_link  Multiplier.wmux1
	fn_combi_t22 5, 0,1,4,2,3,0
L4264:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4288:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4296:	fn_y
# --- block 206 ---
L4300:	fn_link  L4320
	fn_link  L4344
	fn_link  L4352
	fn_link  Multiplier.wlat
	fn_combi_t22 5, 0,1,4,2,3,0
L4320:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4344:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4352:	fn_y
# --- block 207 ---
L4356:	fn_link  L4376
	fn_link  L4244
	fn_link  L4300
	fn_link  L4380
	fn_combi_t29 5, 0,1,4,2,4,3
L4376:	fn_combi_t0 3, 2,0,0,0,0,0
L4380:	fn_combi_t53 6, 0,1,4,5,2,3
# --- block 208 ---
L4384:	fn_link  L4184
	fn_link  L4356
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 209 ---
L4396:	fn_link  Multiplier.zerO
	fn_link  L4420
	fn_link  L4444
	fn_link  L4452
	fn_link  Multiplier.rept
	fn_combi_t36 6, 0,1,5,2,3,4
L4420:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4444:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4452:	fn_y
# --- block 210 ---
L4456:	fn_link  L4476
	fn_link  L4500
	fn_link  Multiplier.dropL
	fn_link  Multiplier.headL
	fn_combi_t55 6, 0,1,2,4,3,5
L4476:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4500:	fn_y
# --- block 211 ---
L4504:	fn_link  L4524
	fn_link  L4548
	fn_link  L4556
	fn_link  Multiplier.wmux1
	fn_combi_t22 5, 0,1,4,2,3,0
L4524:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4548:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4556:	fn_y
# --- block 212 ---
L4560:	fn_link  L4456
	fn_link  L4504
	fn_combi_t30 5, 0,2,1,2,4,3
# --- block 213 ---
L4572:	fn_link  L4396
	fn_link  L4560
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 214 ---
L4584:	fn_link  L4604
	fn_link  L4628
	fn_link  L4636
	fn_link  Multiplier.add
	fn_combi_t22 5, 0,1,4,2,3,0
L4604:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4628:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4636:	fn_y
# --- block 215 ---
L4640:	fn_link  L4652
	fn_link  L4584
	fn_combi_t6 4, 0,2,3,1,0,0
L4652:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 216 ---
L4656:	fn_link  L4664
	fn_combi_t24 6, 0,1,5,2,4,3
L4664:	fn_combi_t33 6, 5,0,1,2,3,4
# --- block 217 ---
L4668:	fn_link  L4640
	fn_link  L4656
	fn_combi_t29 6, 0,1,2,3,5,4
# --- block 218 ---
L4680:	fn_link  Multiplier.zerO
	fn_link  L4572
	fn_link  L4668
	fn_combi_t11 4, 0,3,1,3,2,0
# --- block 219 ---
L4696:	fn_link  L4384
	fn_link  L4680
	fn_link  L4712
	fn_combi_t44 5, 0,1,3,2,3,4
L4712:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 220 ---
L4716:	fn_link  L4728
	fn_link  L4732
	fn_combi_t52 6, 0,1,2,5,3,4
L4728:	fn_combi_t42 5, 0,3,4,3,1,2
L4732:	fn_y
# --- block 221 ---
L4736:	fn_link  L4716
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 222 ---
L4744:	fn_link  L4764
	fn_link  L4768
	fn_link  L4696
	fn_link  L4736
	fn_combi_t10 5, 0,1,4,2,3,0
L4764:	fn_combi_t0 2, 1,0,0,0,0,0
L4768:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 223 ---
L4772:	fn_link  L4784
	fn_link  L4744
	fn_combi_t23 6, 0,2,3,4,5,1
L4784:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 224 ---
L4788:	fn_link  L4808
	fn_link  L4832
	fn_link  L4840
	fn_link  Multiplier.regIs0
	fn_combi_t22 5, 0,1,4,2,3,0
L4808:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4832:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4840:	fn_y
# --- block 225 ---
L4844:	fn_link  Multiplier.or2
	fn_combi_t58 6, 5,0,1,2,3,4
# --- block 226 ---
L4852:	fn_link  L4844
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 227 ---
L4860:	fn_link  Multiplier.regIs0
	fn_link  L4788
	fn_link  L4852
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 228 ---
L4876:	fn_link  L4860
	fn_link  L4888
	fn_combi_t12 4, 0,1,2,3,3,0
L4888:	fn_combi_t23 6, 0,2,5,4,1,3
# --- block 229 ---
L4892:	fn_link  L4876
	fn_link  L4904
	fn_combi_t3 3, 0,1,2,0,0,0
L4904:	fn_combi_t28 4, 0,1,3,2,3,3
# --- block 230 ---
L4908:	fn_link  L4892
	fn_link  L4920
	fn_combi_t29 6, 0,1,2,3,5,4
L4920:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 231 ---
L4924:	fn_link  L4940
	fn_link  L4772
	fn_link  L4908
	fn_combi_t11 4, 0,3,1,3,2,0
L4940:	fn_y
# --- block 232 ---
L4944:	fn_link  L4924
	fn_link  L4956
	fn_combi_t3 3, 0,1,2,0,0,0
L4956:	fn_combi_t39 6, 0,1,2,4,3,5
# --- block 233 ---
L4960:	fn_link  L4164
	fn_link  L4944
	fn_link  L4976
	fn_combi_t15 4, 0,1,3,2,3,0
L4976:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 234 ---
Multiplier.or2:	fn_link  L5028
	fn_link  Multiplier.forceBit
	fn_elink Multiplier.lift21
# --- block 235 ---
L4992:	fn_link  L5008
	fn_link  L5016
	fn_link  L5020
	fn_combi_t10 4, 3,0,1,2,0,0
L5008:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5016:	fn_elink _prim_eq
L5020:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 236 ---
L5028:	fn_link  L4992
	fn_link  L5048
	fn_link  L5056
	fn_link  L5060
	fn_combi_t38 6, 4,0,1,2,3,5
L5048:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5056:	fn_elink _prim_eq
L5060:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 237 ---
Multiplier.lift21:	fn_link  L5120
	fn_link  L5080
	fn_combi_t3 4, 0,1,3,0,0,0
L5080:	fn_y
# --- block 238 ---
L5084:	fn_link  L5092
	fn_combi_t40 6, 0,1,2,4,3,5
L5092:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 239 ---
L5096:	fn_link  L5104
	fn_combi_t48 6, 3,0,1,4,2,5
L5104:	fn_elink _error0
# --- block 240 ---
L5108:	fn_link  L5084
	fn_link  L5096
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 241 ---
L5120:	fn_link  L5108
	fn_link  L5132
	fn_combi_t46 6, 4,0,1,2,3,5
L5132:	fn_elink _error0
# --- block 242 ---
Multiplier.forceBit:	fn_link  L5156
	fn_link  L5160
	fn_link  L5164
	fn_link  L5168
	fn_combi_t10 5, 0,4,1,2,3,0
L5156:	fn_combi_t0 2, 1,0,0,0,0,0
L5160:	fn_combi_t0 2, 0,0,0,0,0,0
L5164:	fn_elink _prim_eq
L5168:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 243 ---
Multiplier.regIs0:	fn_link  Multiplier.inv
	fn_link  NanoPrelude.map
	fn_link  Multiplier.wideAnd
	fn_combi_t7 5, 0,1,2,4,0,0
# --- block 244 ---
Multiplier.wideAnd:	fn_link  Multiplier.and2
	fn_elink Multiplier.wideGate
# --- block 245 ---
Multiplier.wideGate:	fn_link  L5316
	fn_link  L5212
	fn_combi_t3 3, 0,1,2,0,0,0
L5212:	fn_y
# --- block 246 ---
L5216:	fn_link  Multiplier.takeL
	fn_combi_t21 5, 1,2,0,4,3,0
# --- block 247 ---
L5224:	fn_link  L5232
	fn_combi_t24 5, 0,1,4,3,2,4
L5232:	fn_combi_t49 5, 0,4,1,2,4,3
# --- block 248 ---
L5236:	fn_link  Multiplier.dropL
	fn_link  L5216
	fn_link  L5224
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 249 ---
L5252:	fn_link  L5260
	fn_combi_t24 6, 0,1,5,2,3,4
L5260:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 250 ---
L5264:	fn_link  L5288
	fn_link  NanoPrelude.length
	fn_link  NanoPrelude.quot
	fn_link  L5236
	fn_link  L5252
	fn_combi_t24 6, 0,1,5,2,3,4
L5288:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 251 ---
L5296:	fn_link  L5304
	fn_combi_t6 4, 3,2,0,1,0,0
L5304:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 252 ---
L5308:	fn_link  L5296
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 253 ---
L5316:	fn_link  L5264
	fn_link  L5308
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 254 ---
Multiplier.dropL:	fn_link  L5340
	fn_link  L5384
	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 255 ---
L5340:	fn_link  L5356
	fn_link  L5380
	fn_link  Multiplier.dropL
	fn_combi_t8 5, 0,1,3,2,0,0
L5356:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5380:	fn_y
# --- block 256 ---
L5384:	fn_link  L5400
	fn_link  L5404
	fn_link  L5408
	fn_combi_t44 6, 0,4,1,5,2,3
L5400:	fn_combi_t0 2, 0,0,0,0,0,0
L5404:	fn_elink _prim_le
L5408:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 257 ---
Multiplier.and2:	fn_link  L5464
	fn_link  Multiplier.forceBit
	fn_elink Multiplier.lift21
# --- block 258 ---
L5428:	fn_link  L5444
	fn_link  L5452
	fn_link  L5456
	fn_combi_t10 4, 3,0,1,2,0,0
L5444:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5452:	fn_elink _prim_eq
L5456:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 259 ---
L5464:	fn_link  L5428
	fn_link  L5484
	fn_link  L5492
	fn_link  L5496
	fn_combi_t38 6, 4,0,1,2,3,5
L5484:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5492:	fn_elink _prim_eq
L5496:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 260 ---
Multiplier.inv:	fn_link  L5560
	fn_link  Multiplier.forceBit
	fn_elink Multiplier.lift11
# --- block 261 ---
L5516:	fn_link  L5536
	fn_link  L5544
	fn_link  L5548
	fn_link  L5552
	fn_combi_t10 5, 4,0,1,2,3,0
L5536:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5544:	fn_elink _error0
L5548:	fn_elink _prim_eq
L5552:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 262 ---
L5560:	fn_link  L5580
	fn_link  L5516
	fn_link  L5588
	fn_link  L5592
	fn_combi_t29 5, 4,0,1,2,4,3
L5580:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5588:	fn_elink _prim_eq
L5592:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 263 ---
Multiplier.lift11:	fn_link  L5624
	fn_link  L5636
	fn_link  L5644
	fn_link  L5620
	fn_combi_t52 6, 0,1,2,4,3,5
L5620:	fn_y
# --- block 264 ---
L5624:	fn_link  L5632
	fn_combi_t15 5, 0,1,3,2,4,0
L5632:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 265 ---
L5636:	fn_link  Multiplier.headstrict
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 266 ---
L5644:	fn_link  L5652
	fn_combi_t47 6, 5,0,1,2,3,4
L5652:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 267 ---
Multiplier.headstrict:	fn_link  L5672
	fn_link  L5680
	fn_link  L5676
	fn_combi_t48 5, 4,0,1,3,2,4
L5672:	fn_combi_t0 1, 0,0,0,0,0,0
L5676:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 268 ---
L5680:	fn_link  Multiplier.headL
	fn_combi_t10 5, 1,0,2,2,2,0
# --- block 269 ---
Multiplier.add:	fn_link  L5708
	fn_link  L5920
	fn_link  L5704
	fn_combi_t5 4, 0,1,3,2,0,0
L5704:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 270 ---
L5708:	fn_link  L5716
	fn_combi_t2 3, 2,1,0,0,0,0
L5716:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 271 ---
L5720:	fn_link  L5736
	fn_link  L5760
	fn_link  Multiplier.add
	fn_combi_t8 4, 0,1,3,2,0,0
L5736:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5760:	fn_y
# --- block 272 ---
L5764:	fn_link  L5720
	fn_combi_t9 5, 0,1,3,4,2,0
# --- block 273 ---
L5772:	fn_link  L5784
	fn_link  Multiplier.fulladd
	fn_combi_t14 5, 0,2,3,4,1,0
L5784:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 274 ---
L5788:	fn_link  L5800
	fn_link  L5804
	fn_combi_t15 4, 0,3,1,2,1,0
L5800:	fn_combi_t0 2, 1,0,0,0,0,0
L5804:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 275 ---
L5808:	fn_link  L5788
	fn_link  L5820
	fn_combi_t44 5, 4,3,0,1,2,3
L5820:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 276 ---
L5824:	fn_link  L5772
	fn_link  L5808
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 277 ---
L5836:	fn_link  L5824
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 278 ---
L5844:	fn_link  L5764
	fn_link  L5836
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 279 ---
L5856:	fn_link  L5864
	fn_combi_t46 6, 2,0,1,3,4,5
L5864:	fn_elink _error0
# --- block 280 ---
L5868:	fn_link  L5844
	fn_link  L5856
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 281 ---
L5880:	fn_link  L5868
	fn_link  L5892
	fn_combi_t46 6, 3,0,1,2,4,5
L5892:	fn_elink _error0
# --- block 282 ---
L5896:	fn_link  L5908
	fn_link  L5912
	fn_combi_t44 6, 2,0,1,3,4,5
L5908:	fn_elink _prim_eq
L5912:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 283 ---
L5920:	fn_link  L5880
	fn_link  L5896
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 284 ---
Multiplier.fulladd:	fn_link  Multiplier.halfadd
	fn_link  L5992
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 285 ---
L5944:	fn_link  L5956
	fn_link  Multiplier.halfadd
	fn_combi_t5 4, 0,3,1,2,0,0
L5956:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 286 ---
L5960:	fn_link  L5972
	fn_link  Multiplier.or2
	fn_combi_t57 5, 4,0,2,1,3,1
L5972:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 287 ---
L5976:	fn_link  L5988
	fn_link  L5960
	fn_combi_t37 5, 0,2,3,4,3,1
L5988:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 288 ---
L5992:	fn_link  L5944
	fn_link  L5976
	fn_combi_t16 4, 0,2,1,3,2,0
# --- block 289 ---
Multiplier.halfadd:	fn_link  Multiplier.xor
	fn_link  L6016
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 290 ---
L6016:	fn_link  Multiplier.and2
	fn_combi_t40 5, 4,0,2,3,1,3
# --- block 291 ---
Multiplier.xor:	fn_link  L6036
	fn_link  Multiplier.forceBit
	fn_elink Multiplier.lift21
# --- block 292 ---
L6036:	fn_link  L6052
	fn_link  L6060
	fn_link  L6068
	fn_combi_t10 5, 4,3,0,1,2,0
L6052:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6060:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6068:	fn_elink _prim_eq
# --- block 293 ---
Multiplier.wmux1:	fn_link  Multiplier.bmux1
	fn_link  Multiplier.word21
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 294 ---
Multiplier.word21:	fn_link  L6100
	fn_link  L6200
	fn_link  L6240
	fn_combi_t11 4, 0,3,1,3,2,0
L6100:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 295 ---
L6104:	fn_link  L6120
	fn_link  L6144
	fn_link  Multiplier.word21
	fn_combi_t8 4, 0,1,3,2,0,0
L6120:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6144:	fn_y
# --- block 296 ---
L6148:	fn_link  Multiplier.tailL
	fn_link  L6104
	fn_combi_t14 5, 0,2,3,1,4,0
# --- block 297 ---
L6160:	fn_link  Multiplier.headL
	fn_link  L6172
	fn_combi_t57 5, 0,2,1,3,1,4
L6172:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 298 ---
L6176:	fn_link  L6160
	fn_link  L6188
	fn_combi_t3 3, 0,1,2,0,0,0
L6188:	fn_combi_t43 5, 0,1,4,2,3,4
# --- block 299 ---
L6192:	fn_link  L6176
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 300 ---
L6200:	fn_link  Multiplier.tailL
	fn_link  L6148
	fn_link  L6192
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 301 ---
L6216:	fn_link  L6228
	fn_link  L6232
	fn_combi_t29 6, 2,0,1,3,5,4
L6228:	fn_elink _prim_eq
L6232:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 302 ---
L6240:	fn_link  L6216
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 303 ---
Multiplier.bmux1:	fn_link  Multiplier.and2
	fn_link  L6260
	fn_combi_t42 5, 0,2,3,1,2,4
# --- block 304 ---
L6260:	fn_link  Multiplier.inv
	fn_link  Multiplier.and2
	fn_link  Multiplier.or2
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 305 ---
Multiplier.zerO:	fn_link  Multiplier.zerO
	fn_link  L6288
	fn_combi_t2 4, 3,0,1,0,0,0
L6288:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 306 ---
Multiplier.wlat:	fn_link  L6312
	fn_link  L6360
	fn_link  L6380
	fn_combi_t24 5, 0,1,3,3,4,2
L6312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 307 ---
L6316:	fn_link  L6332
	fn_link  L6356
	fn_link  Multiplier.wlat
	fn_combi_t8 4, 0,1,3,2,0,0
L6332:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6356:	fn_y
# --- block 308 ---
L6360:	fn_link  L6316
	fn_link  Multiplier.latch
	fn_link  L6376
	fn_combi_t44 6, 0,1,4,2,3,5
L6376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 309 ---
L6380:	fn_link  L6396
	fn_link  L6400
	fn_link  L6404
	fn_combi_t44 6, 4,0,1,5,2,3
L6396:	fn_elink _error0
L6400:	fn_elink _prim_eq
L6404:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 310 ---
Multiplier.latch:	fn_link  L6420
	fn_combi_t2 4, 3,0,1,0,0,0
L6420:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 311 ---
Multiplier.shl:	fn_link  L6456
	fn_link  L6448
	fn_link  Multiplier.dropL
	fn_link  Multiplier.append
	fn_combi_t12 6, 0,1,2,5,3,0
L6448:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 312 ---
L6456:	fn_link  L6468
	fn_link  Multiplier.zerO
	fn_combi_t2 4, 3,0,1,0,0,0
L6468:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 313 ---
Multiplier.shr:	fn_link  L6492
	fn_link  Multiplier.zerO
	fn_link  L6488
	fn_combi_t16 5, 0,1,2,3,4,0
L6488:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 314 ---
L6492:	fn_link  L6508
	fn_link  L6532
	fn_link  Multiplier.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L6508:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6532:	fn_y
# --- block 315 ---
NanoPrelude.fst:	fn_link  L6544
	fn_combi_t1 2, 1,0,0,0,0,0
L6544:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 316 ---
Multiplier.ntrans:	fn_link  L6564
	fn_link  L6644
	fn_link  L6656
	fn_combi_t10 4, 0,1,3,2,3,0
L6564:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 317 ---
L6568:	fn_link  Multiplier.tailL
	fn_elink NanoPrelude.map
# --- block 318 ---
L6576:	fn_link  L6568
	fn_link  L6596
	fn_link  L6620
	fn_link  Multiplier.ntrans
	fn_combi_t41 6, 0,1,4,2,3,5
L6596:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6620:	fn_y
# --- block 319 ---
L6624:	fn_link  Multiplier.headL
	fn_link  NanoPrelude.map
	fn_link  L6640
	fn_combi_t40 5, 0,1,2,4,3,4
L6640:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 320 ---
L6644:	fn_link  L6576
	fn_link  L6624
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 321 ---
L6656:	fn_link  L6668
	fn_link  L6672
	fn_combi_t29 6, 4,0,1,2,5,3
L6668:	fn_elink _prim_eq
L6672:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 322 ---
Multiplier.ibits:	fn_link  L6828
	fn_link  L6696
	fn_link  Multiplier.revL
	fn_combi_t18 5, 0,1,2,3,4,0
L6696:	fn_y
# --- block 323 ---
L6700:	fn_link  L6712
	fn_link  NanoPrelude.quot
	fn_combi_t2 3, 0,2,1,0,0,0
L6712:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 324 ---
L6720:	fn_link  L6700
	fn_link  L6736
	fn_link  L6760
	fn_combi_t41 6, 3,0,4,1,2,5
L6736:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6760:	fn_y
# --- block 325 ---
L6764:	fn_link  L6780
	fn_link  NanoPrelude.rem
	fn_link  L6788
	fn_combi_t40 5, 0,1,4,2,3,4
L6780:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L6788:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 326 ---
L6792:	fn_link  L6720
	fn_link  L6764
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 327 ---
L6804:	fn_link  L6816
	fn_link  L6820
	fn_combi_t29 6, 4,0,1,2,5,3
L6816:	fn_elink _prim_eq
L6820:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 328 ---
L6828:	fn_link  L6844
	fn_link  L6792
	fn_link  L6804
	fn_combi_t26 5, 0,1,3,4,2,4
L6844:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 329 ---
Multiplier.revL:	fn_link  L6860
	fn_link  L6864
	fn_elink NanoPrelude.foldl
L6860:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 330 ---
L6864:	fn_link  L6872
	fn_combi_t2 3, 0,2,1,0,0,0
L6872:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 331 ---
NanoPrelude.snd:	fn_link  L6884
	fn_combi_t1 2, 1,0,0,0,0,0
L6884:	fn_combi_t0 2, 1,0,0,0,0,0

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
_unimpprim_addiw$2011:
	la a0, _unimpprim_addiw$2011$name
	tail _unimpfi_halt
_unimpprim_addiw$2011$name:
	.asciz "addiw 11"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$202:
	la a0, _unimpprim_addiw$202$name
	tail _unimpfi_halt
_unimpprim_addiw$202$name:
	.asciz "addiw 2"
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
