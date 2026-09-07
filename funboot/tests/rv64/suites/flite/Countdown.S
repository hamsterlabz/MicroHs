# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Countdown  (entry @0)
	.text
	.globl	Countdown.Add
	.globl	Countdown.App
	.globl	Countdown.Div
	.globl	Countdown.Mul
	.globl	Countdown.Sub
	.globl	Countdown.Val
	.globl	Countdown.apply
	.globl	Countdown.choices
	.globl	Countdown.combi
	.globl	Countdown.combine
	.globl	Countdown.combinedResults
	.globl	Countdown.concatProdWith
	.globl	Countdown.cross
	.globl	Countdown.interleave
	.globl	Countdown.main
	.globl	Countdown.mul
	.globl	Countdown.perms
	.globl	Countdown.preImage
	.globl	Countdown.results
	.globl	Countdown.solns
	.globl	Countdown.solutions
	.globl	Countdown.split
	.globl	Countdown.subs
	.globl	Countdown.valid
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.concatMap
	.globl	NanoPrelude.divMod
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.null
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Countdown.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Countdown.main:	fn_link  L100
	fn_elink NanoPrelude.length
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L52
	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
L52:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
L60:	fn_link  L36
	fn_link  L72
	fn_combi_t2 4, 3,0,1,0,0,0
L72:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 5 ---
L80:	fn_link  L60
	fn_link  L92
	fn_combi_t2 4, 3,0,1,0,0,0
L92:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 6 ---
L100:	fn_link  L112
	fn_link  L80
	fn_elink Countdown.solutions
L112:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 7 ---
NanoPrelude.length:	fn_link  L132
	fn_link  L180
	fn_y
L132:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L140:	fn_link  L152
	fn_link  L176
	fn_combi_t8 5, 2,0,3,1,0,0
L152:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L176:	fn_y
# --- block 9 ---
L180:	fn_link  L140
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 10 ---
Countdown.solutions:	fn_link  Countdown.choices
	fn_link  Countdown.solns
	fn_link  Data.List_Type.concatMap
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 11 ---
Data.List_Type.concatMap:	fn_link  L228
	fn_link  L216
	fn_combi_t3 3, 0,1,2,0,0,0
L216:	fn_y
# --- block 12 ---
L220:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 13 ---
L228:	fn_link  L220
	fn_link  L240
	fn_combi_t16 5, 4,0,1,2,3,0
L240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
Data.List_Type.$2b$2b:	fn_link  L272
	fn_link  L256
	fn_combi_t5 4, 0,1,3,2,0,0
L256:	fn_y
# --- block 15 ---
L260:	fn_link  L268
	fn_combi_t6 4, 0,2,1,3,0,0
L268:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L272:	fn_link  L260
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 17 ---
Countdown.solns:	fn_link  Countdown.results
	fn_link  Countdown.preImage
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 18 ---
Countdown.preImage:	fn_link  L368
	fn_link  L304
	fn_combi_t3 3, 0,1,2,0,0,0
L304:	fn_y
# --- block 19 ---
L308:	fn_link  L316
	fn_combi_t6 4, 0,3,1,2,0,0
L316:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 20 ---
L320:	fn_link  L328
	fn_combi_t29 6, 1,5,0,2,3,4
L328:	fn_elink _prim_eq
# --- block 21 ---
L332:	fn_link  L320
	fn_link  L344
	fn_combi_t3 3, 0,1,2,0,0,0
L344:	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 22 ---
L348:	fn_link  L308
	fn_link  L332
	fn_link  L364
	fn_combi_t5 4, 0,1,3,2,0,0
L364:	fn_combi_t53 5, 3,0,2,1,2,4
# --- block 23 ---
L368:	fn_link  L348
	fn_link  L380
	fn_combi_t16 5, 4,0,1,2,3,0
L380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
Countdown.results:	fn_link  L468
	fn_link  L396
	fn_combi_t2 3, 2,0,1,0,0,0
L396:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 25 ---
L400:	fn_link  Countdown.Val
	fn_combi_t5 3, 2,0,1,1,0,0
# --- block 26 ---
L408:	fn_link  L424
	fn_link  L428
	fn_link  L400
	fn_combi_t13 6, 5,0,1,3,2,0
L424:	fn_combi_t0 2, 0,0,0,0,0,0
L428:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 27 ---
L432:	fn_link  L452
	fn_link  Countdown.split
	fn_link  Countdown.combinedResults
	fn_link  Data.List_Type.concatMap
	fn_combi_t49 6, 0,1,2,3,4,5
L452:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 28 ---
L456:	fn_link  L432
	fn_link  NanoPrelude.null
	fn_combi_t30 5, 0,4,1,2,4,3
# --- block 29 ---
L468:	fn_link  L408
	fn_link  L456
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 30 ---
NanoPrelude.null:	fn_link  L496
	fn_link  L492
	fn_combi_t2 3, 2,0,1,0,0,0
L492:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 31 ---
L496:	fn_link  L504
	fn_combi_t0 3, 0,0,0,0,0,0
L504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 32 ---
Countdown.combinedResults:	fn_link  L516
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 33 ---
L516:	fn_link  Countdown.results
	fn_link  Countdown.combine
	fn_link  Countdown.concatProdWith
	fn_combi_t39 5, 0,1,2,3,2,4
# --- block 34 ---
Countdown.concatProdWith:	fn_link  L576
	fn_link  L544
	fn_combi_t3 3, 0,1,2,0,0,0
L544:	fn_y
# --- block 35 ---
L548:	fn_link  Data.List_Type.concatMap
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t19 5, 0,1,2,4,3,0
# --- block 36 ---
L560:	fn_link  L548
	fn_link  L572
	fn_combi_t3 3, 0,1,2,0,0,0
L572:	fn_combi_t42 5, 0,2,3,1,4,2
# --- block 37 ---
L576:	fn_link  L560
	fn_link  L588
	fn_combi_t46 6, 4,0,1,2,3,5
L588:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
Countdown.combine:	fn_link  L676
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 39 ---
L600:	fn_link  L612
	fn_link  Countdown.Div
	fn_combi_t2 4, 3,0,1,0,0,0
L612:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 40 ---
L616:	fn_link  L600
	fn_link  Countdown.Mul
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L628:	fn_link  L616
	fn_link  Countdown.Sub
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L640:	fn_link  L628
	fn_link  Countdown.Add
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 43 ---
L652:	fn_link  Countdown.combi
	fn_link  Data.List_Type.concatMap
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 44 ---
L664:	fn_link  L640
	fn_link  L652
	fn_combi_t23 6, 0,2,3,4,5,1
# --- block 45 ---
L676:	fn_link  L664
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 46 ---
Countdown.combi:	fn_link  L724
	fn_link  L764
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 47 ---
L696:	fn_link  Countdown.apply
	fn_combi_t4 4, 0,3,1,2,0,0
# --- block 48 ---
L704:	fn_link  Countdown.App
	fn_combi_t32 6, 5,0,4,1,2,3
# --- block 49 ---
L712:	fn_link  L720
	fn_combi_t29 6, 0,1,4,2,5,3
L720:	fn_combi_t33 6, 5,0,1,3,3,2
# --- block 50 ---
L724:	fn_link  L744
	fn_link  L696
	fn_link  L704
	fn_link  L712
	fn_combi_t29 6, 0,1,4,2,5,3
L744:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 51 ---
L748:	fn_link  L760
	fn_link  Countdown.valid
	fn_combi_t9 5, 0,4,2,3,1,0
L760:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 52 ---
L764:	fn_link  L748
	fn_link  L776
	fn_combi_t44 5, 0,1,3,2,3,4
L776:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 53 ---
Countdown.valid:	fn_link  L1052
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 54 ---
L788:	fn_link  L808
	fn_link  L812
	fn_link  NanoPrelude.rem
	fn_link  L816
	fn_combi_t32 6, 0,1,4,5,2,3
L808:	fn_combi_t0 2, 0,0,0,0,0,0
L812:	fn_elink _prim_eq
L816:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 55 ---
L824:	fn_link  L836
	fn_link  L840
	fn_combi_t45 6, 0,4,1,5,2,3
L836:	fn_elink _prim_lt
L840:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 56 ---
L848:	fn_link  L864
	fn_link  L788
	fn_link  L824
	fn_combi_t12 5, 0,1,3,4,2,0
L864:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 57 ---
L868:	fn_link  L888
	fn_link  L892
	fn_link  L896
	fn_link  NanoPrelude.not
	fn_combi_t52 6, 0,5,4,1,2,3
L888:	fn_combi_t0 2, 1,0,0,0,0,0
L892:	fn_combi_t0 2, 0,0,0,0,0,0
L896:	fn_elink _prim_le
# --- block 58 ---
L900:	fn_link  L916
	fn_link  L920
	fn_link  L924
	fn_combi_t38 6, 0,4,1,2,5,3
L916:	fn_combi_t0 2, 0,0,0,0,0,0
L920:	fn_elink _prim_eq
L924:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 59 ---
L932:	fn_link  L868
	fn_link  L900
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 60 ---
L944:	fn_link  L956
	fn_link  L960
	fn_combi_t44 5, 0,3,1,2,3,4
L956:	fn_elink _prim_lt
L960:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 61 ---
L968:	fn_link  L932
	fn_link  L944
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 62 ---
L980:	fn_link  L992
	fn_link  L996
	fn_combi_t44 5, 0,3,1,2,3,4
L992:	fn_elink _prim_lt
L996:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 63 ---
L1004:	fn_link  L1024
	fn_link  L968
	fn_link  L1028
	fn_link  L980
	fn_combi_t52 6, 0,1,2,4,3,5
L1024:	fn_combi_t0 2, 1,0,0,0,0,0
L1028:	fn_combi_t37 5, 0,2,3,4,4,1
# --- block 64 ---
L1032:	fn_link  L1040
	fn_combi_t29 5, 0,1,4,2,4,3
L1040:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 65 ---
L1044:	fn_link  L1032
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 66 ---
L1052:	fn_link  L1072
	fn_link  L848
	fn_link  L1004
	fn_link  L1044
	fn_combi_t29 5, 0,1,4,2,4,3
L1072:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 67 ---
NanoPrelude.not:	fn_link  L1088
	fn_link  L1092
	fn_combi_t2 3, 2,0,1,0,0,0
L1088:	fn_combi_t0 2, 0,0,0,0,0,0
L1092:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 68 ---
NanoPrelude.rem:	fn_link  L1108
	fn_link  L1132
	fn_combi_t8 4, 0,3,2,1,0,0
L1108:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1132:	fn_y
# --- block 69 ---
Countdown.App:	fn_link  L1148
	fn_link  L1152
	fn_combi_t46 6, 5,0,1,2,3,4
L1148:	fn_combi_t4 4, 3,0,1,2,0,0
L1152:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 70 ---
Countdown.apply:	fn_link  L1172
	fn_link  L1488
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 71 ---
L1172:	fn_link  L1184
	fn_link  L1208
	fn_combi_t22 5, 4,0,3,2,1,0
L1184:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1208:	fn_y
# --- block 72 ---
L1212:	fn_link  NanoPrelude.quot
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 73 ---
L1220:	fn_link  L1232
	fn_link  L1236
	fn_combi_t44 6, 0,4,1,2,3,5
L1232:	fn_elink _prim_lt
L1236:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 74 ---
L1244:	fn_link  L1212
	fn_link  L1220
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 75 ---
L1256:	fn_link  L1268
	fn_link  L1292
	fn_combi_t22 5, 4,0,3,2,1,0
L1268:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1292:	fn_y
# --- block 76 ---
L1296:	fn_link  L1312
	fn_link  L1320
	fn_link  L1324
	fn_combi_t38 6, 0,4,1,2,3,5
L1312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1320:	fn_elink _prim_eq
L1324:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 77 ---
L1332:	fn_link  L1256
	fn_link  L1296
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 78 ---
L1344:	fn_link  L1356
	fn_link  L1360
	fn_combi_t44 5, 0,3,1,2,3,4
L1356:	fn_elink _prim_lt
L1360:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 79 ---
L1368:	fn_link  L1332
	fn_link  L1344
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 80 ---
L1380:	fn_link  L1388
	fn_combi_t24 6, 0,1,5,2,3,4
L1388:	fn_combi_t49 5, 0,4,4,1,2,3
# --- block 81 ---
L1392:	fn_link  L1380
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 82 ---
L1400:	fn_link  Countdown.mul
	fn_link  L1368
	fn_link  L1392
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 83 ---
L1416:	fn_link  L1428
	fn_link  L1432
	fn_combi_t44 5, 0,3,1,2,3,4
L1428:	fn_elink _prim_lt
L1432:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 84 ---
L1440:	fn_link  L1400
	fn_link  L1416
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 85 ---
L1452:	fn_link  L1460
	fn_combi_t29 5, 0,1,4,2,4,3
L1460:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 86 ---
L1464:	fn_link  L1440
	fn_link  L1452
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 87 ---
L1476:	fn_link  L1244
	fn_link  L1464
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 88 ---
L1488:	fn_link  L1476
	fn_combi_t56 5, 1,0,2,4,3,4
# --- block 89 ---
Countdown.mul:	fn_link  L1640
	fn_link  L1664
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 90 ---
L1508:	fn_link  L1524
	fn_link  L1548
	fn_link  Countdown.mul
	fn_combi_t22 4, 0,1,3,3,2,0
L1524:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1548:	fn_y
# --- block 91 ---
L1552:	fn_link  L1564
	fn_link  L1508
	fn_combi_t4 4, 0,2,3,1,0,0
L1564:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 92 ---
L1588:	fn_link  L1600
	fn_link  L1604
	fn_combi_t24 5, 0,4,1,2,0,3
L1600:	fn_elink _prim_eq
L1604:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 93 ---
L1612:	fn_link  L1588
	fn_link  L1624
	fn_combi_t53 6, 0,1,2,3,4,5
L1624:	fn_y
# --- block 94 ---
L1628:	fn_link  L1552
	fn_link  L1612
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 95 ---
L1640:	fn_link  L1628
	fn_link  L1656
	fn_link  NanoPrelude.divMod
	fn_combi_t14 5, 0,4,1,2,3,0
L1656:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 96 ---
L1664:	fn_link  L1676
	fn_link  L1680
	fn_combi_t29 5, 0,4,1,2,4,3
L1676:	fn_elink _prim_eq
L1680:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 97 ---
NanoPrelude.divMod:	fn_link  NanoPrelude.rem
	fn_link  L1700
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 98 ---
L1700:	fn_link  NanoPrelude.quot
	fn_combi_t40 5, 4,0,2,3,1,3
# --- block 99 ---
NanoPrelude.quot:	fn_link  L1720
	fn_link  L1744
	fn_combi_t8 4, 0,3,2,1,0,0
L1720:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1744:	fn_y
# --- block 100 ---
Countdown.Add:	fn_link  L1760
	fn_link  L1764
	fn_combi_t2 3, 2,0,1,0,0,0
L1760:	fn_combi_t0 1, 0,0,0,0,0,0
L1764:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 101 ---
Countdown.Sub:	fn_link  L1784
	fn_link  L1788
	fn_combi_t2 3, 2,0,1,0,0,0
L1784:	fn_combi_t0 1, 0,0,0,0,0,0
L1788:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 102 ---
Countdown.Mul:	fn_link  L1808
	fn_link  L1812
	fn_combi_t2 3, 2,0,1,0,0,0
L1808:	fn_combi_t0 1, 0,0,0,0,0,0
L1812:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 103 ---
Countdown.Div:	fn_link  L1832
	fn_link  L1836
	fn_combi_t2 3, 2,0,1,0,0,0
L1832:	fn_combi_t0 1, 0,0,0,0,0,0
L1836:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 104 ---
Countdown.split:	fn_link  L1948
	fn_link  L1856
	fn_combi_t2 3, 2,0,1,0,0,0
L1856:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 105 ---
L1860:	fn_link  L1872
	fn_link  L1876
	fn_combi_t5 4, 3,0,2,1,0,0
L1872:	fn_combi_t0 1, 0,0,0,0,0,0
L1876:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 106 ---
L1880:	fn_link  Countdown.split
	fn_link  L1860
	fn_link  Countdown.cross
	fn_link  NanoPrelude.map
	fn_combi_t41 6, 0,1,2,4,3,5
# --- block 107 ---
L1900:	fn_link  L1908
	fn_combi_t2 4, 3,1,0,0,0,0
L1908:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 108 ---
L1912:	fn_link  L1900
	fn_combi_t5 4, 3,0,1,2,0,0
# --- block 109 ---
L1920:	fn_link  L1912
	fn_link  L1932
	fn_combi_t40 5, 0,1,2,4,3,4
L1932:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 110 ---
L1936:	fn_link  L1880
	fn_link  L1920
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 111 ---
L1948:	fn_link  L1964
	fn_link  L1936
	fn_link  NanoPrelude.null
	fn_combi_t30 5, 0,4,1,3,4,2
L1964:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
NanoPrelude.map:	fn_link  L1996
	fn_link  L1980
	fn_combi_t3 3, 0,1,2,0,0,0
L1980:	fn_y
# --- block 113 ---
L1984:	fn_link  L1992
	fn_combi_t15 5, 0,1,3,2,4,0
L1992:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 114 ---
L1996:	fn_link  L1984
	fn_link  L2008
	fn_combi_t16 5, 4,0,1,2,3,0
L2008:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 115 ---
Countdown.cross:	fn_link  L2020
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 116 ---
L2020:	fn_link  L2028
	fn_combi_t7 4, 1,0,2,3,0,0
L2028:	fn_combi_t15 5, 4,0,2,1,3,0
# --- block 117 ---
Countdown.Val:	fn_link  L2044
	fn_link  L2048
	fn_combi_t6 4, 3,0,1,2,0,0
L2044:	fn_combi_t1 2, 1,0,0,0,0,0
L2048:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 118 ---
Countdown.choices:	fn_link  Countdown.subs
	fn_link  Countdown.perms
	fn_link  Data.List_Type.concatMap
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 119 ---
Countdown.perms:	fn_link  L2084
	fn_link  L2100
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 120 ---
L2084:	fn_link  Countdown.perms
	fn_link  Countdown.interleave
	fn_link  Data.List_Type.concatMap
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 121 ---
L2100:	fn_link  L2112
	fn_link  L2116
	fn_combi_t2 4, 3,0,1,0,0,0
L2112:	fn_combi_t0 2, 0,0,0,0,0,0
L2116:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
Countdown.interleave:	fn_link  L2144
	fn_link  L2172
	fn_link  L2216
	fn_link  L2140
	fn_combi_t53 5, 0,1,4,2,4,3
L2140:	fn_y
# --- block 123 ---
L2144:	fn_link  L2156
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,3,2,4,0
L2156:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 124 ---
L2160:	fn_link  L2168
	fn_combi_t58 4, 0,0,1,0,2,3
L2168:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 125 ---
L2172:	fn_link  L2160
	fn_link  L2184
	fn_combi_t3 3, 0,1,2,0,0,0
L2184:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 126 ---
L2188:	fn_link  L2196
	fn_combi_t2 4, 3,1,0,0,0,0
L2196:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 127 ---
L2200:	fn_link  L2212
	fn_link  L2188
	fn_combi_t5 5, 4,0,2,1,0,0
L2212:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 128 ---
L2216:	fn_link  L2200
	fn_combi_t45 6, 5,0,1,2,3,4
# --- block 129 ---
Countdown.subs:	fn_link  L2256
	fn_link  L2268
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 130 ---
L2236:	fn_link  L2252
	fn_link  NanoPrelude.map
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t47 5, 0,4,1,2,3,4
L2252:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 131 ---
L2256:	fn_link  Countdown.subs
	fn_link  L2236
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 132 ---
L2268:	fn_link  L2280
	fn_link  L2284
	fn_combi_t2 4, 3,0,1,0,0,0
L2280:	fn_combi_t0 2, 0,0,0,0,0,0
L2284:	fn_combi_t0 2, 0,0,0,0,0,0

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
