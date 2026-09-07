# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Constraints  (entry @0)
	.text
	.globl	Constraints.absI
	.globl	Constraints.append
	.globl	Constraints.bench
	.globl	Constraints.bj
	.globl	Constraints.bj$27
	.globl	Constraints.bjbt
	.globl	Constraints.bjbt$27
	.globl	Constraints.bm
	.globl	Constraints.bt
	.globl	Constraints.cacheChecks
	.globl	Constraints.checkComplete
	.globl	Constraints.collect
	.globl	Constraints.combine
	.globl	Constraints.complete
	.globl	Constraints.domainWipeOut
	.globl	Constraints.earliestInconsistency
	.globl	Constraints.emptyTable
	.globl	Constraints.fc
	.globl	Constraints.fillTable
	.globl	Constraints.filterTree
	.globl	Constraints.foldTree
	.globl	Constraints.fromTo
	.globl	Constraints.headL
	.globl	Constraints.idx
	.globl	Constraints.initTree
	.globl	Constraints.isUnknown
	.globl	Constraints.knownConflict
	.globl	Constraints.knownSolution
	.globl	Constraints.label
	.globl	Constraints.leaves
	.globl	Constraints.level
	.globl	Constraints.lookupCache
	.globl	Constraints.mapTree
	.globl	Constraints.maxLevel
	.globl	Constraints.mkTree
	.globl	Constraints.notElemL
	.globl	Constraints.prune
	.globl	Constraints.queens
	.globl	Constraints.rel
	.globl	Constraints.revL
	.globl	Constraints.search
	.globl	Constraints.simQ
	.globl	Constraints.tailL
	.globl	Constraints.unionL
	.globl	Constraints.vals
	.globl	Constraints.value
	.globl	Constraints.vars
	.globl	Constraints.zipWithL
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.all
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.null
	.globl	NanoPrelude.snd
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Constraints.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Constraints.bench:	fn_link  L136
	fn_link  L44
	fn_link  L228
	fn_elink NanoPrelude.foldl
L44:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
L52:	fn_link  L64
	fn_link  Constraints.fc
	fn_combi_t2 4, 3,0,1,0,0,0
L64:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 4 ---
L68:	fn_link  L52
	fn_link  Constraints.bjbt$27
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 5 ---
L80:	fn_link  L68
	fn_link  Constraints.bjbt
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 6 ---
L92:	fn_link  L80
	fn_link  Constraints.bm
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 7 ---
L104:	fn_link  L92
	fn_link  Constraints.bt
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 8 ---
L116:	fn_link  Constraints.simQ
	fn_link  Constraints.queens
	fn_link  Constraints.search
	fn_link  NanoPrelude.length
	fn_combi_t20 5, 0,1,4,2,3,0
# --- block 9 ---
L136:	fn_link  L104
	fn_link  L116
	fn_elink NanoPrelude.map
# --- block 10 ---
L148:	fn_link  L168
	fn_link  L192
	fn_link  L216
	fn_link  L224
	fn_combi_t55 6, 5,0,1,4,2,3
L168:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L192:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L216:	fn_box
	.word 0x00001fff	# raw word 8191
	fn_box_body
L224:	fn_y
# --- block 11 ---
L228:	fn_link  L148
	fn_link  L240
	fn_combi_t7 4, 0,1,2,3,0,0
L240:	fn_y
# --- block 12 ---
NanoPrelude.foldl:	fn_link  L260
	fn_link  L256
	fn_combi_t3 3, 0,1,2,0,0,0
L256:	fn_y
# --- block 13 ---
L260:	fn_link  L268
	fn_combi_t46 5, 4,3,0,1,2,3
L268:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 14 ---
NanoPrelude.map:	fn_link  L300
	fn_link  L284
	fn_combi_t3 3, 0,1,2,0,0,0
L284:	fn_y
# --- block 15 ---
L288:	fn_link  L296
	fn_combi_t15 5, 0,1,3,2,4,0
L296:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L300:	fn_link  L288
	fn_link  L312
	fn_combi_t16 5, 4,0,1,2,3,0
L312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 17 ---
NanoPrelude.length:	fn_link  L328
	fn_link  L376
	fn_y
L328:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 18 ---
L336:	fn_link  L348
	fn_link  L372
	fn_combi_t8 5, 2,0,3,1,0,0
L348:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L372:	fn_y
# --- block 19 ---
L376:	fn_link  L336
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 20 ---
Constraints.search:	fn_link  L472
	fn_link  L496
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 21 ---
L396:	fn_link  NanoPrelude.snd
	fn_link  Constraints.knownConflict
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 22 ---
L408:	fn_link  L396
	fn_elink Constraints.prune
# --- block 23 ---
L416:	fn_link  L408
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 24 ---
L424:	fn_link  Constraints.mkTree
	fn_link  L440
	fn_link  L416
	fn_combi_t19 5, 0,1,3,4,2,0
L440:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 25 ---
L444:	fn_link  NanoPrelude.snd
	fn_link  Constraints.knownSolution
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 26 ---
L456:	fn_link  L444
	fn_elink NanoPrelude.filter
# --- block 27 ---
L464:	fn_link  L456
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 28 ---
L472:	fn_link  L424
	fn_link  Constraints.leaves
	fn_link  L492
	fn_link  L464
	fn_combi_t58 6, 0,1,2,3,4,5
L492:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 29 ---
L496:	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.map
	fn_link  L512
	fn_combi_t29 5, 0,1,2,3,4,4
L512:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 30 ---
NanoPrelude.fst:	fn_link  L524
	fn_combi_t1 2, 1,0,0,0,0,0
L524:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
NanoPrelude.filter:	fn_link  L592
	fn_link  L540
	fn_combi_t3 3, 0,1,2,0,0,0
L540:	fn_y
# --- block 32 ---
L544:	fn_link  L556
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L556:	fn_elink _error0
# --- block 33 ---
L560:	fn_link  L568
	fn_combi_t24 5, 0,1,4,2,3,4
L568:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 34 ---
L572:	fn_link  L588
	fn_link  L544
	fn_link  L560
	fn_combi_t26 5, 0,1,3,4,2,4
L588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 35 ---
L592:	fn_link  L572
	fn_link  L604
	fn_combi_t16 5, 4,0,1,2,3,0
L604:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 36 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 37 ---
Constraints.knownSolution:	fn_link  L624
	fn_link  L640
	fn_combi_t2 3, 2,0,1,0,0,0
L624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
L628:	fn_link  L636
	fn_combi_t0 3, 0,0,0,0,0,0
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 39 ---
L640:	fn_link  L628
	fn_link  L652
	fn_combi_t2 3, 2,0,1,0,0,0
L652:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 40 ---
NanoPrelude.snd:	fn_link  L664
	fn_combi_t1 2, 1,0,0,0,0,0
L664:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 41 ---
Constraints.leaves:	fn_link  L704
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 42 ---
L676:	fn_link  Constraints.leaves
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t7 6, 0,1,2,3,0,0
# --- block 43 ---
L692:	fn_link  L700
	fn_combi_t2 4, 3,1,0,0,0,0
L700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 44 ---
L704:	fn_link  L676
	fn_link  L692
	fn_combi_t15 4, 3,0,2,1,3,0
# --- block 45 ---
NanoPrelude.concat:	fn_link  L728
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L728:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
NanoPrelude.foldr:	fn_link  L748
	fn_link  L744
	fn_combi_t7 4, 0,1,2,3,0,0
L744:	fn_y
# --- block 47 ---
L748:	fn_link  L756
	fn_combi_t16 5, 4,2,0,1,3,0
L756:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 48 ---
Data.List_Type.$2b$2b:	fn_link  L788
	fn_link  L772
	fn_combi_t5 4, 0,1,3,2,0,0
L772:	fn_y
# --- block 49 ---
L776:	fn_link  L784
	fn_combi_t6 4, 0,2,1,3,0,0
L784:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 50 ---
L788:	fn_link  L776
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 51 ---
Constraints.prune:	fn_link  NanoPrelude.not
	fn_link  L812
	fn_link  Constraints.filterTree
	fn_combi_t7 4, 0,1,2,3,0,0
L812:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 52 ---
Constraints.filterTree:	fn_link  L848
	fn_link  Constraints.foldTree
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 53 ---
L828:	fn_link  Constraints.label
	fn_link  L844
	fn_link  NanoPrelude.filter
	fn_combi_t7 4, 0,1,3,2,0,0
L844:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L848:	fn_link  L828
	fn_link  L860
	fn_combi_t16 5, 0,3,1,2,4,0
L860:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 55 ---
Constraints.foldTree:	fn_link  L888
	fn_link  L876
	fn_combi_t3 3, 0,1,2,0,0,0
L876:	fn_y
# --- block 56 ---
L880:	fn_link  NanoPrelude.map
	fn_combi_t16 5, 1,3,0,2,4,0
# --- block 57 ---
L888:	fn_link  L880
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 58 ---
Constraints.label:	fn_link  L904
	fn_combi_t1 2, 1,0,0,0,0,0
L904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 59 ---
NanoPrelude.not:	fn_link  L920
	fn_link  L924
	fn_combi_t2 3, 2,0,1,0,0,0
L920:	fn_combi_t0 2, 0,0,0,0,0,0
L924:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 60 ---
Constraints.knownConflict:	fn_link  L940
	fn_link  L956
	fn_combi_t2 3, 2,0,1,0,0,0
L940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 61 ---
L944:	fn_link  L952
	fn_combi_t0 3, 0,0,0,0,0,0
L952:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 62 ---
L956:	fn_link  L944
	fn_link  L968
	fn_combi_t2 3, 2,0,1,0,0,0
L968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 63 ---
Constraints.mkTree:	fn_link  L988
	fn_link  L1140
	fn_link  Constraints.initTree
	fn_combi_t5 4, 0,1,3,2,0,0
L988:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 64 ---
L992:	fn_link  L1012
	fn_link  Constraints.maxLevel
	fn_link  L1036
	fn_link  L1040
	fn_combi_t21 5, 0,1,2,4,3,0
L1012:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1036:	fn_y
L1040:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 65 ---
L1044:	fn_link  L1052
	fn_combi_t40 5, 0,0,1,2,3,4
L1052:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 66 ---
L1056:	fn_link  L992
	fn_link  L1044
	fn_combi_t26 5, 0,1,2,4,2,3
# --- block 67 ---
L1068:	fn_link  L1056
	fn_link  L1080
	fn_combi_t16 5, 4,0,1,2,3,0
L1080:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 68 ---
L1084:	fn_link  L1104
	fn_link  L1108
	fn_link  Constraints.maxLevel
	fn_link  Constraints.vars
	fn_combi_t30 6, 0,4,1,5,2,3
L1104:	fn_combi_t0 2, 0,0,0,0,0,0
L1108:	fn_elink _prim_lt
# --- block 69 ---
L1112:	fn_link  L1068
	fn_link  L1132
	fn_link  L1084
	fn_link  L1136
	fn_combi_t10 5, 0,1,4,2,3,0
L1132:	fn_y
L1136:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 70 ---
L1140:	fn_link  Constraints.vals
	fn_link  L1160
	fn_link  Constraints.fromTo
	fn_link  L1112
	fn_combi_t48 5, 0,4,1,2,3,4
L1160:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 71 ---
Constraints.initTree:	fn_link  L1184
	fn_link  L1180
	fn_combi_t3 3, 0,1,2,0,0,0
L1180:	fn_y
# --- block 72 ---
L1184:	fn_link  NanoPrelude.map
	fn_link  L1196
	fn_combi_t48 5, 0,4,1,3,2,4
L1196:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 73 ---
Constraints.vars:	fn_link  L1208
	fn_combi_t1 2, 1,0,0,0,0,0
L1208:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 74 ---
Constraints.maxLevel:	fn_link  L1232
	fn_link  L1224
	fn_combi_t2 3, 2,0,1,0,0,0
L1224:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 75 ---
L1232:	fn_link  L1240
	fn_combi_t1 3, 1,0,0,0,0,0
L1240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 76 ---
Constraints.fromTo:	fn_link  L1260
	fn_link  L1308
	fn_link  L1324
	fn_combi_t10 4, 0,1,3,2,3,0
L1260:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
L1264:	fn_link  L1280
	fn_link  L1304
	fn_link  Constraints.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L1280:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1304:	fn_y
# --- block 78 ---
L1308:	fn_link  L1264
	fn_link  L1320
	fn_combi_t16 4, 0,2,1,2,3,0
L1320:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 79 ---
L1324:	fn_link  L1332
	fn_combi_t29 5, 4,3,0,1,4,2
L1332:	fn_elink _prim_gt
# --- block 80 ---
Constraints.vals:	fn_link  L1344
	fn_combi_t1 2, 1,0,0,0,0,0
L1344:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 81 ---
Constraints.queens:	fn_link  L1572
	fn_link  L1360
	fn_combi_t4 3, 0,2,2,1,0,0
L1360:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 82 ---
L1364:	fn_link  L1384
	fn_link  L1388
	fn_link  L1412
	fn_link  Constraints.absI
	fn_combi_t36 6, 0,1,5,4,2,3
L1384:	fn_elink _prim_ne
L1388:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1412:	fn_y
# --- block 83 ---
L1416:	fn_link  L1432
	fn_link  L1456
	fn_link  Constraints.absI
	fn_combi_t36 6, 0,1,5,3,2,4
L1432:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1456:	fn_y
# --- block 84 ---
L1460:	fn_link  L1364
	fn_link  L1416
	fn_combi_t16 5, 0,3,1,2,4,0
# --- block 85 ---
L1472:	fn_link  L1492
	fn_link  L1496
	fn_link  L1500
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L1492:	fn_combi_t0 2, 1,0,0,0,0,0
L1496:	fn_combi_t0 2, 0,0,0,0,0,0
L1500:	fn_elink _prim_ne
# --- block 86 ---
L1504:	fn_link  L1472
	fn_link  L1516
	fn_combi_t3 3, 0,1,2,0,0,0
L1516:	fn_combi_t46 5, 0,4,1,4,2,3
# --- block 87 ---
L1520:	fn_link  L1504
	fn_combi_t25 6, 0,1,2,5,3,4
# --- block 88 ---
L1528:	fn_link  L1520
	fn_combi_t25 5, 0,4,1,4,2,3
# --- block 89 ---
L1536:	fn_link  L1556
	fn_link  L1560
	fn_link  L1460
	fn_link  L1528
	fn_combi_t10 5, 0,1,4,2,3,0
L1556:	fn_combi_t0 2, 1,0,0,0,0,0
L1560:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 90 ---
L1564:	fn_link  L1536
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 91 ---
L1572:	fn_link  L1564
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 92 ---
NanoPrelude.$26$26:	fn_link  L1588
	fn_combi_t1 2, 1,0,0,0,0,0
L1588:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 93 ---
Constraints.absI:	fn_link  L1620
	fn_link  L1608
	fn_link  L1612
	fn_combi_t38 4, 0,3,1,3,2,3
L1608:	fn_elink _prim_lt
L1612:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 94 ---
L1620:	fn_link  L1636
	fn_link  L1660
	fn_link  L1668
	fn_combi_t8 4, 0,3,1,2,0,0
L1636:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1660:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1668:	fn_y
# --- block 95 ---
Constraints.simQ:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 96 ---
Constraints.bt:	fn_link  L1764
	fn_link  Constraints.mapTree
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 97 ---
L1692:	fn_link  L1700
	fn_combi_t2 4, 3,1,0,0,0,0
L1700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 98 ---
L1704:	fn_link  L1692
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 99 ---
L1712:	fn_link  L1704
	fn_link  L1724
	fn_combi_t7 4, 0,1,2,3,0,0
L1724:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 100 ---
L1728:	fn_link  L1712
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 101 ---
L1736:	fn_link  Constraints.checkComplete
	fn_link  Constraints.earliestInconsistency
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 102 ---
L1748:	fn_link  L1760
	fn_link  L1736
	fn_combi_t3 3, 0,1,2,0,0,0
L1760:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 103 ---
L1764:	fn_link  L1728
	fn_link  L1748
	fn_combi_t46 5, 4,3,0,2,3,1
# --- block 104 ---
Constraints.mapTree:	fn_link  L1808
	fn_link  L1788
	fn_combi_t3 3, 0,1,2,0,0,0
L1788:	fn_y
# --- block 105 ---
L1792:	fn_link  NanoPrelude.map
	fn_link  L1804
	fn_combi_t44 6, 0,2,4,1,3,5
L1804:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 106 ---
L1808:	fn_link  L1792
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 107 ---
Constraints.earliestInconsistency:	fn_link  L1900
	fn_link  L1828
	fn_combi_t6 4, 3,0,1,2,0,0
L1828:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 108 ---
L1832:	fn_link  Constraints.level
	fn_combi_t15 4, 3,0,1,0,2,0
# --- block 109 ---
L1840:	fn_link  L1832
	fn_link  L1852
	fn_combi_t7 5, 0,1,2,3,0,0
L1852:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 110 ---
L1856:	fn_link  Constraints.rel
	fn_link  NanoPrelude.not
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 111 ---
L1868:	fn_link  NanoPrelude.filter
	fn_combi_t25 6, 0,1,2,5,3,4
# --- block 112 ---
L1876:	fn_link  L1896
	fn_link  Constraints.revL
	fn_link  L1856
	fn_link  L1868
	fn_combi_t26 6, 0,1,4,5,2,3
L1896:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 113 ---
L1900:	fn_link  L1840
	fn_link  L1876
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 114 ---
Constraints.rel:	fn_link  L1920
	fn_combi_t1 2, 1,0,0,0,0,0
L1920:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 115 ---
Constraints.revL:	fn_link  L1936
	fn_link  L1940
	fn_elink NanoPrelude.foldl
L1936:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 116 ---
L1940:	fn_link  L1948
	fn_combi_t2 3, 0,2,1,0,0,0
L1948:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 117 ---
Constraints.level:	fn_link  L1960
	fn_combi_t1 2, 1,0,0,0,0,0
L1960:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 118 ---
Constraints.checkComplete:	fn_link  L1984
	fn_link  L1988
	fn_link  L1992
	fn_link  Constraints.complete
	fn_combi_t37 6, 0,4,5,1,2,3
L1984:	fn_combi_t0 2, 0,0,0,0,0,0
L1988:	fn_combi_t1 3, 1,0,0,0,0,0
L1992:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 119 ---
Constraints.complete:	fn_link  L2008
	fn_link  L2012
	fn_combi_t4 4, 0,2,3,1,0,0
L2008:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 120 ---
L2012:	fn_link  L2032
	fn_link  L2036
	fn_link  Constraints.maxLevel
	fn_link  Constraints.vars
	fn_combi_t30 6, 0,4,1,5,2,3
L2032:	fn_combi_t0 2, 0,0,0,0,0,0
L2036:	fn_elink _prim_eq
# --- block 121 ---
Constraints.bm:	fn_link  L2076
	fn_link  NanoPrelude.fst
	fn_link  Constraints.mapTree
	fn_link  L2060
	fn_combi_t15 5, 0,1,2,3,4,0
L2060:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 122 ---
L2064:	fn_link  Constraints.emptyTable
	fn_link  Constraints.cacheChecks
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 123 ---
L2076:	fn_link  L2064
	fn_link  Constraints.lookupCache
	fn_link  L2092
	fn_combi_t15 4, 0,1,3,2,3,0
L2092:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 124 ---
Constraints.lookupCache:	fn_link  L2244
	fn_link  Constraints.mapTree
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 125 ---
L2108:	fn_link  L2124
	fn_link  Constraints.value
	fn_link  L2148
	fn_combi_t7 4, 0,1,3,2,0,0
L2124:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2148:	fn_y
# --- block 126 ---
L2152:	fn_link  L2108
	fn_link  Constraints.headL
	fn_link  Constraints.idx
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 127 ---
L2168:	fn_link  Constraints.checkComplete
	fn_link  Constraints.isUnknown
	fn_combi_t42 5, 0,4,4,1,2,3
# --- block 128 ---
L2180:	fn_link  L2168
	fn_combi_t46 5, 4,2,0,1,2,3
# --- block 129 ---
L2188:	fn_link  L2152
	fn_link  L2180
	fn_link  L2204
	fn_combi_t12 5, 0,1,3,4,2,0
L2204:	fn_combi_t35 6, 5,0,1,2,3,2
# --- block 130 ---
L2208:	fn_link  L2220
	fn_link  L2224
	fn_combi_t2 3, 2,0,1,0,0,0
L2220:	fn_combi_t0 2, 1,0,0,0,0,0
L2224:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 131 ---
L2228:	fn_link  L2208
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 132 ---
L2236:	fn_link  L2228
	fn_combi_t44 4, 2,0,3,1,2,3
# --- block 133 ---
L2244:	fn_link  L2188
	fn_link  L2236
	fn_combi_t8 4, 3,0,1,2,0,0
# --- block 134 ---
Constraints.isUnknown:	fn_link  L2268
	fn_link  L2272
	fn_combi_t2 3, 2,0,1,0,0,0
L2268:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 135 ---
L2272:	fn_link  L2280
	fn_combi_t0 2, 0,0,0,0,0,0
L2280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
Constraints.idx:	fn_link  L2304
	fn_link  L2348
	fn_link  L2300
	fn_combi_t47 5, 3,0,1,2,4,4
L2300:	fn_elink _error0
# --- block 137 ---
L2304:	fn_link  L2320
	fn_link  L2344
	fn_link  Constraints.idx
	fn_combi_t17 5, 0,4,1,3,2,0
L2320:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2344:	fn_y
# --- block 138 ---
L2348:	fn_link  L2360
	fn_link  L2364
	fn_combi_t29 6, 3,0,1,2,5,4
L2360:	fn_elink _prim_eq
L2364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 139 ---
Constraints.headL:	fn_link  L2384
	fn_link  L2388
	fn_combi_t2 3, 2,0,1,0,0,0
L2384:	fn_combi_t0 2, 0,0,0,0,0,0
L2388:	fn_elink _error0
# --- block 140 ---
Constraints.value:	fn_link  L2400
	fn_combi_t1 2, 1,0,0,0,0,0
L2400:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 141 ---
Constraints.cacheChecks:	fn_link  L2472
	fn_link  L2416
	fn_combi_t3 3, 0,1,2,0,0,0
L2416:	fn_y
# --- block 142 ---
L2420:	fn_link  Constraints.tailL
	fn_link  Constraints.fillTable
	fn_combi_t56 6, 3,0,5,2,1,4
# --- block 143 ---
L2432:	fn_link  L2440
	fn_combi_t44 6, 0,1,3,2,4,5
L2440:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 144 ---
L2444:	fn_link  NanoPrelude.map
	fn_link  L2460
	fn_link  L2432
	fn_combi_t5 4, 0,1,3,2,0,0
L2460:	fn_combi_t2 3, 2,1,0,0,0,0
# --- block 145 ---
L2464:	fn_link  L2444
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 146 ---
L2472:	fn_link  L2420
	fn_link  L2464
	fn_combi_t54 6, 5,0,1,2,3,4
# --- block 147 ---
Constraints.fillTable:	fn_link  L2860
	fn_combi_t16 4, 1,3,0,2,3,0
# --- block 148 ---
L2492:	fn_link  Constraints.vars
	fn_link  L2512
	fn_link  L2536
	fn_link  Constraints.fromTo
	fn_combi_t41 6, 0,1,5,2,3,4
L2512:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2536:	fn_y
# --- block 149 ---
L2540:	fn_link  Constraints.vals
	fn_link  L2556
	fn_link  Constraints.fromTo
	fn_combi_t6 4, 0,1,2,3,0,0
L2556:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 150 ---
L2564:	fn_link  L2576
	fn_link  L2580
	fn_combi_t40 6, 0,1,2,4,3,5
L2576:	fn_combi_t2 3, 2,0,1,0,0,0
L2580:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 151 ---
L2584:	fn_link  L2564
	fn_link  L2596
	fn_combi_t16 5, 4,0,1,2,3,0
L2596:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 152 ---
L2600:	fn_link  L2540
	fn_link  L2584
	fn_link  L2616
	fn_combi_t15 5, 0,1,4,2,3,0
L2616:	fn_y
# --- block 153 ---
L2620:	fn_link  L2600
	fn_link  L2632
	fn_combi_t40 6, 0,1,2,4,3,5
L2632:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 154 ---
L2636:	fn_link  L2620
	fn_link  L2648
	fn_combi_t16 5, 4,0,1,2,3,0
L2648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 155 ---
L2652:	fn_link  L2492
	fn_link  L2636
	fn_link  L2668
	fn_combi_t44 5, 0,1,3,2,3,4
L2668:	fn_y
# --- block 156 ---
L2672:	fn_link  L2680
	fn_combi_t2 4, 3,1,0,0,0,0
L2680:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 157 ---
L2684:	fn_link  L2672
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 158 ---
L2692:	fn_link  L2704
	fn_link  Constraints.rel
	fn_combi_t16 5, 0,2,1,3,4,0
L2704:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 159 ---
L2708:	fn_link  NanoPrelude.not
	fn_combi_t58 6, 0,1,3,2,4,5
# --- block 160 ---
L2716:	fn_link  L2732
	fn_link  L2692
	fn_link  L2708
	fn_combi_t12 5, 0,1,3,4,2,0
L2732:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 161 ---
L2736:	fn_link  Constraints.isUnknown
	fn_link  NanoPrelude.$26$26
	fn_combi_t29 5, 0,1,2,3,4,2
# --- block 162 ---
L2748:	fn_link  L2760
	fn_link  L2736
	fn_combi_t3 3, 0,1,2,0,0,0
L2760:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 163 ---
L2764:	fn_link  L2748
	fn_link  L2776
	fn_combi_t29 6, 0,1,5,2,4,3
L2776:	fn_combi_t38 6, 0,1,3,5,2,4
# --- block 164 ---
L2780:	fn_link  L2796
	fn_link  L2716
	fn_link  L2764
	fn_combi_t12 5, 0,1,3,4,2,0
L2796:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 165 ---
L2800:	fn_link  L2684
	fn_link  L2780
	fn_link  L2816
	fn_combi_t40 5, 0,1,3,4,2,4
L2816:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 166 ---
L2820:	fn_link  L2800
	fn_combi_t51 6, 5,0,1,2,3,4
# --- block 167 ---
L2828:	fn_link  Constraints.zipWithL
	fn_combi_t27 5, 0,0,1,4,2,3
# --- block 168 ---
L2836:	fn_link  L2828
	fn_combi_t38 5, 0,1,4,3,2,4
# --- block 169 ---
L2844:	fn_link  L2652
	fn_link  L2820
	fn_link  L2836
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 170 ---
L2860:	fn_link  L2844
	fn_combi_t7 5, 3,0,1,2,0,0
# --- block 171 ---
Constraints.zipWithL:	fn_link  L2920
	fn_link  L2880
	fn_combi_t3 3, 0,1,2,0,0,0
L2880:	fn_y
# --- block 172 ---
L2884:	fn_link  L2892
	fn_combi_t40 6, 0,1,2,4,3,5
L2892:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 173 ---
L2896:	fn_link  L2904
	fn_combi_t48 6, 3,0,1,4,2,5
L2904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 174 ---
L2908:	fn_link  L2884
	fn_link  L2896
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 175 ---
L2920:	fn_link  L2908
	fn_link  L2932
	fn_combi_t46 6, 4,0,1,2,3,5
L2932:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 176 ---
Constraints.tailL:	fn_link  L2948
	fn_link  L2952
	fn_combi_t2 3, 2,0,1,0,0,0
L2948:	fn_combi_t0 2, 1,0,0,0,0,0
L2952:	fn_elink _error0
# --- block 177 ---
Constraints.emptyTable:	fn_link  L3108
	fn_link  L2972
	fn_link  L2976
	fn_combi_t6 4, 0,1,2,3,0,0
L2972:	fn_combi_t0 2, 0,0,0,0,0,0
L2976:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 178 ---
L2980:	fn_link  Constraints.vars
	fn_link  L2996
	fn_link  Constraints.fromTo
	fn_combi_t6 4, 0,1,2,3,0,0
L2996:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 179 ---
L3004:	fn_link  L3016
	fn_link  L3020
	fn_combi_t6 5, 0,1,2,4,0,0
L3016:	fn_combi_t0 2, 1,0,0,0,0,0
L3020:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 180 ---
L3024:	fn_link  L3004
	fn_link  L3036
	fn_combi_t6 4, 3,0,1,2,0,0
L3036:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 181 ---
L3040:	fn_link  Constraints.vals
	fn_link  L3064
	fn_link  Constraints.fromTo
	fn_link  L3024
	fn_link  L3072
	fn_combi_t48 6, 0,1,2,3,4,5
L3064:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L3072:	fn_y
# --- block 182 ---
L3076:	fn_link  L3040
	fn_link  L3088
	fn_combi_t15 6, 0,1,2,3,5,0
L3088:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 183 ---
L3092:	fn_link  L3076
	fn_link  L3104
	fn_combi_t16 5, 4,0,1,2,3,0
L3104:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 184 ---
L3108:	fn_link  L2980
	fn_link  L3092
	fn_link  L3124
	fn_combi_t15 4, 0,1,3,2,3,0
L3124:	fn_y
# --- block 185 ---
Constraints.bjbt:	fn_link  Constraints.bt
	fn_link  Constraints.bj
	fn_link  L3144
	fn_combi_t15 4, 0,1,3,2,3,0
L3144:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 186 ---
Constraints.bj:	fn_link  L3260
	fn_link  Constraints.foldTree
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 187 ---
L3160:	fn_link  L3184
	fn_link  Constraints.label
	fn_link  NanoPrelude.map
	fn_link  Constraints.combine
	fn_link  L3188
	fn_combi_t54 6, 0,1,2,3,5,4
L3184:	fn_combi_t0 2, 0,0,0,0,0,0
L3188:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 188 ---
L3192:	fn_link  L3160
	fn_combi_t6 4, 3,2,0,1,0,0
# --- block 189 ---
L3200:	fn_link  L3208
	fn_combi_t6 4, 3,1,0,2,0,0
L3208:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 190 ---
L3212:	fn_link  L3200
	fn_link  L3224
	fn_combi_t12 5, 0,1,3,4,2,0
L3224:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 191 ---
L3228:	fn_link  L3244
	fn_link  L3212
	fn_link  L3248
	fn_combi_t5 4, 0,1,3,2,0,0
L3244:	fn_combi_t2 3, 2,0,1,0,0,0
L3248:	fn_combi_t44 6, 5,0,2,1,3,4
# --- block 192 ---
L3252:	fn_link  L3228
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 193 ---
L3260:	fn_link  L3192
	fn_link  L3252
	fn_combi_t53 4, 2,0,3,1,3,3
# --- block 194 ---
Constraints.combine:	fn_link  L3340
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 195 ---
L3280:	fn_link  Constraints.unionL
	fn_link  Constraints.combine
	fn_combi_t16 5, 0,3,1,4,2,0
# --- block 196 ---
L3292:	fn_link  Constraints.maxLevel
	fn_link  Constraints.notElemL
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 197 ---
L3304:	fn_link  L3292
	fn_combi_t24 5, 0,1,2,3,4,4
# --- block 198 ---
L3312:	fn_link  L3280
	fn_link  L3304
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 199 ---
L3324:	fn_link  L3336
	fn_link  L3312
	fn_combi_t32 6, 5,0,2,3,4,1
L3336:	fn_elink _error0
# --- block 200 ---
L3340:	fn_link  L3324
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 201 ---
Constraints.notElemL:	fn_link  L3360
	fn_link  NanoPrelude.all
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 202 ---
L3360:	fn_link  L3376
	fn_link  L3380
	fn_link  L3384
	fn_combi_t10 5, 3,4,0,1,2,0
L3376:	fn_combi_t0 2, 1,0,0,0,0,0
L3380:	fn_combi_t0 2, 0,0,0,0,0,0
L3384:	fn_elink _prim_ne
# --- block 203 ---
NanoPrelude.all:	fn_link  L3412
	fn_link  L3400
	fn_combi_t3 3, 0,1,2,0,0,0
L3400:	fn_y
# --- block 204 ---
L3404:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 205 ---
L3412:	fn_link  L3404
	fn_link  L3424
	fn_combi_t16 5, 4,0,1,2,3,0
L3424:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 206 ---
Constraints.unionL:	fn_link  L3488
	fn_link  L3444
	fn_link  Constraints.append
	fn_combi_t47 5, 0,3,1,2,3,4
L3444:	fn_y
# --- block 207 ---
L3448:	fn_link  Constraints.notElemL
	fn_combi_t14 5, 0,3,1,2,4,0
# --- block 208 ---
L3456:	fn_link  L3464
	fn_combi_t24 5, 0,1,4,2,3,4
L3464:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 209 ---
L3468:	fn_link  L3484
	fn_link  L3448
	fn_link  L3456
	fn_combi_t26 5, 0,1,3,4,2,4
L3484:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 210 ---
L3488:	fn_link  L3468
	fn_link  L3500
	fn_combi_t16 5, 4,0,1,2,3,0
L3500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 211 ---
Constraints.append:	fn_link  L3512
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 212 ---
L3512:	fn_link  Constraints.append
	fn_link  L3524
	fn_combi_t16 5, 0,3,1,4,2,0
L3524:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 213 ---
Constraints.bjbt$27:	fn_link  Constraints.bt
	fn_link  Constraints.bj$27
	fn_link  L3544
	fn_combi_t15 4, 0,1,3,2,3,0
L3544:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 214 ---
Constraints.bj$27:	fn_link  L3720
	fn_link  Constraints.foldTree
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 215 ---
L3560:	fn_link  L3584
	fn_link  Constraints.label
	fn_link  NanoPrelude.map
	fn_link  Constraints.combine
	fn_link  L3588
	fn_combi_t54 6, 0,1,2,3,5,4
L3584:	fn_combi_t0 2, 0,0,0,0,0,0
L3588:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 216 ---
L3592:	fn_link  L3604
	fn_link  Constraints.knownConflict
	fn_combi_t47 5, 0,4,1,2,4,3
L3604:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 217 ---
L3608:	fn_link  L3620
	fn_link  L3592
	fn_combi_t5 4, 0,1,3,2,0,0
L3620:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 218 ---
L3624:	fn_link  L3632
	fn_combi_t38 5, 0,1,4,2,3,4
L3632:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 219 ---
L3636:	fn_link  L3656
	fn_link  L3660
	fn_link  L3608
	fn_link  L3624
	fn_combi_t10 5, 0,1,4,2,3,0
L3656:	fn_combi_t2 3, 2,0,1,0,0,0
L3660:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 220 ---
L3664:	fn_link  L3560
	fn_link  L3680
	fn_link  L3636
	fn_combi_t37 5, 0,3,4,1,2,3
L3680:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 221 ---
L3684:	fn_link  L3692
	fn_combi_t6 4, 3,1,0,2,0,0
L3692:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 222 ---
L3696:	fn_link  L3684
	fn_link  L3708
	fn_combi_t12 5, 0,1,3,4,2,0
L3708:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 223 ---
L3712:	fn_link  L3696
	fn_combi_t40 5, 4,0,1,3,2,3
# --- block 224 ---
L3720:	fn_link  L3664
	fn_link  L3712
	fn_combi_t20 4, 2,0,3,1,3,0
# --- block 225 ---
Constraints.fc:	fn_link  L3764
	fn_link  Constraints.domainWipeOut
	fn_link  L3748
	fn_combi_t15 4, 0,1,3,2,3,0
L3748:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 226 ---
L3752:	fn_link  Constraints.emptyTable
	fn_link  Constraints.cacheChecks
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 227 ---
L3764:	fn_link  L3752
	fn_link  Constraints.lookupCache
	fn_link  L3780
	fn_combi_t15 4, 0,1,3,2,3,0
L3780:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 228 ---
Constraints.domainWipeOut:	fn_link  L3908
	fn_link  Constraints.mapTree
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 229 ---
L3796:	fn_link  Constraints.knownConflict
	fn_link  NanoPrelude.all
	fn_combi_t14 5, 0,1,3,2,4,0
# --- block 230 ---
L3808:	fn_link  L3816
	fn_combi_t24 5, 0,1,4,2,3,4
L3816:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 231 ---
L3820:	fn_link  L3836
	fn_link  L3796
	fn_link  L3808
	fn_combi_t10 4, 0,1,3,2,3,0
L3836:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 232 ---
L3840:	fn_link  L3820
	fn_link  L3852
	fn_combi_t6 4, 3,0,1,2,0,0
L3852:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 233 ---
L3856:	fn_link  L3840
	fn_y
# --- block 234 ---
L3864:	fn_link  Constraints.headL
	fn_link  Constraints.collect
	fn_link  L3884
	fn_link  NanoPrelude.null
	fn_combi_t50 5, 0,4,1,2,3,4
L3884:	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 235 ---
L3888:	fn_link  L3856
	fn_link  L3864
	fn_combi_t47 6, 5,3,0,1,2,4
# --- block 236 ---
L3900:	fn_link  L3888
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 237 ---
L3908:	fn_link  L3900
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 238 ---
NanoPrelude.null:	fn_link  L3932
	fn_link  L3928
	fn_combi_t2 3, 2,0,1,0,0,0
L3928:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 239 ---
L3932:	fn_link  L3940
	fn_combi_t0 3, 0,0,0,0,0,0
L3940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 240 ---
Constraints.collect:	fn_link  L3972
	fn_link  L3956
	fn_combi_t2 3, 2,0,1,0,0,0
L3956:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 241 ---
L3960:	fn_link  Constraints.collect
	fn_link  Constraints.unionL
	fn_combi_t6 4, 0,3,1,2,0,0
# --- block 242 ---
L3972:	fn_link  Constraints.collect
	fn_link  L3960
	fn_combi_t15 4, 2,0,3,1,3,0

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
