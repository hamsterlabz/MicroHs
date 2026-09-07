# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Clausify  (entry @0)
	.text
	.globl	Clausify.clause
	.globl	Clausify.clauses
	.globl	Clausify.clausify
	.globl	Clausify.contains
	.globl	Clausify.din
	.globl	Clausify.din2
	.globl	Clausify.disin
	.globl	Clausify.display
	.globl	Clausify.emitClause
	.globl	Clausify.eq
	.globl	Clausify.eqClause
	.globl	Clausify.eqList
	.globl	Clausify.eqv
	.globl	Clausify.insert
	.globl	Clausify.inter
	.globl	Clausify.main
	.globl	Clausify.negin
	.globl	Clausify.nonTaut
	.globl	Clausify.notTaut
	.globl	Clausify.singleton
	.globl	Clausify.spl
	.globl	Clausify.split
	.globl	Clausify.union
	.globl	Clausify.uniq
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.null
	.globl	NanoPrelude.replicate
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Clausify.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Clausify.main:	fn_link  L248
	fn_elink Clausify.display
# --- block 3 ---
L36:	fn_link  L44
	fn_combi_t1 5, 4,0,0,0,0,0
L44:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L52:	fn_link  L60
	fn_combi_t1 5, 4,0,0,0,0,0
L60:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L68:	fn_link  L36
	fn_link  L52
	fn_elink Clausify.eqv
# --- block 6 ---
L80:	fn_link  L88
	fn_combi_t1 5, 4,0,0,0,0,0
L88:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
L96:	fn_link  L68
	fn_link  L80
	fn_elink Clausify.eqv
# --- block 8 ---
L108:	fn_link  L116
	fn_combi_t1 5, 4,0,0,0,0,0
L116:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 9 ---
L124:	fn_link  L132
	fn_combi_t1 5, 4,0,0,0,0,0
L132:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 10 ---
L140:	fn_link  L108
	fn_link  L124
	fn_elink Clausify.eqv
# --- block 11 ---
L152:	fn_link  L160
	fn_combi_t1 5, 4,0,0,0,0,0
L160:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 12 ---
L168:	fn_link  L140
	fn_link  L152
	fn_elink Clausify.eqv
# --- block 13 ---
L180:	fn_link  L96
	fn_link  L168
	fn_elink Clausify.eqv
# --- block 14 ---
L192:	fn_link  L180
	fn_link  L204
	fn_elink NanoPrelude.replicate
L204:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 15 ---
L212:	fn_link  L220
	fn_combi_t1 5, 4,0,0,0,0,0
L220:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 16 ---
L228:	fn_link  L192
	fn_link  L212
	fn_link  L244
	fn_elink NanoPrelude.foldr
L244:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 17 ---
L248:	fn_link  L228
	fn_elink Clausify.clausify
# --- block 18 ---
Clausify.display:	fn_link  L276
	fn_link  L268
	fn_combi_t2 3, 2,0,1,0,0,0
L268:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 19 ---
L276:	fn_link  L296
	fn_link  Clausify.emitClause
	fn_link  Clausify.display
	fn_link  L320
	fn_combi_t58 6, 0,1,5,2,4,3
L296:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L320:	fn_y
# --- block 20 ---
Clausify.emitClause:	fn_link  L332
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 21 ---
L332:	fn_link  L348
	fn_link  NanoPrelude.sum
	fn_link  L372
	fn_combi_t58 5, 0,1,4,1,3,2
L348:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L372:	fn_y
# --- block 22 ---
NanoPrelude.sum:	fn_link  L388
	fn_link  L396
	fn_elink NanoPrelude.foldr
L388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 23 ---
L396:	fn_link  L408
	fn_link  L432
	fn_combi_t8 4, 0,3,2,1,0,0
L408:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L432:	fn_y
# --- block 24 ---
NanoPrelude.foldr:	fn_link  L452
	fn_link  L448
	fn_combi_t7 4, 0,1,2,3,0,0
L448:	fn_y
# --- block 25 ---
L452:	fn_link  L460
	fn_combi_t16 5, 4,2,0,1,3,0
L460:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 26 ---
Clausify.clausify:	fn_link  L516
	fn_link  Clausify.uniq
	fn_link  L480
	fn_combi_t6 4, 0,1,2,3,0,0
L480:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 27 ---
L484:	fn_link  Clausify.negin
	fn_link  Clausify.disin
	fn_link  L508
	fn_link  Clausify.split
	fn_link  L512
	fn_combi_t48 6, 0,1,2,3,4,5
L508:	fn_combi_t0 1, 0,0,0,0,0,0
L512:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 28 ---
L516:	fn_link  L484
	fn_link  Clausify.clauses
	fn_link  L540
	fn_link  Clausify.nonTaut
	fn_link  L544
	fn_combi_t48 6, 0,1,2,3,4,5
L540:	fn_combi_t0 1, 0,0,0,0,0,0
L544:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 29 ---
Clausify.uniq:	fn_link  L560
	fn_link  L572
	fn_elink NanoPrelude.foldr
L560:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 30 ---
L564:	fn_link  Clausify.eqClause
	fn_elink Clausify.union
# --- block 31 ---
L572:	fn_link  Clausify.singleton
	fn_link  L564
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 32 ---
Clausify.union:	fn_link  L596
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 33 ---
L596:	fn_link  Clausify.contains
	fn_link  NanoPrelude.not
	fn_link  L616
	fn_link  NanoPrelude.filter
	fn_combi_t58 6, 0,1,2,3,4,5
L616:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 34 ---
Data.List_Type.$2b$2b:	fn_link  L648
	fn_link  L632
	fn_combi_t5 4, 0,1,3,2,0,0
L632:	fn_y
# --- block 35 ---
L636:	fn_link  L644
	fn_combi_t6 4, 0,2,1,3,0,0
L644:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L648:	fn_link  L636
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 37 ---
NanoPrelude.filter:	fn_link  L720
	fn_link  L668
	fn_combi_t3 3, 0,1,2,0,0,0
L668:	fn_y
# --- block 38 ---
L672:	fn_link  L684
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L684:	fn_elink _error0
# --- block 39 ---
L688:	fn_link  L696
	fn_combi_t24 5, 0,1,4,2,3,4
L696:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 40 ---
L700:	fn_link  L716
	fn_link  L672
	fn_link  L688
	fn_combi_t26 5, 0,1,3,4,2,4
L716:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L720:	fn_link  L700
	fn_link  L732
	fn_combi_t16 5, 4,0,1,2,3,0
L732:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 43 ---
NanoPrelude.not:	fn_link  L752
	fn_link  L756
	fn_combi_t2 3, 2,0,1,0,0,0
L752:	fn_combi_t0 2, 0,0,0,0,0,0
L756:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 44 ---
Clausify.contains:	fn_link  L796
	fn_link  L772
	fn_combi_t3 3, 0,1,2,0,0,0
L772:	fn_y
# --- block 45 ---
L776:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 6, 0,1,4,3,2,5
# --- block 46 ---
L784:	fn_link  L792
	fn_combi_t47 5, 3,0,1,2,4,4
L792:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
L796:	fn_link  L812
	fn_link  L776
	fn_link  L784
	fn_combi_t15 5, 0,1,3,2,4,0
L812:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 48 ---
NanoPrelude.$7c$7c:	fn_link  L824
	fn_combi_t2 3, 1,2,0,0,0,0
L824:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 49 ---
Clausify.eqClause:	fn_link  L876
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 50 ---
L836:	fn_link  Clausify.eq
	fn_link  Clausify.eqList
	fn_link  NanoPrelude.$26$26
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 51 ---
L852:	fn_link  Clausify.eq
	fn_link  Clausify.eqList
	fn_link  L836
	fn_link  L872
	fn_combi_t10 5, 0,1,4,2,3,0
L872:	fn_combi_t46 6, 0,4,1,2,3,5
# --- block 52 ---
L876:	fn_link  L852
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 53 ---
NanoPrelude.$26$26:	fn_link  L892
	fn_combi_t1 2, 1,0,0,0,0,0
L892:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
Clausify.eqList:	fn_link  L960
	fn_link  L908
	fn_combi_t3 3, 0,1,2,0,0,0
L908:	fn_y
# --- block 55 ---
L912:	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 56 ---
L920:	fn_link  L928
	fn_combi_t48 6, 3,0,1,4,2,5
L928:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
L932:	fn_link  L940
	fn_combi_t0 3, 0,0,0,0,0,0
L940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
L944:	fn_link  L932
	fn_link  L956
	fn_combi_t40 5, 3,4,0,1,2,4
L956:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 59 ---
L960:	fn_link  L912
	fn_link  L920
	fn_link  L944
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 60 ---
Clausify.eq:	fn_link  L992
	fn_link  L996
	fn_link  L1000
	fn_combi_t10 5, 4,3,0,1,2,0
L992:	fn_combi_t0 2, 1,0,0,0,0,0
L996:	fn_combi_t0 2, 0,0,0,0,0,0
L1000:	fn_elink _prim_eq
# --- block 61 ---
Clausify.singleton:	fn_link  L1016
	fn_link  L1020
	fn_combi_t2 3, 0,2,1,0,0,0
L1016:	fn_combi_t0 2, 0,0,0,0,0,0
L1020:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 62 ---
Clausify.nonTaut:	fn_link  Clausify.notTaut
	fn_elink NanoPrelude.filter
# --- block 63 ---
Clausify.notTaut:	fn_link  L1040
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 64 ---
L1040:	fn_link  Clausify.eq
	fn_link  Clausify.inter
	fn_link  NanoPrelude.null
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 65 ---
NanoPrelude.null:	fn_link  L1072
	fn_link  L1068
	fn_combi_t2 3, 2,0,1,0,0,0
L1068:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 66 ---
L1072:	fn_link  L1080
	fn_combi_t0 3, 0,0,0,0,0,0
L1080:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 67 ---
Clausify.inter:	fn_link  Clausify.contains
	fn_link  NanoPrelude.filter
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 68 ---
Clausify.clauses:	fn_link  L1116
	fn_elink NanoPrelude.map
# --- block 69 ---
L1104:	fn_link  L1112
	fn_combi_t2 2, 1,0,0,0,0,0
L1112:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
L1116:	fn_link  L1104
	fn_elink Clausify.clause
# --- block 71 ---
NanoPrelude.map:	fn_link  L1152
	fn_link  L1136
	fn_combi_t3 3, 0,1,2,0,0,0
L1136:	fn_y
# --- block 72 ---
L1140:	fn_link  L1148
	fn_combi_t15 5, 0,1,3,2,4,0
L1148:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 73 ---
L1152:	fn_link  L1140
	fn_link  L1164
	fn_combi_t16 5, 4,0,1,2,3,0
L1164:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 74 ---
Clausify.clause:	fn_link  L1192
	fn_link  L1204
	fn_link  L1316
	fn_link  L1188
	fn_combi_t54 6, 4,0,1,5,3,2
L1188:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 75 ---
L1192:	fn_link  L1200
	fn_combi_t2 2, 1,0,0,0,0,0
L1200:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 76 ---
L1204:	fn_link  Clausify.insert
	fn_combi_t12 5, 4,0,3,1,2,0
# --- block 77 ---
L1212:	fn_link  Clausify.insert
	fn_combi_t16 5, 4,1,0,3,2,0
# --- block 78 ---
L1220:	fn_link  L1236
	fn_link  L1240
	fn_link  L1244
	fn_combi_t15 4, 0,1,3,2,3,0
L1236:	fn_combi_t0 2, 0,0,0,0,0,0
L1240:	fn_combi_t0 3, 0,0,0,0,0,0
L1244:	fn_combi_t37 5, 4,0,0,1,2,3
# --- block 79 ---
L1248:	fn_link  L1260
	fn_link  Clausify.clause
	fn_combi_t54 5, 0,0,1,2,3,4
L1260:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 80 ---
L1264:	fn_link  L1276
	fn_link  L1280
	fn_combi_t6 4, 0,2,1,3,0,0
L1276:	fn_combi_t0 3, 0,0,0,0,0,0
L1280:	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 81 ---
L1284:	fn_link  L1292
	fn_combi_t38 5, 0,1,4,2,3,4
L1292:	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 82 ---
L1296:	fn_link  L1220
	fn_link  L1248
	fn_link  L1264
	fn_link  L1284
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 83 ---
L1316:	fn_link  L1212
	fn_link  L1296
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 84 ---
Clausify.insert:	fn_link  L1396
	fn_link  L1416
	fn_link  L1344
	fn_combi_t19 4, 0,1,2,3,3,0
L1344:	fn_y
# --- block 85 ---
L1348:	fn_link  L1356
	fn_combi_t16 4, 0,1,0,2,3,0
L1356:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 86 ---
L1360:	fn_link  L1368
	fn_combi_t6 4, 0,2,1,3,0,0
L1368:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 87 ---
L1372:	fn_link  L1380
	fn_combi_t44 5, 3,1,0,2,3,4
L1380:	fn_elink _prim_le
# --- block 88 ---
L1384:	fn_link  L1360
	fn_link  L1372
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 89 ---
L1396:	fn_link  L1348
	fn_link  L1384
	fn_link  L1412
	fn_combi_t40 5, 0,1,3,4,2,3
L1412:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 90 ---
L1416:	fn_link  L1428
	fn_link  L1432
	fn_combi_t40 6, 5,0,3,1,2,4
L1428:	fn_combi_t0 2, 0,0,0,0,0,0
L1432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 91 ---
Clausify.split:	fn_link  L1444
	fn_elink Clausify.spl
L1444:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 92 ---
Clausify.spl:	fn_link  L1468
	fn_link  L1544
	fn_link  L1464
	fn_combi_t20 4, 0,1,3,2,3,0
L1464:	fn_y
# --- block 93 ---
L1468:	fn_link  L1480
	fn_link  L1484
	fn_combi_t5 4, 0,1,3,2,0,0
L1480:	fn_combi_t1 5, 4,0,0,0,0,0
L1484:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 94 ---
L1488:	fn_link  L1500
	fn_link  L1504
	fn_combi_t5 4, 0,1,3,2,0,0
L1500:	fn_combi_t1 5, 3,0,0,0,0,0
L1504:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 95 ---
L1508:	fn_link  L1520
	fn_link  L1524
	fn_combi_t12 5, 0,1,3,4,2,0
L1520:	fn_combi_t2 6, 3,0,1,0,0,0
L1524:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 96 ---
L1528:	fn_link  Clausify.spl
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 97 ---
L1536:	fn_link  L1528
	fn_combi_t24 6, 5,0,4,1,2,3
# --- block 98 ---
L1544:	fn_link  L1488
	fn_link  L1508
	fn_link  L1536
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 99 ---
Clausify.disin:	fn_link  L1580
	fn_link  L1584
	fn_link  L1588
	fn_link  L1600
	fn_combi_t9 5, 4,0,1,2,3,0
L1580:	fn_combi_t1 5, 4,0,0,0,0,0
L1584:	fn_combi_t1 5, 3,0,0,0,0,0
# --- block 100 ---
L1588:	fn_link  Clausify.disin
	fn_link  Clausify.din
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 101 ---
L1600:	fn_link  Clausify.disin
	fn_link  L1612
	fn_combi_t15 4, 0,1,2,1,3,0
L1612:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 102 ---
Clausify.din:	fn_link  L1628
	fn_link  L1712
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 103 ---
L1628:	fn_link  L1640
	fn_link  Clausify.din2
	fn_combi_t5 4, 0,1,3,2,0,0
L1640:	fn_combi_t1 5, 4,0,0,0,0,0
# --- block 104 ---
L1644:	fn_link  L1656
	fn_link  Clausify.din2
	fn_combi_t5 4, 0,1,3,2,0,0
L1656:	fn_combi_t1 5, 3,0,0,0,0,0
# --- block 105 ---
L1660:	fn_link  L1672
	fn_link  Clausify.din2
	fn_combi_t12 5, 0,1,3,4,2,0
L1672:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 106 ---
L1676:	fn_link  Clausify.din
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 107 ---
L1684:	fn_link  Clausify.din
	fn_link  L1696
	fn_combi_t40 6, 0,1,4,3,2,5
L1696:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 108 ---
L1700:	fn_link  L1676
	fn_link  L1684
	fn_combi_t19 4, 2,0,1,3,3,0
# --- block 109 ---
L1712:	fn_link  L1644
	fn_link  L1660
	fn_link  L1700
	fn_link  L1732
	fn_combi_t10 5, 0,1,4,2,3,0
L1732:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 110 ---
Clausify.din2:	fn_link  L1748
	fn_link  L1836
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 111 ---
L1748:	fn_link  L1760
	fn_link  L1764
	fn_combi_t6 4, 0,2,1,3,0,0
L1760:	fn_combi_t1 5, 4,0,0,0,0,0
L1764:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 112 ---
L1768:	fn_link  L1780
	fn_link  L1784
	fn_combi_t6 4, 0,2,1,3,0,0
L1780:	fn_combi_t1 5, 3,0,0,0,0,0
L1784:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 113 ---
L1788:	fn_link  L1796
	fn_combi_t16 4, 0,1,0,2,3,0
L1796:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 114 ---
L1800:	fn_link  Clausify.din
	fn_link  L1812
	fn_combi_t40 6, 0,1,3,4,2,5
L1812:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 115 ---
L1816:	fn_link  Clausify.din
	fn_link  L1800
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 116 ---
L1828:	fn_link  L1816
	fn_combi_t24 6, 5,0,1,2,3,4
# --- block 117 ---
L1836:	fn_link  L1768
	fn_link  L1788
	fn_link  L1828
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 118 ---
Clausify.negin:	fn_link  L1872
	fn_link  L1984
	fn_link  L2004
	fn_link  L2020
	fn_combi_t9 5, 4,0,1,2,3,0
L1872:	fn_combi_t1 5, 4,0,0,0,0,0
# --- block 119 ---
L1876:	fn_link  L1888
	fn_link  L1892
	fn_combi_t3 3, 0,1,2,0,0,0
L1888:	fn_combi_t1 5, 4,0,0,0,0,0
L1892:	fn_combi_t1 5, 3,0,0,0,0,0
# --- block 120 ---
L1896:	fn_link  L1908
	fn_link  Clausify.negin
	fn_combi_t3 3, 0,1,2,0,0,0
L1908:	fn_combi_t1 5, 3,0,0,0,0,0
# --- block 121 ---
L1912:	fn_link  L1896
	fn_link  L1932
	fn_link  Clausify.negin
	fn_link  L1936
	fn_combi_t41 6, 0,1,2,4,3,5
L1932:	fn_combi_t1 5, 3,0,0,0,0,0
L1936:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 122 ---
L1940:	fn_link  L1952
	fn_link  Clausify.negin
	fn_combi_t3 3, 0,1,2,0,0,0
L1952:	fn_combi_t1 5, 3,0,0,0,0,0
# --- block 123 ---
L1956:	fn_link  L1940
	fn_link  L1976
	fn_link  Clausify.negin
	fn_link  L1980
	fn_combi_t41 6, 0,1,2,4,3,5
L1976:	fn_combi_t1 5, 3,0,0,0,0,0
L1980:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 124 ---
L1984:	fn_link  L1876
	fn_link  Clausify.negin
	fn_link  L1912
	fn_link  L1956
	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 125 ---
L2004:	fn_link  Clausify.negin
	fn_link  L2016
	fn_combi_t15 4, 0,1,2,1,3,0
L2016:	fn_combi_t2 6, 3,0,1,0,0,0
# --- block 126 ---
L2020:	fn_link  Clausify.negin
	fn_link  L2032
	fn_combi_t15 4, 0,1,2,1,3,0
L2032:	fn_combi_t2 6, 2,0,1,0,0,0
# --- block 127 ---
NanoPrelude.replicate:	fn_link  L2052
	fn_link  L2124
	fn_link  L2136
	fn_combi_t10 4, 0,1,3,2,3,0
L2052:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 128 ---
L2056:	fn_link  L2072
	fn_link  L2096
	fn_link  NanoPrelude.replicate
	fn_combi_t8 4, 0,1,3,2,0,0
L2072:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2096:	fn_y
# --- block 129 ---
L2100:	fn_link  L2116
	fn_link  L2120
	fn_link  Data.Bool_Type.True
	fn_combi_t48 5, 0,1,2,4,3,4
L2116:	fn_combi_t2 4, 3,0,1,0,0,0
L2120:	fn_elink _error0
# --- block 130 ---
L2124:	fn_link  L2056
	fn_link  L2100
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 131 ---
L2136:	fn_link  L2148
	fn_link  L2152
	fn_combi_t29 6, 0,4,1,2,5,3
L2148:	fn_elink _prim_le
L2152:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 132 ---
Clausify.eqv:	fn_link  L2180
	fn_link  L2184
	fn_link  L2192
	fn_link  L2188
	fn_combi_t24 5, 0,1,4,2,3,4
L2180:	fn_combi_t1 5, 3,0,0,0,0,0
L2184:	fn_combi_t2 6, 3,0,1,0,0,0
L2188:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 133 ---
L2192:	fn_link  L2208
	fn_link  L2212
	fn_link  L2216
	fn_combi_t19 5, 0,1,2,3,4,0
L2208:	fn_combi_t1 5, 3,0,0,0,0,0
L2212:	fn_combi_t2 6, 3,0,1,0,0,0
L2216:	fn_combi_t2 6, 2,0,1,0,0,0

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
