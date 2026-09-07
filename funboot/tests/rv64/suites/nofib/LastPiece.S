# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/LastPiece  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$5b$5d
	.globl	LastPiece.Tip
	.globl	LastPiece.add
	.globl	LastPiece.append
	.globl	LastPiece.bPiece
	.globl	LastPiece.bench
	.globl	LastPiece.cPiece
	.globl	LastPiece.charD
	.globl	LastPiece.check
	.globl	LastPiece.cmpSq
	.globl	LastPiece.dPiece
	.globl	LastPiece.display
	.globl	LastPiece.displayBoard
	.globl	LastPiece.ePiece
	.globl	LastPiece.extend
	.globl	LastPiece.extend_maybe
	.globl	LastPiece.fPiece
	.globl	LastPiece.fit
	.globl	LastPiece.flipS
	.globl	LastPiece.fromJustB
	.globl	LastPiece.fromTo
	.globl	LastPiece.fromToDown
	.globl	LastPiece.gPiece
	.globl	LastPiece.hPiece
	.globl	LastPiece.hashS
	.globl	LastPiece.hcat
	.globl	LastPiece.iPiece
	.globl	LastPiece.initialBoard
	.globl	LastPiece.initialPieces
	.globl	LastPiece.isJustM
	.globl	LastPiece.jPiece
	.globl	LastPiece.kPiece
	.globl	LastPiece.lPiece
	.globl	LastPiece.mPiece
	.globl	LastPiece.mapMaybeL
	.globl	LastPiece.nPiece
	.globl	LastPiece.nest
	.globl	LastPiece.next
	.globl	LastPiece.pickOne
	.globl	LastPiece.render
	.globl	LastPiece.search
	.globl	LastPiece.solutions
	.globl	LastPiece.takeP
	.globl	LastPiece.text
	.globl	LastPiece.try
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  LastPiece.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
LastPiece.bench:	fn_link  L44
L32:	fn_elink LastPiece.hashS
# --- block 3 ---
L36:	fn_link  LastPiece.solutions
	fn_elink LastPiece.display
# --- block 4 ---
L44:	fn_link  L36
	fn_elink LastPiece.render
# --- block 5 ---
LastPiece.hashS:	fn_link  L64
	fn_link  L152
	fn_elink NanoPrelude.foldl
L64:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
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
	fn_go a0
L116:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L140:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L148:	fn_y
# --- block 7 ---
L152:	fn_link  L72
	fn_link  L164
	fn_combi_t7 4, 0,1,2,3,0,0
L164:	fn_y
# --- block 8 ---
NanoPrelude.foldl:	fn_link  L184
	fn_link  L180
	fn_combi_t3 3, 0,1,2,0,0,0
L180:	fn_y
# --- block 9 ---
L184:	fn_link  L192
	fn_combi_t46 5, 4,3,0,1,2,3
L192:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 10 ---
LastPiece.render:	fn_link  L220
	fn_link  L268
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_link  LastPiece.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 11 ---
L220:	fn_link  L232
	fn_link  L236
	fn_combi_t2 4, 3,0,1,0,0,0
L232:	fn_combi_t0 2, 0,0,0,0,0,0
L236:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 12 ---
L244:	fn_link  L256
	fn_link  L260
	fn_combi_t2 4, 3,0,1,0,0,0
L256:	fn_combi_t0 2, 0,0,0,0,0,0
L260:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 13 ---
L268:	fn_link  L244
	fn_link  LastPiece.append
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 14 ---
LastPiece.append:	fn_link  L288
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 15 ---
L288:	fn_link  LastPiece.append
	fn_link  L300
	fn_combi_t16 5, 0,3,1,4,2,0
L300:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
NanoPrelude.concat:	fn_link  L316
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L316:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 17 ---
NanoPrelude.foldr:	fn_link  L336
	fn_link  L332
	fn_combi_t7 4, 0,1,2,3,0,0
L332:	fn_y
# --- block 18 ---
L336:	fn_link  L344
	fn_combi_t16 5, 4,2,0,1,3,0
L344:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 19 ---
Data.List_Type.$2b$2b:	fn_link  L376
	fn_link  L360
	fn_combi_t5 4, 0,1,3,2,0,0
L360:	fn_y
# --- block 20 ---
L364:	fn_link  L372
	fn_combi_t6 4, 0,2,1,3,0,0
L372:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
L376:	fn_link  L364
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 22 ---
NanoPrelude.map:	fn_link  L412
	fn_link  L396
	fn_combi_t3 3, 0,1,2,0,0,0
L396:	fn_y
# --- block 23 ---
L400:	fn_link  L408
	fn_combi_t15 5, 0,1,3,2,4,0
L408:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 24 ---
L412:	fn_link  L400
	fn_link  L424
	fn_combi_t16 5, 4,0,1,2,3,0
L424:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 25 ---
LastPiece.display:	fn_link  L452
	fn_link  L460
	fn_link  L688
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 26 ---
L444:	fn_link  Data.List_Type.$5b$5d
	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 27 ---
L452:	fn_link  L444
	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 28 ---
L460:	fn_link  LastPiece.display
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 29 ---
L476:	fn_link  L496
	fn_link  LastPiece.displayBoard
	fn_link  L500
	fn_link  LastPiece.nest
	fn_combi_t34 7, 6,0,1,2,4,3
L496:	fn_combi_t0 2, 0,0,0,0,0,0
L500:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 30 ---
L508:	fn_link  L520
	fn_link  L524
	fn_combi_t2 4, 3,0,1,0,0,0
L520:	fn_combi_t0 2, 0,0,0,0,0,0
L524:	fn_box
	.word 0x00000021	# raw word 33
	fn_box_body
# --- block 31 ---
L532:	fn_link  L508
	fn_link  L544
	fn_combi_t2 4, 3,0,1,0,0,0
L544:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 32 ---
L552:	fn_link  L532
	fn_link  L564
	fn_combi_t2 4, 3,0,1,0,0,0
L564:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 33 ---
L572:	fn_link  L552
	fn_link  L584
	fn_combi_t2 4, 3,0,1,0,0,0
L584:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 34 ---
L592:	fn_link  L572
	fn_link  L604
	fn_combi_t2 4, 3,0,1,0,0,0
L604:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 35 ---
L612:	fn_link  L592
	fn_link  L624
	fn_combi_t2 4, 3,0,1,0,0,0
L624:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 36 ---
L632:	fn_link  L612
	fn_link  L644
	fn_combi_t2 4, 3,0,1,0,0,0
L644:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 37 ---
L652:	fn_link  L632
	fn_link  L664
	fn_combi_t2 4, 3,0,1,0,0,0
L664:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 38 ---
L672:	fn_link  L476
	fn_link  L652
	fn_link  LastPiece.text
	fn_combi_t15 6, 5,0,1,2,3,0
# --- block 39 ---
L688:	fn_link  L672
	fn_link  NanoPrelude.concat
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 40 ---
LastPiece.text:	fn_link  L708
	fn_combi_t2 4, 3,1,0,0,0,0
L708:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
LastPiece.nest:	fn_link  L820
	fn_link  L732
	fn_link  LastPiece.append
	fn_link  NanoPrelude.map
	fn_combi_t21 5, 0,1,2,3,4,0
L732:	fn_y
# --- block 42 ---
L736:	fn_link  L756
	fn_link  L780
	fn_link  L784
	fn_link  L792
	fn_combi_t50 6, 0,1,4,2,5,3
L756:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L780:	fn_y
L784:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
L792:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 43 ---
L796:	fn_link  L808
	fn_link  L812
	fn_combi_t29 5, 0,4,1,2,4,3
L808:	fn_elink _prim_le
L812:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 44 ---
L820:	fn_link  L836
	fn_link  L736
	fn_link  L796
	fn_combi_t5 4, 0,1,3,2,0,0
L836:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
LastPiece.displayBoard:	fn_link  L864
	fn_link  LastPiece.text
	fn_link  L980
	fn_link  NanoPrelude.concat
	fn_link  LastPiece.append
	fn_combi_t41 6, 0,1,2,5,3,4
L864:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
L868:	fn_link  LastPiece.check
	fn_combi_t39 6, 0,1,2,5,3,4
# --- block 47 ---
L876:	fn_link  L896
	fn_link  LastPiece.charD
	fn_link  L904
	fn_link  L868
	fn_combi_t25 6, 0,4,1,5,2,3
L896:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
L904:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 48 ---
L908:	fn_link  LastPiece.charD
	fn_link  L876
	fn_combi_t9 5, 0,2,3,4,1,0
# --- block 49 ---
L920:	fn_link  NanoPrelude.map
	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 50 ---
L928:	fn_link  L952
	fn_link  L960
	fn_link  LastPiece.fromTo
	fn_link  L908
	fn_link  L920
	fn_combi_t24 6, 0,1,5,2,3,4
L952:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L960:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 51 ---
L968:	fn_link  L928
	fn_link  LastPiece.hcat
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 52 ---
L980:	fn_link  L1004
	fn_link  L1012
	fn_link  LastPiece.fromToDown
	fn_link  L968
	fn_link  NanoPrelude.map
	fn_combi_t44 6, 0,1,5,2,3,4
L1004:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1012:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 53 ---
LastPiece.hcat:	fn_link  L1040
	fn_link  L1064
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t35 7, 6,0,1,2,4,3
L1040:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1044:	fn_link  L1052
	fn_combi_t0 3, 0,0,0,0,0,0
L1052:	fn_elink _error0
# --- block 55 ---
L1056:	fn_link  L1044
	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 56 ---
L1064:	fn_link  L1056
	fn_link  L1076
	fn_combi_t2 3, 2,0,1,0,0,0
L1076:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
LastPiece.check:	fn_link  LastPiece.cmpSq
	fn_link  L1188
	fn_link  L1096
	fn_combi_t48 5, 3,0,1,4,2,4
L1096:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
L1100:	fn_link  LastPiece.check
	fn_link  L1116
	fn_link  L1120
	fn_combi_t44 6, 0,5,1,2,4,3
L1116:	fn_elink _prim_lt
L1120:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 59 ---
L1128:	fn_link  LastPiece.check
	fn_link  L1100
	fn_link  L1144
	fn_combi_t10 4, 0,1,3,2,3,0
L1144:	fn_combi_t42 6, 0,4,5,1,3,2
# --- block 60 ---
L1148:	fn_link  L1160
	fn_link  L1164
	fn_combi_t29 5, 4,0,1,2,4,3
L1160:	fn_elink _prim_eq
L1164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 61 ---
L1172:	fn_link  L1148
	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 62 ---
L1180:	fn_link  L1172
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 63 ---
L1188:	fn_link  L1204
	fn_link  L1128
	fn_link  L1180
	fn_combi_t38 6, 0,1,3,2,4,5
L1204:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 64 ---
LastPiece.cmpSq:	fn_link  L1480
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 65 ---
L1216:	fn_link  L1232
	fn_link  L1240
	fn_link  L1248
	fn_combi_t10 5, 4,3,0,1,2,0
L1232:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1240:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1248:	fn_elink _prim_gt
# --- block 66 ---
L1252:	fn_link  L1260
	fn_combi_t29 5, 4,3,0,1,4,2
L1260:	fn_elink _prim_lt
# --- block 67 ---
L1264:	fn_link  L1288
	fn_link  L1312
	fn_link  L1320
	fn_link  L1216
	fn_link  L1252
	fn_combi_t45 6, 0,1,5,2,3,4
L1288:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1320:	fn_y
# --- block 68 ---
L1324:	fn_link  L1264
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 69 ---
L1332:	fn_link  L1340
	fn_combi_t29 6, 4,1,0,2,5,3
L1340:	fn_elink _prim_gt
# --- block 70 ---
L1344:	fn_link  L1360
	fn_link  L1324
	fn_link  L1332
	fn_combi_t11 5, 0,3,1,4,2,0
L1360:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 71 ---
L1368:	fn_link  L1376
	fn_combi_t29 6, 4,1,0,2,5,3
L1376:	fn_elink _prim_lt
# --- block 72 ---
L1380:	fn_link  L1368
	fn_link  L1392
	fn_combi_t3 3, 0,1,2,0,0,0
L1392:	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 73 ---
L1396:	fn_link  L1416
	fn_link  L1344
	fn_link  L1380
	fn_link  L1420
	fn_combi_t29 5, 0,1,4,2,4,3
L1416:	fn_y
L1420:	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 74 ---
L1424:	fn_link  L1440
	fn_link  L1464
	fn_link  L1396
	fn_combi_t4 4, 0,3,1,2,0,0
L1440:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1464:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 75 ---
L1472:	fn_link  L1424
	fn_combi_t9 4, 0,1,2,3,3,0
# --- block 76 ---
L1480:	fn_link  L1472
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 77 ---
LastPiece.charD:	fn_link  L1500
	fn_link  L1504
	fn_combi_t5 5, 4,0,2,1,0,0
L1500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 78 ---
L1504:	fn_link  L1512
	fn_combi_t2 4, 3,1,0,0,0,0
L1512:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 79 ---
LastPiece.fromTo:	fn_link  L1532
	fn_link  L1580
	fn_link  L1596
	fn_combi_t10 4, 0,1,3,2,3,0
L1532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 80 ---
L1536:	fn_link  L1552
	fn_link  L1576
	fn_link  LastPiece.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L1552:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1576:	fn_y
# --- block 81 ---
L1580:	fn_link  L1536
	fn_link  L1592
	fn_combi_t16 4, 0,2,1,2,3,0
L1592:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 82 ---
L1596:	fn_link  L1604
	fn_combi_t29 5, 4,3,0,1,4,2
L1604:	fn_elink _prim_gt
# --- block 83 ---
LastPiece.fromToDown:	fn_link  L1624
	fn_link  L1672
	fn_link  L1688
	fn_combi_t10 4, 0,1,3,2,3,0
L1624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 84 ---
L1628:	fn_link  L1644
	fn_link  L1668
	fn_link  LastPiece.fromToDown
	fn_combi_t8 4, 0,1,3,2,0,0
L1644:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1668:	fn_y
# --- block 85 ---
L1672:	fn_link  L1628
	fn_link  L1684
	fn_combi_t16 4, 0,2,1,2,3,0
L1684:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 86 ---
L1688:	fn_link  L1696
	fn_combi_t29 5, 4,3,0,1,4,2
L1696:	fn_elink _prim_lt
# --- block 87 ---
Data.List_Type.$5b$5d:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 88 ---
LastPiece.solutions:	fn_link  L1728
	fn_link  LastPiece.initialBoard
	fn_link  L1724
	fn_link  L1748
	fn_elink LastPiece.search
L1724:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 89 ---
L1728:	fn_link  LastPiece.initialPieces
	fn_link  L1740
	fn_elink LastPiece.takeP
L1740:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 90 ---
L1748:	fn_link  L1760
	fn_link  L1768
	fn_combi_t2 3, 2,0,1,0,0,0
L1760:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1768:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 91 ---
LastPiece.search:	fn_link  L2224
	fn_link  L1792
	fn_link  L2240
	fn_combi_t52 5, 0,1,2,3,3,4
L1792:	fn_combi_t18 7, 1,0,2,3,4,0
# --- block 92 ---
L1796:	fn_link  L1812
	fn_link  L1820
	fn_link  L1844
	fn_combi_t13 5, 4,0,3,1,2,0
L1812:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1820:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1844:	fn_y
# --- block 93 ---
L1848:	fn_link  LastPiece.flipS
	fn_link  L1796
	fn_link  LastPiece.search
	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 94 ---
L1864:	fn_link  LastPiece.flipS
	fn_link  LastPiece.next
	fn_link  LastPiece.search
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 95 ---
L1880:	fn_link  L1888
	fn_combi_t40 6, 0,1,2,4,3,5
L1888:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1892:	fn_link  L1904
	fn_link  L1880
	fn_combi_t3 3, 0,1,2,0,0,0
L1904:	fn_combi_t4 4, 3,1,2,0,0,0
# --- block 97 ---
L1908:	fn_link  L1892
	fn_link  L1920
	fn_combi_t14 5, 0,2,3,1,4,0
L1920:	fn_combi_t44 6, 5,0,1,2,3,4
# --- block 98 ---
L1924:	fn_link  L1932
	fn_combi_t44 6, 0,1,3,2,4,5
L1932:	fn_y
# --- block 99 ---
L1936:	fn_link  L1924
	fn_combi_t54 6, 4,0,1,3,5,2
# --- block 100 ---
L1944:	fn_link  L1908
	fn_link  L1936
	fn_combi_t52 6, 4,0,1,3,2,5
# --- block 101 ---
L1956:	fn_link  L1944
	fn_link  L1968
	fn_combi_t16 5, 4,0,1,2,3,0
L1968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 102 ---
L1972:	fn_link  LastPiece.try
	fn_link  LastPiece.mapMaybeL
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 103 ---
L1984:	fn_link  L1992
	fn_combi_t38 5, 0,1,4,2,3,4
L1992:	fn_combi_t48 6, 0,4,1,2,3,5
# --- block 104 ---
L1996:	fn_link  L1956
	fn_link  L2016
	fn_link  L1972
	fn_link  L1984
	fn_combi_t10 5, 0,1,4,2,3,0
L2016:	fn_y
# --- block 105 ---
L2020:	fn_link  LastPiece.pickOne
	fn_link  L1996
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 106 ---
L2032:	fn_link  L2040
	fn_combi_t1 4, 0,1,0,0,0,0
L2040:	fn_combi_t1 4, 2,0,0,0,0,0
# --- block 107 ---
L2044:	fn_link  L2032
	fn_link  L2056
	fn_combi_t40 5, 4,0,3,2,1,4
L2056:	fn_combi_t2 5, 4,0,1,0,0,0
# --- block 108 ---
L2060:	fn_link  L2020
	fn_link  L2044
	fn_link  L2076
	fn_combi_t15 4, 0,1,3,2,3,0
L2076:	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 109 ---
L2080:	fn_link  LastPiece.check
	fn_link  LastPiece.isJustM
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 110 ---
L2092:	fn_link  L2080
	fn_combi_t30 5, 0,1,2,3,4,4
# --- block 111 ---
L2100:	fn_link  L2060
	fn_link  L2092
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 112 ---
L2112:	fn_link  L2100
	fn_link  L2124
	fn_combi_t40 5, 0,1,2,4,3,4
L2124:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 113 ---
L2128:	fn_link  L1864
	fn_link  L2112
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 114 ---
L2140:	fn_link  L2160
	fn_link  L2164
	fn_link  L2188
	fn_link  L2196
	fn_combi_t29 6, 0,1,2,5,3,4
L2160:	fn_elink _prim_eq
L2164:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2188:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L2196:	fn_y
# --- block 115 ---
L2200:	fn_link  L2128
	fn_link  L2140
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 116 ---
L2212:	fn_link  L2220
	fn_combi_t40 5, 0,1,2,4,3,4
L2220:	fn_combi_t42 5, 0,2,4,1,3,2
# --- block 117 ---
L2224:	fn_link  L1848
	fn_link  L2200
	fn_link  L2212
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 118 ---
L2240:	fn_link  L2248
	fn_combi_t44 4, 3,0,2,1,2,3
L2248:	fn_combi_t1 4, 1,0,0,0,0,0
# --- block 119 ---
LastPiece.isJustM:	fn_link  L2268
	fn_link  L2264
	fn_combi_t2 3, 2,0,1,0,0,0
L2264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 120 ---
L2268:	fn_link  L2276
	fn_combi_t0 2, 0,0,0,0,0,0
L2276:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 121 ---
LastPiece.mapMaybeL:	fn_link  L2308
	fn_link  L2300
	fn_link  L2320
	fn_link  L2304
	fn_combi_t19 5, 0,1,2,4,3,0
L2300:	fn_combi_t39 5, 0,3,2,4,1,4
L2304:	fn_y
# --- block 122 ---
L2308:	fn_link  L2316
	fn_combi_t6 4, 0,3,1,2,0,0
L2316:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 123 ---
L2320:	fn_link  L2328
	fn_combi_t47 5, 4,0,1,2,3,3
L2328:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 124 ---
LastPiece.try:	fn_link  L2360
	fn_link  L2408
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 125 ---
L2344:	fn_link  LastPiece.flipS
	fn_link  LastPiece.next
	fn_link  LastPiece.search
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 126 ---
L2360:	fn_link  L2344
	fn_link  L2372
	fn_combi_t51 6, 0,1,2,3,5,4
L2372:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 127 ---
L2376:	fn_link  L2388
	fn_link  LastPiece.fit
	fn_combi_t23 6, 0,3,2,4,5,1
L2388:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 128 ---
L2392:	fn_link  L2376
	fn_link  L2404
	fn_combi_t3 3, 0,1,2,0,0,0
L2404:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 129 ---
L2408:	fn_link  L2392
	fn_combi_t53 6, 5,0,1,2,3,4
# --- block 130 ---
LastPiece.fit:	fn_link  L2472
	fn_link  L2508
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 131 ---
L2428:	fn_link  LastPiece.fit
	fn_combi_t9 5, 0,4,1,2,3,0
# --- block 132 ---
L2436:	fn_link  LastPiece.add
	fn_link  LastPiece.extend_maybe
	fn_combi_t30 6, 0,2,1,3,5,4
# --- block 133 ---
L2448:	fn_link  L2464
	fn_link  L2436
	fn_link  L2468
	fn_combi_t12 5, 0,1,3,4,2,0
L2464:	fn_combi_t0 2, 0,0,0,0,0,0
L2468:	fn_combi_t37 6, 0,2,4,1,3,5
# --- block 134 ---
L2472:	fn_link  L2428
	fn_link  L2448
	fn_link  L2488
	fn_combi_t5 4, 0,1,3,2,0,0
L2488:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 135 ---
L2492:	fn_link  LastPiece.extend
	fn_link  L2504
	fn_combi_t60 6, 5,0,1,2,3,4
L2504:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 136 ---
L2508:	fn_link  L2492
	fn_link  L2520
	fn_combi_t38 5, 0,1,2,4,3,4
L2520:	fn_combi_t37 5, 0,1,3,4,2,3
# --- block 137 ---
LastPiece.extend:	fn_link  L2764
	fn_link  L2784
	fn_link  L2540
	fn_combi_t5 4, 0,1,3,2,0,0
L2540:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 138 ---
L2544:	fn_link  LastPiece.extend
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 139 ---
L2552:	fn_link  L2560
	fn_combi_t42 6, 0,3,4,1,2,5
L2560:	fn_combi_t9 6, 5,0,1,2,3,0
# --- block 140 ---
L2564:	fn_link  L2544
	fn_link  L2552
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 141 ---
L2576:	fn_link  LastPiece.extend
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 142 ---
L2584:	fn_link  L2592
	fn_combi_t37 6, 0,2,3,4,1,5
L2592:	fn_combi_t9 6, 5,0,1,2,3,0
# --- block 143 ---
L2596:	fn_link  L2576
	fn_link  L2584
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 144 ---
L2608:	fn_link  L2620
	fn_link  L2624
	fn_combi_t29 6, 0,5,1,2,3,4
L2620:	fn_elink _prim_lt
L2624:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 145 ---
L2632:	fn_link  L2608
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 146 ---
L2640:	fn_link  L2632
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 147 ---
L2648:	fn_link  L2640
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 148 ---
L2656:	fn_link  L2648
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 149 ---
L2664:	fn_link  L2596
	fn_link  L2656
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 150 ---
L2676:	fn_link  L2564
	fn_link  L2664
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 151 ---
L2688:	fn_link  L2700
	fn_link  L2704
	fn_combi_t29 5, 4,0,1,2,4,3
L2700:	fn_elink _prim_eq
L2704:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 152 ---
L2712:	fn_link  L2688
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 153 ---
L2720:	fn_link  L2712
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 154 ---
L2728:	fn_link  L2720
	fn_combi_t44 6, 0,1,5,2,4,3
# --- block 155 ---
L2736:	fn_link  L2728
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 156 ---
L2744:	fn_link  L2760
	fn_link  L2676
	fn_link  L2736
	fn_combi_t26 5, 0,1,3,4,2,4
L2760:	fn_combi_t9 6, 5,0,1,2,3,0
# --- block 157 ---
L2764:	fn_link  LastPiece.cmpSq
	fn_link  L2744
	fn_link  L2780
	fn_combi_t26 5, 0,1,3,4,2,3
L2780:	fn_combi_t42 5, 0,3,4,1,2,3
# --- block 158 ---
L2784:	fn_link  L2796
	fn_link  L2800
	fn_combi_t51 5, 2,0,3,4,1,1
L2796:	fn_combi_t0 2, 0,0,0,0,0,0
L2800:	fn_combi_t9 6, 5,0,1,2,3,0
# --- block 159 ---
LastPiece.extend_maybe:	fn_link  L2820
	fn_link  L2868
	fn_link  L3044
	fn_combi_t5 4, 0,1,3,2,0,0
L2820:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 160 ---
L2824:	fn_link  L2832
	fn_combi_t0 2, 0,0,0,0,0,0
L2832:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 161 ---
L2836:	fn_link  LastPiece.extend
	fn_link  L2848
	fn_combi_t18 5, 0,1,2,3,4,0
L2848:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 162 ---
L2852:	fn_link  LastPiece.check
	fn_combi_t28 6, 0,1,4,2,5,3
# --- block 163 ---
L2860:	fn_link  L2852
	fn_combi_t25 5, 0,1,2,4,3,4
# --- block 164 ---
L2868:	fn_link  L2824
	fn_link  L2836
	fn_link  L2860
	fn_combi_t11 4, 0,3,1,3,2,0
# --- block 165 ---
L2884:	fn_link  L2904
	fn_link  L2908
	fn_link  L2912
	fn_link  L2916
	fn_combi_t10 5, 0,4,1,2,3,0
L2904:	fn_combi_t0 2, 1,0,0,0,0,0
L2908:	fn_combi_t0 2, 0,0,0,0,0,0
L2912:	fn_elink _prim_gt
L2916:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 166 ---
L2924:	fn_link  L2948
	fn_link  L2952
	fn_link  L2956
	fn_link  L2960
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,1,5,2,3,4
L2948:	fn_combi_t0 2, 1,0,0,0,0,0
L2952:	fn_combi_t0 2, 0,0,0,0,0,0
L2956:	fn_elink _prim_lt
L2960:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 167 ---
L2968:	fn_link  L2992
	fn_link  L2996
	fn_link  L3000
	fn_link  L3004
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,1,5,2,3,4
L2992:	fn_combi_t0 2, 1,0,0,0,0,0
L2996:	fn_combi_t0 2, 0,0,0,0,0,0
L3000:	fn_elink _prim_gt
L3004:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 168 ---
L3012:	fn_link  L2884
	fn_link  L2924
	fn_link  L2968
	fn_link  L3032
	fn_combi_t24 6, 0,1,5,2,3,4
L3032:	fn_combi_t34 5, 0,1,4,2,4,3
# --- block 169 ---
L3036:	fn_link  L3012
	fn_combi_t24 6, 0,1,3,4,5,2
# --- block 170 ---
L3044:	fn_link  L3036
	fn_combi_t52 5, 3,0,1,3,2,4
# --- block 171 ---
NanoPrelude.$7c$7c:	fn_link  L3060
	fn_combi_t2 3, 1,2,0,0,0,0
L3060:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 172 ---
LastPiece.add:	fn_link  L3164
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 173 ---
L3072:	fn_link  L3084
	fn_link  L3108
	fn_combi_t8 4, 0,3,2,1,0,0
L3084:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3108:	fn_y
# --- block 174 ---
L3112:	fn_link  L3124
	fn_link  L3148
	fn_combi_t36 6, 5,0,3,2,1,4
L3124:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3148:	fn_y
# --- block 175 ---
L3152:	fn_link  L3072
	fn_link  L3112
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 176 ---
L3164:	fn_link  L3152
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 177 ---
LastPiece.next:	fn_link  L3180
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 178 ---
L3180:	fn_link  L3192
	fn_link  L3216
	fn_combi_t17 5, 4,2,0,3,1,0
L3192:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3216:	fn_y
# --- block 179 ---
LastPiece.flipS:	fn_link  L3232
	fn_link  L3236
	fn_combi_t2 3, 2,0,1,0,0,0
L3232:	fn_combi_t0 2, 0,0,0,0,0,0
L3236:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 180 ---
LastPiece.pickOne:	fn_link  L3252
	fn_link  L3308
	fn_y
L3252:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 181 ---
L3256:	fn_link  L3264
	fn_combi_t7 4, 1,0,2,3,0,0
L3264:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 182 ---
L3268:	fn_link  L3276
	fn_combi_t44 5, 0,1,4,2,3,4
L3276:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 183 ---
L3280:	fn_link  L3268
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 184 ---
L3288:	fn_link  L3256
	fn_link  L3304
	fn_link  L3280
	fn_combi_t38 5, 0,1,4,3,2,4
L3304:	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 185 ---
L3308:	fn_link  L3288
	fn_link  L3320
	fn_combi_t16 5, 4,0,1,2,3,0
L3320:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 186 ---
LastPiece.initialBoard:	fn_link  L3444
	fn_elink LastPiece.fromJustB
# --- block 187 ---
L3332:	fn_link  L3344
	fn_link  L3352
	fn_combi_t2 3, 2,0,1,0,0,0
L3344:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3352:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 188 ---
L3360:	fn_link  L3372
	fn_link  L3332
	fn_combi_t2 4, 3,0,1,0,0,0
L3372:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 189 ---
L3376:	fn_link  L3388
	fn_link  L3396
	fn_combi_t2 3, 2,0,1,0,0,0
L3388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3396:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 190 ---
L3404:	fn_link  L3360
	fn_link  L3376
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 191 ---
L3416:	fn_link  L3428
	fn_link  L3436
	fn_combi_t2 3, 2,0,1,0,0,0
L3428:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3436:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 192 ---
L3444:	fn_link  L3404
	fn_link  L3464
	fn_link  L3416
	fn_link  LastPiece.Tip
	fn_elink LastPiece.fit
L3464:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 193 ---
LastPiece.fromJustB:	fn_link  L3484
	fn_link  L3488
	fn_combi_t2 3, 2,0,1,0,0,0
L3484:	fn_combi_t0 1, 0,0,0,0,0,0
L3488:	fn_elink _error0
# --- block 194 ---
LastPiece.Tip:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 195 ---
LastPiece.takeP:	fn_link  L3512
	fn_link  L3560
	fn_link  L3576
	fn_combi_t24 5, 0,1,3,3,4,2
L3512:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 196 ---
L3516:	fn_link  L3532
	fn_link  L3556
	fn_link  LastPiece.takeP
	fn_combi_t8 4, 0,1,3,2,0,0
L3532:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3556:	fn_y
# --- block 197 ---
L3560:	fn_link  L3516
	fn_link  L3572
	fn_combi_t16 5, 0,3,1,2,4,0
L3572:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 198 ---
L3576:	fn_link  L3592
	fn_link  L3596
	fn_link  L3600
	fn_combi_t44 6, 0,4,1,5,2,3
L3592:	fn_combi_t0 2, 0,0,0,0,0,0
L3596:	fn_elink _prim_le
L3600:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 199 ---
LastPiece.initialPieces:	fn_link  L3756
	fn_link  LastPiece.bPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 200 ---
L3620:	fn_link  L3632
	fn_link  LastPiece.nPiece
	fn_combi_t2 4, 3,0,1,0,0,0
L3632:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 201 ---
L3636:	fn_link  L3620
	fn_link  LastPiece.mPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 202 ---
L3648:	fn_link  L3636
	fn_link  LastPiece.lPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 203 ---
L3660:	fn_link  L3648
	fn_link  LastPiece.kPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 204 ---
L3672:	fn_link  L3660
	fn_link  LastPiece.jPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 205 ---
L3684:	fn_link  L3672
	fn_link  LastPiece.iPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 206 ---
L3696:	fn_link  L3684
	fn_link  LastPiece.hPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 207 ---
L3708:	fn_link  L3696
	fn_link  LastPiece.gPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 208 ---
L3720:	fn_link  L3708
	fn_link  LastPiece.fPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 209 ---
L3732:	fn_link  L3720
	fn_link  LastPiece.ePiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 210 ---
L3744:	fn_link  L3732
	fn_link  LastPiece.dPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 211 ---
L3756:	fn_link  L3744
	fn_link  LastPiece.cPiece
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 212 ---
LastPiece.bPiece:	fn_link  L3916
	fn_link  L4368
	fn_link  L3784
	fn_combi_t4 4, 3,0,1,2,0,0
L3784:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 213 ---
L3792:	fn_link  L3804
	fn_link  L3812
	fn_combi_t2 3, 2,0,1,0,0,0
L3804:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L3812:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 214 ---
L3820:	fn_link  L3832
	fn_link  L3792
	fn_combi_t2 4, 3,0,1,0,0,0
L3832:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 215 ---
L3836:	fn_link  L3848
	fn_link  L3856
	fn_combi_t2 3, 2,0,1,0,0,0
L3848:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3856:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 216 ---
L3864:	fn_link  L3820
	fn_link  L3836
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 217 ---
L3876:	fn_link  L3888
	fn_link  L3896
	fn_combi_t2 3, 2,0,1,0,0,0
L3888:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3896:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 218 ---
L3904:	fn_link  L3864
	fn_link  L3876
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 219 ---
L3916:	fn_link  L3928
	fn_link  L3904
	fn_combi_t2 4, 3,0,1,0,0,0
L3928:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 220 ---
L3932:	fn_link  L3944
	fn_link  L3952
	fn_combi_t2 3, 2,0,1,0,0,0
L3944:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3952:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 221 ---
L3960:	fn_link  L3972
	fn_link  L3932
	fn_combi_t2 4, 3,0,1,0,0,0
L3972:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 222 ---
L3976:	fn_link  L3988
	fn_link  L3996
	fn_combi_t2 3, 2,0,1,0,0,0
L3988:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3996:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 223 ---
L4004:	fn_link  L3960
	fn_link  L3976
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 224 ---
L4016:	fn_link  L4028
	fn_link  L4036
	fn_combi_t2 3, 2,0,1,0,0,0
L4028:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4036:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 225 ---
L4044:	fn_link  L4004
	fn_link  L4016
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 226 ---
L4056:	fn_link  L4068
	fn_link  L4044
	fn_combi_t2 4, 3,0,1,0,0,0
L4068:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 227 ---
L4072:	fn_link  L4092
	fn_link  L4116
	fn_link  L4124
	fn_link  L4128
	fn_combi_t17 5, 4,0,1,2,3,0
L4092:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4116:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4124:	fn_y
L4128:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 228 ---
L4136:	fn_link  L4148
	fn_link  L4072
	fn_combi_t2 4, 3,0,1,0,0,0
L4148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 229 ---
L4152:	fn_link  L4164
	fn_link  L4172
	fn_combi_t2 3, 2,0,1,0,0,0
L4164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4172:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 230 ---
L4180:	fn_link  L4136
	fn_link  L4152
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 231 ---
L4192:	fn_link  L4204
	fn_link  L4212
	fn_combi_t2 3, 2,0,1,0,0,0
L4204:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4212:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 232 ---
L4220:	fn_link  L4180
	fn_link  L4192
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 233 ---
L4232:	fn_link  L4056
	fn_link  L4220
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 234 ---
L4244:	fn_link  L4256
	fn_link  L4264
	fn_combi_t2 3, 2,0,1,0,0,0
L4256:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4264:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 235 ---
L4272:	fn_link  L4284
	fn_link  L4244
	fn_combi_t2 4, 3,0,1,0,0,0
L4284:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 236 ---
L4288:	fn_link  L4300
	fn_link  L4308
	fn_combi_t2 3, 2,0,1,0,0,0
L4300:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4308:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 237 ---
L4316:	fn_link  L4272
	fn_link  L4288
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 238 ---
L4328:	fn_link  L4340
	fn_link  L4348
	fn_combi_t2 3, 2,0,1,0,0,0
L4340:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4348:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 239 ---
L4356:	fn_link  L4316
	fn_link  L4328
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 240 ---
L4368:	fn_link  L4232
	fn_link  L4356
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 241 ---
LastPiece.cPiece:	fn_link  L5016
	fn_link  L4396
	fn_link  L4400
	fn_combi_t4 4, 3,0,1,2,0,0
L4396:	fn_combi_t0 2, 0,0,0,0,0,0
L4400:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 242 ---
L4408:	fn_link  L4420
	fn_link  L4428
	fn_combi_t2 3, 2,0,1,0,0,0
L4420:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4428:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 243 ---
L4436:	fn_link  L4448
	fn_link  L4408
	fn_combi_t2 4, 3,0,1,0,0,0
L4448:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 244 ---
L4452:	fn_link  L4464
	fn_link  L4472
	fn_combi_t2 3, 2,0,1,0,0,0
L4464:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4472:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 245 ---
L4480:	fn_link  L4436
	fn_link  L4452
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 246 ---
L4492:	fn_link  L4504
	fn_link  L4512
	fn_combi_t2 3, 2,0,1,0,0,0
L4504:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4512:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 247 ---
L4520:	fn_link  L4480
	fn_link  L4492
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 248 ---
L4532:	fn_link  L4544
	fn_link  L4520
	fn_combi_t2 4, 3,0,1,0,0,0
L4544:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 249 ---
L4548:	fn_link  L4560
	fn_link  L4568
	fn_combi_t2 3, 2,0,1,0,0,0
L4560:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4568:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 250 ---
L4576:	fn_link  L4588
	fn_link  L4548
	fn_combi_t2 4, 3,0,1,0,0,0
L4588:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 251 ---
L4592:	fn_link  L4604
	fn_link  L4612
	fn_combi_t2 3, 2,0,1,0,0,0
L4604:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4612:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 252 ---
L4620:	fn_link  L4576
	fn_link  L4592
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 253 ---
L4632:	fn_link  L4652
	fn_link  L4676
	fn_link  L4684
	fn_link  L4688
	fn_combi_t17 5, 4,0,1,2,3,0
L4652:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4684:	fn_y
L4688:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 254 ---
L4696:	fn_link  L4620
	fn_link  L4632
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 255 ---
L4708:	fn_link  L4532
	fn_link  L4696
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 256 ---
L4720:	fn_link  L4732
	fn_link  L4740
	fn_combi_t2 3, 2,0,1,0,0,0
L4732:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4740:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 257 ---
L4748:	fn_link  L4760
	fn_link  L4720
	fn_combi_t2 4, 3,0,1,0,0,0
L4760:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 258 ---
L4764:	fn_link  L4784
	fn_link  L4808
	fn_link  L4816
	fn_link  L4820
	fn_combi_t17 5, 4,0,1,2,3,0
L4784:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4808:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4816:	fn_y
L4820:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 259 ---
L4828:	fn_link  L4748
	fn_link  L4764
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 260 ---
L4840:	fn_link  L4852
	fn_link  L4860
	fn_combi_t2 3, 2,0,1,0,0,0
L4852:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4860:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 261 ---
L4868:	fn_link  L4828
	fn_link  L4840
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 262 ---
L4880:	fn_link  L4708
	fn_link  L4868
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 263 ---
L4892:	fn_link  L4904
	fn_link  L4912
	fn_combi_t2 3, 2,0,1,0,0,0
L4904:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4912:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 264 ---
L4920:	fn_link  L4932
	fn_link  L4892
	fn_combi_t2 4, 3,0,1,0,0,0
L4932:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 265 ---
L4936:	fn_link  L4948
	fn_link  L4956
	fn_combi_t2 3, 2,0,1,0,0,0
L4948:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4956:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 266 ---
L4964:	fn_link  L4920
	fn_link  L4936
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 267 ---
L4976:	fn_link  L4988
	fn_link  L4996
	fn_combi_t2 3, 2,0,1,0,0,0
L4988:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4996:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 268 ---
L5004:	fn_link  L4964
	fn_link  L4976
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 269 ---
L5016:	fn_link  L4880
	fn_link  L5004
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 270 ---
LastPiece.dPiece:	fn_link  L5176
	fn_link  L5528
	fn_link  L5044
	fn_combi_t4 4, 3,0,1,2,0,0
L5044:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 271 ---
L5052:	fn_link  L5064
	fn_link  L5072
	fn_combi_t2 3, 2,0,1,0,0,0
L5064:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5072:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 272 ---
L5080:	fn_link  L5092
	fn_link  L5052
	fn_combi_t2 4, 3,0,1,0,0,0
L5092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 273 ---
L5096:	fn_link  L5108
	fn_link  L5116
	fn_combi_t2 3, 2,0,1,0,0,0
L5108:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5116:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 274 ---
L5124:	fn_link  L5080
	fn_link  L5096
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 275 ---
L5136:	fn_link  L5148
	fn_link  L5156
	fn_combi_t2 3, 2,0,1,0,0,0
L5148:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5156:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 276 ---
L5164:	fn_link  L5124
	fn_link  L5136
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 277 ---
L5176:	fn_link  L5188
	fn_link  L5164
	fn_combi_t2 4, 3,0,1,0,0,0
L5188:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 278 ---
L5192:	fn_link  L5212
	fn_link  L5236
	fn_link  L5244
	fn_link  L5248
	fn_combi_t17 5, 4,0,1,2,3,0
L5212:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5236:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5244:	fn_y
L5248:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 279 ---
L5256:	fn_link  L5268
	fn_link  L5192
	fn_combi_t2 4, 3,0,1,0,0,0
L5268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 280 ---
L5272:	fn_link  L5292
	fn_link  L5316
	fn_link  L5324
	fn_link  L5328
	fn_combi_t17 5, 4,0,1,2,3,0
L5292:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5316:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5324:	fn_y
L5328:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 281 ---
L5336:	fn_link  L5256
	fn_link  L5272
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 282 ---
L5348:	fn_link  L5360
	fn_link  L5368
	fn_combi_t2 3, 2,0,1,0,0,0
L5360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5368:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 283 ---
L5376:	fn_link  L5336
	fn_link  L5348
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 284 ---
L5388:	fn_link  L5400
	fn_link  L5376
	fn_combi_t2 4, 3,0,1,0,0,0
L5400:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 285 ---
L5404:	fn_link  L5416
	fn_link  L5424
	fn_combi_t2 3, 2,0,1,0,0,0
L5416:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5424:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 286 ---
L5432:	fn_link  L5444
	fn_link  L5404
	fn_combi_t2 4, 3,0,1,0,0,0
L5444:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 287 ---
L5448:	fn_link  L5460
	fn_link  L5468
	fn_combi_t2 3, 2,0,1,0,0,0
L5460:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5468:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 288 ---
L5476:	fn_link  L5432
	fn_link  L5448
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 289 ---
L5488:	fn_link  L5500
	fn_link  L5508
	fn_combi_t2 3, 2,0,1,0,0,0
L5500:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5508:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 290 ---
L5516:	fn_link  L5476
	fn_link  L5488
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 291 ---
L5528:	fn_link  L5388
	fn_link  L5516
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 292 ---
LastPiece.ePiece:	fn_link  L5900
	fn_link  L6248
	fn_link  L5556
	fn_combi_t4 4, 3,0,1,2,0,0
L5556:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 293 ---
L5564:	fn_link  L5584
	fn_link  L5608
	fn_link  L5616
	fn_link  L5620
	fn_combi_t17 5, 4,0,1,2,3,0
L5584:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5608:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5616:	fn_y
L5620:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 294 ---
L5628:	fn_link  L5640
	fn_link  L5564
	fn_combi_t2 4, 3,0,1,0,0,0
L5640:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 295 ---
L5644:	fn_link  L5664
	fn_link  L5688
	fn_link  L5696
	fn_link  L5700
	fn_combi_t17 5, 4,0,1,2,3,0
L5664:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5688:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5696:	fn_y
L5700:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 296 ---
L5708:	fn_link  L5628
	fn_link  L5644
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 297 ---
L5720:	fn_link  L5732
	fn_link  L5740
	fn_combi_t2 3, 2,0,1,0,0,0
L5732:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5740:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 298 ---
L5748:	fn_link  L5708
	fn_link  L5720
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 299 ---
L5760:	fn_link  L5772
	fn_link  L5748
	fn_combi_t2 4, 3,0,1,0,0,0
L5772:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 300 ---
L5776:	fn_link  L5788
	fn_link  L5796
	fn_combi_t2 3, 2,0,1,0,0,0
L5788:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L5796:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 301 ---
L5804:	fn_link  L5816
	fn_link  L5776
	fn_combi_t2 4, 3,0,1,0,0,0
L5816:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 302 ---
L5820:	fn_link  L5832
	fn_link  L5840
	fn_combi_t2 3, 2,0,1,0,0,0
L5832:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5840:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 303 ---
L5848:	fn_link  L5804
	fn_link  L5820
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 304 ---
L5860:	fn_link  L5872
	fn_link  L5880
	fn_combi_t2 3, 2,0,1,0,0,0
L5872:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L5880:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 305 ---
L5888:	fn_link  L5848
	fn_link  L5860
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 306 ---
L5900:	fn_link  L5760
	fn_link  L5888
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 307 ---
L5912:	fn_link  L5932
	fn_link  L5956
	fn_link  L5964
	fn_link  L5968
	fn_combi_t17 5, 4,0,1,2,3,0
L5932:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5956:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5964:	fn_y
L5968:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 308 ---
L5976:	fn_link  L5988
	fn_link  L5912
	fn_combi_t2 4, 3,0,1,0,0,0
L5988:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 309 ---
L5992:	fn_link  L6012
	fn_link  L6036
	fn_link  L6044
	fn_link  L6048
	fn_combi_t17 5, 4,0,1,2,3,0
L6012:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6036:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6044:	fn_y
L6048:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 310 ---
L6056:	fn_link  L5976
	fn_link  L5992
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 311 ---
L6068:	fn_link  L6080
	fn_link  L6088
	fn_combi_t2 3, 2,0,1,0,0,0
L6080:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6088:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 312 ---
L6096:	fn_link  L6056
	fn_link  L6068
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 313 ---
L6108:	fn_link  L6120
	fn_link  L6096
	fn_combi_t2 4, 3,0,1,0,0,0
L6120:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 314 ---
L6124:	fn_link  L6136
	fn_link  L6144
	fn_combi_t2 3, 2,0,1,0,0,0
L6136:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L6144:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 315 ---
L6152:	fn_link  L6164
	fn_link  L6124
	fn_combi_t2 4, 3,0,1,0,0,0
L6164:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 316 ---
L6168:	fn_link  L6180
	fn_link  L6188
	fn_combi_t2 3, 2,0,1,0,0,0
L6180:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6188:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 317 ---
L6196:	fn_link  L6152
	fn_link  L6168
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 318 ---
L6208:	fn_link  L6220
	fn_link  L6228
	fn_combi_t2 3, 2,0,1,0,0,0
L6220:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6228:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 319 ---
L6236:	fn_link  L6196
	fn_link  L6208
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 320 ---
L6248:	fn_link  L6108
	fn_link  L6236
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 321 ---
LastPiece.fPiece:	fn_link  L6448
	fn_link  L7092
	fn_link  L6276
	fn_combi_t4 4, 3,0,1,2,0,0
L6276:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 322 ---
L6284:	fn_link  L6296
	fn_link  L6304
	fn_combi_t2 3, 2,0,1,0,0,0
L6296:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6304:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 323 ---
L6312:	fn_link  L6324
	fn_link  L6284
	fn_combi_t2 4, 3,0,1,0,0,0
L6324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 324 ---
L6328:	fn_link  L6340
	fn_link  L6348
	fn_combi_t2 3, 2,0,1,0,0,0
L6340:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L6348:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 325 ---
L6356:	fn_link  L6312
	fn_link  L6328
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 326 ---
L6368:	fn_link  L6380
	fn_link  L6388
	fn_combi_t2 3, 2,0,1,0,0,0
L6380:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L6388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 327 ---
L6396:	fn_link  L6356
	fn_link  L6368
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 328 ---
L6408:	fn_link  L6420
	fn_link  L6428
	fn_combi_t2 3, 2,0,1,0,0,0
L6420:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6428:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 329 ---
L6436:	fn_link  L6396
	fn_link  L6408
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 330 ---
L6448:	fn_link  L6460
	fn_link  L6436
	fn_combi_t2 4, 3,0,1,0,0,0
L6460:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 331 ---
L6464:	fn_link  L6476
	fn_link  L6484
	fn_combi_t2 3, 2,0,1,0,0,0
L6476:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6484:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 332 ---
L6492:	fn_link  L6504
	fn_link  L6464
	fn_combi_t2 4, 3,0,1,0,0,0
L6504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 333 ---
L6508:	fn_link  L6520
	fn_link  L6528
	fn_combi_t2 3, 2,0,1,0,0,0
L6520:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6528:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 334 ---
L6536:	fn_link  L6492
	fn_link  L6508
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 335 ---
L6548:	fn_link  L6560
	fn_link  L6568
	fn_combi_t2 3, 2,0,1,0,0,0
L6560:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6568:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 336 ---
L6576:	fn_link  L6536
	fn_link  L6548
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 337 ---
L6588:	fn_link  L6600
	fn_link  L6608
	fn_combi_t2 3, 2,0,1,0,0,0
L6600:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6608:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 338 ---
L6616:	fn_link  L6576
	fn_link  L6588
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 339 ---
L6628:	fn_link  L6640
	fn_link  L6616
	fn_combi_t2 4, 3,0,1,0,0,0
L6640:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 340 ---
L6644:	fn_link  L6664
	fn_link  L6688
	fn_link  L6696
	fn_link  L6700
	fn_combi_t17 5, 4,0,1,2,3,0
L6664:	fn_force
	fn_tor a0
	addiw a0,a0,-3
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6688:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6696:	fn_y
L6700:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 341 ---
L6708:	fn_link  L6720
	fn_link  L6644
	fn_combi_t2 4, 3,0,1,0,0,0
L6720:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 342 ---
L6724:	fn_link  L6744
	fn_link  L6768
	fn_link  L6776
	fn_link  L6780
	fn_combi_t17 5, 4,0,1,2,3,0
L6744:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6768:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6776:	fn_y
L6780:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 343 ---
L6788:	fn_link  L6708
	fn_link  L6724
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 344 ---
L6800:	fn_link  L6820
	fn_link  L6844
	fn_link  L6852
	fn_link  L6856
	fn_combi_t17 5, 4,0,1,2,3,0
L6820:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6844:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6852:	fn_y
L6856:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 345 ---
L6864:	fn_link  L6788
	fn_link  L6800
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 346 ---
L6876:	fn_link  L6888
	fn_link  L6896
	fn_combi_t2 3, 2,0,1,0,0,0
L6888:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6896:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 347 ---
L6904:	fn_link  L6864
	fn_link  L6876
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 348 ---
L6916:	fn_link  L6628
	fn_link  L6904
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 349 ---
L6928:	fn_link  L6940
	fn_link  L6948
	fn_combi_t2 3, 2,0,1,0,0,0
L6940:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6948:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 350 ---
L6956:	fn_link  L6968
	fn_link  L6928
	fn_combi_t2 4, 3,0,1,0,0,0
L6968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 351 ---
L6972:	fn_link  L6984
	fn_link  L6992
	fn_combi_t2 3, 2,0,1,0,0,0
L6984:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6992:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 352 ---
L7000:	fn_link  L6956
	fn_link  L6972
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 353 ---
L7012:	fn_link  L7024
	fn_link  L7032
	fn_combi_t2 3, 2,0,1,0,0,0
L7024:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7032:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 354 ---
L7040:	fn_link  L7000
	fn_link  L7012
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 355 ---
L7052:	fn_link  L7064
	fn_link  L7072
	fn_combi_t2 3, 2,0,1,0,0,0
L7064:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7072:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 356 ---
L7080:	fn_link  L7040
	fn_link  L7052
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 357 ---
L7092:	fn_link  L6916
	fn_link  L7080
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 358 ---
LastPiece.gPiece:	fn_link  L8008
	fn_link  L7120
	fn_link  L7124
	fn_combi_t4 4, 3,0,1,2,0,0
L7120:	fn_combi_t0 2, 0,0,0,0,0,0
L7124:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 359 ---
L7132:	fn_link  L7152
	fn_link  L7176
	fn_link  L7184
	fn_link  L7188
	fn_combi_t17 5, 4,0,1,2,3,0
L7152:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7176:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7184:	fn_y
L7188:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 360 ---
L7196:	fn_link  L7208
	fn_link  L7132
	fn_combi_t2 4, 3,0,1,0,0,0
L7208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 361 ---
L7212:	fn_link  L7232
	fn_link  L7256
	fn_link  L7264
	fn_link  L7268
	fn_combi_t17 5, 4,0,1,2,3,0
L7232:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7264:	fn_y
L7268:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 362 ---
L7276:	fn_link  L7196
	fn_link  L7212
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 363 ---
L7288:	fn_link  L7300
	fn_link  L7308
	fn_combi_t2 3, 2,0,1,0,0,0
L7300:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7308:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 364 ---
L7316:	fn_link  L7276
	fn_link  L7288
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 365 ---
L7328:	fn_link  L7340
	fn_link  L7348
	fn_combi_t2 3, 2,0,1,0,0,0
L7340:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7348:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 366 ---
L7356:	fn_link  L7316
	fn_link  L7328
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 367 ---
L7368:	fn_link  L7380
	fn_link  L7356
	fn_combi_t2 4, 3,0,1,0,0,0
L7380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 368 ---
L7384:	fn_link  L7396
	fn_link  L7404
	fn_combi_t2 3, 2,0,1,0,0,0
L7396:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L7404:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 369 ---
L7412:	fn_link  L7424
	fn_link  L7384
	fn_combi_t2 4, 3,0,1,0,0,0
L7424:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 370 ---
L7428:	fn_link  L7440
	fn_link  L7448
	fn_combi_t2 3, 2,0,1,0,0,0
L7440:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7448:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 371 ---
L7456:	fn_link  L7412
	fn_link  L7428
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 372 ---
L7468:	fn_link  L7480
	fn_link  L7488
	fn_combi_t2 3, 2,0,1,0,0,0
L7480:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7488:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 373 ---
L7496:	fn_link  L7456
	fn_link  L7468
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 374 ---
L7508:	fn_link  L7520
	fn_link  L7528
	fn_combi_t2 3, 2,0,1,0,0,0
L7520:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7528:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 375 ---
L7536:	fn_link  L7496
	fn_link  L7508
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 376 ---
L7548:	fn_link  L7368
	fn_link  L7536
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 377 ---
L7560:	fn_link  L7580
	fn_link  L7604
	fn_link  L7612
	fn_link  L7616
	fn_combi_t17 5, 4,0,1,2,3,0
L7580:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7604:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7612:	fn_y
L7616:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 378 ---
L7624:	fn_link  L7636
	fn_link  L7560
	fn_combi_t2 4, 3,0,1,0,0,0
L7636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 379 ---
L7640:	fn_link  L7660
	fn_link  L7684
	fn_link  L7692
	fn_link  L7696
	fn_combi_t17 5, 4,0,1,2,3,0
L7660:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7684:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7692:	fn_y
L7696:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 380 ---
L7704:	fn_link  L7624
	fn_link  L7640
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 381 ---
L7716:	fn_link  L7736
	fn_link  L7760
	fn_link  L7768
	fn_link  L7772
	fn_combi_t17 5, 4,0,1,2,3,0
L7736:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7760:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7768:	fn_y
L7772:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 382 ---
L7780:	fn_link  L7704
	fn_link  L7716
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 383 ---
L7792:	fn_link  L7804
	fn_link  L7812
	fn_combi_t2 3, 2,0,1,0,0,0
L7804:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7812:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 384 ---
L7820:	fn_link  L7780
	fn_link  L7792
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 385 ---
L7832:	fn_link  L7548
	fn_link  L7820
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 386 ---
L7844:	fn_link  L7856
	fn_link  L7864
	fn_combi_t2 3, 2,0,1,0,0,0
L7856:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L7864:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 387 ---
L7872:	fn_link  L7884
	fn_link  L7844
	fn_combi_t2 4, 3,0,1,0,0,0
L7884:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 388 ---
L7888:	fn_link  L7900
	fn_link  L7908
	fn_combi_t2 3, 2,0,1,0,0,0
L7900:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7908:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 389 ---
L7916:	fn_link  L7872
	fn_link  L7888
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 390 ---
L7928:	fn_link  L7940
	fn_link  L7948
	fn_combi_t2 3, 2,0,1,0,0,0
L7940:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7948:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 391 ---
L7956:	fn_link  L7916
	fn_link  L7928
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 392 ---
L7968:	fn_link  L7980
	fn_link  L7988
	fn_combi_t2 3, 2,0,1,0,0,0
L7980:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7988:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 393 ---
L7996:	fn_link  L7956
	fn_link  L7968
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 394 ---
L8008:	fn_link  L7832
	fn_link  L7996
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 395 ---
LastPiece.hPiece:	fn_link  L8280
	fn_link  L8924
	fn_link  L8036
	fn_combi_t4 4, 3,0,1,2,0,0
L8036:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 396 ---
L8044:	fn_link  L8064
	fn_link  L8088
	fn_link  L8096
	fn_link  L8100
	fn_combi_t17 5, 4,0,1,2,3,0
L8064:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L8088:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8096:	fn_y
L8100:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 397 ---
L8108:	fn_link  L8120
	fn_link  L8044
	fn_combi_t2 4, 3,0,1,0,0,0
L8120:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 398 ---
L8124:	fn_link  L8144
	fn_link  L8168
	fn_link  L8176
	fn_link  L8180
	fn_combi_t17 5, 4,0,1,2,3,0
L8144:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L8168:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8176:	fn_y
L8180:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 399 ---
L8188:	fn_link  L8108
	fn_link  L8124
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 400 ---
L8200:	fn_link  L8212
	fn_link  L8220
	fn_combi_t2 3, 2,0,1,0,0,0
L8212:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8220:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 401 ---
L8228:	fn_link  L8188
	fn_link  L8200
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 402 ---
L8240:	fn_link  L8252
	fn_link  L8260
	fn_combi_t2 3, 2,0,1,0,0,0
L8252:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8260:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 403 ---
L8268:	fn_link  L8228
	fn_link  L8240
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 404 ---
L8280:	fn_link  L8292
	fn_link  L8268
	fn_combi_t2 4, 3,0,1,0,0,0
L8292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 405 ---
L8296:	fn_link  L8308
	fn_link  L8316
	fn_combi_t2 3, 2,0,1,0,0,0
L8308:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L8316:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 406 ---
L8324:	fn_link  L8336
	fn_link  L8296
	fn_combi_t2 4, 3,0,1,0,0,0
L8336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 407 ---
L8340:	fn_link  L8352
	fn_link  L8360
	fn_combi_t2 3, 2,0,1,0,0,0
L8352:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8360:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 408 ---
L8368:	fn_link  L8324
	fn_link  L8340
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 409 ---
L8380:	fn_link  L8392
	fn_link  L8400
	fn_combi_t2 3, 2,0,1,0,0,0
L8392:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8400:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 410 ---
L8408:	fn_link  L8368
	fn_link  L8380
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 411 ---
L8420:	fn_link  L8432
	fn_link  L8440
	fn_combi_t2 3, 2,0,1,0,0,0
L8432:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8440:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 412 ---
L8448:	fn_link  L8408
	fn_link  L8420
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 413 ---
L8460:	fn_link  L8472
	fn_link  L8448
	fn_combi_t2 4, 3,0,1,0,0,0
L8472:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 414 ---
L8476:	fn_link  L8496
	fn_link  L8520
	fn_link  L8528
	fn_link  L8532
	fn_combi_t17 5, 4,0,1,2,3,0
L8496:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L8520:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8528:	fn_y
L8532:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 415 ---
L8540:	fn_link  L8552
	fn_link  L8476
	fn_combi_t2 4, 3,0,1,0,0,0
L8552:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 416 ---
L8556:	fn_link  L8576
	fn_link  L8600
	fn_link  L8608
	fn_link  L8612
	fn_combi_t17 5, 4,0,1,2,3,0
L8576:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L8600:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8608:	fn_y
L8612:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 417 ---
L8620:	fn_link  L8540
	fn_link  L8556
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 418 ---
L8632:	fn_link  L8652
	fn_link  L8676
	fn_link  L8684
	fn_link  L8688
	fn_combi_t17 5, 4,0,1,2,3,0
L8652:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L8676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8684:	fn_y
L8688:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 419 ---
L8696:	fn_link  L8620
	fn_link  L8632
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 420 ---
L8708:	fn_link  L8720
	fn_link  L8728
	fn_combi_t2 3, 2,0,1,0,0,0
L8720:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8728:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 421 ---
L8736:	fn_link  L8696
	fn_link  L8708
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 422 ---
L8748:	fn_link  L8460
	fn_link  L8736
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 423 ---
L8760:	fn_link  L8772
	fn_link  L8780
	fn_combi_t2 3, 2,0,1,0,0,0
L8772:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L8780:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 424 ---
L8788:	fn_link  L8800
	fn_link  L8760
	fn_combi_t2 4, 3,0,1,0,0,0
L8800:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 425 ---
L8804:	fn_link  L8816
	fn_link  L8824
	fn_combi_t2 3, 2,0,1,0,0,0
L8816:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L8824:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 426 ---
L8832:	fn_link  L8788
	fn_link  L8804
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 427 ---
L8844:	fn_link  L8856
	fn_link  L8864
	fn_combi_t2 3, 2,0,1,0,0,0
L8856:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8864:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 428 ---
L8872:	fn_link  L8832
	fn_link  L8844
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 429 ---
L8884:	fn_link  L8896
	fn_link  L8904
	fn_combi_t2 3, 2,0,1,0,0,0
L8896:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8904:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 430 ---
L8912:	fn_link  L8872
	fn_link  L8884
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 431 ---
L8924:	fn_link  L8748
	fn_link  L8912
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 432 ---
LastPiece.iPiece:	fn_link  L9196
	fn_link  L9768
	fn_link  L8952
	fn_combi_t4 4, 3,0,1,2,0,0
L8952:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 433 ---
L8960:	fn_link  L8980
	fn_link  L9004
	fn_link  L9012
	fn_link  L9016
	fn_combi_t17 5, 4,0,1,2,3,0
L8980:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L9004:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9012:	fn_y
L9016:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 434 ---
L9024:	fn_link  L9036
	fn_link  L8960
	fn_combi_t2 4, 3,0,1,0,0,0
L9036:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 435 ---
L9040:	fn_link  L9060
	fn_link  L9084
	fn_link  L9092
	fn_link  L9096
	fn_combi_t17 5, 4,0,1,2,3,0
L9060:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L9084:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9092:	fn_y
L9096:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 436 ---
L9104:	fn_link  L9024
	fn_link  L9040
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 437 ---
L9116:	fn_link  L9128
	fn_link  L9136
	fn_combi_t2 3, 2,0,1,0,0,0
L9128:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9136:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 438 ---
L9144:	fn_link  L9104
	fn_link  L9116
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 439 ---
L9156:	fn_link  L9168
	fn_link  L9176
	fn_combi_t2 3, 2,0,1,0,0,0
L9168:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9176:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 440 ---
L9184:	fn_link  L9144
	fn_link  L9156
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 441 ---
L9196:	fn_link  L9208
	fn_link  L9184
	fn_combi_t2 4, 3,0,1,0,0,0
L9208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 442 ---
L9212:	fn_link  L9224
	fn_link  L9232
	fn_combi_t2 3, 2,0,1,0,0,0
L9224:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9232:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 443 ---
L9240:	fn_link  L9252
	fn_link  L9212
	fn_combi_t2 4, 3,0,1,0,0,0
L9252:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 444 ---
L9256:	fn_link  L9268
	fn_link  L9276
	fn_combi_t2 3, 2,0,1,0,0,0
L9268:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9276:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 445 ---
L9284:	fn_link  L9240
	fn_link  L9256
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 446 ---
L9296:	fn_link  L9308
	fn_link  L9316
	fn_combi_t2 3, 2,0,1,0,0,0
L9308:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9316:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 447 ---
L9324:	fn_link  L9284
	fn_link  L9296
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 448 ---
L9336:	fn_link  L9348
	fn_link  L9356
	fn_combi_t2 3, 2,0,1,0,0,0
L9348:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9356:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 449 ---
L9364:	fn_link  L9324
	fn_link  L9336
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 450 ---
L9376:	fn_link  L9388
	fn_link  L9364
	fn_combi_t2 4, 3,0,1,0,0,0
L9388:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 451 ---
L9392:	fn_link  L9412
	fn_link  L9436
	fn_link  L9444
	fn_link  L9448
	fn_combi_t17 5, 4,0,1,2,3,0
L9412:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L9436:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9444:	fn_y
L9448:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 452 ---
L9456:	fn_link  L9468
	fn_link  L9392
	fn_combi_t2 4, 3,0,1,0,0,0
L9468:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 453 ---
L9472:	fn_link  L9484
	fn_link  L9492
	fn_combi_t2 3, 2,0,1,0,0,0
L9484:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9492:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 454 ---
L9500:	fn_link  L9456
	fn_link  L9472
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 455 ---
L9512:	fn_link  L9524
	fn_link  L9532
	fn_combi_t2 3, 2,0,1,0,0,0
L9524:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9532:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 456 ---
L9540:	fn_link  L9500
	fn_link  L9512
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 457 ---
L9552:	fn_link  L9564
	fn_link  L9572
	fn_combi_t2 3, 2,0,1,0,0,0
L9564:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9572:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 458 ---
L9580:	fn_link  L9540
	fn_link  L9552
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 459 ---
L9592:	fn_link  L9376
	fn_link  L9580
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 460 ---
L9604:	fn_link  L9616
	fn_link  L9624
	fn_combi_t2 3, 2,0,1,0,0,0
L9616:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9624:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 461 ---
L9632:	fn_link  L9644
	fn_link  L9604
	fn_combi_t2 4, 3,0,1,0,0,0
L9644:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 462 ---
L9648:	fn_link  L9660
	fn_link  L9668
	fn_combi_t2 3, 2,0,1,0,0,0
L9660:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9668:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 463 ---
L9676:	fn_link  L9632
	fn_link  L9648
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 464 ---
L9688:	fn_link  L9700
	fn_link  L9708
	fn_combi_t2 3, 2,0,1,0,0,0
L9700:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9708:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 465 ---
L9716:	fn_link  L9676
	fn_link  L9688
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 466 ---
L9728:	fn_link  L9740
	fn_link  L9748
	fn_combi_t2 3, 2,0,1,0,0,0
L9740:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9748:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 467 ---
L9756:	fn_link  L9716
	fn_link  L9728
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 468 ---
L9768:	fn_link  L9592
	fn_link  L9756
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 469 ---
LastPiece.jPiece:	fn_link  L9968
	fn_link  L10612
	fn_link  L9796
	fn_combi_t4 4, 3,0,1,2,0,0
L9796:	fn_box
	.word 0x0000006a	# raw word 106
	fn_box_body
# --- block 470 ---
L9804:	fn_link  L9816
	fn_link  L9824
	fn_combi_t2 3, 2,0,1,0,0,0
L9816:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9824:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 471 ---
L9832:	fn_link  L9844
	fn_link  L9804
	fn_combi_t2 4, 3,0,1,0,0,0
L9844:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 472 ---
L9848:	fn_link  L9860
	fn_link  L9868
	fn_combi_t2 3, 2,0,1,0,0,0
L9860:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9868:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 473 ---
L9876:	fn_link  L9832
	fn_link  L9848
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 474 ---
L9888:	fn_link  L9900
	fn_link  L9908
	fn_combi_t2 3, 2,0,1,0,0,0
L9900:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9908:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 475 ---
L9916:	fn_link  L9876
	fn_link  L9888
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 476 ---
L9928:	fn_link  L9940
	fn_link  L9948
	fn_combi_t2 3, 2,0,1,0,0,0
L9940:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9948:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 477 ---
L9956:	fn_link  L9916
	fn_link  L9928
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 478 ---
L9968:	fn_link  L9980
	fn_link  L9956
	fn_combi_t2 4, 3,0,1,0,0,0
L9980:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 479 ---
L9984:	fn_link  L9996
	fn_link  L10004
	fn_combi_t2 3, 2,0,1,0,0,0
L9996:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10004:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 480 ---
L10012:	fn_link  L10024
	fn_link  L9984
	fn_combi_t2 4, 3,0,1,0,0,0
L10024:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 481 ---
L10028:	fn_link  L10040
	fn_link  L10048
	fn_combi_t2 3, 2,0,1,0,0,0
L10040:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10048:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 482 ---
L10056:	fn_link  L10012
	fn_link  L10028
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 483 ---
L10068:	fn_link  L10088
	fn_link  L10112
	fn_link  L10120
	fn_link  L10124
	fn_combi_t17 5, 4,0,1,2,3,0
L10088:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10120:	fn_y
L10124:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 484 ---
L10132:	fn_link  L10056
	fn_link  L10068
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 485 ---
L10144:	fn_link  L10164
	fn_link  L10188
	fn_link  L10196
	fn_link  L10200
	fn_combi_t17 5, 4,0,1,2,3,0
L10164:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10196:	fn_y
L10200:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 486 ---
L10208:	fn_link  L10132
	fn_link  L10144
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 487 ---
L10220:	fn_link  L10232
	fn_link  L10208
	fn_combi_t2 4, 3,0,1,0,0,0
L10232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 488 ---
L10236:	fn_link  L10256
	fn_link  L10280
	fn_link  L10288
	fn_link  L10292
	fn_combi_t17 5, 4,0,1,2,3,0
L10256:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10288:	fn_y
L10292:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 489 ---
L10300:	fn_link  L10312
	fn_link  L10236
	fn_combi_t2 4, 3,0,1,0,0,0
L10312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 490 ---
L10316:	fn_link  L10328
	fn_link  L10336
	fn_combi_t2 3, 2,0,1,0,0,0
L10328:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10336:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 491 ---
L10344:	fn_link  L10300
	fn_link  L10316
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 492 ---
L10356:	fn_link  L10368
	fn_link  L10376
	fn_combi_t2 3, 2,0,1,0,0,0
L10368:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10376:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 493 ---
L10384:	fn_link  L10344
	fn_link  L10356
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 494 ---
L10396:	fn_link  L10408
	fn_link  L10416
	fn_combi_t2 3, 2,0,1,0,0,0
L10408:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10416:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 495 ---
L10424:	fn_link  L10384
	fn_link  L10396
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 496 ---
L10436:	fn_link  L10220
	fn_link  L10424
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 497 ---
L10448:	fn_link  L10460
	fn_link  L10468
	fn_combi_t2 3, 2,0,1,0,0,0
L10460:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10468:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 498 ---
L10476:	fn_link  L10488
	fn_link  L10448
	fn_combi_t2 4, 3,0,1,0,0,0
L10488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 499 ---
L10492:	fn_link  L10504
	fn_link  L10512
	fn_combi_t2 3, 2,0,1,0,0,0
L10504:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L10512:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 500 ---
L10520:	fn_link  L10476
	fn_link  L10492
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 501 ---
L10532:	fn_link  L10544
	fn_link  L10552
	fn_combi_t2 3, 2,0,1,0,0,0
L10544:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10552:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 502 ---
L10560:	fn_link  L10520
	fn_link  L10532
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 503 ---
L10572:	fn_link  L10584
	fn_link  L10592
	fn_combi_t2 3, 2,0,1,0,0,0
L10584:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10592:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 504 ---
L10600:	fn_link  L10560
	fn_link  L10572
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 505 ---
L10612:	fn_link  L10436
	fn_link  L10600
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 506 ---
LastPiece.kPiece:	fn_link  L10812
	fn_link  L11028
	fn_link  L10640
	fn_combi_t4 4, 3,0,1,2,0,0
L10640:	fn_box
	.word 0x0000006b	# raw word 107
	fn_box_body
# --- block 507 ---
L10648:	fn_link  L10660
	fn_link  L10668
	fn_combi_t2 3, 2,0,1,0,0,0
L10660:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10668:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 508 ---
L10676:	fn_link  L10688
	fn_link  L10648
	fn_combi_t2 4, 3,0,1,0,0,0
L10688:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 509 ---
L10692:	fn_link  L10704
	fn_link  L10712
	fn_combi_t2 3, 2,0,1,0,0,0
L10704:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10712:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 510 ---
L10720:	fn_link  L10676
	fn_link  L10692
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 511 ---
L10732:	fn_link  L10744
	fn_link  L10752
	fn_combi_t2 3, 2,0,1,0,0,0
L10744:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10752:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 512 ---
L10760:	fn_link  L10720
	fn_link  L10732
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 513 ---
L10772:	fn_link  L10784
	fn_link  L10792
	fn_combi_t2 3, 2,0,1,0,0,0
L10784:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10792:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 514 ---
L10800:	fn_link  L10760
	fn_link  L10772
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 515 ---
L10812:	fn_link  L10824
	fn_link  L10800
	fn_combi_t2 4, 3,0,1,0,0,0
L10824:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 516 ---
L10828:	fn_link  L10848
	fn_link  L10872
	fn_link  L10880
	fn_link  L10884
	fn_combi_t17 5, 4,0,1,2,3,0
L10848:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10872:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10880:	fn_y
L10884:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 517 ---
L10892:	fn_link  L10904
	fn_link  L10828
	fn_combi_t2 4, 3,0,1,0,0,0
L10904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 518 ---
L10908:	fn_link  L10920
	fn_link  L10928
	fn_combi_t2 3, 2,0,1,0,0,0
L10920:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10928:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 519 ---
L10936:	fn_link  L10892
	fn_link  L10908
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 520 ---
L10948:	fn_link  L10960
	fn_link  L10968
	fn_combi_t2 3, 2,0,1,0,0,0
L10960:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10968:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 521 ---
L10976:	fn_link  L10936
	fn_link  L10948
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 522 ---
L10988:	fn_link  L11000
	fn_link  L11008
	fn_combi_t2 3, 2,0,1,0,0,0
L11000:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L11008:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 523 ---
L11016:	fn_link  L10976
	fn_link  L10988
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 524 ---
L11028:	fn_link  L11040
	fn_link  L11016
	fn_combi_t2 4, 3,0,1,0,0,0
L11040:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 525 ---
LastPiece.lPiece:	fn_link  L11448
	fn_link  L11840
	fn_link  L11060
	fn_combi_t4 4, 3,0,1,2,0,0
L11060:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 526 ---
L11068:	fn_link  L11080
	fn_link  L11088
	fn_combi_t2 3, 2,0,1,0,0,0
L11080:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L11088:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 527 ---
L11096:	fn_link  L11108
	fn_link  L11068
	fn_combi_t2 4, 3,0,1,0,0,0
L11108:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 528 ---
L11112:	fn_link  L11124
	fn_link  L11132
	fn_combi_t2 3, 2,0,1,0,0,0
L11124:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11132:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 529 ---
L11140:	fn_link  L11096
	fn_link  L11112
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 530 ---
L11152:	fn_link  L11164
	fn_link  L11172
	fn_combi_t2 3, 2,0,1,0,0,0
L11164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11172:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 531 ---
L11180:	fn_link  L11140
	fn_link  L11152
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 532 ---
L11192:	fn_link  L11204
	fn_link  L11212
	fn_combi_t2 3, 2,0,1,0,0,0
L11204:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11212:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 533 ---
L11220:	fn_link  L11180
	fn_link  L11192
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 534 ---
L11232:	fn_link  L11244
	fn_link  L11220
	fn_combi_t2 4, 3,0,1,0,0,0
L11244:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 535 ---
L11248:	fn_link  L11260
	fn_link  L11268
	fn_combi_t2 3, 2,0,1,0,0,0
L11260:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L11268:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 536 ---
L11276:	fn_link  L11288
	fn_link  L11248
	fn_combi_t2 4, 3,0,1,0,0,0
L11288:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 537 ---
L11292:	fn_link  L11304
	fn_link  L11312
	fn_combi_t2 3, 2,0,1,0,0,0
L11304:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L11312:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 538 ---
L11320:	fn_link  L11276
	fn_link  L11292
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 539 ---
L11332:	fn_link  L11344
	fn_link  L11352
	fn_combi_t2 3, 2,0,1,0,0,0
L11344:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11352:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 540 ---
L11360:	fn_link  L11320
	fn_link  L11332
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 541 ---
L11372:	fn_link  L11392
	fn_link  L11416
	fn_link  L11424
	fn_link  L11428
	fn_combi_t17 5, 4,0,1,2,3,0
L11392:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L11416:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11424:	fn_y
L11428:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 542 ---
L11436:	fn_link  L11360
	fn_link  L11372
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 543 ---
L11448:	fn_link  L11232
	fn_link  L11436
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 544 ---
L11460:	fn_link  L11480
	fn_link  L11504
	fn_link  L11512
	fn_link  L11516
	fn_combi_t17 5, 4,0,1,2,3,0
L11480:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L11504:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11512:	fn_y
L11516:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 545 ---
L11524:	fn_link  L11536
	fn_link  L11460
	fn_combi_t2 4, 3,0,1,0,0,0
L11536:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 546 ---
L11540:	fn_link  L11552
	fn_link  L11560
	fn_combi_t2 3, 2,0,1,0,0,0
L11552:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11560:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 547 ---
L11568:	fn_link  L11524
	fn_link  L11540
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 548 ---
L11580:	fn_link  L11592
	fn_link  L11600
	fn_combi_t2 3, 2,0,1,0,0,0
L11592:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11600:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 549 ---
L11608:	fn_link  L11568
	fn_link  L11580
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 550 ---
L11620:	fn_link  L11632
	fn_link  L11640
	fn_combi_t2 3, 2,0,1,0,0,0
L11632:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11640:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 551 ---
L11648:	fn_link  L11608
	fn_link  L11620
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 552 ---
L11660:	fn_link  L11672
	fn_link  L11648
	fn_combi_t2 4, 3,0,1,0,0,0
L11672:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 553 ---
L11676:	fn_link  L11688
	fn_link  L11696
	fn_combi_t2 3, 2,0,1,0,0,0
L11688:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L11696:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 554 ---
L11704:	fn_link  L11716
	fn_link  L11676
	fn_combi_t2 4, 3,0,1,0,0,0
L11716:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 555 ---
L11720:	fn_link  L11732
	fn_link  L11740
	fn_combi_t2 3, 2,0,1,0,0,0
L11732:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L11740:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 556 ---
L11748:	fn_link  L11704
	fn_link  L11720
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 557 ---
L11760:	fn_link  L11772
	fn_link  L11780
	fn_combi_t2 3, 2,0,1,0,0,0
L11772:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L11780:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 558 ---
L11788:	fn_link  L11748
	fn_link  L11760
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 559 ---
L11800:	fn_link  L11812
	fn_link  L11820
	fn_combi_t2 3, 2,0,1,0,0,0
L11812:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L11820:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 560 ---
L11828:	fn_link  L11788
	fn_link  L11800
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 561 ---
L11840:	fn_link  L11660
	fn_link  L11828
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 562 ---
LastPiece.mPiece:	fn_link  L12256
	fn_link  L12432
	fn_link  L11868
	fn_combi_t4 4, 3,0,1,2,0,0
L11868:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 563 ---
L11876:	fn_link  L11896
	fn_link  L11920
	fn_link  L11928
	fn_link  L11932
	fn_combi_t17 5, 4,0,1,2,3,0
L11896:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L11920:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11928:	fn_y
L11932:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 564 ---
L11940:	fn_link  L11952
	fn_link  L11876
	fn_combi_t2 4, 3,0,1,0,0,0
L11952:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 565 ---
L11956:	fn_link  L11968
	fn_link  L11976
	fn_combi_t2 3, 2,0,1,0,0,0
L11968:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11976:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 566 ---
L11984:	fn_link  L11940
	fn_link  L11956
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 567 ---
L11996:	fn_link  L12008
	fn_link  L12016
	fn_combi_t2 3, 2,0,1,0,0,0
L12008:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12016:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 568 ---
L12024:	fn_link  L11984
	fn_link  L11996
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 569 ---
L12036:	fn_link  L12048
	fn_link  L12056
	fn_combi_t2 3, 2,0,1,0,0,0
L12048:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12056:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 570 ---
L12064:	fn_link  L12024
	fn_link  L12036
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 571 ---
L12076:	fn_link  L12088
	fn_link  L12064
	fn_combi_t2 4, 3,0,1,0,0,0
L12088:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 572 ---
L12092:	fn_link  L12104
	fn_link  L12112
	fn_combi_t2 3, 2,0,1,0,0,0
L12104:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L12112:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 573 ---
L12120:	fn_link  L12132
	fn_link  L12092
	fn_combi_t2 4, 3,0,1,0,0,0
L12132:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 574 ---
L12136:	fn_link  L12148
	fn_link  L12156
	fn_combi_t2 3, 2,0,1,0,0,0
L12148:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L12156:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 575 ---
L12164:	fn_link  L12120
	fn_link  L12136
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 576 ---
L12176:	fn_link  L12188
	fn_link  L12196
	fn_combi_t2 3, 2,0,1,0,0,0
L12188:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L12196:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 577 ---
L12204:	fn_link  L12164
	fn_link  L12176
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 578 ---
L12216:	fn_link  L12228
	fn_link  L12236
	fn_combi_t2 3, 2,0,1,0,0,0
L12228:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L12236:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 579 ---
L12244:	fn_link  L12204
	fn_link  L12216
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 580 ---
L12256:	fn_link  L12076
	fn_link  L12244
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 581 ---
L12268:	fn_link  L12280
	fn_link  L12288
	fn_combi_t2 3, 2,0,1,0,0,0
L12280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12288:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 582 ---
L12296:	fn_link  L12308
	fn_link  L12268
	fn_combi_t2 4, 3,0,1,0,0,0
L12308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 583 ---
L12312:	fn_link  L12324
	fn_link  L12332
	fn_combi_t2 3, 2,0,1,0,0,0
L12324:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12332:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 584 ---
L12340:	fn_link  L12296
	fn_link  L12312
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 585 ---
L12352:	fn_link  L12364
	fn_link  L12372
	fn_combi_t2 3, 2,0,1,0,0,0
L12364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12372:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 586 ---
L12380:	fn_link  L12340
	fn_link  L12352
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 587 ---
L12392:	fn_link  L12404
	fn_link  L12412
	fn_combi_t2 3, 2,0,1,0,0,0
L12404:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L12412:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 588 ---
L12420:	fn_link  L12380
	fn_link  L12392
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 589 ---
L12432:	fn_link  L12444
	fn_link  L12420
	fn_combi_t2 4, 3,0,1,0,0,0
L12444:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 590 ---
LastPiece.nPiece:	fn_link  L12464
	fn_link  L12928
	fn_link  L12468
	fn_combi_t4 4, 3,0,1,2,0,0
L12464:	fn_combi_t0 2, 0,0,0,0,0,0
L12468:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 591 ---
L12476:	fn_link  L12496
	fn_link  L12520
	fn_link  L12528
	fn_link  L12532
	fn_combi_t17 5, 4,0,1,2,3,0
L12496:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L12520:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12528:	fn_y
L12532:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 592 ---
L12540:	fn_link  L12552
	fn_link  L12476
	fn_combi_t2 4, 3,0,1,0,0,0
L12552:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 593 ---
L12556:	fn_link  L12576
	fn_link  L12600
	fn_link  L12608
	fn_link  L12612
	fn_combi_t17 5, 4,0,1,2,3,0
L12576:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L12600:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12608:	fn_y
L12612:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 594 ---
L12620:	fn_link  L12540
	fn_link  L12556
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 595 ---
L12632:	fn_link  L12652
	fn_link  L12676
	fn_link  L12684
	fn_link  L12688
	fn_combi_t17 5, 4,0,1,2,3,0
L12652:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L12676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12684:	fn_y
L12688:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 596 ---
L12696:	fn_link  L12620
	fn_link  L12632
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 597 ---
L12708:	fn_link  L12720
	fn_link  L12728
	fn_combi_t2 3, 2,0,1,0,0,0
L12720:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L12728:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 598 ---
L12736:	fn_link  L12696
	fn_link  L12708
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 599 ---
L12748:	fn_link  L12760
	fn_link  L12736
	fn_combi_t2 4, 3,0,1,0,0,0
L12760:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 600 ---
L12764:	fn_link  L12776
	fn_link  L12784
	fn_combi_t2 3, 2,0,1,0,0,0
L12776:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L12784:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 601 ---
L12792:	fn_link  L12804
	fn_link  L12764
	fn_combi_t2 4, 3,0,1,0,0,0
L12804:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 602 ---
L12808:	fn_link  L12820
	fn_link  L12828
	fn_combi_t2 3, 2,0,1,0,0,0
L12820:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L12828:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 603 ---
L12836:	fn_link  L12792
	fn_link  L12808
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 604 ---
L12848:	fn_link  L12860
	fn_link  L12868
	fn_combi_t2 3, 2,0,1,0,0,0
L12860:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L12868:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 605 ---
L12876:	fn_link  L12836
	fn_link  L12848
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 606 ---
L12888:	fn_link  L12900
	fn_link  L12908
	fn_combi_t2 3, 2,0,1,0,0,0
L12900:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L12908:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 607 ---
L12916:	fn_link  L12876
	fn_link  L12888
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 608 ---
L12928:	fn_link  L12748
	fn_link  L12916
	fn_combi_t2 4, 3,0,1,0,0,0

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
_unimpprim_addiw$20$2d2:
	la a0, _unimpprim_addiw$20$2d2$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d2$name:
	.asciz "addiw -2"
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
