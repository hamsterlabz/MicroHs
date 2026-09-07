# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Puzzle  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$3a
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.all
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.not
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.replicate
	.globl	Primitives.primPerformIO
	.globl	Puzzle.adamPos
	.globl	Puzzle.append
	.globl	Puzzle.bench
	.globl	Puzzle.bonoPos
	.globl	Puzzle.dashesLine
	.globl	Puzzle.edgePos
	.globl	Puzzle.eqBank
	.globl	Puzzle.eqState
	.globl	Puzzle.finalState
	.globl	Puzzle.initialState
	.globl	Puzzle.itemName
	.globl	Puzzle.items
	.globl	Puzzle.larryPos
	.globl	Puzzle.minSolutions
	.globl	Puzzle.notSeen
	.globl	Puzzle.opposite
	.globl	Puzzle.position
	.globl	Puzzle.revL
	.globl	Puzzle.showN
	.globl	Puzzle.showsI
	.globl	Puzzle.sp
	.globl	Puzzle.succAdam
	.globl	Puzzle.totalTime
	.globl	Puzzle.transfer
	.globl	Puzzle.u2times
	.globl	Puzzle.updateState
	.globl	Puzzle.writeHistory
	.globl	Puzzle.writeItem
	.globl	Puzzle.writeSolutions
	.globl	Puzzle.writeState
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Puzzle.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Puzzle.bench:	fn_link  L84
L32:	fn_elink NanoPrelude.length
# --- block 3 ---
L36:	fn_link  L60
L40:	fn_link  L64
L44:	fn_link  L72
	fn_link  Puzzle.finalState
	fn_link  Puzzle.initialState
	fn_elink Puzzle.transfer
L60:	fn_combi_t0 2, 0,0,0,0,0,0
L64:	fn_box
L68:	.word 0x00000000	# raw word 0
	fn_box_body
L72:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 4 ---
L76:	fn_link  L36
	fn_elink Puzzle.minSolutions
# --- block 5 ---
L84:	fn_link  L100
	fn_link  L104
	fn_link  L76
L96:	fn_elink Puzzle.writeSolutions
L100:	fn_combi_t0 2, 0,0,0,0,0,0
L104:	fn_box
L108:	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 6 ---
NanoPrelude.length:	fn_link  L124
L116:	fn_link  L172
L120:	fn_y
L124:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
L132:	fn_link  L144
	fn_link  L168
	fn_combi_t8 5, 2,0,3,1,0,0
L144:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L168:	fn_y
# --- block 8 ---
L172:	fn_link  L132
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 9 ---
Puzzle.writeSolutions:	fn_link  L320
	fn_link  L516
	fn_link  L196
	fn_combi_t17 5, 3,0,1,2,4,0
L196:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 10 ---
L200:	fn_link  L216
	fn_link  L240
	fn_link  Puzzle.writeSolutions
	fn_combi_t17 5, 0,4,1,3,2,0
L216:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L240:	fn_y
# --- block 11 ---
L244:	fn_link  L200
	fn_link  Puzzle.writeHistory
	fn_link  L260
	fn_combi_t44 6, 0,1,4,2,3,5
L260:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 12 ---
L264:	fn_link  L280
	fn_link  Data.List_Type.$3a
	fn_link  L288
	fn_combi_t44 6, 0,1,2,3,4,5
L280:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L288:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 13 ---
L292:	fn_link  L244
	fn_link  L264
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 14 ---
L304:	fn_link  Puzzle.showsI
	fn_link  L316
	fn_combi_t44 6, 0,1,3,2,4,5
L316:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 15 ---
L320:	fn_link  L292
	fn_link  L304
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 16 ---
L332:	fn_link  L344
	fn_link  L348
	fn_combi_t2 4, 3,0,1,0,0,0
L344:	fn_combi_t0 2, 0,0,0,0,0,0
L348:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 17 ---
L356:	fn_link  L332
	fn_link  L368
	fn_combi_t2 4, 3,0,1,0,0,0
L368:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 18 ---
L376:	fn_link  L356
	fn_link  L388
	fn_combi_t2 4, 3,0,1,0,0,0
L388:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 19 ---
L396:	fn_link  L376
	fn_link  L408
	fn_combi_t2 4, 3,0,1,0,0,0
L408:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 20 ---
L416:	fn_link  L396
	fn_link  L428
	fn_combi_t2 4, 3,0,1,0,0,0
L428:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 21 ---
L436:	fn_link  L416
	fn_link  L448
	fn_combi_t2 4, 3,0,1,0,0,0
L448:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 22 ---
L456:	fn_link  L436
	fn_link  L468
	fn_combi_t2 4, 3,0,1,0,0,0
L468:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 23 ---
L476:	fn_link  L456
	fn_link  L488
	fn_combi_t2 4, 3,0,1,0,0,0
L488:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 24 ---
L496:	fn_link  L476
	fn_link  L508
	fn_combi_t2 4, 3,0,1,0,0,0
L508:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 25 ---
L516:	fn_link  L496
	fn_link  Puzzle.append
	fn_link  L532
	fn_combi_t44 6, 0,1,2,3,4,5
L532:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 26 ---
Puzzle.append:	fn_link  L544
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 27 ---
L544:	fn_link  Puzzle.append
	fn_link  L556
	fn_combi_t16 5, 0,3,1,4,2,0
L556:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 28 ---
Puzzle.showsI:	fn_link  Puzzle.showN
	fn_link  Puzzle.append
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 29 ---
Puzzle.showN:	fn_link  L584
	fn_link  L744
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 30 ---
L584:	fn_link  L600
	fn_link  L604
	fn_link  L628
	fn_combi_t13 6, 5,0,3,1,2,0
L600:	fn_combi_t0 2, 0,0,0,0,0,0
L604:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L628:	fn_y
# --- block 31 ---
L632:	fn_link  L652
	fn_link  L676
	fn_link  NanoPrelude.rem
	fn_link  L684
	fn_combi_t18 5, 0,1,4,2,3,0
L652:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L676:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L684:	fn_y
# --- block 32 ---
L688:	fn_link  L700
	fn_link  L632
	fn_combi_t5 5, 4,0,2,1,0,0
L700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L704:	fn_link  L724
	fn_link  NanoPrelude.quot
	fn_link  Puzzle.showN
	fn_link  Puzzle.append
	fn_combi_t21 5, 0,1,2,4,3,0
L724:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 34 ---
L732:	fn_link  L688
	fn_link  L704
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 35 ---
L744:	fn_link  L732
	fn_link  L760
	fn_link  L764
	fn_combi_t15 4, 0,3,1,2,3,0
L760:	fn_elink _prim_lt
L764:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 36 ---
NanoPrelude.quot:	fn_link  L784
	fn_link  L808
	fn_combi_t8 4, 0,3,2,1,0,0
L784:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L808:	fn_y
# --- block 37 ---
NanoPrelude.rem:	fn_link  L824
	fn_link  L848
	fn_combi_t8 4, 0,3,2,1,0,0
L824:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L848:	fn_y
# --- block 38 ---
Data.List_Type.$3a:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 39 ---
Puzzle.writeHistory:	fn_link  L1152
	fn_link  L868
	fn_combi_t6 3, 2,0,1,2,0,0
L868:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 40 ---
L872:	fn_link  Puzzle.writeState
	fn_link  L884
	fn_combi_t5 4, 0,1,3,2,0,0
L884:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 41 ---
L888:	fn_link  L872
	fn_link  L908
	fn_link  Data.List_Type.$3a
	fn_link  L916
	fn_combi_t44 6, 0,1,2,3,4,5
L908:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L916:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 42 ---
L920:	fn_link  L940
	fn_link  Puzzle.totalTime
	fn_link  L964
	fn_link  Puzzle.showsI
	fn_combi_t63 6, 0,1,5,2,4,3
L940:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L964:	fn_y
# --- block 43 ---
L968:	fn_link  L976
	fn_combi_t44 6, 0,1,4,2,3,5
L976:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 44 ---
L980:	fn_link  L888
	fn_link  L920
	fn_link  L968
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 45 ---
L996:	fn_link  L1008
	fn_link  L1012
	fn_combi_t2 4, 3,0,1,0,0,0
L1008:	fn_combi_t0 2, 0,0,0,0,0,0
L1012:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 46 ---
L1020:	fn_link  L996
	fn_link  L1032
	fn_combi_t2 4, 3,0,1,0,0,0
L1032:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 47 ---
L1040:	fn_link  L1020
	fn_link  L1052
	fn_combi_t2 4, 3,0,1,0,0,0
L1052:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 48 ---
L1060:	fn_link  L1040
	fn_link  L1072
	fn_combi_t2 4, 3,0,1,0,0,0
L1072:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 49 ---
L1080:	fn_link  L1060
	fn_link  L1092
	fn_combi_t2 4, 3,0,1,0,0,0
L1092:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 50 ---
L1100:	fn_link  L1080
	fn_link  L1112
	fn_combi_t2 4, 3,0,1,0,0,0
L1112:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 51 ---
L1120:	fn_link  L1100
	fn_link  Puzzle.append
	fn_link  L1136
	fn_combi_t44 6, 0,1,2,3,4,5
L1136:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 52 ---
L1140:	fn_link  L980
	fn_link  L1120
	fn_combi_t21 5, 3,0,1,2,4,0
# --- block 53 ---
L1152:	fn_link  L1168
	fn_link  L1140
	fn_link  NanoPrelude.foldr
	fn_combi_t10 6, 0,1,3,2,3,0
L1168:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 54 ---
NanoPrelude.foldr:	fn_link  L1188
	fn_link  L1184
	fn_combi_t7 4, 0,1,2,3,0,0
L1184:	fn_y
# --- block 55 ---
L1188:	fn_link  L1196
	fn_combi_t16 5, 4,2,0,1,3,0
L1196:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 56 ---
Puzzle.totalTime:	fn_link  L1216
	fn_link  L1212
	fn_combi_t2 3, 2,0,1,0,0,0
L1212:	fn_elink _error0
# --- block 57 ---
L1216:	fn_link  L1224
	fn_combi_t1 3, 1,0,0,0,0,0
L1224:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
Puzzle.writeState:	fn_link  L1392
	fn_link  Puzzle.dashesLine
	fn_link  Puzzle.append
	fn_link  L1248
	fn_combi_t15 5, 0,1,2,3,4,0
L1248:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 59 ---
L1252:	fn_link  Puzzle.dashesLine
	fn_elink Puzzle.append
# --- block 60 ---
L1260:	fn_link  L1252
	fn_link  Puzzle.adamPos
	fn_link  L1284
	fn_link  Puzzle.writeItem
	fn_link  L1288
	fn_combi_t34 6, 0,1,2,3,5,4
L1284:	fn_combi_t0 4, 3,0,0,0,0,0
L1288:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 61 ---
L1292:	fn_link  Puzzle.larryPos
	fn_link  L1312
	fn_link  Puzzle.writeItem
	fn_link  L1316
	fn_combi_t20 5, 0,1,2,3,4,0
L1312:	fn_combi_t0 4, 2,0,0,0,0,0
L1316:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 62 ---
L1320:	fn_link  Puzzle.edgePos
	fn_link  L1340
	fn_link  Puzzle.writeItem
	fn_link  L1344
	fn_combi_t20 5, 0,1,2,3,4,0
L1340:	fn_combi_t0 4, 1,0,0,0,0,0
L1344:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 63 ---
L1348:	fn_link  L1260
	fn_link  L1292
	fn_link  L1320
	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 64 ---
L1364:	fn_link  Puzzle.bonoPos
	fn_link  L1384
	fn_link  Puzzle.writeItem
	fn_link  L1388
	fn_combi_t20 5, 0,1,2,3,4,0
L1384:	fn_combi_t0 4, 0,0,0,0,0,0
L1388:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 65 ---
L1392:	fn_link  L1348
	fn_link  L1364
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 66 ---
Puzzle.dashesLine:	fn_link  L1416
	fn_link  L1440
	fn_elink Puzzle.append
# --- block 67 ---
L1416:	fn_link  L1428
	fn_link  L1432
	fn_combi_t2 4, 3,0,1,0,0,0
L1428:	fn_combi_t0 2, 0,0,0,0,0,0
L1432:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 68 ---
L1440:	fn_link  L1452
	fn_link  L1460
	fn_elink NanoPrelude.replicate
L1452:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L1460:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 69 ---
NanoPrelude.replicate:	fn_link  L1484
	fn_link  L1556
	fn_link  L1568
	fn_combi_t10 4, 0,1,3,2,3,0
L1484:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
L1488:	fn_link  L1504
	fn_link  L1528
	fn_link  NanoPrelude.replicate
	fn_combi_t8 4, 0,1,3,2,0,0
L1504:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1528:	fn_y
# --- block 71 ---
L1532:	fn_link  L1548
	fn_link  L1552
	fn_link  Data.Bool_Type.True
	fn_combi_t48 5, 0,1,2,4,3,4
L1548:	fn_combi_t2 4, 3,0,1,0,0,0
L1552:	fn_elink _error0
# --- block 72 ---
L1556:	fn_link  L1488
	fn_link  L1532
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 73 ---
L1568:	fn_link  L1580
	fn_link  L1584
	fn_combi_t29 6, 0,4,1,2,5,3
L1580:	fn_elink _prim_le
L1584:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 74 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 75 ---
Puzzle.writeItem:	fn_link  L1768
	fn_link  L2004
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 76 ---
L1608:	fn_link  L1620
	fn_link  L1624
	fn_combi_t2 4, 3,0,1,0,0,0
L1620:	fn_combi_t0 2, 0,0,0,0,0,0
L1624:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 77 ---
L1632:	fn_link  L1644
	fn_link  L1648
	fn_combi_t2 4, 3,0,1,0,0,0
L1644:	fn_combi_t0 2, 0,0,0,0,0,0
L1648:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 78 ---
L1656:	fn_link  L1632
	fn_link  L1668
	fn_combi_t2 4, 3,0,1,0,0,0
L1668:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
# --- block 79 ---
L1676:	fn_link  L1608
	fn_link  Puzzle.itemName
	fn_link  Puzzle.append
	fn_link  L1656
	fn_link  Puzzle.append
	fn_combi_t47 6, 0,1,2,3,5,4
# --- block 80 ---
L1700:	fn_link  L1676
	fn_link  L1720
	fn_link  Puzzle.sp
	fn_link  Puzzle.append
	fn_combi_t15 5, 0,1,2,3,4,0
L1720:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
# --- block 81 ---
L1728:	fn_link  L1740
	fn_link  L1744
	fn_combi_t2 4, 3,0,1,0,0,0
L1740:	fn_combi_t0 2, 0,0,0,0,0,0
L1744:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
# --- block 82 ---
L1752:	fn_link  L1700
	fn_link  L1728
	fn_link  Puzzle.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 83 ---
L1768:	fn_link  L1752
	fn_link  L1792
	fn_link  Puzzle.sp
	fn_link  Puzzle.append
	fn_link  Puzzle.append
	fn_combi_t57 6, 0,1,2,3,4,5
L1792:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 84 ---
L1800:	fn_link  L1812
	fn_link  L1816
	fn_combi_t2 4, 3,0,1,0,0,0
L1812:	fn_combi_t0 2, 0,0,0,0,0,0
L1816:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 85 ---
L1824:	fn_link  L1800
	fn_link  L1836
	fn_combi_t2 4, 3,0,1,0,0,0
L1836:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
# --- block 86 ---
L1844:	fn_link  L1852
	fn_elink Puzzle.sp
L1852:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
# --- block 87 ---
L1860:	fn_link  L1824
	fn_link  L1844
	fn_elink Puzzle.append
# --- block 88 ---
L1872:	fn_link  L1884
	fn_link  L1888
	fn_combi_t2 4, 3,0,1,0,0,0
L1884:	fn_combi_t0 2, 0,0,0,0,0,0
L1888:	fn_box
	.word 0x0000007c	# raw word 124
	fn_box_body
# --- block 89 ---
L1896:	fn_link  L1872
	fn_link  L1908
	fn_combi_t2 4, 3,0,1,0,0,0
L1908:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 90 ---
L1916:	fn_link  L1860
	fn_link  L1896
	fn_elink Puzzle.append
# --- block 91 ---
L1928:	fn_link  L1952
	fn_link  L1976
	fn_link  NanoPrelude.length
	fn_link  L1984
	fn_link  Puzzle.sp
	fn_combi_t62 6, 0,1,2,5,3,4
L1952:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1976:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L1984:	fn_y
# --- block 92 ---
L1988:	fn_link  L1916
	fn_link  L1928
	fn_link  Puzzle.append
	fn_combi_t44 4, 0,1,3,0,3,2
# --- block 93 ---
L2004:	fn_link  Puzzle.itemName
	fn_link  L1988
	fn_link  Puzzle.append
	fn_combi_t36 6, 5,0,1,2,4,3
# --- block 94 ---
Puzzle.sp:	fn_link  L2032
	fn_link  NanoPrelude.replicate
	fn_combi_t2 3, 0,2,1,0,0,0
L2032:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 95 ---
Puzzle.itemName:	fn_link  L2124
	fn_link  L2228
	fn_link  L2392
	fn_link  L2476
	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 96 ---
L2060:	fn_link  L2072
	fn_link  L2076
	fn_combi_t2 4, 3,0,1,0,0,0
L2072:	fn_combi_t0 2, 0,0,0,0,0,0
L2076:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 97 ---
L2084:	fn_link  L2060
	fn_link  L2096
	fn_combi_t2 4, 3,0,1,0,0,0
L2096:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 98 ---
L2104:	fn_link  L2084
	fn_link  L2116
	fn_combi_t2 4, 3,0,1,0,0,0
L2116:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 99 ---
L2124:	fn_link  L2104
	fn_link  L2136
	fn_combi_t2 4, 3,0,1,0,0,0
L2136:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 100 ---
L2144:	fn_link  L2156
	fn_link  L2160
	fn_combi_t2 4, 3,0,1,0,0,0
L2156:	fn_combi_t0 2, 0,0,0,0,0,0
L2160:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 101 ---
L2168:	fn_link  L2144
	fn_link  L2180
	fn_combi_t2 4, 3,0,1,0,0,0
L2180:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 102 ---
L2188:	fn_link  L2168
	fn_link  L2200
	fn_combi_t2 4, 3,0,1,0,0,0
L2200:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 103 ---
L2208:	fn_link  L2188
	fn_link  L2220
	fn_combi_t2 4, 3,0,1,0,0,0
L2220:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 104 ---
L2228:	fn_link  L2208
	fn_link  L2240
	fn_combi_t2 4, 3,0,1,0,0,0
L2240:	fn_box
	.word 0x0000004c	# raw word 76
	fn_box_body
# --- block 105 ---
L2248:	fn_link  L2260
	fn_link  L2264
	fn_combi_t2 4, 3,0,1,0,0,0
L2260:	fn_combi_t0 2, 0,0,0,0,0,0
L2264:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 106 ---
L2272:	fn_link  L2248
	fn_link  L2284
	fn_combi_t2 4, 3,0,1,0,0,0
L2284:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 107 ---
L2292:	fn_link  L2272
	fn_link  L2304
	fn_combi_t2 4, 3,0,1,0,0,0
L2304:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 108 ---
L2312:	fn_link  L2292
	fn_link  L2324
	fn_combi_t2 4, 3,0,1,0,0,0
L2324:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 109 ---
L2332:	fn_link  L2312
	fn_link  L2344
	fn_combi_t2 4, 3,0,1,0,0,0
L2344:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 110 ---
L2352:	fn_link  L2332
	fn_link  L2364
	fn_combi_t2 4, 3,0,1,0,0,0
L2364:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 111 ---
L2372:	fn_link  L2352
	fn_link  L2384
	fn_combi_t2 4, 3,0,1,0,0,0
L2384:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 112 ---
L2392:	fn_link  L2372
	fn_link  L2404
	fn_combi_t2 4, 3,0,1,0,0,0
L2404:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 113 ---
L2412:	fn_link  L2424
	fn_link  L2428
	fn_combi_t2 4, 3,0,1,0,0,0
L2424:	fn_combi_t0 2, 0,0,0,0,0,0
L2428:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 114 ---
L2436:	fn_link  L2412
	fn_link  L2448
	fn_combi_t2 4, 3,0,1,0,0,0
L2448:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 115 ---
L2456:	fn_link  L2436
	fn_link  L2468
	fn_combi_t2 4, 3,0,1,0,0,0
L2468:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 116 ---
L2476:	fn_link  L2456
	fn_link  L2488
	fn_combi_t2 4, 3,0,1,0,0,0
L2488:	fn_box
	.word 0x00000042	# raw word 66
	fn_box_body
# --- block 117 ---
Puzzle.bonoPos:	fn_link  L2504
	fn_combi_t1 2, 1,0,0,0,0,0
L2504:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 118 ---
Puzzle.edgePos:	fn_link  L2516
	fn_combi_t1 2, 1,0,0,0,0,0
L2516:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 119 ---
Puzzle.larryPos:	fn_link  L2528
	fn_combi_t1 2, 1,0,0,0,0,0
L2528:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 120 ---
Puzzle.adamPos:	fn_link  L2540
	fn_combi_t1 2, 1,0,0,0,0,0
L2540:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 121 ---
Puzzle.minSolutions:	fn_link  L2780
	fn_link  L2556
	fn_combi_t2 3, 2,0,1,0,0,0
L2556:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
L2560:	fn_link  L2568
	fn_combi_t2 4, 3,1,0,0,0,0
L2568:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 123 ---
L2572:	fn_link  L2580
	fn_combi_t7 4, 1,0,3,2,0,0
L2580:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 124 ---
L2584:	fn_link  L2592
	fn_combi_t2 4, 3,1,0,0,0,0
L2592:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 125 ---
L2596:	fn_link  L2584
	fn_combi_t11 5, 1,4,0,2,3,0
# --- block 126 ---
L2604:	fn_link  L2612
	fn_combi_t29 5, 4,1,0,2,4,3
L2612:	fn_elink _prim_eq
# --- block 127 ---
L2616:	fn_link  L2596
	fn_link  L2604
	fn_link  L2632
	fn_combi_t15 5, 0,1,4,2,3,0
L2632:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 128 ---
L2636:	fn_link  L2572
	fn_link  L2616
	fn_link  L2652
	fn_combi_t12 5, 0,1,3,4,2,0
L2652:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 129 ---
L2656:	fn_link  L2664
	fn_combi_t29 5, 4,1,0,2,4,3
L2664:	fn_elink _prim_lt
# --- block 130 ---
L2668:	fn_link  L2656
	fn_link  L2680
	fn_combi_t3 3, 0,1,2,0,0,0
L2680:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 131 ---
L2684:	fn_link  L2668
	fn_link  L2696
	fn_combi_t29 5, 0,1,2,3,4,4
L2696:	fn_combi_t26 5, 0,1,3,4,2,3
# --- block 132 ---
L2700:	fn_link  L2636
	fn_link  L2684
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 133 ---
L2712:	fn_link  Puzzle.totalTime
	fn_link  L2700
	fn_link  L2728
	fn_combi_t32 6, 0,1,3,4,5,2
L2728:	fn_combi_t37 5, 0,2,3,4,1,3
# --- block 134 ---
L2732:	fn_link  L2712
	fn_link  L2748
	fn_link  L2752
	fn_combi_t19 5, 0,1,2,3,4,0
L2748:	fn_combi_t46 5, 4,3,0,1,2,3
L2752:	fn_y
# --- block 135 ---
L2756:	fn_link  L2560
	fn_link  Puzzle.totalTime
	fn_link  L2732
	fn_link  L2776
	fn_combi_t39 5, 0,1,2,4,3,4
L2776:	fn_y
# --- block 136 ---
L2780:	fn_link  L2756
	fn_link  Puzzle.revL
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 137 ---
Puzzle.revL:	fn_link  L2804
	fn_link  L2808
	fn_elink NanoPrelude.foldl
L2804:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 138 ---
L2808:	fn_link  L2816
	fn_combi_t2 3, 0,2,1,0,0,0
L2816:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 139 ---
NanoPrelude.foldl:	fn_link  L2836
	fn_link  L2832
	fn_combi_t3 3, 0,1,2,0,0,0
L2832:	fn_y
# --- block 140 ---
L2836:	fn_link  L2844
	fn_combi_t46 5, 4,3,0,1,2,3
L2844:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 141 ---
Puzzle.transfer:	fn_link  L3880
	fn_link  L2860
	fn_combi_t3 3, 0,1,2,0,0,0
L2860:	fn_y
# --- block 142 ---
L2864:	fn_link  L2884
	fn_link  L2888
	fn_link  L2892
	fn_link  L2896
	fn_combi_t11 5, 0,1,2,4,3,0
L2884:	fn_combi_t0 2, 0,0,0,0,0,0
L2888:	fn_combi_t2 3, 2,1,0,0,0,0
L2892:	fn_combi_t2 4, 3,0,1,0,0,0
L2896:	fn_combi_t33 7, 6,0,1,3,4,2
# --- block 143 ---
L2900:	fn_link  L2912
	fn_link  L2916
	fn_combi_t2 4, 3,0,1,0,0,0
L2912:	fn_combi_t0 2, 0,0,0,0,0,0
L2916:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 144 ---
L2920:	fn_link  L2900
	fn_link  L2932
	fn_combi_t2 4, 3,0,1,0,0,0
L2932:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 145 ---
L2936:	fn_link  L2920
	fn_link  L2948
	fn_combi_t2 4, 3,0,1,0,0,0
L2948:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 146 ---
L2952:	fn_link  Puzzle.updateState
	fn_combi_t18 4, 0,0,1,3,2,0
# --- block 147 ---
L2960:	fn_link  L2976
	fn_link  Puzzle.u2times
	fn_link  L3000
	fn_combi_t20 5, 0,1,4,3,2,0
L2976:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3000:	fn_y
# --- block 148 ---
L3004:	fn_link  L3012
	fn_combi_t51 6, 0,1,5,2,3,4
L3012:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 149 ---
L3016:	fn_link  L2960
	fn_link  L3004
	fn_link  L3032
	fn_combi_t5 4, 0,1,3,2,0,0
L3032:	fn_combi_t30 6, 0,3,1,2,5,4
# --- block 150 ---
L3036:	fn_link  Puzzle.notSeen
	fn_combi_t14 5, 0,4,1,2,3,0
# --- block 151 ---
L3044:	fn_link  L3052
	fn_combi_t24 5, 0,1,4,2,3,4
L3052:	fn_combi_t48 5, 0,4,1,4,2,3
# --- block 152 ---
L3056:	fn_link  L3044
	fn_combi_t29 5, 0,1,4,2,3,4
# --- block 153 ---
L3064:	fn_link  L3036
	fn_link  L3056
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 154 ---
L3076:	fn_link  L3084
	fn_combi_t29 5, 0,1,4,2,4,3
L3084:	fn_combi_t42 6, 0,3,5,1,4,2
# --- block 155 ---
L3088:	fn_link  L3076
	fn_combi_t26 6, 0,1,2,5,3,4
# --- block 156 ---
L3096:	fn_link  L3016
	fn_link  L3064
	fn_link  L3088
	fn_combi_t54 6, 0,1,2,3,4,5
# --- block 157 ---
L3112:	fn_link  L2952
	fn_link  L3096
	fn_link  L3128
	fn_combi_t40 6, 0,1,3,5,2,4
L3128:	fn_combi_t28 4, 0,2,3,1,3,3
# --- block 158 ---
L3132:	fn_link  Puzzle.position
	fn_link  Puzzle.eqBank
	fn_link  NanoPrelude.$26$26
	fn_combi_t54 6, 0,1,2,5,3,4
# --- block 159 ---
L3148:	fn_link  L3156
	fn_combi_t24 6, 0,1,5,2,3,4
L3156:	fn_combi_t54 6, 0,1,2,5,3,4
# --- block 160 ---
L3160:	fn_link  L3148
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 161 ---
L3168:	fn_link  Puzzle.position
	fn_link  Puzzle.eqBank
	fn_link  L3132
	fn_link  L3160
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 162 ---
L3188:	fn_link  L3168
	fn_combi_t9 4, 0,1,2,3,2,0
# --- block 163 ---
L3196:	fn_link  L3188
	fn_link  L3208
	fn_combi_t18 5, 0,1,2,3,4,0
L3208:	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 164 ---
L3212:	fn_link  L3220
	fn_combi_t44 5, 0,1,4,2,3,4
L3220:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 165 ---
L3224:	fn_link  L3196
	fn_link  L3212
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 166 ---
L3236:	fn_link  L3244
	fn_combi_t54 6, 0,1,2,3,4,5
L3244:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 167 ---
L3248:	fn_link  L3224
	fn_link  L3236
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 168 ---
L3260:	fn_link  L3112
	fn_link  L3248
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 169 ---
L3272:	fn_link  L3280
	fn_combi_t40 5, 0,1,3,4,2,3
L3280:	fn_y
# --- block 170 ---
L3284:	fn_link  L3272
	fn_link  L3296
	fn_combi_t47 6, 5,0,1,2,4,3
L3296:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 171 ---
L3300:	fn_link  L3284
	fn_link  L3312
	fn_combi_t33 6, 0,1,2,5,3,4
L3312:	fn_y
# --- block 172 ---
L3316:	fn_link  L3300
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 173 ---
L3324:	fn_link  L3316
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 174 ---
L3332:	fn_link  L2936
	fn_link  Puzzle.succAdam
	fn_link  L3260
	fn_link  L3324
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 175 ---
L3352:	fn_link  L3368
	fn_link  Puzzle.u2times
	fn_link  L3392
	fn_combi_t20 5, 0,1,4,3,2,0
L3368:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3392:	fn_y
# --- block 176 ---
L3396:	fn_link  L3404
	fn_combi_t51 6, 0,1,5,2,3,4
L3404:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 177 ---
L3408:	fn_link  Puzzle.notSeen
	fn_combi_t14 5, 0,4,1,2,3,0
# --- block 178 ---
L3416:	fn_link  L3424
	fn_combi_t24 5, 0,1,4,2,3,4
L3424:	fn_combi_t48 5, 0,4,1,4,2,3
# --- block 179 ---
L3428:	fn_link  L3416
	fn_combi_t29 5, 0,1,3,2,4,3
# --- block 180 ---
L3436:	fn_link  L3408
	fn_link  L3428
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 181 ---
L3448:	fn_link  L3352
	fn_link  L3396
	fn_link  L3468
	fn_link  L3436
	fn_combi_t52 6, 0,1,2,4,3,5
L3468:	fn_combi_t30 6, 0,3,1,2,5,4
# --- block 182 ---
L3472:	fn_link  L3480
	fn_combi_t24 6, 0,1,5,2,3,4
L3480:	fn_combi_t46 6, 0,5,1,2,4,3
# --- block 183 ---
L3484:	fn_link  L3472
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 184 ---
L3492:	fn_link  L3484
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 185 ---
L3500:	fn_link  L3492
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 186 ---
L3508:	fn_link  L3500
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 187 ---
L3516:	fn_link  Puzzle.updateState
	fn_link  L3448
	fn_link  L3508
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 188 ---
L3532:	fn_link  Puzzle.position
	fn_link  Puzzle.eqBank
	fn_combi_t12 5, 0,1,4,2,3,0
# --- block 189 ---
L3544:	fn_link  L3532
	fn_link  L3556
	fn_combi_t7 4, 0,1,2,3,0,0
L3556:	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 190 ---
L3560:	fn_link  L3544
	fn_link  L3572
	fn_combi_t7 4, 0,1,2,3,0,0
L3572:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 191 ---
L3576:	fn_link  L3584
	fn_combi_t47 6, 5,0,1,2,3,4
L3584:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 192 ---
L3588:	fn_link  L3560
	fn_link  L3576
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 193 ---
L3600:	fn_link  L3616
	fn_link  L3588
	fn_link  L3620
	fn_combi_t26 6, 0,1,3,5,2,4
L3616:	fn_combi_t23 5, 0,1,2,3,4,4
L3620:	fn_combi_t54 6, 0,1,2,3,4,5
# --- block 194 ---
L3624:	fn_link  L3516
	fn_link  L3600
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 195 ---
L3636:	fn_link  L3652
	fn_link  NanoPrelude.concat
	fn_link  Puzzle.append
	fn_combi_t61 6, 0,1,2,3,5,4
L3652:	fn_y
# --- block 196 ---
L3656:	fn_link  L3636
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 197 ---
L3664:	fn_link  Puzzle.items
	fn_link  L3624
	fn_link  L3656
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 198 ---
L3680:	fn_link  L3688
	fn_combi_t32 6, 0,1,3,4,5,2
L3688:	fn_combi_t43 5, 0,2,4,1,3,4
# --- block 199 ---
L3692:	fn_link  NanoPrelude.concat
	fn_link  L3664
	fn_link  L3680
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 200 ---
L3708:	fn_link  L3716
	fn_combi_t40 5, 0,1,2,4,3,4
L3716:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 201 ---
L3720:	fn_link  Puzzle.eqState
	fn_combi_t28 6, 0,1,2,3,5,4
# --- block 202 ---
L3728:	fn_link  L3720
	fn_link  L3740
	fn_combi_t7 4, 0,1,2,3,0,0
L3740:	fn_combi_t26 6, 0,1,2,5,3,4
# --- block 203 ---
L3744:	fn_link  L3752
	fn_combi_t45 5, 0,1,4,2,3,4
L3752:	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 204 ---
L3756:	fn_link  L3708
	fn_link  L3728
	fn_link  L3744
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 205 ---
L3772:	fn_link  L3692
	fn_link  L3756
	fn_link  L3788
	fn_combi_t5 4, 0,1,3,2,0,0
L3788:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 206 ---
L3792:	fn_link  L3332
	fn_link  L3772
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 207 ---
L3804:	fn_link  L3812
	fn_combi_t40 5, 0,1,3,4,2,4
L3812:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 208 ---
L3816:	fn_link  L3804
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 209 ---
L3824:	fn_link  L2864
	fn_link  L3792
	fn_link  L3816
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 210 ---
L3840:	fn_link  L3848
	fn_combi_t38 5, 0,1,4,2,3,4
L3848:	fn_combi_t43 5, 0,3,4,1,2,4
# --- block 211 ---
L3852:	fn_link  L3872
	fn_link  L3876
	fn_link  L3824
	fn_link  L3840
	fn_combi_t26 6, 0,1,4,5,2,3
L3872:	fn_combi_t2 3, 2,1,0,0,0,0
L3876:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 212 ---
L3880:	fn_link  Puzzle.opposite
	fn_link  L3852
	fn_link  L3896
	fn_combi_t32 6, 0,1,3,4,5,2
L3896:	fn_combi_t37 5, 0,2,3,4,1,2
# --- block 213 ---
Puzzle.eqState:	fn_link  L3984
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 214 ---
L3908:	fn_link  Puzzle.eqBank
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 215 ---
L3920:	fn_link  Puzzle.eqBank
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,3,4,5
# --- block 216 ---
L3932:	fn_link  Puzzle.eqBank
	fn_link  L3908
	fn_link  L3920
	fn_link  L3952
	fn_combi_t29 6, 0,1,4,2,5,3
L3952:	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 217 ---
L3956:	fn_link  Puzzle.eqBank
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,3,4,5
# --- block 218 ---
L3968:	fn_link  L3956
	fn_link  L3980
	fn_combi_t3 3, 0,1,2,0,0,0
L3980:	fn_combi_t46 6, 0,3,1,2,4,5
# --- block 219 ---
L3984:	fn_link  L3932
	fn_link  L3968
	fn_link  L4000
	fn_combi_t11 5, 0,3,1,4,2,0
L4000:	fn_combi_t54 6, 0,1,2,3,4,5
# --- block 220 ---
NanoPrelude.$26$26:	fn_link  L4012
	fn_combi_t1 2, 1,0,0,0,0,0
L4012:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 221 ---
Puzzle.eqBank:	fn_link  L4040
	fn_link  L4032
	fn_link  L4036
	fn_combi_t40 5, 3,4,0,1,2,4
L4032:	fn_combi_t0 2, 0,0,0,0,0,0
L4036:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 222 ---
L4040:	fn_link  L4052
	fn_link  L4056
	fn_combi_t2 3, 2,0,1,0,0,0
L4052:	fn_combi_t0 2, 1,0,0,0,0,0
L4056:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 223 ---
NanoPrelude.concat:	fn_link  L4072
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L4072:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 224 ---
Data.List_Type.$2b$2b:	fn_link  L4104
	fn_link  L4088
	fn_combi_t5 4, 0,1,3,2,0,0
L4088:	fn_y
# --- block 225 ---
L4092:	fn_link  L4100
	fn_combi_t6 4, 0,2,1,3,0,0
L4100:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 226 ---
L4104:	fn_link  L4092
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 227 ---
Puzzle.position:	fn_link  Puzzle.adamPos
	fn_link  Puzzle.larryPos
	fn_link  Puzzle.edgePos
	fn_link  Puzzle.bonoPos
	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 228 ---
Puzzle.notSeen:	fn_link  L4156
	fn_link  NanoPrelude.all
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 229 ---
L4144:	fn_link  Puzzle.eqState
	fn_link  NanoPrelude.not
	fn_combi_t7 5, 0,1,2,4,0,0
# --- block 230 ---
L4156:	fn_link  L4144
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 231 ---
NanoPrelude.all:	fn_link  L4188
	fn_link  L4176
	fn_combi_t3 3, 0,1,2,0,0,0
L4176:	fn_y
# --- block 232 ---
L4180:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 233 ---
L4188:	fn_link  L4180
	fn_link  L4200
	fn_combi_t16 5, 4,0,1,2,3,0
L4200:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 234 ---
NanoPrelude.not:	fn_link  L4216
	fn_link  L4220
	fn_combi_t2 3, 2,0,1,0,0,0
L4216:	fn_combi_t0 2, 0,0,0,0,0,0
L4220:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 235 ---
Puzzle.u2times:	fn_link  L4244
	fn_link  L4252
	fn_link  L4260
	fn_link  L4268
	fn_combi_t9 5, 4,0,1,2,3,0
L4244:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L4252:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L4260:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L4268:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 236 ---
Puzzle.updateState:	fn_link  L4288
	fn_link  L4404
	fn_combi_t56 5, 2,0,3,4,1,4
# --- block 237 ---
L4288:	fn_link  L4296
	fn_combi_t9 5, 0,2,3,4,1,0
L4296:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 238 ---
L4300:	fn_link  L4308
	fn_combi_t51 6, 1,0,2,3,4,5
L4308:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 239 ---
L4312:	fn_link  L4320
	fn_combi_t29 5, 0,1,4,2,4,3
L4320:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 240 ---
L4324:	fn_link  L4312
	fn_combi_t44 6, 0,1,5,2,4,3
# --- block 241 ---
L4332:	fn_link  L4348
	fn_link  L4300
	fn_link  L4324
	fn_combi_t26 5, 0,1,3,4,2,4
L4348:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 242 ---
L4352:	fn_link  L4360
	fn_combi_t24 5, 0,1,4,2,3,4
L4360:	fn_combi_t46 5, 0,4,1,3,4,2
# --- block 243 ---
L4364:	fn_link  L4380
	fn_link  L4332
	fn_link  L4352
	fn_combi_t26 5, 0,1,3,4,2,4
L4380:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 244 ---
L4384:	fn_link  L4392
	fn_combi_t38 5, 0,1,2,4,3,4
L4392:	fn_combi_t37 5, 0,1,3,4,2,3
# --- block 245 ---
L4396:	fn_link  L4384
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 246 ---
L4404:	fn_link  L4364
	fn_link  L4396
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 247 ---
Puzzle.items:	fn_link  L4468
	fn_link  L4428
	fn_combi_t2 4, 3,0,1,0,0,0
L4428:	fn_combi_t0 4, 0,0,0,0,0,0
# --- block 248 ---
L4432:	fn_link  L4444
	fn_link  L4448
	fn_combi_t2 4, 3,0,1,0,0,0
L4444:	fn_combi_t0 2, 0,0,0,0,0,0
L4448:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 249 ---
L4452:	fn_link  L4432
	fn_link  L4464
	fn_combi_t2 4, 3,0,1,0,0,0
L4464:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 250 ---
L4468:	fn_link  L4452
	fn_link  L4480
	fn_combi_t2 4, 3,0,1,0,0,0
L4480:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 251 ---
Puzzle.succAdam:	fn_link  L4504
	fn_link  L4508
	fn_link  L4548
	fn_link  L4600
	fn_combi_t9 5, 4,0,1,2,3,0
L4504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 252 ---
L4508:	fn_link  L4520
	fn_link  L4524
	fn_combi_t2 4, 3,0,1,0,0,0
L4520:	fn_combi_t0 2, 0,0,0,0,0,0
L4524:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 253 ---
L4528:	fn_link  L4540
	fn_link  L4544
	fn_combi_t2 4, 3,0,1,0,0,0
L4540:	fn_combi_t0 2, 0,0,0,0,0,0
L4544:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 254 ---
L4548:	fn_link  L4528
	fn_link  L4560
	fn_combi_t2 4, 3,0,1,0,0,0
L4560:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 255 ---
L4564:	fn_link  L4576
	fn_link  L4580
	fn_combi_t2 4, 3,0,1,0,0,0
L4576:	fn_combi_t0 2, 0,0,0,0,0,0
L4580:	fn_combi_t0 4, 3,0,0,0,0,0
# --- block 256 ---
L4584:	fn_link  L4564
	fn_link  L4596
	fn_combi_t2 4, 3,0,1,0,0,0
L4596:	fn_combi_t0 4, 2,0,0,0,0,0
# --- block 257 ---
L4600:	fn_link  L4584
	fn_link  L4612
	fn_combi_t2 4, 3,0,1,0,0,0
L4612:	fn_combi_t0 4, 1,0,0,0,0,0
# --- block 258 ---
Puzzle.opposite:	fn_link  L4628
	fn_link  L4632
	fn_combi_t2 3, 2,0,1,0,0,0
L4628:	fn_combi_t0 2, 0,0,0,0,0,0
L4632:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 259 ---
Puzzle.initialState:	fn_link  L4656
	fn_link  L4660
	fn_link  L4664
	fn_link  L4668
	fn_combi_t9 5, 4,0,1,2,3,0
L4656:	fn_combi_t0 2, 0,0,0,0,0,0
L4660:	fn_combi_t0 2, 0,0,0,0,0,0
L4664:	fn_combi_t0 2, 0,0,0,0,0,0
L4668:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 260 ---
Puzzle.finalState:	fn_link  L4692
	fn_link  L4696
	fn_link  L4700
	fn_link  L4704
	fn_combi_t9 5, 4,0,1,2,3,0
L4692:	fn_combi_t0 2, 1,0,0,0,0,0
L4696:	fn_combi_t0 2, 1,0,0,0,0,0
L4700:	fn_combi_t0 2, 1,0,0,0,0,0
L4704:	fn_combi_t0 2, 1,0,0,0,0,0

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
