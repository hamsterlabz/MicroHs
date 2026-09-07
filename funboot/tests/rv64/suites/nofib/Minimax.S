# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Minimax  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Minimax.alternate
	.globl	Minimax.append
	.globl	Minimax.bench
	.globl	Minimax.best
	.globl	Minimax.bestMove
	.globl	Minimax.cropTree
	.globl	Minimax.empty
	.globl	Minimax.empty$27
	.globl	Minimax.eqEval
	.globl	Minimax.eqPiece
	.globl	Minimax.eval
	.globl	Minimax.fullBoard
	.globl	Minimax.hashS
	.globl	Minimax.insert
	.globl	Minimax.interpret
	.globl	Minimax.map2
	.globl	Minimax.mapTree
	.globl	Minimax.max$27
	.globl	Minimax.min$27
	.globl	Minimax.mise
	.globl	Minimax.newPositions
	.globl	Minimax.opposite
	.globl	Minimax.placePiece
	.globl	Minimax.prog
	.globl	Minimax.prune
	.globl	Minimax.repTree
	.globl	Minimax.score
	.globl	Minimax.scorePiece
	.globl	Minimax.searchTree
	.globl	Minimax.showBoard
	.globl	Minimax.showEval
	.globl	Minimax.showI
	.globl	Minimax.showMove
	.globl	Minimax.showPiece
	.globl	Minimax.showRow
	.globl	Minimax.static
	.globl	Minimax.testBoard
	.globl	Minimax.win1
	.globl	Minimax.win2
	.globl	Minimax.win3
	.globl	Minimax.win4
	.globl	Minimax.win5
	.globl	Minimax.win6
	.globl	Minimax.win7
	.globl	Minimax.win8
	.globl	Minimax.wins
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.all
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Minimax.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Minimax.bench:	fn_link  Minimax.prog
L32:	fn_elink Minimax.hashS
# --- block 3 ---
Minimax.hashS:	fn_link  L48
L40:	fn_link  L136
L44:	fn_elink NanoPrelude.foldl
L48:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
	fn_link  L124
	fn_link  L132
	fn_combi_t41 6, 0,1,4,2,5,3
L76:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
L88:	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_tor a0
L104:	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L124:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L132:	fn_y
# --- block 5 ---
L136:	fn_link  L56
	fn_link  L148
	fn_combi_t7 4, 0,1,2,3,0,0
L148:	fn_y
# --- block 6 ---
NanoPrelude.foldl:	fn_link  L168
	fn_link  L164
	fn_combi_t3 3, 0,1,2,0,0,0
L164:	fn_y
# --- block 7 ---
L168:	fn_link  L176
	fn_combi_t46 5, 4,3,0,1,2,3
L176:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 8 ---
Minimax.prog:	fn_link  L228
	fn_link  L300
	fn_elink Minimax.append
# --- block 9 ---
L192:	fn_link  Minimax.testBoard
	fn_link  Minimax.min$27
	fn_link  Minimax.max$27
	fn_link  L212
	fn_elink Minimax.alternate
L212:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 10 ---
L216:	fn_link  L192
	fn_link  Minimax.showMove
	fn_elink NanoPrelude.map
# --- block 11 ---
L228:	fn_link  L216
	fn_elink NanoPrelude.concat
# --- block 12 ---
L236:	fn_link  L248
	fn_link  L252
	fn_combi_t2 4, 3,0,1,0,0,0
L248:	fn_combi_t0 2, 0,0,0,0,0,0
L252:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 13 ---
L260:	fn_link  L236
	fn_link  L272
	fn_combi_t2 4, 3,0,1,0,0,0
L272:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 14 ---
L280:	fn_link  L260
	fn_link  L292
	fn_combi_t2 4, 3,0,1,0,0,0
L292:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 15 ---
L300:	fn_link  L280
	fn_link  L312
	fn_combi_t2 4, 3,0,1,0,0,0
L312:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 16 ---
Minimax.append:	fn_link  L328
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 17 ---
L328:	fn_link  Minimax.append
	fn_link  L340
	fn_combi_t16 5, 0,3,1,4,2,0
L340:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 18 ---
NanoPrelude.concat:	fn_link  L356
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L356:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 19 ---
NanoPrelude.foldr:	fn_link  L376
	fn_link  L372
	fn_combi_t7 4, 0,1,2,3,0,0
L372:	fn_y
# --- block 20 ---
L376:	fn_link  L384
	fn_combi_t16 5, 4,2,0,1,3,0
L384:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 21 ---
Data.List_Type.$2b$2b:	fn_link  L416
	fn_link  L400
	fn_combi_t5 4, 0,1,3,2,0,0
L400:	fn_y
# --- block 22 ---
L404:	fn_link  L412
	fn_combi_t6 4, 0,2,1,3,0,0
L412:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L416:	fn_link  L404
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 24 ---
NanoPrelude.map:	fn_link  L452
	fn_link  L436
	fn_combi_t3 3, 0,1,2,0,0,0
L436:	fn_y
# --- block 25 ---
L440:	fn_link  L448
	fn_combi_t15 5, 0,1,3,2,4,0
L448:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
L452:	fn_link  L440
	fn_link  L464
	fn_combi_t16 5, 4,0,1,2,3,0
L464:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
Minimax.showMove:	fn_link  L504
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 28 ---
L476:	fn_link  Minimax.showBoard
	fn_link  L492
	fn_link  L500
	fn_combi_t6 4, 0,1,2,3,0,0
L492:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L500:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 29 ---
L504:	fn_link  L476
	fn_link  Minimax.showEval
	fn_link  Minimax.append
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 30 ---
Minimax.showEval:	fn_link  L892
	fn_link  L968
	fn_link  L1052
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 31 ---
L536:	fn_link  L548
	fn_link  L552
	fn_combi_t2 4, 3,0,1,0,0,0
L548:	fn_combi_t0 2, 0,0,0,0,0,0
L552:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 32 ---
L560:	fn_link  L572
	fn_link  L576
	fn_combi_t2 4, 3,0,1,0,0,0
L572:	fn_combi_t0 2, 0,0,0,0,0,0
L576:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 33 ---
L584:	fn_link  L560
	fn_link  L596
	fn_combi_t2 4, 3,0,1,0,0,0
L596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 34 ---
L604:	fn_link  L584
	fn_link  L616
	fn_combi_t2 4, 3,0,1,0,0,0
L616:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 35 ---
L624:	fn_link  L604
	fn_link  L636
	fn_combi_t2 4, 3,0,1,0,0,0
L636:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 36 ---
L644:	fn_link  L624
	fn_link  L656
	fn_combi_t2 4, 3,0,1,0,0,0
L656:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 37 ---
L664:	fn_link  L644
	fn_link  L676
	fn_combi_t2 4, 3,0,1,0,0,0
L676:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 38 ---
L684:	fn_link  L664
	fn_link  L696
	fn_combi_t2 4, 3,0,1,0,0,0
L696:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 39 ---
L704:	fn_link  L536
	fn_link  Minimax.showI
	fn_link  L684
	fn_link  Minimax.append
	fn_combi_t47 5, 0,1,0,2,4,3
# --- block 40 ---
L724:	fn_link  L736
	fn_link  L740
	fn_combi_t2 4, 3,0,1,0,0,0
L736:	fn_combi_t0 2, 0,0,0,0,0,0
L740:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 41 ---
L748:	fn_link  L724
	fn_link  L760
	fn_combi_t2 4, 3,0,1,0,0,0
L760:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 42 ---
L768:	fn_link  L748
	fn_link  L780
	fn_combi_t2 4, 3,0,1,0,0,0
L780:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 43 ---
L788:	fn_link  L768
	fn_link  L800
	fn_combi_t2 4, 3,0,1,0,0,0
L800:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 44 ---
L808:	fn_link  L788
	fn_link  L820
	fn_combi_t2 4, 3,0,1,0,0,0
L820:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 45 ---
L828:	fn_link  L808
	fn_link  L840
	fn_combi_t2 4, 3,0,1,0,0,0
L840:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 46 ---
L848:	fn_link  Minimax.showI
	fn_link  L828
	fn_link  Minimax.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 47 ---
L864:	fn_link  L848
	fn_link  L880
	fn_link  L884
	fn_combi_t15 4, 0,3,1,2,3,0
L880:	fn_elink _prim_lt
L884:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 48 ---
L892:	fn_link  L704
	fn_link  L864
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 49 ---
L904:	fn_link  L916
	fn_link  L920
	fn_combi_t2 4, 3,0,1,0,0,0
L916:	fn_combi_t0 2, 0,0,0,0,0,0
L920:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 50 ---
L928:	fn_link  L904
	fn_link  L940
	fn_combi_t2 4, 3,0,1,0,0,0
L940:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 51 ---
L948:	fn_link  L928
	fn_link  L960
	fn_combi_t2 4, 3,0,1,0,0,0
L960:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 52 ---
L968:	fn_link  L948
	fn_link  L980
	fn_combi_t2 4, 3,0,1,0,0,0
L980:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 53 ---
L988:	fn_link  L1000
	fn_link  L1004
	fn_combi_t2 4, 3,0,1,0,0,0
L1000:	fn_combi_t0 2, 0,0,0,0,0,0
L1004:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 54 ---
L1012:	fn_link  L988
	fn_link  L1024
	fn_combi_t2 4, 3,0,1,0,0,0
L1024:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 55 ---
L1032:	fn_link  L1012
	fn_link  L1044
	fn_combi_t2 4, 3,0,1,0,0,0
L1044:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 56 ---
L1052:	fn_link  L1032
	fn_link  L1064
	fn_combi_t2 4, 3,0,1,0,0,0
L1064:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 57 ---
Minimax.showI:	fn_link  L1280
	fn_link  L1092
	fn_link  L1292
	fn_link  L1384
	fn_combi_t39 5, 0,4,1,4,2,3
L1092:	fn_y
# --- block 58 ---
L1096:	fn_link  L1112
	fn_link  L1116
	fn_link  L1140
	fn_combi_t13 6, 5,0,3,1,2,0
L1112:	fn_combi_t0 2, 0,0,0,0,0,0
L1116:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1140:	fn_y
# --- block 59 ---
L1144:	fn_link  L1164
	fn_link  L1188
	fn_link  NanoPrelude.rem
	fn_link  L1196
	fn_combi_t18 5, 0,1,4,2,3,0
L1164:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1188:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1196:	fn_y
# --- block 60 ---
L1200:	fn_link  L1212
	fn_link  L1144
	fn_combi_t5 5, 4,0,2,1,0,0
L1212:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 61 ---
L1216:	fn_link  L1232
	fn_link  NanoPrelude.quot
	fn_link  Minimax.append
	fn_combi_t21 5, 0,3,1,4,2,0
L1232:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 62 ---
L1240:	fn_link  L1200
	fn_link  L1216
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 63 ---
L1252:	fn_link  L1240
	fn_link  L1268
	fn_link  L1272
	fn_combi_t44 5, 0,4,1,2,3,4
L1268:	fn_elink _prim_lt
L1272:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 64 ---
L1280:	fn_link  L1096
	fn_link  L1252
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 65 ---
L1292:	fn_link  L1308
	fn_link  L1332
	fn_link  L1340
	fn_combi_t22 5, 4,0,3,1,2,0
L1308:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1332:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1340:	fn_y
# --- block 66 ---
L1344:	fn_link  L1356
	fn_link  L1360
	fn_combi_t15 4, 0,2,1,3,2,0
L1356:	fn_elink _prim_lt
L1360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 67 ---
L1368:	fn_link  L1380
	fn_link  L1344
	fn_combi_t3 3, 0,1,2,0,0,0
L1380:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 68 ---
L1384:	fn_link  L1404
	fn_link  L1412
	fn_link  L1368
	fn_link  L1416
	fn_combi_t10 5, 0,1,4,2,3,0
L1404:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L1412:	fn_combi_t2 4, 3,0,1,0,0,0
L1416:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 69 ---
NanoPrelude.quot:	fn_link  L1432
	fn_link  L1456
	fn_combi_t8 4, 0,3,2,1,0,0
L1432:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1456:	fn_y
# --- block 70 ---
NanoPrelude.rem:	fn_link  L1472
	fn_link  L1496
	fn_combi_t8 4, 0,3,2,1,0,0
L1472:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1496:	fn_y
# --- block 71 ---
Minimax.showBoard:	fn_link  L1844
	fn_link  L1512
	fn_combi_t2 3, 2,0,1,0,0,0
L1512:	fn_elink _error0
# --- block 72 ---
L1516:	fn_link  L1524
	fn_combi_t0 3, 0,0,0,0,0,0
L1524:	fn_elink _error0
# --- block 73 ---
L1528:	fn_link  L1540
	fn_link  L1544
	fn_combi_t2 4, 3,0,1,0,0,0
L1540:	fn_combi_t0 2, 0,0,0,0,0,0
L1544:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 74 ---
L1552:	fn_link  L1528
	fn_link  L1564
	fn_combi_t2 4, 3,0,1,0,0,0
L1564:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 75 ---
L1572:	fn_link  L1552
	fn_link  L1584
	fn_combi_t2 4, 3,0,1,0,0,0
L1584:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 76 ---
L1592:	fn_link  L1572
	fn_link  L1604
	fn_combi_t2 4, 3,0,1,0,0,0
L1604:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 77 ---
L1612:	fn_link  L1592
	fn_link  L1624
	fn_combi_t2 4, 3,0,1,0,0,0
L1624:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 78 ---
L1632:	fn_link  L1612
	fn_link  L1644
	fn_combi_t2 4, 3,0,1,0,0,0
L1644:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 79 ---
L1652:	fn_link  L1632
	fn_link  L1664
	fn_combi_t2 4, 3,0,1,0,0,0
L1664:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 80 ---
L1672:	fn_link  L1652
	fn_link  L1684
	fn_combi_t2 4, 3,0,1,0,0,0
L1684:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 81 ---
L1692:	fn_link  L1704
	fn_link  L1708
	fn_combi_t2 4, 3,0,1,0,0,0
L1704:	fn_combi_t0 2, 0,0,0,0,0,0
L1708:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 82 ---
L1716:	fn_link  L1692
	fn_link  L1728
	fn_combi_t2 4, 3,0,1,0,0,0
L1728:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 83 ---
L1736:	fn_link  L1716
	fn_link  Minimax.showRow
	fn_link  Minimax.append
	fn_combi_t47 5, 0,4,0,1,3,2
# --- block 84 ---
L1752:	fn_link  L1736
	fn_link  Minimax.showRow
	fn_link  Minimax.append
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 85 ---
L1768:	fn_link  L1752
	fn_link  Minimax.append
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 86 ---
L1780:	fn_link  Minimax.showRow
	fn_link  Minimax.append
	fn_combi_t57 6, 5,0,1,2,3,4
# --- block 87 ---
L1792:	fn_link  L1780
	fn_link  L1804
	fn_combi_t3 3, 0,1,2,0,0,0
L1804:	fn_combi_t24 6, 0,1,4,2,5,3
# --- block 88 ---
L1808:	fn_link  L1516
	fn_link  L1672
	fn_link  L1768
	fn_link  L1792
	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 89 ---
L1828:	fn_link  L1808
	fn_link  L1840
	fn_combi_t16 5, 4,0,1,2,3,0
L1840:	fn_elink _error0
# --- block 90 ---
L1844:	fn_link  L1828
	fn_link  L1856
	fn_combi_t6 4, 3,0,1,2,0,0
L1856:	fn_elink _error0
# --- block 91 ---
Minimax.showRow:	fn_link  L2004
	fn_link  L1872
	fn_combi_t2 3, 2,0,1,0,0,0
L1872:	fn_elink _error0
# --- block 92 ---
L1876:	fn_link  L1884
	fn_combi_t0 3, 0,0,0,0,0,0
L1884:	fn_elink _error0
# --- block 93 ---
L1888:	fn_link  Minimax.showPiece
	fn_link  L1904
	fn_link  L1912
	fn_combi_t6 4, 0,1,2,3,0,0
L1904:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
L1912:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 94 ---
L1916:	fn_link  L1888
	fn_link  Minimax.showPiece
	fn_link  Minimax.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 95 ---
L1932:	fn_link  L1916
	fn_link  L1948
	fn_link  L1956
	fn_combi_t16 5, 0,1,2,3,4,0
L1948:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
L1956:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1960:	fn_link  Minimax.showPiece
	fn_link  Minimax.append
	fn_combi_t33 6, 5,0,1,2,3,4
# --- block 97 ---
L1972:	fn_link  L1876
	fn_link  L1932
	fn_link  L1960
	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 98 ---
L1988:	fn_link  L1972
	fn_link  L2000
	fn_combi_t16 5, 4,0,1,2,3,0
L2000:	fn_elink _error0
# --- block 99 ---
L2004:	fn_link  L1988
	fn_link  L2016
	fn_combi_t6 4, 3,0,1,2,0,0
L2016:	fn_elink _error0
# --- block 100 ---
Minimax.showPiece:	fn_link  L2036
	fn_link  L2060
	fn_link  L2084
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 101 ---
L2036:	fn_link  L2048
	fn_link  L2052
	fn_combi_t2 4, 3,0,1,0,0,0
L2048:	fn_combi_t0 2, 0,0,0,0,0,0
L2052:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 102 ---
L2060:	fn_link  L2072
	fn_link  L2076
	fn_combi_t2 4, 3,0,1,0,0,0
L2072:	fn_combi_t0 2, 0,0,0,0,0,0
L2076:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 103 ---
L2084:	fn_link  L2096
	fn_link  L2100
	fn_combi_t2 4, 3,0,1,0,0,0
L2096:	fn_combi_t0 2, 0,0,0,0,0,0
L2100:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 104 ---
Minimax.alternate:	fn_link  Minimax.newPositions
	fn_link  L2344
	fn_link  L2124
	fn_combi_t26 5, 0,1,3,4,2,3
L2124:	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 105 ---
L2128:	fn_link  Minimax.bestMove
	fn_link  NanoPrelude.map
	fn_combi_t32 6, 0,1,5,3,2,4
# --- block 106 ---
L2140:	fn_link  Minimax.best
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 107 ---
L2148:	fn_link  L2160
	fn_link  Minimax.alternate
	fn_combi_t37 6, 0,4,3,2,5,1
L2160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 108 ---
L2164:	fn_link  L2172
	fn_combi_t46 5, 0,4,1,2,3,4
L2172:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 109 ---
L2176:	fn_link  L2192
	fn_link  Minimax.static
	fn_link  Minimax.eqEval
	fn_combi_t38 6, 0,1,3,2,4,5
L2192:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 110 ---
L2196:	fn_link  L2176
	fn_combi_t25 6, 0,3,1,4,5,2
# --- block 111 ---
L2204:	fn_link  L2224
	fn_link  L2148
	fn_link  L2164
	fn_link  L2196
	fn_combi_t33 6, 0,1,2,4,5,3
L2224:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
L2228:	fn_link  L2244
	fn_link  Minimax.static
	fn_link  Minimax.eqEval
	fn_combi_t38 6, 0,1,3,2,4,5
L2244:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 113 ---
L2248:	fn_link  L2228
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 114 ---
L2256:	fn_link  Minimax.fullBoard
	fn_combi_t30 5, 0,1,2,4,3,3
# --- block 115 ---
L2264:	fn_link  L2256
	fn_link  L2276
	fn_combi_t29 5, 0,1,4,2,4,3
L2276:	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 116 ---
L2280:	fn_link  L2300
	fn_link  L2204
	fn_link  L2248
	fn_link  L2264
	fn_combi_t33 6, 0,1,2,4,5,3
L2300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 117 ---
L2304:	fn_link  L2312
	fn_combi_t45 5, 0,1,4,2,3,4
L2312:	fn_combi_t39 6, 0,4,1,5,2,3
# --- block 118 ---
L2316:	fn_link  L2140
	fn_link  L2280
	fn_link  L2304
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 119 ---
L2332:	fn_link  L2128
	fn_link  L2316
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 120 ---
L2344:	fn_link  Minimax.opposite
	fn_link  L2332
	fn_combi_t9 5, 0,3,4,1,2,0
# --- block 121 ---
Minimax.fullBoard:	fn_link  NanoPrelude.concat
	fn_link  L2372
	fn_link  NanoPrelude.all
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 122 ---
L2372:	fn_link  L2388
	fn_link  Minimax.eqPiece
	fn_link  NanoPrelude.not
	fn_combi_t7 4, 0,1,3,2,0,0
L2388:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 123 ---
NanoPrelude.all:	fn_link  L2416
	fn_link  L2404
	fn_combi_t3 3, 0,1,2,0,0,0
L2404:	fn_y
# --- block 124 ---
L2408:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 125 ---
L2416:	fn_link  L2408
	fn_link  L2428
	fn_combi_t16 5, 4,0,1,2,3,0
L2428:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 126 ---
NanoPrelude.$26$26:	fn_link  L2440
	fn_combi_t1 2, 1,0,0,0,0,0
L2440:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 127 ---
NanoPrelude.not:	fn_link  L2456
	fn_link  L2460
	fn_combi_t2 3, 2,0,1,0,0,0
L2456:	fn_combi_t0 2, 0,0,0,0,0,0
L2460:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 128 ---
Minimax.eqPiece:	fn_link  L2484
	fn_link  L2488
	fn_link  L2516
	fn_link  L2492
	fn_combi_t10 5, 0,1,4,2,3,0
L2484:	fn_combi_t0 2, 1,0,0,0,0,0
L2488:	fn_combi_t0 2, 0,0,0,0,0,0
L2492:	fn_combi_t46 4, 0,3,3,1,1,2
# --- block 129 ---
L2496:	fn_link  L2508
	fn_link  L2512
	fn_combi_t18 4, 2,3,0,1,1,0
L2508:	fn_combi_t0 2, 0,0,0,0,0,0
L2512:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 130 ---
L2516:	fn_link  L2536
	fn_link  L2540
	fn_link  L2496
	fn_link  L2544
	fn_combi_t10 5, 0,1,4,2,3,0
L2536:	fn_combi_t0 2, 1,0,0,0,0,0
L2540:	fn_combi_t0 2, 0,0,0,0,0,0
L2544:	fn_combi_t46 4, 0,3,3,1,2,1
# --- block 131 ---
Minimax.eqEval:	fn_link  L2588
	fn_link  L2652
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 132 ---
L2560:	fn_link  L2576
	fn_link  L2580
	fn_link  L2584
	fn_combi_t10 5, 4,3,0,1,2,0
L2576:	fn_combi_t0 2, 1,0,0,0,0,0
L2580:	fn_combi_t0 2, 0,0,0,0,0,0
L2584:	fn_elink _prim_eq
# --- block 133 ---
L2588:	fn_link  L2560
	fn_link  L2600
	fn_combi_t14 4, 2,0,0,1,3,0
L2600:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 134 ---
L2604:	fn_link  L2612
	fn_combi_t0 2, 0,0,0,0,0,0
L2612:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 135 ---
L2616:	fn_link  L2624
	fn_combi_t0 2, 0,0,0,0,0,0
L2624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
L2628:	fn_link  L2616
	fn_link  L2644
	fn_link  L2648
	fn_combi_t18 5, 3,4,0,1,2,0
L2644:	fn_combi_t0 2, 0,0,0,0,0,0
L2648:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 137 ---
L2652:	fn_link  L2604
	fn_link  L2676
	fn_link  L2680
	fn_link  L2628
	fn_link  L2684
	fn_combi_t24 6, 0,1,5,2,3,4
L2676:	fn_combi_t0 2, 1,0,0,0,0,0
L2680:	fn_combi_t0 2, 0,0,0,0,0,0
L2684:	fn_combi_t46 5, 0,4,4,1,2,3
# --- block 138 ---
Minimax.static:	fn_link  Minimax.wins
	fn_link  Minimax.score
	fn_link  NanoPrelude.map
	fn_link  L2712
	fn_link  Minimax.interpret
	fn_combi_t47 6, 0,1,2,3,5,4
L2712:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 139 ---
Minimax.interpret:	fn_link  L2780
	fn_link  L2732
	fn_combi_t15 4, 3,0,2,1,2,0
L2732:	fn_combi_t1 4, 3,0,0,0,0,0
# --- block 140 ---
L2736:	fn_link  L2752
	fn_link  L2776
	fn_link  Minimax.interpret
	fn_combi_t36 6, 0,1,5,3,2,4
L2752:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2776:	fn_y
# --- block 141 ---
L2780:	fn_link  L2736
	fn_link  L2796
	fn_link  L2800
	fn_combi_t42 6, 4,0,1,2,3,5
L2796:	fn_combi_t0 3, 1,0,0,0,0,0
L2800:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 142 ---
Minimax.score:	fn_link  L2824
	fn_link  L2832
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 143 ---
L2816:	fn_link  Minimax.scorePiece
	fn_elink Minimax.map2
# --- block 144 ---
L2824:	fn_link  L2816
	fn_elink Minimax.map2
# --- block 145 ---
L2832:	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.sum
	fn_link  Minimax.eval
	fn_combi_t62 5, 0,1,2,1,3,4
# --- block 146 ---
Minimax.eval:	fn_link  L2868
	fn_link  L2944
	fn_link  L2872
	fn_link  L2876
	fn_combi_t29 5, 4,0,1,2,4,3
L2868:	fn_combi_t0 3, 0,0,0,0,0,0
L2872:	fn_elink _prim_eq
L2876:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 147 ---
L2884:	fn_link  L2904
	fn_link  L2908
	fn_link  L2932
	fn_link  L2940
	fn_combi_t15 5, 0,1,2,4,3,0
L2904:	fn_elink _prim_eq
L2908:	fn_force
	fn_tor a0
	addiw a0,a0,-3
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2932:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2940:	fn_y
# --- block 148 ---
L2944:	fn_link  L2960
	fn_link  L2964
	fn_link  L2884
	fn_combi_t11 4, 0,3,1,3,2,0
L2960:	fn_combi_t0 3, 1,0,0,0,0,0
L2964:	fn_combi_t1 4, 3,0,0,0,0,0
# --- block 149 ---
NanoPrelude.sum:	fn_link  L2980
	fn_link  L2988
	fn_elink NanoPrelude.foldr
L2980:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 150 ---
L2988:	fn_link  L3000
	fn_link  L3024
	fn_combi_t8 4, 0,3,2,1,0,0
L3000:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3024:	fn_y
# --- block 151 ---
Minimax.map2:	fn_link  L3100
	fn_link  L3124
	fn_link  L3044
	fn_combi_t8 4, 0,1,2,3,0,0
L3044:	fn_y
# --- block 152 ---
L3048:	fn_link  L3056
	fn_combi_t40 6, 0,1,2,4,3,5
L3056:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 153 ---
L3060:	fn_link  L3068
	fn_combi_t48 6, 3,0,1,4,2,5
L3068:	fn_elink _error0
# --- block 154 ---
L3072:	fn_link  L3048
	fn_link  L3060
	fn_link  L3092
	fn_link  L3096
	fn_combi_t17 5, 0,1,2,3,4,0
L3092:	fn_elink _error0
L3096:	fn_combi_t16 7, 3,0,1,2,4,0
# --- block 155 ---
L3100:	fn_link  L3072
	fn_link  L3116
	fn_link  L3120
	fn_combi_t6 4, 0,1,2,3,0,0
L3116:	fn_combi_t0 2, 0,0,0,0,0,0
L3120:	fn_combi_t46 7, 4,0,1,2,3,4
# --- block 156 ---
L3124:	fn_link  L3132
	fn_combi_t46 5, 3,0,1,2,3,4
L3132:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 157 ---
Minimax.scorePiece:	fn_link  L3148
	fn_link  L3156
	fn_combi_t4 4, 0,2,3,1,0,0
L3148:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 158 ---
L3156:	fn_link  L3172
	fn_link  L3196
	fn_link  L3204
	fn_combi_t50 5, 3,4,0,4,1,2
L3172:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3196:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3204:	fn_y
# --- block 159 ---
Minimax.wins:	fn_link  L3296
	fn_link  Minimax.win1
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 160 ---
L3220:	fn_link  L3232
	fn_link  Minimax.win8
	fn_combi_t2 4, 3,0,1,0,0,0
L3232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 161 ---
L3236:	fn_link  L3220
	fn_link  Minimax.win7
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 162 ---
L3248:	fn_link  L3236
	fn_link  Minimax.win6
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 163 ---
L3260:	fn_link  L3248
	fn_link  Minimax.win5
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 164 ---
L3272:	fn_link  L3260
	fn_link  Minimax.win4
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 165 ---
L3284:	fn_link  L3272
	fn_link  Minimax.win3
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 166 ---
L3296:	fn_link  L3284
	fn_link  Minimax.win2
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 167 ---
Minimax.win1:	fn_link  L3464
	fn_link  L3520
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 168 ---
L3320:	fn_link  L3332
	fn_link  L3336
	fn_combi_t2 4, 3,0,1,0,0,0
L3332:	fn_combi_t0 2, 0,0,0,0,0,0
L3336:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 169 ---
L3344:	fn_link  L3320
	fn_link  L3356
	fn_combi_t2 4, 3,0,1,0,0,0
L3356:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 170 ---
L3364:	fn_link  L3344
	fn_link  L3376
	fn_combi_t2 4, 3,0,1,0,0,0
L3376:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 171 ---
L3384:	fn_link  L3396
	fn_link  L3364
	fn_combi_t2 4, 3,0,1,0,0,0
L3396:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 172 ---
L3400:	fn_link  L3412
	fn_link  L3416
	fn_combi_t2 4, 3,0,1,0,0,0
L3412:	fn_combi_t0 2, 0,0,0,0,0,0
L3416:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 173 ---
L3424:	fn_link  L3400
	fn_link  L3436
	fn_combi_t2 4, 3,0,1,0,0,0
L3436:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 174 ---
L3444:	fn_link  L3424
	fn_link  L3456
	fn_combi_t2 4, 3,0,1,0,0,0
L3456:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 175 ---
L3464:	fn_link  L3384
	fn_link  L3444
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 176 ---
L3476:	fn_link  L3488
	fn_link  L3492
	fn_combi_t2 4, 3,0,1,0,0,0
L3488:	fn_combi_t0 2, 0,0,0,0,0,0
L3492:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 177 ---
L3500:	fn_link  L3476
	fn_link  L3512
	fn_combi_t2 4, 3,0,1,0,0,0
L3512:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 178 ---
L3520:	fn_link  L3500
	fn_link  L3532
	fn_combi_t2 4, 3,0,1,0,0,0
L3532:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 179 ---
Minimax.win2:	fn_link  L3696
	fn_link  L3752
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 180 ---
L3552:	fn_link  L3564
	fn_link  L3568
	fn_combi_t2 4, 3,0,1,0,0,0
L3564:	fn_combi_t0 2, 0,0,0,0,0,0
L3568:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 181 ---
L3576:	fn_link  L3552
	fn_link  L3588
	fn_combi_t2 4, 3,0,1,0,0,0
L3588:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 182 ---
L3596:	fn_link  L3576
	fn_link  L3608
	fn_combi_t2 4, 3,0,1,0,0,0
L3608:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 183 ---
L3616:	fn_link  L3628
	fn_link  L3596
	fn_combi_t2 4, 3,0,1,0,0,0
L3628:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 184 ---
L3632:	fn_link  L3644
	fn_link  L3648
	fn_combi_t2 4, 3,0,1,0,0,0
L3644:	fn_combi_t0 2, 0,0,0,0,0,0
L3648:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 185 ---
L3656:	fn_link  L3632
	fn_link  L3668
	fn_combi_t2 4, 3,0,1,0,0,0
L3668:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 186 ---
L3676:	fn_link  L3656
	fn_link  L3688
	fn_combi_t2 4, 3,0,1,0,0,0
L3688:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 187 ---
L3696:	fn_link  L3616
	fn_link  L3676
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 188 ---
L3708:	fn_link  L3720
	fn_link  L3724
	fn_combi_t2 4, 3,0,1,0,0,0
L3720:	fn_combi_t0 2, 0,0,0,0,0,0
L3724:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 189 ---
L3732:	fn_link  L3708
	fn_link  L3744
	fn_combi_t2 4, 3,0,1,0,0,0
L3744:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 190 ---
L3752:	fn_link  L3732
	fn_link  L3764
	fn_combi_t2 4, 3,0,1,0,0,0
L3764:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 191 ---
Minimax.win3:	fn_link  L3928
	fn_link  L3984
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 192 ---
L3784:	fn_link  L3796
	fn_link  L3800
	fn_combi_t2 4, 3,0,1,0,0,0
L3796:	fn_combi_t0 2, 0,0,0,0,0,0
L3800:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 193 ---
L3808:	fn_link  L3784
	fn_link  L3820
	fn_combi_t2 4, 3,0,1,0,0,0
L3820:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 194 ---
L3828:	fn_link  L3808
	fn_link  L3840
	fn_combi_t2 4, 3,0,1,0,0,0
L3840:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 195 ---
L3848:	fn_link  L3860
	fn_link  L3828
	fn_combi_t2 4, 3,0,1,0,0,0
L3860:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 196 ---
L3864:	fn_link  L3876
	fn_link  L3880
	fn_combi_t2 4, 3,0,1,0,0,0
L3876:	fn_combi_t0 2, 0,0,0,0,0,0
L3880:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 197 ---
L3888:	fn_link  L3864
	fn_link  L3900
	fn_combi_t2 4, 3,0,1,0,0,0
L3900:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 198 ---
L3908:	fn_link  L3888
	fn_link  L3920
	fn_combi_t2 4, 3,0,1,0,0,0
L3920:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 199 ---
L3928:	fn_link  L3848
	fn_link  L3908
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 200 ---
L3940:	fn_link  L3952
	fn_link  L3956
	fn_combi_t2 4, 3,0,1,0,0,0
L3952:	fn_combi_t0 2, 0,0,0,0,0,0
L3956:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 201 ---
L3964:	fn_link  L3940
	fn_link  L3976
	fn_combi_t2 4, 3,0,1,0,0,0
L3976:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 202 ---
L3984:	fn_link  L3964
	fn_link  L3996
	fn_combi_t2 4, 3,0,1,0,0,0
L3996:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 203 ---
Minimax.win4:	fn_link  L4160
	fn_link  L4216
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 204 ---
L4016:	fn_link  L4028
	fn_link  L4032
	fn_combi_t2 4, 3,0,1,0,0,0
L4028:	fn_combi_t0 2, 0,0,0,0,0,0
L4032:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 205 ---
L4040:	fn_link  L4016
	fn_link  L4052
	fn_combi_t2 4, 3,0,1,0,0,0
L4052:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 206 ---
L4060:	fn_link  L4040
	fn_link  L4072
	fn_combi_t2 4, 3,0,1,0,0,0
L4072:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 207 ---
L4080:	fn_link  L4092
	fn_link  L4060
	fn_combi_t2 4, 3,0,1,0,0,0
L4092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 208 ---
L4096:	fn_link  L4108
	fn_link  L4112
	fn_combi_t2 4, 3,0,1,0,0,0
L4108:	fn_combi_t0 2, 0,0,0,0,0,0
L4112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 209 ---
L4120:	fn_link  L4096
	fn_link  L4132
	fn_combi_t2 4, 3,0,1,0,0,0
L4132:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 210 ---
L4140:	fn_link  L4120
	fn_link  L4152
	fn_combi_t2 4, 3,0,1,0,0,0
L4152:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 211 ---
L4160:	fn_link  L4080
	fn_link  L4140
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 212 ---
L4172:	fn_link  L4184
	fn_link  L4188
	fn_combi_t2 4, 3,0,1,0,0,0
L4184:	fn_combi_t0 2, 0,0,0,0,0,0
L4188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 213 ---
L4196:	fn_link  L4172
	fn_link  L4208
	fn_combi_t2 4, 3,0,1,0,0,0
L4208:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 214 ---
L4216:	fn_link  L4196
	fn_link  L4228
	fn_combi_t2 4, 3,0,1,0,0,0
L4228:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 215 ---
Minimax.win5:	fn_link  L4392
	fn_link  L4448
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 216 ---
L4248:	fn_link  L4260
	fn_link  L4264
	fn_combi_t2 4, 3,0,1,0,0,0
L4260:	fn_combi_t0 2, 0,0,0,0,0,0
L4264:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 217 ---
L4272:	fn_link  L4248
	fn_link  L4284
	fn_combi_t2 4, 3,0,1,0,0,0
L4284:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 218 ---
L4292:	fn_link  L4272
	fn_link  L4304
	fn_combi_t2 4, 3,0,1,0,0,0
L4304:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 219 ---
L4312:	fn_link  L4324
	fn_link  L4292
	fn_combi_t2 4, 3,0,1,0,0,0
L4324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 220 ---
L4328:	fn_link  L4340
	fn_link  L4344
	fn_combi_t2 4, 3,0,1,0,0,0
L4340:	fn_combi_t0 2, 0,0,0,0,0,0
L4344:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 221 ---
L4352:	fn_link  L4328
	fn_link  L4364
	fn_combi_t2 4, 3,0,1,0,0,0
L4364:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 222 ---
L4372:	fn_link  L4352
	fn_link  L4384
	fn_combi_t2 4, 3,0,1,0,0,0
L4384:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 223 ---
L4392:	fn_link  L4312
	fn_link  L4372
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 224 ---
L4404:	fn_link  L4416
	fn_link  L4420
	fn_combi_t2 4, 3,0,1,0,0,0
L4416:	fn_combi_t0 2, 0,0,0,0,0,0
L4420:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 225 ---
L4428:	fn_link  L4404
	fn_link  L4440
	fn_combi_t2 4, 3,0,1,0,0,0
L4440:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 226 ---
L4448:	fn_link  L4428
	fn_link  L4460
	fn_combi_t2 4, 3,0,1,0,0,0
L4460:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 227 ---
Minimax.win6:	fn_link  L4624
	fn_link  L4680
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 228 ---
L4480:	fn_link  L4492
	fn_link  L4496
	fn_combi_t2 4, 3,0,1,0,0,0
L4492:	fn_combi_t0 2, 0,0,0,0,0,0
L4496:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 229 ---
L4504:	fn_link  L4480
	fn_link  L4516
	fn_combi_t2 4, 3,0,1,0,0,0
L4516:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 230 ---
L4524:	fn_link  L4504
	fn_link  L4536
	fn_combi_t2 4, 3,0,1,0,0,0
L4536:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 231 ---
L4544:	fn_link  L4556
	fn_link  L4524
	fn_combi_t2 4, 3,0,1,0,0,0
L4556:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 232 ---
L4560:	fn_link  L4572
	fn_link  L4576
	fn_combi_t2 4, 3,0,1,0,0,0
L4572:	fn_combi_t0 2, 0,0,0,0,0,0
L4576:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 233 ---
L4584:	fn_link  L4560
	fn_link  L4596
	fn_combi_t2 4, 3,0,1,0,0,0
L4596:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 234 ---
L4604:	fn_link  L4584
	fn_link  L4616
	fn_combi_t2 4, 3,0,1,0,0,0
L4616:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 235 ---
L4624:	fn_link  L4544
	fn_link  L4604
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 236 ---
L4636:	fn_link  L4648
	fn_link  L4652
	fn_combi_t2 4, 3,0,1,0,0,0
L4648:	fn_combi_t0 2, 0,0,0,0,0,0
L4652:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 237 ---
L4660:	fn_link  L4636
	fn_link  L4672
	fn_combi_t2 4, 3,0,1,0,0,0
L4672:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 238 ---
L4680:	fn_link  L4660
	fn_link  L4692
	fn_combi_t2 4, 3,0,1,0,0,0
L4692:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 239 ---
Minimax.win7:	fn_link  L4856
	fn_link  L4912
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 240 ---
L4712:	fn_link  L4724
	fn_link  L4728
	fn_combi_t2 4, 3,0,1,0,0,0
L4724:	fn_combi_t0 2, 0,0,0,0,0,0
L4728:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 241 ---
L4736:	fn_link  L4712
	fn_link  L4748
	fn_combi_t2 4, 3,0,1,0,0,0
L4748:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 242 ---
L4756:	fn_link  L4736
	fn_link  L4768
	fn_combi_t2 4, 3,0,1,0,0,0
L4768:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 243 ---
L4776:	fn_link  L4788
	fn_link  L4756
	fn_combi_t2 4, 3,0,1,0,0,0
L4788:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 244 ---
L4792:	fn_link  L4804
	fn_link  L4808
	fn_combi_t2 4, 3,0,1,0,0,0
L4804:	fn_combi_t0 2, 0,0,0,0,0,0
L4808:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 245 ---
L4816:	fn_link  L4792
	fn_link  L4828
	fn_combi_t2 4, 3,0,1,0,0,0
L4828:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 246 ---
L4836:	fn_link  L4816
	fn_link  L4848
	fn_combi_t2 4, 3,0,1,0,0,0
L4848:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 247 ---
L4856:	fn_link  L4776
	fn_link  L4836
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 248 ---
L4868:	fn_link  L4880
	fn_link  L4884
	fn_combi_t2 4, 3,0,1,0,0,0
L4880:	fn_combi_t0 2, 0,0,0,0,0,0
L4884:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 249 ---
L4892:	fn_link  L4868
	fn_link  L4904
	fn_combi_t2 4, 3,0,1,0,0,0
L4904:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 250 ---
L4912:	fn_link  L4892
	fn_link  L4924
	fn_combi_t2 4, 3,0,1,0,0,0
L4924:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 251 ---
Minimax.win8:	fn_link  L5088
	fn_link  L5144
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 252 ---
L4944:	fn_link  L4956
	fn_link  L4960
	fn_combi_t2 4, 3,0,1,0,0,0
L4956:	fn_combi_t0 2, 0,0,0,0,0,0
L4960:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 253 ---
L4968:	fn_link  L4944
	fn_link  L4980
	fn_combi_t2 4, 3,0,1,0,0,0
L4980:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 254 ---
L4988:	fn_link  L4968
	fn_link  L5000
	fn_combi_t2 4, 3,0,1,0,0,0
L5000:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 255 ---
L5008:	fn_link  L5020
	fn_link  L4988
	fn_combi_t2 4, 3,0,1,0,0,0
L5020:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 256 ---
L5024:	fn_link  L5036
	fn_link  L5040
	fn_combi_t2 4, 3,0,1,0,0,0
L5036:	fn_combi_t0 2, 0,0,0,0,0,0
L5040:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 257 ---
L5048:	fn_link  L5024
	fn_link  L5060
	fn_combi_t2 4, 3,0,1,0,0,0
L5060:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 258 ---
L5068:	fn_link  L5048
	fn_link  L5080
	fn_combi_t2 4, 3,0,1,0,0,0
L5080:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 259 ---
L5088:	fn_link  L5008
	fn_link  L5068
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 260 ---
L5100:	fn_link  L5112
	fn_link  L5116
	fn_combi_t2 4, 3,0,1,0,0,0
L5112:	fn_combi_t0 2, 0,0,0,0,0,0
L5116:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 261 ---
L5124:	fn_link  L5100
	fn_link  L5136
	fn_combi_t2 4, 3,0,1,0,0,0
L5136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 262 ---
L5144:	fn_link  L5124
	fn_link  L5156
	fn_combi_t2 4, 3,0,1,0,0,0
L5156:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 263 ---
Minimax.best:	fn_link  L5372
	fn_link  L5176
	fn_combi_t16 5, 3,0,1,2,4,0
L5176:	fn_elink _error0
# --- block 264 ---
L5180:	fn_link  Minimax.eqEval
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 265 ---
L5188:	fn_link  L5200
	fn_link  L5180
	fn_combi_t6 4, 0,2,1,3,0,0
L5200:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 266 ---
L5204:	fn_link  L5212
	fn_combi_t24 6, 0,1,5,2,3,4
L5212:	fn_combi_t51 6, 0,1,2,4,3,5
# --- block 267 ---
L5216:	fn_link  L5188
	fn_link  L5204
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 268 ---
L5228:	fn_link  L5236
	fn_combi_t26 5, 0,1,3,4,2,4
L5236:	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 269 ---
L5240:	fn_link  L5216
	fn_link  L5256
	fn_link  L5228
	fn_combi_t54 6, 0,1,2,3,4,5
L5256:	fn_combi_t23 5, 0,1,2,3,4,4
# --- block 270 ---
L5260:	fn_link  L5268
	fn_combi_t46 6, 3,0,1,2,4,5
L5268:	fn_elink _error0
# --- block 271 ---
L5272:	fn_link  L5240
	fn_link  L5260
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 272 ---
L5284:	fn_link  L5292
	fn_combi_t0 3, 0,0,0,0,0,0
L5292:	fn_elink _error0
# --- block 273 ---
L5296:	fn_link  L5304
	fn_combi_t38 6, 0,1,3,2,4,5
L5304:	fn_combi_t40 5, 3,4,0,1,2,4
# --- block 274 ---
L5308:	fn_link  L5284
	fn_link  L5324
	fn_link  L5296
	fn_combi_t5 4, 0,1,3,2,0,0
L5324:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 275 ---
L5328:	fn_link  L5308
	fn_link  L5340
	fn_combi_t56 5, 0,1,3,4,2,4
L5340:	fn_y
# --- block 276 ---
L5344:	fn_link  L5272
	fn_link  L5328
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 277 ---
L5356:	fn_link  L5344
	fn_link  L5368
	fn_combi_t24 6, 0,1,2,3,5,4
L5368:	fn_y
# --- block 278 ---
L5372:	fn_link  L5356
	fn_link  L5384
	fn_combi_t46 6, 3,0,1,2,4,5
L5384:	fn_elink _error0
# --- block 279 ---
Minimax.bestMove:	fn_link  L5432
	fn_link  Minimax.mise
	fn_link  L5404
	fn_combi_t40 6, 0,1,4,5,2,3
L5404:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 280 ---
L5408:	fn_link  Minimax.searchTree
	fn_link  Minimax.static
	fn_link  Minimax.mapTree
	fn_link  L5428
	fn_combi_t15 5, 0,1,2,3,4,0
L5428:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 281 ---
L5432:	fn_link  L5408
	fn_link  Minimax.cropTree
	fn_link  L5448
	fn_combi_t6 4, 0,1,2,3,0,0
L5448:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 282 ---
Minimax.mise:	fn_link  L5504
	fn_link  L5464
	fn_combi_t19 5, 4,0,1,2,3,0
L5464:	fn_combi_t46 4, 3,2,0,1,1,3
# --- block 283 ---
L5468:	fn_link  L5484
	fn_link  L5488
	fn_link  NanoPrelude.foldr
	fn_combi_t30 7, 0,3,4,1,2,5
L5484:	fn_combi_t0 3, 0,0,0,0,0,0
L5488:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 284 ---
L5492:	fn_link  L5500
	fn_combi_t24 6, 0,1,5,2,3,4
L5500:	fn_combi_t54 7, 0,1,2,4,3,5
# --- block 285 ---
L5504:	fn_link  Minimax.mise
	fn_link  NanoPrelude.map
	fn_link  L5468
	fn_link  L5492
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 286 ---
Minimax.cropTree:	fn_link  L5620
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 287 ---
L5532:	fn_link  L5544
	fn_link  L5548
	fn_combi_t2 3, 0,2,1,0,0,0
L5544:	fn_combi_t0 2, 0,0,0,0,0,0
L5548:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 288 ---
L5552:	fn_link  Minimax.cropTree
	fn_link  NanoPrelude.map
	fn_link  L5572
	fn_link  L5576
	fn_combi_t44 6, 0,1,5,2,3,4
L5572:	fn_combi_t1 4, 3,0,0,0,0,0
L5576:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 289 ---
L5580:	fn_link  L5552
	fn_combi_t14 6, 2,1,1,0,3,0
# --- block 290 ---
L5588:	fn_link  L5532
	fn_link  L5580
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 291 ---
L5600:	fn_link  L5612
	fn_link  L5616
	fn_combi_t40 5, 4,0,3,1,2,4
L5612:	fn_combi_t0 2, 0,0,0,0,0,0
L5616:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 292 ---
L5620:	fn_link  L5588
	fn_link  L5600
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 293 ---
Minimax.mapTree:	fn_link  L5664
	fn_link  L5644
	fn_combi_t3 3, 0,1,2,0,0,0
L5644:	fn_y
# --- block 294 ---
L5648:	fn_link  NanoPrelude.map
	fn_link  L5660
	fn_combi_t44 6, 0,2,4,1,3,5
L5660:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 295 ---
L5664:	fn_link  L5648
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 296 ---
Minimax.searchTree:	fn_link  L5696
	fn_link  L5688
	fn_link  Minimax.prune
	fn_combi_t16 5, 0,1,2,3,4,0
L5688:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 297 ---
L5696:	fn_link  Minimax.opposite
	fn_link  Minimax.newPositions
	fn_link  Minimax.newPositions
	fn_link  Minimax.repTree
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 298 ---
Minimax.prune:	fn_link  L5728
	fn_link  L5812
	fn_combi_t14 4, 0,2,3,3,1,0
# --- block 299 ---
L5728:	fn_link  L5740
	fn_link  L5744
	fn_combi_t2 4, 0,2,1,0,0,0
L5740:	fn_combi_t0 2, 0,0,0,0,0,0
L5744:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 300 ---
L5748:	fn_link  L5768
	fn_link  L5792
	fn_link  Minimax.prune
	fn_link  NanoPrelude.map
	fn_combi_t22 5, 0,1,2,4,3,0
L5768:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5792:	fn_y
# --- block 301 ---
L5796:	fn_link  L5748
	fn_link  L5808
	fn_combi_t16 5, 0,3,1,2,4,0
L5808:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 302 ---
L5812:	fn_link  L5796
	fn_link  L5828
	fn_link  L5832
	fn_combi_t45 5, 3,0,1,4,2,3
L5828:	fn_elink _prim_eq
L5832:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 303 ---
Minimax.repTree:	fn_link  L5868
	fn_link  L5852
	fn_combi_t46 5, 0,4,1,2,3,4
L5852:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 304 ---
L5856:	fn_link  Minimax.repTree
	fn_link  NanoPrelude.map
	fn_combi_t40 5, 0,1,3,2,2,4
# --- block 305 ---
L5868:	fn_link  L5880
	fn_link  L5856
	fn_combi_t3 3, 0,1,2,0,0,0
L5880:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 306 ---
Minimax.newPositions:	fn_link  L6096
	fn_link  Minimax.placePiece
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t54 6, 0,1,2,4,5,3
# --- block 307 ---
L5904:	fn_link  L5916
	fn_link  L5920
	fn_combi_t2 4, 3,0,1,0,0,0
L5916:	fn_combi_t0 2, 0,0,0,0,0,0
L5920:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 308 ---
L5928:	fn_link  L5904
	fn_link  L5940
	fn_combi_t2 4, 3,0,1,0,0,0
L5940:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 309 ---
L5948:	fn_link  L5928
	fn_link  L5960
	fn_combi_t2 4, 3,0,1,0,0,0
L5960:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 310 ---
L5968:	fn_link  L5980
	fn_link  L5984
	fn_combi_t2 4, 3,0,1,0,0,0
L5980:	fn_combi_t0 2, 0,0,0,0,0,0
L5984:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 311 ---
L5992:	fn_link  L5968
	fn_link  L6004
	fn_combi_t2 4, 3,0,1,0,0,0
L6004:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 312 ---
L6012:	fn_link  L5992
	fn_link  L6024
	fn_combi_t2 4, 3,0,1,0,0,0
L6024:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 313 ---
L6032:	fn_link  L6044
	fn_link  L6048
	fn_combi_t40 6, 0,1,2,4,3,5
L6044:	fn_combi_t2 3, 2,0,1,0,0,0
L6048:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 314 ---
L6052:	fn_link  L6032
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 315 ---
L6060:	fn_link  L6012
	fn_link  L6052
	fn_link  L6076
	fn_combi_t32 6, 0,1,3,4,5,2
L6076:	fn_y
# --- block 316 ---
L6080:	fn_link  L6060
	fn_link  L6092
	fn_combi_t6 4, 3,0,1,2,0,0
L6092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 317 ---
L6096:	fn_link  L5948
	fn_link  L6080
	fn_y
# --- block 318 ---
Minimax.placePiece:	fn_link  L6124
	fn_link  L6596
	fn_link  L6624
	fn_combi_t5 4, 0,1,3,2,0,0
L6124:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 319 ---
L6128:	fn_link  L6136
	fn_combi_t0 3, 0,0,0,0,0,0
L6136:	fn_elink _error0
# --- block 320 ---
L6140:	fn_link  L6148
	fn_combi_t2 4, 3,1,0,0,0,0
L6148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 321 ---
L6152:	fn_link  L6140
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 322 ---
L6160:	fn_link  Minimax.insert
	fn_link  L6172
	fn_combi_t37 6, 0,1,2,3,4,5
L6172:	fn_combi_t32 7, 6,0,1,2,4,3
# --- block 323 ---
L6176:	fn_link  L6152
	fn_link  L6160
	fn_combi_t14 5, 0,2,3,1,4,0
# --- block 324 ---
L6188:	fn_link  L6196
	fn_combi_t2 4, 3,1,0,0,0,0
L6196:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 325 ---
L6200:	fn_link  L6188
	fn_link  Minimax.insert
	fn_link  L6216
	fn_combi_t37 6, 0,1,3,4,2,5
L6216:	fn_combi_t32 7, 6,0,1,2,4,3
# --- block 326 ---
L6220:	fn_link  L6240
	fn_link  L6200
	fn_link  L6244
	fn_link  L6248
	fn_combi_t33 6, 0,1,2,4,5,3
L6240:	fn_combi_t0 2, 0,0,0,0,0,0
L6244:	fn_combi_t46 7, 6,1,0,2,3,4
L6248:	fn_combi_t32 7, 6,0,2,3,4,1
# --- block 327 ---
L6252:	fn_link  L6264
	fn_link  Minimax.insert
	fn_combi_t32 7, 6,0,2,3,4,1
L6264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 328 ---
L6268:	fn_link  L6252
	fn_combi_t46 7, 6,2,0,1,3,4
# --- block 329 ---
L6276:	fn_link  L6296
	fn_link  L6268
	fn_link  L6300
	fn_link  L6304
	fn_combi_t33 6, 0,1,2,4,5,3
L6296:	fn_combi_t0 2, 0,0,0,0,0,0
L6300:	fn_combi_t46 7, 6,1,0,2,3,4
L6304:	fn_combi_t32 7, 6,0,2,3,4,1
# --- block 330 ---
L6308:	fn_link  L6324
	fn_link  L6328
	fn_link  L6332
	fn_combi_t38 6, 4,0,1,2,3,5
L6324:	fn_elink _error0
L6328:	fn_elink _prim_eq
L6332:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 331 ---
L6340:	fn_link  L6276
	fn_link  L6308
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 332 ---
L6352:	fn_link  L6364
	fn_link  L6368
	fn_combi_t44 5, 3,0,1,2,3,4
L6364:	fn_elink _prim_eq
L6368:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 333 ---
L6376:	fn_link  L6340
	fn_link  L6352
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 334 ---
L6388:	fn_link  L6396
	fn_combi_t38 5, 0,1,2,4,3,4
L6396:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 335 ---
L6400:	fn_link  L6376
	fn_link  L6388
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 336 ---
L6412:	fn_link  L6424
	fn_link  L6428
	fn_combi_t44 5, 3,0,1,2,3,4
L6424:	fn_elink _prim_eq
L6428:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 337 ---
L6436:	fn_link  L6412
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 338 ---
L6444:	fn_link  L6400
	fn_link  L6436
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 339 ---
L6456:	fn_link  L6464
	fn_combi_t38 5, 0,1,2,4,3,4
L6464:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 340 ---
L6468:	fn_link  L6220
	fn_link  L6444
	fn_link  L6456
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 341 ---
L6484:	fn_link  L6492
	fn_combi_t38 5, 0,1,4,2,3,4
L6492:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 342 ---
L6496:	fn_link  L6176
	fn_link  L6516
	fn_link  L6468
	fn_link  L6484
	fn_combi_t38 5, 0,1,4,2,3,4
L6516:	fn_combi_t32 7, 6,0,2,3,4,1
# --- block 343 ---
L6520:	fn_link  L6532
	fn_link  L6496
	fn_combi_t4 4, 0,2,3,1,0,0
L6532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 344 ---
L6536:	fn_link  L6128
	fn_link  L6520
	fn_link  L6552
	fn_combi_t30 6, 0,4,1,3,5,2
L6552:	fn_combi_t35 6, 5,0,1,3,4,2
# --- block 345 ---
L6556:	fn_link  L6564
	fn_combi_t46 6, 5,0,1,2,3,4
L6564:	fn_elink _error0
# --- block 346 ---
L6568:	fn_link  L6536
	fn_link  L6556
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 347 ---
L6580:	fn_link  L6568
	fn_link  L6592
	fn_combi_t46 6, 5,0,1,2,3,4
L6592:	fn_elink _error0
# --- block 348 ---
L6596:	fn_link  L6580
	fn_link  L6608
	fn_combi_t16 5, 3,0,1,2,4,0
L6608:	fn_elink _error0
# --- block 349 ---
L6612:	fn_link  Minimax.empty
	fn_link  NanoPrelude.not
	fn_combi_t40 5, 0,1,4,3,2,4
# --- block 350 ---
L6624:	fn_link  L6612
	fn_combi_t24 5, 0,1,3,3,4,2
# --- block 351 ---
Minimax.empty:	fn_link  L6844
	fn_link  L6928
	fn_combi_t20 4, 2,0,3,1,3,0
# --- block 352 ---
L6644:	fn_link  L6652
	fn_combi_t0 3, 0,0,0,0,0,0
L6652:	fn_elink _error0
# --- block 353 ---
L6656:	fn_link  L6644
	fn_link  Minimax.empty$27
	fn_combi_t12 5, 4,0,2,3,1,0
# --- block 354 ---
L6668:	fn_link  L6656
	fn_link  L6680
	fn_combi_t6 5, 4,0,1,2,0,0
L6680:	fn_elink _error0
# --- block 355 ---
L6684:	fn_link  L6668
	fn_link  L6696
	fn_combi_t6 5, 4,0,1,2,0,0
L6696:	fn_elink _error0
# --- block 356 ---
L6700:	fn_link  L6684
	fn_link  L6712
	fn_combi_t6 4, 2,0,1,3,0,0
L6712:	fn_elink _error0
# --- block 357 ---
L6716:	fn_link  L6732
	fn_link  L6736
	fn_link  L6740
	fn_combi_t38 6, 4,0,1,2,3,5
L6732:	fn_elink _error0
L6736:	fn_elink _prim_eq
L6740:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 358 ---
L6748:	fn_link  L6700
	fn_link  L6716
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 359 ---
L6760:	fn_link  L6772
	fn_link  Minimax.empty$27
	fn_combi_t40 7, 6,0,2,4,1,3
L6772:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 360 ---
L6776:	fn_link  L6760
	fn_combi_t46 5, 4,2,0,1,2,3
# --- block 361 ---
L6784:	fn_link  L6776
	fn_combi_t16 5, 4,2,0,1,2,0
# --- block 362 ---
L6792:	fn_link  L6784
	fn_combi_t16 4, 1,3,0,2,3,0
# --- block 363 ---
L6800:	fn_link  L6812
	fn_link  L6816
	fn_combi_t38 5, 2,0,1,4,3,4
L6812:	fn_elink _prim_eq
L6816:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 364 ---
L6824:	fn_link  L6800
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 365 ---
L6832:	fn_link  L6792
	fn_link  L6824
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 366 ---
L6844:	fn_link  L6748
	fn_link  L6832
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 367 ---
L6856:	fn_link  L6868
	fn_link  Minimax.empty$27
	fn_combi_t40 7, 6,0,2,4,1,3
L6868:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 368 ---
L6872:	fn_link  L6856
	fn_combi_t46 6, 5,2,0,1,2,3
# --- block 369 ---
L6880:	fn_link  L6872
	fn_combi_t46 5, 4,2,0,1,2,3
# --- block 370 ---
L6888:	fn_link  L6880
	fn_combi_t16 4, 1,3,0,2,3,0
# --- block 371 ---
L6896:	fn_link  L6908
	fn_link  L6912
	fn_combi_t38 5, 2,0,1,4,3,4
L6908:	fn_elink _prim_eq
L6912:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 372 ---
L6920:	fn_link  L6896
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 373 ---
L6928:	fn_link  L6888
	fn_link  L6920
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 374 ---
Minimax.empty$27:	fn_link  L7152
	fn_link  L7232
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 375 ---
L6952:	fn_link  L6960
	fn_combi_t0 3, 0,0,0,0,0,0
L6960:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 376 ---
L6964:	fn_link  L6952
	fn_link  L6980
	fn_link  L6984
	fn_combi_t42 5, 3,0,0,4,1,2
L6980:	fn_combi_t0 2, 1,0,0,0,0,0
L6984:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 377 ---
L6988:	fn_link  L6964
	fn_link  L7000
	fn_combi_t2 4, 3,0,1,0,0,0
L7000:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 378 ---
L7004:	fn_link  L6988
	fn_link  L7016
	fn_combi_t2 4, 3,0,1,0,0,0
L7016:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 379 ---
L7020:	fn_link  L7004
	fn_link  L7032
	fn_combi_t2 3, 2,0,1,0,0,0
L7032:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 380 ---
L7036:	fn_link  L7020
	fn_link  L7056
	fn_link  L7060
	fn_link  L7064
	fn_combi_t38 6, 4,0,1,2,3,5
L7056:	fn_combi_t0 2, 0,0,0,0,0,0
L7060:	fn_elink _prim_eq
L7064:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 381 ---
L7072:	fn_link  L7084
	fn_link  L7088
	fn_combi_t6 5, 4,0,1,2,0,0
L7084:	fn_combi_t0 3, 0,0,0,0,0,0
L7088:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 382 ---
L7092:	fn_link  L7072
	fn_link  L7104
	fn_combi_t47 5, 4,2,0,1,2,2
L7104:	fn_combi_t42 4, 2,1,1,3,1,0
# --- block 383 ---
L7108:	fn_link  L7092
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 384 ---
L7116:	fn_link  L7128
	fn_link  L7132
	fn_combi_t38 5, 2,0,1,4,3,4
L7128:	fn_elink _prim_eq
L7132:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 385 ---
L7140:	fn_link  L7108
	fn_link  L7116
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 386 ---
L7152:	fn_link  L7036
	fn_link  L7140
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 387 ---
L7164:	fn_link  L7176
	fn_link  L7180
	fn_combi_t6 5, 4,0,1,2,0,0
L7176:	fn_combi_t0 3, 0,0,0,0,0,0
L7180:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 388 ---
L7184:	fn_link  L7164
	fn_combi_t6 4, 3,1,0,1,0,0
# --- block 389 ---
L7192:	fn_link  L7184
	fn_link  L7204
	fn_combi_t47 4, 2,3,0,1,3,3
L7204:	fn_combi_t42 4, 2,1,1,3,1,0
# --- block 390 ---
L7208:	fn_link  L7220
	fn_link  L7224
	fn_combi_t38 5, 2,0,1,4,3,4
L7220:	fn_elink _prim_eq
L7224:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 391 ---
L7232:	fn_link  L7192
	fn_link  L7208
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 392 ---
Minimax.insert:	fn_link  L7580
	fn_link  L7256
	fn_combi_t16 5, 3,0,1,2,4,0
L7256:	fn_elink _error0
# --- block 393 ---
L7260:	fn_link  L7268
	fn_combi_t0 3, 0,0,0,0,0,0
L7268:	fn_elink _error0
# --- block 394 ---
L7272:	fn_link  L7280
	fn_combi_t2 4, 3,1,0,0,0,0
L7280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 395 ---
L7284:	fn_link  L7272
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 396 ---
L7292:	fn_link  L7284
	fn_combi_t16 6, 5,1,0,2,3,0
# --- block 397 ---
L7300:	fn_link  L7308
	fn_combi_t2 4, 3,1,0,0,0,0
L7308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 398 ---
L7312:	fn_link  L7300
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 399 ---
L7320:	fn_link  L7312
	fn_combi_t16 6, 5,2,0,1,3,0
# --- block 400 ---
L7328:	fn_link  L7336
	fn_combi_t2 4, 3,1,0,0,0,0
L7336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 401 ---
L7340:	fn_link  L7328
	fn_combi_t6 5, 4,2,0,1,0,0
# --- block 402 ---
L7348:	fn_link  L7340
	fn_combi_t16 6, 5,2,0,1,3,0
# --- block 403 ---
L7356:	fn_link  L7372
	fn_link  L7376
	fn_link  L7380
	fn_combi_t38 6, 3,0,1,2,4,5
L7372:	fn_elink _error0
L7376:	fn_elink _prim_eq
L7380:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 404 ---
L7388:	fn_link  L7400
	fn_link  L7404
	fn_combi_t38 6, 2,0,1,3,4,5
L7400:	fn_elink _prim_eq
L7404:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 405 ---
L7412:	fn_link  L7356
	fn_link  L7388
	fn_link  L7428
	fn_combi_t29 5, 0,1,4,2,4,3
L7428:	fn_combi_t33 6, 0,1,2,3,5,4
# --- block 406 ---
L7432:	fn_link  L7348
	fn_link  L7412
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 407 ---
L7444:	fn_link  L7432
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 408 ---
L7452:	fn_link  L7320
	fn_link  L7444
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 409 ---
L7464:	fn_link  L7476
	fn_link  L7480
	fn_combi_t52 6, 5,2,0,1,3,4
L7476:	fn_elink _prim_eq
L7480:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 410 ---
L7488:	fn_link  L7464
	fn_link  L7500
	fn_combi_t3 3, 0,1,2,0,0,0
L7500:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 411 ---
L7504:	fn_link  L7488
	fn_link  L7516
	fn_combi_t29 5, 0,1,4,2,4,3
L7516:	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 412 ---
L7520:	fn_link  L7292
	fn_link  L7452
	fn_link  L7504
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 413 ---
L7536:	fn_link  L7260
	fn_link  L7520
	fn_link  L7552
	fn_combi_t12 5, 0,1,3,4,2,0
L7552:	fn_combi_t23 6, 0,2,3,4,5,1
# --- block 414 ---
L7556:	fn_link  L7564
	fn_combi_t46 6, 5,0,1,2,3,4
L7564:	fn_elink _error0
# --- block 415 ---
L7568:	fn_link  L7536
	fn_link  L7556
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 416 ---
L7580:	fn_link  L7568
	fn_link  L7592
	fn_combi_t46 6, 5,0,1,2,3,4
L7592:	fn_elink _error0
# --- block 417 ---
Minimax.opposite:	fn_link  L7612
	fn_link  L7616
	fn_link  L7620
	fn_combi_t4 4, 3,0,1,2,0,0
L7612:	fn_elink _error0
L7616:	fn_combi_t0 3, 0,0,0,0,0,0
L7620:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 418 ---
Minimax.max$27:	fn_link  L7712
	fn_link  L7728
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 419 ---
L7636:	fn_link  L7644
	fn_combi_t10 5, 4,3,0,2,1,0
L7644:	fn_elink _prim_gt
# --- block 420 ---
L7648:	fn_link  L7656
	fn_combi_t42 4, 2,0,0,1,2,3
L7656:	fn_elink _error0
# --- block 421 ---
L7660:	fn_link  L7636
	fn_link  L7648
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 422 ---
L7672:	fn_link  L7660
	fn_link  L7684
	fn_combi_t42 4, 2,0,0,1,2,3
L7684:	fn_elink _error0
# --- block 423 ---
L7688:	fn_link  L7696
	fn_combi_t14 5, 1,2,3,0,2,0
L7696:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 424 ---
L7700:	fn_link  L7672
	fn_link  L7688
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 425 ---
L7712:	fn_link  L7700
	fn_link  L7724
	fn_combi_t42 4, 3,0,2,1,2,3
L7724:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 426 ---
L7728:	fn_link  L7740
	fn_link  L7744
	fn_combi_t14 4, 2,0,3,1,3,0
L7740:	fn_combi_t0 2, 0,0,0,0,0,0
L7744:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 427 ---
Minimax.min$27:	fn_link  L7836
	fn_link  L7852
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 428 ---
L7760:	fn_link  L7768
	fn_combi_t10 5, 4,3,0,2,1,0
L7768:	fn_elink _prim_lt
# --- block 429 ---
L7772:	fn_link  L7780
	fn_combi_t42 4, 2,0,0,1,2,3
L7780:	fn_elink _error0
# --- block 430 ---
L7784:	fn_link  L7760
	fn_link  L7772
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 431 ---
L7796:	fn_link  L7784
	fn_link  L7808
	fn_combi_t42 4, 2,0,0,1,2,3
L7808:	fn_elink _error0
# --- block 432 ---
L7812:	fn_link  L7820
	fn_combi_t14 5, 1,3,2,0,2,0
L7820:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 433 ---
L7824:	fn_link  L7796
	fn_link  L7812
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 434 ---
L7836:	fn_link  L7824
	fn_link  L7848
	fn_combi_t42 4, 3,2,0,1,2,3
L7848:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 435 ---
L7852:	fn_link  L7864
	fn_link  L7868
	fn_combi_t14 4, 2,3,0,1,3,0
L7864:	fn_combi_t0 2, 0,0,0,0,0,0
L7868:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 436 ---
Minimax.testBoard:	fn_link  L8004
	fn_link  L8052
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 437 ---
L7884:	fn_link  L7896
	fn_link  L7900
	fn_combi_t2 4, 3,0,1,0,0,0
L7896:	fn_combi_t0 2, 0,0,0,0,0,0
L7900:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 438 ---
L7904:	fn_link  L7884
	fn_link  L7916
	fn_combi_t2 4, 3,0,1,0,0,0
L7916:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 439 ---
L7920:	fn_link  L7904
	fn_link  L7932
	fn_combi_t2 4, 3,0,1,0,0,0
L7932:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 440 ---
L7936:	fn_link  L7948
	fn_link  L7920
	fn_combi_t2 4, 3,0,1,0,0,0
L7948:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 441 ---
L7952:	fn_link  L7964
	fn_link  L7968
	fn_combi_t2 4, 3,0,1,0,0,0
L7964:	fn_combi_t0 2, 0,0,0,0,0,0
L7968:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 442 ---
L7972:	fn_link  L7952
	fn_link  L7984
	fn_combi_t2 4, 3,0,1,0,0,0
L7984:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 443 ---
L7988:	fn_link  L7972
	fn_link  L8000
	fn_combi_t2 4, 3,0,1,0,0,0
L8000:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 444 ---
L8004:	fn_link  L7936
	fn_link  L7988
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 445 ---
L8016:	fn_link  L8028
	fn_link  L8032
	fn_combi_t2 4, 3,0,1,0,0,0
L8028:	fn_combi_t0 2, 0,0,0,0,0,0
L8032:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 446 ---
L8036:	fn_link  L8016
	fn_link  L8048
	fn_combi_t2 4, 3,0,1,0,0,0
L8048:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 447 ---
L8052:	fn_link  L8036
	fn_link  L8064
	fn_combi_t2 4, 3,0,1,0,0,0
L8064:	fn_combi_t0 3, 2,0,0,0,0,0

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
_unimpprim_addiw$20$2d3:
	la a0, _unimpprim_addiw$20$2d3$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d3$name:
	.asciz "addiw -3"
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
