# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Cryptarithm2  (entry @0)
	.text
	.globl	Cryptarithm2.append
	.globl	Cryptarithm2.bench
	.globl	Cryptarithm2.bindD
	.globl	Cryptarithm2.deleteL
	.globl	Cryptarithm2.diffL
	.globl	Cryptarithm2.digitEnv
	.globl	Cryptarithm2.digits
	.globl	Cryptarithm2.execStateTD
	.globl	Cryptarithm2.getD
	.globl	Cryptarithm2.guardD
	.globl	Cryptarithm2.hashS
	.globl	Cryptarithm2.initState
	.globl	Cryptarithm2.liftD
	.globl	Cryptarithm2.lookupL
	.globl	Cryptarithm2.mapMD
	.globl	Cryptarithm2.mzeroD
	.globl	Cryptarithm2.nINETY
	.globl	Cryptarithm2.nubL
	.globl	Cryptarithm2.permute
	.globl	Cryptarithm2.putD
	.globl	Cryptarithm2.puzzle
	.globl	Cryptarithm2.returnD
	.globl	Cryptarithm2.revL
	.globl	Cryptarithm2.select
	.globl	Cryptarithm2.showN
	.globl	Cryptarithm2.solve
	.globl	Cryptarithm2.tHIRTY
	.globl	Cryptarithm2.tWELVE
	.globl	Cryptarithm2.transposeL
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.any
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.snd
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Cryptarithm2.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Cryptarithm2.bench:	fn_link  L112
L32:	fn_elink Cryptarithm2.hashS
# --- block 3 ---
L36:	fn_link  L48
	fn_link  Cryptarithm2.tWELVE
	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 4 ---
L52:	fn_link  L36
	fn_link  Cryptarithm2.tWELVE
L60:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 5 ---
L64:	fn_link  L52
L68:	fn_link  Cryptarithm2.tWELVE
L72:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 6 ---
L76:	fn_link  L64
	fn_link  Cryptarithm2.tWELVE
L84:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 7 ---
L88:	fn_link  L76
	fn_link  Cryptarithm2.tWELVE
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 8 ---
L100:	fn_link  L88
	fn_link  Cryptarithm2.tHIRTY
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 9 ---
L112:	fn_link  Cryptarithm2.nINETY
	fn_link  L100
	fn_elink Cryptarithm2.puzzle
# --- block 10 ---
Cryptarithm2.hashS:	fn_link  L136
	fn_link  L224
	fn_elink NanoPrelude.foldl
L136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L144:	fn_link  L164
	fn_link  L188
	fn_link  L212
	fn_link  L220
	fn_combi_t41 6, 0,1,4,2,5,3
L164:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L188:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L212:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L220:	fn_y
# --- block 12 ---
L224:	fn_link  L144
	fn_link  L236
	fn_combi_t7 4, 0,1,2,3,0,0
L236:	fn_y
# --- block 13 ---
NanoPrelude.foldl:	fn_link  L256
	fn_link  L252
	fn_combi_t3 3, 0,1,2,0,0,0
L252:	fn_y
# --- block 14 ---
L256:	fn_link  L264
	fn_combi_t46 5, 4,3,0,1,2,3
L264:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 15 ---
Cryptarithm2.puzzle:	fn_link  L340
	fn_link  L904
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 16 ---
L280:	fn_link  Cryptarithm2.revL
	fn_link  NanoPrelude.map
	fn_link  Cryptarithm2.transposeL
	fn_link  Cryptarithm2.solve
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 17 ---
L300:	fn_link  Cryptarithm2.execStateTD
	fn_combi_t33 6, 0,1,2,5,3,4
# --- block 18 ---
L308:	fn_link  Cryptarithm2.initState
	fn_link  L332
	fn_link  Cryptarithm2.revL
	fn_link  L280
	fn_link  L300
	fn_combi_t24 6, 0,1,5,2,3,4
L332:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 19 ---
L340:	fn_link  L308
	fn_link  L356
	fn_link  L360
	fn_combi_t9 5, 2,3,4,0,1,0
L356:	fn_combi_t0 2, 0,0,0,0,0,0
L360:	fn_elink _error0
# --- block 20 ---
L364:	fn_link  L384
	fn_link  L408
	fn_link  L432
	fn_link  L440
	fn_combi_t13 5, 0,1,4,2,3,0
L384:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L408:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L432:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L440:	fn_y
# --- block 21 ---
L444:	fn_link  Cryptarithm2.digitEnv
	fn_link  Cryptarithm2.lookupL
	fn_link  L460
	fn_combi_t53 6, 0,1,5,2,3,4
L460:	fn_y
# --- block 22 ---
L464:	fn_link  L364
	fn_link  L444
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 23 ---
L476:	fn_link  L492
	fn_link  L464
	fn_link  NanoPrelude.foldl
	fn_combi_t5 4, 0,1,3,2,0,0
L492:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 24 ---
L500:	fn_link  L512
	fn_link  L516
	fn_combi_t2 4, 3,0,1,0,0,0
L512:	fn_combi_t0 2, 0,0,0,0,0,0
L516:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 25 ---
L524:	fn_link  L536
	fn_link  L540
	fn_combi_t2 4, 3,0,1,0,0,0
L536:	fn_combi_t0 2, 0,0,0,0,0,0
L540:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 26 ---
L548:	fn_link  L524
	fn_link  L560
	fn_combi_t2 4, 3,0,1,0,0,0
L560:	fn_box
	.word 0x0000003e	# raw word 62
	fn_box_body
# --- block 27 ---
L568:	fn_link  L548
	fn_link  L580
	fn_combi_t2 4, 3,0,1,0,0,0
L580:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 28 ---
L588:	fn_link  L568
	fn_link  L600
	fn_combi_t2 4, 3,0,1,0,0,0
L600:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 29 ---
L608:	fn_link  L500
	fn_link  Cryptarithm2.showN
	fn_link  L588
	fn_link  Cryptarithm2.append
	fn_combi_t47 5, 0,1,0,2,4,3
# --- block 30 ---
L628:	fn_link  L636
	fn_combi_t2 4, 3,1,0,0,0,0
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
L640:	fn_link  Cryptarithm2.append
	fn_link  L652
	fn_combi_t34 6, 0,1,2,3,5,4
L652:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 32 ---
L656:	fn_link  L608
	fn_link  L628
	fn_link  L640
	fn_combi_t38 6, 0,1,5,2,3,4
# --- block 33 ---
L672:	fn_link  L656
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 34 ---
L680:	fn_link  L672
	fn_link  L692
	fn_combi_t6 4, 3,0,1,2,0,0
L692:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
L696:	fn_link  Cryptarithm2.digitEnv
	fn_link  L680
	fn_link  L716
	fn_link  NanoPrelude.concat
	fn_combi_t20 5, 0,1,2,3,4,0
L716:	fn_y
# --- block 36 ---
L720:	fn_link  L728
	fn_combi_t15 5, 0,1,3,2,4,0
L728:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 37 ---
L732:	fn_link  L720
	fn_link  L744
	fn_combi_t16 5, 4,0,1,2,3,0
L744:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
L748:	fn_link  L768
	fn_link  L732
	fn_link  L772
	fn_link  NanoPrelude.sum
	fn_combi_t33 6, 0,1,2,5,4,3
L768:	fn_elink _prim_ne
L772:	fn_y
# --- block 39 ---
L776:	fn_link  L748
	fn_link  L788
	fn_combi_t3 3, 0,1,2,0,0,0
L788:	fn_combi_t25 5, 4,1,0,4,2,3
# --- block 40 ---
L792:	fn_link  L808
	fn_link  L696
	fn_link  L776
	fn_combi_t28 6, 0,3,4,1,5,2
L808:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
L812:	fn_link  NanoPrelude.concat
	fn_link  Cryptarithm2.append
	fn_link  Cryptarithm2.nubL
	fn_link  NanoPrelude.length
	fn_combi_t61 6, 0,1,2,3,4,5
# --- block 42 ---
L832:	fn_link  L840
	fn_combi_t29 6, 0,1,2,3,5,4
L840:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 43 ---
L848:	fn_link  L864
	fn_link  L812
	fn_link  L832
	fn_combi_t12 5, 0,1,3,4,2,0
L864:	fn_elink _prim_gt
# --- block 44 ---
L868:	fn_link  L876
	fn_combi_t29 5, 0,1,4,2,4,3
L876:	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 45 ---
L880:	fn_link  L900
	fn_link  L792
	fn_link  L848
	fn_link  L868
	fn_combi_t29 5, 0,1,4,2,4,3
L900:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
L904:	fn_link  L476
	fn_link  L880
	fn_combi_t37 5, 0,2,4,1,3,4
# --- block 47 ---
NanoPrelude.length:	fn_link  L928
	fn_link  L976
	fn_y
L928:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 48 ---
L936:	fn_link  L948
	fn_link  L972
	fn_combi_t8 5, 2,0,3,1,0,0
L948:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L972:	fn_y
# --- block 49 ---
L976:	fn_link  L936
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 50 ---
Cryptarithm2.nubL:	fn_link  L996
	fn_link  L1128
	fn_y
L996:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 51 ---
L1000:	fn_link  L1008
	fn_combi_t7 4, 1,0,3,2,0,0
L1008:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 52 ---
L1012:	fn_link  L1020
	fn_combi_t46 5, 0,3,1,2,3,4
L1020:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L1024:	fn_link  L1000
	fn_link  L1012
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L1036:	fn_link  L1052
	fn_link  L1056
	fn_link  L1060
	fn_combi_t10 5, 3,4,0,1,2,0
L1052:	fn_combi_t0 2, 1,0,0,0,0,0
L1056:	fn_combi_t0 2, 0,0,0,0,0,0
L1060:	fn_elink _prim_eq
# --- block 55 ---
L1064:	fn_link  L1036
	fn_link  NanoPrelude.any
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 56 ---
L1076:	fn_link  L1064
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 57 ---
L1084:	fn_link  L1024
	fn_link  L1076
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 58 ---
L1096:	fn_link  L1084
	fn_link  L1108
	fn_combi_t3 3, 0,1,2,0,0,0
L1108:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 59 ---
L1112:	fn_link  L1096
	fn_link  L1124
	fn_combi_t46 6, 5,0,1,2,3,4
L1124:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1128:	fn_link  L1112
	fn_link  L1140
	fn_combi_t7 4, 0,1,2,3,0,0
L1140:	fn_y
# --- block 61 ---
NanoPrelude.any:	fn_link  L1168
	fn_link  L1156
	fn_combi_t3 3, 0,1,2,0,0,0
L1156:	fn_y
# --- block 62 ---
L1160:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 63 ---
L1168:	fn_link  L1160
	fn_link  L1180
	fn_combi_t16 5, 4,0,1,2,3,0
L1180:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 64 ---
NanoPrelude.$7c$7c:	fn_link  L1192
	fn_combi_t2 3, 1,2,0,0,0,0
L1192:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 65 ---
Cryptarithm2.append:	fn_link  L1204
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 66 ---
L1204:	fn_link  Cryptarithm2.append
	fn_link  L1216
	fn_combi_t16 5, 0,3,1,4,2,0
L1216:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 67 ---
NanoPrelude.concat:	fn_link  L1232
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L1232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 68 ---
NanoPrelude.foldr:	fn_link  L1252
	fn_link  L1248
	fn_combi_t7 4, 0,1,2,3,0,0
L1248:	fn_y
# --- block 69 ---
L1252:	fn_link  L1260
	fn_combi_t16 5, 4,2,0,1,3,0
L1260:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 70 ---
Data.List_Type.$2b$2b:	fn_link  L1292
	fn_link  L1276
	fn_combi_t5 4, 0,1,3,2,0,0
L1276:	fn_y
# --- block 71 ---
L1280:	fn_link  L1288
	fn_combi_t6 4, 0,2,1,3,0,0
L1288:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 72 ---
L1292:	fn_link  L1280
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 73 ---
NanoPrelude.sum:	fn_link  L1312
	fn_link  L1320
	fn_elink NanoPrelude.foldr
L1312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 74 ---
L1320:	fn_link  L1332
	fn_link  L1356
	fn_combi_t8 4, 0,3,2,1,0,0
L1332:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1356:	fn_y
# --- block 75 ---
Cryptarithm2.showN:	fn_link  L1372
	fn_link  L1532
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 76 ---
L1372:	fn_link  L1388
	fn_link  L1392
	fn_link  L1416
	fn_combi_t13 6, 5,0,3,1,2,0
L1388:	fn_combi_t0 2, 0,0,0,0,0,0
L1392:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1416:	fn_y
# --- block 77 ---
L1420:	fn_link  L1440
	fn_link  L1464
	fn_link  NanoPrelude.rem
	fn_link  L1472
	fn_combi_t18 5, 0,1,4,2,3,0
L1440:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1464:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1472:	fn_y
# --- block 78 ---
L1476:	fn_link  L1488
	fn_link  L1420
	fn_combi_t5 5, 4,0,2,1,0,0
L1488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 79 ---
L1492:	fn_link  L1512
	fn_link  NanoPrelude.quot
	fn_link  Cryptarithm2.showN
	fn_link  Cryptarithm2.append
	fn_combi_t21 5, 0,1,2,4,3,0
L1512:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 80 ---
L1520:	fn_link  L1476
	fn_link  L1492
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 81 ---
L1532:	fn_link  L1520
	fn_link  L1548
	fn_link  L1552
	fn_combi_t15 4, 0,3,1,2,3,0
L1548:	fn_elink _prim_lt
L1552:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 82 ---
NanoPrelude.quot:	fn_link  L1572
	fn_link  L1596
	fn_combi_t8 4, 0,3,2,1,0,0
L1572:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1596:	fn_y
# --- block 83 ---
NanoPrelude.rem:	fn_link  L1612
	fn_link  L1636
	fn_combi_t8 4, 0,3,2,1,0,0
L1612:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1636:	fn_y
# --- block 84 ---
Cryptarithm2.digitEnv:	fn_link  L1648
	fn_combi_t1 2, 1,0,0,0,0,0
L1648:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 85 ---
Cryptarithm2.lookupL:	fn_link  L1684
	fn_link  L1692
	fn_link  L1668
	fn_combi_t8 4, 0,1,2,3,0,0
L1668:	fn_y
# --- block 86 ---
L1672:	fn_link  L1680
	fn_combi_t15 5, 4,1,0,2,3,0
L1680:	fn_elink _prim_eq
# --- block 87 ---
L1684:	fn_link  L1672
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 88 ---
L1692:	fn_link  L1708
	fn_link  L1732
	fn_link  L1740
	fn_combi_t41 6, 5,0,1,2,3,4
L1708:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1732:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1740:	fn_y
# --- block 89 ---
Cryptarithm2.execStateTD:	fn_link  NanoPrelude.snd
	fn_link  NanoPrelude.map
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 90 ---
NanoPrelude.map:	fn_link  L1784
	fn_link  L1768
	fn_combi_t3 3, 0,1,2,0,0,0
L1768:	fn_y
# --- block 91 ---
L1772:	fn_link  L1780
	fn_combi_t15 5, 0,1,3,2,4,0
L1780:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 92 ---
L1784:	fn_link  L1772
	fn_link  L1796
	fn_combi_t16 5, 4,0,1,2,3,0
L1796:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 93 ---
NanoPrelude.snd:	fn_link  L1808
	fn_combi_t1 2, 1,0,0,0,0,0
L1808:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 94 ---
Cryptarithm2.solve:	fn_link  L2076
	fn_link  L2128
	fn_link  L1828
	fn_combi_t15 4, 0,1,3,2,3,0
L1828:	fn_combi_t40 4, 2,0,2,3,1,3
# --- block 95 ---
L1832:	fn_link  L1848
	fn_link  L1852
	fn_link  Cryptarithm2.solve
	fn_combi_t26 7, 0,3,1,2,4,5
L1848:	fn_combi_t0 2, 1,0,0,0,0,0
L1852:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 96 ---
L1856:	fn_link  L1872
	fn_link  NanoPrelude.quot
	fn_link  L1832
	fn_combi_t42 6, 0,3,4,1,5,2
L1872:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 97 ---
L1880:	fn_link  L1900
	fn_link  L1904
	fn_link  L1908
	fn_link  NanoPrelude.rem
	fn_combi_t32 6, 5,0,4,1,2,3
L1900:	fn_combi_t0 2, 0,0,0,0,0,0
L1904:	fn_elink _prim_eq
L1908:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 98 ---
L1916:	fn_link  Cryptarithm2.guardD
	fn_link  Cryptarithm2.bindD
	fn_combi_t35 6, 0,1,2,5,3,4
# --- block 99 ---
L1928:	fn_link  L1944
	fn_link  L1880
	fn_link  L1916
	fn_combi_t38 5, 0,1,4,2,3,4
L1944:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 100 ---
L1948:	fn_link  L1856
	fn_link  L1928
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 101 ---
L1960:	fn_link  Cryptarithm2.select
	fn_link  Cryptarithm2.bindD
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 102 ---
L1972:	fn_link  L1948
	fn_link  L1960
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 103 ---
L1984:	fn_link  L2004
	fn_link  NanoPrelude.sum
	fn_link  L2028
	fn_link  Cryptarithm2.returnD
	fn_combi_t63 6, 0,1,4,2,5,3
L2004:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2028:	fn_y
# --- block 104 ---
L2032:	fn_link  L1984
	fn_link  Cryptarithm2.select
	fn_link  Cryptarithm2.mapMD
	fn_link  Cryptarithm2.bindD
	fn_combi_t40 7, 0,1,2,5,3,4
# --- block 105 ---
L2052:	fn_link  L2032
	fn_link  Cryptarithm2.returnD
	fn_link  Cryptarithm2.bindD
	fn_combi_t57 5, 0,3,1,4,2,4
# --- block 106 ---
L2068:	fn_link  L2052
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 107 ---
L2076:	fn_link  L1972
	fn_link  L2068
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 108 ---
L2088:	fn_link  Cryptarithm2.mzeroD
	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 109 ---
L2096:	fn_link  Cryptarithm2.returnD
	fn_link  Cryptarithm2.mzeroD
	fn_link  L2116
	fn_link  L2120
	fn_combi_t38 5, 0,4,1,2,3,0
L2116:	fn_elink _prim_eq
L2120:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 110 ---
L2128:	fn_link  L2088
	fn_link  L2096
	fn_combi_t33 5, 2,3,0,4,1,1
# --- block 111 ---
Cryptarithm2.mzeroD:	fn_link  L2148
	fn_combi_t0 2, 0,0,0,0,0,0
L2148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
Cryptarithm2.returnD:	fn_link  L2164
	fn_link  L2168
	fn_combi_t12 6, 5,0,2,3,1,0
L2164:	fn_combi_t0 2, 0,0,0,0,0,0
L2168:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 113 ---
Cryptarithm2.bindD:	fn_link  L2188
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t57 6, 0,1,2,4,3,5
L2188:	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 114 ---
Cryptarithm2.mapMD:	fn_link  L2248
	fn_link  L2204
	fn_combi_t3 3, 0,1,2,0,0,0
L2204:	fn_y
# --- block 115 ---
L2208:	fn_link  L2220
	fn_link  Cryptarithm2.returnD
	fn_combi_t7 4, 0,1,2,3,0,0
L2220:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 116 ---
L2224:	fn_link  L2208
	fn_link  Cryptarithm2.bindD
	fn_combi_t15 5, 0,2,3,1,4,0
# --- block 117 ---
L2236:	fn_link  L2224
	fn_link  Cryptarithm2.bindD
	fn_combi_t44 6, 0,2,4,1,3,5
# --- block 118 ---
L2248:	fn_link  L2236
	fn_link  L2264
	fn_link  Cryptarithm2.returnD
	fn_combi_t44 6, 5,0,1,2,3,4
L2264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 119 ---
Cryptarithm2.select:	fn_link  L2372
	fn_link  Cryptarithm2.getD
	fn_link  Cryptarithm2.bindD
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 120 ---
L2284:	fn_link  Cryptarithm2.digitEnv
	fn_link  Cryptarithm2.lookupL
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 121 ---
L2296:	fn_link  L2316
	fn_link  L2320
	fn_link  L2344
	fn_link  L2352
	fn_combi_t29 6, 0,1,2,5,3,4
L2316:	fn_elink _prim_ne
L2320:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2344:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2352:	fn_y
# --- block 122 ---
L2356:	fn_link  Cryptarithm2.returnD
	fn_link  Cryptarithm2.permute
	fn_link  L2296
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 123 ---
L2372:	fn_link  L2284
	fn_link  L2356
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 124 ---
Cryptarithm2.getD:	fn_link  L2400
	fn_link  L2404
	fn_link  L2408
	fn_combi_t13 6, 5,0,1,3,2,0
L2400:	fn_combi_t0 2, 0,0,0,0,0,0
L2404:	fn_combi_t0 1, 0,0,0,0,0,0
L2408:	fn_combi_t2 2, 1,0,0,0,0,0
# --- block 125 ---
Cryptarithm2.permute:	fn_link  L2604
	fn_link  Cryptarithm2.getD
	fn_link  Cryptarithm2.bindD
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 126 ---
L2428:	fn_link  Cryptarithm2.returnD
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 127 ---
L2436:	fn_link  L2448
	fn_link  L2452
	fn_combi_t48 6, 0,5,1,2,3,4
L2448:	fn_combi_t2 4, 3,0,1,0,0,0
L2452:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 128 ---
L2456:	fn_link  Cryptarithm2.digitEnv
	fn_link  L2472
	fn_link  L2436
	fn_combi_t26 6, 0,1,3,5,2,4
L2472:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 129 ---
L2476:	fn_link  Cryptarithm2.putD
	fn_link  Cryptarithm2.bindD
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 130 ---
L2488:	fn_link  L2476
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 131 ---
L2496:	fn_link  L2428
	fn_link  L2456
	fn_link  L2488
	fn_combi_t52 6, 5,0,1,3,2,4
# --- block 132 ---
L2512:	fn_link  L2520
	fn_combi_t2 4, 3,1,0,0,0,0
L2520:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 133 ---
L2524:	fn_link  Cryptarithm2.digits
	fn_link  Cryptarithm2.diffL
	fn_combi_t47 6, 5,4,0,1,2,3
# --- block 134 ---
L2536:	fn_link  L2512
	fn_link  L2524
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 135 ---
L2548:	fn_link  L2536
	fn_link  L2560
	fn_combi_t40 6, 0,1,2,4,3,5
L2560:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 136 ---
L2564:	fn_link  L2548
	fn_link  L2576
	fn_combi_t16 5, 4,0,1,2,3,0
L2576:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 137 ---
L2580:	fn_link  Cryptarithm2.digits
	fn_link  L2564
	fn_link  L2600
	fn_link  Cryptarithm2.liftD
	fn_combi_t57 5, 0,1,2,4,3,4
L2600:	fn_y
# --- block 138 ---
L2604:	fn_link  L2496
	fn_link  L2580
	fn_link  Cryptarithm2.bindD
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 139 ---
Cryptarithm2.liftD:	fn_link  L2632
	fn_link  NanoPrelude.map
	fn_combi_t5 4, 0,1,3,2,0,0
L2632:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 140 ---
Cryptarithm2.diffL:	fn_link  L2644
	fn_elink NanoPrelude.foldl
# --- block 141 ---
L2644:	fn_link  Cryptarithm2.deleteL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 142 ---
Cryptarithm2.deleteL:	fn_link  L2704
	fn_link  L2664
	fn_combi_t3 3, 0,1,2,0,0,0
L2664:	fn_y
# --- block 143 ---
L2668:	fn_link  L2676
	fn_combi_t6 4, 0,2,1,3,0,0
L2676:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 144 ---
L2680:	fn_link  L2688
	fn_combi_t29 5, 1,3,0,2,4,4
L2688:	fn_elink _prim_eq
# --- block 145 ---
L2692:	fn_link  L2668
	fn_link  L2680
	fn_combi_t30 5, 0,2,1,3,4,4
# --- block 146 ---
L2704:	fn_link  L2692
	fn_link  L2716
	fn_combi_t16 5, 4,0,1,2,3,0
L2716:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 147 ---
Cryptarithm2.digits:	fn_link  L2728
	fn_combi_t1 2, 1,0,0,0,0,0
L2728:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 148 ---
Cryptarithm2.putD:	fn_link  L2744
	fn_link  L2748
	fn_combi_t5 6, 5,0,2,1,0,0
L2744:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 149 ---
L2748:	fn_link  L2756
	fn_combi_t2 3, 2,0,1,0,0,0
L2756:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 150 ---
Cryptarithm2.guardD:	fn_link  L2780
	fn_link  Cryptarithm2.returnD
	fn_link  Cryptarithm2.mzeroD
	fn_combi_t6 4, 3,0,1,2,0,0
L2780:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 151 ---
Cryptarithm2.transposeL:	fn_link  L2940
	fn_link  L2800
	fn_combi_t2 3, 2,0,1,0,0,0
L2800:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 152 ---
L2804:	fn_link  L2812
	fn_combi_t6 5, 0,4,1,2,0,0
L2812:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 153 ---
L2816:	fn_link  L2804
	fn_combi_t44 4, 2,1,3,0,1,3
# --- block 154 ---
L2824:	fn_link  L2816
	fn_link  L2836
	fn_combi_t6 4, 3,0,1,2,0,0
L2836:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 155 ---
L2840:	fn_link  L2824
	fn_link  L2860
	fn_link  L2864
	fn_link  Cryptarithm2.transposeL
	fn_combi_t58 6, 0,1,5,2,3,4
L2860:	fn_y
L2864:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 156 ---
L2868:	fn_link  L2876
	fn_combi_t6 5, 0,3,1,2,0,0
L2876:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 157 ---
L2880:	fn_link  L2868
	fn_combi_t44 4, 2,1,3,0,1,3
# --- block 158 ---
L2888:	fn_link  L2880
	fn_link  L2900
	fn_combi_t6 4, 3,0,1,2,0,0
L2900:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 159 ---
L2904:	fn_link  L2888
	fn_link  L2920
	fn_link  L2924
	fn_combi_t58 5, 0,0,4,1,2,3
L2920:	fn_y
L2924:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 160 ---
L2928:	fn_link  L2840
	fn_link  L2904
	fn_combi_t42 5, 0,2,3,1,2,4
# --- block 161 ---
L2940:	fn_link  L2928
	fn_link  Cryptarithm2.transposeL
	fn_combi_t15 4, 2,0,3,1,3,0
# --- block 162 ---
Cryptarithm2.revL:	fn_link  L2964
	fn_link  L2968
	fn_elink NanoPrelude.foldl
L2964:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 163 ---
L2968:	fn_link  L2976
	fn_combi_t2 3, 0,2,1,0,0,0
L2976:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 164 ---
Cryptarithm2.initState:	fn_link  L2992
	fn_link  L3180
	fn_combi_t2 3, 2,0,1,0,0,0
L2992:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 165 ---
L2996:	fn_link  L3008
	fn_link  L3012
	fn_combi_t2 4, 3,0,1,0,0,0
L3008:	fn_combi_t0 2, 0,0,0,0,0,0
L3012:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 166 ---
L3020:	fn_link  L2996
	fn_link  L3032
	fn_combi_t2 4, 3,0,1,0,0,0
L3032:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 167 ---
L3040:	fn_link  L3020
	fn_link  L3052
	fn_combi_t2 4, 3,0,1,0,0,0
L3052:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 168 ---
L3060:	fn_link  L3040
	fn_link  L3072
	fn_combi_t2 4, 3,0,1,0,0,0
L3072:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 169 ---
L3080:	fn_link  L3060
	fn_link  L3092
	fn_combi_t2 4, 3,0,1,0,0,0
L3092:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 170 ---
L3100:	fn_link  L3080
	fn_link  L3112
	fn_combi_t2 4, 3,0,1,0,0,0
L3112:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 171 ---
L3120:	fn_link  L3100
	fn_link  L3132
	fn_combi_t2 4, 3,0,1,0,0,0
L3132:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 172 ---
L3140:	fn_link  L3120
	fn_link  L3152
	fn_combi_t2 4, 3,0,1,0,0,0
L3152:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 173 ---
L3160:	fn_link  L3140
	fn_link  L3172
	fn_combi_t2 4, 3,0,1,0,0,0
L3172:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 174 ---
L3180:	fn_link  L3160
	fn_link  L3192
	fn_combi_t2 4, 3,0,1,0,0,0
L3192:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 175 ---
Cryptarithm2.tHIRTY:	fn_link  L3304
	fn_link  L3212
	fn_combi_t2 4, 3,0,1,0,0,0
L3212:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 176 ---
L3220:	fn_link  L3232
	fn_link  L3236
	fn_combi_t2 4, 3,0,1,0,0,0
L3232:	fn_combi_t0 2, 0,0,0,0,0,0
L3236:	fn_box
	.word 0x00000059	# raw word 89
	fn_box_body
# --- block 177 ---
L3244:	fn_link  L3220
	fn_link  L3256
	fn_combi_t2 4, 3,0,1,0,0,0
L3256:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 178 ---
L3264:	fn_link  L3244
	fn_link  L3276
	fn_combi_t2 4, 3,0,1,0,0,0
L3276:	fn_box
	.word 0x00000052	# raw word 82
	fn_box_body
# --- block 179 ---
L3284:	fn_link  L3264
	fn_link  L3296
	fn_combi_t2 4, 3,0,1,0,0,0
L3296:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 180 ---
L3304:	fn_link  L3284
	fn_link  L3316
	fn_combi_t2 4, 3,0,1,0,0,0
L3316:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 181 ---
Cryptarithm2.tWELVE:	fn_link  L3428
	fn_link  L3336
	fn_combi_t2 4, 3,0,1,0,0,0
L3336:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 182 ---
L3344:	fn_link  L3356
	fn_link  L3360
	fn_combi_t2 4, 3,0,1,0,0,0
L3356:	fn_combi_t0 2, 0,0,0,0,0,0
L3360:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 183 ---
L3368:	fn_link  L3344
	fn_link  L3380
	fn_combi_t2 4, 3,0,1,0,0,0
L3380:	fn_box
	.word 0x00000056	# raw word 86
	fn_box_body
# --- block 184 ---
L3388:	fn_link  L3368
	fn_link  L3400
	fn_combi_t2 4, 3,0,1,0,0,0
L3400:	fn_box
	.word 0x0000004c	# raw word 76
	fn_box_body
# --- block 185 ---
L3408:	fn_link  L3388
	fn_link  L3420
	fn_combi_t2 4, 3,0,1,0,0,0
L3420:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 186 ---
L3428:	fn_link  L3408
	fn_link  L3440
	fn_combi_t2 4, 3,0,1,0,0,0
L3440:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 187 ---
Cryptarithm2.nINETY:	fn_link  L3552
	fn_link  L3460
	fn_combi_t2 4, 3,0,1,0,0,0
L3460:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 188 ---
L3468:	fn_link  L3480
	fn_link  L3484
	fn_combi_t2 4, 3,0,1,0,0,0
L3480:	fn_combi_t0 2, 0,0,0,0,0,0
L3484:	fn_box
	.word 0x00000059	# raw word 89
	fn_box_body
# --- block 189 ---
L3492:	fn_link  L3468
	fn_link  L3504
	fn_combi_t2 4, 3,0,1,0,0,0
L3504:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 190 ---
L3512:	fn_link  L3492
	fn_link  L3524
	fn_combi_t2 4, 3,0,1,0,0,0
L3524:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 191 ---
L3532:	fn_link  L3512
	fn_link  L3544
	fn_combi_t2 4, 3,0,1,0,0,0
L3544:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 192 ---
L3552:	fn_link  L3532
	fn_link  L3564
	fn_combi_t2 4, 3,0,1,0,0,0
L3564:	fn_box
	.word 0x00000049	# raw word 73
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
