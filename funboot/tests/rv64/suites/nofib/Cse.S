# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Cse  (entry @0)
	.text
	.globl	Cse.a
	.globl	Cse.append
	.globl	Cse.b
	.globl	Cse.bench
	.globl	Cse.bind
	.globl	Cse.c
	.globl	Cse.cse
	.globl	Cse.d
	.globl	Cse.eqL
	.globl	Cse.example1
	.globl	Cse.example2
	.globl	Cse.example3
	.globl	Cse.example4
	.globl	Cse.example5
	.globl	Cse.examples
	.globl	Cse.findCommon
	.globl	Cse.hashG
	.globl	Cse.headI
	.globl	Cse.incr
	.globl	Cse.labelTree
	.globl	Cse.loop
	.globl	Cse.ltGraph
	.globl	Cse.mmapl
	.globl	Cse.mult
	.globl	Cse.plus
	.globl	Cse.prod
	.globl	Cse.scanrL
	.globl	Cse.simIter
	.globl	Cse.startingWith
	.globl	Cse.takeL
	.globl	Cse.updF
	.globl	Cse.update
	.globl	Cse.zerO
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.null
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.scanl
	.globl	NanoPrelude.snd
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Cse.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Cse.bench:	fn_link  L40
	fn_link  L48
	fn_elink Cse.loop
L40:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L48:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
Cse.loop:	fn_link  L132
	fn_link  L176
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 4 ---
L68:	fn_link  Cse.examples
	fn_link  L88
	fn_link  NanoPrelude.rem
	fn_link  Cse.takeL
	fn_combi_t12 5, 0,1,4,2,3,0
L88:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 5 ---
L96:	fn_link  L68
L100:	fn_link  Cse.cse
	fn_link  NanoPrelude.map
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 6 ---
L112:	fn_link  L96
	fn_link  Cse.hashG
	fn_link  NanoPrelude.foldl
	fn_link  Cse.loop
	fn_combi_t56 6, 0,1,2,4,3,5
# --- block 7 ---
L132:	fn_link  L148
	fn_link  L172
	fn_link  L112
	fn_combi_t43 5, 0,3,4,1,4,2
L148:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L172:	fn_y
# --- block 8 ---
L176:	fn_link  L188
	fn_link  Cse.simIter
	fn_combi_t29 5, 0,4,1,2,4,3
L188:	fn_elink _prim_gt
# --- block 9 ---
Cse.simIter:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 10 ---
NanoPrelude.foldl:	fn_link  L216
	fn_link  L212
	fn_combi_t3 3, 0,1,2,0,0,0
L212:	fn_y
# --- block 11 ---
L216:	fn_link  L224
	fn_combi_t46 5, 4,3,0,1,2,3
L224:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 12 ---
Cse.hashG:	fn_link  L548
	fn_elink NanoPrelude.foldl
# --- block 13 ---
L236:	fn_link  L256
	fn_link  L280
	fn_link  L304
	fn_link  L312
	fn_combi_t55 6, 5,0,1,4,2,3
L256:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L280:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L304:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L312:	fn_y
# --- block 14 ---
L316:	fn_link  L336
	fn_link  L360
	fn_link  L384
	fn_link  L392
	fn_combi_t55 6, 5,0,1,4,2,3
L336:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L360:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L384:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L392:	fn_y
# --- block 15 ---
L396:	fn_link  L316
	fn_link  L408
	fn_combi_t7 4, 0,1,2,3,0,0
L408:	fn_y
# --- block 16 ---
L412:	fn_link  L236
	fn_link  L432
	fn_link  L396
	fn_link  NanoPrelude.foldl
	fn_combi_t49 6, 0,1,2,3,4,5
L432:	fn_y
# --- block 17 ---
L436:	fn_link  L456
	fn_link  L480
	fn_link  L504
	fn_link  L512
	fn_combi_t55 6, 5,0,1,4,2,3
L456:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L480:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L504:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L512:	fn_y
# --- block 18 ---
L516:	fn_link  L436
	fn_link  L528
	fn_combi_t7 4, 0,1,2,3,0,0
L528:	fn_y
# --- block 19 ---
L532:	fn_link  L412
	fn_link  L516
	fn_link  NanoPrelude.foldl
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 20 ---
L548:	fn_link  L532
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 21 ---
NanoPrelude.map:	fn_link  L584
	fn_link  L568
	fn_combi_t3 3, 0,1,2,0,0,0
L568:	fn_y
# --- block 22 ---
L572:	fn_link  L580
	fn_combi_t15 5, 0,1,3,2,4,0
L580:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L584:	fn_link  L572
	fn_link  L596
	fn_combi_t16 5, 4,0,1,2,3,0
L596:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
Cse.cse:	fn_link  L612
	fn_link  Cse.findCommon
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 25 ---
L612:	fn_link  Cse.labelTree
	fn_link  Cse.ltGraph
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 26 ---
Cse.findCommon:	fn_link  L936
	fn_link  NanoPrelude.snd
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 27 ---
L636:	fn_link  L648
	fn_link  L652
	fn_combi_t2 3, 2,0,1,0,0,0
L648:	fn_combi_t0 2, 0,0,0,0,0,0
L652:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 28 ---
L656:	fn_link  NanoPrelude.map
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 29 ---
L664:	fn_link  L672
	fn_combi_t6 4, 0,3,1,2,0,0
L672:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 30 ---
L676:	fn_link  Cse.eqL
	fn_combi_t28 6, 0,5,1,2,3,4
# --- block 31 ---
L684:	fn_link  Cse.eqL
	fn_combi_t14 5, 0,1,4,2,3,0
# --- block 32 ---
L692:	fn_link  L700
	fn_combi_t40 5, 0,1,2,4,3,4
L700:	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 33 ---
L704:	fn_link  L684
	fn_link  L692
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 34 ---
L716:	fn_link  L676
	fn_link  L704
	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 35 ---
L728:	fn_link  L716
	fn_link  L740
	fn_combi_t7 4, 0,1,2,3,0,0
L740:	fn_combi_t56 5, 3,0,1,4,2,4
# --- block 36 ---
L744:	fn_link  L752
	fn_combi_t48 5, 4,0,1,3,2,3
L752:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L756:	fn_link  L744
	fn_link  L768
	fn_combi_t33 6, 0,1,2,5,3,4
L768:	fn_y
# --- block 38 ---
L772:	fn_link  L664
	fn_link  L728
	fn_link  L756
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 39 ---
L788:	fn_link  L800
	fn_link  L804
	fn_combi_t32 7, 6,0,2,3,4,1
L800:	fn_combi_t0 2, 0,0,0,0,0,0
L804:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 40 ---
L808:	fn_link  Cse.append
	fn_combi_t47 6, 5,2,0,1,4,3
# --- block 41 ---
L816:	fn_link  Cse.headI
	fn_link  Cse.updF
	fn_combi_t53 6, 5,0,2,1,4,3
# --- block 42 ---
L828:	fn_link  L816
	fn_combi_t23 6, 0,1,2,4,5,3
# --- block 43 ---
L836:	fn_link  NanoPrelude.null
	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 44 ---
L844:	fn_link  L836
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 45 ---
L852:	fn_link  L828
	fn_link  L844
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 46 ---
L864:	fn_link  L788
	fn_link  L808
	fn_link  L852
	fn_link  L884
	fn_combi_t38 5, 0,1,4,2,3,4
L884:	fn_combi_t47 5, 0,4,1,2,3,4
# --- block 47 ---
L888:	fn_link  L896
	fn_combi_t38 5, 0,1,4,2,3,4
L896:	fn_combi_t42 4, 0,3,2,1,3,2
# --- block 48 ---
L900:	fn_link  L772
	fn_link  L864
	fn_link  L888
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 49 ---
L916:	fn_link  L656
	fn_link  L900
	fn_combi_t56 6, 2,0,3,4,1,5
# --- block 50 ---
L928:	fn_link  L916
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 51 ---
L936:	fn_link  L636
	fn_link  L928
	fn_elink NanoPrelude.foldr
# --- block 52 ---
NanoPrelude.snd:	fn_link  L956
	fn_combi_t1 2, 1,0,0,0,0,0
L956:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 53 ---
NanoPrelude.foldr:	fn_link  L976
	fn_link  L972
	fn_combi_t7 4, 0,1,2,3,0,0
L972:	fn_y
# --- block 54 ---
L976:	fn_link  L984
	fn_combi_t16 5, 4,2,0,1,3,0
L984:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 55 ---
NanoPrelude.null:	fn_link  L1004
	fn_link  L1000
	fn_combi_t2 3, 2,0,1,0,0,0
L1000:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 56 ---
L1004:	fn_link  L1012
	fn_combi_t0 3, 0,0,0,0,0,0
L1012:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
Cse.updF:	fn_link  L1024
	fn_combi_t29 5, 4,1,0,3,4,2
L1024:	fn_elink _prim_eq
# --- block 58 ---
Cse.headI:	fn_link  L1040
	fn_link  L1044
	fn_combi_t2 3, 2,0,1,0,0,0
L1040:	fn_combi_t0 2, 0,0,0,0,0,0
L1044:	fn_elink _error0
# --- block 59 ---
Cse.append:	fn_link  L1056
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 60 ---
L1056:	fn_link  Cse.append
	fn_link  L1068
	fn_combi_t16 5, 0,3,1,4,2,0
L1068:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 61 ---
Cse.eqL:	fn_link  L1136
	fn_link  L1152
	fn_link  L1088
	fn_combi_t40 5, 3,4,0,1,2,4
L1088:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 62 ---
L1092:	fn_link  L1112
	fn_link  L1116
	fn_link  L1120
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L1112:	fn_combi_t0 2, 1,0,0,0,0,0
L1116:	fn_combi_t0 2, 0,0,0,0,0,0
L1120:	fn_elink _prim_eq
# --- block 63 ---
L1124:	fn_link  Cse.eqL
	fn_link  L1092
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 64 ---
L1136:	fn_link  L1124
	fn_link  L1148
	fn_combi_t16 5, 2,0,1,3,4,0
L1148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 65 ---
L1152:	fn_link  L1160
	fn_combi_t0 3, 0,0,0,0,0,0
L1160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 66 ---
NanoPrelude.$26$26:	fn_link  L1172
	fn_combi_t1 2, 1,0,0,0,0,0
L1172:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 67 ---
Cse.ltGraph:	fn_link  L1248
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 68 ---
L1184:	fn_link  Cse.ltGraph
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 69 ---
L1200:	fn_link  L1208
	fn_combi_t1 3, 1,0,0,0,0,0
L1208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
L1212:	fn_link  L1200
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 71 ---
L1220:	fn_link  L1212
	fn_link  NanoPrelude.map
	fn_combi_t42 6, 5,3,4,0,1,2
# --- block 72 ---
L1232:	fn_link  L1220
	fn_link  L1244
	fn_combi_t32 6, 0,1,2,4,5,3
L1244:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 73 ---
L1248:	fn_link  L1184
	fn_link  L1232
	fn_combi_t20 4, 2,0,3,1,3,0
# --- block 74 ---
NanoPrelude.concat:	fn_link  L1272
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L1272:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 75 ---
Data.List_Type.$2b$2b:	fn_link  L1304
	fn_link  L1288
	fn_combi_t5 4, 0,1,3,2,0,0
L1288:	fn_y
# --- block 76 ---
L1292:	fn_link  L1300
	fn_combi_t6 4, 0,2,1,3,0,0
L1300:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 77 ---
L1304:	fn_link  L1292
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 78 ---
Cse.labelTree:	fn_link  L1332
	fn_link  L1396
	fn_link  L1340
	fn_link  Cse.startingWith
	fn_combi_t12 5, 0,1,2,4,3,0
L1332:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1340:	fn_y
# --- block 79 ---
L1344:	fn_link  L1360
	fn_link  L1364
	fn_link  L1368
	fn_combi_t54 6, 0,1,2,3,4,5
L1360:	fn_combi_t2 3, 2,1,0,0,0,0
L1364:	fn_combi_t2 3, 2,0,1,0,0,0
L1368:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 80 ---
L1372:	fn_link  Cse.mmapl
	fn_link  Cse.bind
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 81 ---
L1384:	fn_link  Cse.incr
	fn_link  Cse.bind
	fn_combi_t47 6, 0,1,2,3,4,5
# --- block 82 ---
L1396:	fn_link  L1344
	fn_link  L1372
	fn_link  L1384
	fn_combi_t19 5, 4,0,1,3,2,0
# --- block 83 ---
Cse.startingWith:	fn_link  L1420
	fn_combi_t2 3, 1,2,0,0,0,0
L1420:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 84 ---
Cse.bind:	fn_link  L1432
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 85 ---
L1432:	fn_link  L1444
	fn_link  L1448
	fn_combi_t15 4, 2,3,0,3,1,0
L1444:	fn_combi_t0 2, 0,0,0,0,0,0
L1448:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 86 ---
Cse.incr:	fn_link  L1460
	fn_elink Cse.update
# --- block 87 ---
L1460:	fn_link  L1472
	fn_link  L1496
	fn_combi_t3 3, 0,2,1,0,0,0
L1472:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1496:	fn_y
# --- block 88 ---
Cse.update:	fn_link  L1512
	fn_link  L1516
	fn_combi_t6 4, 0,2,1,3,0,0
L1512:	fn_combi_t0 1, 0,0,0,0,0,0
L1516:	fn_combi_t5 3, 2,0,1,1,0,0
# --- block 89 ---
Cse.mmapl:	fn_link  L1580
	fn_link  L1532
	fn_combi_t3 3, 0,1,2,0,0,0
L1532:	fn_y
# --- block 90 ---
L1536:	fn_link  L1548
	fn_link  L1552
	fn_combi_t7 4, 0,1,2,3,0,0
L1548:	fn_combi_t2 4, 3,0,1,0,0,0
L1552:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 91 ---
L1556:	fn_link  L1536
	fn_link  Cse.bind
	fn_combi_t15 5, 0,2,3,1,4,0
# --- block 92 ---
L1568:	fn_link  L1556
	fn_link  Cse.bind
	fn_combi_t44 6, 0,2,4,1,3,5
# --- block 93 ---
L1580:	fn_link  L1568
	fn_link  L1596
	fn_link  L1600
	fn_combi_t44 6, 5,0,1,2,3,4
L1596:	fn_combi_t0 2, 0,0,0,0,0,0
L1600:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 94 ---
Cse.takeL:	fn_link  L1620
	fn_link  L1668
	fn_link  L1684
	fn_combi_t24 5, 0,1,3,3,4,2
L1620:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 95 ---
L1624:	fn_link  L1640
	fn_link  L1664
	fn_link  Cse.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L1640:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1664:	fn_y
# --- block 96 ---
L1668:	fn_link  L1624
	fn_link  L1680
	fn_combi_t16 5, 0,3,1,2,4,0
L1680:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 97 ---
L1684:	fn_link  L1700
	fn_link  L1704
	fn_link  L1708
	fn_combi_t44 6, 0,4,1,5,2,3
L1700:	fn_combi_t0 2, 0,0,0,0,0,0
L1704:	fn_elink _prim_le
L1708:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 98 ---
NanoPrelude.rem:	fn_link  L1728
	fn_link  L1752
	fn_combi_t8 4, 0,3,2,1,0,0
L1728:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1752:	fn_y
# --- block 99 ---
Cse.examples:	fn_link  L1820
	fn_link  Cse.a
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 100 ---
L1768:	fn_link  L1780
	fn_link  Cse.example5
	fn_combi_t2 4, 3,0,1,0,0,0
L1780:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 101 ---
L1784:	fn_link  L1768
	fn_link  Cse.example4
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 102 ---
L1796:	fn_link  L1784
	fn_link  Cse.example3
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 103 ---
L1808:	fn_link  L1796
	fn_link  Cse.example2
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 104 ---
L1820:	fn_link  L1808
	fn_link  Cse.example1
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 105 ---
Cse.a:	fn_link  L1844
	fn_link  L1848
	fn_combi_t2 3, 2,0,1,0,0,0
L1844:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
L1848:	fn_link  L1860
	fn_link  L1864
	fn_combi_t2 4, 3,0,1,0,0,0
L1860:	fn_combi_t0 2, 0,0,0,0,0,0
L1864:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 107 ---
Cse.example1:	fn_link  Cse.a
	fn_link  Cse.a
	fn_elink Cse.plus
# --- block 108 ---
Cse.plus:	fn_link  L1916
	fn_link  L1924
	fn_link  L1900
	fn_combi_t16 5, 0,1,2,3,4,0
L1900:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 109 ---
L1904:	fn_link  L1912
	fn_combi_t2 4, 3,1,0,0,0,0
L1912:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 110 ---
L1916:	fn_link  L1904
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 111 ---
L1924:	fn_link  L1936
	fn_link  L1940
	fn_combi_t2 4, 3,0,1,0,0,0
L1936:	fn_combi_t0 2, 0,0,0,0,0,0
L1940:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 112 ---
Cse.example2:	fn_link  L1960
	fn_link  L1972
	fn_elink Cse.plus
# --- block 113 ---
L1960:	fn_link  Cse.b
	fn_link  Cse.a
	fn_elink Cse.mult
# --- block 114 ---
L1972:	fn_link  Cse.b
	fn_link  Cse.a
	fn_elink Cse.mult
# --- block 115 ---
Cse.mult:	fn_link  L2016
	fn_link  L2024
	fn_link  L2000
	fn_combi_t16 5, 0,1,2,3,4,0
L2000:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 116 ---
L2004:	fn_link  L2012
	fn_combi_t2 4, 3,1,0,0,0,0
L2012:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 117 ---
L2016:	fn_link  L2004
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 118 ---
L2024:	fn_link  L2036
	fn_link  L2040
	fn_combi_t2 4, 3,0,1,0,0,0
L2036:	fn_combi_t0 2, 0,0,0,0,0,0
L2040:	fn_box
	.word 0x0000002a	# raw word 42
	fn_box_body
# --- block 119 ---
Cse.b:	fn_link  L2060
	fn_link  L2064
	fn_combi_t2 3, 2,0,1,0,0,0
L2060:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 120 ---
L2064:	fn_link  L2076
	fn_link  L2080
	fn_combi_t2 4, 3,0,1,0,0,0
L2076:	fn_combi_t0 2, 0,0,0,0,0,0
L2080:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 121 ---
Cse.example3:	fn_link  L2100
	fn_link  L2124
	fn_elink Cse.plus
# --- block 122 ---
L2100:	fn_link  Cse.b
	fn_link  Cse.a
	fn_elink Cse.plus
# --- block 123 ---
L2112:	fn_link  Cse.b
	fn_link  Cse.a
	fn_elink Cse.plus
# --- block 124 ---
L2124:	fn_link  Cse.c
	fn_link  L2112
	fn_elink Cse.mult
# --- block 125 ---
Cse.c:	fn_link  L2148
	fn_link  L2152
	fn_combi_t2 3, 2,0,1,0,0,0
L2148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 126 ---
L2152:	fn_link  L2164
	fn_link  L2168
	fn_combi_t2 4, 3,0,1,0,0,0
L2164:	fn_combi_t0 2, 0,0,0,0,0,0
L2168:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 127 ---
Cse.example4:	fn_link  L2236
	fn_elink Cse.prod
# --- block 128 ---
L2184:	fn_link  L2196
	fn_link  Cse.d
	fn_combi_t2 4, 3,0,1,0,0,0
L2196:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 129 ---
L2200:	fn_link  L2184
	fn_link  Cse.c
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 130 ---
L2212:	fn_link  L2200
	fn_link  Cse.b
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 131 ---
L2224:	fn_link  L2212
	fn_link  Cse.a
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 132 ---
L2236:	fn_link  L2224
	fn_link  Cse.zerO
	fn_link  Cse.plus
	fn_elink NanoPrelude.scanl
# --- block 133 ---
Cse.prod:	fn_link  L2260
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 134 ---
L2260:	fn_link  L2272
	fn_link  L2276
	fn_combi_t2 4, 3,0,1,0,0,0
L2272:	fn_combi_t0 2, 0,0,0,0,0,0
L2276:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 135 ---
NanoPrelude.scanl:	fn_link  L2320
	fn_link  L2296
	fn_combi_t3 3, 0,1,2,0,0,0
L2296:	fn_y
# --- block 136 ---
L2300:	fn_link  L2312
	fn_link  L2316
	fn_combi_t48 5, 0,3,4,1,2,3
L2312:	fn_combi_t0 2, 0,0,0,0,0,0
L2316:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 137 ---
L2320:	fn_link  L2332
	fn_link  L2300
	fn_combi_t7 4, 0,1,2,3,0,0
L2332:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 138 ---
Cse.zerO:	fn_link  L2348
	fn_link  L2352
	fn_combi_t2 3, 2,0,1,0,0,0
L2348:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 139 ---
L2352:	fn_link  L2364
	fn_link  L2368
	fn_combi_t2 4, 3,0,1,0,0,0
L2364:	fn_combi_t0 2, 0,0,0,0,0,0
L2368:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 140 ---
Cse.d:	fn_link  L2388
	fn_link  L2392
	fn_combi_t2 3, 2,0,1,0,0,0
L2388:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 141 ---
L2392:	fn_link  L2404
	fn_link  L2408
	fn_combi_t2 4, 3,0,1,0,0,0
L2404:	fn_combi_t0 2, 0,0,0,0,0,0
L2408:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 142 ---
Cse.example5:	fn_link  L2476
	fn_elink Cse.prod
# --- block 143 ---
L2424:	fn_link  L2436
	fn_link  Cse.d
	fn_combi_t2 4, 3,0,1,0,0,0
L2436:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 144 ---
L2440:	fn_link  L2424
	fn_link  Cse.c
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 145 ---
L2452:	fn_link  L2440
	fn_link  Cse.b
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 146 ---
L2464:	fn_link  L2452
	fn_link  Cse.a
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 147 ---
L2476:	fn_link  L2464
	fn_link  Cse.zerO
	fn_link  Cse.plus
	fn_elink Cse.scanrL
# --- block 148 ---
Cse.scanrL:	fn_link  L2588
	fn_link  L2504
	fn_combi_t7 4, 0,1,2,3,0,0
L2504:	fn_y
# --- block 149 ---
L2508:	fn_link  L2524
	fn_link  L2528
	fn_link  L2532
	fn_combi_t58 6, 0,3,4,5,1,2
L2524:	fn_combi_t0 2, 0,0,0,0,0,0
L2528:	fn_elink _error0
L2532:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 150 ---
L2536:	fn_link  L2556
	fn_link  L2560
	fn_link  L2508
	fn_link  L2564
	fn_combi_t26 6, 0,1,4,5,2,3
L2556:	fn_combi_t0 3, 0,0,0,0,0,0
L2560:	fn_elink _error0
L2564:	fn_combi_t48 4, 0,3,3,1,2,3
# --- block 151 ---
L2568:	fn_link  L2536
	fn_combi_t14 5, 0,1,3,2,4,0
# --- block 152 ---
L2576:	fn_link  L2584
	fn_combi_t2 4, 3,1,0,0,0,0
L2584:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 153 ---
L2588:	fn_link  L2568
	fn_link  L2576
	fn_combi_t44 6, 5,0,3,1,2,4

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
