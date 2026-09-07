# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Life  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Life.append
	.globl	Life.bench
	.globl	Life.copy
	.globl	Life.disp
	.globl	Life.elt
	.globl	Life.eqB
	.globl	Life.eqRow
	.globl	Life.gen
	.globl	Life.generations
	.globl	Life.glue
	.globl	Life.initial
	.globl	Life.iterateL
	.globl	Life.lastL
	.globl	Life.limit
	.globl	Life.row
	.globl	Life.shift
	.globl	Life.shiftl
	.globl	Life.shiftr
	.globl	Life.showN
	.globl	Life.simSz
	.globl	Life.star
	.globl	Life.start
	.globl	Life.tailL
	.globl	Life.takeL
	.globl	Life.upfrom
	.globl	Life.zip3L
	.globl	Life.zipWith3L
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.init
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.zip
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Life.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Life.bench:	fn_link  L36
L32:	fn_elink NanoPrelude.length
# --- block 3 ---
L36:	fn_link  Life.generations
	fn_elink Life.lastL
# --- block 4 ---
NanoPrelude.length:	fn_link  L56
	fn_link  L104
	fn_y
L56:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L64:	fn_link  L76
	fn_link  L100
	fn_combi_t8 5, 2,0,3,1,0,0
L76:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_y
# --- block 6 ---
L104:	fn_link  L64
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 7 ---
Life.lastL:	fn_link  L136
	fn_link  L124
	fn_combi_t2 3, 2,0,1,0,0,0
L124:	fn_elink _error0
# --- block 8 ---
L128:	fn_link  Life.lastL
	fn_combi_t1 4, 0,1,0,0,0,0
# --- block 9 ---
L136:	fn_link  L128
	fn_combi_t6 3, 2,1,0,2,0,0
# --- block 10 ---
Life.generations:	fn_link  L212
	fn_link  Life.disp
	fn_elink NanoPrelude.map
# --- block 11 ---
L156:	fn_link  Life.simSz
	fn_elink Life.gen
# --- block 12 ---
L164:	fn_link  Life.initial
	fn_link  L156
	fn_elink Life.iterateL
# --- block 13 ---
L176:	fn_link  L164
	fn_elink Life.limit
# --- block 14 ---
L184:	fn_link  L192
	fn_elink Life.upfrom
L192:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 15 ---
L200:	fn_link  L184
	fn_link  Life.showN
	fn_elink NanoPrelude.map
# --- block 16 ---
L212:	fn_link  L176
	fn_link  L200
	fn_elink NanoPrelude.zip
# --- block 17 ---
NanoPrelude.map:	fn_link  L252
	fn_link  L236
	fn_combi_t3 3, 0,1,2,0,0,0
L236:	fn_y
# --- block 18 ---
L240:	fn_link  L248
	fn_combi_t15 5, 0,1,3,2,4,0
L248:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L252:	fn_link  L240
	fn_link  L264
	fn_combi_t16 5, 4,0,1,2,3,0
L264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
Life.disp:	fn_link  L400
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 21 ---
L276:	fn_link  Life.star
	fn_elink NanoPrelude.map
# --- block 22 ---
L284:	fn_link  L276
	fn_link  NanoPrelude.concat
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 23 ---
L296:	fn_link  L284
	fn_elink NanoPrelude.map
# --- block 24 ---
L304:	fn_link  L316
	fn_link  L320
	fn_combi_t2 4, 3,0,1,0,0,0
L316:	fn_combi_t0 2, 0,0,0,0,0,0
L320:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 25 ---
L328:	fn_link  L296
	fn_link  L352
	fn_link  L304
	fn_link  Life.glue
	fn_link  NanoPrelude.foldr
	fn_combi_t38 6, 0,1,2,3,4,5
L352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
L356:	fn_link  L368
	fn_link  L372
	fn_combi_t2 4, 3,0,1,0,0,0
L368:	fn_combi_t0 2, 0,0,0,0,0,0
L372:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 27 ---
L380:	fn_link  L356
	fn_link  L392
	fn_combi_t2 4, 3,0,1,0,0,0
L392:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 28 ---
L400:	fn_link  L328
	fn_link  L380
	fn_link  Life.append
	fn_combi_t48 5, 0,3,0,1,2,4
# --- block 29 ---
Life.append:	fn_link  L424
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 30 ---
L424:	fn_link  Life.append
	fn_link  L436
	fn_combi_t16 5, 0,3,1,4,2,0
L436:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
NanoPrelude.foldr:	fn_link  L456
	fn_link  L452
	fn_combi_t7 4, 0,1,2,3,0,0
L452:	fn_y
# --- block 32 ---
L456:	fn_link  L464
	fn_combi_t16 5, 4,2,0,1,3,0
L464:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 33 ---
Life.glue:	fn_link  Life.append
	fn_combi_t16 4, 0,2,0,1,3,0
# --- block 34 ---
NanoPrelude.concat:	fn_link  L488
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
Data.List_Type.$2b$2b:	fn_link  L520
	fn_link  L504
	fn_combi_t5 4, 0,1,3,2,0,0
L504:	fn_y
# --- block 36 ---
L508:	fn_link  L516
	fn_combi_t6 4, 0,2,1,3,0,0
L516:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 37 ---
L520:	fn_link  L508
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 38 ---
Life.star:	fn_link  L584
	fn_link  L648
	fn_link  L548
	fn_link  L552
	fn_combi_t29 5, 4,0,1,2,4,3
L548:	fn_elink _prim_eq
L552:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 39 ---
L560:	fn_link  L572
	fn_link  L576
	fn_combi_t2 4, 3,0,1,0,0,0
L572:	fn_combi_t0 2, 0,0,0,0,0,0
L576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 40 ---
L584:	fn_link  L560
	fn_link  L596
	fn_combi_t2 4, 3,0,1,0,0,0
L596:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 41 ---
L604:	fn_link  L616
	fn_link  L620
	fn_combi_t2 4, 3,0,1,0,0,0
L616:	fn_combi_t0 2, 0,0,0,0,0,0
L620:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 42 ---
L628:	fn_link  L604
	fn_link  L640
	fn_combi_t2 4, 3,0,1,0,0,0
L640:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 43 ---
L648:	fn_link  L628
	fn_link  L668
	fn_link  L672
	fn_link  L676
	fn_combi_t10 5, 4,0,1,2,3,0
L668:	fn_elink _error0
L672:	fn_elink _prim_eq
L676:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 44 ---
NanoPrelude.zip:	fn_link  L732
	fn_link  L696
	fn_combi_t6 4, 2,0,1,3,0,0
L696:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L700:	fn_link  L708
	fn_combi_t44 6, 0,1,4,2,3,5
L708:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 46 ---
L712:	fn_link  NanoPrelude.zip
	fn_link  L728
	fn_link  L700
	fn_combi_t5 4, 0,1,3,2,0,0
L728:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 47 ---
L732:	fn_link  L712
	fn_link  L744
	fn_combi_t16 5, 2,0,1,3,4,0
L744:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 48 ---
Life.showN:	fn_link  L760
	fn_link  L920
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 49 ---
L760:	fn_link  L776
	fn_link  L780
	fn_link  L804
	fn_combi_t13 6, 5,0,3,1,2,0
L776:	fn_combi_t0 2, 0,0,0,0,0,0
L780:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L804:	fn_y
# --- block 50 ---
L808:	fn_link  L828
	fn_link  L852
	fn_link  NanoPrelude.rem
	fn_link  L860
	fn_combi_t18 5, 0,1,4,2,3,0
L828:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L852:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L860:	fn_y
# --- block 51 ---
L864:	fn_link  L876
	fn_link  L808
	fn_combi_t5 5, 4,0,2,1,0,0
L876:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 52 ---
L880:	fn_link  L900
	fn_link  NanoPrelude.quot
	fn_link  Life.showN
	fn_link  Life.append
	fn_combi_t21 5, 0,1,2,4,3,0
L900:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 53 ---
L908:	fn_link  L864
	fn_link  L880
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 54 ---
L920:	fn_link  L908
	fn_link  L936
	fn_link  L940
	fn_combi_t15 4, 0,3,1,2,3,0
L936:	fn_elink _prim_lt
L940:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 55 ---
NanoPrelude.quot:	fn_link  L960
	fn_link  L984
	fn_combi_t8 4, 0,3,2,1,0,0
L960:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L984:	fn_y
# --- block 56 ---
NanoPrelude.rem:	fn_link  L1000
	fn_link  L1024
	fn_combi_t8 4, 0,3,2,1,0,0
L1000:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1024:	fn_y
# --- block 57 ---
Life.upfrom:	fn_link  L1048
	fn_link  L1072
	fn_link  Life.upfrom
	fn_link  L1076
	fn_combi_t50 5, 0,4,1,2,4,3
L1048:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1072:	fn_y
L1076:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 58 ---
Life.limit:	fn_link  L1156
	fn_link  L1092
	fn_combi_t2 3, 2,0,1,0,0,0
L1092:	fn_elink _error0
# --- block 59 ---
L1096:	fn_link  L1104
	fn_combi_t2 4, 3,1,0,0,0,0
L1104:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 60 ---
L1108:	fn_link  Life.limit
	fn_link  L1120
	fn_combi_t49 5, 0,2,1,0,3,4
L1120:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 61 ---
L1124:	fn_link  Life.eqB
	fn_combi_t28 6, 0,1,4,2,5,3
# --- block 62 ---
L1132:	fn_link  L1124
	fn_combi_t25 5, 0,1,2,4,3,4
# --- block 63 ---
L1140:	fn_link  L1096
	fn_link  L1108
	fn_link  L1132
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 64 ---
L1156:	fn_link  L1140
	fn_link  L1168
	fn_combi_t6 4, 3,0,1,2,0,0
L1168:	fn_elink _error0
# --- block 65 ---
Life.eqB:	fn_link  L1204
	fn_link  L1224
	fn_link  L1188
	fn_combi_t40 5, 3,4,0,1,2,4
L1188:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 66 ---
L1192:	fn_link  Life.eqRow
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 67 ---
L1204:	fn_link  Life.eqB
	fn_link  L1192
	fn_link  L1220
	fn_combi_t48 6, 3,0,1,4,2,5
L1220:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 68 ---
L1224:	fn_link  L1232
	fn_combi_t0 3, 0,0,0,0,0,0
L1232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 69 ---
NanoPrelude.$26$26:	fn_link  L1244
	fn_combi_t1 2, 1,0,0,0,0,0
L1244:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 70 ---
Life.eqRow:	fn_link  L1312
	fn_link  L1328
	fn_link  L1264
	fn_combi_t40 5, 3,4,0,1,2,4
L1264:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 71 ---
L1268:	fn_link  L1288
	fn_link  L1292
	fn_link  L1296
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L1288:	fn_combi_t0 2, 1,0,0,0,0,0
L1292:	fn_combi_t0 2, 0,0,0,0,0,0
L1296:	fn_elink _prim_eq
# --- block 72 ---
L1300:	fn_link  Life.eqRow
	fn_link  L1268
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 73 ---
L1312:	fn_link  L1300
	fn_link  L1324
	fn_combi_t16 5, 2,0,1,3,4,0
L1324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 74 ---
L1328:	fn_link  L1336
	fn_combi_t0 3, 0,0,0,0,0,0
L1336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 75 ---
Life.iterateL:	fn_link  L1356
	fn_link  L1352
	fn_combi_t3 3, 0,1,2,0,0,0
L1352:	fn_y
# --- block 76 ---
L1356:	fn_link  L1364
	fn_combi_t17 4, 0,3,2,1,3,0
L1364:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 77 ---
Life.gen:	fn_link  L1384
	fn_link  Life.row
	fn_link  NanoPrelude.map
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 78 ---
L1384:	fn_link  L1400
	fn_link  Life.copy
	fn_link  Life.shift
	fn_combi_t7 4, 0,1,3,2,0,0
L1400:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 79 ---
Life.row:	fn_link  L1468
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 80 ---
L1416:	fn_link  L1436
	fn_link  Life.shift
	fn_link  Life.elt
	fn_link  Life.zipWith3L
	fn_combi_t16 5, 0,1,2,3,4,0
L1436:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 81 ---
L1444:	fn_link  L1460
	fn_link  Life.shift
	fn_link  L1416
	fn_combi_t16 5, 0,3,1,2,4,0
L1460:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 82 ---
L1468:	fn_link  L1484
	fn_link  Life.shift
	fn_link  L1444
	fn_combi_t42 6, 0,3,4,1,2,5
L1484:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 83 ---
Life.zipWith3L:	fn_link  L1584
	fn_link  L1504
	fn_combi_t3 3, 0,1,2,0,0,0
L1504:	fn_y
# --- block 84 ---
L1508:	fn_link  L1516
	fn_combi_t18 5, 0,1,2,3,4,0
L1516:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 85 ---
L1520:	fn_link  L1528
	fn_combi_t26 6, 0,1,3,5,2,4
L1528:	fn_combi_t46 6, 0,4,1,2,3,5
# --- block 86 ---
L1532:	fn_link  L1540
	fn_combi_t46 6, 1,0,2,3,4,5
L1540:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 87 ---
L1544:	fn_link  L1552
	fn_combi_t47 6, 1,0,2,3,4,5
L1552:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 88 ---
L1556:	fn_link  L1564
	fn_combi_t47 6, 1,0,2,3,5,4
L1564:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 89 ---
L1568:	fn_link  L1532
	fn_link  L1544
	fn_link  L1556
	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 90 ---
L1584:	fn_link  L1508
	fn_link  L1520
	fn_link  L1568
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 91 ---
Life.elt:	fn_link  L2024
	fn_link  L1616
	fn_link  L1620
	fn_combi_t53 6, 3,0,4,1,5,2
L1616:	fn_combi_t51 6, 0,1,2,3,4,5
L1620:	fn_combi_t54 6, 0,1,2,3,4,5
# --- block 92 ---
L1624:	fn_link  L1636
	fn_link  L1660
	fn_combi_t55 5, 4,0,3,2,1,1
L1636:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1660:	fn_y
# --- block 93 ---
L1664:	fn_link  L1672
	fn_combi_t35 4, 0,3,0,1,2,2
L1672:	fn_y
# --- block 94 ---
L1676:	fn_link  L1692
	fn_link  L1624
	fn_link  L1664
	fn_combi_t32 6, 0,1,3,4,5,2
L1692:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 95 ---
L1716:	fn_link  L1724
	fn_combi_t61 5, 0,4,0,3,1,2
L1724:	fn_y
# --- block 96 ---
L1728:	fn_link  L1716
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 97 ---
L1736:	fn_link  L1752
	fn_link  L1676
	fn_link  L1728
	fn_combi_t5 4, 0,1,3,2,0,0
L1752:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 98 ---
L1776:	fn_link  L1784
	fn_combi_t55 5, 4,0,3,1,2,2
L1784:	fn_y
# --- block 99 ---
L1788:	fn_link  L1776
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 100 ---
L1796:	fn_link  L1812
	fn_link  L1736
	fn_link  L1788
	fn_combi_t32 6, 0,1,3,4,5,2
L1812:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 101 ---
L1836:	fn_link  L1852
	fn_link  L1860
	fn_link  L1864
	fn_combi_t10 5, 0,4,1,3,2,0
L1852:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1860:	fn_elink _prim_eq
L1864:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 102 ---
L1872:	fn_link  L1892
	fn_link  L1896
	fn_link  L1900
	fn_link  L1904
	fn_combi_t10 5, 0,4,1,2,3,0
L1892:	fn_combi_t0 2, 1,0,0,0,0,0
L1896:	fn_combi_t0 2, 0,0,0,0,0,0
L1900:	fn_elink _prim_gt
L1904:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 103 ---
L1912:	fn_link  L1936
	fn_link  L1940
	fn_link  L1944
	fn_link  L1948
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,1,5,2,3,4
L1936:	fn_combi_t0 2, 1,0,0,0,0,0
L1940:	fn_combi_t0 2, 0,0,0,0,0,0
L1944:	fn_elink _prim_lt
L1948:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 104 ---
L1956:	fn_link  L1872
	fn_link  L1912
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 105 ---
L1968:	fn_link  L1836
	fn_link  L1956
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 106 ---
L1980:	fn_link  L2000
	fn_link  L2004
	fn_link  L1968
	fn_link  L2012
	fn_combi_t10 5, 0,1,4,2,3,0
L2000:	fn_y
L2004:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2012:	fn_combi_t35 6, 0,2,3,4,5,1
# --- block 107 ---
L2016:	fn_link  L1980
	fn_combi_t46 6, 0,3,1,2,4,5
# --- block 108 ---
L2024:	fn_link  L1796
	fn_link  L2016
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 109 ---
NanoPrelude.$7c$7c:	fn_link  L2044
	fn_combi_t2 3, 1,2,0,0,0,0
L2044:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 110 ---
Life.shift:	fn_link  Life.shiftl
	fn_link  L2060
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 111 ---
L2060:	fn_link  Life.shiftr
	fn_link  Life.zip3L
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 112 ---
Life.zip3L:	fn_link  L2112
	fn_link  L2132
	fn_link  L2144
	fn_link  L2156
	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 113 ---
L2092:	fn_link  L2100
	fn_combi_t46 6, 0,1,2,3,4,5
L2100:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 114 ---
L2104:	fn_link  L2092
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 115 ---
L2112:	fn_link  Life.zip3L
	fn_link  L2128
	fn_link  L2104
	fn_combi_t26 6, 0,1,3,5,2,4
L2128:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 116 ---
L2132:	fn_link  L2140
	fn_combi_t46 6, 1,0,2,3,4,5
L2140:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 117 ---
L2144:	fn_link  L2152
	fn_combi_t47 6, 1,0,2,3,4,5
L2152:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 118 ---
L2156:	fn_link  L2164
	fn_combi_t47 6, 1,0,2,3,5,4
L2164:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 119 ---
Life.shiftr:	fn_link  NanoPrelude.init
	fn_link  L2184
	fn_link  Life.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 120 ---
L2184:	fn_link  L2192
	fn_combi_t2 4, 3,1,0,0,0,0
L2192:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 121 ---
NanoPrelude.init:	fn_link  L2228
	fn_link  L2208
	fn_combi_t2 3, 2,0,1,0,0,0
L2208:	fn_elink _error0
# --- block 122 ---
L2212:	fn_link  NanoPrelude.init
	fn_link  L2224
	fn_combi_t6 6, 0,2,1,3,0,0
L2224:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 123 ---
L2228:	fn_link  L2212
	fn_link  L2240
	fn_combi_t16 4, 3,0,1,2,3,0
L2240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 124 ---
Life.shiftl:	fn_link  L2260
	fn_link  Life.tailL
	fn_link  Life.append
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 125 ---
L2260:	fn_link  L2268
	fn_combi_t2 4, 3,1,0,0,0,0
L2268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 126 ---
Life.tailL:	fn_link  L2284
	fn_link  L2288
	fn_combi_t2 3, 2,0,1,0,0,0
L2284:	fn_combi_t0 2, 1,0,0,0,0,0
L2288:	fn_elink _error0
# --- block 127 ---
Life.copy:	fn_link  L2308
	fn_link  L2356
	fn_link  L2372
	fn_combi_t10 4, 0,1,3,2,3,0
L2308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 128 ---
L2312:	fn_link  L2328
	fn_link  L2352
	fn_link  Life.copy
	fn_combi_t8 4, 0,1,3,2,0,0
L2328:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2352:	fn_y
# --- block 129 ---
L2356:	fn_link  L2312
	fn_link  L2368
	fn_combi_t16 4, 0,3,1,2,3,0
L2368:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 130 ---
L2372:	fn_link  L2384
	fn_link  L2388
	fn_combi_t29 6, 0,4,1,2,5,3
L2384:	fn_elink _prim_eq
L2388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 131 ---
Life.simSz:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 132 ---
Life.initial:	fn_link  L2504
	fn_link  Life.simSz
	fn_elink Life.takeL
# --- block 133 ---
L2416:	fn_link  L2428
	fn_link  Life.simSz
	fn_elink Life.copy
L2428:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 134 ---
L2436:	fn_link  L2416
	fn_link  Life.simSz
	fn_elink Life.copy
# --- block 135 ---
L2448:	fn_link  L2468
	fn_link  Life.simSz
	fn_link  Life.copy
	fn_link  Life.append
	fn_combi_t16 5, 0,4,1,2,3,0
L2468:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 136 ---
L2476:	fn_link  L2448
	fn_link  Life.simSz
	fn_link  Life.takeL
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 137 ---
L2492:	fn_link  Life.start
	fn_link  L2476
	fn_elink NanoPrelude.map
# --- block 138 ---
L2504:	fn_link  L2436
	fn_link  L2492
	fn_elink Life.append
# --- block 139 ---
Life.takeL:	fn_link  L2532
	fn_link  L2580
	fn_link  L2596
	fn_combi_t24 5, 0,1,3,3,4,2
L2532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 140 ---
L2536:	fn_link  L2552
	fn_link  L2576
	fn_link  Life.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L2552:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2576:	fn_y
# --- block 141 ---
L2580:	fn_link  L2536
	fn_link  L2592
	fn_combi_t16 5, 0,3,1,2,4,0
L2592:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 142 ---
L2596:	fn_link  L2612
	fn_link  L2616
	fn_link  L2620
	fn_combi_t44 6, 0,4,1,5,2,3
L2612:	fn_combi_t0 2, 0,0,0,0,0,0
L2616:	fn_elink _prim_le
L2620:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 143 ---
Life.start:	fn_link  L3396
	fn_link  L2640
	fn_combi_t2 4, 3,0,1,0,0,0
L2640:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 144 ---
L2644:	fn_link  L2656
	fn_link  L2660
	fn_combi_t2 4, 3,0,1,0,0,0
L2656:	fn_combi_t0 2, 0,0,0,0,0,0
L2660:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 145 ---
L2668:	fn_link  L2644
	fn_link  L2680
	fn_combi_t2 4, 3,0,1,0,0,0
L2680:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 146 ---
L2688:	fn_link  L2668
	fn_link  L2700
	fn_combi_t2 4, 3,0,1,0,0,0
L2700:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 147 ---
L2708:	fn_link  L2688
	fn_link  L2720
	fn_combi_t2 4, 3,0,1,0,0,0
L2720:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 148 ---
L2728:	fn_link  L2708
	fn_link  L2740
	fn_combi_t2 4, 3,0,1,0,0,0
L2740:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 149 ---
L2748:	fn_link  L2728
	fn_link  L2760
	fn_combi_t2 4, 3,0,1,0,0,0
L2760:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 150 ---
L2768:	fn_link  L2748
	fn_link  L2780
	fn_combi_t2 4, 3,0,1,0,0,0
L2780:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 151 ---
L2788:	fn_link  L2768
	fn_link  L2800
	fn_combi_t2 4, 3,0,1,0,0,0
L2800:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 152 ---
L2808:	fn_link  L2788
	fn_link  L2820
	fn_combi_t2 4, 3,0,1,0,0,0
L2820:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 153 ---
L2828:	fn_link  L2808
	fn_link  L2840
	fn_combi_t2 4, 3,0,1,0,0,0
L2840:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 154 ---
L2848:	fn_link  L2828
	fn_link  L2860
	fn_combi_t2 4, 3,0,1,0,0,0
L2860:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 155 ---
L2868:	fn_link  L2848
	fn_link  L2880
	fn_combi_t2 4, 3,0,1,0,0,0
L2880:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 156 ---
L2888:	fn_link  L2868
	fn_link  L2900
	fn_combi_t2 4, 3,0,1,0,0,0
L2900:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 157 ---
L2908:	fn_link  L2888
	fn_link  L2920
	fn_combi_t2 4, 3,0,1,0,0,0
L2920:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 158 ---
L2928:	fn_link  L2908
	fn_link  L2940
	fn_combi_t2 4, 3,0,1,0,0,0
L2940:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 159 ---
L2948:	fn_link  L2928
	fn_link  L2960
	fn_combi_t2 4, 3,0,1,0,0,0
L2960:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 160 ---
L2968:	fn_link  L2948
	fn_link  L2980
	fn_combi_t2 4, 3,0,1,0,0,0
L2980:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 161 ---
L2988:	fn_link  L2968
	fn_link  L3000
	fn_combi_t2 4, 3,0,1,0,0,0
L3000:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 162 ---
L3008:	fn_link  L2988
	fn_link  L3020
	fn_combi_t2 4, 3,0,1,0,0,0
L3020:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 163 ---
L3028:	fn_link  L3008
	fn_link  L3040
	fn_combi_t2 4, 3,0,1,0,0,0
L3040:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 164 ---
L3048:	fn_link  L3028
	fn_link  L3060
	fn_combi_t2 4, 3,0,1,0,0,0
L3060:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 165 ---
L3068:	fn_link  L3048
	fn_link  L3080
	fn_combi_t2 4, 3,0,1,0,0,0
L3080:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 166 ---
L3088:	fn_link  L3068
	fn_link  L3100
	fn_combi_t2 4, 3,0,1,0,0,0
L3100:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 167 ---
L3108:	fn_link  L3088
	fn_link  L3120
	fn_combi_t2 4, 3,0,1,0,0,0
L3120:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 168 ---
L3128:	fn_link  L3108
	fn_link  L3140
	fn_combi_t2 4, 3,0,1,0,0,0
L3140:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 169 ---
L3148:	fn_link  L3128
	fn_link  L3160
	fn_combi_t2 4, 3,0,1,0,0,0
L3160:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 170 ---
L3168:	fn_link  L3148
	fn_link  L3180
	fn_combi_t2 4, 3,0,1,0,0,0
L3180:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 171 ---
L3188:	fn_link  L3200
	fn_link  L3168
	fn_combi_t2 4, 3,0,1,0,0,0
L3200:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 172 ---
L3204:	fn_link  L3188
	fn_link  L3216
	fn_combi_t2 4, 3,0,1,0,0,0
L3216:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 173 ---
L3220:	fn_link  L3204
	fn_link  L3232
	fn_combi_t2 4, 3,0,1,0,0,0
L3232:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 174 ---
L3236:	fn_link  L3220
	fn_link  L3248
	fn_combi_t2 4, 3,0,1,0,0,0
L3248:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 175 ---
L3252:	fn_link  L3236
	fn_link  L3264
	fn_combi_t2 4, 3,0,1,0,0,0
L3264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 176 ---
L3268:	fn_link  L3252
	fn_link  L3280
	fn_combi_t2 4, 3,0,1,0,0,0
L3280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 177 ---
L3284:	fn_link  L3268
	fn_link  L3296
	fn_combi_t2 4, 3,0,1,0,0,0
L3296:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 178 ---
L3300:	fn_link  L3284
	fn_link  L3312
	fn_combi_t2 4, 3,0,1,0,0,0
L3312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 179 ---
L3316:	fn_link  L3300
	fn_link  L3328
	fn_combi_t2 4, 3,0,1,0,0,0
L3328:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 180 ---
L3332:	fn_link  L3316
	fn_link  L3344
	fn_combi_t2 4, 3,0,1,0,0,0
L3344:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 181 ---
L3348:	fn_link  L3332
	fn_link  L3360
	fn_combi_t2 4, 3,0,1,0,0,0
L3360:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 182 ---
L3364:	fn_link  L3348
	fn_link  L3376
	fn_combi_t2 4, 3,0,1,0,0,0
L3376:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 183 ---
L3380:	fn_link  L3364
	fn_link  L3392
	fn_combi_t2 4, 3,0,1,0,0,0
L3392:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 184 ---
L3396:	fn_link  L3380
	fn_link  L3408
	fn_combi_t2 4, 3,0,1,0,0,0
L3408:	fn_combi_t0 2, 0,0,0,0,0,0

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
