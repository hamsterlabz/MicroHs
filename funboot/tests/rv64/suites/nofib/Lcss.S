# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Lcss  (entry @0)
	.text
	.globl	Lcss.algb
	.globl	Lcss.algc
	.globl	Lcss.bench
	.globl	Lcss.dropL
	.globl	Lcss.elemL
	.globl	Lcss.fromTo
	.globl	Lcss.hashS
	.globl	Lcss.lcss
	.globl	Lcss.maxI
	.globl	Lcss.revL
	.globl	Lcss.takeL
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.any
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.snd
	.globl	NanoPrelude.zip
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Lcss.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Lcss.bench:	fn_link  L180
	fn_elink Lcss.hashS
# --- block 3 ---
L36:	fn_link  L48
	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L48:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 4 ---
L72:	fn_link  L36
	fn_link  L88
	fn_link  L96
	fn_elink NanoPrelude.quot
L88:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L96:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 5 ---
L104:	fn_link  L72
	fn_y
# --- block 6 ---
L112:	fn_link  L124
	fn_link  L132
	fn_elink NanoPrelude.quot
L124:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L132:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 7 ---
L140:	fn_link  L104
	fn_link  L112
	fn_elink Lcss.fromTo
# --- block 8 ---
L152:	fn_link  L164
	fn_link  L172
	fn_elink Lcss.fromTo
L164:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
L172:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 9 ---
L180:	fn_link  L140
	fn_link  L152
	fn_elink Lcss.lcss
# --- block 10 ---
Lcss.hashS:	fn_link  L204
	fn_link  L292
	fn_elink NanoPrelude.foldl
L204:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L212:	fn_link  L232
	fn_link  L256
	fn_link  L280
	fn_link  L288
	fn_combi_t41 6, 0,1,4,2,5,3
L232:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L256:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L280:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L288:	fn_y
# --- block 12 ---
L292:	fn_link  L212
	fn_link  L304
	fn_combi_t7 4, 0,1,2,3,0,0
L304:	fn_y
# --- block 13 ---
NanoPrelude.foldl:	fn_link  L324
	fn_link  L320
	fn_combi_t3 3, 0,1,2,0,0,0
L320:	fn_y
# --- block 14 ---
L324:	fn_link  L332
	fn_combi_t46 5, 4,3,0,1,2,3
L332:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 15 ---
Lcss.lcss:	fn_link  L352
	fn_link  L356
	fn_link  L360
	fn_combi_t24 5, 0,1,3,4,4,2
L352:	fn_combi_t0 2, 0,0,0,0,0,0
L356:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 16 ---
L360:	fn_link  NanoPrelude.length
	fn_link  Lcss.algc
	fn_combi_t29 4, 0,1,2,1,3,2
# --- block 17 ---
Lcss.algc:	fn_link  L1068
	fn_link  L1152
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 18 ---
L384:	fn_link  Lcss.dropL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 19 ---
L392:	fn_link  Lcss.takeL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 20 ---
L400:	fn_link  Lcss.algb
	fn_link  Lcss.revL
	fn_combi_t57 4, 0,1,0,3,0,2
# --- block 21 ---
L412:	fn_link  L424
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L424:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 22 ---
L448:	fn_link  L412
	fn_y
# --- block 23 ---
L456:	fn_link  L468
	fn_link  L492
	fn_combi_t13 4, 2,0,3,1,3,0
L468:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L492:	fn_y
# --- block 24 ---
L496:	fn_link  L516
	fn_link  L540
	fn_link  L456
	fn_link  L544
	fn_combi_t26 6, 0,1,4,5,2,3
L516:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L540:	fn_y
L544:	fn_combi_t36 6, 0,1,5,4,2,3
# --- block 25 ---
L548:	fn_link  L560
	fn_link  L584
	fn_combi_t8 4, 2,0,3,1,0,0
L560:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L584:	fn_y
# --- block 26 ---
L588:	fn_link  L604
	fn_link  L608
	fn_link  L632
	fn_combi_t55 6, 3,0,5,4,1,2
L604:	fn_elink _prim_ge
L608:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L632:	fn_y
# --- block 27 ---
L636:	fn_link  L588
	fn_link  L648
	fn_combi_t26 6, 0,1,2,5,3,4
L648:	fn_combi_t39 5, 0,4,1,2,3,4
# --- block 28 ---
L652:	fn_link  L636
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 29 ---
L660:	fn_link  L548
	fn_link  L652
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 30 ---
L672:	fn_link  L680
	fn_combi_t52 6, 4,0,1,3,2,5
L680:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 31 ---
L684:	fn_link  L672
	fn_combi_t40 5, 0,1,3,4,2,3
# --- block 32 ---
L692:	fn_link  L496
	fn_link  L660
	fn_link  L684
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 33 ---
L708:	fn_link  L692
	fn_link  L720
	fn_combi_t3 3, 0,1,2,0,0,0
L720:	fn_combi_t46 5, 4,2,0,1,2,3
# --- block 34 ---
L724:	fn_link  L448
	fn_link  L744
	fn_link  L752
	fn_link  L708
	fn_y
L744:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L752:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 35 ---
L760:	fn_link  Lcss.algb
	fn_link  NanoPrelude.zip
	fn_link  L724
	fn_combi_t54 6, 0,1,2,5,3,4
# --- block 36 ---
L776:	fn_link  L400
	fn_link  L760
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 37 ---
L788:	fn_link  L804
	fn_link  L828
	fn_link  Lcss.algc
	fn_combi_t22 5, 0,1,4,3,2,0
L804:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L828:	fn_y
# --- block 38 ---
L832:	fn_link  L840
	fn_combi_t24 6, 0,1,5,2,4,3
L840:	fn_combi_t36 6, 0,1,5,2,3,4
# --- block 39 ---
L844:	fn_link  L864
	fn_link  L888
	fn_link  L788
	fn_link  L832
	fn_combi_t10 5, 0,1,4,2,3,0
L864:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L888:	fn_y
# --- block 40 ---
L892:	fn_link  L900
	fn_combi_t26 6, 0,1,3,5,2,4
L900:	fn_combi_t42 5, 0,3,4,1,4,2
# --- block 41 ---
L904:	fn_link  Lcss.dropL
	fn_link  L844
	fn_link  L892
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 42 ---
L920:	fn_link  Lcss.takeL
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 43 ---
L928:	fn_link  Lcss.algc
	fn_combi_t37 5, 0,2,4,3,1,4
# --- block 44 ---
L936:	fn_link  L944
	fn_combi_t40 5, 0,1,3,4,2,4
L944:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 45 ---
L948:	fn_link  L920
	fn_link  L928
	fn_link  L936
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 46 ---
L964:	fn_link  L948
	fn_link  L976
	fn_combi_t40 5, 0,1,2,4,3,4
L976:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 47 ---
L980:	fn_link  L904
	fn_link  L964
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 48 ---
L992:	fn_link  L1000
	fn_combi_t40 5, 0,1,3,4,2,4
L1000:	fn_combi_t28 5, 0,2,4,1,4,3
# --- block 49 ---
L1004:	fn_link  L1012
	fn_combi_t24 6, 0,1,5,2,3,4
L1012:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 50 ---
L1016:	fn_link  L776
	fn_link  L980
	fn_link  L992
	fn_link  L1004
	fn_combi_t52 6, 0,1,2,4,3,5
# --- block 51 ---
L1036:	fn_link  L1044
	fn_combi_t24 6, 0,1,5,2,3,4
L1044:	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 52 ---
L1048:	fn_link  L384
	fn_link  L392
	fn_link  L1016
	fn_link  L1036
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 53 ---
L1068:	fn_link  L1084
	fn_link  NanoPrelude.quot
	fn_link  L1048
	fn_combi_t16 4, 0,3,1,3,2,0
L1084:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 54 ---
L1092:	fn_link  L1108
	fn_link  L1112
	fn_link  Lcss.elemL
	fn_combi_t37 5, 0,4,3,1,2,4
L1108:	fn_combi_t2 4, 3,0,1,0,0,0
L1112:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 55 ---
L1116:	fn_link  L1128
	fn_link  L1092
	fn_combi_t40 6, 5,0,2,4,1,3
L1128:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 56 ---
L1132:	fn_link  L1116
	fn_combi_t16 6, 1,3,0,2,3,0
# --- block 57 ---
L1140:	fn_link  L1148
	fn_combi_t48 4, 3,0,1,3,2,3
L1148:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 58 ---
L1152:	fn_link  L1132
	fn_link  L1140
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 59 ---
Lcss.elemL:	fn_link  L1176
	fn_link  NanoPrelude.any
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 60 ---
L1176:	fn_link  L1192
	fn_link  L1196
	fn_link  L1200
	fn_combi_t10 5, 4,3,0,1,2,0
L1192:	fn_combi_t0 2, 1,0,0,0,0,0
L1196:	fn_combi_t0 2, 0,0,0,0,0,0
L1200:	fn_elink _prim_eq
# --- block 61 ---
NanoPrelude.any:	fn_link  L1228
	fn_link  L1216
	fn_combi_t3 3, 0,1,2,0,0,0
L1216:	fn_y
# --- block 62 ---
L1220:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 63 ---
L1228:	fn_link  L1220
	fn_link  L1240
	fn_combi_t16 5, 4,0,1,2,3,0
L1240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 64 ---
NanoPrelude.$7c$7c:	fn_link  L1252
	fn_combi_t2 3, 1,2,0,0,0,0
L1252:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 65 ---
Lcss.takeL:	fn_link  L1272
	fn_link  L1320
	fn_link  L1336
	fn_combi_t24 5, 0,1,3,3,4,2
L1272:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 66 ---
L1276:	fn_link  L1292
	fn_link  L1316
	fn_link  Lcss.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L1292:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1316:	fn_y
# --- block 67 ---
L1320:	fn_link  L1276
	fn_link  L1332
	fn_combi_t16 5, 0,3,1,2,4,0
L1332:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 68 ---
L1336:	fn_link  L1352
	fn_link  L1356
	fn_link  L1360
	fn_combi_t44 6, 0,4,1,5,2,3
L1352:	fn_combi_t0 2, 0,0,0,0,0,0
L1356:	fn_elink _prim_le
L1360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 69 ---
Lcss.dropL:	fn_link  L1380
	fn_link  L1424
	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 70 ---
L1380:	fn_link  L1396
	fn_link  L1420
	fn_link  Lcss.dropL
	fn_combi_t8 5, 0,1,3,2,0,0
L1396:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1420:	fn_y
# --- block 71 ---
L1424:	fn_link  L1440
	fn_link  L1444
	fn_link  L1448
	fn_combi_t44 6, 0,4,1,5,2,3
L1440:	fn_combi_t0 2, 0,0,0,0,0,0
L1444:	fn_elink _prim_le
L1448:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 72 ---
NanoPrelude.zip:	fn_link  L1504
	fn_link  L1468
	fn_combi_t6 4, 2,0,1,3,0,0
L1468:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 73 ---
L1472:	fn_link  L1480
	fn_combi_t44 6, 0,1,4,2,3,5
L1480:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 74 ---
L1484:	fn_link  NanoPrelude.zip
	fn_link  L1500
	fn_link  L1472
	fn_combi_t5 4, 0,1,3,2,0,0
L1500:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 75 ---
L1504:	fn_link  L1484
	fn_link  L1516
	fn_combi_t16 5, 2,0,1,3,4,0
L1516:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 76 ---
Lcss.algb:	fn_link  L1788
	fn_link  L1536
	fn_link  L1544
	fn_combi_t16 5, 0,1,2,3,4,0
L1536:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1544:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 77 ---
L1548:	fn_link  L1556
	fn_combi_t2 3, 2,1,0,0,0,0
L1556:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 78 ---
L1564:	fn_link  Lcss.maxI
	fn_link  L1576
	fn_combi_t44 6, 4,2,0,1,3,5
L1576:	fn_elink _prim_eq
# --- block 79 ---
L1580:	fn_link  L1588
	fn_combi_t24 6, 0,1,5,2,4,3
L1588:	fn_combi_t43 6, 0,4,5,1,2,3
# --- block 80 ---
L1592:	fn_link  L1612
	fn_link  L1636
	fn_link  L1564
	fn_link  L1580
	fn_combi_t10 5, 0,1,4,2,3,0
L1612:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1636:	fn_y
# --- block 81 ---
L1640:	fn_link  L1648
	fn_combi_t44 5, 0,1,4,2,3,4
L1648:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 82 ---
L1652:	fn_link  L1668
	fn_link  L1672
	fn_link  L1640
	fn_combi_t44 6, 0,1,5,2,3,4
L1668:	fn_combi_t4 4, 0,2,3,1,0,0
L1672:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 83 ---
L1676:	fn_link  L1684
	fn_combi_t57 6, 4,0,1,5,2,3
L1684:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 84 ---
L1688:	fn_link  L1652
	fn_link  L1676
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 85 ---
L1700:	fn_link  L1708
	fn_combi_t47 6, 5,0,1,2,3,4
L1708:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 86 ---
L1712:	fn_link  L1592
	fn_link  L1688
	fn_link  L1700
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 87 ---
L1728:	fn_link  L1744
	fn_link  L1712
	fn_link  L1752
	fn_combi_t24 5, 0,1,4,2,2,3
L1744:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1752:	fn_y
# --- block 88 ---
L1756:	fn_link  L1728
	fn_combi_t16 5, 1,4,0,2,3,0
# --- block 89 ---
L1764:	fn_link  NanoPrelude.snd
	fn_link  NanoPrelude.map
	fn_combi_t40 5, 3,0,1,4,2,4
# --- block 90 ---
L1776:	fn_link  L1756
	fn_link  L1764
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 91 ---
L1788:	fn_link  L1548
	fn_link  NanoPrelude.map
	fn_link  L1776
	fn_link  L1808
	fn_combi_t42 6, 0,1,4,2,3,5
L1808:	fn_y
# --- block 92 ---
NanoPrelude.map:	fn_link  L1840
	fn_link  L1824
	fn_combi_t3 3, 0,1,2,0,0,0
L1824:	fn_y
# --- block 93 ---
L1828:	fn_link  L1836
	fn_combi_t15 5, 0,1,3,2,4,0
L1836:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 94 ---
L1840:	fn_link  L1828
	fn_link  L1852
	fn_combi_t16 5, 4,0,1,2,3,0
L1852:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 95 ---
NanoPrelude.snd:	fn_link  L1864
	fn_combi_t1 2, 1,0,0,0,0,0
L1864:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 96 ---
Lcss.maxI:	fn_link  L1880
	fn_link  L1884
	fn_combi_t3 3, 0,1,2,0,0,0
L1880:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 97 ---
L1884:	fn_link  L1892
	fn_combi_t10 3, 2,1,0,2,1,0
L1892:	fn_elink _prim_ge
# --- block 98 ---
Lcss.revL:	fn_link  L1908
	fn_link  L1912
	fn_elink NanoPrelude.foldl
L1908:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 99 ---
L1912:	fn_link  L1920
	fn_combi_t2 3, 0,2,1,0,0,0
L1920:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 100 ---
NanoPrelude.quot:	fn_link  L1936
	fn_link  L1960
	fn_combi_t8 4, 0,3,2,1,0,0
L1936:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1960:	fn_y
# --- block 101 ---
NanoPrelude.length:	fn_link  L1976
	fn_link  L2024
	fn_y
L1976:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 102 ---
L1984:	fn_link  L1996
	fn_link  L2020
	fn_combi_t8 5, 2,0,3,1,0,0
L1996:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2020:	fn_y
# --- block 103 ---
L2024:	fn_link  L1984
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 104 ---
Lcss.fromTo:	fn_link  L2048
	fn_link  L2096
	fn_link  L2112
	fn_combi_t10 4, 0,1,3,2,3,0
L2048:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 105 ---
L2052:	fn_link  L2068
	fn_link  L2092
	fn_link  Lcss.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L2068:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2092:	fn_y
# --- block 106 ---
L2096:	fn_link  L2052
	fn_link  L2108
	fn_combi_t16 4, 0,2,1,2,3,0
L2108:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 107 ---
L2112:	fn_link  L2120
	fn_combi_t29 5, 4,3,0,1,4,2
L2120:	fn_elink _prim_gt

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
