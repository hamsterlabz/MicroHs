# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Cichelli  (entry @0)
	.text
	.globl	Cichelli.append
	.globl	Cichelli.assoc
	.globl	Cichelli.assocm
	.globl	Cichelli.attribkeys
	.globl	Cichelli.bench
	.globl	Cichelli.blocked
	.globl	Cichelli.blocked$27
	.globl	Cichelli.cichelli
	.globl	Cichelli.ends
	.globl	Cichelli.findhash
	.globl	Cichelli.findhash$27
	.globl	Cichelli.first
	.globl	Cichelli.firstSuccess
	.globl	Cichelli.freqtab
	.globl	Cichelli.fromTo
	.globl	Cichelli.hash
	.globl	Cichelli.hashS
	.globl	Cichelli.headL
	.globl	Cichelli.hinsert
	.globl	Cichelli.histo
	.globl	Cichelli.keys
	.globl	Cichelli.lastL
	.globl	Cichelli.maxI
	.globl	Cichelli.maxm
	.globl	Cichelli.maxval
	.globl	Cichelli.member
	.globl	Cichelli.minI
	.globl	Cichelli.minm
	.globl	Cichelli.numberofkeys
	.globl	Cichelli.partition$27
	.globl	Cichelli.prog
	.globl	Cichelli.showHF
	.globl	Cichelli.showN
	.globl	Cichelli.showPair
	.globl	Cichelli.showStatus
	.globl	Cichelli.subset
	.globl	Cichelli.takeL
	.globl	Cichelli.union
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.all
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Cichelli.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Cichelli.bench:	fn_link  L76
L32:	fn_elink Cichelli.hashS
# --- block 3 ---
L36:	fn_link  L48
L40:	fn_link  L56
L44:	fn_elink Cichelli.fromTo
L48:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L56:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 4 ---
L64:	fn_link  L36
L68:	fn_link  Cichelli.prog
L72:	fn_elink NanoPrelude.map
# --- block 5 ---
L76:	fn_link  L64
	fn_elink NanoPrelude.concat
# --- block 6 ---
Cichelli.hashS:	fn_link  L96
L88:	fn_link  L184
L92:	fn_elink NanoPrelude.foldl
L96:	fn_box
L100:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
L104:	fn_link  L124
L108:	fn_link  L148
L112:	fn_link  L172
L116:	fn_link  L180
L120:	fn_combi_t41 6, 0,1,4,2,5,3
L124:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L148:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L172:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L180:	fn_y
# --- block 8 ---
L184:	fn_link  L104
	fn_link  L196
	fn_combi_t7 4, 0,1,2,3,0,0
L196:	fn_y
# --- block 9 ---
NanoPrelude.foldl:	fn_link  L216
	fn_link  L212
	fn_combi_t3 3, 0,1,2,0,0,0
L212:	fn_y
# --- block 10 ---
L216:	fn_link  L224
	fn_combi_t46 5, 4,3,0,1,2,3
L224:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 11 ---
NanoPrelude.concat:	fn_link  L240
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
NanoPrelude.foldr:	fn_link  L260
	fn_link  L256
	fn_combi_t7 4, 0,1,2,3,0,0
L256:	fn_y
# --- block 13 ---
L260:	fn_link  L268
	fn_combi_t16 5, 4,2,0,1,3,0
L268:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 14 ---
Data.List_Type.$2b$2b:	fn_link  L300
	fn_link  L284
	fn_combi_t5 4, 0,1,3,2,0,0
L284:	fn_y
# --- block 15 ---
L288:	fn_link  L296
	fn_combi_t6 4, 0,2,1,3,0,0
L296:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L300:	fn_link  L288
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 17 ---
NanoPrelude.map:	fn_link  L336
	fn_link  L320
	fn_combi_t3 3, 0,1,2,0,0,0
L320:	fn_y
# --- block 18 ---
L324:	fn_link  L332
	fn_combi_t15 5, 0,1,3,2,4,0
L332:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L336:	fn_link  L324
	fn_link  L348
	fn_combi_t16 5, 4,0,1,2,3,0
L348:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
Cichelli.prog:	fn_link  Cichelli.cichelli
	fn_link  Cichelli.showStatus
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 21 ---
Cichelli.showStatus:	fn_link  L564
	fn_link  L744
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 22 ---
L376:	fn_link  Cichelli.showHF
	fn_link  L392
	fn_link  L400
	fn_combi_t6 4, 0,1,2,3,0,0
L392:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
L400:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L404:	fn_link  L376
	fn_link  Cichelli.showN
	fn_link  Cichelli.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 24 ---
L420:	fn_link  L432
	fn_link  L436
	fn_combi_t2 4, 3,0,1,0,0,0
L432:	fn_combi_t0 2, 0,0,0,0,0,0
L436:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 25 ---
L444:	fn_link  L420
	fn_link  L456
	fn_combi_t2 4, 3,0,1,0,0,0
L456:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 26 ---
L464:	fn_link  L444
	fn_link  L476
	fn_combi_t2 4, 3,0,1,0,0,0
L476:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 27 ---
L484:	fn_link  L464
	fn_link  L496
	fn_combi_t2 4, 3,0,1,0,0,0
L496:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 28 ---
L504:	fn_link  L484
	fn_link  L516
	fn_combi_t2 4, 3,0,1,0,0,0
L516:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 29 ---
L524:	fn_link  L504
	fn_link  L536
	fn_combi_t2 4, 3,0,1,0,0,0
L536:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 30 ---
L544:	fn_link  L524
	fn_link  L556
	fn_combi_t2 4, 3,0,1,0,0,0
L556:	fn_box
	.word 0x00000059	# raw word 89
	fn_box_body
# --- block 31 ---
L564:	fn_link  L404
	fn_link  L544
	fn_link  Cichelli.append
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 32 ---
L580:	fn_link  L592
	fn_link  L596
	fn_combi_t2 4, 3,0,1,0,0,0
L592:	fn_combi_t0 2, 0,0,0,0,0,0
L596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 33 ---
L604:	fn_link  L580
	fn_link  L616
	fn_combi_t2 4, 3,0,1,0,0,0
L616:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 34 ---
L624:	fn_link  L604
	fn_link  L636
	fn_combi_t2 4, 3,0,1,0,0,0
L636:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 35 ---
L644:	fn_link  L624
	fn_link  L656
	fn_combi_t2 4, 3,0,1,0,0,0
L656:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 36 ---
L664:	fn_link  L644
	fn_link  L676
	fn_combi_t2 4, 3,0,1,0,0,0
L676:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 37 ---
L684:	fn_link  L664
	fn_link  L696
	fn_combi_t2 4, 3,0,1,0,0,0
L696:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 38 ---
L704:	fn_link  L684
	fn_link  L716
	fn_combi_t2 4, 3,0,1,0,0,0
L716:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 39 ---
L724:	fn_link  L704
	fn_link  L736
	fn_combi_t2 4, 3,0,1,0,0,0
L736:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 40 ---
L744:	fn_link  Cichelli.showN
	fn_link  L724
	fn_link  Cichelli.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 41 ---
Cichelli.append:	fn_link  L768
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 42 ---
L768:	fn_link  Cichelli.append
	fn_link  L780
	fn_combi_t16 5, 0,3,1,4,2,0
L780:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 43 ---
Cichelli.showN:	fn_link  L796
	fn_link  L956
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 44 ---
L796:	fn_link  L812
	fn_link  L816
	fn_link  L840
	fn_combi_t13 6, 5,0,3,1,2,0
L812:	fn_combi_t0 2, 0,0,0,0,0,0
L816:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L840:	fn_y
# --- block 45 ---
L844:	fn_link  L864
	fn_link  L888
	fn_link  NanoPrelude.rem
	fn_link  L896
	fn_combi_t18 5, 0,1,4,2,3,0
L864:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L888:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L896:	fn_y
# --- block 46 ---
L900:	fn_link  L912
	fn_link  L844
	fn_combi_t5 5, 4,0,2,1,0,0
L912:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 47 ---
L916:	fn_link  L936
	fn_link  NanoPrelude.quot
	fn_link  Cichelli.showN
	fn_link  Cichelli.append
	fn_combi_t21 5, 0,1,2,4,3,0
L936:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 48 ---
L944:	fn_link  L900
	fn_link  L916
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 49 ---
L956:	fn_link  L944
	fn_link  L972
	fn_link  L976
	fn_combi_t15 4, 0,3,1,2,3,0
L972:	fn_elink _prim_lt
L976:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 50 ---
NanoPrelude.quot:	fn_link  L996
	fn_link  L1020
	fn_combi_t8 4, 0,3,2,1,0,0
L996:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1020:	fn_y
# --- block 51 ---
NanoPrelude.rem:	fn_link  L1036
	fn_link  L1060
	fn_combi_t8 4, 0,3,2,1,0,0
L1036:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1060:	fn_y
# --- block 52 ---
Cichelli.showHF:	fn_link  L1176
	fn_link  L1228
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 53 ---
L1076:	fn_link  Cichelli.showPair
	fn_link  Cichelli.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 54 ---
L1088:	fn_link  L1076
	fn_link  L1104
	fn_link  L1112
	fn_combi_t46 6, 0,1,2,3,4,5
L1104:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L1112:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 55 ---
L1116:	fn_link  L1128
	fn_link  L1132
	fn_combi_t2 4, 3,0,1,0,0,0
L1128:	fn_combi_t0 2, 0,0,0,0,0,0
L1132:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 56 ---
L1140:	fn_link  L1088
	fn_link  L1116
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 57 ---
L1152:	fn_link  L1140
	fn_link  L1172
	fn_link  Cichelli.showPair
	fn_link  Cichelli.append
	fn_combi_t44 6, 0,1,4,2,3,5
L1172:	fn_y
# --- block 58 ---
L1176:	fn_link  L1152
	fn_link  L1192
	fn_link  L1200
	fn_combi_t16 5, 0,1,2,3,4,0
L1192:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L1200:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 59 ---
L1204:	fn_link  L1216
	fn_link  L1220
	fn_combi_t2 4, 3,0,1,0,0,0
L1216:	fn_combi_t0 2, 0,0,0,0,0,0
L1220:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 60 ---
L1228:	fn_link  L1204
	fn_link  L1240
	fn_combi_t2 4, 3,0,1,0,0,0
L1240:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 61 ---
Cichelli.showPair:	fn_link  L1380
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 62 ---
L1256:	fn_link  L1268
	fn_link  L1272
	fn_combi_t2 4, 3,0,1,0,0,0
L1268:	fn_combi_t0 2, 0,0,0,0,0,0
L1272:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 63 ---
L1280:	fn_link  L1292
	fn_link  L1296
	fn_combi_t2 4, 3,0,1,0,0,0
L1292:	fn_combi_t0 2, 0,0,0,0,0,0
L1296:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 64 ---
L1304:	fn_link  L1280
	fn_link  L1316
	fn_combi_t2 4, 3,0,1,0,0,0
L1316:	fn_box
	.word 0x00000027	# raw word 39
	fn_box_body
# --- block 65 ---
L1324:	fn_link  L1304
	fn_combi_t2 4, 3,1,0,0,0,0
# --- block 66 ---
L1332:	fn_link  L1324
	fn_link  L1344
	fn_combi_t6 5, 4,0,1,2,0,0
L1344:	fn_box
	.word 0x00000027	# raw word 39
	fn_box_body
# --- block 67 ---
L1352:	fn_link  L1332
	fn_link  L1364
	fn_combi_t6 5, 4,0,1,2,0,0
L1364:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 68 ---
L1372:	fn_link  Cichelli.append
	fn_combi_t47 5, 0,1,0,2,4,3
# --- block 69 ---
L1380:	fn_link  L1256
	fn_link  Cichelli.showN
	fn_link  L1352
	fn_link  L1372
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 70 ---
Cichelli.cichelli:	fn_link  L1460
	fn_link  L1424
	fn_link  Cichelli.blocked
	fn_link  L1428
	fn_link  Cichelli.findhash
	fn_combi_t56 6, 0,1,2,3,4,5
L1424:	fn_combi_t0 1, 0,0,0,0,0,0
L1428:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 71 ---
L1432:	fn_link  Cichelli.keys
	fn_link  L1452
	fn_link  NanoPrelude.rem
	fn_link  Cichelli.takeL
	fn_combi_t12 5, 0,1,4,2,3,0
L1452:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 72 ---
L1460:	fn_link  L1432
	fn_link  Cichelli.keys
	fn_link  Cichelli.append
	fn_link  Cichelli.attribkeys
	fn_combi_t20 5, 0,1,2,3,4,0
# --- block 73 ---
Cichelli.findhash:	fn_link  L1492
	fn_link  L1496
	fn_elink Cichelli.findhash$27
L1492:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 74 ---
L1496:	fn_link  L1512
	fn_link  L1516
	fn_link  L1520
	fn_combi_t4 4, 3,0,1,2,0,0
L1512:	fn_combi_t0 2, 0,0,0,0,0,0
L1516:	fn_combi_t0 2, 0,0,0,0,0,0
L1520:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 75 ---
Cichelli.findhash$27:	fn_link  L2236
	fn_link  L2248
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 76 ---
L1536:	fn_link  Cichelli.append
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 77 ---
L1544:	fn_link  Cichelli.findhash$27
	fn_combi_t4 4, 0,3,2,1,0,0
# --- block 78 ---
L1552:	fn_link  L1560
	fn_combi_t1 3, 1,0,0,0,0,0
L1560:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 79 ---
L1568:	fn_link  L1552
	fn_link  Cichelli.hash
	fn_link  Cichelli.hinsert
	fn_combi_t26 6, 0,1,5,4,3,2
# --- block 80 ---
L1584:	fn_link  L1544
	fn_link  L1568
	fn_link  L1600
	fn_combi_t5 4, 0,1,3,2,0,0
L1600:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 81 ---
L1604:	fn_link  L1536
	fn_link  L1584
	fn_link  L1620
	fn_combi_t5 4, 0,1,3,2,0,0
L1620:	fn_combi_t42 6, 0,3,4,1,2,5
# --- block 82 ---
L1624:	fn_link  L1632
	fn_combi_t1 3, 1,0,0,0,0,0
L1632:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 83 ---
L1636:	fn_link  L1648
	fn_link  L1652
	fn_combi_t12 6, 5,0,2,3,1,0
L1648:	fn_combi_t0 2, 0,0,0,0,0,0
L1652:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 84 ---
L1656:	fn_link  L1636
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 85 ---
L1664:	fn_link  Cichelli.firstSuccess
	fn_combi_t58 6, 5,0,1,2,3,4
# --- block 86 ---
L1672:	fn_link  L1664
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 87 ---
L1680:	fn_link  Cichelli.maxval
	fn_link  L1704
	fn_link  Cichelli.fromTo
	fn_link  L1656
	fn_link  L1672
	fn_combi_t24 6, 0,1,5,2,3,4
L1704:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 88 ---
L1712:	fn_link  L1624
	fn_link  L1680
	fn_combi_t37 6, 0,2,3,4,1,3
# --- block 89 ---
L1724:	fn_link  L1736
	fn_link  L1740
	fn_combi_t12 6, 5,0,2,3,1,0
L1736:	fn_combi_t0 2, 0,0,0,0,0,0
L1740:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 90 ---
L1744:	fn_link  L1724
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 91 ---
L1752:	fn_link  L1776
	fn_link  Cichelli.fromTo
	fn_link  L1744
	fn_link  Cichelli.firstSuccess
	fn_link  L1784
	fn_combi_t25 6, 0,1,2,5,3,4
L1776:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1784:	fn_combi_t44 7, 0,1,5,2,3,4
# --- block 92 ---
L1788:	fn_link  L1800
	fn_link  L1804
	fn_combi_t12 6, 5,0,2,3,1,0
L1800:	fn_combi_t0 2, 0,0,0,0,0,0
L1804:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 93 ---
L1808:	fn_link  L1788
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 94 ---
L1816:	fn_link  Cichelli.firstSuccess
	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 95 ---
L1824:	fn_link  Cichelli.maxval
	fn_link  L1848
	fn_link  Cichelli.fromTo
	fn_link  L1808
	fn_link  L1816
	fn_combi_t24 6, 0,1,5,2,3,4
L1848:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 96 ---
L1856:	fn_link  Cichelli.maxval
	fn_link  L1868
	fn_elink Cichelli.fromTo
L1868:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 97 ---
L1876:	fn_link  L1888
	fn_link  L1892
	fn_combi_t40 6, 0,1,2,4,3,5
L1888:	fn_combi_t2 3, 2,0,1,0,0,0
L1892:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 98 ---
L1896:	fn_link  L1876
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 99 ---
L1904:	fn_link  L1912
	fn_combi_t44 6, 0,1,5,2,3,4
L1912:	fn_y
# --- block 100 ---
L1916:	fn_link  L1904
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 101 ---
L1924:	fn_link  Cichelli.maxval
	fn_link  L1948
	fn_link  Cichelli.fromTo
	fn_link  L1896
	fn_link  L1916
	fn_combi_t24 6, 0,1,5,2,3,4
L1948:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 102 ---
L1956:	fn_link  L1924
	fn_link  L1968
	fn_combi_t6 4, 3,0,1,2,0,0
L1968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 103 ---
L1972:	fn_link  L1856
	fn_link  L1956
	fn_y
# --- block 104 ---
L1984:	fn_link  L1996
	fn_link  L2000
	fn_combi_t12 6, 5,0,2,3,1,0
L1996:	fn_combi_t0 2, 0,0,0,0,0,0
L2000:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 105 ---
L2004:	fn_link  L1984
	fn_link  L2020
	fn_link  L2024
	fn_combi_t5 4, 0,1,3,2,0,0
L2020:	fn_combi_t2 3, 2,0,1,0,0,0
L2024:	fn_combi_t44 7, 6,0,3,1,2,4
# --- block 106 ---
L2028:	fn_link  L2004
	fn_combi_t51 6, 3,0,1,2,4,5
# --- block 107 ---
L2036:	fn_link  L2028
	fn_combi_t18 5, 4,0,1,2,3,0
# --- block 108 ---
L2044:	fn_link  L1972
	fn_link  L2036
	fn_link  Cichelli.firstSuccess
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 109 ---
L2060:	fn_link  L2068
	fn_combi_t44 5, 3,2,0,1,3,4
L2068:	fn_elink _prim_eq
# --- block 110 ---
L2072:	fn_link  L2044
	fn_link  L2060
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 111 ---
L2084:	fn_link  L2072
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 112 ---
L2092:	fn_link  L1824
	fn_link  L2084
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 113 ---
L2104:	fn_link  L2112
	fn_combi_t40 5, 0,1,3,4,2,4
L2112:	fn_combi_t40 5, 3,4,0,1,2,4
# --- block 114 ---
L2116:	fn_link  Cichelli.maxval
	fn_link  L1752
	fn_link  L2092
	fn_link  L2104
	fn_combi_t44 5, 0,1,4,2,4,3
# --- block 115 ---
L2136:	fn_link  L1712
	fn_link  L2116
	fn_link  L2152
	fn_combi_t5 4, 0,1,3,2,0,0
L2152:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 116 ---
L2156:	fn_link  Cichelli.assocm
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 117 ---
L2164:	fn_link  Cichelli.assocm
	fn_link  L2176
	fn_combi_t37 6, 0,1,4,3,2,5
L2176:	fn_combi_t30 7, 4,5,0,1,2,3
# --- block 118 ---
L2180:	fn_link  L2156
	fn_link  L2164
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 119 ---
L2192:	fn_link  L2180
	fn_link  L2204
	fn_combi_t3 3, 0,1,2,0,0,0
L2204:	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 120 ---
L2208:	fn_link  L2136
	fn_link  L2192
	fn_link  L2224
	fn_combi_t5 4, 0,1,3,2,0,0
L2224:	fn_combi_t39 6, 0,5,1,5,2,3
# --- block 121 ---
L2228:	fn_link  L2208
	fn_combi_t53 5, 3,0,1,2,3,4
# --- block 122 ---
L2236:	fn_link  L1604
	fn_link  L2228
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 123 ---
L2248:	fn_link  L2260
	fn_link  L2268
	fn_combi_t40 5, 4,0,1,3,2,3
L2260:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L2268:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 124 ---
Cichelli.assocm:	fn_link  L2332
	fn_link  L2284
	fn_combi_t3 3, 0,1,2,0,0,0
L2284:	fn_y
# --- block 125 ---
L2288:	fn_link  L2296
	fn_combi_t15 5, 4,1,0,2,3,0
L2296:	fn_elink _prim_eq
# --- block 126 ---
L2300:	fn_link  L2316
	fn_link  L2288
	fn_link  L2320
	fn_combi_t5 4, 0,1,3,2,0,0
L2316:	fn_combi_t1 3, 2,0,0,0,0,0
L2320:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 127 ---
L2324:	fn_link  L2300
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 128 ---
L2332:	fn_link  L2324
	fn_link  L2344
	fn_combi_t16 5, 4,0,1,2,3,0
L2344:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 129 ---
Cichelli.firstSuccess:	fn_link  NanoPrelude.map
	fn_link  L2364
	fn_link  Cichelli.first
	fn_combi_t16 5, 0,1,2,3,4,0
L2364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 130 ---
Cichelli.first:	fn_link  L2480
	fn_link  L2384
	fn_combi_t15 4, 3,0,2,1,2,0
L2384:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 131 ---
L2388:	fn_link  L2404
	fn_link  L2428
	fn_link  L2432
	fn_combi_t22 5, 0,1,4,3,2,0
L2404:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2428:	fn_y
L2432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 132 ---
L2436:	fn_link  L2452
	fn_link  L2476
	fn_link  Cichelli.first
	fn_combi_t36 6, 0,1,5,3,2,4
L2452:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2476:	fn_y
# --- block 133 ---
L2480:	fn_link  L2388
	fn_link  L2436
	fn_combi_t40 5, 3,0,2,4,1,2
# --- block 134 ---
Cichelli.fromTo:	fn_link  L2508
	fn_link  L2556
	fn_link  L2572
	fn_combi_t10 4, 0,1,3,2,3,0
L2508:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 135 ---
L2512:	fn_link  L2528
	fn_link  L2552
	fn_link  Cichelli.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L2528:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2552:	fn_y
# --- block 136 ---
L2556:	fn_link  L2512
	fn_link  L2568
	fn_combi_t16 4, 0,2,1,2,3,0
L2568:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 137 ---
L2572:	fn_link  L2580
	fn_combi_t29 5, 4,3,0,1,4,2
L2580:	fn_elink _prim_gt
# --- block 138 ---
Cichelli.maxval:	fn_link  Cichelli.freqtab
	fn_elink NanoPrelude.length
# --- block 139 ---
NanoPrelude.length:	fn_link  L2604
	fn_link  L2652
	fn_y
L2604:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 140 ---
L2612:	fn_link  L2624
	fn_link  L2648
	fn_combi_t8 5, 2,0,3,1,0,0
L2624:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2648:	fn_y
# --- block 141 ---
L2652:	fn_link  L2612
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 142 ---
Cichelli.freqtab:	fn_link  L2688
	fn_elink Cichelli.histo
# --- block 143 ---
L2668:	fn_link  Cichelli.keys
	fn_elink Cichelli.attribkeys
# --- block 144 ---
L2676:	fn_link  L2668
	fn_link  Cichelli.ends
	fn_elink NanoPrelude.map
# --- block 145 ---
L2688:	fn_link  L2676
	fn_elink NanoPrelude.concat
# --- block 146 ---
Cichelli.histo:	fn_link  L2708
	fn_link  L2872
	fn_elink NanoPrelude.foldr
L2708:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 147 ---
L2712:	fn_link  L2724
	fn_link  L2748
	fn_combi_t17 5, 4,2,0,3,1,0
L2724:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2748:	fn_y
# --- block 148 ---
L2752:	fn_link  L2712
	fn_link  L2764
	fn_combi_t12 5, 0,1,3,4,2,0
L2764:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 149 ---
L2768:	fn_link  L2776
	fn_combi_t6 4, 0,2,1,3,0,0
L2776:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 150 ---
L2780:	fn_link  L2788
	fn_combi_t38 6, 4,1,0,2,3,5
L2788:	fn_elink _prim_eq
# --- block 151 ---
L2792:	fn_link  L2768
	fn_link  L2780
	fn_link  L2808
	fn_combi_t44 6, 0,1,3,2,4,5
L2808:	fn_combi_t29 5, 0,1,2,3,4,4
# --- block 152 ---
L2812:	fn_link  L2820
	fn_combi_t2 3, 2,1,0,0,0,0
L2820:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 153 ---
L2828:	fn_link  L2840
	fn_link  L2812
	fn_combi_t5 5, 4,0,2,1,0,0
L2840:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 154 ---
L2844:	fn_link  L2792
	fn_link  L2864
	fn_link  L2828
	fn_link  L2868
	fn_combi_t38 5, 0,1,4,2,3,4
L2864:	fn_combi_t56 4, 2,0,2,3,1,3
L2868:	fn_combi_t47 6, 5,0,1,2,4,3
# --- block 155 ---
L2872:	fn_link  L2752
	fn_link  L2844
	fn_link  L2888
	fn_combi_t7 4, 0,1,3,2,0,0
L2888:	fn_y
# --- block 156 ---
Cichelli.ends:	fn_link  L2908
	fn_link  L2904
	fn_combi_t3 3, 2,0,1,0,0,0
L2904:	fn_combi_t6 7, 6,2,0,3,0,0
# --- block 157 ---
L2908:	fn_link  L2916
	fn_combi_t2 4, 3,1,0,0,0,0
L2916:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 158 ---
Cichelli.attribkeys:	fn_link  L2948
	fn_elink NanoPrelude.map
# --- block 159 ---
L2928:	fn_link  Cichelli.lastL
	fn_link  Cichelli.headL
	fn_link  L2944
	fn_combi_t39 4, 0,3,1,3,2,3
L2944:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 160 ---
L2948:	fn_link  NanoPrelude.length
	fn_link  L2928
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 161 ---
Cichelli.headL:	fn_link  L2972
	fn_link  L2976
	fn_combi_t2 3, 2,0,1,0,0,0
L2972:	fn_combi_t0 2, 0,0,0,0,0,0
L2976:	fn_elink _error0
# --- block 162 ---
Cichelli.lastL:	fn_link  L3004
	fn_link  L2992
	fn_combi_t2 3, 2,0,1,0,0,0
L2992:	fn_elink _error0
# --- block 163 ---
L2996:	fn_link  Cichelli.lastL
	fn_combi_t1 4, 0,1,0,0,0,0
# --- block 164 ---
L3004:	fn_link  L2996
	fn_combi_t6 3, 2,1,0,2,0,0
# --- block 165 ---
Cichelli.keys:	fn_link  L5472
	fn_link  L5548
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 166 ---
L3024:	fn_link  L3036
	fn_link  L3040
	fn_combi_t2 4, 3,0,1,0,0,0
L3036:	fn_combi_t0 2, 0,0,0,0,0,0
L3040:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 167 ---
L3048:	fn_link  L3024
	fn_link  L3060
	fn_combi_t2 4, 3,0,1,0,0,0
L3060:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 168 ---
L3068:	fn_link  L3048
	fn_link  L3080
	fn_combi_t2 4, 3,0,1,0,0,0
L3080:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 169 ---
L3088:	fn_link  L3068
	fn_link  L3100
	fn_combi_t2 4, 3,0,1,0,0,0
L3100:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 170 ---
L3108:	fn_link  L3088
	fn_link  L3120
	fn_combi_t2 4, 3,0,1,0,0,0
L3120:	fn_box
	.word 0x00000077	# raw word 119
	fn_box_body
# --- block 171 ---
L3128:	fn_link  L3140
	fn_link  L3108
	fn_combi_t2 4, 3,0,1,0,0,0
L3140:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 172 ---
L3144:	fn_link  L3156
	fn_link  L3160
	fn_combi_t2 4, 3,0,1,0,0,0
L3156:	fn_combi_t0 2, 0,0,0,0,0,0
L3160:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 173 ---
L3168:	fn_link  L3144
	fn_link  L3180
	fn_combi_t2 4, 3,0,1,0,0,0
L3180:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 174 ---
L3188:	fn_link  L3168
	fn_link  L3200
	fn_combi_t2 4, 3,0,1,0,0,0
L3200:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 175 ---
L3208:	fn_link  L3188
	fn_link  L3220
	fn_combi_t2 4, 3,0,1,0,0,0
L3220:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 176 ---
L3228:	fn_link  L3128
	fn_link  L3208
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 177 ---
L3240:	fn_link  L3252
	fn_link  L3256
	fn_combi_t2 4, 3,0,1,0,0,0
L3252:	fn_combi_t0 2, 0,0,0,0,0,0
L3256:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 178 ---
L3264:	fn_link  L3240
	fn_link  L3276
	fn_combi_t2 4, 3,0,1,0,0,0
L3276:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 179 ---
L3284:	fn_link  L3228
	fn_link  L3264
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 180 ---
L3296:	fn_link  L3308
	fn_link  L3312
	fn_combi_t2 4, 3,0,1,0,0,0
L3308:	fn_combi_t0 2, 0,0,0,0,0,0
L3312:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 181 ---
L3320:	fn_link  L3296
	fn_link  L3332
	fn_combi_t2 4, 3,0,1,0,0,0
L3332:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 182 ---
L3340:	fn_link  L3320
	fn_link  L3352
	fn_combi_t2 4, 3,0,1,0,0,0
L3352:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 183 ---
L3360:	fn_link  L3340
	fn_link  L3372
	fn_combi_t2 4, 3,0,1,0,0,0
L3372:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 184 ---
L3380:	fn_link  L3284
	fn_link  L3360
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 185 ---
L3392:	fn_link  L3404
	fn_link  L3408
	fn_combi_t2 4, 3,0,1,0,0,0
L3404:	fn_combi_t0 2, 0,0,0,0,0,0
L3408:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 186 ---
L3416:	fn_link  L3392
	fn_link  L3428
	fn_combi_t2 4, 3,0,1,0,0,0
L3428:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 187 ---
L3436:	fn_link  L3416
	fn_link  L3448
	fn_combi_t2 4, 3,0,1,0,0,0
L3448:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 188 ---
L3456:	fn_link  L3436
	fn_link  L3468
	fn_combi_t2 4, 3,0,1,0,0,0
L3468:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 189 ---
L3476:	fn_link  L3456
	fn_link  L3488
	fn_combi_t2 4, 3,0,1,0,0,0
L3488:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 190 ---
L3496:	fn_link  L3476
	fn_link  L3508
	fn_combi_t2 4, 3,0,1,0,0,0
L3508:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 191 ---
L3516:	fn_link  L3496
	fn_link  L3528
	fn_combi_t2 4, 3,0,1,0,0,0
L3528:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 192 ---
L3536:	fn_link  L3516
	fn_link  L3548
	fn_combi_t2 4, 3,0,1,0,0,0
L3548:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 193 ---
L3556:	fn_link  L3380
	fn_link  L3536
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 194 ---
L3568:	fn_link  L3580
	fn_link  L3584
	fn_combi_t2 4, 3,0,1,0,0,0
L3580:	fn_combi_t0 2, 0,0,0,0,0,0
L3584:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 195 ---
L3592:	fn_link  L3568
	fn_link  L3604
	fn_combi_t2 4, 3,0,1,0,0,0
L3604:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 196 ---
L3612:	fn_link  L3556
	fn_link  L3592
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 197 ---
L3624:	fn_link  L3636
	fn_link  L3640
	fn_combi_t2 4, 3,0,1,0,0,0
L3636:	fn_combi_t0 2, 0,0,0,0,0,0
L3640:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 198 ---
L3648:	fn_link  L3624
	fn_link  L3660
	fn_combi_t2 4, 3,0,1,0,0,0
L3660:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 199 ---
L3668:	fn_link  L3648
	fn_link  L3680
	fn_combi_t2 4, 3,0,1,0,0,0
L3680:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 200 ---
L3688:	fn_link  L3668
	fn_link  L3700
	fn_combi_t2 4, 3,0,1,0,0,0
L3700:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 201 ---
L3708:	fn_link  L3688
	fn_link  L3720
	fn_combi_t2 4, 3,0,1,0,0,0
L3720:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 202 ---
L3728:	fn_link  L3708
	fn_link  L3740
	fn_combi_t2 4, 3,0,1,0,0,0
L3740:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 203 ---
L3748:	fn_link  L3612
	fn_link  L3728
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 204 ---
L3760:	fn_link  L3772
	fn_link  L3776
	fn_combi_t2 4, 3,0,1,0,0,0
L3772:	fn_combi_t0 2, 0,0,0,0,0,0
L3776:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 205 ---
L3784:	fn_link  L3760
	fn_link  L3796
	fn_combi_t2 4, 3,0,1,0,0,0
L3796:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 206 ---
L3804:	fn_link  L3784
	fn_link  L3816
	fn_combi_t2 4, 3,0,1,0,0,0
L3816:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 207 ---
L3824:	fn_link  L3748
	fn_link  L3804
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 208 ---
L3836:	fn_link  L3848
	fn_link  L3852
	fn_combi_t2 4, 3,0,1,0,0,0
L3848:	fn_combi_t0 2, 0,0,0,0,0,0
L3852:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 209 ---
L3860:	fn_link  L3836
	fn_link  L3872
	fn_combi_t2 4, 3,0,1,0,0,0
L3872:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 210 ---
L3880:	fn_link  L3860
	fn_link  L3892
	fn_combi_t2 4, 3,0,1,0,0,0
L3892:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 211 ---
L3900:	fn_link  L3880
	fn_link  L3912
	fn_combi_t2 4, 3,0,1,0,0,0
L3912:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 212 ---
L3920:	fn_link  L3900
	fn_link  L3932
	fn_combi_t2 4, 3,0,1,0,0,0
L3932:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 213 ---
L3940:	fn_link  L3920
	fn_link  L3952
	fn_combi_t2 4, 3,0,1,0,0,0
L3952:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 214 ---
L3960:	fn_link  L3940
	fn_link  L3972
	fn_combi_t2 4, 3,0,1,0,0,0
L3972:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 215 ---
L3980:	fn_link  L3960
	fn_link  L3992
	fn_combi_t2 4, 3,0,1,0,0,0
L3992:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 216 ---
L4000:	fn_link  L3980
	fn_link  L4012
	fn_combi_t2 4, 3,0,1,0,0,0
L4012:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 217 ---
L4020:	fn_link  L3824
	fn_link  L4000
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 218 ---
L4032:	fn_link  L4044
	fn_link  L4048
	fn_combi_t2 4, 3,0,1,0,0,0
L4044:	fn_combi_t0 2, 0,0,0,0,0,0
L4048:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 219 ---
L4056:	fn_link  L4032
	fn_link  L4068
	fn_combi_t2 4, 3,0,1,0,0,0
L4068:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 220 ---
L4076:	fn_link  L4056
	fn_link  L4088
	fn_combi_t2 4, 3,0,1,0,0,0
L4088:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 221 ---
L4096:	fn_link  L4076
	fn_link  L4108
	fn_combi_t2 4, 3,0,1,0,0,0
L4108:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 222 ---
L4116:	fn_link  L4096
	fn_link  L4128
	fn_combi_t2 4, 3,0,1,0,0,0
L4128:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 223 ---
L4136:	fn_link  L4116
	fn_link  L4148
	fn_combi_t2 4, 3,0,1,0,0,0
L4148:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 224 ---
L4156:	fn_link  L4136
	fn_link  L4168
	fn_combi_t2 4, 3,0,1,0,0,0
L4168:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 225 ---
L4176:	fn_link  L4156
	fn_link  L4188
	fn_combi_t2 4, 3,0,1,0,0,0
L4188:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 226 ---
L4196:	fn_link  L4020
	fn_link  L4176
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 227 ---
L4208:	fn_link  L4220
	fn_link  L4224
	fn_combi_t2 4, 3,0,1,0,0,0
L4220:	fn_combi_t0 2, 0,0,0,0,0,0
L4224:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 228 ---
L4232:	fn_link  L4208
	fn_link  L4244
	fn_combi_t2 4, 3,0,1,0,0,0
L4244:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 229 ---
L4252:	fn_link  L4232
	fn_link  L4264
	fn_combi_t2 4, 3,0,1,0,0,0
L4264:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 230 ---
L4272:	fn_link  L4252
	fn_link  L4284
	fn_combi_t2 4, 3,0,1,0,0,0
L4284:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 231 ---
L4292:	fn_link  L4272
	fn_link  L4304
	fn_combi_t2 4, 3,0,1,0,0,0
L4304:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 232 ---
L4312:	fn_link  L4292
	fn_link  L4324
	fn_combi_t2 4, 3,0,1,0,0,0
L4324:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 233 ---
L4332:	fn_link  L4196
	fn_link  L4312
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 234 ---
L4344:	fn_link  L4356
	fn_link  L4360
	fn_combi_t2 4, 3,0,1,0,0,0
L4356:	fn_combi_t0 2, 0,0,0,0,0,0
L4360:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 235 ---
L4368:	fn_link  L4344
	fn_link  L4380
	fn_combi_t2 4, 3,0,1,0,0,0
L4380:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 236 ---
L4388:	fn_link  L4368
	fn_link  L4400
	fn_combi_t2 4, 3,0,1,0,0,0
L4400:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 237 ---
L4408:	fn_link  L4388
	fn_link  L4420
	fn_combi_t2 4, 3,0,1,0,0,0
L4420:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 238 ---
L4428:	fn_link  L4408
	fn_link  L4440
	fn_combi_t2 4, 3,0,1,0,0,0
L4440:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 239 ---
L4448:	fn_link  L4332
	fn_link  L4428
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 240 ---
L4460:	fn_link  L4472
	fn_link  L4476
	fn_combi_t2 4, 3,0,1,0,0,0
L4472:	fn_combi_t0 2, 0,0,0,0,0,0
L4476:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 241 ---
L4484:	fn_link  L4460
	fn_link  L4496
	fn_combi_t2 4, 3,0,1,0,0,0
L4496:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 242 ---
L4504:	fn_link  L4448
	fn_link  L4484
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 243 ---
L4516:	fn_link  L4528
	fn_link  L4532
	fn_combi_t2 4, 3,0,1,0,0,0
L4528:	fn_combi_t0 2, 0,0,0,0,0,0
L4532:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 244 ---
L4540:	fn_link  L4516
	fn_link  L4552
	fn_combi_t2 4, 3,0,1,0,0,0
L4552:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 245 ---
L4560:	fn_link  L4540
	fn_link  L4572
	fn_combi_t2 4, 3,0,1,0,0,0
L4572:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 246 ---
L4580:	fn_link  L4560
	fn_link  L4592
	fn_combi_t2 4, 3,0,1,0,0,0
L4592:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 247 ---
L4600:	fn_link  L4580
	fn_link  L4612
	fn_combi_t2 4, 3,0,1,0,0,0
L4612:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 248 ---
L4620:	fn_link  L4600
	fn_link  L4632
	fn_combi_t2 4, 3,0,1,0,0,0
L4632:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 249 ---
L4640:	fn_link  L4504
	fn_link  L4620
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 250 ---
L4652:	fn_link  L4664
	fn_link  L4668
	fn_combi_t2 4, 3,0,1,0,0,0
L4664:	fn_combi_t0 2, 0,0,0,0,0,0
L4668:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 251 ---
L4676:	fn_link  L4652
	fn_link  L4688
	fn_combi_t2 4, 3,0,1,0,0,0
L4688:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 252 ---
L4696:	fn_link  L4640
	fn_link  L4676
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 253 ---
L4708:	fn_link  L4720
	fn_link  L4724
	fn_combi_t2 4, 3,0,1,0,0,0
L4720:	fn_combi_t0 2, 0,0,0,0,0,0
L4724:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 254 ---
L4732:	fn_link  L4708
	fn_link  L4744
	fn_combi_t2 4, 3,0,1,0,0,0
L4744:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 255 ---
L4752:	fn_link  L4732
	fn_link  L4764
	fn_combi_t2 4, 3,0,1,0,0,0
L4764:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 256 ---
L4772:	fn_link  L4752
	fn_link  L4784
	fn_combi_t2 4, 3,0,1,0,0,0
L4784:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 257 ---
L4792:	fn_link  L4772
	fn_link  L4804
	fn_combi_t2 4, 3,0,1,0,0,0
L4804:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 258 ---
L4812:	fn_link  L4792
	fn_link  L4824
	fn_combi_t2 4, 3,0,1,0,0,0
L4824:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 259 ---
L4832:	fn_link  L4696
	fn_link  L4812
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 260 ---
L4844:	fn_link  L4856
	fn_link  L4860
	fn_combi_t2 4, 3,0,1,0,0,0
L4856:	fn_combi_t0 2, 0,0,0,0,0,0
L4860:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 261 ---
L4868:	fn_link  L4844
	fn_link  L4880
	fn_combi_t2 4, 3,0,1,0,0,0
L4880:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 262 ---
L4888:	fn_link  L4868
	fn_link  L4900
	fn_combi_t2 4, 3,0,1,0,0,0
L4900:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 263 ---
L4908:	fn_link  L4888
	fn_link  L4920
	fn_combi_t2 4, 3,0,1,0,0,0
L4920:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 264 ---
L4928:	fn_link  L4832
	fn_link  L4908
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 265 ---
L4940:	fn_link  L4952
	fn_link  L4956
	fn_combi_t2 4, 3,0,1,0,0,0
L4952:	fn_combi_t0 2, 0,0,0,0,0,0
L4956:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 266 ---
L4964:	fn_link  L4940
	fn_link  L4976
	fn_combi_t2 4, 3,0,1,0,0,0
L4976:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 267 ---
L4984:	fn_link  L4964
	fn_link  L4996
	fn_combi_t2 4, 3,0,1,0,0,0
L4996:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 268 ---
L5004:	fn_link  L4984
	fn_link  L5016
	fn_combi_t2 4, 3,0,1,0,0,0
L5016:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 269 ---
L5024:	fn_link  L5004
	fn_link  L5036
	fn_combi_t2 4, 3,0,1,0,0,0
L5036:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 270 ---
L5044:	fn_link  L5024
	fn_link  L5056
	fn_combi_t2 4, 3,0,1,0,0,0
L5056:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 271 ---
L5064:	fn_link  L5044
	fn_link  L5076
	fn_combi_t2 4, 3,0,1,0,0,0
L5076:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 272 ---
L5084:	fn_link  L5064
	fn_link  L5096
	fn_combi_t2 4, 3,0,1,0,0,0
L5096:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 273 ---
L5104:	fn_link  L4928
	fn_link  L5084
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 274 ---
L5116:	fn_link  L5128
	fn_link  L5132
	fn_combi_t2 4, 3,0,1,0,0,0
L5128:	fn_combi_t0 2, 0,0,0,0,0,0
L5132:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 275 ---
L5140:	fn_link  L5116
	fn_link  L5152
	fn_combi_t2 4, 3,0,1,0,0,0
L5152:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 276 ---
L5160:	fn_link  L5140
	fn_link  L5172
	fn_combi_t2 4, 3,0,1,0,0,0
L5172:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 277 ---
L5180:	fn_link  L5160
	fn_link  L5192
	fn_combi_t2 4, 3,0,1,0,0,0
L5192:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 278 ---
L5200:	fn_link  L5180
	fn_link  L5212
	fn_combi_t2 4, 3,0,1,0,0,0
L5212:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 279 ---
L5220:	fn_link  L5200
	fn_link  L5232
	fn_combi_t2 4, 3,0,1,0,0,0
L5232:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 280 ---
L5240:	fn_link  L5220
	fn_link  L5252
	fn_combi_t2 4, 3,0,1,0,0,0
L5252:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 281 ---
L5260:	fn_link  L5104
	fn_link  L5240
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 282 ---
L5272:	fn_link  L5284
	fn_link  L5288
	fn_combi_t2 4, 3,0,1,0,0,0
L5284:	fn_combi_t0 2, 0,0,0,0,0,0
L5288:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 283 ---
L5296:	fn_link  L5272
	fn_link  L5308
	fn_combi_t2 4, 3,0,1,0,0,0
L5308:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 284 ---
L5316:	fn_link  L5296
	fn_link  L5328
	fn_combi_t2 4, 3,0,1,0,0,0
L5328:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 285 ---
L5336:	fn_link  L5316
	fn_link  L5348
	fn_combi_t2 4, 3,0,1,0,0,0
L5348:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 286 ---
L5356:	fn_link  L5260
	fn_link  L5336
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 287 ---
L5368:	fn_link  L5380
	fn_link  L5384
	fn_combi_t2 4, 3,0,1,0,0,0
L5380:	fn_combi_t0 2, 0,0,0,0,0,0
L5384:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 288 ---
L5392:	fn_link  L5368
	fn_link  L5404
	fn_combi_t2 4, 3,0,1,0,0,0
L5404:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 289 ---
L5412:	fn_link  L5392
	fn_link  L5424
	fn_combi_t2 4, 3,0,1,0,0,0
L5424:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 290 ---
L5432:	fn_link  L5412
	fn_link  L5444
	fn_combi_t2 4, 3,0,1,0,0,0
L5444:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 291 ---
L5452:	fn_link  L5432
	fn_link  L5464
	fn_combi_t2 4, 3,0,1,0,0,0
L5464:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 292 ---
L5472:	fn_link  L5356
	fn_link  L5452
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 293 ---
L5484:	fn_link  L5496
	fn_link  L5500
	fn_combi_t2 4, 3,0,1,0,0,0
L5496:	fn_combi_t0 2, 0,0,0,0,0,0
L5500:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 294 ---
L5508:	fn_link  L5484
	fn_link  L5520
	fn_combi_t2 4, 3,0,1,0,0,0
L5520:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 295 ---
L5528:	fn_link  L5508
	fn_link  L5540
	fn_combi_t2 4, 3,0,1,0,0,0
L5540:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 296 ---
L5548:	fn_link  L5528
	fn_link  L5560
	fn_combi_t2 4, 3,0,1,0,0,0
L5560:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 297 ---
Cichelli.hinsert:	fn_link  Cichelli.minm
	fn_link  L5812
	fn_link  L5836
	fn_combi_t52 5, 4,0,1,3,2,3
# --- block 298 ---
L5584:	fn_link  L5596
	fn_link  L5600
	fn_combi_t29 5, 0,1,3,1,4,2
L5596:	fn_combi_t1 3, 2,0,0,0,0,0
L5600:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 299 ---
L5604:	fn_link  L5616
	fn_link  L5584
	fn_combi_t7 4, 0,1,2,3,0,0
L5616:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 300 ---
L5620:	fn_link  L5636
	fn_link  L5660
	fn_link  L5684
	fn_combi_t61 5, 0,3,0,4,1,2
L5636:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5660:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5684:	fn_y
# --- block 301 ---
L5688:	fn_link  Cichelli.numberofkeys
	fn_combi_t26 6, 0,1,5,2,3,4
# --- block 302 ---
L5696:	fn_link  L5720
	fn_link  L5724
	fn_link  L5728
	fn_link  L5620
	fn_link  L5688
	fn_combi_t24 6, 0,1,5,2,3,4
L5720:	fn_combi_t0 2, 1,0,0,0,0,0
L5724:	fn_combi_t0 2, 0,0,0,0,0,0
L5728:	fn_elink _prim_gt
# --- block 303 ---
L5732:	fn_link  Cichelli.member
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 6, 0,1,2,3,4,5
# --- block 304 ---
L5744:	fn_link  L5696
	fn_link  L5732
	fn_combi_t14 5, 0,2,3,1,4,0
# --- block 305 ---
L5756:	fn_link  L5764
	fn_combi_t38 5, 0,1,4,2,3,4
L5764:	fn_combi_t31 5, 0,4,1,2,4,3
# --- block 306 ---
L5768:	fn_link  L5756
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 307 ---
L5776:	fn_link  L5604
	fn_link  L5796
	fn_link  L5744
	fn_link  L5768
	fn_combi_t38 5, 0,1,4,2,3,4
L5796:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 308 ---
L5800:	fn_link  L5808
	fn_combi_t24 6, 0,1,5,2,3,4
L5808:	fn_combi_t42 6, 0,5,1,2,3,4
# --- block 309 ---
L5812:	fn_link  Cichelli.maxm
	fn_link  L5832
	fn_link  L5776
	fn_link  L5800
	fn_combi_t10 5, 0,1,4,2,3,0
L5832:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 310 ---
L5836:	fn_link  L5844
	fn_combi_t24 6, 0,1,5,3,2,4
L5844:	fn_combi_t42 5, 0,4,1,2,3,1
# --- block 311 ---
NanoPrelude.$7c$7c:	fn_link  L5856
	fn_combi_t2 3, 1,2,0,0,0,0
L5856:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 312 ---
Cichelli.member:	fn_link  L5916
	fn_link  L5872
	fn_combi_t3 3, 0,1,2,0,0,0
L5872:	fn_y
# --- block 313 ---
L5876:	fn_link  L5896
	fn_link  L5900
	fn_link  L5904
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,5,4,1,2,3
L5896:	fn_combi_t0 2, 1,0,0,0,0,0
L5900:	fn_combi_t0 2, 0,0,0,0,0,0
L5904:	fn_elink _prim_eq
# --- block 314 ---
L5908:	fn_link  L5876
	fn_combi_t14 5, 0,1,3,2,4,0
# --- block 315 ---
L5916:	fn_link  L5908
	fn_link  L5928
	fn_combi_t16 5, 4,0,1,2,3,0
L5928:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 316 ---
Cichelli.numberofkeys:	fn_link  Cichelli.keys
	fn_elink NanoPrelude.length
# --- block 317 ---
Cichelli.maxm:	fn_link  L5948
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 318 ---
L5948:	fn_link  Cichelli.maxI
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 319 ---
Cichelli.maxI:	fn_link  L5968
	fn_link  L5972
	fn_combi_t3 3, 0,1,2,0,0,0
L5968:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 320 ---
L5972:	fn_link  L5980
	fn_combi_t10 3, 2,1,0,2,1,0
L5980:	fn_elink _prim_ge
# --- block 321 ---
Cichelli.minm:	fn_link  L5992
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 322 ---
L5992:	fn_link  Cichelli.minI
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 323 ---
Cichelli.minI:	fn_link  L6012
	fn_link  L6016
	fn_combi_t3 3, 0,1,2,0,0,0
L6012:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 324 ---
L6016:	fn_link  L6024
	fn_combi_t10 3, 2,1,0,2,1,0
L6024:	fn_elink _prim_le
# --- block 325 ---
Cichelli.hash:	fn_link  L6128
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 326 ---
L6036:	fn_link  L6052
	fn_link  Cichelli.assoc
	fn_link  L6076
	fn_combi_t56 6, 0,1,4,3,5,2
L6052:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6076:	fn_y
# --- block 327 ---
L6080:	fn_link  Cichelli.assoc
	fn_combi_t42 6, 0,4,1,2,5,3
# --- block 328 ---
L6088:	fn_link  L6104
	fn_link  L6036
	fn_link  L6080
	fn_combi_t30 5, 0,3,1,3,4,2
L6104:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 329 ---
L6128:	fn_link  L6088
	fn_link  L6140
	fn_combi_t51 7, 0,1,2,4,5,6
L6140:	fn_y
# --- block 330 ---
Cichelli.assoc:	fn_link  L6180
	fn_link  L6156
	fn_combi_t3 3, 0,1,2,0,0,0
L6156:	fn_y
# --- block 331 ---
L6160:	fn_link  L6168
	fn_combi_t15 5, 4,1,0,2,3,0
L6168:	fn_elink _prim_eq
# --- block 332 ---
L6172:	fn_link  L6160
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 333 ---
L6180:	fn_link  L6172
	fn_link  L6192
	fn_combi_t16 5, 4,0,1,2,3,0
L6192:	fn_elink _error0
# --- block 334 ---
Cichelli.blocked:	fn_link  L6204
	fn_elink Cichelli.blocked$27
L6204:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 335 ---
Cichelli.blocked$27:	fn_link  L6228
	fn_link  L6316
	fn_link  L6224
	fn_combi_t17 5, 4,0,1,2,3,0
L6224:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 336 ---
L6228:	fn_link  Cichelli.ends
	fn_link  Cichelli.union
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 337 ---
L6240:	fn_link  Cichelli.ends
	fn_link  Cichelli.subset
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 338 ---
L6252:	fn_link  L6240
	fn_link  Cichelli.partition$27
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 339 ---
L6264:	fn_link  L6276
	fn_link  Cichelli.blocked$27
	fn_combi_t6 4, 0,2,3,1,0,0
L6276:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 340 ---
L6280:	fn_link  L6264
	fn_link  L6296
	fn_link  Cichelli.append
	fn_combi_t44 5, 0,4,1,2,3,4
L6296:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 341 ---
L6300:	fn_link  L6280
	fn_link  L6312
	fn_combi_t48 5, 0,2,1,4,3,4
L6312:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 342 ---
L6316:	fn_link  L6252
	fn_link  L6300
	fn_combi_t39 5, 0,3,1,4,2,3
# --- block 343 ---
Cichelli.partition$27:	fn_link  L6344
	fn_link  L6424
	fn_link  NanoPrelude.foldr
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 344 ---
L6344:	fn_link  L6352
	fn_combi_t2 2, 1,0,0,0,0,0
L6352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 345 ---
L6356:	fn_link  L6364
	fn_combi_t12 5, 4,0,1,2,3,0
L6364:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 346 ---
L6368:	fn_link  L6376
	fn_combi_t16 5, 4,2,0,1,3,0
L6376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 347 ---
L6380:	fn_link  L6392
	fn_link  L6396
	fn_combi_t3 3, 0,1,2,0,0,0
L6392:	fn_combi_t39 5, 0,1,2,4,3,4
L6396:	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 348 ---
L6400:	fn_link  L6356
	fn_link  L6368
	fn_link  L6380
	fn_link  L6420
	fn_combi_t10 5, 0,1,4,2,3,0
L6420:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 349 ---
L6424:	fn_link  L6400
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 350 ---
Cichelli.subset:	fn_link  L6444
	fn_link  NanoPrelude.all
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 351 ---
L6444:	fn_link  Cichelli.member
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 352 ---
NanoPrelude.all:	fn_link  L6476
	fn_link  L6464
	fn_combi_t3 3, 0,1,2,0,0,0
L6464:	fn_y
# --- block 353 ---
L6468:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 354 ---
L6476:	fn_link  L6468
	fn_link  L6488
	fn_combi_t16 5, 4,0,1,2,3,0
L6488:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 355 ---
NanoPrelude.$26$26:	fn_link  L6500
	fn_combi_t1 2, 1,0,0,0,0,0
L6500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 356 ---
Cichelli.union:	fn_link  L6568
	fn_link  L6520
	fn_link  Cichelli.append
	fn_combi_t47 5, 0,3,1,2,3,4
L6520:	fn_y
# --- block 357 ---
L6524:	fn_link  Cichelli.member
	fn_link  NanoPrelude.not
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 358 ---
L6536:	fn_link  L6544
	fn_combi_t24 5, 0,1,4,2,3,4
L6544:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 359 ---
L6548:	fn_link  L6564
	fn_link  L6524
	fn_link  L6536
	fn_combi_t26 5, 0,1,3,4,2,4
L6564:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 360 ---
L6568:	fn_link  L6548
	fn_link  L6580
	fn_combi_t16 5, 4,0,1,2,3,0
L6580:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 361 ---
NanoPrelude.not:	fn_link  L6596
	fn_link  L6600
	fn_combi_t2 3, 2,0,1,0,0,0
L6596:	fn_combi_t0 2, 0,0,0,0,0,0
L6600:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 362 ---
Cichelli.takeL:	fn_link  L6620
	fn_link  L6668
	fn_link  L6684
	fn_combi_t24 5, 0,1,3,3,4,2
L6620:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 363 ---
L6624:	fn_link  L6640
	fn_link  L6664
	fn_link  Cichelli.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L6640:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6664:	fn_y
# --- block 364 ---
L6668:	fn_link  L6624
	fn_link  L6680
	fn_combi_t16 5, 0,3,1,2,4,0
L6680:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 365 ---
L6684:	fn_link  L6700
	fn_link  L6704
	fn_link  L6708
	fn_combi_t44 6, 0,4,1,5,2,3
L6700:	fn_combi_t0 2, 0,0,0,0,0,0
L6704:	fn_elink _prim_le
L6708:	fn_box
	.word 0x00000000	# raw word 0
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
