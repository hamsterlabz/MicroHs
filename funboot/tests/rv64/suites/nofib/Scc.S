# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Scc  (entry @0)
	.text
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.any
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.snd
	.globl	Primitives.primPerformIO
	.globl	Scc.append
	.globl	Scc.bench
	.globl	Scc.commaSep
	.globl	Scc.dfs
	.globl	Scc.edges
	.globl	Scc.elemL
	.globl	Scc.hashS
	.globl	Scc.showIntList
	.globl	Scc.showListList
	.globl	Scc.showN
	.globl	Scc.stronglyConnComp
	.globl	Scc.vertices
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Scc.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Scc.bench:	fn_link  L80
	fn_elink Scc.hashS
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L52
L44:	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
L52:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
L60:	fn_link  Scc.vertices
	fn_link  Scc.edges
	fn_elink Scc.stronglyConnComp
# --- block 5 ---
L72:	fn_link  L60
	fn_elink Scc.showListList
# --- block 6 ---
L80:	fn_link  L36
	fn_link  L72
	fn_elink Scc.append
# --- block 7 ---
Scc.hashS:	fn_link  L104
	fn_link  L192
	fn_elink NanoPrelude.foldl
L104:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L112:	fn_link  L132
	fn_link  L156
	fn_link  L180
	fn_link  L188
	fn_combi_t41 6, 0,1,4,2,5,3
L132:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L156:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L180:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L188:	fn_y
# --- block 9 ---
L192:	fn_link  L112
	fn_link  L204
	fn_combi_t7 4, 0,1,2,3,0,0
L204:	fn_y
# --- block 10 ---
NanoPrelude.foldl:	fn_link  L224
	fn_link  L220
	fn_combi_t3 3, 0,1,2,0,0,0
L220:	fn_y
# --- block 11 ---
L224:	fn_link  L232
	fn_combi_t46 5, 4,3,0,1,2,3
L232:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 12 ---
Scc.append:	fn_link  L244
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 13 ---
L244:	fn_link  Scc.append
	fn_link  L256
	fn_combi_t16 5, 0,3,1,4,2,0
L256:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 14 ---
Scc.showListList:	fn_link  L312
	fn_link  L276
	fn_link  L284
	fn_combi_t6 4, 0,1,2,3,0,0
L276:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L284:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
L288:	fn_link  L300
	fn_link  L304
	fn_combi_t2 4, 3,0,1,0,0,0
L300:	fn_combi_t0 2, 0,0,0,0,0,0
L304:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 16 ---
L312:	fn_link  L288
	fn_link  Scc.showIntList
	fn_link  NanoPrelude.map
	fn_link  Scc.commaSep
	fn_link  Scc.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 17 ---
Scc.commaSep:	fn_link  L392
	fn_link  L348
	fn_combi_t2 3, 2,0,1,0,0,0
L348:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 18 ---
L352:	fn_link  Scc.commaSep
	fn_link  L372
	fn_link  L380
	fn_link  Scc.append
	fn_combi_t48 7, 0,4,1,2,3,5
L372:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L380:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L384:	fn_link  L352
	fn_combi_t2 4, 0,1,2,0,0,0
# --- block 20 ---
L392:	fn_link  L384
	fn_combi_t16 3, 2,1,0,1,2,0
# --- block 21 ---
NanoPrelude.map:	fn_link  L428
	fn_link  L412
	fn_combi_t3 3, 0,1,2,0,0,0
L412:	fn_y
# --- block 22 ---
L416:	fn_link  L424
	fn_combi_t15 5, 0,1,3,2,4,0
L424:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L428:	fn_link  L416
	fn_link  L440
	fn_combi_t16 5, 4,0,1,2,3,0
L440:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
Scc.showIntList:	fn_link  L496
	fn_link  L460
	fn_link  L468
	fn_combi_t6 4, 0,1,2,3,0,0
L460:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L468:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 25 ---
L472:	fn_link  L484
	fn_link  L488
	fn_combi_t2 4, 3,0,1,0,0,0
L484:	fn_combi_t0 2, 0,0,0,0,0,0
L488:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 26 ---
L496:	fn_link  L472
	fn_link  Scc.showN
	fn_link  NanoPrelude.map
	fn_link  Scc.commaSep
	fn_link  Scc.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 27 ---
Scc.showN:	fn_link  L532
	fn_link  L692
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 28 ---
L532:	fn_link  L548
	fn_link  L552
	fn_link  L576
	fn_combi_t13 6, 5,0,3,1,2,0
L548:	fn_combi_t0 2, 0,0,0,0,0,0
L552:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L576:	fn_y
# --- block 29 ---
L580:	fn_link  L600
	fn_link  L624
	fn_link  NanoPrelude.rem
	fn_link  L632
	fn_combi_t18 5, 0,1,4,2,3,0
L600:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L624:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L632:	fn_y
# --- block 30 ---
L636:	fn_link  L648
	fn_link  L580
	fn_combi_t5 5, 4,0,2,1,0,0
L648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
L652:	fn_link  L672
	fn_link  NanoPrelude.quot
	fn_link  Scc.showN
	fn_link  Scc.append
	fn_combi_t21 5, 0,1,2,4,3,0
L672:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 32 ---
L680:	fn_link  L636
	fn_link  L652
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 33 ---
L692:	fn_link  L680
	fn_link  L708
	fn_link  L712
	fn_combi_t15 4, 0,3,1,2,3,0
L708:	fn_elink _prim_lt
L712:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 34 ---
NanoPrelude.quot:	fn_link  L732
	fn_link  L756
	fn_combi_t8 4, 0,3,2,1,0,0
L732:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L756:	fn_y
# --- block 35 ---
NanoPrelude.rem:	fn_link  L772
	fn_link  L796
	fn_combi_t8 4, 0,3,2,1,0,0
L772:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L796:	fn_y
# --- block 36 ---
Scc.stronglyConnComp:	fn_link  L908
	fn_link  L820
	fn_link  L936
	fn_link  L1252
	fn_combi_t25 5, 0,4,1,4,2,3
L820:	fn_y
# --- block 37 ---
L824:	fn_link  L832
	fn_combi_t44 5, 2,4,0,1,3,2
L832:	fn_elink _prim_eq
# --- block 38 ---
L836:	fn_link  L848
	fn_link  L824
	fn_combi_t6 4, 0,2,1,3,0,0
L848:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 39 ---
L852:	fn_link  L860
	fn_combi_t24 6, 0,1,5,2,3,4
L860:	fn_combi_t58 6, 0,1,5,2,3,4
# --- block 40 ---
L864:	fn_link  L852
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 41 ---
L872:	fn_link  L888
	fn_link  L836
	fn_link  L864
	fn_combi_t26 5, 0,1,3,4,2,3
L888:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L892:	fn_link  L872
	fn_combi_t23 5, 0,1,2,3,4,2
# --- block 43 ---
L900:	fn_link  L892
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 44 ---
L908:	fn_link  L900
	fn_link  L920
	fn_combi_t16 5, 3,0,1,2,4,0
L920:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L924:	fn_link  L932
	fn_combi_t2 2, 1,0,0,0,0,0
L932:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
L936:	fn_link  L924
	fn_link  Scc.dfs
	fn_link  NanoPrelude.snd
	fn_combi_t52 6, 0,1,5,3,2,4
# --- block 47 ---
L952:	fn_link  L960
	fn_combi_t2 2, 1,0,0,0,0,0
L960:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 48 ---
L964:	fn_link  L972
	fn_combi_t1 2, 1,0,0,0,0,0
L972:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 49 ---
L976:	fn_link  L988
	fn_link  L992
	fn_combi_t12 5, 4,0,3,2,1,0
L988:	fn_combi_t0 2, 0,0,0,0,0,0
L992:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 50 ---
L996:	fn_link  Scc.dfs
	fn_combi_t39 4, 0,1,2,3,1,3
# --- block 51 ---
L1004:	fn_link  L1016
	fn_link  L996
	fn_combi_t3 3, 0,1,2,0,0,0
L1016:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 52 ---
L1020:	fn_link  L1032
	fn_link  L1036
	fn_combi_t34 5, 0,0,3,4,1,2
L1032:	fn_combi_t0 2, 1,0,0,0,0,0
L1036:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L1040:	fn_link  L1048
	fn_combi_t44 5, 4,3,0,1,2,3
L1048:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1052:	fn_link  L1020
	fn_link  L1040
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 55 ---
L1064:	fn_link  L1052
	fn_combi_t32 6, 1,0,2,3,5,4
# --- block 56 ---
L1072:	fn_link  Scc.elemL
	fn_combi_t28 6, 0,2,1,3,5,4
# --- block 57 ---
L1080:	fn_link  L1088
	fn_combi_t29 5, 0,1,4,2,4,3
L1088:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 58 ---
L1092:	fn_link  L1072
	fn_link  L1080
	fn_combi_t29 6, 0,1,4,2,5,3
# --- block 59 ---
L1104:	fn_link  L1064
	fn_link  L1092
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 60 ---
L1116:	fn_link  L1124
	fn_combi_t29 5, 0,1,4,2,4,3
L1124:	fn_combi_t37 5, 0,3,1,4,2,3
# --- block 61 ---
L1128:	fn_link  L1144
	fn_link  L1104
	fn_link  L1116
	fn_combi_t40 5, 0,1,3,4,2,4
L1144:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 62 ---
L1148:	fn_link  L1128
	fn_combi_t43 5, 0,3,4,1,2,4
# --- block 63 ---
L1156:	fn_link  L976
	fn_link  L1004
	fn_link  L1148
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 64 ---
L1172:	fn_link  L1180
	fn_combi_t40 5, 1,0,2,4,3,4
L1180:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 65 ---
L1184:	fn_link  L1172
	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 66 ---
L1192:	fn_link  L1156
	fn_link  L1184
	fn_combi_t52 6, 4,0,1,2,3,5
# --- block 67 ---
L1204:	fn_link  L964
	fn_link  NanoPrelude.map
	fn_link  L1192
	fn_link  L1224
	fn_combi_t63 6, 0,1,5,2,3,4
L1224:	fn_y
# --- block 68 ---
L1228:	fn_link  NanoPrelude.snd
	fn_combi_t56 5, 0,1,4,2,3,4
# --- block 69 ---
L1236:	fn_link  L952
	fn_link  L1204
	fn_link  L1228
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 70 ---
L1252:	fn_link  L1236
	fn_combi_t39 6, 0,1,2,5,3,4
# --- block 71 ---
NanoPrelude.snd:	fn_link  L1268
	fn_combi_t1 2, 1,0,0,0,0,0
L1268:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 72 ---
Scc.elemL:	fn_link  L1284
	fn_link  NanoPrelude.any
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 73 ---
L1284:	fn_link  L1300
	fn_link  L1304
	fn_link  L1308
	fn_combi_t10 5, 4,3,0,1,2,0
L1300:	fn_combi_t0 2, 1,0,0,0,0,0
L1304:	fn_combi_t0 2, 0,0,0,0,0,0
L1308:	fn_elink _prim_eq
# --- block 74 ---
NanoPrelude.any:	fn_link  L1336
	fn_link  L1324
	fn_combi_t3 3, 0,1,2,0,0,0
L1324:	fn_y
# --- block 75 ---
L1328:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 76 ---
L1336:	fn_link  L1328
	fn_link  L1348
	fn_combi_t16 5, 4,0,1,2,3,0
L1348:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
NanoPrelude.$7c$7c:	fn_link  L1360
	fn_combi_t2 3, 1,2,0,0,0,0
L1360:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 78 ---
Scc.dfs:	fn_link  L1612
	fn_link  L1376
	fn_combi_t3 3, 0,1,2,0,0,0
L1376:	fn_y
# --- block 79 ---
L1380:	fn_link  L1392
	fn_link  L1396
	fn_combi_t12 5, 4,0,3,2,1,0
L1392:	fn_combi_t0 2, 0,0,0,0,0,0
L1396:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 80 ---
L1400:	fn_link  L1416
	fn_link  L1420
	fn_link  Scc.append
	fn_combi_t34 6, 0,1,4,5,2,3
L1416:	fn_combi_t0 2, 1,0,0,0,0,0
L1420:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 81 ---
L1424:	fn_link  L1432
	fn_combi_t44 5, 4,3,0,1,2,3
L1432:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 82 ---
L1436:	fn_link  L1400
	fn_link  L1424
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 83 ---
L1448:	fn_link  L1436
	fn_combi_t32 6, 1,0,2,3,5,4
# --- block 84 ---
L1456:	fn_link  Scc.elemL
	fn_combi_t28 6, 0,2,1,3,5,4
# --- block 85 ---
L1464:	fn_link  L1472
	fn_combi_t29 5, 0,1,4,2,4,3
L1472:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 86 ---
L1476:	fn_link  L1456
	fn_link  L1464
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 87 ---
L1488:	fn_link  L1448
	fn_link  L1476
	fn_link  L1504
	fn_combi_t29 5, 0,1,4,2,3,3
L1504:	fn_combi_t24 6, 0,1,3,2,5,4
# --- block 88 ---
L1508:	fn_link  L1524
	fn_link  L1488
	fn_link  L1528
	fn_combi_t5 4, 0,1,3,2,0,0
L1524:	fn_combi_t2 3, 2,0,1,0,0,0
L1528:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 89 ---
L1532:	fn_link  L1540
	fn_combi_t38 5, 0,1,4,2,3,4
L1540:	fn_combi_t48 6, 0,5,1,2,3,4
# --- block 90 ---
L1544:	fn_link  L1532
	fn_combi_t26 6, 0,1,3,5,2,4
# --- block 91 ---
L1552:	fn_link  L1508
	fn_link  L1544
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 92 ---
L1564:	fn_link  L1380
	fn_link  L1552
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 93 ---
L1576:	fn_link  L1564
	fn_link  L1588
	fn_combi_t5 4, 0,1,3,2,0,0
L1588:	fn_combi_t23 5, 0,2,3,4,1,4
# --- block 94 ---
L1592:	fn_link  L1600
	fn_combi_t40 5, 1,0,2,4,3,4
L1600:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 95 ---
L1604:	fn_link  L1592
	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 96 ---
L1612:	fn_link  L1576
	fn_link  L1604
	fn_combi_t52 6, 4,0,1,2,3,5
# --- block 97 ---
Scc.edges:	fn_link  L1988
	fn_link  L2000
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 98 ---
L1636:	fn_link  L1648
	fn_link  L1656
	fn_combi_t2 3, 2,0,1,0,0,0
L1648:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L1656:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 99 ---
L1664:	fn_link  L1676
	fn_link  L1636
	fn_combi_t2 4, 3,0,1,0,0,0
L1676:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 100 ---
L1680:	fn_link  L1692
	fn_link  L1700
	fn_combi_t2 3, 2,0,1,0,0,0
L1692:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L1700:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 101 ---
L1708:	fn_link  L1664
	fn_link  L1680
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 102 ---
L1720:	fn_link  L1732
	fn_link  L1740
	fn_combi_t2 3, 2,0,1,0,0,0
L1732:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L1740:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 103 ---
L1748:	fn_link  L1708
	fn_link  L1720
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 104 ---
L1760:	fn_link  L1772
	fn_link  L1780
	fn_combi_t2 3, 2,0,1,0,0,0
L1772:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L1780:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 105 ---
L1788:	fn_link  L1748
	fn_link  L1760
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 106 ---
L1800:	fn_link  L1812
	fn_link  L1820
	fn_combi_t2 3, 2,0,1,0,0,0
L1812:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1820:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 107 ---
L1828:	fn_link  L1788
	fn_link  L1800
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 108 ---
L1840:	fn_link  L1852
	fn_link  L1860
	fn_combi_t2 3, 2,0,1,0,0,0
L1852:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1860:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 109 ---
L1868:	fn_link  L1828
	fn_link  L1840
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 110 ---
L1880:	fn_link  L1892
	fn_link  L1900
	fn_combi_t2 3, 2,0,1,0,0,0
L1892:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L1900:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 111 ---
L1908:	fn_link  L1868
	fn_link  L1880
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 112 ---
L1920:	fn_link  L1932
	fn_link  L1940
	fn_combi_t2 3, 2,0,1,0,0,0
L1932:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L1940:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 113 ---
L1948:	fn_link  L1908
	fn_link  L1920
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 114 ---
L1960:	fn_link  L1972
	fn_link  L1980
	fn_combi_t2 3, 2,0,1,0,0,0
L1972:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1980:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 115 ---
L1988:	fn_link  L1948
	fn_link  L1960
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 116 ---
L2000:	fn_link  L2012
	fn_link  L2020
	fn_combi_t2 3, 2,0,1,0,0,0
L2012:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L2020:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 117 ---
Scc.vertices:	fn_link  L2152
	fn_link  L2040
	fn_combi_t2 4, 3,0,1,0,0,0
L2040:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 118 ---
L2048:	fn_link  L2060
	fn_link  L2064
	fn_combi_t2 4, 3,0,1,0,0,0
L2060:	fn_combi_t0 2, 0,0,0,0,0,0
L2064:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 119 ---
L2072:	fn_link  L2048
	fn_link  L2084
	fn_combi_t2 4, 3,0,1,0,0,0
L2084:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 120 ---
L2092:	fn_link  L2072
	fn_link  L2104
	fn_combi_t2 4, 3,0,1,0,0,0
L2104:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 121 ---
L2112:	fn_link  L2092
	fn_link  L2124
	fn_combi_t2 4, 3,0,1,0,0,0
L2124:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 122 ---
L2132:	fn_link  L2112
	fn_link  L2144
	fn_combi_t2 4, 3,0,1,0,0,0
L2144:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 123 ---
L2152:	fn_link  L2132
	fn_link  L2164
	fn_combi_t2 4, 3,0,1,0,0,0
L2164:	fn_box
	.word 0x00000002	# raw word 2
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
