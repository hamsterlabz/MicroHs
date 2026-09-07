# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Mandel  (entry @0)
	.text
	.globl	Mandel.Pixmap
	.globl	Mandel.addC
	.globl	Mandel.bench
	.globl	Mandel.diverge
	.globl	Mandel.fromTo
	.globl	Mandel.hashPix
	.globl	Mandel.magnitude
	.globl	Mandel.mandel
	.globl	Mandel.mandelset
	.globl	Mandel.mulC
	.globl	Mandel.parallelMandel
	.globl	Mandel.takeL
	.globl	Mandel.whenDiverge
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.$3c$3d.
	.globl	NanoPrelude.$3e.
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.map
	.globl	NanoPrelude.maxD
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Mandel.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Mandel.bench:	fn_link  L76
	fn_elink Mandel.hashPix
# --- block 3 ---
L36:	fn_link  L44
	fn_elink _prim_itof
L44:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 4 ---
L52:	fn_link  L68
	fn_link  L72
	fn_link  Mandel.mandelset
	fn_combi_t29 4, 0,1,3,2,3,3
L68:	fn_elink _prim_fneg
L72:	fn_elink _prim_fneg
# --- block 5 ---
L76:	fn_link  L36
	fn_link  L100
	fn_link  L108
	fn_link  L116
	fn_link  L52
	fn_combi_t23 5, 0,4,4,1,2,3
L100:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
L108:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L116:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 6 ---
Mandel.hashPix:	fn_link  L612
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 7 ---
L132:	fn_link  L152
	fn_link  L176
	fn_link  L200
	fn_link  L208
	fn_combi_t55 6, 5,0,1,4,2,3
L152:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L176:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L200:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L208:	fn_y
# --- block 8 ---
L212:	fn_link  L224
	fn_link  L232
	fn_combi_t61 5, 0,1,0,2,4,3
L224:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L232:	fn_y
# --- block 9 ---
L236:	fn_link  L256
	fn_link  L280
	fn_link  L132
	fn_link  L212
	fn_combi_t24 6, 0,1,4,2,5,3
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
# --- block 10 ---
L304:	fn_link  L324
	fn_link  L348
	fn_link  L372
	fn_link  L380
	fn_combi_t55 6, 5,0,1,4,2,3
L324:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L348:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L372:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L380:	fn_y
# --- block 11 ---
L384:	fn_link  L396
	fn_link  L404
	fn_combi_t61 5, 0,1,0,2,4,3
L396:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L404:	fn_y
# --- block 12 ---
L408:	fn_link  L428
	fn_link  L452
	fn_link  L304
	fn_link  L384
	fn_combi_t24 6, 0,1,4,2,5,3
L428:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L452:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 13 ---
L476:	fn_link  L488
	fn_link  L496
	fn_combi_t61 5, 0,1,0,4,2,3
L488:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L496:	fn_y
# --- block 14 ---
L500:	fn_link  L516
	fn_link  L408
	fn_link  L476
	fn_combi_t12 5, 0,1,3,4,2,0
L516:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 15 ---
L540:	fn_link  L548
	fn_combi_t60 6, 0,5,1,3,4,2
L548:	fn_y
# --- block 16 ---
L552:	fn_link  L568
	fn_link  L500
	fn_link  L540
	fn_combi_t19 5, 4,0,1,3,2,0
L568:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 17 ---
L592:	fn_link  L608
	fn_link  L552
	fn_link  NanoPrelude.foldl
	fn_combi_t50 6, 0,1,2,5,3,4
L608:	fn_y
# --- block 18 ---
L612:	fn_link  L236
	fn_link  L592
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 19 ---
NanoPrelude.foldl:	fn_link  L640
	fn_link  L636
	fn_combi_t3 3, 0,1,2,0,0,0
L636:	fn_y
# --- block 20 ---
L640:	fn_link  L648
	fn_combi_t46 5, 4,3,0,1,2,3
L648:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 21 ---
Mandel.mandelset:	fn_link  L668
	fn_link  L1176
	fn_link  L1336
	fn_combi_t5 4, 0,1,3,2,0,0
L668:	fn_elink _prim_itof
# --- block 22 ---
L672:	fn_link  NanoPrelude.$2d.
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 23 ---
L680:	fn_link  NanoPrelude.$2d.
	fn_link  NanoPrelude.maxD
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 24 ---
L692:	fn_link  L672
	fn_link  L680
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 25 ---
L704:	fn_link  NanoPrelude.$2d.
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 6, 0,4,5,1,3,2
# --- block 26 ---
L716:	fn_link  NanoPrelude.$2f.
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 27 ---
L724:	fn_link  L740
	fn_link  L704
	fn_link  L716
	fn_combi_t12 5, 0,1,3,4,2,0
L740:	fn_elink _prim_itof
# --- block 28 ---
L744:	fn_link  NanoPrelude.$2d.
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 6, 0,4,5,1,3,2
# --- block 29 ---
L756:	fn_link  NanoPrelude.$2f.
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 30 ---
L764:	fn_link  L780
	fn_link  L744
	fn_link  L756
	fn_combi_t12 5, 0,1,3,4,2,0
L780:	fn_elink _prim_itof
# --- block 31 ---
L784:	fn_link  NanoPrelude.$2b.
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 32 ---
L792:	fn_link  L764
	fn_link  L784
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 33 ---
L804:	fn_link  L812
	fn_combi_t24 6, 0,1,5,2,3,4
L812:	fn_combi_t48 6, 5,0,1,2,3,4
# --- block 34 ---
L816:	fn_link  L804
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 35 ---
L824:	fn_link  NanoPrelude.$2b.
	fn_link  L792
	fn_link  L816
	fn_combi_t26 6, 0,1,3,5,2,4
# --- block 36 ---
L840:	fn_link  L848
	fn_combi_t40 6, 0,1,2,4,3,5
L848:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 37 ---
L852:	fn_link  L824
	fn_link  L840
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 38 ---
L864:	fn_link  L872
	fn_combi_t40 6, 0,1,4,2,3,5
L872:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 39 ---
L876:	fn_link  L864
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 40 ---
L884:	fn_link  L876
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 41 ---
L892:	fn_link  L724
	fn_link  L852
	fn_link  L884
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 42 ---
L908:	fn_link  L916
	fn_combi_t51 6, 0,1,2,3,4,5
L916:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 43 ---
L920:	fn_link  L892
	fn_link  L908
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 44 ---
L932:	fn_link  L940
	fn_combi_t44 6, 0,1,5,2,3,4
L940:	fn_y
# --- block 45 ---
L944:	fn_link  L932
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 46 ---
L952:	fn_link  L944
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 47 ---
L960:	fn_link  L952
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 48 ---
L968:	fn_link  L960
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 49 ---
L976:	fn_link  L968
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 50 ---
L984:	fn_link  L976
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 51 ---
L992:	fn_link  L1012
	fn_link  Mandel.fromTo
	fn_link  L920
	fn_link  L984
	fn_combi_t26 6, 0,1,4,5,2,3
L1012:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 52 ---
L1020:	fn_link  L1028
	fn_combi_t46 6, 5,0,1,2,3,4
L1028:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 53 ---
L1032:	fn_link  L1020
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 54 ---
L1040:	fn_link  L992
	fn_link  L1032
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 55 ---
L1052:	fn_link  L1060
	fn_combi_t44 6, 0,1,5,2,3,4
L1060:	fn_y
# --- block 56 ---
L1064:	fn_link  L1052
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 57 ---
L1072:	fn_link  L1064
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 58 ---
L1080:	fn_link  L1072
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 59 ---
L1088:	fn_link  L1108
	fn_link  Mandel.fromTo
	fn_link  L1040
	fn_link  L1080
	fn_combi_t10 5, 0,1,4,2,3,0
L1108:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 60 ---
L1116:	fn_link  Mandel.parallelMandel
	fn_combi_t26 6, 0,1,3,5,4,2
# --- block 61 ---
L1124:	fn_link  L1116
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 62 ---
L1132:	fn_link  L1124
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 63 ---
L1140:	fn_link  L1132
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 64 ---
L1148:	fn_link  L1140
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 65 ---
L1156:	fn_link  L692
	fn_link  NanoPrelude.$2f.
	fn_link  L1088
	fn_link  L1148
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 66 ---
L1176:	fn_link  L1196
	fn_link  L1204
	fn_link  L1156
	fn_link  L1208
	fn_combi_t10 5, 0,1,4,2,3,0
L1196:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1204:	fn_elink _prim_itof
L1208:	fn_combi_t23 6, 0,3,4,5,1,2
# --- block 67 ---
L1212:	fn_link  L1224
	fn_link  L1248
	fn_combi_t8 4, 0,3,2,1,0,0
L1224:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1248:	fn_y
# --- block 68 ---
L1252:	fn_link  L1212
	fn_link  L1268
	fn_link  L1272
	fn_combi_t49 5, 0,4,1,2,3,4
L1268:	fn_combi_t0 1, 0,0,0,0,0,0
L1272:	fn_combi_t4 3, 2,0,1,1,0,0
# --- block 69 ---
L1276:	fn_link  L1252
	fn_link  NanoPrelude.map
	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 70 ---
L1288:	fn_link  L1276
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 71 ---
L1296:	fn_link  Mandel.Pixmap
	fn_combi_t37 6, 0,1,2,4,3,5
# --- block 72 ---
L1304:	fn_link  L1296
	fn_link  L1316
	fn_combi_t3 3, 0,1,2,0,0,0
L1316:	fn_combi_t25 5, 0,1,2,4,4,3
# --- block 73 ---
L1320:	fn_link  L1304
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 74 ---
L1328:	fn_link  L1320
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 75 ---
L1336:	fn_link  L1288
	fn_link  L1328
	fn_combi_t33 6, 0,1,2,4,5,3
# --- block 76 ---
Mandel.Pixmap:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 77 ---
NanoPrelude.map:	fn_link  L1380
	fn_link  L1364
	fn_combi_t3 3, 0,1,2,0,0,0
L1364:	fn_y
# --- block 78 ---
L1368:	fn_link  L1376
	fn_combi_t15 5, 0,1,3,2,4,0
L1376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 79 ---
L1380:	fn_link  L1368
	fn_link  L1392
	fn_combi_t16 5, 4,0,1,2,3,0
L1392:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 80 ---
Mandel.parallelMandel:	fn_link  Mandel.whenDiverge
	fn_link  NanoPrelude.map
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 81 ---
Mandel.whenDiverge:	fn_link  Mandel.mandel
	fn_link  Mandel.takeL
	fn_link  L1492
	fn_link  L1508
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 82 ---
L1428:	fn_link  L1440
	fn_link  L1464
	fn_combi_t7 4, 0,2,3,1,0,0
L1440:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1464:	fn_y
# --- block 83 ---
L1468:	fn_link  Mandel.diverge
	fn_combi_t28 6, 0,4,1,2,5,3
# --- block 84 ---
L1476:	fn_link  L1484
	fn_combi_t47 5, 4,0,1,2,3,0
L1484:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 85 ---
L1492:	fn_link  L1428
	fn_link  L1468
	fn_link  L1476
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 86 ---
L1508:	fn_link  L1516
	fn_combi_t48 6, 0,1,2,3,4,5
L1516:	fn_y
# --- block 87 ---
Mandel.diverge:	fn_link  Mandel.magnitude
	fn_link  NanoPrelude.$3e.
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 88 ---
NanoPrelude.$3e.:	fn_link  L1540
	fn_combi_t3 3, 2,1,0,0,0,0
L1540:	fn_elink _prim_fgt
# --- block 89 ---
Mandel.magnitude:	fn_link  L1576
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 90 ---
L1552:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 91 ---
L1560:	fn_link  L1552
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 5, 0,1,3,3,2,4
# --- block 92 ---
L1576:	fn_link  L1592
	fn_link  L1560
	fn_link  L1596
	fn_combi_t19 5, 0,1,2,3,4,0
L1592:	fn_combi_t0 1, 0,0,0,0,0,0
L1596:	fn_elink _prim_fsqrt
# --- block 93 ---
NanoPrelude.$2b.:	fn_link  L1612
	fn_link  L1616
	fn_combi_t8 4, 0,3,2,1,0,0
L1612:	fn_elink _prim_fadd
L1616:	fn_y
# --- block 94 ---
NanoPrelude.$2a.:	fn_link  L1632
	fn_link  L1636
	fn_combi_t8 4, 0,3,2,1,0,0
L1632:	fn_elink _prim_fmul
L1636:	fn_y
# --- block 95 ---
Mandel.takeL:	fn_link  L1656
	fn_link  L1704
	fn_link  L1720
	fn_combi_t24 5, 0,1,3,3,4,2
L1656:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 96 ---
L1660:	fn_link  L1676
	fn_link  L1700
	fn_link  Mandel.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L1676:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1700:	fn_y
# --- block 97 ---
L1704:	fn_link  L1660
	fn_link  L1716
	fn_combi_t16 5, 0,3,1,2,4,0
L1716:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 98 ---
L1720:	fn_link  L1736
	fn_link  L1740
	fn_link  L1744
	fn_combi_t44 6, 0,4,1,5,2,3
L1736:	fn_combi_t0 2, 0,0,0,0,0,0
L1740:	fn_elink _prim_le
L1744:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 99 ---
Mandel.mandel:	fn_link  L1780
	fn_link  L1764
	fn_combi_t3 3, 0,1,2,0,0,0
L1764:	fn_y
# --- block 100 ---
L1768:	fn_link  Mandel.mulC
	fn_link  Mandel.addC
	fn_combi_t12 4, 0,1,3,3,2,0
# --- block 101 ---
L1780:	fn_link  L1768
	fn_link  NanoPrelude.map
	fn_link  L1796
	fn_combi_t47 5, 0,3,1,2,3,4
L1796:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 102 ---
Mandel.addC:	fn_link  L1816
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 103 ---
L1808:	fn_link  NanoPrelude.$2b.
	fn_combi_t40 6, 5,0,1,3,2,4
# --- block 104 ---
L1816:	fn_link  NanoPrelude.$2b.
	fn_link  L1808
	fn_combi_t20 5, 2,0,3,1,4,0
# --- block 105 ---
Mandel.mulC:	fn_link  L1912
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 106 ---
L1836:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 6, 0,1,2,5,3,4
# --- block 107 ---
L1848:	fn_link  NanoPrelude.$2a.
	fn_link  L1836
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 108 ---
L1860:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t54 6, 5,0,1,2,3,4
# --- block 109 ---
L1872:	fn_link  NanoPrelude.$2a.
	fn_link  L1860
	fn_link  L1888
	fn_combi_t40 6, 0,1,3,5,2,4
L1888:	fn_combi_t38 5, 0,1,3,4,2,3
# --- block 110 ---
L1892:	fn_link  L1848
	fn_link  L1872
	fn_link  L1908
	fn_combi_t15 4, 0,1,3,2,3,0
L1908:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 111 ---
L1912:	fn_link  L1892
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 112 ---
NanoPrelude.$2d.:	fn_link  L1932
	fn_link  L1936
	fn_combi_t8 4, 0,3,2,1,0,0
L1932:	fn_elink _prim_fsub
L1936:	fn_y
# --- block 113 ---
NanoPrelude.$2f.:	fn_link  L1952
	fn_link  L1956
	fn_combi_t8 4, 0,3,2,1,0,0
L1952:	fn_elink _prim_fdiv
L1956:	fn_y
# --- block 114 ---
Mandel.fromTo:	fn_link  L1976
	fn_link  L2024
	fn_link  L2040
	fn_combi_t10 4, 0,1,3,2,3,0
L1976:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 115 ---
L1980:	fn_link  L1996
	fn_link  L2020
	fn_link  Mandel.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L1996:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2020:	fn_y
# --- block 116 ---
L2024:	fn_link  L1980
	fn_link  L2036
	fn_combi_t16 4, 0,2,1,2,3,0
L2036:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 117 ---
L2040:	fn_link  L2048
	fn_combi_t29 5, 4,3,0,1,4,2
L2048:	fn_elink _prim_gt
# --- block 118 ---
NanoPrelude.maxD:	fn_link  L2064
	fn_link  L2068
	fn_combi_t3 3, 0,1,2,0,0,0
L2064:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 119 ---
L2068:	fn_link  NanoPrelude.$3c$3d.
	fn_combi_t9 3, 0,1,2,1,2,0
# --- block 120 ---
NanoPrelude.$3c$3d.:	fn_link  L2084
	fn_combi_t3 3, 2,1,0,0,0,0
L2084:	fn_elink _prim_fle

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
