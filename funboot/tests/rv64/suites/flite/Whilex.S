# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Whilex  (entry @0)
	.text
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.not
	.globl	Primitives.primPerformIO
	.globl	Whilex.Eq
	.globl	Whilex.If
	.globl	Whilex.Le
	.globl	Whilex.Neg
	.globl	Whilex.add
	.globl	Whilex.andk
	.globl	Whilex.aval
	.globl	Whilex.bool
	.globl	Whilex.bval
	.globl	Whilex.cond
	.globl	Whilex.eq
	.globl	Whilex.int
	.globl	Whilex.leq
	.globl	Whilex.main
	.globl	Whilex.notk
	.globl	Whilex.run
	.globl	Whilex.seqq
	.globl	Whilex.sosstm
	.globl	Whilex.ssos
	.globl	Whilex.sub
	.globl	Whilex.upd
	.globl	Whilex.update
	.globl	Whilex.value
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Whilex.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Whilex.main:	fn_link  L44
	fn_link  L48
	fn_link  L920
	fn_elink Whilex.value
L44:	fn_combi_t0 1, 0,0,0,0,0,0
L48:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 3 ---
L56:	fn_link  L68
	fn_link  L76
	fn_combi_t2 3, 2,0,1,0,0,0
L68:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L76:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 4 ---
L84:	fn_link  L96
	fn_link  L56
	fn_combi_t2 4, 3,0,1,0,0,0
L96:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 5 ---
L100:	fn_link  L112
	fn_link  L120
	fn_combi_t2 3, 2,0,1,0,0,0
L112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L120:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 6 ---
L128:	fn_link  L84
	fn_link  L100
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 7 ---
L140:	fn_link  L152
	fn_link  L160
	fn_combi_t2 3, 2,0,1,0,0,0
L152:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
L160:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 8 ---
L168:	fn_link  L128
	fn_link  L140
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 9 ---
L180:	fn_link  L192
	fn_link  L200
	fn_combi_t2 3, 2,0,1,0,0,0
L192:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L200:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 10 ---
L208:	fn_link  L168
	fn_link  L180
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L220:	fn_link  L232
	fn_link  L240
	fn_combi_t2 3, 2,0,1,0,0,0
L232:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L240:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 12 ---
L248:	fn_link  L208
	fn_link  L220
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 13 ---
L260:	fn_link  L272
	fn_link  L280
	fn_combi_t2 3, 2,0,1,0,0,0
L272:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 14 ---
L288:	fn_link  L248
	fn_link  L260
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
L300:	fn_link  L308
	fn_combi_t1 5, 2,0,0,0,0,0
L308:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 16 ---
L316:	fn_link  L324
	fn_combi_t1 5, 4,0,0,0,0,0
L324:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 17 ---
L332:	fn_link  L300
	fn_link  L316
	fn_combi_t2 6, 4,0,1,0,0,0
# --- block 18 ---
L344:	fn_link  L332
	fn_link  L356
	fn_combi_t2 7, 2,0,1,0,0,0
L356:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 19 ---
L364:	fn_link  L372
	fn_combi_t1 5, 2,0,0,0,0,0
L372:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 20 ---
L380:	fn_link  L388
	fn_combi_t1 5, 4,0,0,0,0,0
L388:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 21 ---
L396:	fn_link  L364
	fn_link  L380
	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 22 ---
L408:	fn_link  L396
	fn_link  L420
	fn_combi_t2 7, 2,0,1,0,0,0
L420:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 23 ---
L428:	fn_link  L436
	fn_combi_t1 5, 2,0,0,0,0,0
L436:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 24 ---
L444:	fn_link  L452
	fn_combi_t1 5, 4,0,0,0,0,0
L452:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 25 ---
L460:	fn_link  L428
	fn_link  L444
	fn_elink Whilex.Eq
# --- block 26 ---
L472:	fn_link  L488
	fn_link  L408
	fn_link  L460
	fn_elink Whilex.If
L488:	fn_combi_t0 5, 3,0,0,0,0,0
# --- block 27 ---
L492:	fn_link  L500
	fn_combi_t1 5, 2,0,0,0,0,0
L500:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 28 ---
L508:	fn_link  L516
	fn_combi_t1 5, 4,0,0,0,0,0
L516:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 29 ---
L524:	fn_link  L492
	fn_link  L508
	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 30 ---
L536:	fn_link  L524
	fn_link  L548
	fn_combi_t2 7, 2,0,1,0,0,0
L548:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 31 ---
L556:	fn_link  L564
	fn_combi_t1 5, 4,0,0,0,0,0
L564:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 32 ---
L572:	fn_link  L580
	fn_combi_t1 5, 4,0,0,0,0,0
L580:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 33 ---
L588:	fn_link  L556
	fn_link  L572
	fn_combi_t2 6, 4,0,1,0,0,0
# --- block 34 ---
L600:	fn_link  L588
	fn_link  L612
	fn_combi_t2 7, 2,0,1,0,0,0
L612:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 35 ---
L620:	fn_link  L536
	fn_link  L600
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 36 ---
L632:	fn_link  L640
	fn_combi_t1 5, 4,0,0,0,0,0
L640:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 37 ---
L648:	fn_link  L656
	fn_combi_t1 5, 4,0,0,0,0,0
L656:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 38 ---
L664:	fn_link  L632
	fn_link  L648
	fn_elink Whilex.Le
# --- block 39 ---
L676:	fn_link  L620
	fn_link  L664
	fn_combi_t2 7, 6,0,1,0,0,0
# --- block 40 ---
L688:	fn_link  L696
	fn_combi_t1 5, 4,0,0,0,0,0
L696:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 41 ---
L704:	fn_link  L688
	fn_link  L716
	fn_combi_t2 7, 2,0,1,0,0,0
L716:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 42 ---
L724:	fn_link  L732
	fn_combi_t1 5, 4,0,0,0,0,0
L732:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 43 ---
L740:	fn_link  L724
	fn_link  L752
	fn_combi_t2 7, 2,0,1,0,0,0
L752:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 44 ---
L760:	fn_link  L704
	fn_link  L740
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 45 ---
L772:	fn_link  L676
	fn_link  L760
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 46 ---
L784:	fn_link  L472
	fn_link  L772
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 47 ---
L796:	fn_link  L344
	fn_link  L784
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 48 ---
L808:	fn_link  L816
	fn_combi_t1 5, 2,0,0,0,0,0
L816:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 49 ---
L824:	fn_link  L832
	fn_combi_t1 5, 4,0,0,0,0,0
L832:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 50 ---
L840:	fn_link  L808
	fn_link  L824
	fn_elink Whilex.Eq
# --- block 51 ---
L852:	fn_link  L840
	fn_elink Whilex.Neg
# --- block 52 ---
L860:	fn_link  L796
	fn_link  L852
	fn_combi_t2 7, 6,0,1,0,0,0
# --- block 53 ---
L872:	fn_link  L880
	fn_combi_t1 5, 4,0,0,0,0,0
L880:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 54 ---
L888:	fn_link  L872
	fn_link  L900
	fn_combi_t2 7, 2,0,1,0,0,0
L900:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 55 ---
L908:	fn_link  L860
	fn_link  L888
	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 56 ---
L920:	fn_link  L288
	fn_link  L908
	fn_elink Whilex.ssos
# --- block 57 ---
Whilex.value:	fn_link  L968
	fn_link  L944
	fn_combi_t16 5, 2,0,1,3,4,0
L944:	fn_elink _error0
# --- block 58 ---
L948:	fn_link  Whilex.value
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 59 ---
L956:	fn_link  L964
	fn_combi_t38 6, 1,4,0,2,3,5
L964:	fn_elink _prim_eq
# --- block 60 ---
L968:	fn_link  L948
	fn_link  L956
	fn_link  L984
	fn_combi_t15 4, 0,1,3,2,3,0
L984:	fn_combi_t54 5, 3,0,1,2,4,2
# --- block 61 ---
Whilex.ssos:	fn_link  L1000
	fn_link  Whilex.run
	fn_combi_t7 4, 0,1,2,3,0,0
L1000:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 62 ---
Whilex.run:	fn_link  L1020
	fn_link  L1016
	fn_combi_t2 3, 2,0,1,0,0,0
L1016:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 63 ---
L1020:	fn_link  Whilex.sosstm
	fn_link  Whilex.run
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 64 ---
Whilex.sosstm:	fn_link  L1116
	fn_link  L1052
	fn_link  L1220
	fn_link  L1056
	fn_combi_t10 5, 0,1,4,2,3,0
L1052:	fn_combi_t1 3, 1,0,0,0,0,0
L1056:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 65 ---
L1060:	fn_link  L1072
	fn_link  L1076
	fn_combi_t16 4, 0,3,1,2,3,0
L1072:	fn_combi_t2 7, 6,0,1,0,0,0
L1076:	fn_combi_t2 7, 3,0,1,0,0,0
# --- block 66 ---
L1080:	fn_link  Whilex.If
	fn_link  L1092
	fn_combi_t53 6, 0,1,4,2,5,3
L1092:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 67 ---
L1096:	fn_link  L1112
	fn_link  L1060
	fn_link  L1080
	fn_combi_t10 4, 0,1,3,2,3,0
L1112:	fn_combi_t0 5, 3,0,0,0,0,0
# --- block 68 ---
L1116:	fn_link  L1096
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 69 ---
L1124:	fn_link  Whilex.bval
	fn_combi_t42 6, 0,3,2,1,4,5
# --- block 70 ---
L1132:	fn_link  L1144
	fn_link  L1148
	fn_combi_t7 4, 0,1,3,2,0,0
L1144:	fn_combi_t2 7, 3,0,1,0,0,0
L1148:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 71 ---
L1152:	fn_link  L1164
	fn_link  Whilex.sosstm
	fn_combi_t14 5, 0,3,2,1,4,0
L1164:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 72 ---
L1168:	fn_link  L1132
	fn_link  L1152
	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 73 ---
L1180:	fn_link  L1192
	fn_link  Whilex.update
	fn_combi_t4 4, 0,2,3,1,0,0
L1192:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 74 ---
L1196:	fn_link  L1180
	fn_link  Whilex.aval
	fn_combi_t42 5, 0,4,2,1,2,3
# --- block 75 ---
L1208:	fn_link  L1168
	fn_link  L1196
	fn_combi_t15 4, 2,0,3,1,3,0
# --- block 76 ---
L1220:	fn_link  Whilex.cond
	fn_link  L1124
	fn_link  L1208
	fn_link  L1240
	fn_combi_t10 5, 0,1,4,2,3,0
L1240:	fn_combi_t47 4, 0,3,1,2,3,3
# --- block 77 ---
Whilex.aval:	fn_link  L1264
	fn_link  L1360
	fn_link  L1260
	fn_combi_t5 4, 0,1,3,2,0,0
L1260:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 78 ---
L1264:	fn_link  Whilex.value
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 79 ---
L1272:	fn_link  Whilex.aval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 80 ---
L1280:	fn_link  Whilex.aval
	fn_link  Whilex.seqq
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 81 ---
L1292:	fn_link  L1272
	fn_link  L1280
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 82 ---
L1304:	fn_link  Whilex.sub
	fn_link  L1292
	fn_combi_t37 6, 0,2,4,5,1,3
# --- block 83 ---
L1316:	fn_link  Whilex.aval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 84 ---
L1324:	fn_link  Whilex.aval
	fn_link  Whilex.seqq
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 85 ---
L1336:	fn_link  L1316
	fn_link  L1324
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 86 ---
L1348:	fn_link  Whilex.add
	fn_link  L1336
	fn_combi_t37 6, 0,2,4,5,1,3
# --- block 87 ---
L1360:	fn_link  L1304
	fn_link  L1348
	fn_link  L1376
	fn_combi_t39 5, 0,3,1,4,2,4
L1376:	fn_combi_t38 4, 0,1,3,3,2,3
# --- block 88 ---
Whilex.seqq:	fn_link  L1388
	fn_combi_t7 4, 1,0,2,3,0,0
L1388:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 89 ---
Whilex.add:	fn_link  L1408
	fn_link  L1432
	fn_link  Whilex.int
	fn_combi_t36 6, 0,1,5,4,2,3
L1408:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1432:	fn_y
# --- block 90 ---
Whilex.int:	fn_link  L1452
	fn_link  L1460
	fn_link  L1464
	fn_combi_t38 5, 0,1,3,4,4,2
L1452:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1460:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 91 ---
L1464:	fn_link  L1476
	fn_link  L1480
	fn_combi_t15 4, 0,2,1,3,2,0
L1476:	fn_elink _prim_eq
L1480:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 92 ---
Whilex.sub:	fn_link  L1504
	fn_link  L1528
	fn_link  Whilex.int
	fn_combi_t36 6, 0,1,5,4,2,3
L1504:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1528:	fn_y
# --- block 93 ---
Whilex.update:	fn_link  L1664
	fn_link  L1676
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 94 ---
L1544:	fn_link  Whilex.upd
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 95 ---
L1552:	fn_link  Whilex.update
	fn_combi_t28 5, 0,4,1,2,3,3
# --- block 96 ---
L1560:	fn_link  L1544
	fn_link  L1552
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 97 ---
L1572:	fn_link  Whilex.update
	fn_combi_t28 6, 0,2,1,3,5,4
# --- block 98 ---
L1580:	fn_link  Whilex.upd
	fn_link  L1572
	fn_link  L1596
	fn_combi_t5 4, 0,1,3,2,0,0
L1596:	fn_combi_t30 6, 0,4,1,2,5,3
# --- block 99 ---
L1600:	fn_link  L1608
	fn_combi_t29 6, 1,4,0,2,5,3
L1608:	fn_elink _prim_eq
# --- block 100 ---
L1612:	fn_link  L1600
	fn_link  L1624
	fn_combi_t44 6, 0,1,2,3,4,5
L1624:	fn_combi_t26 5, 0,1,2,4,3,4
# --- block 101 ---
L1628:	fn_link  L1580
	fn_link  L1612
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 102 ---
L1640:	fn_link  L1648
	fn_combi_t38 5, 0,1,2,4,3,4
L1648:	fn_combi_t56 5, 3,0,1,4,2,4
# --- block 103 ---
L1652:	fn_link  L1628
	fn_link  L1640
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 104 ---
L1664:	fn_link  L1560
	fn_link  L1652
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 105 ---
L1676:	fn_link  L1684
	fn_combi_t44 5, 1,3,0,2,3,4
L1684:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
Whilex.upd:	fn_link  L1700
	fn_link  L1704
	fn_combi_t54 6, 2,0,1,3,4,5
L1700:	fn_combi_t2 3, 2,0,1,0,0,0
L1704:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 107 ---
Whilex.bval:	fn_link  L1752
	fn_link  L2124
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 108 ---
L1720:	fn_link  Whilex.bval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 109 ---
L1728:	fn_link  Whilex.bval
	fn_link  Whilex.seqq
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 110 ---
L1740:	fn_link  L1720
	fn_link  L1728
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 111 ---
L1752:	fn_link  Whilex.andk
	fn_link  L1740
	fn_combi_t37 6, 0,2,4,5,1,3
# --- block 112 ---
L1764:	fn_link  Whilex.aval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 113 ---
L1772:	fn_link  Whilex.aval
	fn_link  Whilex.seqq
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 114 ---
L1784:	fn_link  L1764
	fn_link  L1772
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 115 ---
L1796:	fn_link  Whilex.eq
	fn_link  L1784
	fn_combi_t37 6, 0,2,4,5,1,3
# --- block 116 ---
L1808:	fn_link  L1824
	fn_link  L1828
	fn_link  L1832
	fn_combi_t45 6, 0,4,1,5,3,2
L1824:	fn_combi_t0 2, 0,0,0,0,0,0
L1828:	fn_elink _prim_lt
L1832:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 117 ---
L1840:	fn_link  L1808
	fn_combi_t37 5, 0,1,3,4,4,2
# --- block 118 ---
L1848:	fn_link  L1796
	fn_link  L1840
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 119 ---
L1860:	fn_link  L1872
	fn_link  L1876
	fn_combi_t44 5, 0,3,1,2,3,4
L1872:	fn_elink _prim_lt
L1876:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 120 ---
L1884:	fn_link  Whilex.aval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 121 ---
L1892:	fn_link  Whilex.aval
	fn_link  Whilex.seqq
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 122 ---
L1904:	fn_link  L1884
	fn_link  L1892
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 123 ---
L1916:	fn_link  Whilex.leq
	fn_link  L1904
	fn_combi_t37 6, 0,2,4,5,1,3
# --- block 124 ---
L1928:	fn_link  Whilex.notk
	fn_link  Whilex.bval
	fn_combi_t14 5, 0,4,2,1,3,0
# --- block 125 ---
L1940:	fn_link  L1956
	fn_link  L1960
	fn_link  L1964
	fn_combi_t45 6, 0,4,1,5,3,2
L1956:	fn_combi_t0 2, 1,0,0,0,0,0
L1960:	fn_elink _prim_lt
L1964:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 126 ---
L1972:	fn_link  L1940
	fn_combi_t37 5, 0,1,3,4,4,2
# --- block 127 ---
L1980:	fn_link  L1928
	fn_link  L1972
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 128 ---
L1992:	fn_link  L2004
	fn_link  L2008
	fn_combi_t44 5, 0,3,1,2,3,4
L2004:	fn_elink _prim_lt
L2008:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 129 ---
L2016:	fn_link  L1980
	fn_link  L1992
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 130 ---
L2028:	fn_link  L2016
	fn_link  L2040
	fn_combi_t38 5, 0,1,2,4,3,4
L2040:	fn_combi_t37 5, 0,1,3,4,4,2
# --- block 131 ---
L2044:	fn_link  L2056
	fn_link  L2060
	fn_combi_t44 5, 0,3,1,2,3,4
L2056:	fn_elink _prim_lt
L2060:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 132 ---
L2068:	fn_link  L1916
	fn_link  L2028
	fn_link  L2044
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 133 ---
L2084:	fn_link  L2092
	fn_combi_t29 5, 0,1,4,2,4,3
L2092:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 134 ---
L2096:	fn_link  L2084
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 135 ---
L2104:	fn_link  L1848
	fn_link  L1860
	fn_link  L2068
	fn_link  L2096
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 136 ---
L2124:	fn_link  L2104
	fn_combi_t56 5, 1,0,2,4,3,4
# --- block 137 ---
Whilex.notk:	fn_link  NanoPrelude.not
	fn_link  Whilex.bool
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 138 ---
Whilex.bool:	fn_link  L2156
	fn_link  L2160
	fn_combi_t15 4, 2,3,0,3,1,0
L2156:	fn_combi_t0 2, 1,0,0,0,0,0
L2160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 139 ---
NanoPrelude.not:	fn_link  L2176
	fn_link  L2180
	fn_combi_t2 3, 2,0,1,0,0,0
L2176:	fn_combi_t0 2, 0,0,0,0,0,0
L2180:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 140 ---
Whilex.leq:	fn_link  L2192
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 141 ---
L2192:	fn_link  L2212
	fn_link  L2216
	fn_link  L2220
	fn_link  Whilex.bool
	fn_combi_t52 6, 0,5,4,1,2,3
L2212:	fn_combi_t0 2, 1,0,0,0,0,0
L2216:	fn_combi_t0 2, 0,0,0,0,0,0
L2220:	fn_elink _prim_le
# --- block 142 ---
Whilex.eq:	fn_link  L2232
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 143 ---
L2232:	fn_link  L2252
	fn_link  L2256
	fn_link  L2260
	fn_link  Whilex.bool
	fn_combi_t52 6, 0,5,4,1,2,3
L2252:	fn_combi_t0 2, 1,0,0,0,0,0
L2256:	fn_combi_t0 2, 0,0,0,0,0,0
L2260:	fn_elink _prim_eq
# --- block 144 ---
Whilex.andk:	fn_link  NanoPrelude.$26$26
	fn_link  Whilex.bool
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 145 ---
NanoPrelude.$26$26:	fn_link  L2284
	fn_combi_t1 2, 1,0,0,0,0,0
L2284:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 146 ---
Whilex.cond:	fn_link  L2300
	fn_link  L2312
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 147 ---
L2300:	fn_link  L2308
	fn_combi_t2 3, 0,2,1,0,0,0
L2308:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 148 ---
L2312:	fn_link  L2320
	fn_combi_t40 6, 5,0,4,2,1,3
L2320:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 149 ---
Whilex.If:	fn_link  L2332
	fn_combi_t4 5, 0,1,2,3,0,0
L2332:	fn_combi_t4 7, 4,0,1,2,0,0
# --- block 150 ---
Whilex.Neg:	fn_link  L2348
	fn_link  L2352
	fn_combi_t6 4, 3,0,1,2,0,0
L2348:	fn_combi_t1 2, 1,0,0,0,0,0
L2352:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 151 ---
Whilex.Eq:	fn_link  L2372
	fn_link  L2376
	fn_combi_t16 5, 4,0,1,2,3,0
L2372:	fn_combi_t2 3, 2,0,1,0,0,0
L2376:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 152 ---
Whilex.Le:	fn_link  L2396
	fn_link  L2400
	fn_combi_t16 5, 4,0,1,2,3,0
L2396:	fn_combi_t2 3, 2,0,1,0,0,0
L2400:	fn_box
	.word 0x00000003	# raw word 3
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
