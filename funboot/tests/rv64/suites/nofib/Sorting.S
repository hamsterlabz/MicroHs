# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Sorting  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	Sorting.append
	.globl	Sorting.bench
	.globl	Sorting.cmpS
	.globl	Sorting.eqS
	.globl	Sorting.geS
	.globl	Sorting.gtS
	.globl	Sorting.hash
	.globl	Sorting.heapSort
	.globl	Sorting.inputFile
	.globl	Sorting.insertSort
	.globl	Sorting.intersperseL
	.globl	Sorting.leS
	.globl	Sorting.linesL
	.globl	Sorting.ltS
	.globl	Sorting.mangle
	.globl	Sorting.mergeSort
	.globl	Sorting.partitionL
	.globl	Sorting.quickSort
	.globl	Sorting.quickSort2
	.globl	Sorting.quickerSort
	.globl	Sorting.revL
	.globl	Sorting.takeL
	.globl	Sorting.treeSort
	.globl	Sorting.treeSort2
	.globl	Sorting.unlinesL
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Sorting.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Sorting.bench:	fn_link  L72
L32:	fn_elink Sorting.hash
# --- block 3 ---
L36:	fn_link  Sorting.inputFile
L40:	fn_elink Sorting.linesL
# --- block 4 ---
L44:	fn_link  L36
	fn_link  L56
	fn_elink Sorting.takeL
L56:	fn_box
L60:	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 5 ---
L64:	fn_link  L44
L68:	fn_elink Sorting.unlinesL
# --- block 6 ---
L72:	fn_link  L64
L76:	fn_elink Sorting.mangle
# --- block 7 ---
Sorting.hash:	fn_link  L92
L84:	fn_link  L180
	fn_elink NanoPrelude.foldl
L92:	fn_box
L96:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L100:	fn_link  L120
L104:	fn_link  L144
L108:	fn_link  L168
L112:	fn_link  L176
L116:	fn_combi_t41 6, 0,1,4,2,5,3
L120:	fn_tor a0
L124:	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L144:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L168:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L176:	fn_y
# --- block 9 ---
L180:	fn_link  L100
	fn_link  L192
	fn_combi_t7 4, 0,1,2,3,0,0
L192:	fn_y
# --- block 10 ---
NanoPrelude.foldl:	fn_link  L212
	fn_link  L208
	fn_combi_t3 3, 0,1,2,0,0,0
L208:	fn_y
# --- block 11 ---
L212:	fn_link  L220
	fn_combi_t46 5, 4,3,0,1,2,3
L220:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 12 ---
Sorting.mangle:	fn_link  L372
	fn_link  Sorting.unlinesL
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 13 ---
L236:	fn_link  L248
	fn_link  Sorting.treeSort2
	fn_combi_t2 4, 3,0,1,0,0,0
L248:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L252:	fn_link  L236
	fn_link  Sorting.treeSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
L264:	fn_link  L252
	fn_link  Sorting.quickerSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L276:	fn_link  L264
	fn_link  Sorting.quickSort2
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L288:	fn_link  L276
	fn_link  Sorting.quickSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 18 ---
L300:	fn_link  L288
	fn_link  Sorting.mergeSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L312:	fn_link  L300
	fn_link  Sorting.insertSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 20 ---
L324:	fn_link  L312
	fn_link  Sorting.heapSort
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
L336:	fn_link  L324
	fn_link  Sorting.revL
	fn_elink Sorting.intersperseL
# --- block 22 ---
L348:	fn_link  L336
	fn_link  L364
	fn_link  L368
	fn_elink NanoPrelude.foldr
L364:	fn_combi_t0 1, 0,0,0,0,0,0
L368:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 23 ---
L372:	fn_link  Sorting.linesL
	fn_link  L348
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 24 ---
Sorting.unlinesL:	fn_link  L432
	fn_link  NanoPrelude.concat
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 25 ---
L396:	fn_link  L408
	fn_link  L412
	fn_combi_t2 4, 3,0,1,0,0,0
L408:	fn_combi_t0 2, 0,0,0,0,0,0
L412:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 26 ---
L420:	fn_link  L396
	fn_link  Sorting.append
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 27 ---
L432:	fn_link  L420
	fn_elink NanoPrelude.map
# --- block 28 ---
NanoPrelude.concat:	fn_link  L452
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L452:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 29 ---
NanoPrelude.foldr:	fn_link  L472
	fn_link  L468
	fn_combi_t7 4, 0,1,2,3,0,0
L468:	fn_y
# --- block 30 ---
L472:	fn_link  L480
	fn_combi_t16 5, 4,2,0,1,3,0
L480:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 31 ---
Data.List_Type.$2b$2b:	fn_link  L512
	fn_link  L496
	fn_combi_t5 4, 0,1,3,2,0,0
L496:	fn_y
# --- block 32 ---
L500:	fn_link  L508
	fn_combi_t6 4, 0,2,1,3,0,0
L508:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 33 ---
L512:	fn_link  L500
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 34 ---
NanoPrelude.map:	fn_link  L548
	fn_link  L532
	fn_combi_t3 3, 0,1,2,0,0,0
L532:	fn_y
# --- block 35 ---
L536:	fn_link  L544
	fn_combi_t15 5, 0,1,3,2,4,0
L544:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L548:	fn_link  L536
	fn_link  L560
	fn_combi_t16 5, 4,0,1,2,3,0
L560:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
Sorting.append:	fn_link  L572
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 38 ---
L572:	fn_link  Sorting.append
	fn_link  L584
	fn_combi_t16 5, 0,3,1,4,2,0
L584:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 39 ---
Sorting.intersperseL:	fn_link  L636
	fn_link  L600
	fn_combi_t3 3, 0,1,2,0,0,0
L600:	fn_y
# --- block 40 ---
L604:	fn_link  L612
	fn_combi_t48 7, 0,3,0,1,2,4
L612:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L616:	fn_link  L624
	fn_combi_t2 4, 3,1,0,0,0,0
L624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
L628:	fn_link  L616
	fn_combi_t44 4, 3,0,2,1,2,3
# --- block 43 ---
L636:	fn_link  L604
	fn_link  L628
	fn_link  L652
	fn_combi_t49 6, 5,0,1,2,3,4
L652:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 44 ---
Sorting.revL:	fn_link  L668
	fn_link  L672
	fn_elink NanoPrelude.foldl
L668:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L672:	fn_link  L680
	fn_combi_t2 3, 0,2,1,0,0,0
L680:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 46 ---
Sorting.heapSort:	fn_link  L760
	fn_link  L776
	fn_link  L1296
	fn_link  L1492
	fn_link  L708
	fn_combi_t46 6, 0,1,2,5,4,3
L708:	fn_y
# --- block 47 ---
L712:	fn_link  L736
	fn_link  L740
	fn_link  L744
	fn_link  NanoPrelude.rem
	fn_link  L752
	fn_combi_t32 6, 0,1,5,2,3,4
L736:	fn_combi_t0 2, 0,0,0,0,0,0
L740:	fn_elink _prim_eq
L744:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L752:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 48 ---
L760:	fn_link  L772
	fn_link  L712
	fn_combi_t2 3, 0,2,1,0,0,0
L772:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 49 ---
L776:	fn_link  L788
	fn_link  NanoPrelude.quot
	fn_combi_t2 3, 0,2,1,0,0,0
L788:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 50 ---
L796:	fn_link  L808
	fn_link  L832
	fn_combi_t8 4, 2,0,3,1,0,0
L808:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L832:	fn_y
# --- block 51 ---
L836:	fn_link  L844
	fn_combi_t42 6, 0,2,4,1,3,5
L844:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 52 ---
L848:	fn_link  L860
	fn_link  L836
	fn_combi_t18 5, 0,1,2,3,4,0
L860:	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 53 ---
L864:	fn_link  L872
	fn_combi_t46 6, 0,4,1,2,3,5
L872:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 54 ---
L876:	fn_link  L884
	fn_combi_t42 6, 0,3,4,1,2,5
L884:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 55 ---
L888:	fn_link  L900
	fn_link  L904
	fn_combi_t7 4, 0,1,2,3,0,0
L900:	fn_combi_t39 5, 0,1,2,4,3,4
L904:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 56 ---
L908:	fn_link  L916
	fn_combi_t45 5, 0,1,4,2,3,4
L916:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 57 ---
L920:	fn_link  L876
	fn_link  L888
	fn_link  L908
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 58 ---
L936:	fn_link  L948
	fn_link  L920
	fn_combi_t16 5, 0,2,1,3,4,0
L948:	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 59 ---
L952:	fn_link  L960
	fn_combi_t45 5, 0,1,4,2,3,4
L960:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 60 ---
L964:	fn_link  L952
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 61 ---
L972:	fn_link  L992
	fn_link  L864
	fn_link  L936
	fn_link  L964
	fn_combi_t10 5, 0,1,4,2,3,0
L992:	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 62 ---
L996:	fn_link  Sorting.leS
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 63 ---
L1004:	fn_link  L996
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 64 ---
L1012:	fn_link  L972
	fn_link  L1004
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 65 ---
L1024:	fn_link  Sorting.leS
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 66 ---
L1036:	fn_link  L1044
	fn_combi_t40 5, 0,1,2,4,3,4
L1044:	fn_combi_t56 5, 0,1,2,4,3,4
# --- block 67 ---
L1048:	fn_link  L1036
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 68 ---
L1056:	fn_link  L1024
	fn_link  L1048
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 69 ---
L1068:	fn_link  L1012
	fn_link  L1056
	fn_link  L1084
	fn_combi_t15 4, 0,1,3,2,3,0
L1084:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 70 ---
L1088:	fn_link  L1096
	fn_combi_t40 5, 0,1,2,4,3,4
L1096:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 71 ---
L1100:	fn_link  L1088
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 72 ---
L1108:	fn_link  L1100
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 73 ---
L1116:	fn_link  L848
	fn_link  L1068
	fn_link  L1108
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 74 ---
L1132:	fn_link  L1140
	fn_combi_t26 6, 0,1,4,5,2,3
L1140:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 75 ---
L1144:	fn_link  L1132
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 76 ---
L1152:	fn_link  L1168
	fn_link  L1116
	fn_link  L1144
	fn_combi_t32 6, 0,1,3,4,5,2
L1168:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 77 ---
L1172:	fn_link  L1180
	fn_combi_t45 6, 0,1,5,2,3,4
L1180:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 78 ---
L1184:	fn_link  L1172
	fn_combi_t24 5, 0,1,4,3,2,4
# --- block 79 ---
L1192:	fn_link  L1184
	fn_combi_t26 4, 0,1,2,3,2,3
# --- block 80 ---
L1200:	fn_link  L1212
	fn_link  L1216
	fn_combi_t32 5, 4,0,3,1,1,2
L1212:	fn_combi_t0 2, 0,0,0,0,0,0
L1216:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 81 ---
L1220:	fn_link  L1200
	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 82 ---
L1228:	fn_link  L1152
	fn_link  L1192
	fn_link  L1220
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 83 ---
L1244:	fn_link  L1252
	fn_combi_t37 6, 0,1,3,4,2,5
L1252:	fn_y
# --- block 84 ---
L1256:	fn_link  L1228
	fn_link  L1244
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 85 ---
L1268:	fn_link  L1276
	fn_combi_t47 5, 4,0,1,2,3,3
L1276:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 86 ---
L1280:	fn_link  L796
	fn_link  L1256
	fn_link  L1268
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 87 ---
L1296:	fn_link  L1312
	fn_link  L1280
	fn_link  L1320
	fn_combi_t26 6, 0,1,4,5,2,3
L1312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1320:	fn_y
# --- block 88 ---
L1324:	fn_link  L1332
	fn_combi_t30 6, 0,3,1,4,5,2
L1332:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 89 ---
L1336:	fn_link  L1344
	fn_combi_t42 6, 0,3,2,1,4,5
L1344:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 90 ---
L1348:	fn_link  Sorting.leS
	fn_combi_t28 6, 0,1,2,3,5,4
# --- block 91 ---
L1356:	fn_link  L1336
	fn_link  L1348
	fn_link  L1372
	fn_combi_t44 6, 0,1,5,2,3,4
L1372:	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 92 ---
L1376:	fn_link  L1384
	fn_combi_t49 6, 1,0,2,3,4,5
L1384:	fn_elink _error0
# --- block 93 ---
L1388:	fn_link  L1376
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 94 ---
L1396:	fn_link  L1388
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 95 ---
L1404:	fn_link  L1324
	fn_link  L1356
	fn_link  L1396
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 96 ---
L1420:	fn_link  L1404
	fn_link  L1436
	fn_link  L1440
	fn_combi_t30 5, 0,1,2,3,4,4
L1436:	fn_elink _error0
L1440:	fn_combi_t6 7, 2,0,1,3,0,0
# --- block 97 ---
L1444:	fn_link  L1420
	fn_combi_t46 7, 3,2,0,1,2,3
# --- block 98 ---
L1452:	fn_link  L1444
	fn_combi_t46 4, 2,3,0,1,2,3
# --- block 99 ---
L1460:	fn_link  L1452
	fn_link  L1472
	fn_combi_t18 5, 2,0,1,3,4,0
L1472:	fn_y
# --- block 100 ---
L1476:	fn_link  L1460
	fn_link  L1488
	fn_combi_t46 6, 0,3,1,2,4,5
L1488:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 101 ---
L1492:	fn_link  L1476
	fn_link  L1504
	fn_combi_t6 4, 3,0,1,2,0,0
L1504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 102 ---
Sorting.leS:	fn_link  L1520
	fn_link  L1524
	fn_combi_t4 4, 0,2,3,1,0,0
L1520:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 103 ---
L1524:	fn_link  L1544
	fn_link  L1548
	fn_link  Sorting.cmpS
	fn_link  L1552
	fn_combi_t32 6, 0,1,4,5,2,3
L1544:	fn_combi_t0 2, 0,0,0,0,0,0
L1548:	fn_elink _prim_le
L1552:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 104 ---
Sorting.cmpS:	fn_link  L1716
	fn_link  L1736
	fn_link  L1576
	fn_combi_t40 5, 3,4,0,1,2,4
L1576:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 105 ---
L1584:	fn_link  Sorting.cmpS
	fn_link  L1596
	fn_combi_t44 6, 4,2,0,1,3,5
L1596:	fn_elink _prim_gt
# --- block 106 ---
L1600:	fn_link  L1608
	fn_combi_t44 6, 4,1,0,2,5,3
L1608:	fn_elink _prim_lt
# --- block 107 ---
L1612:	fn_link  L1632
	fn_link  L1584
	fn_link  L1600
	fn_link  L1640
	fn_combi_t29 5, 0,1,4,2,4,3
L1632:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1640:	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 108 ---
L1644:	fn_link  L1652
	fn_combi_t24 6, 0,1,5,2,3,4
L1652:	fn_combi_t43 6, 0,4,5,1,2,3
# --- block 109 ---
L1656:	fn_link  L1680
	fn_link  L1704
	fn_link  L1712
	fn_link  L1612
	fn_link  L1644
	fn_combi_t24 6, 0,1,5,2,3,4
L1680:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1704:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1712:	fn_y
# --- block 110 ---
L1716:	fn_link  L1656
	fn_link  L1728
	fn_combi_t16 5, 2,0,1,3,4,0
L1728:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 111 ---
L1736:	fn_link  L1752
	fn_link  L1776
	fn_link  L1784
	fn_combi_t3 5, 0,1,2,0,0,0
L1752:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1776:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1784:	fn_y
# --- block 112 ---
NanoPrelude.$26$26:	fn_link  L1796
	fn_combi_t1 2, 1,0,0,0,0,0
L1796:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 113 ---
NanoPrelude.quot:	fn_link  L1812
	fn_link  L1836
	fn_combi_t8 4, 0,3,2,1,0,0
L1812:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1836:	fn_y
# --- block 114 ---
NanoPrelude.rem:	fn_link  L1852
	fn_link  L1876
	fn_combi_t8 4, 0,3,2,1,0,0
L1852:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1876:	fn_y
# --- block 115 ---
Sorting.insertSort:	fn_link  L2236
	fn_link  L1892
	fn_combi_t2 3, 2,0,1,0,0,0
L1892:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 116 ---
L1896:	fn_link  L1904
	fn_combi_t2 4, 3,1,0,0,0,0
L1904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 117 ---
L1908:	fn_link  L1916
	fn_combi_t7 4, 1,0,3,2,0,0
L1916:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 118 ---
L1920:	fn_link  L1928
	fn_combi_t16 4, 0,3,0,1,2,0
L1928:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 119 ---
L1932:	fn_link  Sorting.revL
	fn_link  Sorting.append
	fn_combi_t44 6, 0,1,2,3,4,5
# --- block 120 ---
L1944:	fn_link  L1920
	fn_link  L1932
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 121 ---
L1956:	fn_link  L1964
	fn_combi_t46 6, 1,0,2,3,4,5
L1964:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
L1968:	fn_link  L1944
	fn_link  L1956
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 123 ---
L1980:	fn_link  Sorting.ltS
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 124 ---
L1988:	fn_link  L1980
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 125 ---
L1996:	fn_link  L1968
	fn_link  L1988
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 126 ---
L2008:	fn_link  L2016
	fn_combi_t24 5, 0,1,4,2,3,4
L2016:	fn_combi_t49 5, 0,4,1,2,3,4
# --- block 127 ---
L2020:	fn_link  L2008
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 128 ---
L2028:	fn_link  L2020
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 129 ---
L2036:	fn_link  L2028
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 130 ---
L2044:	fn_link  L2064
	fn_link  L1908
	fn_link  L1996
	fn_link  L2036
	fn_combi_t29 5, 0,1,4,2,4,3
L2064:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 131 ---
L2068:	fn_link  L2076
	fn_combi_t46 6, 3,0,1,2,4,5
L2076:	fn_elink _error0
# --- block 132 ---
L2080:	fn_link  L2044
	fn_link  L2068
	fn_link  L2100
	fn_link  L2104
	fn_combi_t17 5, 0,1,2,3,4,0
L2100:	fn_elink _error0
L2104:	fn_combi_t16 7, 3,0,1,2,4,0
# --- block 133 ---
L2108:	fn_link  Sorting.revL
	fn_link  Sorting.append
	fn_combi_t19 5, 4,0,1,2,3,0
# --- block 134 ---
L2120:	fn_link  L2080
	fn_link  L2108
	fn_link  L2136
	fn_combi_t44 5, 0,1,4,2,3,4
L2136:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 135 ---
L2140:	fn_link  L2148
	fn_combi_t2 4, 3,1,0,0,0,0
L2148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
L2152:	fn_link  L2140
	fn_link  Sorting.revL
	fn_link  Sorting.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 137 ---
L2168:	fn_link  L2152
	fn_link  L2180
	fn_combi_t16 5, 2,0,1,3,4,0
L2180:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 138 ---
L2184:	fn_link  L2200
	fn_link  L2168
	fn_link  L2204
	fn_combi_t12 5, 0,1,3,4,2,0
L2200:	fn_combi_t0 3, 0,0,0,0,0,0
L2204:	fn_combi_t40 5, 2,3,4,0,1,4
# --- block 139 ---
L2208:	fn_link  L2184
	fn_link  L2220
	fn_combi_t40 5, 0,1,2,4,3,4
L2220:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 140 ---
L2224:	fn_link  L2120
	fn_link  L2208
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 141 ---
L2236:	fn_link  L1896
	fn_link  L2256
	fn_link  L2224
	fn_link  L2260
	fn_combi_t14 5, 0,1,2,3,4,0
L2256:	fn_combi_t0 2, 0,0,0,0,0,0
L2260:	fn_y
# --- block 142 ---
Sorting.ltS:	fn_link  L2276
	fn_link  L2280
	fn_combi_t4 4, 0,2,3,1,0,0
L2276:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 143 ---
L2280:	fn_link  L2300
	fn_link  L2304
	fn_link  Sorting.cmpS
	fn_link  L2308
	fn_combi_t32 6, 0,1,4,5,2,3
L2300:	fn_combi_t0 2, 0,0,0,0,0,0
L2304:	fn_elink _prim_lt
L2308:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 144 ---
Sorting.mergeSort:	fn_link  L2740
	fn_link  L3048
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 145 ---
L2328:	fn_link  L2336
	fn_combi_t7 4, 1,0,3,2,0,0
L2336:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 146 ---
L2340:	fn_link  L2348
	fn_combi_t2 4, 3,1,0,0,0,0
L2348:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 147 ---
L2352:	fn_link  L2340
	fn_link  L2364
	fn_combi_t47 6, 0,3,2,1,4,5
L2364:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 148 ---
L2368:	fn_link  Sorting.leS
	fn_combi_t42 5, 0,3,2,1,3,4
# --- block 149 ---
L2376:	fn_link  L2352
	fn_link  L2368
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 150 ---
L2388:	fn_link  L2400
	fn_link  L2404
	fn_combi_t47 6, 4,0,1,2,5,3
L2400:	fn_combi_t42 4, 0,2,3,1,2,3
L2404:	fn_elink _error0
# --- block 151 ---
L2408:	fn_link  L2376
	fn_link  L2388
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 152 ---
L2420:	fn_link  L2328
	fn_link  L2408
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 153 ---
L2432:	fn_link  L2440
	fn_combi_t2 4, 3,1,0,0,0,0
L2440:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 154 ---
L2444:	fn_link  L2432
	fn_combi_t6 5, 4,1,0,2,0,0
# --- block 155 ---
L2452:	fn_link  L2460
	fn_combi_t2 4, 3,1,0,0,0,0
L2460:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 156 ---
L2464:	fn_link  L2452
	fn_link  L2476
	fn_combi_t20 5, 2,0,4,1,3,0
L2476:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 157 ---
L2480:	fn_link  Sorting.gtS
	fn_combi_t42 5, 0,3,2,1,3,4
# --- block 158 ---
L2488:	fn_link  L2464
	fn_link  L2480
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 159 ---
L2500:	fn_link  L2488
	fn_link  L2512
	fn_combi_t12 4, 0,1,2,3,2,0
L2512:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 160 ---
L2516:	fn_link  L2444
	fn_link  L2500
	fn_link  L2532
	fn_combi_t5 4, 0,1,3,2,0,0
L2532:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 161 ---
L2536:	fn_link  L2556
	fn_link  L2516
	fn_link  L2560
	fn_link  L2564
	fn_combi_t29 6, 0,1,5,2,4,3
L2556:	fn_combi_t0 3, 0,0,0,0,0,0
L2560:	fn_combi_t40 5, 4,0,3,1,2,3
L2564:	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 162 ---
L2568:	fn_link  L2536
	fn_combi_t42 5, 0,1,4,2,3,4
# --- block 163 ---
L2576:	fn_link  L2420
	fn_link  L2568
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 164 ---
L2588:	fn_link  L2596
	fn_combi_t2 4, 3,1,0,0,0,0
L2596:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 165 ---
L2600:	fn_link  L2588
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 166 ---
L2608:	fn_link  L2620
	fn_link  L2624
	fn_combi_t37 6, 0,4,1,2,3,5
L2620:	fn_elink _error0
L2624:	fn_combi_t12 7, 0,4,1,2,3,0
# --- block 167 ---
L2628:	fn_link  L2600
	fn_link  L2608
	fn_combi_t29 5, 0,1,2,3,4,4
# --- block 168 ---
L2640:	fn_link  L2576
	fn_link  L2628
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 169 ---
L2652:	fn_link  L2660
	fn_combi_t2 4, 3,1,0,0,0,0
L2660:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 170 ---
L2664:	fn_link  L2652
	fn_combi_t44 4, 3,0,1,2,3,3
# --- block 171 ---
L2672:	fn_link  L2640
	fn_link  L2664
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 172 ---
L2684:	fn_link  L2696
	fn_link  L2700
	fn_combi_t20 5, 2,3,0,1,4,0
L2696:	fn_combi_t0 3, 0,0,0,0,0,0
L2700:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 173 ---
L2704:	fn_link  L2716
	fn_link  L2684
	fn_combi_t37 5, 0,2,3,4,1,4
L2716:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 174 ---
L2720:	fn_link  L2704
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 175 ---
L2728:	fn_link  L2672
	fn_link  L2720
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 176 ---
L2740:	fn_link  L2752
	fn_link  L2728
	fn_y
L2752:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 177 ---
L2756:	fn_link  L2764
	fn_combi_t16 5, 0,3,1,2,4,0
L2764:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 178 ---
L2768:	fn_link  L2776
	fn_combi_t16 5, 0,3,1,4,2,0
L2776:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 179 ---
L2780:	fn_link  L2788
	fn_combi_t6 4, 0,2,1,3,0,0
L2788:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 180 ---
L2792:	fn_link  Sorting.ltS
	fn_combi_t28 6, 0,1,4,2,5,3
# --- block 181 ---
L2800:	fn_link  L2792
	fn_link  L2812
	fn_combi_t38 5, 0,1,4,2,3,4
L2812:	fn_combi_t29 5, 0,1,4,2,3,4
# --- block 182 ---
L2816:	fn_link  L2768
	fn_link  L2780
	fn_link  L2800
	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 183 ---
L2832:	fn_link  Sorting.eqS
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 184 ---
L2840:	fn_link  L2832
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 185 ---
L2848:	fn_link  L2816
	fn_link  L2840
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 186 ---
L2860:	fn_link  L2868
	fn_combi_t26 6, 0,1,4,5,2,3
L2868:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 187 ---
L2872:	fn_link  L2860
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 188 ---
L2880:	fn_link  L2896
	fn_link  L2848
	fn_link  L2872
	fn_combi_t12 5, 0,1,3,4,2,0
L2896:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 189 ---
L2900:	fn_link  L2908
	fn_combi_t32 6, 0,1,3,4,5,2
L2908:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 190 ---
L2912:	fn_link  L2756
	fn_link  L2880
	fn_link  L2900
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 191 ---
L2928:	fn_link  L2936
	fn_combi_t46 5, 2,0,1,2,3,4
L2936:	fn_elink _error0
# --- block 192 ---
L2940:	fn_link  L2912
	fn_link  L2928
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 193 ---
L2952:	fn_link  L2940
	fn_link  L2968
	fn_link  L2972
	fn_combi_t6 4, 0,1,2,3,0,0
L2968:	fn_elink _error0
L2972:	fn_combi_t16 7, 2,0,1,3,4,0
# --- block 194 ---
L2976:	fn_link  L2952
	fn_link  L2988
	fn_combi_t3 3, 0,1,2,0,0,0
L2988:	fn_combi_t46 6, 3,1,0,1,2,3
# --- block 195 ---
L2992:	fn_link  L2976
	fn_link  L3008
	fn_link  L3012
	fn_combi_t19 5, 0,1,2,3,4,0
L3008:	fn_combi_t46 4, 1,3,0,1,2,3
L3012:	fn_y
# --- block 196 ---
L3016:	fn_link  L2992
	fn_link  L3028
	fn_combi_t14 5, 0,1,3,2,4,0
L3028:	fn_y
# --- block 197 ---
L3032:	fn_link  L3016
	fn_link  L3044
	fn_combi_t6 4, 3,0,1,2,0,0
L3044:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 198 ---
L3048:	fn_link  L3032
	fn_y
# --- block 199 ---
Sorting.eqS:	fn_link  L3068
	fn_link  L3072
	fn_combi_t4 4, 0,2,3,1,0,0
L3068:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 200 ---
L3072:	fn_link  L3092
	fn_link  L3096
	fn_link  Sorting.cmpS
	fn_link  L3100
	fn_combi_t32 6, 0,1,4,5,2,3
L3092:	fn_combi_t0 2, 0,0,0,0,0,0
L3096:	fn_elink _prim_eq
L3100:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 201 ---
Sorting.gtS:	fn_link  L3120
	fn_link  L3124
	fn_combi_t4 4, 0,2,3,1,0,0
L3120:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 202 ---
L3124:	fn_link  L3144
	fn_link  L3148
	fn_link  Sorting.cmpS
	fn_link  L3152
	fn_combi_t32 6, 0,1,4,5,2,3
L3144:	fn_combi_t0 2, 0,0,0,0,0,0
L3148:	fn_elink _prim_gt
L3152:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 203 ---
Sorting.quickSort:	fn_link  L3348
	fn_link  L3172
	fn_combi_t2 3, 2,0,1,0,0,0
L3172:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 204 ---
L3176:	fn_link  Sorting.gtS
	fn_combi_t14 5, 0,3,1,2,4,0
# --- block 205 ---
L3184:	fn_link  L3192
	fn_combi_t24 5, 0,1,4,2,3,4
L3192:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 206 ---
L3196:	fn_link  L3212
	fn_link  L3176
	fn_link  L3184
	fn_combi_t26 5, 0,1,3,4,2,4
L3212:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 207 ---
L3216:	fn_link  L3196
	fn_link  L3228
	fn_combi_t16 5, 4,0,1,2,3,0
L3228:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 208 ---
L3232:	fn_link  L3248
	fn_link  Sorting.quickSort
	fn_link  L3252
	fn_combi_t49 6, 0,4,1,2,3,5
L3248:	fn_y
L3252:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 209 ---
L3256:	fn_link  L3216
	fn_link  L3232
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 210 ---
L3268:	fn_link  Sorting.leS
	fn_combi_t14 5, 0,3,1,2,4,0
# --- block 211 ---
L3276:	fn_link  L3284
	fn_combi_t24 5, 0,1,4,2,3,4
L3284:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 212 ---
L3288:	fn_link  L3304
	fn_link  L3268
	fn_link  L3276
	fn_combi_t26 5, 0,1,3,4,2,4
L3304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 213 ---
L3308:	fn_link  L3288
	fn_link  L3320
	fn_combi_t16 5, 4,0,1,2,3,0
L3320:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 214 ---
L3324:	fn_link  L3308
	fn_link  L3344
	fn_link  Sorting.quickSort
	fn_link  Sorting.append
	fn_combi_t61 6, 0,1,2,3,4,5
L3344:	fn_y
# --- block 215 ---
L3348:	fn_link  L3256
	fn_link  L3324
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 216 ---
Sorting.quickSort2:	fn_link  L3432
	fn_link  L3372
	fn_combi_t2 3, 2,0,1,0,0,0
L3372:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 217 ---
L3376:	fn_link  Sorting.geS
	fn_link  Sorting.partitionL
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 218 ---
L3388:	fn_link  L3404
	fn_link  Sorting.quickSort2
	fn_link  L3408
	fn_combi_t17 5, 0,3,1,4,2,0
L3404:	fn_combi_t0 2, 1,0,0,0,0,0
L3408:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 219 ---
L3412:	fn_link  L3428
	fn_link  Sorting.quickSort2
	fn_link  Sorting.append
	fn_combi_t41 5, 0,1,4,2,3,4
L3428:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 220 ---
L3432:	fn_link  L3376
	fn_link  L3388
	fn_link  L3412
	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 221 ---
Sorting.partitionL:	fn_link  L3464
	fn_link  L3544
	fn_link  NanoPrelude.foldr
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 222 ---
L3464:	fn_link  L3472
	fn_combi_t2 2, 1,0,0,0,0,0
L3472:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 223 ---
L3476:	fn_link  L3484
	fn_combi_t12 5, 4,0,1,2,3,0
L3484:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 224 ---
L3488:	fn_link  L3496
	fn_combi_t16 5, 4,2,0,1,3,0
L3496:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 225 ---
L3500:	fn_link  L3512
	fn_link  L3516
	fn_combi_t3 3, 0,1,2,0,0,0
L3512:	fn_combi_t39 5, 0,1,2,4,3,4
L3516:	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 226 ---
L3520:	fn_link  L3476
	fn_link  L3488
	fn_link  L3500
	fn_link  L3540
	fn_combi_t10 5, 0,1,4,2,3,0
L3540:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 227 ---
L3544:	fn_link  L3520
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 228 ---
Sorting.geS:	fn_link  L3564
	fn_link  L3568
	fn_combi_t4 4, 0,2,3,1,0,0
L3564:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 229 ---
L3568:	fn_link  L3588
	fn_link  L3592
	fn_link  Sorting.cmpS
	fn_link  L3596
	fn_combi_t32 6, 0,1,4,5,2,3
L3588:	fn_combi_t0 2, 0,0,0,0,0,0
L3592:	fn_elink _prim_ge
L3596:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 230 ---
Sorting.quickerSort:	fn_link  L3828
	fn_link  L3616
	fn_combi_t2 3, 2,0,1,0,0,0
L3616:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 231 ---
L3620:	fn_link  L3628
	fn_combi_t12 5, 1,0,4,2,3,0
L3628:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 232 ---
L3632:	fn_link  L3640
	fn_combi_t16 5, 1,2,0,4,3,0
L3640:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 233 ---
L3644:	fn_link  Sorting.leS
	fn_combi_t42 5, 0,3,1,2,3,4
# --- block 234 ---
L3652:	fn_link  L3632
	fn_link  L3644
	fn_combi_t46 6, 0,2,1,3,4,5
# --- block 235 ---
L3664:	fn_link  L3672
	fn_combi_t40 5, 0,1,2,4,3,4
L3672:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 236 ---
L3676:	fn_link  L3664
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 237 ---
L3684:	fn_link  L3620
	fn_link  L3652
	fn_link  L3676
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 238 ---
L3700:	fn_link  Sorting.quickerSort
	fn_link  L3712
	fn_combi_t6 4, 0,2,1,3,0,0
L3712:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 239 ---
L3716:	fn_link  Sorting.quickerSort
	fn_link  Sorting.append
	fn_combi_t33 6, 5,0,1,2,3,4
# --- block 240 ---
L3728:	fn_link  L3716
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 241 ---
L3736:	fn_link  L3700
	fn_link  L3728
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 242 ---
L3748:	fn_link  L3736
	fn_combi_t42 5, 0,1,4,2,3,4
# --- block 243 ---
L3756:	fn_link  L3684
	fn_link  L3748
	fn_link  L3772
	fn_combi_t20 4, 0,1,3,2,3,0
L3772:	fn_y
# --- block 244 ---
L3776:	fn_link  L3792
	fn_link  L3796
	fn_link  L3756
	fn_combi_t5 4, 0,1,3,2,0,0
L3792:	fn_combi_t0 2, 0,0,0,0,0,0
L3796:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 245 ---
L3800:	fn_link  L3812
	fn_link  L3776
	fn_combi_t4 6, 0,2,1,3,0,0
L3812:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 246 ---
L3816:	fn_link  L3824
	fn_combi_t2 4, 3,1,0,0,0,0
L3824:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 247 ---
L3828:	fn_link  L3800
	fn_link  L3816
	fn_combi_t44 4, 3,0,2,1,2,3
# --- block 248 ---
Sorting.treeSort:	fn_link  L3972
	fn_link  L4028
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 249 ---
L3852:	fn_link  L3860
	fn_combi_t6 4, 0,2,1,3,0,0
L3860:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 250 ---
L3864:	fn_link  L3872
	fn_combi_t14 5, 0,2,3,1,4,0
L3872:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 251 ---
L3876:	fn_link  Sorting.leS
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 252 ---
L3884:	fn_link  L3864
	fn_link  L3876
	fn_combi_t30 5, 0,2,1,3,4,4
# --- block 253 ---
L3896:	fn_link  L3904
	fn_combi_t40 5, 0,1,2,4,3,4
L3904:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 254 ---
L3908:	fn_link  L3852
	fn_link  L3884
	fn_link  L3896
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 255 ---
L3924:	fn_link  L3936
	fn_link  L3940
	fn_combi_t32 5, 4,0,2,1,1,3
L3936:	fn_combi_t0 2, 0,0,0,0,0,0
L3940:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 256 ---
L3944:	fn_link  L3908
	fn_link  L3924
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 257 ---
L3956:	fn_link  L3944
	fn_link  L3968
	fn_combi_t3 3, 0,1,2,0,0,0
L3968:	fn_y
# --- block 258 ---
L3972:	fn_link  L3984
	fn_link  L3956
	fn_elink NanoPrelude.foldr
L3984:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 259 ---
L3988:	fn_link  L3996
	fn_combi_t6 4, 0,2,1,3,0,0
L3996:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 260 ---
L4000:	fn_link  Sorting.append
	fn_combi_t44 6, 0,2,4,1,3,5
# --- block 261 ---
L4008:	fn_link  L3988
	fn_link  L4000
	fn_link  L4024
	fn_combi_t47 5, 4,0,1,2,3,3
L4024:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 262 ---
L4028:	fn_link  L4008
	fn_y
# --- block 263 ---
Sorting.treeSort2:	fn_link  L4244
	fn_link  L4324
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 264 ---
L4048:	fn_link  L4056
	fn_combi_t6 4, 0,2,1,3,0,0
L4056:	fn_combi_t4 6, 5,0,1,2,0,0
# --- block 265 ---
L4060:	fn_link  L4068
	fn_combi_t14 5, 0,2,3,1,4,0
L4068:	fn_combi_t4 6, 5,0,1,2,0,0
# --- block 266 ---
L4072:	fn_link  Sorting.leS
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 267 ---
L4080:	fn_link  L4060
	fn_link  L4072
	fn_combi_t30 5, 0,2,1,3,4,4
# --- block 268 ---
L4092:	fn_link  L4100
	fn_combi_t40 5, 0,1,2,4,3,4
L4100:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 269 ---
L4104:	fn_link  L4048
	fn_link  L4080
	fn_link  L4092
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 270 ---
L4120:	fn_link  L4136
	fn_link  L4140
	fn_link  L4144
	fn_combi_t11 5, 0,4,1,3,2,0
L4136:	fn_combi_t0 3, 0,0,0,0,0,0
L4140:	fn_combi_t1 4, 2,0,0,0,0,0
L4144:	fn_combi_t4 6, 5,0,1,2,0,0
# --- block 271 ---
L4148:	fn_link  L4164
	fn_link  L4168
	fn_link  L4172
	fn_combi_t14 5, 0,4,1,2,3,0
L4164:	fn_combi_t1 4, 2,0,0,0,0,0
L4168:	fn_combi_t0 3, 0,0,0,0,0,0
L4172:	fn_combi_t4 6, 5,0,1,2,0,0
# --- block 272 ---
L4176:	fn_link  L4148
	fn_link  Sorting.leS
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 273 ---
L4188:	fn_link  L4120
	fn_link  L4176
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 274 ---
L4200:	fn_link  L4208
	fn_combi_t38 6, 5,0,3,1,2,4
L4208:	fn_combi_t1 4, 2,0,0,0,0,0
# --- block 275 ---
L4212:	fn_link  L4104
	fn_link  L4188
	fn_link  L4200
	fn_combi_t29 4, 0,1,3,2,3,3
# --- block 276 ---
L4228:	fn_link  L4212
	fn_link  L4240
	fn_combi_t3 3, 0,1,2,0,0,0
L4240:	fn_y
# --- block 277 ---
L4244:	fn_link  L4256
	fn_link  L4228
	fn_elink NanoPrelude.foldr
L4256:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 278 ---
L4260:	fn_link  L4268
	fn_combi_t6 4, 0,2,1,3,0,0
L4268:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 279 ---
L4272:	fn_link  Sorting.append
	fn_combi_t44 6, 0,2,4,1,3,5
# --- block 280 ---
L4280:	fn_link  L4260
	fn_link  L4272
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 281 ---
L4292:	fn_link  L4300
	fn_combi_t2 4, 3,1,0,0,0,0
L4300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 282 ---
L4304:	fn_link  L4280
	fn_link  L4292
	fn_link  L4320
	fn_combi_t14 5, 4,0,1,2,3,0
L4320:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 283 ---
L4324:	fn_link  L4304
	fn_y
# --- block 284 ---
Sorting.linesL:	fn_link  L4464
	fn_link  L4344
	fn_combi_t6 3, 2,0,1,2,0,0
L4344:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 285 ---
L4348:	fn_link  Sorting.linesL
	fn_link  Sorting.revL
	fn_link  L4364
	fn_combi_t15 5, 0,1,3,2,4,0
L4364:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 286 ---
L4368:	fn_link  L4376
	fn_combi_t7 4, 1,0,3,2,0,0
L4376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 287 ---
L4380:	fn_link  L4392
	fn_link  L4396
	fn_combi_t44 5, 0,3,1,2,3,4
L4392:	fn_elink _prim_eq
L4396:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 288 ---
L4404:	fn_link  L4368
	fn_link  L4380
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 289 ---
L4416:	fn_link  L4348
	fn_link  L4404
	fn_link  L4432
	fn_combi_t38 5, 0,1,3,4,2,4
L4432:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 290 ---
L4436:	fn_link  L4448
	fn_link  Sorting.revL
	fn_combi_t5 5, 4,0,2,1,0,0
L4448:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 291 ---
L4452:	fn_link  L4416
	fn_link  L4436
	fn_combi_t44 5, 4,0,3,1,2,3
# --- block 292 ---
L4464:	fn_link  L4480
	fn_link  L4452
	fn_link  L4484
	fn_combi_t4 6, 0,1,2,3,0,0
L4480:	fn_combi_t0 2, 0,0,0,0,0,0
L4484:	fn_y
# --- block 293 ---
Sorting.takeL:	fn_link  L4504
	fn_link  L4552
	fn_link  L4568
	fn_combi_t24 5, 0,1,3,3,4,2
L4504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 294 ---
L4508:	fn_link  L4524
	fn_link  L4548
	fn_link  Sorting.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L4524:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4548:	fn_y
# --- block 295 ---
L4552:	fn_link  L4508
	fn_link  L4564
	fn_combi_t16 5, 0,3,1,2,4,0
L4564:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 296 ---
L4568:	fn_link  L4584
	fn_link  L4588
	fn_link  L4592
	fn_combi_t44 6, 0,4,1,5,2,3
L4584:	fn_combi_t0 2, 0,0,0,0,0,0
L4588:	fn_elink _prim_le
L4592:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 297 ---
Sorting.inputFile:	fn_link  L16884
	fn_link  L4612
	fn_combi_t2 4, 3,0,1,0,0,0
L4612:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 298 ---
L4620:	fn_link  L4632
	fn_link  L4636
	fn_combi_t2 4, 3,0,1,0,0,0
L4632:	fn_combi_t0 2, 0,0,0,0,0,0
L4636:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 299 ---
L4644:	fn_link  L4620
	fn_link  L4656
	fn_combi_t2 4, 3,0,1,0,0,0
L4656:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 300 ---
L4664:	fn_link  L4644
	fn_link  L4676
	fn_combi_t2 4, 3,0,1,0,0,0
L4676:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 301 ---
L4684:	fn_link  L4664
	fn_link  L4696
	fn_combi_t2 4, 3,0,1,0,0,0
L4696:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 302 ---
L4704:	fn_link  L4684
	fn_link  L4716
	fn_combi_t2 4, 3,0,1,0,0,0
L4716:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 303 ---
L4724:	fn_link  L4704
	fn_link  L4736
	fn_combi_t2 4, 3,0,1,0,0,0
L4736:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 304 ---
L4744:	fn_link  L4724
	fn_link  L4756
	fn_combi_t2 4, 3,0,1,0,0,0
L4756:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 305 ---
L4764:	fn_link  L4744
	fn_link  L4776
	fn_combi_t2 4, 3,0,1,0,0,0
L4776:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 306 ---
L4784:	fn_link  L4764
	fn_link  L4796
	fn_combi_t2 4, 3,0,1,0,0,0
L4796:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 307 ---
L4804:	fn_link  L4784
	fn_link  L4816
	fn_combi_t2 4, 3,0,1,0,0,0
L4816:	fn_box
	.word 0x00000032	# raw word 50
	fn_box_body
# --- block 308 ---
L4824:	fn_link  L4804
	fn_link  L4836
	fn_combi_t2 4, 3,0,1,0,0,0
L4836:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 309 ---
L4844:	fn_link  L4824
	fn_link  L4856
	fn_combi_t2 4, 3,0,1,0,0,0
L4856:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 310 ---
L4864:	fn_link  L4844
	fn_link  L4876
	fn_combi_t2 4, 3,0,1,0,0,0
L4876:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 311 ---
L4884:	fn_link  L4864
	fn_link  L4896
	fn_combi_t2 4, 3,0,1,0,0,0
L4896:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 312 ---
L4904:	fn_link  L4884
	fn_link  L4916
	fn_combi_t2 4, 3,0,1,0,0,0
L4916:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 313 ---
L4924:	fn_link  L4904
	fn_link  L4936
	fn_combi_t2 4, 3,0,1,0,0,0
L4936:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 314 ---
L4944:	fn_link  L4924
	fn_link  L4956
	fn_combi_t2 4, 3,0,1,0,0,0
L4956:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 315 ---
L4964:	fn_link  L4944
	fn_link  L4976
	fn_combi_t2 4, 3,0,1,0,0,0
L4976:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 316 ---
L4984:	fn_link  L4964
	fn_link  L4996
	fn_combi_t2 4, 3,0,1,0,0,0
L4996:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 317 ---
L5004:	fn_link  L4984
	fn_link  L5016
	fn_combi_t2 4, 3,0,1,0,0,0
L5016:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 318 ---
L5024:	fn_link  L5004
	fn_link  L5036
	fn_combi_t2 4, 3,0,1,0,0,0
L5036:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 319 ---
L5044:	fn_link  L5024
	fn_link  L5056
	fn_combi_t2 4, 3,0,1,0,0,0
L5056:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 320 ---
L5064:	fn_link  L5044
	fn_link  L5076
	fn_combi_t2 4, 3,0,1,0,0,0
L5076:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 321 ---
L5084:	fn_link  L5064
	fn_link  L5096
	fn_combi_t2 4, 3,0,1,0,0,0
L5096:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 322 ---
L5104:	fn_link  L5084
	fn_link  L5116
	fn_combi_t2 4, 3,0,1,0,0,0
L5116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 323 ---
L5124:	fn_link  L5104
	fn_link  L5136
	fn_combi_t2 4, 3,0,1,0,0,0
L5136:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 324 ---
L5144:	fn_link  L5124
	fn_link  L5156
	fn_combi_t2 4, 3,0,1,0,0,0
L5156:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 325 ---
L5164:	fn_link  L5144
	fn_link  L5176
	fn_combi_t2 4, 3,0,1,0,0,0
L5176:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 326 ---
L5184:	fn_link  L5164
	fn_link  L5196
	fn_combi_t2 4, 3,0,1,0,0,0
L5196:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 327 ---
L5204:	fn_link  L5184
	fn_link  L5216
	fn_combi_t2 4, 3,0,1,0,0,0
L5216:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 328 ---
L5224:	fn_link  L5204
	fn_link  L5236
	fn_combi_t2 4, 3,0,1,0,0,0
L5236:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 329 ---
L5244:	fn_link  L5224
	fn_link  L5256
	fn_combi_t2 4, 3,0,1,0,0,0
L5256:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 330 ---
L5264:	fn_link  L5244
	fn_link  L5276
	fn_combi_t2 4, 3,0,1,0,0,0
L5276:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 331 ---
L5284:	fn_link  L5264
	fn_link  L5296
	fn_combi_t2 4, 3,0,1,0,0,0
L5296:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 332 ---
L5304:	fn_link  L5284
	fn_link  L5316
	fn_combi_t2 4, 3,0,1,0,0,0
L5316:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 333 ---
L5324:	fn_link  L5304
	fn_link  L5336
	fn_combi_t2 4, 3,0,1,0,0,0
L5336:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 334 ---
L5344:	fn_link  L5324
	fn_link  L5356
	fn_combi_t2 4, 3,0,1,0,0,0
L5356:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 335 ---
L5364:	fn_link  L5344
	fn_link  L5376
	fn_combi_t2 4, 3,0,1,0,0,0
L5376:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 336 ---
L5384:	fn_link  L5364
	fn_link  L5396
	fn_combi_t2 4, 3,0,1,0,0,0
L5396:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 337 ---
L5404:	fn_link  L5384
	fn_link  L5416
	fn_combi_t2 4, 3,0,1,0,0,0
L5416:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 338 ---
L5424:	fn_link  L5404
	fn_link  L5436
	fn_combi_t2 4, 3,0,1,0,0,0
L5436:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 339 ---
L5444:	fn_link  L5424
	fn_link  L5456
	fn_combi_t2 4, 3,0,1,0,0,0
L5456:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 340 ---
L5464:	fn_link  L5444
	fn_link  L5476
	fn_combi_t2 4, 3,0,1,0,0,0
L5476:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 341 ---
L5484:	fn_link  L5464
	fn_link  L5496
	fn_combi_t2 4, 3,0,1,0,0,0
L5496:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 342 ---
L5504:	fn_link  L5484
	fn_link  L5516
	fn_combi_t2 4, 3,0,1,0,0,0
L5516:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 343 ---
L5524:	fn_link  L5504
	fn_link  L5536
	fn_combi_t2 4, 3,0,1,0,0,0
L5536:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 344 ---
L5544:	fn_link  L5524
	fn_link  L5556
	fn_combi_t2 4, 3,0,1,0,0,0
L5556:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 345 ---
L5564:	fn_link  L5544
	fn_link  L5576
	fn_combi_t2 4, 3,0,1,0,0,0
L5576:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 346 ---
L5584:	fn_link  L5564
	fn_link  L5596
	fn_combi_t2 4, 3,0,1,0,0,0
L5596:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 347 ---
L5604:	fn_link  L5584
	fn_link  L5616
	fn_combi_t2 4, 3,0,1,0,0,0
L5616:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 348 ---
L5624:	fn_link  L5604
	fn_link  L5636
	fn_combi_t2 4, 3,0,1,0,0,0
L5636:	fn_box
	.word 0x0000006b	# raw word 107
	fn_box_body
# --- block 349 ---
L5644:	fn_link  L5624
	fn_link  L5656
	fn_combi_t2 4, 3,0,1,0,0,0
L5656:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 350 ---
L5664:	fn_link  L5644
	fn_link  L5676
	fn_combi_t2 4, 3,0,1,0,0,0
L5676:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 351 ---
L5684:	fn_link  L5664
	fn_link  L5696
	fn_combi_t2 4, 3,0,1,0,0,0
L5696:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 352 ---
L5704:	fn_link  L5684
	fn_link  L5716
	fn_combi_t2 4, 3,0,1,0,0,0
L5716:	fn_box
	.word 0x00000071	# raw word 113
	fn_box_body
# --- block 353 ---
L5724:	fn_link  L5704
	fn_link  L5736
	fn_combi_t2 4, 3,0,1,0,0,0
L5736:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 354 ---
L5744:	fn_link  L5724
	fn_link  L5756
	fn_combi_t2 4, 3,0,1,0,0,0
L5756:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 355 ---
L5764:	fn_link  L5744
	fn_link  L5776
	fn_combi_t2 4, 3,0,1,0,0,0
L5776:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 356 ---
L5784:	fn_link  L5764
	fn_link  L5796
	fn_combi_t2 4, 3,0,1,0,0,0
L5796:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 357 ---
L5804:	fn_link  L5784
	fn_link  L5816
	fn_combi_t2 4, 3,0,1,0,0,0
L5816:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 358 ---
L5824:	fn_link  L5804
	fn_link  L5836
	fn_combi_t2 4, 3,0,1,0,0,0
L5836:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 359 ---
L5844:	fn_link  L5824
	fn_link  L5856
	fn_combi_t2 4, 3,0,1,0,0,0
L5856:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 360 ---
L5864:	fn_link  L5844
	fn_link  L5876
	fn_combi_t2 4, 3,0,1,0,0,0
L5876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 361 ---
L5884:	fn_link  L5864
	fn_link  L5896
	fn_combi_t2 4, 3,0,1,0,0,0
L5896:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 362 ---
L5904:	fn_link  L5884
	fn_link  L5916
	fn_combi_t2 4, 3,0,1,0,0,0
L5916:	fn_box
	.word 0x00000032	# raw word 50
	fn_box_body
# --- block 363 ---
L5924:	fn_link  L5904
	fn_link  L5936
	fn_combi_t2 4, 3,0,1,0,0,0
L5936:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 364 ---
L5944:	fn_link  L5924
	fn_link  L5956
	fn_combi_t2 4, 3,0,1,0,0,0
L5956:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 365 ---
L5964:	fn_link  L5944
	fn_link  L5976
	fn_combi_t2 4, 3,0,1,0,0,0
L5976:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 366 ---
L5984:	fn_link  L5964
	fn_link  L5996
	fn_combi_t2 4, 3,0,1,0,0,0
L5996:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 367 ---
L6004:	fn_link  L5984
	fn_link  L6016
	fn_combi_t2 4, 3,0,1,0,0,0
L6016:	fn_box
	.word 0x0000006b	# raw word 107
	fn_box_body
# --- block 368 ---
L6024:	fn_link  L6004
	fn_link  L6036
	fn_combi_t2 4, 3,0,1,0,0,0
L6036:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 369 ---
L6044:	fn_link  L6024
	fn_link  L6056
	fn_combi_t2 4, 3,0,1,0,0,0
L6056:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 370 ---
L6064:	fn_link  L6044
	fn_link  L6076
	fn_combi_t2 4, 3,0,1,0,0,0
L6076:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 371 ---
L6084:	fn_link  L6064
	fn_link  L6096
	fn_combi_t2 4, 3,0,1,0,0,0
L6096:	fn_box
	.word 0x00000071	# raw word 113
	fn_box_body
# --- block 372 ---
L6104:	fn_link  L6084
	fn_link  L6116
	fn_combi_t2 4, 3,0,1,0,0,0
L6116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 373 ---
L6124:	fn_link  L6104
	fn_link  L6136
	fn_combi_t2 4, 3,0,1,0,0,0
L6136:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 374 ---
L6144:	fn_link  L6124
	fn_link  L6156
	fn_combi_t2 4, 3,0,1,0,0,0
L6156:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 375 ---
L6164:	fn_link  L6144
	fn_link  L6176
	fn_combi_t2 4, 3,0,1,0,0,0
L6176:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 376 ---
L6184:	fn_link  L6164
	fn_link  L6196
	fn_combi_t2 4, 3,0,1,0,0,0
L6196:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 377 ---
L6204:	fn_link  L6184
	fn_link  L6216
	fn_combi_t2 4, 3,0,1,0,0,0
L6216:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 378 ---
L6224:	fn_link  L6204
	fn_link  L6236
	fn_combi_t2 4, 3,0,1,0,0,0
L6236:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 379 ---
L6244:	fn_link  L6224
	fn_link  L6256
	fn_combi_t2 4, 3,0,1,0,0,0
L6256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 380 ---
L6264:	fn_link  L6244
	fn_link  L6276
	fn_combi_t2 4, 3,0,1,0,0,0
L6276:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 381 ---
L6284:	fn_link  L6264
	fn_link  L6296
	fn_combi_t2 4, 3,0,1,0,0,0
L6296:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 382 ---
L6304:	fn_link  L6284
	fn_link  L6316
	fn_combi_t2 4, 3,0,1,0,0,0
L6316:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 383 ---
L6324:	fn_link  L6304
	fn_link  L6336
	fn_combi_t2 4, 3,0,1,0,0,0
L6336:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 384 ---
L6344:	fn_link  L6324
	fn_link  L6356
	fn_combi_t2 4, 3,0,1,0,0,0
L6356:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 385 ---
L6364:	fn_link  L6344
	fn_link  L6376
	fn_combi_t2 4, 3,0,1,0,0,0
L6376:	fn_box
	.word 0x0000006b	# raw word 107
	fn_box_body
# --- block 386 ---
L6384:	fn_link  L6364
	fn_link  L6396
	fn_combi_t2 4, 3,0,1,0,0,0
L6396:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 387 ---
L6404:	fn_link  L6384
	fn_link  L6416
	fn_combi_t2 4, 3,0,1,0,0,0
L6416:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 388 ---
L6424:	fn_link  L6404
	fn_link  L6436
	fn_combi_t2 4, 3,0,1,0,0,0
L6436:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 389 ---
L6444:	fn_link  L6424
	fn_link  L6456
	fn_combi_t2 4, 3,0,1,0,0,0
L6456:	fn_box
	.word 0x00000071	# raw word 113
	fn_box_body
# --- block 390 ---
L6464:	fn_link  L6444
	fn_link  L6476
	fn_combi_t2 4, 3,0,1,0,0,0
L6476:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 391 ---
L6484:	fn_link  L6464
	fn_link  L6496
	fn_combi_t2 4, 3,0,1,0,0,0
L6496:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 392 ---
L6504:	fn_link  L6484
	fn_link  L6516
	fn_combi_t2 4, 3,0,1,0,0,0
L6516:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 393 ---
L6524:	fn_link  L6504
	fn_link  L6536
	fn_combi_t2 4, 3,0,1,0,0,0
L6536:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 394 ---
L6544:	fn_link  L6524
	fn_link  L6556
	fn_combi_t2 4, 3,0,1,0,0,0
L6556:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 395 ---
L6564:	fn_link  L6544
	fn_link  L6576
	fn_combi_t2 4, 3,0,1,0,0,0
L6576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 396 ---
L6584:	fn_link  L6564
	fn_link  L6596
	fn_combi_t2 4, 3,0,1,0,0,0
L6596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 397 ---
L6604:	fn_link  L6584
	fn_link  L6616
	fn_combi_t2 4, 3,0,1,0,0,0
L6616:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 398 ---
L6624:	fn_link  L6604
	fn_link  L6636
	fn_combi_t2 4, 3,0,1,0,0,0
L6636:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 399 ---
L6644:	fn_link  L6624
	fn_link  L6656
	fn_combi_t2 4, 3,0,1,0,0,0
L6656:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 400 ---
L6664:	fn_link  L6644
	fn_link  L6676
	fn_combi_t2 4, 3,0,1,0,0,0
L6676:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 401 ---
L6684:	fn_link  L6664
	fn_link  L6696
	fn_combi_t2 4, 3,0,1,0,0,0
L6696:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 402 ---
L6704:	fn_link  L6684
	fn_link  L6716
	fn_combi_t2 4, 3,0,1,0,0,0
L6716:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 403 ---
L6724:	fn_link  L6704
	fn_link  L6736
	fn_combi_t2 4, 3,0,1,0,0,0
L6736:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 404 ---
L6744:	fn_link  L6724
	fn_link  L6756
	fn_combi_t2 4, 3,0,1,0,0,0
L6756:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 405 ---
L6764:	fn_link  L6744
	fn_link  L6776
	fn_combi_t2 4, 3,0,1,0,0,0
L6776:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 406 ---
L6784:	fn_link  L6764
	fn_link  L6796
	fn_combi_t2 4, 3,0,1,0,0,0
L6796:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 407 ---
L6804:	fn_link  L6784
	fn_link  L6816
	fn_combi_t2 4, 3,0,1,0,0,0
L6816:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 408 ---
L6824:	fn_link  L6804
	fn_link  L6836
	fn_combi_t2 4, 3,0,1,0,0,0
L6836:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 409 ---
L6844:	fn_link  L6824
	fn_link  L6856
	fn_combi_t2 4, 3,0,1,0,0,0
L6856:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 410 ---
L6864:	fn_link  L6844
	fn_link  L6876
	fn_combi_t2 4, 3,0,1,0,0,0
L6876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 411 ---
L6884:	fn_link  L6864
	fn_link  L6896
	fn_combi_t2 4, 3,0,1,0,0,0
L6896:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 412 ---
L6904:	fn_link  L6884
	fn_link  L6916
	fn_combi_t2 4, 3,0,1,0,0,0
L6916:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 413 ---
L6924:	fn_link  L6904
	fn_link  L6936
	fn_combi_t2 4, 3,0,1,0,0,0
L6936:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 414 ---
L6944:	fn_link  L6924
	fn_link  L6956
	fn_combi_t2 4, 3,0,1,0,0,0
L6956:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 415 ---
L6964:	fn_link  L6944
	fn_link  L6976
	fn_combi_t2 4, 3,0,1,0,0,0
L6976:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 416 ---
L6984:	fn_link  L6964
	fn_link  L6996
	fn_combi_t2 4, 3,0,1,0,0,0
L6996:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 417 ---
L7004:	fn_link  L6984
	fn_link  L7016
	fn_combi_t2 4, 3,0,1,0,0,0
L7016:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 418 ---
L7024:	fn_link  L7004
	fn_link  L7036
	fn_combi_t2 4, 3,0,1,0,0,0
L7036:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 419 ---
L7044:	fn_link  L7024
	fn_link  L7056
	fn_combi_t2 4, 3,0,1,0,0,0
L7056:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 420 ---
L7064:	fn_link  L7044
	fn_link  L7076
	fn_combi_t2 4, 3,0,1,0,0,0
L7076:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 421 ---
L7084:	fn_link  L7064
	fn_link  L7096
	fn_combi_t2 4, 3,0,1,0,0,0
L7096:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 422 ---
L7104:	fn_link  L7084
	fn_link  L7116
	fn_combi_t2 4, 3,0,1,0,0,0
L7116:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 423 ---
L7124:	fn_link  L7104
	fn_link  L7136
	fn_combi_t2 4, 3,0,1,0,0,0
L7136:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 424 ---
L7144:	fn_link  L7124
	fn_link  L7156
	fn_combi_t2 4, 3,0,1,0,0,0
L7156:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 425 ---
L7164:	fn_link  L7144
	fn_link  L7176
	fn_combi_t2 4, 3,0,1,0,0,0
L7176:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 426 ---
L7184:	fn_link  L7164
	fn_link  L7196
	fn_combi_t2 4, 3,0,1,0,0,0
L7196:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 427 ---
L7204:	fn_link  L7184
	fn_link  L7216
	fn_combi_t2 4, 3,0,1,0,0,0
L7216:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 428 ---
L7224:	fn_link  L7204
	fn_link  L7236
	fn_combi_t2 4, 3,0,1,0,0,0
L7236:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 429 ---
L7244:	fn_link  L7224
	fn_link  L7256
	fn_combi_t2 4, 3,0,1,0,0,0
L7256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 430 ---
L7264:	fn_link  L7244
	fn_link  L7276
	fn_combi_t2 4, 3,0,1,0,0,0
L7276:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 431 ---
L7284:	fn_link  L7264
	fn_link  L7296
	fn_combi_t2 4, 3,0,1,0,0,0
L7296:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 432 ---
L7304:	fn_link  L7284
	fn_link  L7316
	fn_combi_t2 4, 3,0,1,0,0,0
L7316:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 433 ---
L7324:	fn_link  L7304
	fn_link  L7336
	fn_combi_t2 4, 3,0,1,0,0,0
L7336:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 434 ---
L7344:	fn_link  L7324
	fn_link  L7356
	fn_combi_t2 4, 3,0,1,0,0,0
L7356:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 435 ---
L7364:	fn_link  L7344
	fn_link  L7376
	fn_combi_t2 4, 3,0,1,0,0,0
L7376:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 436 ---
L7384:	fn_link  L7364
	fn_link  L7396
	fn_combi_t2 4, 3,0,1,0,0,0
L7396:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 437 ---
L7404:	fn_link  L7384
	fn_link  L7416
	fn_combi_t2 4, 3,0,1,0,0,0
L7416:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 438 ---
L7424:	fn_link  L7404
	fn_link  L7436
	fn_combi_t2 4, 3,0,1,0,0,0
L7436:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 439 ---
L7444:	fn_link  L7424
	fn_link  L7456
	fn_combi_t2 4, 3,0,1,0,0,0
L7456:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 440 ---
L7464:	fn_link  L7444
	fn_link  L7476
	fn_combi_t2 4, 3,0,1,0,0,0
L7476:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 441 ---
L7484:	fn_link  L7464
	fn_link  L7496
	fn_combi_t2 4, 3,0,1,0,0,0
L7496:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 442 ---
L7504:	fn_link  L7484
	fn_link  L7516
	fn_combi_t2 4, 3,0,1,0,0,0
L7516:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 443 ---
L7524:	fn_link  L7504
	fn_link  L7536
	fn_combi_t2 4, 3,0,1,0,0,0
L7536:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 444 ---
L7544:	fn_link  L7524
	fn_link  L7556
	fn_combi_t2 4, 3,0,1,0,0,0
L7556:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 445 ---
L7564:	fn_link  L7544
	fn_link  L7576
	fn_combi_t2 4, 3,0,1,0,0,0
L7576:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 446 ---
L7584:	fn_link  L7564
	fn_link  L7596
	fn_combi_t2 4, 3,0,1,0,0,0
L7596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 447 ---
L7604:	fn_link  L7584
	fn_link  L7616
	fn_combi_t2 4, 3,0,1,0,0,0
L7616:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 448 ---
L7624:	fn_link  L7604
	fn_link  L7636
	fn_combi_t2 4, 3,0,1,0,0,0
L7636:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 449 ---
L7644:	fn_link  L7624
	fn_link  L7656
	fn_combi_t2 4, 3,0,1,0,0,0
L7656:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 450 ---
L7664:	fn_link  L7644
	fn_link  L7676
	fn_combi_t2 4, 3,0,1,0,0,0
L7676:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 451 ---
L7684:	fn_link  L7664
	fn_link  L7696
	fn_combi_t2 4, 3,0,1,0,0,0
L7696:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 452 ---
L7704:	fn_link  L7684
	fn_link  L7716
	fn_combi_t2 4, 3,0,1,0,0,0
L7716:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 453 ---
L7724:	fn_link  L7704
	fn_link  L7736
	fn_combi_t2 4, 3,0,1,0,0,0
L7736:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 454 ---
L7744:	fn_link  L7724
	fn_link  L7756
	fn_combi_t2 4, 3,0,1,0,0,0
L7756:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 455 ---
L7764:	fn_link  L7744
	fn_link  L7776
	fn_combi_t2 4, 3,0,1,0,0,0
L7776:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 456 ---
L7784:	fn_link  L7764
	fn_link  L7796
	fn_combi_t2 4, 3,0,1,0,0,0
L7796:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 457 ---
L7804:	fn_link  L7784
	fn_link  L7816
	fn_combi_t2 4, 3,0,1,0,0,0
L7816:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 458 ---
L7824:	fn_link  L7804
	fn_link  L7836
	fn_combi_t2 4, 3,0,1,0,0,0
L7836:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 459 ---
L7844:	fn_link  L7824
	fn_link  L7856
	fn_combi_t2 4, 3,0,1,0,0,0
L7856:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 460 ---
L7864:	fn_link  L7844
	fn_link  L7876
	fn_combi_t2 4, 3,0,1,0,0,0
L7876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 461 ---
L7884:	fn_link  L7864
	fn_link  L7896
	fn_combi_t2 4, 3,0,1,0,0,0
L7896:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 462 ---
L7904:	fn_link  L7884
	fn_link  L7916
	fn_combi_t2 4, 3,0,1,0,0,0
L7916:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 463 ---
L7924:	fn_link  L7904
	fn_link  L7936
	fn_combi_t2 4, 3,0,1,0,0,0
L7936:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 464 ---
L7944:	fn_link  L7924
	fn_link  L7956
	fn_combi_t2 4, 3,0,1,0,0,0
L7956:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 465 ---
L7964:	fn_link  L7944
	fn_link  L7976
	fn_combi_t2 4, 3,0,1,0,0,0
L7976:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 466 ---
L7984:	fn_link  L7964
	fn_link  L7996
	fn_combi_t2 4, 3,0,1,0,0,0
L7996:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 467 ---
L8004:	fn_link  L7984
	fn_link  L8016
	fn_combi_t2 4, 3,0,1,0,0,0
L8016:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 468 ---
L8024:	fn_link  L8004
	fn_link  L8036
	fn_combi_t2 4, 3,0,1,0,0,0
L8036:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 469 ---
L8044:	fn_link  L8024
	fn_link  L8056
	fn_combi_t2 4, 3,0,1,0,0,0
L8056:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 470 ---
L8064:	fn_link  L8044
	fn_link  L8076
	fn_combi_t2 4, 3,0,1,0,0,0
L8076:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 471 ---
L8084:	fn_link  L8064
	fn_link  L8096
	fn_combi_t2 4, 3,0,1,0,0,0
L8096:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 472 ---
L8104:	fn_link  L8084
	fn_link  L8116
	fn_combi_t2 4, 3,0,1,0,0,0
L8116:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 473 ---
L8124:	fn_link  L8104
	fn_link  L8136
	fn_combi_t2 4, 3,0,1,0,0,0
L8136:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 474 ---
L8144:	fn_link  L8124
	fn_link  L8156
	fn_combi_t2 4, 3,0,1,0,0,0
L8156:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 475 ---
L8164:	fn_link  L8144
	fn_link  L8176
	fn_combi_t2 4, 3,0,1,0,0,0
L8176:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 476 ---
L8184:	fn_link  L8164
	fn_link  L8196
	fn_combi_t2 4, 3,0,1,0,0,0
L8196:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 477 ---
L8204:	fn_link  L8184
	fn_link  L8216
	fn_combi_t2 4, 3,0,1,0,0,0
L8216:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 478 ---
L8224:	fn_link  L8204
	fn_link  L8236
	fn_combi_t2 4, 3,0,1,0,0,0
L8236:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 479 ---
L8244:	fn_link  L8224
	fn_link  L8256
	fn_combi_t2 4, 3,0,1,0,0,0
L8256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 480 ---
L8264:	fn_link  L8244
	fn_link  L8276
	fn_combi_t2 4, 3,0,1,0,0,0
L8276:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 481 ---
L8284:	fn_link  L8264
	fn_link  L8296
	fn_combi_t2 4, 3,0,1,0,0,0
L8296:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 482 ---
L8304:	fn_link  L8284
	fn_link  L8316
	fn_combi_t2 4, 3,0,1,0,0,0
L8316:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 483 ---
L8324:	fn_link  L8304
	fn_link  L8336
	fn_combi_t2 4, 3,0,1,0,0,0
L8336:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 484 ---
L8344:	fn_link  L8324
	fn_link  L8356
	fn_combi_t2 4, 3,0,1,0,0,0
L8356:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 485 ---
L8364:	fn_link  L8344
	fn_link  L8376
	fn_combi_t2 4, 3,0,1,0,0,0
L8376:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 486 ---
L8384:	fn_link  L8364
	fn_link  L8396
	fn_combi_t2 4, 3,0,1,0,0,0
L8396:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 487 ---
L8404:	fn_link  L8384
	fn_link  L8416
	fn_combi_t2 4, 3,0,1,0,0,0
L8416:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 488 ---
L8424:	fn_link  L8404
	fn_link  L8436
	fn_combi_t2 4, 3,0,1,0,0,0
L8436:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 489 ---
L8444:	fn_link  L8424
	fn_link  L8456
	fn_combi_t2 4, 3,0,1,0,0,0
L8456:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 490 ---
L8464:	fn_link  L8444
	fn_link  L8476
	fn_combi_t2 4, 3,0,1,0,0,0
L8476:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 491 ---
L8484:	fn_link  L8464
	fn_link  L8496
	fn_combi_t2 4, 3,0,1,0,0,0
L8496:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 492 ---
L8504:	fn_link  L8484
	fn_link  L8516
	fn_combi_t2 4, 3,0,1,0,0,0
L8516:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 493 ---
L8524:	fn_link  L8504
	fn_link  L8536
	fn_combi_t2 4, 3,0,1,0,0,0
L8536:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 494 ---
L8544:	fn_link  L8524
	fn_link  L8556
	fn_combi_t2 4, 3,0,1,0,0,0
L8556:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 495 ---
L8564:	fn_link  L8544
	fn_link  L8576
	fn_combi_t2 4, 3,0,1,0,0,0
L8576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 496 ---
L8584:	fn_link  L8564
	fn_link  L8596
	fn_combi_t2 4, 3,0,1,0,0,0
L8596:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 497 ---
L8604:	fn_link  L8584
	fn_link  L8616
	fn_combi_t2 4, 3,0,1,0,0,0
L8616:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 498 ---
L8624:	fn_link  L8604
	fn_link  L8636
	fn_combi_t2 4, 3,0,1,0,0,0
L8636:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 499 ---
L8644:	fn_link  L8624
	fn_link  L8656
	fn_combi_t2 4, 3,0,1,0,0,0
L8656:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 500 ---
L8664:	fn_link  L8644
	fn_link  L8676
	fn_combi_t2 4, 3,0,1,0,0,0
L8676:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 501 ---
L8684:	fn_link  L8664
	fn_link  L8696
	fn_combi_t2 4, 3,0,1,0,0,0
L8696:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 502 ---
L8704:	fn_link  L8684
	fn_link  L8716
	fn_combi_t2 4, 3,0,1,0,0,0
L8716:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 503 ---
L8724:	fn_link  L8704
	fn_link  L8736
	fn_combi_t2 4, 3,0,1,0,0,0
L8736:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 504 ---
L8744:	fn_link  L8724
	fn_link  L8756
	fn_combi_t2 4, 3,0,1,0,0,0
L8756:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 505 ---
L8764:	fn_link  L8744
	fn_link  L8776
	fn_combi_t2 4, 3,0,1,0,0,0
L8776:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 506 ---
L8784:	fn_link  L8764
	fn_link  L8796
	fn_combi_t2 4, 3,0,1,0,0,0
L8796:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 507 ---
L8804:	fn_link  L8784
	fn_link  L8816
	fn_combi_t2 4, 3,0,1,0,0,0
L8816:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 508 ---
L8824:	fn_link  L8804
	fn_link  L8836
	fn_combi_t2 4, 3,0,1,0,0,0
L8836:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 509 ---
L8844:	fn_link  L8824
	fn_link  L8856
	fn_combi_t2 4, 3,0,1,0,0,0
L8856:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 510 ---
L8864:	fn_link  L8844
	fn_link  L8876
	fn_combi_t2 4, 3,0,1,0,0,0
L8876:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 511 ---
L8884:	fn_link  L8864
	fn_link  L8896
	fn_combi_t2 4, 3,0,1,0,0,0
L8896:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 512 ---
L8904:	fn_link  L8884
	fn_link  L8916
	fn_combi_t2 4, 3,0,1,0,0,0
L8916:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 513 ---
L8924:	fn_link  L8904
	fn_link  L8936
	fn_combi_t2 4, 3,0,1,0,0,0
L8936:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 514 ---
L8944:	fn_link  L8924
	fn_link  L8956
	fn_combi_t2 4, 3,0,1,0,0,0
L8956:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 515 ---
L8964:	fn_link  L8944
	fn_link  L8976
	fn_combi_t2 4, 3,0,1,0,0,0
L8976:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 516 ---
L8984:	fn_link  L8964
	fn_link  L8996
	fn_combi_t2 4, 3,0,1,0,0,0
L8996:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 517 ---
L9004:	fn_link  L8984
	fn_link  L9016
	fn_combi_t2 4, 3,0,1,0,0,0
L9016:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 518 ---
L9024:	fn_link  L9004
	fn_link  L9036
	fn_combi_t2 4, 3,0,1,0,0,0
L9036:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 519 ---
L9044:	fn_link  L9024
	fn_link  L9056
	fn_combi_t2 4, 3,0,1,0,0,0
L9056:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 520 ---
L9064:	fn_link  L9044
	fn_link  L9076
	fn_combi_t2 4, 3,0,1,0,0,0
L9076:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 521 ---
L9084:	fn_link  L9064
	fn_link  L9096
	fn_combi_t2 4, 3,0,1,0,0,0
L9096:	fn_box
	.word 0x00000077	# raw word 119
	fn_box_body
# --- block 522 ---
L9104:	fn_link  L9084
	fn_link  L9116
	fn_combi_t2 4, 3,0,1,0,0,0
L9116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 523 ---
L9124:	fn_link  L9104
	fn_link  L9136
	fn_combi_t2 4, 3,0,1,0,0,0
L9136:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 524 ---
L9144:	fn_link  L9124
	fn_link  L9156
	fn_combi_t2 4, 3,0,1,0,0,0
L9156:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 525 ---
L9164:	fn_link  L9144
	fn_link  L9176
	fn_combi_t2 4, 3,0,1,0,0,0
L9176:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 526 ---
L9184:	fn_link  L9164
	fn_link  L9196
	fn_combi_t2 4, 3,0,1,0,0,0
L9196:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 527 ---
L9204:	fn_link  L9184
	fn_link  L9216
	fn_combi_t2 4, 3,0,1,0,0,0
L9216:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 528 ---
L9224:	fn_link  L9204
	fn_link  L9236
	fn_combi_t2 4, 3,0,1,0,0,0
L9236:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 529 ---
L9244:	fn_link  L9224
	fn_link  L9256
	fn_combi_t2 4, 3,0,1,0,0,0
L9256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 530 ---
L9264:	fn_link  L9244
	fn_link  L9276
	fn_combi_t2 4, 3,0,1,0,0,0
L9276:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 531 ---
L9284:	fn_link  L9264
	fn_link  L9296
	fn_combi_t2 4, 3,0,1,0,0,0
L9296:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 532 ---
L9304:	fn_link  L9284
	fn_link  L9316
	fn_combi_t2 4, 3,0,1,0,0,0
L9316:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 533 ---
L9324:	fn_link  L9304
	fn_link  L9336
	fn_combi_t2 4, 3,0,1,0,0,0
L9336:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 534 ---
L9344:	fn_link  L9324
	fn_link  L9356
	fn_combi_t2 4, 3,0,1,0,0,0
L9356:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 535 ---
L9364:	fn_link  L9344
	fn_link  L9376
	fn_combi_t2 4, 3,0,1,0,0,0
L9376:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 536 ---
L9384:	fn_link  L9364
	fn_link  L9396
	fn_combi_t2 4, 3,0,1,0,0,0
L9396:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 537 ---
L9404:	fn_link  L9384
	fn_link  L9416
	fn_combi_t2 4, 3,0,1,0,0,0
L9416:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 538 ---
L9424:	fn_link  L9404
	fn_link  L9436
	fn_combi_t2 4, 3,0,1,0,0,0
L9436:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 539 ---
L9444:	fn_link  L9424
	fn_link  L9456
	fn_combi_t2 4, 3,0,1,0,0,0
L9456:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 540 ---
L9464:	fn_link  L9444
	fn_link  L9476
	fn_combi_t2 4, 3,0,1,0,0,0
L9476:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 541 ---
L9484:	fn_link  L9464
	fn_link  L9496
	fn_combi_t2 4, 3,0,1,0,0,0
L9496:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 542 ---
L9504:	fn_link  L9484
	fn_link  L9516
	fn_combi_t2 4, 3,0,1,0,0,0
L9516:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 543 ---
L9524:	fn_link  L9504
	fn_link  L9536
	fn_combi_t2 4, 3,0,1,0,0,0
L9536:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 544 ---
L9544:	fn_link  L9524
	fn_link  L9556
	fn_combi_t2 4, 3,0,1,0,0,0
L9556:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 545 ---
L9564:	fn_link  L9544
	fn_link  L9576
	fn_combi_t2 4, 3,0,1,0,0,0
L9576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 546 ---
L9584:	fn_link  L9564
	fn_link  L9596
	fn_combi_t2 4, 3,0,1,0,0,0
L9596:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 547 ---
L9604:	fn_link  L9584
	fn_link  L9616
	fn_combi_t2 4, 3,0,1,0,0,0
L9616:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 548 ---
L9624:	fn_link  L9604
	fn_link  L9636
	fn_combi_t2 4, 3,0,1,0,0,0
L9636:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 549 ---
L9644:	fn_link  L9624
	fn_link  L9656
	fn_combi_t2 4, 3,0,1,0,0,0
L9656:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 550 ---
L9664:	fn_link  L9644
	fn_link  L9676
	fn_combi_t2 4, 3,0,1,0,0,0
L9676:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 551 ---
L9684:	fn_link  L9664
	fn_link  L9696
	fn_combi_t2 4, 3,0,1,0,0,0
L9696:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 552 ---
L9704:	fn_link  L9684
	fn_link  L9716
	fn_combi_t2 4, 3,0,1,0,0,0
L9716:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 553 ---
L9724:	fn_link  L9704
	fn_link  L9736
	fn_combi_t2 4, 3,0,1,0,0,0
L9736:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 554 ---
L9744:	fn_link  L9724
	fn_link  L9756
	fn_combi_t2 4, 3,0,1,0,0,0
L9756:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 555 ---
L9764:	fn_link  L9744
	fn_link  L9776
	fn_combi_t2 4, 3,0,1,0,0,0
L9776:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 556 ---
L9784:	fn_link  L9764
	fn_link  L9796
	fn_combi_t2 4, 3,0,1,0,0,0
L9796:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 557 ---
L9804:	fn_link  L9784
	fn_link  L9816
	fn_combi_t2 4, 3,0,1,0,0,0
L9816:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 558 ---
L9824:	fn_link  L9804
	fn_link  L9836
	fn_combi_t2 4, 3,0,1,0,0,0
L9836:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 559 ---
L9844:	fn_link  L9824
	fn_link  L9856
	fn_combi_t2 4, 3,0,1,0,0,0
L9856:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 560 ---
L9864:	fn_link  L9844
	fn_link  L9876
	fn_combi_t2 4, 3,0,1,0,0,0
L9876:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 561 ---
L9884:	fn_link  L9864
	fn_link  L9896
	fn_combi_t2 4, 3,0,1,0,0,0
L9896:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 562 ---
L9904:	fn_link  L9884
	fn_link  L9916
	fn_combi_t2 4, 3,0,1,0,0,0
L9916:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 563 ---
L9924:	fn_link  L9904
	fn_link  L9936
	fn_combi_t2 4, 3,0,1,0,0,0
L9936:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 564 ---
L9944:	fn_link  L9924
	fn_link  L9956
	fn_combi_t2 4, 3,0,1,0,0,0
L9956:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 565 ---
L9964:	fn_link  L9944
	fn_link  L9976
	fn_combi_t2 4, 3,0,1,0,0,0
L9976:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 566 ---
L9984:	fn_link  L9964
	fn_link  L9996
	fn_combi_t2 4, 3,0,1,0,0,0
L9996:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 567 ---
L10004:	fn_link  L9984
	fn_link  L10016
	fn_combi_t2 4, 3,0,1,0,0,0
L10016:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 568 ---
L10024:	fn_link  L10004
	fn_link  L10036
	fn_combi_t2 4, 3,0,1,0,0,0
L10036:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 569 ---
L10044:	fn_link  L10024
	fn_link  L10056
	fn_combi_t2 4, 3,0,1,0,0,0
L10056:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 570 ---
L10064:	fn_link  L10044
	fn_link  L10076
	fn_combi_t2 4, 3,0,1,0,0,0
L10076:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 571 ---
L10084:	fn_link  L10064
	fn_link  L10096
	fn_combi_t2 4, 3,0,1,0,0,0
L10096:	fn_box
	.word 0x0000007d	# raw word 125
	fn_box_body
# --- block 572 ---
L10104:	fn_link  L10084
	fn_link  L10116
	fn_combi_t2 4, 3,0,1,0,0,0
L10116:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 573 ---
L10124:	fn_link  L10104
	fn_link  L10136
	fn_combi_t2 4, 3,0,1,0,0,0
L10136:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 574 ---
L10144:	fn_link  L10124
	fn_link  L10156
	fn_combi_t2 4, 3,0,1,0,0,0
L10156:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 575 ---
L10164:	fn_link  L10144
	fn_link  L10176
	fn_combi_t2 4, 3,0,1,0,0,0
L10176:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 576 ---
L10184:	fn_link  L10164
	fn_link  L10196
	fn_combi_t2 4, 3,0,1,0,0,0
L10196:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 577 ---
L10204:	fn_link  L10184
	fn_link  L10216
	fn_combi_t2 4, 3,0,1,0,0,0
L10216:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 578 ---
L10224:	fn_link  L10204
	fn_link  L10236
	fn_combi_t2 4, 3,0,1,0,0,0
L10236:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 579 ---
L10244:	fn_link  L10224
	fn_link  L10256
	fn_combi_t2 4, 3,0,1,0,0,0
L10256:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 580 ---
L10264:	fn_link  L10244
	fn_link  L10276
	fn_combi_t2 4, 3,0,1,0,0,0
L10276:	fn_box
	.word 0x0000007b	# raw word 123
	fn_box_body
# --- block 581 ---
L10284:	fn_link  L10264
	fn_link  L10296
	fn_combi_t2 4, 3,0,1,0,0,0
L10296:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 582 ---
L10304:	fn_link  L10284
	fn_link  L10316
	fn_combi_t2 4, 3,0,1,0,0,0
L10316:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 583 ---
L10324:	fn_link  L10304
	fn_link  L10336
	fn_combi_t2 4, 3,0,1,0,0,0
L10336:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 584 ---
L10344:	fn_link  L10324
	fn_link  L10356
	fn_combi_t2 4, 3,0,1,0,0,0
L10356:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 585 ---
L10364:	fn_link  L10344
	fn_link  L10376
	fn_combi_t2 4, 3,0,1,0,0,0
L10376:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 586 ---
L10384:	fn_link  L10364
	fn_link  L10396
	fn_combi_t2 4, 3,0,1,0,0,0
L10396:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 587 ---
L10404:	fn_link  L10384
	fn_link  L10416
	fn_combi_t2 4, 3,0,1,0,0,0
L10416:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 588 ---
L10424:	fn_link  L10404
	fn_link  L10436
	fn_combi_t2 4, 3,0,1,0,0,0
L10436:	fn_box
	.word 0x0000003e	# raw word 62
	fn_box_body
# --- block 589 ---
L10444:	fn_link  L10424
	fn_link  L10456
	fn_combi_t2 4, 3,0,1,0,0,0
L10456:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 590 ---
L10464:	fn_link  L10444
	fn_link  L10476
	fn_combi_t2 4, 3,0,1,0,0,0
L10476:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 591 ---
L10484:	fn_link  L10464
	fn_link  L10496
	fn_combi_t2 4, 3,0,1,0,0,0
L10496:	fn_box
	.word 0x0000007d	# raw word 125
	fn_box_body
# --- block 592 ---
L10504:	fn_link  L10484
	fn_link  L10516
	fn_combi_t2 4, 3,0,1,0,0,0
L10516:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 593 ---
L10524:	fn_link  L10504
	fn_link  L10536
	fn_combi_t2 4, 3,0,1,0,0,0
L10536:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 594 ---
L10544:	fn_link  L10524
	fn_link  L10556
	fn_combi_t2 4, 3,0,1,0,0,0
L10556:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 595 ---
L10564:	fn_link  L10544
	fn_link  L10576
	fn_combi_t2 4, 3,0,1,0,0,0
L10576:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 596 ---
L10584:	fn_link  L10564
	fn_link  L10596
	fn_combi_t2 4, 3,0,1,0,0,0
L10596:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 597 ---
L10604:	fn_link  L10584
	fn_link  L10616
	fn_combi_t2 4, 3,0,1,0,0,0
L10616:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 598 ---
L10624:	fn_link  L10604
	fn_link  L10636
	fn_combi_t2 4, 3,0,1,0,0,0
L10636:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 599 ---
L10644:	fn_link  L10624
	fn_link  L10656
	fn_combi_t2 4, 3,0,1,0,0,0
L10656:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 600 ---
L10664:	fn_link  L10644
	fn_link  L10676
	fn_combi_t2 4, 3,0,1,0,0,0
L10676:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 601 ---
L10684:	fn_link  L10664
	fn_link  L10696
	fn_combi_t2 4, 3,0,1,0,0,0
L10696:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 602 ---
L10704:	fn_link  L10684
	fn_link  L10716
	fn_combi_t2 4, 3,0,1,0,0,0
L10716:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 603 ---
L10724:	fn_link  L10704
	fn_link  L10736
	fn_combi_t2 4, 3,0,1,0,0,0
L10736:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 604 ---
L10744:	fn_link  L10724
	fn_link  L10756
	fn_combi_t2 4, 3,0,1,0,0,0
L10756:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 605 ---
L10764:	fn_link  L10744
	fn_link  L10776
	fn_combi_t2 4, 3,0,1,0,0,0
L10776:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 606 ---
L10784:	fn_link  L10764
	fn_link  L10796
	fn_combi_t2 4, 3,0,1,0,0,0
L10796:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 607 ---
L10804:	fn_link  L10784
	fn_link  L10816
	fn_combi_t2 4, 3,0,1,0,0,0
L10816:	fn_box
	.word 0x0000007b	# raw word 123
	fn_box_body
# --- block 608 ---
L10824:	fn_link  L10804
	fn_link  L10836
	fn_combi_t2 4, 3,0,1,0,0,0
L10836:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 609 ---
L10844:	fn_link  L10824
	fn_link  L10856
	fn_combi_t2 4, 3,0,1,0,0,0
L10856:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 610 ---
L10864:	fn_link  L10844
	fn_link  L10876
	fn_combi_t2 4, 3,0,1,0,0,0
L10876:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 611 ---
L10884:	fn_link  L10864
	fn_link  L10896
	fn_combi_t2 4, 3,0,1,0,0,0
L10896:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 612 ---
L10904:	fn_link  L10884
	fn_link  L10916
	fn_combi_t2 4, 3,0,1,0,0,0
L10916:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 613 ---
L10924:	fn_link  L10904
	fn_link  L10936
	fn_combi_t2 4, 3,0,1,0,0,0
L10936:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 614 ---
L10944:	fn_link  L10924
	fn_link  L10956
	fn_combi_t2 4, 3,0,1,0,0,0
L10956:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 615 ---
L10964:	fn_link  L10944
	fn_link  L10976
	fn_combi_t2 4, 3,0,1,0,0,0
L10976:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 616 ---
L10984:	fn_link  L10964
	fn_link  L10996
	fn_combi_t2 4, 3,0,1,0,0,0
L10996:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 617 ---
L11004:	fn_link  L10984
	fn_link  L11016
	fn_combi_t2 4, 3,0,1,0,0,0
L11016:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 618 ---
L11024:	fn_link  L11004
	fn_link  L11036
	fn_combi_t2 4, 3,0,1,0,0,0
L11036:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 619 ---
L11044:	fn_link  L11024
	fn_link  L11056
	fn_combi_t2 4, 3,0,1,0,0,0
L11056:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 620 ---
L11064:	fn_link  L11044
	fn_link  L11076
	fn_combi_t2 4, 3,0,1,0,0,0
L11076:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 621 ---
L11084:	fn_link  L11064
	fn_link  L11096
	fn_combi_t2 4, 3,0,1,0,0,0
L11096:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 622 ---
L11104:	fn_link  L11084
	fn_link  L11116
	fn_combi_t2 4, 3,0,1,0,0,0
L11116:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 623 ---
L11124:	fn_link  L11104
	fn_link  L11136
	fn_combi_t2 4, 3,0,1,0,0,0
L11136:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 624 ---
L11144:	fn_link  L11124
	fn_link  L11156
	fn_combi_t2 4, 3,0,1,0,0,0
L11156:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 625 ---
L11164:	fn_link  L11144
	fn_link  L11176
	fn_combi_t2 4, 3,0,1,0,0,0
L11176:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 626 ---
L11184:	fn_link  L11164
	fn_link  L11196
	fn_combi_t2 4, 3,0,1,0,0,0
L11196:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 627 ---
L11204:	fn_link  L11184
	fn_link  L11216
	fn_combi_t2 4, 3,0,1,0,0,0
L11216:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 628 ---
L11224:	fn_link  L11204
	fn_link  L11236
	fn_combi_t2 4, 3,0,1,0,0,0
L11236:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 629 ---
L11244:	fn_link  L11224
	fn_link  L11256
	fn_combi_t2 4, 3,0,1,0,0,0
L11256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 630 ---
L11264:	fn_link  L11244
	fn_link  L11276
	fn_combi_t2 4, 3,0,1,0,0,0
L11276:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 631 ---
L11284:	fn_link  L11264
	fn_link  L11296
	fn_combi_t2 4, 3,0,1,0,0,0
L11296:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 632 ---
L11304:	fn_link  L11284
	fn_link  L11316
	fn_combi_t2 4, 3,0,1,0,0,0
L11316:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 633 ---
L11324:	fn_link  L11304
	fn_link  L11336
	fn_combi_t2 4, 3,0,1,0,0,0
L11336:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 634 ---
L11344:	fn_link  L11324
	fn_link  L11356
	fn_combi_t2 4, 3,0,1,0,0,0
L11356:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 635 ---
L11364:	fn_link  L11344
	fn_link  L11376
	fn_combi_t2 4, 3,0,1,0,0,0
L11376:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 636 ---
L11384:	fn_link  L11364
	fn_link  L11396
	fn_combi_t2 4, 3,0,1,0,0,0
L11396:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 637 ---
L11404:	fn_link  L11384
	fn_link  L11416
	fn_combi_t2 4, 3,0,1,0,0,0
L11416:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 638 ---
L11424:	fn_link  L11404
	fn_link  L11436
	fn_combi_t2 4, 3,0,1,0,0,0
L11436:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 639 ---
L11444:	fn_link  L11424
	fn_link  L11456
	fn_combi_t2 4, 3,0,1,0,0,0
L11456:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 640 ---
L11464:	fn_link  L11444
	fn_link  L11476
	fn_combi_t2 4, 3,0,1,0,0,0
L11476:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 641 ---
L11484:	fn_link  L11464
	fn_link  L11496
	fn_combi_t2 4, 3,0,1,0,0,0
L11496:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 642 ---
L11504:	fn_link  L11484
	fn_link  L11516
	fn_combi_t2 4, 3,0,1,0,0,0
L11516:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 643 ---
L11524:	fn_link  L11504
	fn_link  L11536
	fn_combi_t2 4, 3,0,1,0,0,0
L11536:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 644 ---
L11544:	fn_link  L11524
	fn_link  L11556
	fn_combi_t2 4, 3,0,1,0,0,0
L11556:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 645 ---
L11564:	fn_link  L11544
	fn_link  L11576
	fn_combi_t2 4, 3,0,1,0,0,0
L11576:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 646 ---
L11584:	fn_link  L11564
	fn_link  L11596
	fn_combi_t2 4, 3,0,1,0,0,0
L11596:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 647 ---
L11604:	fn_link  L11584
	fn_link  L11616
	fn_combi_t2 4, 3,0,1,0,0,0
L11616:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 648 ---
L11624:	fn_link  L11604
	fn_link  L11636
	fn_combi_t2 4, 3,0,1,0,0,0
L11636:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 649 ---
L11644:	fn_link  L11624
	fn_link  L11656
	fn_combi_t2 4, 3,0,1,0,0,0
L11656:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 650 ---
L11664:	fn_link  L11644
	fn_link  L11676
	fn_combi_t2 4, 3,0,1,0,0,0
L11676:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 651 ---
L11684:	fn_link  L11664
	fn_link  L11696
	fn_combi_t2 4, 3,0,1,0,0,0
L11696:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 652 ---
L11704:	fn_link  L11684
	fn_link  L11716
	fn_combi_t2 4, 3,0,1,0,0,0
L11716:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 653 ---
L11724:	fn_link  L11704
	fn_link  L11736
	fn_combi_t2 4, 3,0,1,0,0,0
L11736:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 654 ---
L11744:	fn_link  L11724
	fn_link  L11756
	fn_combi_t2 4, 3,0,1,0,0,0
L11756:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 655 ---
L11764:	fn_link  L11744
	fn_link  L11776
	fn_combi_t2 4, 3,0,1,0,0,0
L11776:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 656 ---
L11784:	fn_link  L11764
	fn_link  L11796
	fn_combi_t2 4, 3,0,1,0,0,0
L11796:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 657 ---
L11804:	fn_link  L11784
	fn_link  L11816
	fn_combi_t2 4, 3,0,1,0,0,0
L11816:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 658 ---
L11824:	fn_link  L11804
	fn_link  L11836
	fn_combi_t2 4, 3,0,1,0,0,0
L11836:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 659 ---
L11844:	fn_link  L11824
	fn_link  L11856
	fn_combi_t2 4, 3,0,1,0,0,0
L11856:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 660 ---
L11864:	fn_link  L11844
	fn_link  L11876
	fn_combi_t2 4, 3,0,1,0,0,0
L11876:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 661 ---
L11884:	fn_link  L11864
	fn_link  L11896
	fn_combi_t2 4, 3,0,1,0,0,0
L11896:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 662 ---
L11904:	fn_link  L11884
	fn_link  L11916
	fn_combi_t2 4, 3,0,1,0,0,0
L11916:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 663 ---
L11924:	fn_link  L11904
	fn_link  L11936
	fn_combi_t2 4, 3,0,1,0,0,0
L11936:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 664 ---
L11944:	fn_link  L11924
	fn_link  L11956
	fn_combi_t2 4, 3,0,1,0,0,0
L11956:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 665 ---
L11964:	fn_link  L11944
	fn_link  L11976
	fn_combi_t2 4, 3,0,1,0,0,0
L11976:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 666 ---
L11984:	fn_link  L11964
	fn_link  L11996
	fn_combi_t2 4, 3,0,1,0,0,0
L11996:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
# --- block 667 ---
L12004:	fn_link  L11984
	fn_link  L12016
	fn_combi_t2 4, 3,0,1,0,0,0
L12016:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 668 ---
L12024:	fn_link  L12004
	fn_link  L12036
	fn_combi_t2 4, 3,0,1,0,0,0
L12036:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 669 ---
L12044:	fn_link  L12024
	fn_link  L12056
	fn_combi_t2 4, 3,0,1,0,0,0
L12056:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 670 ---
L12064:	fn_link  L12044
	fn_link  L12076
	fn_combi_t2 4, 3,0,1,0,0,0
L12076:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 671 ---
L12084:	fn_link  L12064
	fn_link  L12096
	fn_combi_t2 4, 3,0,1,0,0,0
L12096:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 672 ---
L12104:	fn_link  L12084
	fn_link  L12116
	fn_combi_t2 4, 3,0,1,0,0,0
L12116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 673 ---
L12124:	fn_link  L12104
	fn_link  L12136
	fn_combi_t2 4, 3,0,1,0,0,0
L12136:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 674 ---
L12144:	fn_link  L12124
	fn_link  L12156
	fn_combi_t2 4, 3,0,1,0,0,0
L12156:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 675 ---
L12164:	fn_link  L12144
	fn_link  L12176
	fn_combi_t2 4, 3,0,1,0,0,0
L12176:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 676 ---
L12184:	fn_link  L12164
	fn_link  L12196
	fn_combi_t2 4, 3,0,1,0,0,0
L12196:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 677 ---
L12204:	fn_link  L12184
	fn_link  L12216
	fn_combi_t2 4, 3,0,1,0,0,0
L12216:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 678 ---
L12224:	fn_link  L12204
	fn_link  L12236
	fn_combi_t2 4, 3,0,1,0,0,0
L12236:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 679 ---
L12244:	fn_link  L12224
	fn_link  L12256
	fn_combi_t2 4, 3,0,1,0,0,0
L12256:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 680 ---
L12264:	fn_link  L12244
	fn_link  L12276
	fn_combi_t2 4, 3,0,1,0,0,0
L12276:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 681 ---
L12284:	fn_link  L12264
	fn_link  L12296
	fn_combi_t2 4, 3,0,1,0,0,0
L12296:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 682 ---
L12304:	fn_link  L12284
	fn_link  L12316
	fn_combi_t2 4, 3,0,1,0,0,0
L12316:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 683 ---
L12324:	fn_link  L12304
	fn_link  L12336
	fn_combi_t2 4, 3,0,1,0,0,0
L12336:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
# --- block 684 ---
L12344:	fn_link  L12324
	fn_link  L12356
	fn_combi_t2 4, 3,0,1,0,0,0
L12356:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 685 ---
L12364:	fn_link  L12344
	fn_link  L12376
	fn_combi_t2 4, 3,0,1,0,0,0
L12376:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 686 ---
L12384:	fn_link  L12364
	fn_link  L12396
	fn_combi_t2 4, 3,0,1,0,0,0
L12396:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 687 ---
L12404:	fn_link  L12384
	fn_link  L12416
	fn_combi_t2 4, 3,0,1,0,0,0
L12416:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 688 ---
L12424:	fn_link  L12404
	fn_link  L12436
	fn_combi_t2 4, 3,0,1,0,0,0
L12436:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 689 ---
L12444:	fn_link  L12424
	fn_link  L12456
	fn_combi_t2 4, 3,0,1,0,0,0
L12456:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 690 ---
L12464:	fn_link  L12444
	fn_link  L12476
	fn_combi_t2 4, 3,0,1,0,0,0
L12476:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 691 ---
L12484:	fn_link  L12464
	fn_link  L12496
	fn_combi_t2 4, 3,0,1,0,0,0
L12496:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 692 ---
L12504:	fn_link  L12484
	fn_link  L12516
	fn_combi_t2 4, 3,0,1,0,0,0
L12516:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 693 ---
L12524:	fn_link  L12504
	fn_link  L12536
	fn_combi_t2 4, 3,0,1,0,0,0
L12536:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 694 ---
L12544:	fn_link  L12524
	fn_link  L12556
	fn_combi_t2 4, 3,0,1,0,0,0
L12556:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 695 ---
L12564:	fn_link  L12544
	fn_link  L12576
	fn_combi_t2 4, 3,0,1,0,0,0
L12576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 696 ---
L12584:	fn_link  L12564
	fn_link  L12596
	fn_combi_t2 4, 3,0,1,0,0,0
L12596:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 697 ---
L12604:	fn_link  L12584
	fn_link  L12616
	fn_combi_t2 4, 3,0,1,0,0,0
L12616:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 698 ---
L12624:	fn_link  L12604
	fn_link  L12636
	fn_combi_t2 4, 3,0,1,0,0,0
L12636:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 699 ---
L12644:	fn_link  L12624
	fn_link  L12656
	fn_combi_t2 4, 3,0,1,0,0,0
L12656:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 700 ---
L12664:	fn_link  L12644
	fn_link  L12676
	fn_combi_t2 4, 3,0,1,0,0,0
L12676:	fn_box
	.word 0x00000024	# raw word 36
	fn_box_body
# --- block 701 ---
L12684:	fn_link  L12664
	fn_link  L12696
	fn_combi_t2 4, 3,0,1,0,0,0
L12696:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 702 ---
L12704:	fn_link  L12684
	fn_link  L12716
	fn_combi_t2 4, 3,0,1,0,0,0
L12716:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 703 ---
L12724:	fn_link  L12704
	fn_link  L12736
	fn_combi_t2 4, 3,0,1,0,0,0
L12736:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 704 ---
L12744:	fn_link  L12724
	fn_link  L12756
	fn_combi_t2 4, 3,0,1,0,0,0
L12756:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 705 ---
L12764:	fn_link  L12744
	fn_link  L12776
	fn_combi_t2 4, 3,0,1,0,0,0
L12776:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 706 ---
L12784:	fn_link  L12764
	fn_link  L12796
	fn_combi_t2 4, 3,0,1,0,0,0
L12796:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 707 ---
L12804:	fn_link  L12784
	fn_link  L12816
	fn_combi_t2 4, 3,0,1,0,0,0
L12816:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 708 ---
L12824:	fn_link  L12804
	fn_link  L12836
	fn_combi_t2 4, 3,0,1,0,0,0
L12836:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 709 ---
L12844:	fn_link  L12824
	fn_link  L12856
	fn_combi_t2 4, 3,0,1,0,0,0
L12856:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 710 ---
L12864:	fn_link  L12844
	fn_link  L12876
	fn_combi_t2 4, 3,0,1,0,0,0
L12876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 711 ---
L12884:	fn_link  L12864
	fn_link  L12896
	fn_combi_t2 4, 3,0,1,0,0,0
L12896:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 712 ---
L12904:	fn_link  L12884
	fn_link  L12916
	fn_combi_t2 4, 3,0,1,0,0,0
L12916:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 713 ---
L12924:	fn_link  L12904
	fn_link  L12936
	fn_combi_t2 4, 3,0,1,0,0,0
L12936:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 714 ---
L12944:	fn_link  L12924
	fn_link  L12956
	fn_combi_t2 4, 3,0,1,0,0,0
L12956:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 715 ---
L12964:	fn_link  L12944
	fn_link  L12976
	fn_combi_t2 4, 3,0,1,0,0,0
L12976:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 716 ---
L12984:	fn_link  L12964
	fn_link  L12996
	fn_combi_t2 4, 3,0,1,0,0,0
L12996:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 717 ---
L13004:	fn_link  L12984
	fn_link  L13016
	fn_combi_t2 4, 3,0,1,0,0,0
L13016:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 718 ---
L13024:	fn_link  L13004
	fn_link  L13036
	fn_combi_t2 4, 3,0,1,0,0,0
L13036:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 719 ---
L13044:	fn_link  L13024
	fn_link  L13056
	fn_combi_t2 4, 3,0,1,0,0,0
L13056:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 720 ---
L13064:	fn_link  L13044
	fn_link  L13076
	fn_combi_t2 4, 3,0,1,0,0,0
L13076:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 721 ---
L13084:	fn_link  L13064
	fn_link  L13096
	fn_combi_t2 4, 3,0,1,0,0,0
L13096:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 722 ---
L13104:	fn_link  L13084
	fn_link  L13116
	fn_combi_t2 4, 3,0,1,0,0,0
L13116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 723 ---
L13124:	fn_link  L13104
	fn_link  L13136
	fn_combi_t2 4, 3,0,1,0,0,0
L13136:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 724 ---
L13144:	fn_link  L13124
	fn_link  L13156
	fn_combi_t2 4, 3,0,1,0,0,0
L13156:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 725 ---
L13164:	fn_link  L13144
	fn_link  L13176
	fn_combi_t2 4, 3,0,1,0,0,0
L13176:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 726 ---
L13184:	fn_link  L13164
	fn_link  L13196
	fn_combi_t2 4, 3,0,1,0,0,0
L13196:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 727 ---
L13204:	fn_link  L13184
	fn_link  L13216
	fn_combi_t2 4, 3,0,1,0,0,0
L13216:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 728 ---
L13224:	fn_link  L13204
	fn_link  L13236
	fn_combi_t2 4, 3,0,1,0,0,0
L13236:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 729 ---
L13244:	fn_link  L13224
	fn_link  L13256
	fn_combi_t2 4, 3,0,1,0,0,0
L13256:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 730 ---
L13264:	fn_link  L13244
	fn_link  L13276
	fn_combi_t2 4, 3,0,1,0,0,0
L13276:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 731 ---
L13284:	fn_link  L13264
	fn_link  L13296
	fn_combi_t2 4, 3,0,1,0,0,0
L13296:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 732 ---
L13304:	fn_link  L13284
	fn_link  L13316
	fn_combi_t2 4, 3,0,1,0,0,0
L13316:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 733 ---
L13324:	fn_link  L13304
	fn_link  L13336
	fn_combi_t2 4, 3,0,1,0,0,0
L13336:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 734 ---
L13344:	fn_link  L13324
	fn_link  L13356
	fn_combi_t2 4, 3,0,1,0,0,0
L13356:	fn_box
	.word 0x0000003c	# raw word 60
	fn_box_body
# --- block 735 ---
L13364:	fn_link  L13344
	fn_link  L13376
	fn_combi_t2 4, 3,0,1,0,0,0
L13376:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 736 ---
L13384:	fn_link  L13364
	fn_link  L13396
	fn_combi_t2 4, 3,0,1,0,0,0
L13396:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 737 ---
L13404:	fn_link  L13384
	fn_link  L13416
	fn_combi_t2 4, 3,0,1,0,0,0
L13416:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 738 ---
L13424:	fn_link  L13404
	fn_link  L13436
	fn_combi_t2 4, 3,0,1,0,0,0
L13436:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 739 ---
L13444:	fn_link  L13424
	fn_link  L13456
	fn_combi_t2 4, 3,0,1,0,0,0
L13456:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 740 ---
L13464:	fn_link  L13444
	fn_link  L13476
	fn_combi_t2 4, 3,0,1,0,0,0
L13476:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 741 ---
L13484:	fn_link  L13464
	fn_link  L13496
	fn_combi_t2 4, 3,0,1,0,0,0
L13496:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 742 ---
L13504:	fn_link  L13484
	fn_link  L13516
	fn_combi_t2 4, 3,0,1,0,0,0
L13516:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 743 ---
L13524:	fn_link  L13504
	fn_link  L13536
	fn_combi_t2 4, 3,0,1,0,0,0
L13536:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 744 ---
L13544:	fn_link  L13524
	fn_link  L13556
	fn_combi_t2 4, 3,0,1,0,0,0
L13556:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 745 ---
L13564:	fn_link  L13544
	fn_link  L13576
	fn_combi_t2 4, 3,0,1,0,0,0
L13576:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 746 ---
L13584:	fn_link  L13564
	fn_link  L13596
	fn_combi_t2 4, 3,0,1,0,0,0
L13596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 747 ---
L13604:	fn_link  L13584
	fn_link  L13616
	fn_combi_t2 4, 3,0,1,0,0,0
L13616:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 748 ---
L13624:	fn_link  L13604
	fn_link  L13636
	fn_combi_t2 4, 3,0,1,0,0,0
L13636:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 749 ---
L13644:	fn_link  L13624
	fn_link  L13656
	fn_combi_t2 4, 3,0,1,0,0,0
L13656:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 750 ---
L13664:	fn_link  L13644
	fn_link  L13676
	fn_combi_t2 4, 3,0,1,0,0,0
L13676:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 751 ---
L13684:	fn_link  L13664
	fn_link  L13696
	fn_combi_t2 4, 3,0,1,0,0,0
L13696:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 752 ---
L13704:	fn_link  L13684
	fn_link  L13716
	fn_combi_t2 4, 3,0,1,0,0,0
L13716:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 753 ---
L13724:	fn_link  L13704
	fn_link  L13736
	fn_combi_t2 4, 3,0,1,0,0,0
L13736:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 754 ---
L13744:	fn_link  L13724
	fn_link  L13756
	fn_combi_t2 4, 3,0,1,0,0,0
L13756:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 755 ---
L13764:	fn_link  L13744
	fn_link  L13776
	fn_combi_t2 4, 3,0,1,0,0,0
L13776:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 756 ---
L13784:	fn_link  L13764
	fn_link  L13796
	fn_combi_t2 4, 3,0,1,0,0,0
L13796:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 757 ---
L13804:	fn_link  L13784
	fn_link  L13816
	fn_combi_t2 4, 3,0,1,0,0,0
L13816:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 758 ---
L13824:	fn_link  L13804
	fn_link  L13836
	fn_combi_t2 4, 3,0,1,0,0,0
L13836:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 759 ---
L13844:	fn_link  L13824
	fn_link  L13856
	fn_combi_t2 4, 3,0,1,0,0,0
L13856:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 760 ---
L13864:	fn_link  L13844
	fn_link  L13876
	fn_combi_t2 4, 3,0,1,0,0,0
L13876:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 761 ---
L13884:	fn_link  L13864
	fn_link  L13896
	fn_combi_t2 4, 3,0,1,0,0,0
L13896:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 762 ---
L13904:	fn_link  L13884
	fn_link  L13916
	fn_combi_t2 4, 3,0,1,0,0,0
L13916:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 763 ---
L13924:	fn_link  L13904
	fn_link  L13936
	fn_combi_t2 4, 3,0,1,0,0,0
L13936:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 764 ---
L13944:	fn_link  L13924
	fn_link  L13956
	fn_combi_t2 4, 3,0,1,0,0,0
L13956:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 765 ---
L13964:	fn_link  L13944
	fn_link  L13976
	fn_combi_t2 4, 3,0,1,0,0,0
L13976:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 766 ---
L13984:	fn_link  L13964
	fn_link  L13996
	fn_combi_t2 4, 3,0,1,0,0,0
L13996:	fn_box
	.word 0x00000055	# raw word 85
	fn_box_body
# --- block 767 ---
L14004:	fn_link  L13984
	fn_link  L14016
	fn_combi_t2 4, 3,0,1,0,0,0
L14016:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 768 ---
L14024:	fn_link  L14004
	fn_link  L14036
	fn_combi_t2 4, 3,0,1,0,0,0
L14036:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 769 ---
L14044:	fn_link  L14024
	fn_link  L14056
	fn_combi_t2 4, 3,0,1,0,0,0
L14056:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 770 ---
L14064:	fn_link  L14044
	fn_link  L14076
	fn_combi_t2 4, 3,0,1,0,0,0
L14076:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 771 ---
L14084:	fn_link  L14064
	fn_link  L14096
	fn_combi_t2 4, 3,0,1,0,0,0
L14096:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 772 ---
L14104:	fn_link  L14084
	fn_link  L14116
	fn_combi_t2 4, 3,0,1,0,0,0
L14116:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 773 ---
L14124:	fn_link  L14104
	fn_link  L14136
	fn_combi_t2 4, 3,0,1,0,0,0
L14136:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 774 ---
L14144:	fn_link  L14124
	fn_link  L14156
	fn_combi_t2 4, 3,0,1,0,0,0
L14156:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 775 ---
L14164:	fn_link  L14144
	fn_link  L14176
	fn_combi_t2 4, 3,0,1,0,0,0
L14176:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 776 ---
L14184:	fn_link  L14164
	fn_link  L14196
	fn_combi_t2 4, 3,0,1,0,0,0
L14196:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 777 ---
L14204:	fn_link  L14184
	fn_link  L14216
	fn_combi_t2 4, 3,0,1,0,0,0
L14216:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 778 ---
L14224:	fn_link  L14204
	fn_link  L14236
	fn_combi_t2 4, 3,0,1,0,0,0
L14236:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 779 ---
L14244:	fn_link  L14224
	fn_link  L14256
	fn_combi_t2 4, 3,0,1,0,0,0
L14256:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 780 ---
L14264:	fn_link  L14244
	fn_link  L14276
	fn_combi_t2 4, 3,0,1,0,0,0
L14276:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 781 ---
L14284:	fn_link  L14264
	fn_link  L14296
	fn_combi_t2 4, 3,0,1,0,0,0
L14296:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 782 ---
L14304:	fn_link  L14284
	fn_link  L14316
	fn_combi_t2 4, 3,0,1,0,0,0
L14316:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 783 ---
L14324:	fn_link  L14304
	fn_link  L14336
	fn_combi_t2 4, 3,0,1,0,0,0
L14336:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 784 ---
L14344:	fn_link  L14324
	fn_link  L14356
	fn_combi_t2 4, 3,0,1,0,0,0
L14356:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 785 ---
L14364:	fn_link  L14344
	fn_link  L14376
	fn_combi_t2 4, 3,0,1,0,0,0
L14376:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 786 ---
L14384:	fn_link  L14364
	fn_link  L14396
	fn_combi_t2 4, 3,0,1,0,0,0
L14396:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 787 ---
L14404:	fn_link  L14384
	fn_link  L14416
	fn_combi_t2 4, 3,0,1,0,0,0
L14416:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 788 ---
L14424:	fn_link  L14404
	fn_link  L14436
	fn_combi_t2 4, 3,0,1,0,0,0
L14436:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 789 ---
L14444:	fn_link  L14424
	fn_link  L14456
	fn_combi_t2 4, 3,0,1,0,0,0
L14456:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 790 ---
L14464:	fn_link  L14444
	fn_link  L14476
	fn_combi_t2 4, 3,0,1,0,0,0
L14476:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 791 ---
L14484:	fn_link  L14464
	fn_link  L14496
	fn_combi_t2 4, 3,0,1,0,0,0
L14496:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 792 ---
L14504:	fn_link  L14484
	fn_link  L14516
	fn_combi_t2 4, 3,0,1,0,0,0
L14516:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 793 ---
L14524:	fn_link  L14504
	fn_link  L14536
	fn_combi_t2 4, 3,0,1,0,0,0
L14536:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 794 ---
L14544:	fn_link  L14524
	fn_link  L14556
	fn_combi_t2 4, 3,0,1,0,0,0
L14556:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 795 ---
L14564:	fn_link  L14544
	fn_link  L14576
	fn_combi_t2 4, 3,0,1,0,0,0
L14576:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 796 ---
L14584:	fn_link  L14564
	fn_link  L14596
	fn_combi_t2 4, 3,0,1,0,0,0
L14596:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 797 ---
L14604:	fn_link  L14584
	fn_link  L14616
	fn_combi_t2 4, 3,0,1,0,0,0
L14616:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 798 ---
L14624:	fn_link  L14604
	fn_link  L14636
	fn_combi_t2 4, 3,0,1,0,0,0
L14636:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 799 ---
L14644:	fn_link  L14624
	fn_link  L14656
	fn_combi_t2 4, 3,0,1,0,0,0
L14656:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 800 ---
L14664:	fn_link  L14644
	fn_link  L14676
	fn_combi_t2 4, 3,0,1,0,0,0
L14676:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 801 ---
L14684:	fn_link  L14664
	fn_link  L14696
	fn_combi_t2 4, 3,0,1,0,0,0
L14696:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 802 ---
L14704:	fn_link  L14684
	fn_link  L14716
	fn_combi_t2 4, 3,0,1,0,0,0
L14716:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 803 ---
L14724:	fn_link  L14704
	fn_link  L14736
	fn_combi_t2 4, 3,0,1,0,0,0
L14736:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 804 ---
L14744:	fn_link  L14724
	fn_link  L14756
	fn_combi_t2 4, 3,0,1,0,0,0
L14756:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 805 ---
L14764:	fn_link  L14744
	fn_link  L14776
	fn_combi_t2 4, 3,0,1,0,0,0
L14776:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 806 ---
L14784:	fn_link  L14764
	fn_link  L14796
	fn_combi_t2 4, 3,0,1,0,0,0
L14796:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 807 ---
L14804:	fn_link  L14784
	fn_link  L14816
	fn_combi_t2 4, 3,0,1,0,0,0
L14816:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 808 ---
L14824:	fn_link  L14804
	fn_link  L14836
	fn_combi_t2 4, 3,0,1,0,0,0
L14836:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 809 ---
L14844:	fn_link  L14824
	fn_link  L14856
	fn_combi_t2 4, 3,0,1,0,0,0
L14856:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 810 ---
L14864:	fn_link  L14844
	fn_link  L14876
	fn_combi_t2 4, 3,0,1,0,0,0
L14876:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 811 ---
L14884:	fn_link  L14864
	fn_link  L14896
	fn_combi_t2 4, 3,0,1,0,0,0
L14896:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 812 ---
L14904:	fn_link  L14884
	fn_link  L14916
	fn_combi_t2 4, 3,0,1,0,0,0
L14916:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 813 ---
L14924:	fn_link  L14904
	fn_link  L14936
	fn_combi_t2 4, 3,0,1,0,0,0
L14936:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 814 ---
L14944:	fn_link  L14924
	fn_link  L14956
	fn_combi_t2 4, 3,0,1,0,0,0
L14956:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 815 ---
L14964:	fn_link  L14944
	fn_link  L14976
	fn_combi_t2 4, 3,0,1,0,0,0
L14976:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 816 ---
L14984:	fn_link  L14964
	fn_link  L14996
	fn_combi_t2 4, 3,0,1,0,0,0
L14996:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 817 ---
L15004:	fn_link  L14984
	fn_link  L15016
	fn_combi_t2 4, 3,0,1,0,0,0
L15016:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 818 ---
L15024:	fn_link  L15004
	fn_link  L15036
	fn_combi_t2 4, 3,0,1,0,0,0
L15036:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 819 ---
L15044:	fn_link  L15024
	fn_link  L15056
	fn_combi_t2 4, 3,0,1,0,0,0
L15056:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 820 ---
L15064:	fn_link  L15044
	fn_link  L15076
	fn_combi_t2 4, 3,0,1,0,0,0
L15076:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 821 ---
L15084:	fn_link  L15064
	fn_link  L15096
	fn_combi_t2 4, 3,0,1,0,0,0
L15096:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 822 ---
L15104:	fn_link  L15084
	fn_link  L15116
	fn_combi_t2 4, 3,0,1,0,0,0
L15116:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 823 ---
L15124:	fn_link  L15104
	fn_link  L15136
	fn_combi_t2 4, 3,0,1,0,0,0
L15136:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 824 ---
L15144:	fn_link  L15124
	fn_link  L15156
	fn_combi_t2 4, 3,0,1,0,0,0
L15156:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 825 ---
L15164:	fn_link  L15144
	fn_link  L15176
	fn_combi_t2 4, 3,0,1,0,0,0
L15176:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 826 ---
L15184:	fn_link  L15164
	fn_link  L15196
	fn_combi_t2 4, 3,0,1,0,0,0
L15196:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 827 ---
L15204:	fn_link  L15184
	fn_link  L15216
	fn_combi_t2 4, 3,0,1,0,0,0
L15216:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 828 ---
L15224:	fn_link  L15204
	fn_link  L15236
	fn_combi_t2 4, 3,0,1,0,0,0
L15236:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 829 ---
L15244:	fn_link  L15224
	fn_link  L15256
	fn_combi_t2 4, 3,0,1,0,0,0
L15256:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 830 ---
L15264:	fn_link  L15244
	fn_link  L15276
	fn_combi_t2 4, 3,0,1,0,0,0
L15276:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 831 ---
L15284:	fn_link  L15264
	fn_link  L15296
	fn_combi_t2 4, 3,0,1,0,0,0
L15296:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 832 ---
L15304:	fn_link  L15284
	fn_link  L15316
	fn_combi_t2 4, 3,0,1,0,0,0
L15316:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 833 ---
L15324:	fn_link  L15304
	fn_link  L15336
	fn_combi_t2 4, 3,0,1,0,0,0
L15336:	fn_box
	.word 0x0000004c	# raw word 76
	fn_box_body
# --- block 834 ---
L15344:	fn_link  L15324
	fn_link  L15356
	fn_combi_t2 4, 3,0,1,0,0,0
L15356:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 835 ---
L15364:	fn_link  L15344
	fn_link  L15376
	fn_combi_t2 4, 3,0,1,0,0,0
L15376:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 836 ---
L15384:	fn_link  L15364
	fn_link  L15396
	fn_combi_t2 4, 3,0,1,0,0,0
L15396:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 837 ---
L15404:	fn_link  L15384
	fn_link  L15416
	fn_combi_t2 4, 3,0,1,0,0,0
L15416:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 838 ---
L15424:	fn_link  L15404
	fn_link  L15436
	fn_combi_t2 4, 3,0,1,0,0,0
L15436:	fn_box
	.word 0x00000044	# raw word 68
	fn_box_body
# --- block 839 ---
L15444:	fn_link  L15424
	fn_link  L15456
	fn_combi_t2 4, 3,0,1,0,0,0
L15456:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 840 ---
L15464:	fn_link  L15444
	fn_link  L15476
	fn_combi_t2 4, 3,0,1,0,0,0
L15476:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 841 ---
L15484:	fn_link  L15464
	fn_link  L15496
	fn_combi_t2 4, 3,0,1,0,0,0
L15496:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 842 ---
L15504:	fn_link  L15484
	fn_link  L15516
	fn_combi_t2 4, 3,0,1,0,0,0
L15516:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 843 ---
L15524:	fn_link  L15504
	fn_link  L15536
	fn_combi_t2 4, 3,0,1,0,0,0
L15536:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 844 ---
L15544:	fn_link  L15524
	fn_link  L15556
	fn_combi_t2 4, 3,0,1,0,0,0
L15556:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 845 ---
L15564:	fn_link  L15544
	fn_link  L15576
	fn_combi_t2 4, 3,0,1,0,0,0
L15576:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 846 ---
L15584:	fn_link  L15564
	fn_link  L15596
	fn_combi_t2 4, 3,0,1,0,0,0
L15596:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 847 ---
L15604:	fn_link  L15584
	fn_link  L15616
	fn_combi_t2 4, 3,0,1,0,0,0
L15616:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 848 ---
L15624:	fn_link  L15604
	fn_link  L15636
	fn_combi_t2 4, 3,0,1,0,0,0
L15636:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 849 ---
L15644:	fn_link  L15624
	fn_link  L15656
	fn_combi_t2 4, 3,0,1,0,0,0
L15656:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 850 ---
L15664:	fn_link  L15644
	fn_link  L15676
	fn_combi_t2 4, 3,0,1,0,0,0
L15676:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 851 ---
L15684:	fn_link  L15664
	fn_link  L15696
	fn_combi_t2 4, 3,0,1,0,0,0
L15696:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 852 ---
L15704:	fn_link  L15684
	fn_link  L15716
	fn_combi_t2 4, 3,0,1,0,0,0
L15716:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 853 ---
L15724:	fn_link  L15704
	fn_link  L15736
	fn_combi_t2 4, 3,0,1,0,0,0
L15736:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 854 ---
L15744:	fn_link  L15724
	fn_link  L15756
	fn_combi_t2 4, 3,0,1,0,0,0
L15756:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 855 ---
L15764:	fn_link  L15744
	fn_link  L15776
	fn_combi_t2 4, 3,0,1,0,0,0
L15776:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 856 ---
L15784:	fn_link  L15764
	fn_link  L15796
	fn_combi_t2 4, 3,0,1,0,0,0
L15796:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 857 ---
L15804:	fn_link  L15784
	fn_link  L15816
	fn_combi_t2 4, 3,0,1,0,0,0
L15816:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 858 ---
L15824:	fn_link  L15804
	fn_link  L15836
	fn_combi_t2 4, 3,0,1,0,0,0
L15836:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 859 ---
L15844:	fn_link  L15824
	fn_link  L15856
	fn_combi_t2 4, 3,0,1,0,0,0
L15856:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 860 ---
L15864:	fn_link  L15844
	fn_link  L15876
	fn_combi_t2 4, 3,0,1,0,0,0
L15876:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 861 ---
L15884:	fn_link  L15864
	fn_link  L15896
	fn_combi_t2 4, 3,0,1,0,0,0
L15896:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 862 ---
L15904:	fn_link  L15884
	fn_link  L15916
	fn_combi_t2 4, 3,0,1,0,0,0
L15916:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 863 ---
L15924:	fn_link  L15904
	fn_link  L15936
	fn_combi_t2 4, 3,0,1,0,0,0
L15936:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 864 ---
L15944:	fn_link  L15924
	fn_link  L15956
	fn_combi_t2 4, 3,0,1,0,0,0
L15956:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 865 ---
L15964:	fn_link  L15944
	fn_link  L15976
	fn_combi_t2 4, 3,0,1,0,0,0
L15976:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 866 ---
L15984:	fn_link  L15964
	fn_link  L15996
	fn_combi_t2 4, 3,0,1,0,0,0
L15996:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 867 ---
L16004:	fn_link  L15984
	fn_link  L16016
	fn_combi_t2 4, 3,0,1,0,0,0
L16016:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 868 ---
L16024:	fn_link  L16004
	fn_link  L16036
	fn_combi_t2 4, 3,0,1,0,0,0
L16036:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 869 ---
L16044:	fn_link  L16024
	fn_link  L16056
	fn_combi_t2 4, 3,0,1,0,0,0
L16056:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 870 ---
L16064:	fn_link  L16044
	fn_link  L16076
	fn_combi_t2 4, 3,0,1,0,0,0
L16076:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 871 ---
L16084:	fn_link  L16064
	fn_link  L16096
	fn_combi_t2 4, 3,0,1,0,0,0
L16096:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 872 ---
L16104:	fn_link  L16084
	fn_link  L16116
	fn_combi_t2 4, 3,0,1,0,0,0
L16116:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 873 ---
L16124:	fn_link  L16104
	fn_link  L16136
	fn_combi_t2 4, 3,0,1,0,0,0
L16136:	fn_box
	.word 0x00000043	# raw word 67
	fn_box_body
# --- block 874 ---
L16144:	fn_link  L16124
	fn_link  L16156
	fn_combi_t2 4, 3,0,1,0,0,0
L16156:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 875 ---
L16164:	fn_link  L16144
	fn_link  L16176
	fn_combi_t2 4, 3,0,1,0,0,0
L16176:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 876 ---
L16184:	fn_link  L16164
	fn_link  L16196
	fn_combi_t2 4, 3,0,1,0,0,0
L16196:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 877 ---
L16204:	fn_link  L16184
	fn_link  L16216
	fn_combi_t2 4, 3,0,1,0,0,0
L16216:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 878 ---
L16224:	fn_link  L16204
	fn_link  L16236
	fn_combi_t2 4, 3,0,1,0,0,0
L16236:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 879 ---
L16244:	fn_link  L16224
	fn_link  L16256
	fn_combi_t2 4, 3,0,1,0,0,0
L16256:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 880 ---
L16264:	fn_link  L16244
	fn_link  L16276
	fn_combi_t2 4, 3,0,1,0,0,0
L16276:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 881 ---
L16284:	fn_link  L16264
	fn_link  L16296
	fn_combi_t2 4, 3,0,1,0,0,0
L16296:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 882 ---
L16304:	fn_link  L16284
	fn_link  L16316
	fn_combi_t2 4, 3,0,1,0,0,0
L16316:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 883 ---
L16324:	fn_link  L16304
	fn_link  L16336
	fn_combi_t2 4, 3,0,1,0,0,0
L16336:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 884 ---
L16344:	fn_link  L16324
	fn_link  L16356
	fn_combi_t2 4, 3,0,1,0,0,0
L16356:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 885 ---
L16364:	fn_link  L16344
	fn_link  L16376
	fn_combi_t2 4, 3,0,1,0,0,0
L16376:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 886 ---
L16384:	fn_link  L16364
	fn_link  L16396
	fn_combi_t2 4, 3,0,1,0,0,0
L16396:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 887 ---
L16404:	fn_link  L16384
	fn_link  L16416
	fn_combi_t2 4, 3,0,1,0,0,0
L16416:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 888 ---
L16424:	fn_link  L16404
	fn_link  L16436
	fn_combi_t2 4, 3,0,1,0,0,0
L16436:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 889 ---
L16444:	fn_link  L16424
	fn_link  L16456
	fn_combi_t2 4, 3,0,1,0,0,0
L16456:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 890 ---
L16464:	fn_link  L16444
	fn_link  L16476
	fn_combi_t2 4, 3,0,1,0,0,0
L16476:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 891 ---
L16484:	fn_link  L16464
	fn_link  L16496
	fn_combi_t2 4, 3,0,1,0,0,0
L16496:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 892 ---
L16504:	fn_link  L16484
	fn_link  L16516
	fn_combi_t2 4, 3,0,1,0,0,0
L16516:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 893 ---
L16524:	fn_link  L16504
	fn_link  L16536
	fn_combi_t2 4, 3,0,1,0,0,0
L16536:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 894 ---
L16544:	fn_link  L16524
	fn_link  L16556
	fn_combi_t2 4, 3,0,1,0,0,0
L16556:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 895 ---
L16564:	fn_link  L16544
	fn_link  L16576
	fn_combi_t2 4, 3,0,1,0,0,0
L16576:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 896 ---
L16584:	fn_link  L16564
	fn_link  L16596
	fn_combi_t2 4, 3,0,1,0,0,0
L16596:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 897 ---
L16604:	fn_link  L16584
	fn_link  L16616
	fn_combi_t2 4, 3,0,1,0,0,0
L16616:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 898 ---
L16624:	fn_link  L16604
	fn_link  L16636
	fn_combi_t2 4, 3,0,1,0,0,0
L16636:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 899 ---
L16644:	fn_link  L16624
	fn_link  L16656
	fn_combi_t2 4, 3,0,1,0,0,0
L16656:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 900 ---
L16664:	fn_link  L16644
	fn_link  L16676
	fn_combi_t2 4, 3,0,1,0,0,0
L16676:	fn_box
	.word 0x00000077	# raw word 119
	fn_box_body
# --- block 901 ---
L16684:	fn_link  L16664
	fn_link  L16696
	fn_combi_t2 4, 3,0,1,0,0,0
L16696:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 902 ---
L16704:	fn_link  L16684
	fn_link  L16716
	fn_combi_t2 4, 3,0,1,0,0,0
L16716:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 903 ---
L16724:	fn_link  L16704
	fn_link  L16736
	fn_combi_t2 4, 3,0,1,0,0,0
L16736:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 904 ---
L16744:	fn_link  L16724
	fn_link  L16756
	fn_combi_t2 4, 3,0,1,0,0,0
L16756:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 905 ---
L16764:	fn_link  L16744
	fn_link  L16776
	fn_combi_t2 4, 3,0,1,0,0,0
L16776:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 906 ---
L16784:	fn_link  L16764
	fn_link  L16796
	fn_combi_t2 4, 3,0,1,0,0,0
L16796:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 907 ---
L16804:	fn_link  L16784
	fn_link  L16816
	fn_combi_t2 4, 3,0,1,0,0,0
L16816:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 908 ---
L16824:	fn_link  L16804
	fn_link  L16836
	fn_combi_t2 4, 3,0,1,0,0,0
L16836:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 909 ---
L16844:	fn_link  L16824
	fn_link  L16856
	fn_combi_t2 4, 3,0,1,0,0,0
L16856:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 910 ---
L16864:	fn_link  L16844
	fn_link  L16876
	fn_combi_t2 4, 3,0,1,0,0,0
L16876:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 911 ---
L16884:	fn_link  L16864
	fn_link  L16896
	fn_combi_t2 4, 3,0,1,0,0,0
L16896:	fn_box
	.word 0x0000006f	# raw word 111
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
