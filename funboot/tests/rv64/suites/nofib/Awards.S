# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Awards  (entry @0)
	.text
	.globl	Awards.append
	.globl	Awards.awards
	.globl	Awards.bench
	.globl	Awards.bronze
	.globl	Awards.competitors
	.globl	Awards.deleteL
	.globl	Awards.diffL
	.globl	Awards.findallawards
	.globl	Awards.findawards
	.globl	Awards.gold
	.globl	Awards.hashAll
	.globl	Awards.hashAward
	.globl	Awards.hashStr
	.globl	Awards.headL
	.globl	Awards.leL
	.globl	Awards.leP
	.globl	Awards.loop
	.globl	Awards.perms
	.globl	Awards.qpart
	.globl	Awards.qsort
	.globl	Awards.rqpart
	.globl	Awards.rqsort
	.globl	Awards.silver
	.globl	Awards.simIter
	.globl	Awards.sort
	.globl	Data.Bool_Type.True
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.null
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Awards.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Awards.bench:	fn_link  L40
	fn_link  L48
	fn_elink Awards.loop
L40:	fn_box
L44:	.word 0x00000001	# raw word 1
	fn_box_body
L48:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
Awards.loop:	fn_link  L112
L60:	fn_link  L156
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 4 ---
L68:	fn_link  L88
L72:	fn_link  NanoPrelude.rem
	fn_link  Awards.competitors
L80:	fn_link  Awards.findallawards
	fn_combi_t21 5, 0,1,2,4,3,0
L88:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 5 ---
L96:	fn_link  L68
L100:	fn_link  Awards.hashAll
L104:	fn_link  Awards.loop
L108:	fn_combi_t20 5, 0,1,3,2,4,0
# --- block 6 ---
L112:	fn_link  L128
	fn_link  L152
	fn_link  L96
	fn_combi_t43 5, 0,3,4,1,4,2
L128:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L152:	fn_y
# --- block 7 ---
L156:	fn_link  L168
	fn_link  Awards.simIter
	fn_combi_t29 5, 0,4,1,2,4,3
L168:	fn_elink _prim_gt
# --- block 8 ---
Awards.simIter:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 9 ---
Awards.hashAll:	fn_link  L204
	fn_elink NanoPrelude.foldl
# --- block 10 ---
L188:	fn_link  Awards.hashStr
	fn_link  Awards.hashAward
	fn_link  NanoPrelude.foldl
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 11 ---
L204:	fn_link  L188
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 12 ---
NanoPrelude.foldl:	fn_link  L228
	fn_link  L224
	fn_combi_t3 3, 0,1,2,0,0,0
L224:	fn_y
# --- block 13 ---
L228:	fn_link  L236
	fn_combi_t46 5, 4,3,0,1,2,3
L236:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 14 ---
Awards.hashAward:	fn_link  L320
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 15 ---
L248:	fn_link  L268
	fn_link  Awards.hashStr
	fn_link  L292
	fn_link  L300
	fn_combi_t60 6, 0,1,2,4,5,3
L268:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L292:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L300:	fn_y
# --- block 16 ---
L304:	fn_link  L316
	fn_link  Awards.hashStr
	fn_combi_t63 6, 0,1,5,2,4,3
L316:	fn_y
# --- block 17 ---
L320:	fn_link  L336
	fn_link  L248
	fn_link  L304
	fn_combi_t52 6, 5,0,1,3,2,4
L336:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 18 ---
Awards.hashStr:	fn_link  L448
	fn_elink NanoPrelude.foldl
# --- block 19 ---
L368:	fn_link  L388
	fn_link  L412
	fn_link  L436
	fn_link  L444
	fn_combi_t41 6, 0,1,4,2,5,3
L388:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L412:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L436:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L444:	fn_y
# --- block 20 ---
L448:	fn_link  L368
	fn_link  L460
	fn_combi_t7 4, 0,1,2,3,0,0
L460:	fn_y
# --- block 21 ---
Awards.findallawards:	fn_link  L480
	fn_elink NanoPrelude.map
# --- block 22 ---
L472:	fn_link  Awards.findawards
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 23 ---
L480:	fn_link  L472
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 24 ---
NanoPrelude.map:	fn_link  L516
	fn_link  L500
	fn_combi_t3 3, 0,1,2,0,0,0
L500:	fn_y
# --- block 25 ---
L504:	fn_link  L512
	fn_combi_t15 5, 0,1,3,2,4,0
L512:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
L516:	fn_link  L504
	fn_link  L528
	fn_combi_t16 5, 4,0,1,2,3,0
L528:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
Awards.findawards:	fn_link  Awards.awards
	fn_link  L596
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 28 ---
L544:	fn_link  L552
	fn_combi_t1 3, 2,0,0,0,0,0
L552:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 29 ---
L556:	fn_link  L544
	fn_link  Awards.headL
	fn_link  Awards.diffL
	fn_link  Awards.findawards
	fn_combi_t58 6, 0,1,4,2,5,3
# --- block 30 ---
L576:	fn_link  L556
	fn_link  Awards.headL
	fn_link  L592
	fn_combi_t44 5, 0,1,4,2,3,4
L592:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
L596:	fn_link  L612
	fn_link  L576
	fn_link  NanoPrelude.null
	fn_combi_t30 5, 0,4,1,3,4,2
L612:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 32 ---
NanoPrelude.null:	fn_link  L632
	fn_link  L628
	fn_combi_t2 3, 2,0,1,0,0,0
L628:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 33 ---
L632:	fn_link  L640
	fn_combi_t0 3, 0,0,0,0,0,0
L640:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 34 ---
Awards.headL:	fn_link  L656
	fn_link  L660
	fn_combi_t2 3, 2,0,1,0,0,0
L656:	fn_combi_t0 2, 0,0,0,0,0,0
L660:	fn_elink _error0
# --- block 35 ---
Awards.diffL:	fn_link  L672
	fn_elink NanoPrelude.foldl
# --- block 36 ---
L672:	fn_link  Awards.deleteL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 37 ---
Awards.deleteL:	fn_link  L732
	fn_link  L692
	fn_combi_t3 3, 0,1,2,0,0,0
L692:	fn_y
# --- block 38 ---
L696:	fn_link  L704
	fn_combi_t6 4, 0,2,1,3,0,0
L704:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 39 ---
L708:	fn_link  L716
	fn_combi_t29 5, 1,3,0,2,4,4
L716:	fn_elink _prim_eq
# --- block 40 ---
L720:	fn_link  L696
	fn_link  L708
	fn_combi_t30 5, 0,2,1,3,4,4
# --- block 41 ---
L732:	fn_link  L720
	fn_link  L744
	fn_combi_t16 5, 4,0,1,2,3,0
L744:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
Awards.awards:	fn_link  L888
	fn_link  L972
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 43 ---
L760:	fn_link  NanoPrelude.sum
	fn_combi_t5 3, 2,0,1,1,0,0
# --- block 44 ---
L768:	fn_link  L780
	fn_link  L760
	fn_combi_t3 3, 0,1,2,0,0,0
L780:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 45 ---
L784:	fn_link  L804
	fn_link  Awards.perms
	fn_link  L768
	fn_link  NanoPrelude.map
	fn_combi_t16 5, 0,1,2,3,4,0
L804:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 46 ---
L812:	fn_link  L828
	fn_link  L832
	fn_link  L836
	fn_combi_t10 6, 3,4,0,1,2,0
L828:	fn_combi_t0 2, 1,0,0,0,0,0
L832:	fn_combi_t0 2, 0,0,0,0,0,0
L836:	fn_elink _prim_ge
# --- block 47 ---
L840:	fn_link  L812
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 48 ---
L848:	fn_link  L784
	fn_link  L840
	fn_link  NanoPrelude.filter
	fn_link  Awards.sort
	fn_combi_t57 6, 0,1,2,5,3,4
# --- block 49 ---
L868:	fn_link  L848
	fn_link  L884
	fn_link  NanoPrelude.map
	fn_combi_t44 6, 0,1,4,2,3,5
L884:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 50 ---
L888:	fn_link  L868
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 51 ---
L896:	fn_link  L908
	fn_link  Awards.bronze
	fn_combi_t2 3, 2,0,1,0,0,0
L908:	fn_box
	.word 0x00000032	# raw word 50
	fn_box_body
# --- block 52 ---
L916:	fn_link  L928
	fn_link  Awards.silver
	fn_combi_t2 3, 2,0,1,0,0,0
L928:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
# --- block 53 ---
L936:	fn_link  L896
	fn_link  L916
	fn_link  Awards.append
	fn_combi_t15 4, 0,3,1,3,2,0
# --- block 54 ---
L952:	fn_link  L964
	fn_link  Awards.gold
	fn_combi_t2 3, 2,0,1,0,0,0
L964:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 55 ---
L972:	fn_link  L936
	fn_link  L952
	fn_link  Awards.append
	fn_combi_t15 4, 0,3,1,2,3,0
# --- block 56 ---
Awards.append:	fn_link  L996
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 57 ---
L996:	fn_link  Awards.append
	fn_link  L1008
	fn_combi_t16 5, 0,3,1,4,2,0
L1008:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 58 ---
Awards.gold:	fn_link  L1076
	fn_link  L1024
	fn_combi_t2 4, 3,0,1,0,0,0
L1024:	fn_box
	.word 0x00000047	# raw word 71
	fn_box_body
# --- block 59 ---
L1032:	fn_link  L1044
	fn_link  L1048
	fn_combi_t2 4, 3,0,1,0,0,0
L1044:	fn_combi_t0 2, 0,0,0,0,0,0
L1048:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 60 ---
L1056:	fn_link  L1032
	fn_link  L1068
	fn_combi_t2 4, 3,0,1,0,0,0
L1068:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 61 ---
L1076:	fn_link  L1056
	fn_link  L1088
	fn_combi_t2 4, 3,0,1,0,0,0
L1088:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 62 ---
Awards.silver:	fn_link  L1200
	fn_link  L1108
	fn_combi_t2 4, 3,0,1,0,0,0
L1108:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 63 ---
L1116:	fn_link  L1128
	fn_link  L1132
	fn_combi_t2 4, 3,0,1,0,0,0
L1128:	fn_combi_t0 2, 0,0,0,0,0,0
L1132:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 64 ---
L1140:	fn_link  L1116
	fn_link  L1152
	fn_combi_t2 4, 3,0,1,0,0,0
L1152:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 65 ---
L1160:	fn_link  L1140
	fn_link  L1172
	fn_combi_t2 4, 3,0,1,0,0,0
L1172:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 66 ---
L1180:	fn_link  L1160
	fn_link  L1192
	fn_combi_t2 4, 3,0,1,0,0,0
L1192:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 67 ---
L1200:	fn_link  L1180
	fn_link  L1212
	fn_combi_t2 4, 3,0,1,0,0,0
L1212:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 68 ---
Awards.bronze:	fn_link  L1324
	fn_link  L1232
	fn_combi_t2 4, 3,0,1,0,0,0
L1232:	fn_box
	.word 0x00000042	# raw word 66
	fn_box_body
# --- block 69 ---
L1240:	fn_link  L1252
	fn_link  L1256
	fn_combi_t2 4, 3,0,1,0,0,0
L1252:	fn_combi_t0 2, 0,0,0,0,0,0
L1256:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 70 ---
L1264:	fn_link  L1240
	fn_link  L1276
	fn_combi_t2 4, 3,0,1,0,0,0
L1276:	fn_box
	.word 0x0000007a	# raw word 122
	fn_box_body
# --- block 71 ---
L1284:	fn_link  L1264
	fn_link  L1296
	fn_combi_t2 4, 3,0,1,0,0,0
L1296:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 72 ---
L1304:	fn_link  L1284
	fn_link  L1316
	fn_combi_t2 4, 3,0,1,0,0,0
L1316:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 73 ---
L1324:	fn_link  L1304
	fn_link  L1336
	fn_combi_t2 4, 3,0,1,0,0,0
L1336:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 74 ---
Awards.sort:	fn_link  L1360
	fn_link  Awards.leP
	fn_link  Awards.qsort
	fn_combi_t4 4, 0,1,3,2,0,0
L1360:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 75 ---
Awards.qsort:	fn_link  L1392
	fn_link  L1412
	fn_combi_t47 5, 3,4,0,1,2,4
# --- block 76 ---
L1376:	fn_link  L1388
	fn_link  Awards.qpart
	fn_combi_t23 5, 0,2,3,4,1,1
L1388:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
L1392:	fn_link  L1376
	fn_combi_t9 7, 0,1,3,4,2,0
# --- block 78 ---
L1400:	fn_link  L1408
	fn_combi_t40 5, 4,0,3,1,2,4
L1408:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 79 ---
L1412:	fn_link  L1400
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 80 ---
Awards.qpart:	fn_link  L1532
	fn_link  L1624
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 81 ---
L1432:	fn_link  L1440
	fn_combi_t42 6, 1,5,2,0,4,3
L1440:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 82 ---
L1444:	fn_link  L1452
	fn_combi_t30 6, 1,5,0,4,2,3
L1452:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 83 ---
L1456:	fn_link  L1468
	fn_link  L1472
	fn_combi_t7 4, 0,1,2,3,0,0
L1468:	fn_combi_t42 6, 0,1,4,2,5,3
L1472:	fn_combi_t26 5, 0,1,2,4,3,4
# --- block 84 ---
L1476:	fn_link  L1484
	fn_combi_t52 6, 0,1,2,3,4,5
L1484:	fn_combi_t42 5, 0,1,4,2,4,3
# --- block 85 ---
L1488:	fn_link  L1444
	fn_link  L1456
	fn_link  L1476
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 86 ---
L1504:	fn_link  L1512
	fn_combi_t40 5, 0,1,2,4,3,4
L1512:	fn_combi_t28 4, 0,2,3,1,3,2
# --- block 87 ---
L1516:	fn_link  L1504
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 88 ---
L1524:	fn_link  L1516
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 89 ---
L1532:	fn_link  L1432
	fn_link  L1488
	fn_link  L1524
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 90 ---
L1548:	fn_link  Awards.rqsort
	fn_link  L1560
	fn_combi_t46 6, 0,3,1,2,4,5
L1560:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 91 ---
L1564:	fn_link  Awards.rqsort
	fn_combi_t56 6, 2,0,1,3,4,5
# --- block 92 ---
L1572:	fn_link  L1580
	fn_combi_t40 6, 0,1,4,5,2,3
L1580:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 93 ---
L1584:	fn_link  L1548
	fn_link  L1564
	fn_link  L1572
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 94 ---
L1600:	fn_link  L1608
	fn_combi_t40 6, 0,1,2,5,3,4
L1608:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 95 ---
L1612:	fn_link  L1584
	fn_link  L1600
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 96 ---
L1624:	fn_link  L1612
	fn_link  L1636
	fn_combi_t56 5, 0,1,2,4,3,4
L1636:	fn_y
# --- block 97 ---
Awards.rqsort:	fn_link  L1668
	fn_link  L1688
	fn_combi_t47 5, 3,4,0,1,2,4
# --- block 98 ---
L1652:	fn_link  L1664
	fn_link  Awards.rqpart
	fn_combi_t23 5, 0,2,3,4,1,1
L1664:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 99 ---
L1668:	fn_link  L1652
	fn_combi_t9 7, 0,1,3,4,2,0
# --- block 100 ---
L1676:	fn_link  L1684
	fn_combi_t40 5, 4,0,3,1,2,4
L1684:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 101 ---
L1688:	fn_link  L1676
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 102 ---
Awards.rqpart:	fn_link  L1808
	fn_link  L1900
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 103 ---
L1708:	fn_link  L1716
	fn_combi_t30 6, 1,5,0,4,2,3
L1716:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 104 ---
L1720:	fn_link  L1728
	fn_combi_t42 6, 1,5,2,0,4,3
L1728:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 105 ---
L1732:	fn_link  L1744
	fn_link  L1748
	fn_combi_t7 4, 0,1,2,3,0,0
L1744:	fn_combi_t42 6, 0,4,1,2,5,3
L1748:	fn_combi_t26 5, 0,1,2,4,3,4
# --- block 106 ---
L1752:	fn_link  L1760
	fn_combi_t52 6, 0,1,2,3,4,5
L1760:	fn_combi_t42 5, 0,1,4,2,4,3
# --- block 107 ---
L1764:	fn_link  L1720
	fn_link  L1732
	fn_link  L1752
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 108 ---
L1780:	fn_link  L1788
	fn_combi_t40 5, 0,1,2,4,3,4
L1788:	fn_combi_t28 4, 0,2,3,1,3,2
# --- block 109 ---
L1792:	fn_link  L1780
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 110 ---
L1800:	fn_link  L1792
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 111 ---
L1808:	fn_link  L1708
	fn_link  L1764
	fn_link  L1800
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 112 ---
L1824:	fn_link  Awards.qsort
	fn_link  L1836
	fn_combi_t46 6, 0,3,1,2,4,5
L1836:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 113 ---
L1840:	fn_link  Awards.qsort
	fn_combi_t56 6, 2,0,1,3,4,5
# --- block 114 ---
L1848:	fn_link  L1856
	fn_combi_t40 6, 0,1,4,5,2,3
L1856:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 115 ---
L1860:	fn_link  L1824
	fn_link  L1840
	fn_link  L1848
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 116 ---
L1876:	fn_link  L1884
	fn_combi_t40 6, 0,1,2,5,3,4
L1884:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 117 ---
L1888:	fn_link  L1860
	fn_link  L1876
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 118 ---
L1900:	fn_link  L1888
	fn_link  L1912
	fn_combi_t56 5, 0,1,2,4,3,4
L1912:	fn_y
# --- block 119 ---
Awards.leP:	fn_link  L1996
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 120 ---
L1924:	fn_link  Awards.leL
	fn_link  L1936
	fn_combi_t44 6, 4,2,0,1,3,5
L1936:	fn_elink _prim_gt
# --- block 121 ---
L1940:	fn_link  L1948
	fn_combi_t44 6, 4,1,0,2,5,3
L1948:	fn_elink _prim_lt
# --- block 122 ---
L1952:	fn_link  L1972
	fn_link  L1924
	fn_link  L1940
	fn_link  L1976
	fn_combi_t29 5, 0,1,4,2,4,3
L1972:	fn_combi_t0 2, 0,0,0,0,0,0
L1976:	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 123 ---
L1980:	fn_link  L1992
	fn_link  L1952
	fn_combi_t23 6, 0,2,3,4,5,1
L1992:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 124 ---
L1996:	fn_link  L1980
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 125 ---
Awards.leL:	fn_link  L2092
	fn_link  L2016
	fn_combi_t6 4, 2,0,1,3,0,0
L2016:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 126 ---
L2020:	fn_link  Awards.leL
	fn_link  L2032
	fn_combi_t44 6, 4,2,0,1,3,5
L2032:	fn_elink _prim_gt
# --- block 127 ---
L2036:	fn_link  L2044
	fn_combi_t44 6, 4,1,0,2,5,3
L2044:	fn_elink _prim_lt
# --- block 128 ---
L2048:	fn_link  L2068
	fn_link  L2020
	fn_link  L2036
	fn_link  L2072
	fn_combi_t29 5, 0,1,4,2,4,3
L2068:	fn_combi_t0 2, 0,0,0,0,0,0
L2072:	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 129 ---
L2076:	fn_link  L2088
	fn_link  L2048
	fn_combi_t23 6, 0,2,3,4,5,1
L2088:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 130 ---
L2092:	fn_link  L2076
	fn_link  L2104
	fn_combi_t16 5, 2,0,1,3,4,0
L2104:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 131 ---
NanoPrelude.filter:	fn_link  L2172
	fn_link  L2120
	fn_combi_t3 3, 0,1,2,0,0,0
L2120:	fn_y
# --- block 132 ---
L2124:	fn_link  L2136
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L2136:	fn_elink _error0
# --- block 133 ---
L2140:	fn_link  L2148
	fn_combi_t24 5, 0,1,4,2,3,4
L2148:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 134 ---
L2152:	fn_link  L2168
	fn_link  L2124
	fn_link  L2140
	fn_combi_t26 5, 0,1,3,4,2,4
L2168:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 135 ---
L2172:	fn_link  L2152
	fn_link  L2184
	fn_combi_t16 5, 4,0,1,2,3,0
L2184:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 137 ---
NanoPrelude.sum:	fn_link  L2204
	fn_link  L2212
	fn_elink NanoPrelude.foldr
L2204:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 138 ---
L2212:	fn_link  L2224
	fn_link  L2248
	fn_combi_t8 4, 0,3,2,1,0,0
L2224:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2248:	fn_y
# --- block 139 ---
NanoPrelude.foldr:	fn_link  L2268
	fn_link  L2264
	fn_combi_t7 4, 0,1,2,3,0,0
L2264:	fn_y
# --- block 140 ---
L2268:	fn_link  L2276
	fn_combi_t16 5, 4,2,0,1,3,0
L2276:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 141 ---
Awards.perms:	fn_link  L2460
	fn_link  L2292
	fn_combi_t3 3, 0,1,2,0,0,0
L2292:	fn_y
# --- block 142 ---
L2296:	fn_link  L2304
	fn_combi_t2 4, 3,1,0,0,0,0
L2304:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 143 ---
L2308:	fn_link  L2324
	fn_link  L2348
	fn_link  Awards.perms
	fn_combi_t8 4, 0,1,3,2,0,0
L2324:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2348:	fn_y
# --- block 144 ---
L2352:	fn_link  L2368
	fn_link  NanoPrelude.map
	fn_link  Awards.append
	fn_combi_t57 6, 0,1,2,4,3,5
L2368:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 145 ---
L2372:	fn_link  L2308
	fn_link  L2352
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 146 ---
L2384:	fn_link  L2372
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 147 ---
L2392:	fn_link  L2408
	fn_link  L2412
	fn_link  L2416
	fn_combi_t44 6, 3,0,1,5,2,4
L2408:	fn_elink _error0
L2412:	fn_elink _prim_eq
L2416:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 148 ---
L2424:	fn_link  L2384
	fn_link  L2392
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 149 ---
L2436:	fn_link  L2296
	fn_link  NanoPrelude.map
	fn_link  L2424
	fn_link  L2456
	fn_combi_t10 5, 0,1,4,2,3,0
L2456:	fn_combi_t42 7, 0,3,4,1,2,4
# --- block 150 ---
L2460:	fn_link  L2436
	fn_link  L2472
	fn_combi_t46 5, 4,0,1,2,3,4
L2472:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 151 ---
Awards.competitors:	fn_link  L3360
	fn_link  L3588
	fn_combi_t15 5, 4,0,2,1,2,0
# --- block 152 ---
L2488:	fn_link  L2500
	fn_link  L2504
	fn_combi_t2 4, 3,0,1,0,0,0
L2500:	fn_combi_t0 2, 0,0,0,0,0,0
L2504:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 153 ---
L2512:	fn_link  L2488
	fn_link  L2524
	fn_combi_t2 4, 3,0,1,0,0,0
L2524:	fn_box
	.word 0x00000012	# raw word 18
	fn_box_body
# --- block 154 ---
L2532:	fn_link  L2512
	fn_link  L2544
	fn_combi_t2 4, 3,0,1,0,0,0
L2544:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 155 ---
L2552:	fn_link  L2532
	fn_link  L2564
	fn_combi_t2 4, 3,0,1,0,0,0
L2564:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 156 ---
L2572:	fn_link  L2552
	fn_combi_t2 4, 3,1,0,0,0,0
# --- block 157 ---
L2580:	fn_link  L2572
	fn_link  L2592
	fn_combi_t6 5, 4,0,1,2,0,0
L2592:	fn_box
	.word 0x00000036	# raw word 54
	fn_box_body
# --- block 158 ---
L2600:	fn_link  L2580
	fn_link  L2612
	fn_combi_t6 5, 4,0,1,2,0,0
L2612:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 159 ---
L2620:	fn_link  L2600
	fn_link  L2632
	fn_combi_t6 5, 4,0,1,2,0,0
L2632:	fn_box
	.word 0x00000017	# raw word 23
	fn_box_body
# --- block 160 ---
L2640:	fn_link  L2620
	fn_link  L2652
	fn_combi_t6 5, 4,0,1,2,0,0
L2652:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 161 ---
L2660:	fn_link  L2672
	fn_link  L2676
	fn_combi_t2 4, 3,0,1,0,0,0
L2672:	fn_combi_t0 2, 0,0,0,0,0,0
L2676:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 162 ---
L2684:	fn_link  L2660
	fn_link  L2696
	fn_combi_t2 4, 3,0,1,0,0,0
L2696:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 163 ---
L2704:	fn_link  L2684
	fn_link  L2716
	fn_combi_t2 4, 3,0,1,0,0,0
L2716:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 164 ---
L2724:	fn_link  L2704
	fn_link  L2736
	fn_combi_t2 4, 3,0,1,0,0,0
L2736:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 165 ---
L2744:	fn_link  L2724
	fn_link  L2756
	fn_combi_t2 4, 3,0,1,0,0,0
L2756:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
# --- block 166 ---
L2764:	fn_link  L2640
	fn_link  L2744
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 167 ---
L2776:	fn_link  L2788
	fn_link  L2764
	fn_combi_t5 5, 4,0,2,1,0,0
L2788:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 168 ---
L2792:	fn_link  L2804
	fn_link  L2808
	fn_combi_t2 4, 3,0,1,0,0,0
L2804:	fn_combi_t0 2, 0,0,0,0,0,0
L2808:	fn_box
	.word 0x00000015	# raw word 21
	fn_box_body
# --- block 169 ---
L2816:	fn_link  L2792
	fn_link  L2828
	fn_combi_t2 4, 3,0,1,0,0,0
L2828:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 170 ---
L2836:	fn_link  L2816
	fn_link  L2848
	fn_combi_t2 4, 3,0,1,0,0,0
L2848:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 171 ---
L2856:	fn_link  L2836
	fn_link  L2868
	fn_combi_t2 4, 3,0,1,0,0,0
L2868:	fn_box
	.word 0x00000022	# raw word 34
	fn_box_body
# --- block 172 ---
L2876:	fn_link  L2856
	fn_link  L2888
	fn_combi_t2 4, 3,0,1,0,0,0
L2888:	fn_box
	.word 0x00000013	# raw word 19
	fn_box_body
# --- block 173 ---
L2896:	fn_link  L2876
	fn_link  L2908
	fn_combi_t2 4, 3,0,1,0,0,0
L2908:	fn_box
	.word 0x00000015	# raw word 21
	fn_box_body
# --- block 174 ---
L2916:	fn_link  L2896
	fn_link  L2928
	fn_combi_t2 4, 3,0,1,0,0,0
L2928:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
# --- block 175 ---
L2936:	fn_link  L2916
	fn_combi_t2 4, 3,1,0,0,0,0
# --- block 176 ---
L2944:	fn_link  L2936
	fn_link  L2956
	fn_combi_t6 5, 4,0,1,2,0,0
L2956:	fn_box
	.word 0x00000012	# raw word 18
	fn_box_body
# --- block 177 ---
L2964:	fn_link  L2944
	fn_link  L2976
	fn_combi_t6 5, 4,0,1,2,0,0
L2976:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 178 ---
L2984:	fn_link  L2996
	fn_link  L3000
	fn_combi_t2 4, 3,0,1,0,0,0
L2996:	fn_combi_t0 2, 0,0,0,0,0,0
L3000:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 179 ---
L3008:	fn_link  L2984
	fn_link  L3020
	fn_combi_t2 4, 3,0,1,0,0,0
L3020:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 180 ---
L3028:	fn_link  L3008
	fn_link  L3040
	fn_combi_t2 4, 3,0,1,0,0,0
L3040:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 181 ---
L3048:	fn_link  L3028
	fn_link  L3060
	fn_combi_t2 4, 3,0,1,0,0,0
L3060:	fn_box
	.word 0x00000050	# raw word 80
	fn_box_body
# --- block 182 ---
L3068:	fn_link  L2964
	fn_link  L3048
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 183 ---
L3080:	fn_link  L2776
	fn_link  L3068
	fn_combi_t15 5, 4,0,2,1,2,0
# --- block 184 ---
L3092:	fn_link  L3104
	fn_link  L3108
	fn_combi_t2 4, 3,0,1,0,0,0
L3104:	fn_combi_t0 2, 0,0,0,0,0,0
L3108:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 185 ---
L3116:	fn_link  L3092
	fn_link  L3128
	fn_combi_t2 4, 3,0,1,0,0,0
L3128:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 186 ---
L3136:	fn_link  L3116
	fn_link  L3148
	fn_combi_t2 4, 3,0,1,0,0,0
L3148:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 187 ---
L3156:	fn_link  L3136
	fn_link  L3168
	fn_combi_t2 4, 3,0,1,0,0,0
L3168:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 188 ---
L3176:	fn_link  L3156
	fn_link  L3188
	fn_combi_t2 4, 3,0,1,0,0,0
L3188:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 189 ---
L3196:	fn_link  L3176
	fn_combi_t2 4, 3,1,0,0,0,0
# --- block 190 ---
L3204:	fn_link  L3196
	fn_link  L3216
	fn_combi_t6 5, 4,0,1,2,0,0
L3216:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 191 ---
L3224:	fn_link  L3204
	fn_link  L3236
	fn_combi_t6 5, 4,0,1,2,0,0
L3236:	fn_box
	.word 0x00000013	# raw word 19
	fn_box_body
# --- block 192 ---
L3244:	fn_link  L3224
	fn_link  L3256
	fn_combi_t6 5, 4,0,1,2,0,0
L3256:	fn_box
	.word 0x00000017	# raw word 23
	fn_box_body
# --- block 193 ---
L3264:	fn_link  L3276
	fn_link  L3280
	fn_combi_t2 4, 3,0,1,0,0,0
L3276:	fn_combi_t0 2, 0,0,0,0,0,0
L3280:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 194 ---
L3288:	fn_link  L3264
	fn_link  L3300
	fn_combi_t2 4, 3,0,1,0,0,0
L3300:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 195 ---
L3308:	fn_link  L3288
	fn_link  L3320
	fn_combi_t2 4, 3,0,1,0,0,0
L3320:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 196 ---
L3328:	fn_link  L3308
	fn_link  L3340
	fn_combi_t2 4, 3,0,1,0,0,0
L3340:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 197 ---
L3348:	fn_link  L3244
	fn_link  L3328
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 198 ---
L3360:	fn_link  L3080
	fn_link  L3348
	fn_combi_t15 5, 4,0,2,1,2,0
# --- block 199 ---
L3372:	fn_link  L3384
	fn_link  L3388
	fn_combi_t2 4, 3,0,1,0,0,0
L3384:	fn_combi_t0 2, 0,0,0,0,0,0
L3388:	fn_box
	.word 0x00000015	# raw word 21
	fn_box_body
# --- block 200 ---
L3396:	fn_link  L3372
	fn_link  L3408
	fn_combi_t2 4, 3,0,1,0,0,0
L3408:	fn_box
	.word 0x00000022	# raw word 34
	fn_box_body
# --- block 201 ---
L3416:	fn_link  L3396
	fn_combi_t2 4, 3,1,0,0,0,0
# --- block 202 ---
L3424:	fn_link  L3416
	fn_link  L3436
	fn_combi_t6 5, 4,0,1,2,0,0
L3436:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 203 ---
L3444:	fn_link  L3424
	fn_link  L3456
	fn_combi_t6 5, 4,0,1,2,0,0
L3456:	fn_box
	.word 0x0000001b	# raw word 27
	fn_box_body
# --- block 204 ---
L3464:	fn_link  L3444
	fn_link  L3476
	fn_combi_t6 5, 4,0,1,2,0,0
L3476:	fn_box
	.word 0x00000023	# raw word 35
	fn_box_body
# --- block 205 ---
L3484:	fn_link  L3496
	fn_link  L3500
	fn_combi_t2 4, 3,0,1,0,0,0
L3496:	fn_combi_t0 2, 0,0,0,0,0,0
L3500:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 206 ---
L3508:	fn_link  L3484
	fn_link  L3520
	fn_combi_t2 4, 3,0,1,0,0,0
L3520:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 207 ---
L3528:	fn_link  L3508
	fn_link  L3540
	fn_combi_t2 4, 3,0,1,0,0,0
L3540:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 208 ---
L3548:	fn_link  L3528
	fn_link  L3560
	fn_combi_t2 4, 3,0,1,0,0,0
L3560:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 209 ---
L3568:	fn_link  L3548
	fn_link  L3580
	fn_combi_t2 4, 3,0,1,0,0,0
L3580:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 210 ---
L3588:	fn_link  L3464
	fn_link  L3568
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 211 ---
NanoPrelude.rem:	fn_link  L3612
	fn_link  L3636
	fn_combi_t8 4, 0,3,2,1,0,0
L3612:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3636:	fn_y

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
