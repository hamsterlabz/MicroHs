# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Fish  (entry @0)
	.text
	.globl	Fish.above
	.globl	Fish.append
	.globl	Fish.bench
	.globl	Fish.beside
	.globl	Fish.corner1
	.globl	Fish.corner2
	.globl	Fish.cycle$27
	.globl	Fish.fmt
	.globl	Fish.grid
	.globl	Fish.nil
	.globl	Fish.p
	.globl	Fish.p_tile
	.globl	Fish.pseudocorner
	.globl	Fish.pseudolimit
	.globl	Fish.q
	.globl	Fish.q_tile
	.globl	Fish.quartet
	.globl	Fish.r
	.globl	Fish.r_tile
	.globl	Fish.rot
	.globl	Fish.s
	.globl	Fish.s_tile
	.globl	Fish.scale_vec2
	.globl	Fish.showI
	.globl	Fish.showTup
	.globl	Fish.side1
	.globl	Fish.side2
	.globl	Fish.t
	.globl	Fish.tile_to_grid
	.globl	Fish.tup2
	.globl	Fish.u
	.globl	Fish.vec_add
	.globl	Fish.vec_sub
	.globl	NanoPrelude.length
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Fish.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Fish.bench:	fn_link  L136
	fn_elink NanoPrelude.length
# --- block 3 ---
L36:	fn_link  L48
L40:	fn_link  L56
L44:	fn_combi_t2 3, 2,0,1,0,0,0
L48:	fn_box
	.word 0x00000280	# raw word 640
	fn_box_body
L56:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L64:	fn_link  L76
	fn_link  L84
	fn_combi_t2 3, 2,0,1,0,0,0
L76:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L84:	fn_box
	.word 0x00000280	# raw word 640
	fn_box_body
# --- block 5 ---
L92:	fn_link  L104
	fn_link  L112
	fn_combi_t2 3, 2,0,1,0,0,0
L104:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
L120:	fn_link  L36
	fn_link  L64
	fn_link  L92
	fn_elink Fish.pseudolimit
# --- block 7 ---
L136:	fn_link  L120
	fn_elink Fish.fmt
# --- block 8 ---
NanoPrelude.length:	fn_link  L156
	fn_link  L204
	fn_y
L156:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 9 ---
L164:	fn_link  L176
	fn_link  L200
	fn_combi_t8 5, 2,0,3,1,0,0
L176:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L200:	fn_y
# --- block 10 ---
L204:	fn_link  L164
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 11 ---
Fish.fmt:	fn_link  L400
	fn_link  L440
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 12 ---
L224:	fn_link  Fish.showTup
	fn_link  Fish.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 13 ---
L236:	fn_link  L248
	fn_link  L252
	fn_combi_t2 4, 3,0,1,0,0,0
L248:	fn_combi_t0 2, 0,0,0,0,0,0
L252:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 14 ---
L260:	fn_link  L236
	fn_link  L272
	fn_combi_t2 4, 3,0,1,0,0,0
L272:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 15 ---
L280:	fn_link  L224
	fn_link  L260
	fn_link  Fish.append
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 16 ---
L296:	fn_link  L308
	fn_link  L312
	fn_combi_t2 4, 3,0,1,0,0,0
L308:	fn_combi_t0 2, 0,0,0,0,0,0
L312:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 17 ---
L320:	fn_link  L280
	fn_link  L296
	fn_combi_t6 4, 3,0,1,2,0,0
# --- block 18 ---
L332:	fn_link  L320
	fn_link  L352
	fn_link  Fish.showTup
	fn_link  Fish.append
	fn_combi_t44 6, 0,1,4,2,3,5
L352:	fn_y
# --- block 19 ---
L356:	fn_link  L368
	fn_link  L372
	fn_combi_t2 4, 3,0,1,0,0,0
L368:	fn_combi_t0 2, 0,0,0,0,0,0
L372:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 20 ---
L380:	fn_link  L356
	fn_link  L392
	fn_combi_t2 4, 3,0,1,0,0,0
L392:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 21 ---
L400:	fn_link  L332
	fn_link  L380
	fn_link  Fish.append
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 22 ---
L416:	fn_link  L428
	fn_link  L432
	fn_combi_t2 4, 3,0,1,0,0,0
L428:	fn_combi_t0 2, 0,0,0,0,0,0
L432:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 23 ---
L440:	fn_link  L416
	fn_link  L452
	fn_combi_t2 4, 3,0,1,0,0,0
L452:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 24 ---
Fish.append:	fn_link  L468
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 25 ---
L468:	fn_link  Fish.append
	fn_link  L480
	fn_combi_t16 5, 0,3,1,4,2,0
L480:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
Fish.showTup:	fn_link  L688
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 27 ---
L492:	fn_link  L504
	fn_link  L508
	fn_combi_t2 4, 3,0,1,0,0,0
L504:	fn_combi_t0 2, 0,0,0,0,0,0
L508:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 28 ---
L516:	fn_link  L492
	fn_link  Fish.showI
	fn_link  Fish.append
	fn_link  L540
	fn_link  L548
	fn_combi_t47 6, 0,1,2,3,5,4
L540:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L548:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 29 ---
L552:	fn_link  L516
	fn_link  Fish.showI
	fn_link  Fish.append
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 30 ---
L568:	fn_link  L552
	fn_link  L584
	fn_link  L592
	fn_combi_t16 5, 0,1,2,3,4,0
L584:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L592:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
L596:	fn_link  L568
	fn_link  Fish.showI
	fn_link  Fish.append
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 32 ---
L612:	fn_link  L596
	fn_link  L628
	fn_link  L636
	fn_combi_t46 6, 0,1,2,3,4,5
L628:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
L636:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 33 ---
L640:	fn_link  Fish.showI
	fn_link  Fish.append
	fn_combi_t44 6, 0,1,2,3,4,5
# --- block 34 ---
L652:	fn_link  L612
	fn_link  L640
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 35 ---
L664:	fn_link  L676
	fn_link  L684
	fn_combi_t46 6, 0,1,2,3,4,5
L676:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
L684:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L688:	fn_link  L652
	fn_link  L664
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 37 ---
Fish.showI:	fn_link  L908
	fn_link  L720
	fn_link  L920
	fn_link  L1012
	fn_combi_t39 5, 0,4,1,4,2,3
L720:	fn_y
# --- block 38 ---
L724:	fn_link  L740
	fn_link  L744
	fn_link  L768
	fn_combi_t13 6, 5,0,3,1,2,0
L740:	fn_combi_t0 2, 0,0,0,0,0,0
L744:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L768:	fn_y
# --- block 39 ---
L772:	fn_link  L792
	fn_link  L816
	fn_link  NanoPrelude.rem
	fn_link  L824
	fn_combi_t18 5, 0,1,4,2,3,0
L792:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L816:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L824:	fn_y
# --- block 40 ---
L828:	fn_link  L840
	fn_link  L772
	fn_combi_t5 5, 4,0,2,1,0,0
L840:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
L844:	fn_link  L860
	fn_link  NanoPrelude.quot
	fn_link  Fish.append
	fn_combi_t21 5, 0,3,1,4,2,0
L860:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 42 ---
L868:	fn_link  L828
	fn_link  L844
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 43 ---
L880:	fn_link  L868
	fn_link  L896
	fn_link  L900
	fn_combi_t44 5, 0,4,1,2,3,4
L896:	fn_elink _prim_lt
L900:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 44 ---
L908:	fn_link  L724
	fn_link  L880
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 45 ---
L920:	fn_link  L936
	fn_link  L960
	fn_link  L968
	fn_combi_t22 5, 4,0,3,1,2,0
L936:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L960:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L968:	fn_y
# --- block 46 ---
L972:	fn_link  L984
	fn_link  L988
	fn_combi_t15 4, 0,2,1,3,2,0
L984:	fn_elink _prim_lt
L988:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 47 ---
L996:	fn_link  L1008
	fn_link  L972
	fn_combi_t3 3, 0,1,2,0,0,0
L1008:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 48 ---
L1012:	fn_link  L1032
	fn_link  L1040
	fn_link  L996
	fn_link  L1044
	fn_combi_t10 5, 0,1,4,2,3,0
L1032:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L1040:	fn_combi_t2 4, 3,0,1,0,0,0
L1044:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 49 ---
NanoPrelude.quot:	fn_link  L1060
	fn_link  L1084
	fn_combi_t8 4, 0,3,2,1,0,0
L1060:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1084:	fn_y
# --- block 50 ---
NanoPrelude.rem:	fn_link  L1100
	fn_link  L1124
	fn_combi_t8 4, 0,3,2,1,0,0
L1100:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1124:	fn_y
# --- block 51 ---
Fish.pseudolimit:	fn_link  Fish.pseudocorner
	fn_elink Fish.cycle$27
# --- block 52 ---
Fish.cycle$27:	fn_link  L1152
	fn_link  Fish.rot
	fn_link  L1164
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 53 ---
L1152:	fn_link  Fish.rot
	fn_link  Fish.rot
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L1164:	fn_link  Fish.rot
	fn_link  Fish.rot
	fn_link  Fish.rot
	fn_link  Fish.quartet
	fn_combi_t50 5, 0,4,1,2,3,4
# --- block 55 ---
Fish.quartet:	fn_link  L1200
	fn_link  L1228
	fn_link  L1256
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 56 ---
L1200:	fn_link  L1212
	fn_link  L1220
	fn_elink Fish.beside
L1212:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1220:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 57 ---
L1228:	fn_link  L1240
	fn_link  L1248
	fn_elink Fish.beside
L1240:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1248:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 58 ---
L1256:	fn_link  L1268
	fn_link  Fish.above
	fn_combi_t37 5, 0,1,1,2,3,4
L1268:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 59 ---
Fish.above:	fn_link  L1340
	fn_link  L1536
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 60 ---
L1288:	fn_link  L1300
	fn_link  L1324
	fn_combi_t8 4, 0,3,2,1,0,0
L1300:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1324:	fn_y
# --- block 61 ---
L1328:	fn_link  L1288
	fn_link  Fish.scale_vec2
	fn_combi_t42 5, 0,4,3,1,2,3
# --- block 62 ---
L1340:	fn_link  L1328
	fn_link  L1352
	fn_combi_t3 3, 0,1,2,0,0,0
L1352:	fn_combi_t42 6, 2,3,4,0,1,5
# --- block 63 ---
L1356:	fn_link  L1368
	fn_link  L1392
	fn_combi_t8 4, 0,2,3,1,0,0
L1368:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1392:	fn_y
# --- block 64 ---
L1396:	fn_link  L1356
	fn_link  Fish.scale_vec2
	fn_combi_t42 5, 0,4,2,1,2,3
# --- block 65 ---
L1408:	fn_link  L1420
	fn_link  L1444
	fn_combi_t8 4, 0,3,2,1,0,0
L1420:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1444:	fn_y
# --- block 66 ---
L1448:	fn_link  Fish.scale_vec2
	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,4,1,5,3,2
# --- block 67 ---
L1460:	fn_link  L1408
	fn_link  L1448
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 68 ---
L1472:	fn_link  L1480
	fn_combi_t30 6, 0,4,1,2,5,3
L1480:	fn_combi_t38 5, 0,1,4,3,2,4
# --- block 69 ---
L1484:	fn_link  L1460
	fn_link  L1472
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 70 ---
L1496:	fn_link  Fish.append
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 71 ---
L1504:	fn_link  L1496
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 72 ---
L1512:	fn_link  L1504
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 73 ---
L1520:	fn_link  L1396
	fn_link  L1484
	fn_link  L1512
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 74 ---
L1536:	fn_link  L1520
	fn_link  L1548
	fn_combi_t40 5, 0,1,2,4,3,4
L1548:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 75 ---
Fish.vec_add:	fn_link  L1652
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 76 ---
L1560:	fn_link  L1572
	fn_link  L1596
	fn_combi_t8 4, 0,3,2,1,0,0
L1572:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1596:	fn_y
# --- block 77 ---
L1600:	fn_link  L1612
	fn_link  L1636
	fn_combi_t36 6, 5,0,3,2,1,4
L1612:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1636:	fn_y
# --- block 78 ---
L1640:	fn_link  L1560
	fn_link  L1600
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 79 ---
L1652:	fn_link  L1640
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 80 ---
Fish.scale_vec2:	fn_link  L1676
	fn_link  L1672
	fn_combi_t21 5, 2,0,1,3,4,0
L1672:	fn_combi_t15 4, 3,0,1,0,2,0
# --- block 81 ---
L1676:	fn_link  L1692
	fn_link  L1716
	fn_link  NanoPrelude.quot
	fn_combi_t36 6, 0,1,3,5,2,4
L1692:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1716:	fn_y
# --- block 82 ---
Fish.beside:	fn_link  L1864
	fn_link  L1964
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 83 ---
L1732:	fn_link  L1744
	fn_link  L1768
	fn_combi_t8 4, 0,2,3,1,0,0
L1744:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1768:	fn_y
# --- block 84 ---
L1772:	fn_link  L1732
	fn_link  Fish.scale_vec2
	fn_combi_t42 5, 0,4,3,1,2,3
# --- block 85 ---
L1784:	fn_link  L1796
	fn_link  L1820
	fn_combi_t8 4, 0,3,2,1,0,0
L1796:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1820:	fn_y
# --- block 86 ---
L1824:	fn_link  Fish.scale_vec2
	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,4,1,5,2,3
# --- block 87 ---
L1836:	fn_link  L1784
	fn_link  L1824
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 88 ---
L1848:	fn_link  L1836
	fn_link  L1860
	fn_combi_t40 5, 0,1,2,4,3,4
L1860:	fn_combi_t40 5, 2,0,3,4,1,4
# --- block 89 ---
L1864:	fn_link  L1772
	fn_link  L1848
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 90 ---
L1876:	fn_link  L1888
	fn_link  L1912
	fn_combi_t8 4, 0,3,2,1,0,0
L1888:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1912:	fn_y
# --- block 91 ---
L1916:	fn_link  Fish.scale_vec2
	fn_combi_t46 6, 3,4,0,5,1,2
# --- block 92 ---
L1924:	fn_link  Fish.append
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 93 ---
L1932:	fn_link  L1924
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 94 ---
L1940:	fn_link  L1916
	fn_link  L1932
	fn_combi_t53 6, 0,1,2,3,4,5
# --- block 95 ---
L1952:	fn_link  L1876
	fn_link  L1940
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 96 ---
L1964:	fn_link  L1952
	fn_link  L1976
	fn_combi_t40 5, 0,1,2,4,3,4
L1976:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 97 ---
Fish.rot:	fn_link  L2004
	fn_link  Fish.vec_sub
	fn_link  L2020
	fn_link  L2000
	fn_combi_t10 5, 0,1,4,2,3,0
L2000:	fn_combi_t30 5, 0,3,1,2,4,4
# --- block 98 ---
L2004:	fn_link  L2012
	fn_combi_t2 2, 1,0,0,0,0,0
L2012:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 99 ---
L2020:	fn_link  Fish.vec_add
	fn_combi_t26 6, 1,0,2,4,5,3
# --- block 100 ---
Fish.vec_sub:	fn_link  L2128
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 101 ---
L2036:	fn_link  L2048
	fn_link  L2072
	fn_combi_t8 4, 0,3,2,1,0,0
L2048:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2072:	fn_y
# --- block 102 ---
L2076:	fn_link  L2088
	fn_link  L2112
	fn_combi_t36 6, 5,0,3,2,1,4
L2088:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2112:	fn_y
# --- block 103 ---
L2116:	fn_link  L2036
	fn_link  L2076
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 104 ---
L2128:	fn_link  L2116
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 105 ---
Fish.pseudocorner:	fn_link  L2156
	fn_link  L2164
	fn_link  Fish.side2
	fn_link  Fish.corner2
	fn_elink Fish.quartet
# --- block 106 ---
L2156:	fn_link  Fish.t
	fn_elink Fish.rot
# --- block 107 ---
L2164:	fn_link  Fish.side2
	fn_elink Fish.rot
# --- block 108 ---
Fish.corner2:	fn_link  Fish.u
	fn_link  L2192
	fn_link  Fish.side1
	fn_link  Fish.corner1
	fn_elink Fish.quartet
# --- block 109 ---
L2192:	fn_link  Fish.side1
	fn_elink Fish.rot
# --- block 110 ---
Fish.corner1:	fn_link  Fish.u
	fn_link  Fish.nil
	fn_link  Fish.nil
	fn_link  Fish.nil
	fn_elink Fish.quartet
# --- block 111 ---
Fish.nil:	fn_link  L2228
	fn_combi_t0 4, 0,0,0,0,0,0
L2228:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 112 ---
Fish.u:	fn_link  L2240
	fn_elink Fish.cycle$27
# --- block 113 ---
L2240:	fn_link  Fish.q
	fn_elink Fish.rot
# --- block 114 ---
Fish.q:	fn_link  Fish.q_tile
	fn_elink Fish.tile_to_grid
# --- block 115 ---
Fish.tile_to_grid:	fn_link  L2268
	fn_link  L2276
	fn_elink Fish.grid
L2268:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L2276:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 116 ---
Fish.grid:	fn_link  L2524
	fn_link  L2536
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 117 ---
L2296:	fn_link  Fish.scale_vec2
	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,3,1,4,5,2
# --- block 118 ---
L2308:	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,1,2,3,5,4
# --- block 119 ---
L2316:	fn_link  L2308
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 120 ---
L2324:	fn_link  L2316
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 121 ---
L2332:	fn_link  Fish.scale_vec2
	fn_link  L2296
	fn_link  L2324
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 122 ---
L2348:	fn_link  Fish.scale_vec2
	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,3,1,4,5,2
# --- block 123 ---
L2360:	fn_link  Fish.vec_add
	fn_combi_t46 6, 0,1,2,3,5,4
# --- block 124 ---
L2368:	fn_link  L2360
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 125 ---
L2376:	fn_link  L2368
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 126 ---
L2384:	fn_link  Fish.scale_vec2
	fn_link  L2348
	fn_link  L2376
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 127 ---
L2400:	fn_link  Fish.tup2
	fn_link  L2412
	fn_combi_t34 6, 0,1,2,3,5,4
L2412:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 128 ---
L2416:	fn_link  L2400
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 129 ---
L2424:	fn_link  L2384
	fn_link  L2416
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 130 ---
L2436:	fn_link  L2444
	fn_combi_t24 6, 0,1,5,2,3,4
L2444:	fn_combi_t39 6, 0,4,1,5,2,3
# --- block 131 ---
L2448:	fn_link  L2436
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 132 ---
L2456:	fn_link  L2448
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 133 ---
L2464:	fn_link  L2456
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 134 ---
L2472:	fn_link  L2424
	fn_link  L2464
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 135 ---
L2484:	fn_link  L2492
	fn_combi_t53 5, 0,1,3,2,3,4
L2492:	fn_combi_t51 6, 4,0,1,2,3,5
# --- block 136 ---
L2496:	fn_link  L2332
	fn_link  L2472
	fn_link  L2484
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 137 ---
L2512:	fn_link  L2520
	fn_combi_t46 6, 5,0,1,2,3,4
L2520:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 138 ---
L2524:	fn_link  L2496
	fn_link  L2512
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 139 ---
L2536:	fn_link  L2544
	fn_combi_t32 6, 0,1,3,4,5,2
L2544:	fn_y
# --- block 140 ---
Fish.tup2:	fn_link  L2556
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 141 ---
L2556:	fn_link  L2564
	fn_combi_t7 4, 1,0,2,3,0,0
L2564:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 142 ---
Fish.q_tile:	fn_link  L4876
	fn_link  L4888
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 143 ---
L2580:	fn_link  L2600
	fn_link  L2608
	fn_link  L2616
	fn_link  L2624
	fn_combi_t9 5, 4,0,1,2,3,0
L2600:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L2608:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2616:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L2624:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 144 ---
L2632:	fn_link  L2644
	fn_link  L2580
	fn_combi_t2 4, 3,0,1,0,0,0
L2644:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 145 ---
L2648:	fn_link  L2668
	fn_link  L2676
	fn_link  L2684
	fn_link  L2692
	fn_combi_t9 5, 4,0,1,2,3,0
L2668:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L2676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2684:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2692:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 146 ---
L2700:	fn_link  L2632
	fn_link  L2648
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 147 ---
L2712:	fn_link  L2732
	fn_link  L2740
	fn_link  L2748
	fn_link  L2756
	fn_combi_t9 5, 4,0,1,2,3,0
L2732:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2740:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L2748:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2756:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 148 ---
L2764:	fn_link  L2700
	fn_link  L2712
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 149 ---
L2776:	fn_link  L2796
	fn_link  L2804
	fn_link  L2812
	fn_link  L2820
	fn_combi_t9 5, 4,0,1,2,3,0
L2796:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2804:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L2812:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2820:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 150 ---
L2828:	fn_link  L2764
	fn_link  L2776
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 151 ---
L2840:	fn_link  L2860
	fn_link  L2868
	fn_link  L2876
	fn_link  L2884
	fn_combi_t9 5, 4,0,1,2,3,0
L2860:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L2868:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L2876:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2884:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 152 ---
L2892:	fn_link  L2828
	fn_link  L2840
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 153 ---
L2904:	fn_link  L2924
	fn_link  L2932
	fn_link  L2940
	fn_link  L2948
	fn_combi_t9 5, 4,0,1,2,3,0
L2924:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L2932:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L2940:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2948:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 154 ---
L2956:	fn_link  L2892
	fn_link  L2904
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 155 ---
L2968:	fn_link  L2988
	fn_link  L2996
	fn_link  L3004
	fn_link  L3012
	fn_combi_t9 5, 4,0,1,2,3,0
L2988:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L2996:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L3004:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3012:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 156 ---
L3020:	fn_link  L2956
	fn_link  L2968
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 157 ---
L3032:	fn_link  L3052
	fn_link  L3060
	fn_link  L3068
	fn_link  L3076
	fn_combi_t9 5, 4,0,1,2,3,0
L3052:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L3060:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L3068:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3076:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 158 ---
L3084:	fn_link  L3020
	fn_link  L3032
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 159 ---
L3096:	fn_link  L3116
	fn_link  L3124
	fn_link  L3132
	fn_link  L3140
	fn_combi_t9 5, 4,0,1,2,3,0
L3116:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3124:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L3132:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3140:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 160 ---
L3148:	fn_link  L3084
	fn_link  L3096
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 161 ---
L3160:	fn_link  L3180
	fn_link  L3188
	fn_link  L3196
	fn_link  L3204
	fn_combi_t9 5, 4,0,1,2,3,0
L3180:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3188:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L3196:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L3204:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 162 ---
L3212:	fn_link  L3148
	fn_link  L3160
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 163 ---
L3224:	fn_link  L3244
	fn_link  L3252
	fn_link  L3260
	fn_link  L3268
	fn_combi_t9 5, 4,0,1,2,3,0
L3244:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L3252:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L3260:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3268:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 164 ---
L3276:	fn_link  L3212
	fn_link  L3224
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 165 ---
L3288:	fn_link  L3308
	fn_link  L3316
	fn_link  L3324
	fn_link  L3332
	fn_combi_t9 5, 4,0,1,2,3,0
L3308:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L3316:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L3324:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3332:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 166 ---
L3340:	fn_link  L3276
	fn_link  L3288
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 167 ---
L3352:	fn_link  L3372
	fn_link  L3380
	fn_link  L3388
	fn_link  L3396
	fn_combi_t9 5, 4,0,1,2,3,0
L3372:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3380:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3388:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3396:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 168 ---
L3404:	fn_link  L3340
	fn_link  L3352
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 169 ---
L3416:	fn_link  L3436
	fn_link  L3444
	fn_link  L3452
	fn_link  L3460
	fn_combi_t9 5, 4,0,1,2,3,0
L3436:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3444:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3452:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3460:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 170 ---
L3468:	fn_link  L3404
	fn_link  L3416
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 171 ---
L3480:	fn_link  L3500
	fn_link  L3508
	fn_link  L3516
	fn_link  L3524
	fn_combi_t9 5, 4,0,1,2,3,0
L3500:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L3508:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L3516:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3524:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 172 ---
L3532:	fn_link  L3468
	fn_link  L3480
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 173 ---
L3544:	fn_link  L3564
	fn_link  L3572
	fn_link  L3580
	fn_link  L3588
	fn_combi_t9 5, 4,0,1,2,3,0
L3564:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3572:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L3580:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3588:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 174 ---
L3596:	fn_link  L3532
	fn_link  L3544
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 175 ---
L3608:	fn_link  L3628
	fn_link  L3636
	fn_link  L3644
	fn_link  L3652
	fn_combi_t9 5, 4,0,1,2,3,0
L3628:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L3636:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L3644:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3652:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 176 ---
L3660:	fn_link  L3596
	fn_link  L3608
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 177 ---
L3672:	fn_link  L3692
	fn_link  L3700
	fn_link  L3708
	fn_link  L3716
	fn_combi_t9 5, 4,0,1,2,3,0
L3692:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L3700:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L3708:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3716:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 178 ---
L3724:	fn_link  L3660
	fn_link  L3672
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 179 ---
L3736:	fn_link  L3756
	fn_link  L3764
	fn_link  L3772
	fn_link  L3780
	fn_combi_t9 5, 4,0,1,2,3,0
L3756:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3764:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3772:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L3780:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 180 ---
L3788:	fn_link  L3724
	fn_link  L3736
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 181 ---
L3800:	fn_link  L3820
	fn_link  L3828
	fn_link  L3836
	fn_link  L3844
	fn_combi_t9 5, 4,0,1,2,3,0
L3820:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L3828:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L3836:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L3844:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 182 ---
L3852:	fn_link  L3788
	fn_link  L3800
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 183 ---
L3864:	fn_link  L3884
	fn_link  L3892
	fn_link  L3900
	fn_link  L3908
	fn_combi_t9 5, 4,0,1,2,3,0
L3884:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L3892:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L3900:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L3908:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 184 ---
L3916:	fn_link  L3852
	fn_link  L3864
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 185 ---
L3928:	fn_link  L3948
	fn_link  L3956
	fn_link  L3964
	fn_link  L3972
	fn_combi_t9 5, 4,0,1,2,3,0
L3948:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L3956:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L3964:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L3972:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 186 ---
L3980:	fn_link  L3916
	fn_link  L3928
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 187 ---
L3992:	fn_link  L4012
	fn_link  L4020
	fn_link  L4028
	fn_link  L4036
	fn_combi_t9 5, 4,0,1,2,3,0
L4012:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4020:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L4028:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4036:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 188 ---
L4044:	fn_link  L3980
	fn_link  L3992
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 189 ---
L4056:	fn_link  L4076
	fn_link  L4084
	fn_link  L4092
	fn_link  L4100
	fn_combi_t9 5, 4,0,1,2,3,0
L4076:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4084:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4092:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L4100:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 190 ---
L4108:	fn_link  L4044
	fn_link  L4056
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 191 ---
L4120:	fn_link  L4140
	fn_link  L4148
	fn_link  L4156
	fn_link  L4164
	fn_combi_t9 5, 4,0,1,2,3,0
L4140:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L4148:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4156:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L4164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 192 ---
L4172:	fn_link  L4108
	fn_link  L4120
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 193 ---
L4184:	fn_link  L4204
	fn_link  L4212
	fn_link  L4220
	fn_link  L4228
	fn_combi_t9 5, 4,0,1,2,3,0
L4204:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4212:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4220:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4228:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 194 ---
L4236:	fn_link  L4172
	fn_link  L4184
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 195 ---
L4248:	fn_link  L4268
	fn_link  L4276
	fn_link  L4284
	fn_link  L4292
	fn_combi_t9 5, 4,0,1,2,3,0
L4268:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L4276:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L4284:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4292:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 196 ---
L4300:	fn_link  L4236
	fn_link  L4248
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 197 ---
L4312:	fn_link  L4332
	fn_link  L4340
	fn_link  L4348
	fn_link  L4356
	fn_combi_t9 5, 4,0,1,2,3,0
L4332:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L4340:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L4348:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4356:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 198 ---
L4364:	fn_link  L4300
	fn_link  L4312
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 199 ---
L4376:	fn_link  L4396
	fn_link  L4404
	fn_link  L4412
	fn_link  L4420
	fn_combi_t9 5, 4,0,1,2,3,0
L4396:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4404:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4412:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4420:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 200 ---
L4428:	fn_link  L4364
	fn_link  L4376
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 201 ---
L4440:	fn_link  L4460
	fn_link  L4468
	fn_link  L4476
	fn_link  L4484
	fn_combi_t9 5, 4,0,1,2,3,0
L4460:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L4468:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4476:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L4484:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 202 ---
L4492:	fn_link  L4428
	fn_link  L4440
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 203 ---
L4504:	fn_link  L4524
	fn_link  L4532
	fn_link  L4540
	fn_link  L4548
	fn_combi_t9 5, 4,0,1,2,3,0
L4524:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L4532:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L4540:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L4548:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 204 ---
L4556:	fn_link  L4492
	fn_link  L4504
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 205 ---
L4568:	fn_link  L4588
	fn_link  L4596
	fn_link  L4604
	fn_link  L4612
	fn_combi_t9 5, 4,0,1,2,3,0
L4588:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L4596:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L4604:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L4612:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 206 ---
L4620:	fn_link  L4556
	fn_link  L4568
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 207 ---
L4632:	fn_link  L4652
	fn_link  L4660
	fn_link  L4668
	fn_link  L4676
	fn_combi_t9 5, 4,0,1,2,3,0
L4652:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4660:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L4668:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L4676:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 208 ---
L4684:	fn_link  L4620
	fn_link  L4632
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 209 ---
L4696:	fn_link  L4716
	fn_link  L4724
	fn_link  L4732
	fn_link  L4740
	fn_combi_t9 5, 4,0,1,2,3,0
L4716:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L4724:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L4732:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4740:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 210 ---
L4748:	fn_link  L4684
	fn_link  L4696
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 211 ---
L4760:	fn_link  L4780
	fn_link  L4788
	fn_link  L4796
	fn_link  L4804
	fn_combi_t9 5, 4,0,1,2,3,0
L4780:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4788:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4796:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4804:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 212 ---
L4812:	fn_link  L4748
	fn_link  L4760
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 213 ---
L4824:	fn_link  L4844
	fn_link  L4852
	fn_link  L4860
	fn_link  L4868
	fn_combi_t9 5, 4,0,1,2,3,0
L4844:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4852:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L4860:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4868:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 214 ---
L4876:	fn_link  L4812
	fn_link  L4824
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 215 ---
L4888:	fn_link  L4908
	fn_link  L4916
	fn_link  L4924
	fn_link  L4932
	fn_combi_t9 5, 4,0,1,2,3,0
L4908:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L4916:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L4924:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L4932:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 216 ---
Fish.side1:	fn_link  Fish.t
	fn_link  L4960
	fn_link  Fish.nil
	fn_link  Fish.nil
	fn_elink Fish.quartet
# --- block 217 ---
L4960:	fn_link  Fish.t
	fn_elink Fish.rot
# --- block 218 ---
Fish.t:	fn_link  Fish.s
	fn_link  Fish.r
	fn_link  Fish.q
	fn_link  Fish.p
	fn_elink Fish.quartet
# --- block 219 ---
Fish.p:	fn_link  Fish.p_tile
	fn_elink Fish.tile_to_grid
# --- block 220 ---
Fish.p_tile:	fn_link  L6856
	fn_link  L6868
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 221 ---
L5008:	fn_link  L5028
	fn_link  L5036
	fn_link  L5044
	fn_link  L5052
	fn_combi_t9 5, 4,0,1,2,3,0
L5028:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L5036:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5044:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L5052:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 222 ---
L5060:	fn_link  L5072
	fn_link  L5008
	fn_combi_t2 4, 3,0,1,0,0,0
L5072:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 223 ---
L5076:	fn_link  L5096
	fn_link  L5104
	fn_link  L5112
	fn_link  L5120
	fn_combi_t9 5, 4,0,1,2,3,0
L5096:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L5104:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L5112:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5120:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 224 ---
L5128:	fn_link  L5060
	fn_link  L5076
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 225 ---
L5140:	fn_link  L5160
	fn_link  L5168
	fn_link  L5176
	fn_link  L5184
	fn_combi_t9 5, 4,0,1,2,3,0
L5160:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L5168:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5176:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L5184:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 226 ---
L5192:	fn_link  L5128
	fn_link  L5140
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 227 ---
L5204:	fn_link  L5224
	fn_link  L5232
	fn_link  L5240
	fn_link  L5248
	fn_combi_t9 5, 4,0,1,2,3,0
L5224:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L5232:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L5240:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L5248:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 228 ---
L5256:	fn_link  L5192
	fn_link  L5204
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 229 ---
L5268:	fn_link  L5288
	fn_link  L5296
	fn_link  L5304
	fn_link  L5312
	fn_combi_t9 5, 4,0,1,2,3,0
L5288:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L5296:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5304:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L5312:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 230 ---
L5320:	fn_link  L5256
	fn_link  L5268
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 231 ---
L5332:	fn_link  L5352
	fn_link  L5360
	fn_link  L5368
	fn_link  L5376
	fn_combi_t9 5, 4,0,1,2,3,0
L5352:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L5360:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5368:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L5376:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 232 ---
L5384:	fn_link  L5320
	fn_link  L5332
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 233 ---
L5396:	fn_link  L5416
	fn_link  L5424
	fn_link  L5432
	fn_link  L5440
	fn_combi_t9 5, 4,0,1,2,3,0
L5416:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L5424:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5432:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L5440:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 234 ---
L5448:	fn_link  L5384
	fn_link  L5396
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 235 ---
L5460:	fn_link  L5480
	fn_link  L5488
	fn_link  L5496
	fn_link  L5504
	fn_combi_t9 5, 4,0,1,2,3,0
L5480:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L5488:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5496:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L5504:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 236 ---
L5512:	fn_link  L5448
	fn_link  L5460
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 237 ---
L5524:	fn_link  L5544
	fn_link  L5552
	fn_link  L5560
	fn_link  L5568
	fn_combi_t9 5, 4,0,1,2,3,0
L5544:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5552:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5560:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5568:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 238 ---
L5576:	fn_link  L5512
	fn_link  L5524
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 239 ---
L5588:	fn_link  L5608
	fn_link  L5616
	fn_link  L5624
	fn_link  L5632
	fn_combi_t9 5, 4,0,1,2,3,0
L5608:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L5616:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5624:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5632:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 240 ---
L5640:	fn_link  L5576
	fn_link  L5588
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 241 ---
L5652:	fn_link  L5672
	fn_link  L5680
	fn_link  L5688
	fn_link  L5696
	fn_combi_t9 5, 4,0,1,2,3,0
L5672:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L5680:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5688:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L5696:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 242 ---
L5704:	fn_link  L5640
	fn_link  L5652
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 243 ---
L5716:	fn_link  L5736
	fn_link  L5744
	fn_link  L5752
	fn_link  L5760
	fn_combi_t9 5, 4,0,1,2,3,0
L5736:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L5744:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L5752:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5760:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 244 ---
L5768:	fn_link  L5704
	fn_link  L5716
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 245 ---
L5780:	fn_link  L5800
	fn_link  L5808
	fn_link  L5816
	fn_link  L5824
	fn_combi_t9 5, 4,0,1,2,3,0
L5800:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L5808:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5816:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L5824:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 246 ---
L5832:	fn_link  L5768
	fn_link  L5780
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 247 ---
L5844:	fn_link  L5864
	fn_link  L5872
	fn_link  L5880
	fn_link  L5888
	fn_combi_t9 5, 4,0,1,2,3,0
L5864:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L5872:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5880:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5888:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 248 ---
L5896:	fn_link  L5832
	fn_link  L5844
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 249 ---
L5908:	fn_link  L5928
	fn_link  L5936
	fn_link  L5944
	fn_link  L5952
	fn_combi_t9 5, 4,0,1,2,3,0
L5928:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5936:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L5944:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L5952:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 250 ---
L5960:	fn_link  L5896
	fn_link  L5908
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 251 ---
L5972:	fn_link  L5992
	fn_link  L6000
	fn_link  L6008
	fn_link  L6016
	fn_combi_t9 5, 4,0,1,2,3,0
L5992:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L6000:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L6008:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L6016:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 252 ---
L6024:	fn_link  L5960
	fn_link  L5972
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 253 ---
L6036:	fn_link  L6056
	fn_link  L6064
	fn_link  L6072
	fn_link  L6080
	fn_combi_t9 5, 4,0,1,2,3,0
L6056:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L6064:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6072:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L6080:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 254 ---
L6088:	fn_link  L6024
	fn_link  L6036
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 255 ---
L6100:	fn_link  L6120
	fn_link  L6128
	fn_link  L6136
	fn_link  L6144
	fn_combi_t9 5, 4,0,1,2,3,0
L6120:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L6128:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L6136:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L6144:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 256 ---
L6152:	fn_link  L6088
	fn_link  L6100
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 257 ---
L6164:	fn_link  L6184
	fn_link  L6192
	fn_link  L6200
	fn_link  L6208
	fn_combi_t9 5, 4,0,1,2,3,0
L6184:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L6192:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6200:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L6208:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 258 ---
L6216:	fn_link  L6152
	fn_link  L6164
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 259 ---
L6228:	fn_link  L6248
	fn_link  L6256
	fn_link  L6264
	fn_link  L6272
	fn_combi_t9 5, 4,0,1,2,3,0
L6248:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L6256:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6264:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6272:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 260 ---
L6280:	fn_link  L6216
	fn_link  L6228
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 261 ---
L6292:	fn_link  L6312
	fn_link  L6320
	fn_link  L6328
	fn_link  L6336
	fn_combi_t9 5, 4,0,1,2,3,0
L6312:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6320:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6328:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L6336:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 262 ---
L6344:	fn_link  L6280
	fn_link  L6292
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 263 ---
L6356:	fn_link  L6376
	fn_link  L6384
	fn_link  L6392
	fn_link  L6400
	fn_combi_t9 5, 4,0,1,2,3,0
L6376:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L6384:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L6392:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6400:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 264 ---
L6408:	fn_link  L6344
	fn_link  L6356
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 265 ---
L6420:	fn_link  L6440
	fn_link  L6448
	fn_link  L6456
	fn_link  L6464
	fn_combi_t9 5, 4,0,1,2,3,0
L6440:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6448:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L6456:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6464:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 266 ---
L6472:	fn_link  L6408
	fn_link  L6420
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 267 ---
L6484:	fn_link  L6504
	fn_link  L6512
	fn_link  L6520
	fn_link  L6528
	fn_combi_t9 5, 4,0,1,2,3,0
L6504:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L6512:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6520:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L6528:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 268 ---
L6536:	fn_link  L6472
	fn_link  L6484
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 269 ---
L6548:	fn_link  L6568
	fn_link  L6576
	fn_link  L6584
	fn_link  L6592
	fn_combi_t9 5, 4,0,1,2,3,0
L6568:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L6576:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L6584:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L6592:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 270 ---
L6600:	fn_link  L6536
	fn_link  L6548
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 271 ---
L6612:	fn_link  L6632
	fn_link  L6640
	fn_link  L6648
	fn_link  L6656
	fn_combi_t9 5, 4,0,1,2,3,0
L6632:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L6640:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6648:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L6656:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 272 ---
L6664:	fn_link  L6600
	fn_link  L6612
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 273 ---
L6676:	fn_link  L6696
	fn_link  L6704
	fn_link  L6712
	fn_link  L6720
	fn_combi_t9 5, 4,0,1,2,3,0
L6696:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6704:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6712:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6720:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 274 ---
L6728:	fn_link  L6664
	fn_link  L6676
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 275 ---
L6740:	fn_link  L6760
	fn_link  L6768
	fn_link  L6776
	fn_link  L6784
	fn_combi_t9 5, 4,0,1,2,3,0
L6760:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L6768:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6776:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6784:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 276 ---
L6792:	fn_link  L6728
	fn_link  L6740
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 277 ---
L6804:	fn_link  L6824
	fn_link  L6832
	fn_link  L6840
	fn_link  L6848
	fn_combi_t9 5, 4,0,1,2,3,0
L6824:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L6832:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6840:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6848:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 278 ---
L6856:	fn_link  L6792
	fn_link  L6804
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 279 ---
L6868:	fn_link  L6888
	fn_link  L6896
	fn_link  L6904
	fn_link  L6912
	fn_combi_t9 5, 4,0,1,2,3,0
L6888:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L6896:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L6904:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L6912:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 280 ---
Fish.r:	fn_link  Fish.r_tile
	fn_elink Fish.tile_to_grid
# --- block 281 ---
Fish.r_tile:	fn_link  L8468
	fn_link  L8480
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 282 ---
L6940:	fn_link  L6960
	fn_link  L6968
	fn_link  L6976
	fn_link  L6984
	fn_combi_t9 5, 4,0,1,2,3,0
L6960:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L6968:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L6976:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L6984:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 283 ---
L6992:	fn_link  L7004
	fn_link  L6940
	fn_combi_t2 4, 3,0,1,0,0,0
L7004:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 284 ---
L7008:	fn_link  L7028
	fn_link  L7036
	fn_link  L7044
	fn_link  L7052
	fn_combi_t9 5, 4,0,1,2,3,0
L7028:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7036:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7044:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L7052:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 285 ---
L7060:	fn_link  L6992
	fn_link  L7008
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 286 ---
L7072:	fn_link  L7092
	fn_link  L7100
	fn_link  L7108
	fn_link  L7116
	fn_combi_t9 5, 4,0,1,2,3,0
L7092:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L7100:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7108:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L7116:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 287 ---
L7124:	fn_link  L7060
	fn_link  L7072
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 288 ---
L7136:	fn_link  L7156
	fn_link  L7164
	fn_link  L7172
	fn_link  L7180
	fn_combi_t9 5, 4,0,1,2,3,0
L7156:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7164:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7172:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7180:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 289 ---
L7188:	fn_link  L7124
	fn_link  L7136
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 290 ---
L7200:	fn_link  L7220
	fn_link  L7228
	fn_link  L7236
	fn_link  L7244
	fn_combi_t9 5, 4,0,1,2,3,0
L7220:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7228:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7236:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7244:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 291 ---
L7252:	fn_link  L7188
	fn_link  L7200
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 292 ---
L7264:	fn_link  L7284
	fn_link  L7292
	fn_link  L7300
	fn_link  L7308
	fn_combi_t9 5, 4,0,1,2,3,0
L7284:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7292:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7300:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L7308:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 293 ---
L7316:	fn_link  L7252
	fn_link  L7264
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 294 ---
L7328:	fn_link  L7348
	fn_link  L7356
	fn_link  L7364
	fn_link  L7372
	fn_combi_t9 5, 4,0,1,2,3,0
L7348:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L7356:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7364:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L7372:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 295 ---
L7380:	fn_link  L7316
	fn_link  L7328
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 296 ---
L7392:	fn_link  L7412
	fn_link  L7420
	fn_link  L7428
	fn_link  L7436
	fn_combi_t9 5, 4,0,1,2,3,0
L7412:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7420:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7428:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7436:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 297 ---
L7444:	fn_link  L7380
	fn_link  L7392
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 298 ---
L7456:	fn_link  L7476
	fn_link  L7484
	fn_link  L7492
	fn_link  L7500
	fn_combi_t9 5, 4,0,1,2,3,0
L7476:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7484:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7492:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L7500:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 299 ---
L7508:	fn_link  L7444
	fn_link  L7456
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 300 ---
L7520:	fn_link  L7540
	fn_link  L7548
	fn_link  L7556
	fn_link  L7564
	fn_combi_t9 5, 4,0,1,2,3,0
L7540:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7548:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7556:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7564:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 301 ---
L7572:	fn_link  L7508
	fn_link  L7520
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 302 ---
L7584:	fn_link  L7604
	fn_link  L7612
	fn_link  L7620
	fn_link  L7628
	fn_combi_t9 5, 4,0,1,2,3,0
L7604:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7612:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L7620:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7628:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 303 ---
L7636:	fn_link  L7572
	fn_link  L7584
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 304 ---
L7648:	fn_link  L7668
	fn_link  L7676
	fn_link  L7684
	fn_link  L7692
	fn_combi_t9 5, 4,0,1,2,3,0
L7668:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7676:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L7684:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7692:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 305 ---
L7700:	fn_link  L7636
	fn_link  L7648
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 306 ---
L7712:	fn_link  L7732
	fn_link  L7740
	fn_link  L7748
	fn_link  L7756
	fn_combi_t9 5, 4,0,1,2,3,0
L7732:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7740:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7748:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7756:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 307 ---
L7764:	fn_link  L7700
	fn_link  L7712
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 308 ---
L7776:	fn_link  L7796
	fn_link  L7804
	fn_link  L7812
	fn_link  L7820
	fn_combi_t9 5, 4,0,1,2,3,0
L7796:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L7804:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7812:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7820:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 309 ---
L7828:	fn_link  L7764
	fn_link  L7776
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 310 ---
L7840:	fn_link  L7860
	fn_link  L7868
	fn_link  L7876
	fn_link  L7884
	fn_combi_t9 5, 4,0,1,2,3,0
L7860:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L7868:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L7876:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L7884:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 311 ---
L7892:	fn_link  L7828
	fn_link  L7840
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 312 ---
L7904:	fn_link  L7924
	fn_link  L7932
	fn_link  L7940
	fn_link  L7948
	fn_combi_t9 5, 4,0,1,2,3,0
L7924:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L7932:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L7940:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7948:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 313 ---
L7956:	fn_link  L7892
	fn_link  L7904
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 314 ---
L7968:	fn_link  L7988
	fn_link  L7996
	fn_link  L8004
	fn_link  L8012
	fn_combi_t9 5, 4,0,1,2,3,0
L7988:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L7996:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8004:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8012:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 315 ---
L8020:	fn_link  L7956
	fn_link  L7968
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 316 ---
L8032:	fn_link  L8052
	fn_link  L8060
	fn_link  L8068
	fn_link  L8076
	fn_combi_t9 5, 4,0,1,2,3,0
L8052:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8060:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L8068:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L8076:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 317 ---
L8084:	fn_link  L8020
	fn_link  L8032
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 318 ---
L8096:	fn_link  L8116
	fn_link  L8124
	fn_link  L8132
	fn_link  L8140
	fn_combi_t9 5, 4,0,1,2,3,0
L8116:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L8124:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8132:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L8140:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 319 ---
L8148:	fn_link  L8084
	fn_link  L8096
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 320 ---
L8160:	fn_link  L8180
	fn_link  L8188
	fn_link  L8196
	fn_link  L8204
	fn_combi_t9 5, 4,0,1,2,3,0
L8180:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L8188:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L8196:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8204:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 321 ---
L8212:	fn_link  L8148
	fn_link  L8160
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 322 ---
L8224:	fn_link  L8244
	fn_link  L8252
	fn_link  L8260
	fn_link  L8268
	fn_combi_t9 5, 4,0,1,2,3,0
L8244:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L8252:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8260:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L8268:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 323 ---
L8276:	fn_link  L8212
	fn_link  L8224
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 324 ---
L8288:	fn_link  L8308
	fn_link  L8316
	fn_link  L8324
	fn_link  L8332
	fn_combi_t9 5, 4,0,1,2,3,0
L8308:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L8316:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L8324:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8332:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 325 ---
L8340:	fn_link  L8276
	fn_link  L8288
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 326 ---
L8352:	fn_link  L8372
	fn_link  L8380
	fn_link  L8388
	fn_link  L8396
	fn_combi_t9 5, 4,0,1,2,3,0
L8372:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L8380:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L8388:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L8396:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 327 ---
L8404:	fn_link  L8340
	fn_link  L8352
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 328 ---
L8416:	fn_link  L8436
	fn_link  L8444
	fn_link  L8452
	fn_link  L8460
	fn_combi_t9 5, 4,0,1,2,3,0
L8436:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L8444:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L8452:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L8460:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 329 ---
L8468:	fn_link  L8404
	fn_link  L8416
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 330 ---
L8480:	fn_link  L8500
	fn_link  L8508
	fn_link  L8516
	fn_link  L8524
	fn_combi_t9 5, 4,0,1,2,3,0
L8500:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8508:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8516:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8524:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 331 ---
Fish.s:	fn_link  Fish.s_tile
	fn_elink Fish.tile_to_grid
# --- block 332 ---
Fish.s_tile:	fn_link  L10272
	fn_link  L10284
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 333 ---
L8552:	fn_link  L8572
	fn_link  L8580
	fn_link  L8588
	fn_link  L8596
	fn_combi_t9 5, 4,0,1,2,3,0
L8572:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L8580:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L8588:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8596:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 334 ---
L8604:	fn_link  L8616
	fn_link  L8552
	fn_combi_t2 4, 3,0,1,0,0,0
L8616:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 335 ---
L8620:	fn_link  L8640
	fn_link  L8648
	fn_link  L8656
	fn_link  L8664
	fn_combi_t9 5, 4,0,1,2,3,0
L8640:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8648:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L8656:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L8664:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 336 ---
L8672:	fn_link  L8604
	fn_link  L8620
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 337 ---
L8684:	fn_link  L8704
	fn_link  L8712
	fn_link  L8720
	fn_link  L8728
	fn_combi_t9 5, 4,0,1,2,3,0
L8704:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L8712:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L8720:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L8728:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 338 ---
L8736:	fn_link  L8672
	fn_link  L8684
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 339 ---
L8748:	fn_link  L8768
	fn_link  L8776
	fn_link  L8784
	fn_link  L8792
	fn_combi_t9 5, 4,0,1,2,3,0
L8768:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L8776:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L8784:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L8792:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 340 ---
L8800:	fn_link  L8736
	fn_link  L8748
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 341 ---
L8812:	fn_link  L8832
	fn_link  L8840
	fn_link  L8848
	fn_link  L8856
	fn_combi_t9 5, 4,0,1,2,3,0
L8832:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L8840:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L8848:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8856:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 342 ---
L8864:	fn_link  L8800
	fn_link  L8812
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 343 ---
L8876:	fn_link  L8896
	fn_link  L8904
	fn_link  L8912
	fn_link  L8920
	fn_combi_t9 5, 4,0,1,2,3,0
L8896:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L8904:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L8912:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L8920:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 344 ---
L8928:	fn_link  L8864
	fn_link  L8876
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 345 ---
L8940:	fn_link  L8960
	fn_link  L8968
	fn_link  L8976
	fn_link  L8984
	fn_combi_t9 5, 4,0,1,2,3,0
L8960:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L8968:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L8976:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L8984:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 346 ---
L8992:	fn_link  L8928
	fn_link  L8940
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 347 ---
L9004:	fn_link  L9024
	fn_link  L9032
	fn_link  L9040
	fn_link  L9048
	fn_combi_t9 5, 4,0,1,2,3,0
L9024:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9032:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9040:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L9048:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 348 ---
L9056:	fn_link  L8992
	fn_link  L9004
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 349 ---
L9068:	fn_link  L9088
	fn_link  L9096
	fn_link  L9104
	fn_link  L9112
	fn_combi_t9 5, 4,0,1,2,3,0
L9088:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L9096:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L9104:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L9112:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 350 ---
L9120:	fn_link  L9056
	fn_link  L9068
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 351 ---
L9132:	fn_link  L9152
	fn_link  L9160
	fn_link  L9168
	fn_link  L9176
	fn_combi_t9 5, 4,0,1,2,3,0
L9152:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L9160:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L9168:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9176:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 352 ---
L9184:	fn_link  L9120
	fn_link  L9132
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 353 ---
L9196:	fn_link  L9216
	fn_link  L9224
	fn_link  L9232
	fn_link  L9240
	fn_combi_t9 5, 4,0,1,2,3,0
L9216:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9224:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9232:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9240:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 354 ---
L9248:	fn_link  L9184
	fn_link  L9196
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 355 ---
L9260:	fn_link  L9280
	fn_link  L9288
	fn_link  L9296
	fn_link  L9304
	fn_combi_t9 5, 4,0,1,2,3,0
L9280:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9288:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9296:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9304:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 356 ---
L9312:	fn_link  L9248
	fn_link  L9260
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 357 ---
L9324:	fn_link  L9344
	fn_link  L9352
	fn_link  L9360
	fn_link  L9368
	fn_combi_t9 5, 4,0,1,2,3,0
L9344:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9352:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L9360:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9368:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 358 ---
L9376:	fn_link  L9312
	fn_link  L9324
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 359 ---
L9388:	fn_link  L9408
	fn_link  L9416
	fn_link  L9424
	fn_link  L9432
	fn_combi_t9 5, 4,0,1,2,3,0
L9408:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9416:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L9424:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L9432:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 360 ---
L9440:	fn_link  L9376
	fn_link  L9388
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 361 ---
L9452:	fn_link  L9472
	fn_link  L9480
	fn_link  L9488
	fn_link  L9496
	fn_combi_t9 5, 4,0,1,2,3,0
L9472:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L9480:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9488:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L9496:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 362 ---
L9504:	fn_link  L9440
	fn_link  L9452
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 363 ---
L9516:	fn_link  L9536
	fn_link  L9544
	fn_link  L9552
	fn_link  L9560
	fn_combi_t9 5, 4,0,1,2,3,0
L9536:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L9544:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9552:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L9560:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 364 ---
L9568:	fn_link  L9504
	fn_link  L9516
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 365 ---
L9580:	fn_link  L9600
	fn_link  L9608
	fn_link  L9616
	fn_link  L9624
	fn_combi_t9 5, 4,0,1,2,3,0
L9600:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9608:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9616:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L9624:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 366 ---
L9632:	fn_link  L9568
	fn_link  L9580
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 367 ---
L9644:	fn_link  L9664
	fn_link  L9672
	fn_link  L9680
	fn_link  L9688
	fn_combi_t9 5, 4,0,1,2,3,0
L9664:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L9672:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9680:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L9688:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
# --- block 368 ---
L9696:	fn_link  L9632
	fn_link  L9644
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 369 ---
L9708:	fn_link  L9728
	fn_link  L9736
	fn_link  L9744
	fn_link  L9752
	fn_combi_t9 5, 4,0,1,2,3,0
L9728:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L9736:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L9744:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9752:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 370 ---
L9760:	fn_link  L9696
	fn_link  L9708
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 371 ---
L9772:	fn_link  L9792
	fn_link  L9800
	fn_link  L9808
	fn_link  L9816
	fn_combi_t9 5, 4,0,1,2,3,0
L9792:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
L9800:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L9808:	fn_box
	.word 0x0000000e	# raw word 14
	fn_box_body
L9816:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 372 ---
L9824:	fn_link  L9760
	fn_link  L9772
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 373 ---
L9836:	fn_link  L9856
	fn_link  L9864
	fn_link  L9872
	fn_link  L9880
	fn_combi_t9 5, 4,0,1,2,3,0
L9856:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9864:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L9872:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L9880:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 374 ---
L9888:	fn_link  L9824
	fn_link  L9836
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 375 ---
L9900:	fn_link  L9920
	fn_link  L9928
	fn_link  L9936
	fn_link  L9944
	fn_combi_t9 5, 4,0,1,2,3,0
L9920:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L9928:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L9936:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9944:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 376 ---
L9952:	fn_link  L9888
	fn_link  L9900
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 377 ---
L9964:	fn_link  L9984
	fn_link  L9992
	fn_link  L10000
	fn_link  L10008
	fn_combi_t9 5, 4,0,1,2,3,0
L9984:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L9992:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L10000:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L10008:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 378 ---
L10016:	fn_link  L9952
	fn_link  L9964
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 379 ---
L10028:	fn_link  L10048
	fn_link  L10056
	fn_link  L10064
	fn_link  L10072
	fn_combi_t9 5, 4,0,1,2,3,0
L10048:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L10056:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L10064:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L10072:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 380 ---
L10080:	fn_link  L10016
	fn_link  L10028
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 381 ---
L10092:	fn_link  L10112
	fn_link  L10120
	fn_link  L10128
	fn_link  L10136
	fn_combi_t9 5, 4,0,1,2,3,0
L10112:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10120:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10128:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L10136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 382 ---
L10144:	fn_link  L10080
	fn_link  L10092
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 383 ---
L10156:	fn_link  L10176
	fn_link  L10184
	fn_link  L10192
	fn_link  L10200
	fn_combi_t9 5, 4,0,1,2,3,0
L10176:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10184:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L10192:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10200:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 384 ---
L10208:	fn_link  L10144
	fn_link  L10156
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 385 ---
L10220:	fn_link  L10240
	fn_link  L10248
	fn_link  L10256
	fn_link  L10264
	fn_combi_t9 5, 4,0,1,2,3,0
L10240:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10248:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L10256:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10264:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 386 ---
L10272:	fn_link  L10208
	fn_link  L10220
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 387 ---
L10284:	fn_link  L10304
	fn_link  L10312
	fn_link  L10320
	fn_link  L10328
	fn_combi_t9 5, 4,0,1,2,3,0
L10304:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10312:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L10320:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10328:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 388 ---
Fish.side2:	fn_link  Fish.t
	fn_link  L10356
	fn_link  Fish.side1
	fn_link  Fish.side1
	fn_elink Fish.quartet
# --- block 389 ---
L10356:	fn_link  Fish.t
	fn_elink Fish.rot

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
