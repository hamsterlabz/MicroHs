# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Calendar  (entry @0)
	.text
	.globl	Calendar.append
	.globl	Calendar.bench
	.globl	Calendar.beside
	.globl	Calendar.block
	.globl	Calendar.cal
	.globl	Calendar.cjustify
	.globl	Calendar.copy
	.globl	Calendar.dates
	.globl	Calendar.dropL
	.globl	Calendar.emptyPic
	.globl	Calendar.firstDays
	.globl	Calendar.foldr1L
	.globl	Calendar.fromTo
	.globl	Calendar.groop
	.globl	Calendar.jan1st
	.globl	Calendar.leap
	.globl	Calendar.loop
	.globl	Calendar.monthLengths
	.globl	Calendar.monthNames
	.globl	Calendar.repeatL
	.globl	Calendar.rjustify
	.globl	Calendar.showN
	.globl	Calendar.simIter
	.globl	Calendar.space
	.globl	Calendar.spread
	.globl	Calendar.stack
	.globl	Calendar.takeL
	.globl	Calendar.unlinesL
	.globl	Calendar.zip3L
	.globl	Calendar.zipWithL
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.scanl
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Calendar.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Calendar.bench:	fn_link  L40
L32:	fn_link  L48
	fn_elink Calendar.loop
L40:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L48:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
Calendar.loop:	fn_link  L232
	fn_link  L276
L64:	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 4 ---
L68:	fn_link  L88
	fn_link  L112
L76:	fn_link  L136
	fn_link  L144
L84:	fn_combi_t13 5, 0,1,4,2,3,0
L88:	fn_tor a0
	fn_tor a1
L96:	addw a0,a0,a1
L100:	fn_databox a0,a0
L104:	fn_update a0
L108:	fn_go a0
L112:	fn_tor a0
L116:	fn_tor a1
L120:	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L136:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L144:	fn_y
# --- block 5 ---
L148:	fn_link  L172
	fn_link  L196
	fn_link  L204
	fn_link  Calendar.cal
	fn_link  NanoPrelude.length
	fn_combi_t64 6, 0,1,2,5,3,4
L172:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L196:	fn_box
	.word 0x000007c9	# raw word 1993
	fn_box_body
L204:	fn_y
# --- block 6 ---
L208:	fn_link  L68
	fn_link  L148
	fn_link  L228
	fn_link  Calendar.loop
	fn_combi_t62 6, 0,1,2,5,3,4
L228:	fn_y
# --- block 7 ---
L232:	fn_link  L248
	fn_link  L272
	fn_link  L208
	fn_combi_t43 5, 0,3,4,1,4,2
L248:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L272:	fn_y
# --- block 8 ---
L276:	fn_link  L288
	fn_link  Calendar.simIter
	fn_combi_t29 5, 0,4,1,2,4,3
L288:	fn_elink _prim_gt
# --- block 9 ---
Calendar.simIter:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 10 ---
NanoPrelude.length:	fn_link  L312
	fn_link  L360
	fn_y
L312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L320:	fn_link  L332
	fn_link  L356
	fn_combi_t8 5, 2,0,3,1,0,0
L332:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L356:	fn_y
# --- block 12 ---
L360:	fn_link  L320
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 13 ---
Calendar.cal:	fn_link  L416
	fn_link  L1064
	fn_link  L1160
	fn_link  Calendar.unlinesL
	fn_combi_t58 5, 0,1,4,2,3,4
# --- block 14 ---
L388:	fn_link  L400
	fn_link  L408
	fn_combi_t2 3, 2,0,1,0,0,0
L400:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L408:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 15 ---
L416:	fn_link  L388
	fn_elink Calendar.emptyPic
# --- block 16 ---
L424:	fn_link  Calendar.monthLengths
	fn_link  Calendar.firstDays
	fn_link  Calendar.monthNames
	fn_link  Calendar.zip3L
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 17 ---
L444:	fn_link  Calendar.dates
	fn_link  L460
	fn_link  Calendar.block
	fn_combi_t16 5, 0,1,2,3,4,0
L460:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 18 ---
L468:	fn_link  L480
	fn_link  L484
	fn_combi_t2 4, 3,0,1,0,0,0
L480:	fn_combi_t0 2, 0,0,0,0,0,0
L484:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 19 ---
L492:	fn_link  L468
	fn_link  L504
	fn_combi_t2 4, 3,0,1,0,0,0
L504:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 20 ---
L512:	fn_link  L492
	fn_link  L524
	fn_combi_t2 4, 3,0,1,0,0,0
L524:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 21 ---
L532:	fn_link  L512
	fn_link  L544
	fn_combi_t2 4, 3,0,1,0,0,0
L544:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 22 ---
L552:	fn_link  L532
	fn_link  L564
	fn_combi_t2 4, 3,0,1,0,0,0
L564:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 23 ---
L572:	fn_link  L552
	fn_link  L584
	fn_combi_t2 4, 3,0,1,0,0,0
L584:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 24 ---
L592:	fn_link  L572
	fn_link  L604
	fn_combi_t2 4, 3,0,1,0,0,0
L604:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 25 ---
L612:	fn_link  L592
	fn_link  L624
	fn_combi_t2 4, 3,0,1,0,0,0
L624:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 26 ---
L632:	fn_link  L612
	fn_link  L644
	fn_combi_t2 4, 3,0,1,0,0,0
L644:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 27 ---
L652:	fn_link  L632
	fn_link  L664
	fn_combi_t2 4, 3,0,1,0,0,0
L664:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 28 ---
L672:	fn_link  L652
	fn_link  L684
	fn_combi_t2 4, 3,0,1,0,0,0
L684:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 29 ---
L692:	fn_link  L672
	fn_link  L704
	fn_combi_t2 4, 3,0,1,0,0,0
L704:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 30 ---
L712:	fn_link  L692
	fn_link  L724
	fn_combi_t2 4, 3,0,1,0,0,0
L724:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 31 ---
L732:	fn_link  L712
	fn_link  L744
	fn_combi_t2 4, 3,0,1,0,0,0
L744:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 32 ---
L752:	fn_link  L732
	fn_link  L764
	fn_combi_t2 4, 3,0,1,0,0,0
L764:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 33 ---
L772:	fn_link  L752
	fn_link  L784
	fn_combi_t2 4, 3,0,1,0,0,0
L784:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 34 ---
L792:	fn_link  L772
	fn_link  L804
	fn_combi_t2 4, 3,0,1,0,0,0
L804:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 35 ---
L812:	fn_link  L792
	fn_link  L824
	fn_combi_t2 4, 3,0,1,0,0,0
L824:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 36 ---
L832:	fn_link  L812
	fn_link  L844
	fn_combi_t2 4, 3,0,1,0,0,0
L844:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 37 ---
L852:	fn_link  L832
	fn_link  L864
	fn_combi_t2 4, 3,0,1,0,0,0
L864:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 38 ---
L872:	fn_link  L852
	fn_link  L884
	fn_combi_t2 4, 3,0,1,0,0,0
L884:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 39 ---
L892:	fn_link  L904
	fn_link  L872
	fn_combi_t2 4, 3,0,1,0,0,0
L904:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 40 ---
L908:	fn_link  L444
	fn_link  L892
	fn_link  Calendar.append
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 41 ---
L924:	fn_link  L940
	fn_link  L944
	fn_link  Calendar.cjustify
	fn_combi_t12 6, 5,0,1,3,2,0
L940:	fn_combi_t0 2, 0,0,0,0,0,0
L944:	fn_box
	.word 0x00000015	# raw word 21
	fn_box_body
# --- block 42 ---
L952:	fn_link  L908
	fn_link  L924
	fn_link  Calendar.append
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 43 ---
L968:	fn_link  L952
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 44 ---
L976:	fn_link  L988
	fn_link  L996
	fn_combi_t2 3, 2,0,1,0,0,0
L988:	fn_box
	.word 0x00000019	# raw word 25
	fn_box_body
L996:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 45 ---
L1004:	fn_link  Calendar.beside
	fn_link  Calendar.append
	fn_combi_t54 4, 0,1,1,2,3,2
# --- block 46 ---
L1016:	fn_link  L976
	fn_link  Calendar.emptyPic
	fn_link  L1036
	fn_link  L1004
	fn_combi_t38 6, 0,1,4,5,2,3
L1036:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 47 ---
L1040:	fn_link  L968
	fn_link  L1016
	fn_link  NanoPrelude.map
	fn_link  L1060
	fn_combi_t61 5, 0,1,0,2,4,3
L1060:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 48 ---
L1064:	fn_link  L424
	fn_link  L1040
	fn_link  L1088
	fn_link  Calendar.block
	fn_link  L1096
	fn_combi_t44 6, 0,1,2,3,5,4
L1088:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1096:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 49 ---
L1100:	fn_link  L1112
	fn_link  L1120
	fn_combi_t2 3, 2,0,1,0,0,0
L1112:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
L1120:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 50 ---
L1128:	fn_link  L1148
	fn_link  Calendar.showN
	fn_link  L1152
	fn_link  Calendar.cjustify
	fn_combi_t34 7, 6,0,1,2,4,3
L1148:	fn_combi_t0 2, 0,0,0,0,0,0
L1152:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
# --- block 51 ---
L1160:	fn_link  L1100
	fn_link  Calendar.emptyPic
	fn_link  L1128
	fn_link  Calendar.append
	fn_link  Calendar.append
	fn_combi_t57 6, 0,1,2,5,3,4
# --- block 52 ---
Calendar.unlinesL:	fn_link  L1232
	fn_link  NanoPrelude.concat
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 53 ---
L1196:	fn_link  L1208
	fn_link  L1212
	fn_combi_t2 4, 3,0,1,0,0,0
L1208:	fn_combi_t0 2, 0,0,0,0,0,0
L1212:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 54 ---
L1220:	fn_link  L1196
	fn_link  Calendar.append
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 55 ---
L1232:	fn_link  L1220
	fn_elink NanoPrelude.map
# --- block 56 ---
NanoPrelude.concat:	fn_link  L1252
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L1252:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
NanoPrelude.foldr:	fn_link  L1272
	fn_link  L1268
	fn_combi_t7 4, 0,1,2,3,0,0
L1268:	fn_y
# --- block 58 ---
L1272:	fn_link  L1280
	fn_combi_t16 5, 4,2,0,1,3,0
L1280:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 59 ---
Data.List_Type.$2b$2b:	fn_link  L1312
	fn_link  L1296
	fn_combi_t5 4, 0,1,3,2,0,0
L1296:	fn_y
# --- block 60 ---
L1300:	fn_link  L1308
	fn_combi_t6 4, 0,2,1,3,0,0
L1308:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 61 ---
L1312:	fn_link  L1300
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 62 ---
NanoPrelude.map:	fn_link  L1348
	fn_link  L1332
	fn_combi_t3 3, 0,1,2,0,0,0
L1332:	fn_y
# --- block 63 ---
L1336:	fn_link  L1344
	fn_combi_t15 5, 0,1,3,2,4,0
L1344:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 64 ---
L1348:	fn_link  L1336
	fn_link  L1360
	fn_combi_t16 5, 4,0,1,2,3,0
L1360:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 65 ---
Calendar.append:	fn_link  L1372
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 66 ---
L1372:	fn_link  Calendar.append
	fn_link  L1384
	fn_combi_t16 5, 0,3,1,4,2,0
L1384:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 67 ---
Calendar.cjustify:	fn_link  L1400
	fn_link  L1532
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 68 ---
L1400:	fn_link  L1416
	fn_link  NanoPrelude.length
	fn_link  L1440
	fn_combi_t20 5, 0,1,4,3,2,0
L1416:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1440:	fn_y
# --- block 69 ---
L1444:	fn_link  L1456
	fn_link  NanoPrelude.quot
	fn_combi_t2 3, 0,2,1,0,0,0
L1456:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 70 ---
L1464:	fn_link  L1480
	fn_link  L1504
	fn_link  Calendar.space
	fn_combi_t22 5, 0,1,4,3,2,0
L1480:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1504:	fn_y
# --- block 71 ---
L1508:	fn_link  L1464
	fn_link  Calendar.append
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 72 ---
L1520:	fn_link  Calendar.space
	fn_link  Calendar.append
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 73 ---
L1532:	fn_link  L1444
	fn_link  L1508
	fn_link  L1520
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 74 ---
Calendar.space:	fn_link  L1560
	fn_link  Calendar.copy
	fn_combi_t2 3, 0,2,1,0,0,0
L1560:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 75 ---
Calendar.copy:	fn_link  Calendar.repeatL
	fn_link  Calendar.takeL
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 76 ---
Calendar.takeL:	fn_link  L1596
	fn_link  L1644
	fn_link  L1660
	fn_combi_t24 5, 0,1,3,3,4,2
L1596:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 77 ---
L1600:	fn_link  L1616
	fn_link  L1640
	fn_link  Calendar.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L1616:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1640:	fn_y
# --- block 78 ---
L1644:	fn_link  L1600
	fn_link  L1656
	fn_combi_t16 5, 0,3,1,2,4,0
L1656:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 79 ---
L1660:	fn_link  L1676
	fn_link  L1680
	fn_link  L1684
	fn_combi_t44 6, 0,4,1,5,2,3
L1676:	fn_combi_t0 2, 0,0,0,0,0,0
L1680:	fn_elink _prim_le
L1684:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 80 ---
Calendar.repeatL:	fn_link  Calendar.repeatL
	fn_link  L1704
	fn_combi_t6 3, 0,2,1,2,0,0
L1704:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 81 ---
NanoPrelude.quot:	fn_link  L1720
	fn_link  L1744
	fn_combi_t8 4, 0,3,2,1,0,0
L1720:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1744:	fn_y
# --- block 82 ---
Calendar.showN:	fn_link  L1760
	fn_link  L1920
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 83 ---
L1760:	fn_link  L1776
	fn_link  L1780
	fn_link  L1804
	fn_combi_t13 6, 5,0,3,1,2,0
L1776:	fn_combi_t0 2, 0,0,0,0,0,0
L1780:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1804:	fn_y
# --- block 84 ---
L1808:	fn_link  L1828
	fn_link  L1852
	fn_link  NanoPrelude.rem
	fn_link  L1860
	fn_combi_t18 5, 0,1,4,2,3,0
L1828:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1852:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1860:	fn_y
# --- block 85 ---
L1864:	fn_link  L1876
	fn_link  L1808
	fn_combi_t5 5, 4,0,2,1,0,0
L1876:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 86 ---
L1880:	fn_link  L1900
	fn_link  NanoPrelude.quot
	fn_link  Calendar.showN
	fn_link  Calendar.append
	fn_combi_t21 5, 0,1,2,4,3,0
L1900:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 87 ---
L1908:	fn_link  L1864
	fn_link  L1880
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 88 ---
L1920:	fn_link  L1908
	fn_link  L1936
	fn_link  L1940
	fn_combi_t15 4, 0,3,1,2,3,0
L1936:	fn_elink _prim_lt
L1940:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 89 ---
NanoPrelude.rem:	fn_link  L1960
	fn_link  L1984
	fn_combi_t8 4, 0,3,2,1,0,0
L1960:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1984:	fn_y
# --- block 90 ---
Calendar.emptyPic:	fn_link  L1996
L1992:	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 91 ---
L1996:	fn_link  L2008
	fn_link  Calendar.copy
	fn_combi_t16 4, 0,2,0,3,1,0
L2008:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 92 ---
Calendar.block:	fn_link  L2036
	fn_link  Calendar.stack
	fn_link  L2032
	fn_combi_t6 4, 0,1,2,3,0,0
L2032:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 93 ---
L2036:	fn_link  Calendar.groop
	fn_link  Calendar.spread
	fn_link  NanoPrelude.map
	fn_link  L2056
	fn_combi_t15 5, 0,1,2,3,4,0
L2056:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 94 ---
Calendar.stack:	fn_link  Calendar.append
	fn_elink Calendar.foldr1L
# --- block 95 ---
Calendar.foldr1L:	fn_link  L2084
	fn_link  L2080
	fn_combi_t3 3, 0,1,2,0,0,0
L2080:	fn_y
# --- block 96 ---
L2084:	fn_link  L2100
	fn_link  L2104
	fn_link  L2108
	fn_combi_t47 6, 5,0,1,2,3,4
L2100:	fn_combi_t6 6, 0,2,1,3,0,0
L2104:	fn_combi_t46 4, 3,2,0,1,2,3
L2108:	fn_elink _error0
# --- block 97 ---
Calendar.spread:	fn_link  Calendar.beside
	fn_elink Calendar.foldr1L
# --- block 98 ---
Calendar.beside:	fn_link  Calendar.append
	fn_elink Calendar.zipWithL
# --- block 99 ---
Calendar.zipWithL:	fn_link  L2180
	fn_link  L2140
	fn_combi_t3 3, 0,1,2,0,0,0
L2140:	fn_y
# --- block 100 ---
L2144:	fn_link  L2152
	fn_combi_t40 6, 0,1,2,4,3,5
L2152:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 101 ---
L2156:	fn_link  L2164
	fn_combi_t48 6, 3,0,1,4,2,5
L2164:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 102 ---
L2168:	fn_link  L2144
	fn_link  L2156
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 103 ---
L2180:	fn_link  L2168
	fn_link  L2192
	fn_combi_t46 6, 4,0,1,2,3,5
L2192:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 104 ---
Calendar.groop:	fn_link  L2248
	fn_link  L2260
	fn_link  L2212
	fn_combi_t8 4, 0,1,2,3,0,0
L2212:	fn_y
# --- block 105 ---
L2216:	fn_link  Calendar.dropL
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 106 ---
L2224:	fn_link  Calendar.takeL
	fn_link  L2240
	fn_link  L2244
	fn_combi_t37 6, 0,1,2,3,4,5
L2240:	fn_combi_t2 4, 3,0,1,0,0,0
L2244:	fn_combi_t12 7, 0,1,2,4,3,0
# --- block 107 ---
L2248:	fn_link  L2216
	fn_link  L2224
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 108 ---
L2260:	fn_link  L2268
	fn_combi_t46 4, 3,0,1,2,3,3
L2268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 109 ---
Calendar.dropL:	fn_link  L2284
	fn_link  L2328
	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 110 ---
L2284:	fn_link  L2300
	fn_link  L2324
	fn_link  Calendar.dropL
	fn_combi_t8 5, 0,1,3,2,0,0
L2300:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2324:	fn_y
# --- block 111 ---
L2328:	fn_link  L2344
	fn_link  L2348
	fn_link  L2352
	fn_combi_t44 6, 0,4,1,5,2,3
L2344:	fn_combi_t0 2, 0,0,0,0,0,0
L2348:	fn_elink _prim_le
L2352:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 112 ---
Calendar.dates:	fn_link  L2432
	fn_link  L2680
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 113 ---
L2376:	fn_link  L2396
	fn_link  L2420
	fn_link  L2428
	fn_link  Calendar.fromTo
	fn_combi_t22 5, 0,1,4,2,3,0
L2396:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2420:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L2428:	fn_y
# --- block 114 ---
L2432:	fn_link  L2452
	fn_link  L2476
	fn_link  L2484
	fn_link  L2376
	fn_combi_t50 5, 0,4,1,4,2,3
L2452:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2476:	fn_box
	.word 0x0000002a	# raw word 42
	fn_box_body
L2484:	fn_y
# --- block 115 ---
L2488:	fn_link  L2500
	fn_link  L2504
	fn_combi_t2 4, 3,0,1,0,0,0
L2500:	fn_combi_t0 2, 0,0,0,0,0,0
L2504:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 116 ---
L2512:	fn_link  L2488
	fn_link  L2524
	fn_combi_t2 4, 3,0,1,0,0,0
L2524:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 117 ---
L2532:	fn_link  L2512
	fn_link  L2544
	fn_combi_t2 4, 3,0,1,0,0,0
L2544:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 118 ---
L2552:	fn_link  L2564
	fn_link  L2532
	fn_combi_t2 4, 3,0,1,0,0,0
L2564:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 119 ---
L2568:	fn_link  L2588
	fn_link  Calendar.showN
	fn_link  L2592
	fn_link  Calendar.rjustify
	fn_combi_t34 7, 6,0,1,2,4,3
L2588:	fn_combi_t0 2, 0,0,0,0,0,0
L2592:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 120 ---
L2600:	fn_link  L2616
	fn_link  L2620
	fn_link  L2624
	fn_combi_t10 5, 4,3,0,1,2,0
L2616:	fn_combi_t0 2, 1,0,0,0,0,0
L2620:	fn_combi_t0 2, 0,0,0,0,0,0
L2624:	fn_elink _prim_lt
# --- block 121 ---
L2628:	fn_link  L2652
	fn_link  L2656
	fn_link  L2660
	fn_link  L2664
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t52 6, 0,1,5,2,3,4
L2652:	fn_combi_t0 2, 1,0,0,0,0,0
L2656:	fn_combi_t0 2, 0,0,0,0,0,0
L2660:	fn_elink _prim_lt
L2664:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 122 ---
L2672:	fn_link  L2628
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 123 ---
L2680:	fn_link  L2552
	fn_link  L2568
	fn_link  L2600
	fn_link  L2672
	fn_combi_t24 6, 0,1,4,2,5,3
# --- block 124 ---
NanoPrelude.$7c$7c:	fn_link  L2708
	fn_combi_t2 3, 1,2,0,0,0,0
L2708:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 125 ---
Calendar.rjustify:	fn_link  L2724
	fn_link  Calendar.append
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 126 ---
L2724:	fn_link  L2744
	fn_link  NanoPrelude.length
	fn_link  L2768
	fn_link  Calendar.space
	fn_combi_t62 6, 0,1,2,5,4,3
L2744:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2768:	fn_y
# --- block 127 ---
Calendar.fromTo:	fn_link  L2788
	fn_link  L2836
	fn_link  L2852
	fn_combi_t10 4, 0,1,3,2,3,0
L2788:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 128 ---
L2792:	fn_link  L2808
	fn_link  L2832
	fn_link  Calendar.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L2808:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2832:	fn_y
# --- block 129 ---
L2836:	fn_link  L2792
	fn_link  L2848
	fn_combi_t16 4, 0,2,1,2,3,0
L2848:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 130 ---
L2852:	fn_link  L2860
	fn_combi_t29 5, 4,3,0,1,4,2
L2860:	fn_elink _prim_gt
# --- block 131 ---
Calendar.zip3L:	fn_link  L2904
	fn_link  L2924
	fn_link  L2936
	fn_link  L2948
	fn_combi_t25 6, 0,4,1,5,2,3
# --- block 132 ---
L2884:	fn_link  L2892
	fn_combi_t46 6, 0,1,2,3,4,5
L2892:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 133 ---
L2896:	fn_link  L2884
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 134 ---
L2904:	fn_link  Calendar.zip3L
	fn_link  L2920
	fn_link  L2896
	fn_combi_t26 6, 0,1,3,5,2,4
L2920:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 135 ---
L2924:	fn_link  L2932
	fn_combi_t46 6, 1,0,2,3,4,5
L2932:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 136 ---
L2936:	fn_link  L2944
	fn_combi_t47 6, 1,0,2,3,4,5
L2944:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 137 ---
L2948:	fn_link  L2956
	fn_combi_t47 6, 1,0,2,3,5,4
L2956:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 138 ---
Calendar.monthNames:	fn_link  L4480
	fn_link  L4616
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 139 ---
L2972:	fn_link  L2984
	fn_link  L2988
	fn_combi_t2 4, 3,0,1,0,0,0
L2984:	fn_combi_t0 2, 0,0,0,0,0,0
L2988:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 140 ---
L2996:	fn_link  L2972
	fn_link  L3008
	fn_combi_t2 4, 3,0,1,0,0,0
L3008:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 141 ---
L3016:	fn_link  L2996
	fn_link  L3028
	fn_combi_t2 4, 3,0,1,0,0,0
L3028:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 142 ---
L3036:	fn_link  L3016
	fn_link  L3048
	fn_combi_t2 4, 3,0,1,0,0,0
L3048:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 143 ---
L3056:	fn_link  L3036
	fn_link  L3068
	fn_combi_t2 4, 3,0,1,0,0,0
L3068:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 144 ---
L3076:	fn_link  L3056
	fn_link  L3088
	fn_combi_t2 4, 3,0,1,0,0,0
L3088:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 145 ---
L3096:	fn_link  L3076
	fn_link  L3108
	fn_combi_t2 4, 3,0,1,0,0,0
L3108:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 146 ---
L3116:	fn_link  L3096
	fn_link  L3128
	fn_combi_t2 4, 3,0,1,0,0,0
L3128:	fn_box
	.word 0x00000044	# raw word 68
	fn_box_body
# --- block 147 ---
L3136:	fn_link  L3148
	fn_link  L3116
	fn_combi_t2 4, 3,0,1,0,0,0
L3148:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 148 ---
L3152:	fn_link  L3164
	fn_link  L3168
	fn_combi_t2 4, 3,0,1,0,0,0
L3164:	fn_combi_t0 2, 0,0,0,0,0,0
L3168:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 149 ---
L3176:	fn_link  L3152
	fn_link  L3188
	fn_combi_t2 4, 3,0,1,0,0,0
L3188:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 150 ---
L3196:	fn_link  L3176
	fn_link  L3208
	fn_combi_t2 4, 3,0,1,0,0,0
L3208:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 151 ---
L3216:	fn_link  L3196
	fn_link  L3228
	fn_combi_t2 4, 3,0,1,0,0,0
L3228:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 152 ---
L3236:	fn_link  L3216
	fn_link  L3248
	fn_combi_t2 4, 3,0,1,0,0,0
L3248:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 153 ---
L3256:	fn_link  L3236
	fn_link  L3268
	fn_combi_t2 4, 3,0,1,0,0,0
L3268:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 154 ---
L3276:	fn_link  L3256
	fn_link  L3288
	fn_combi_t2 4, 3,0,1,0,0,0
L3288:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 155 ---
L3296:	fn_link  L3276
	fn_link  L3308
	fn_combi_t2 4, 3,0,1,0,0,0
L3308:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 156 ---
L3316:	fn_link  L3136
	fn_link  L3296
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 157 ---
L3328:	fn_link  L3340
	fn_link  L3344
	fn_combi_t2 4, 3,0,1,0,0,0
L3340:	fn_combi_t0 2, 0,0,0,0,0,0
L3344:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 158 ---
L3352:	fn_link  L3328
	fn_link  L3364
	fn_combi_t2 4, 3,0,1,0,0,0
L3364:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 159 ---
L3372:	fn_link  L3352
	fn_link  L3384
	fn_combi_t2 4, 3,0,1,0,0,0
L3384:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 160 ---
L3392:	fn_link  L3372
	fn_link  L3404
	fn_combi_t2 4, 3,0,1,0,0,0
L3404:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 161 ---
L3412:	fn_link  L3392
	fn_link  L3424
	fn_combi_t2 4, 3,0,1,0,0,0
L3424:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 162 ---
L3432:	fn_link  L3412
	fn_link  L3444
	fn_combi_t2 4, 3,0,1,0,0,0
L3444:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 163 ---
L3452:	fn_link  L3432
	fn_link  L3464
	fn_combi_t2 4, 3,0,1,0,0,0
L3464:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 164 ---
L3472:	fn_link  L3316
	fn_link  L3452
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 165 ---
L3484:	fn_link  L3496
	fn_link  L3500
	fn_combi_t2 4, 3,0,1,0,0,0
L3496:	fn_combi_t0 2, 0,0,0,0,0,0
L3500:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 166 ---
L3508:	fn_link  L3484
	fn_link  L3520
	fn_combi_t2 4, 3,0,1,0,0,0
L3520:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 167 ---
L3528:	fn_link  L3508
	fn_link  L3540
	fn_combi_t2 4, 3,0,1,0,0,0
L3540:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 168 ---
L3548:	fn_link  L3528
	fn_link  L3560
	fn_combi_t2 4, 3,0,1,0,0,0
L3560:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 169 ---
L3568:	fn_link  L3548
	fn_link  L3580
	fn_combi_t2 4, 3,0,1,0,0,0
L3580:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 170 ---
L3588:	fn_link  L3568
	fn_link  L3600
	fn_combi_t2 4, 3,0,1,0,0,0
L3600:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 171 ---
L3608:	fn_link  L3588
	fn_link  L3620
	fn_combi_t2 4, 3,0,1,0,0,0
L3620:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 172 ---
L3628:	fn_link  L3608
	fn_link  L3640
	fn_combi_t2 4, 3,0,1,0,0,0
L3640:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 173 ---
L3648:	fn_link  L3628
	fn_link  L3660
	fn_combi_t2 4, 3,0,1,0,0,0
L3660:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 174 ---
L3668:	fn_link  L3472
	fn_link  L3648
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 175 ---
L3680:	fn_link  L3692
	fn_link  L3696
	fn_combi_t2 4, 3,0,1,0,0,0
L3692:	fn_combi_t0 2, 0,0,0,0,0,0
L3696:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 176 ---
L3704:	fn_link  L3680
	fn_link  L3716
	fn_combi_t2 4, 3,0,1,0,0,0
L3716:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 177 ---
L3724:	fn_link  L3704
	fn_link  L3736
	fn_combi_t2 4, 3,0,1,0,0,0
L3736:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 178 ---
L3744:	fn_link  L3724
	fn_link  L3756
	fn_combi_t2 4, 3,0,1,0,0,0
L3756:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 179 ---
L3764:	fn_link  L3744
	fn_link  L3776
	fn_combi_t2 4, 3,0,1,0,0,0
L3776:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 180 ---
L3784:	fn_link  L3764
	fn_link  L3796
	fn_combi_t2 4, 3,0,1,0,0,0
L3796:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 181 ---
L3804:	fn_link  L3668
	fn_link  L3784
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 182 ---
L3816:	fn_link  L3828
	fn_link  L3832
	fn_combi_t2 4, 3,0,1,0,0,0
L3828:	fn_combi_t0 2, 0,0,0,0,0,0
L3832:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 183 ---
L3840:	fn_link  L3816
	fn_link  L3852
	fn_combi_t2 4, 3,0,1,0,0,0
L3852:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 184 ---
L3860:	fn_link  L3840
	fn_link  L3872
	fn_combi_t2 4, 3,0,1,0,0,0
L3872:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 185 ---
L3880:	fn_link  L3860
	fn_link  L3892
	fn_combi_t2 4, 3,0,1,0,0,0
L3892:	fn_box
	.word 0x0000004a	# raw word 74
	fn_box_body
# --- block 186 ---
L3900:	fn_link  L3804
	fn_link  L3880
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 187 ---
L3912:	fn_link  L3924
	fn_link  L3928
	fn_combi_t2 4, 3,0,1,0,0,0
L3924:	fn_combi_t0 2, 0,0,0,0,0,0
L3928:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 188 ---
L3936:	fn_link  L3912
	fn_link  L3948
	fn_combi_t2 4, 3,0,1,0,0,0
L3948:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 189 ---
L3956:	fn_link  L3936
	fn_link  L3968
	fn_combi_t2 4, 3,0,1,0,0,0
L3968:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 190 ---
L3976:	fn_link  L3956
	fn_link  L3988
	fn_combi_t2 4, 3,0,1,0,0,0
L3988:	fn_box
	.word 0x0000004a	# raw word 74
	fn_box_body
# --- block 191 ---
L3996:	fn_link  L3900
	fn_link  L3976
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 192 ---
L4008:	fn_link  L4020
	fn_link  L4024
	fn_combi_t2 4, 3,0,1,0,0,0
L4020:	fn_combi_t0 2, 0,0,0,0,0,0
L4024:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 193 ---
L4032:	fn_link  L4008
	fn_link  L4044
	fn_combi_t2 4, 3,0,1,0,0,0
L4044:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 194 ---
L4052:	fn_link  L4032
	fn_link  L4064
	fn_combi_t2 4, 3,0,1,0,0,0
L4064:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 195 ---
L4072:	fn_link  L3996
	fn_link  L4052
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 196 ---
L4084:	fn_link  L4096
	fn_link  L4100
	fn_combi_t2 4, 3,0,1,0,0,0
L4096:	fn_combi_t0 2, 0,0,0,0,0,0
L4100:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 197 ---
L4108:	fn_link  L4084
	fn_link  L4120
	fn_combi_t2 4, 3,0,1,0,0,0
L4120:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 198 ---
L4128:	fn_link  L4108
	fn_link  L4140
	fn_combi_t2 4, 3,0,1,0,0,0
L4140:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 199 ---
L4148:	fn_link  L4128
	fn_link  L4160
	fn_combi_t2 4, 3,0,1,0,0,0
L4160:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 200 ---
L4168:	fn_link  L4148
	fn_link  L4180
	fn_combi_t2 4, 3,0,1,0,0,0
L4180:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 201 ---
L4188:	fn_link  L4072
	fn_link  L4168
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 202 ---
L4200:	fn_link  L4212
	fn_link  L4216
	fn_combi_t2 4, 3,0,1,0,0,0
L4212:	fn_combi_t0 2, 0,0,0,0,0,0
L4216:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 203 ---
L4224:	fn_link  L4200
	fn_link  L4236
	fn_combi_t2 4, 3,0,1,0,0,0
L4236:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 204 ---
L4244:	fn_link  L4224
	fn_link  L4256
	fn_combi_t2 4, 3,0,1,0,0,0
L4256:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 205 ---
L4264:	fn_link  L4244
	fn_link  L4276
	fn_combi_t2 4, 3,0,1,0,0,0
L4276:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 206 ---
L4284:	fn_link  L4264
	fn_link  L4296
	fn_combi_t2 4, 3,0,1,0,0,0
L4296:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 207 ---
L4304:	fn_link  L4188
	fn_link  L4284
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 208 ---
L4316:	fn_link  L4328
	fn_link  L4332
	fn_combi_t2 4, 3,0,1,0,0,0
L4328:	fn_combi_t0 2, 0,0,0,0,0,0
L4332:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 209 ---
L4340:	fn_link  L4316
	fn_link  L4352
	fn_combi_t2 4, 3,0,1,0,0,0
L4352:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 210 ---
L4360:	fn_link  L4340
	fn_link  L4372
	fn_combi_t2 4, 3,0,1,0,0,0
L4372:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 211 ---
L4380:	fn_link  L4360
	fn_link  L4392
	fn_combi_t2 4, 3,0,1,0,0,0
L4392:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 212 ---
L4400:	fn_link  L4380
	fn_link  L4412
	fn_combi_t2 4, 3,0,1,0,0,0
L4412:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 213 ---
L4420:	fn_link  L4400
	fn_link  L4432
	fn_combi_t2 4, 3,0,1,0,0,0
L4432:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 214 ---
L4440:	fn_link  L4420
	fn_link  L4452
	fn_combi_t2 4, 3,0,1,0,0,0
L4452:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 215 ---
L4460:	fn_link  L4440
	fn_link  L4472
	fn_combi_t2 4, 3,0,1,0,0,0
L4472:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 216 ---
L4480:	fn_link  L4304
	fn_link  L4460
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 217 ---
L4492:	fn_link  L4504
	fn_link  L4508
	fn_combi_t2 4, 3,0,1,0,0,0
L4504:	fn_combi_t0 2, 0,0,0,0,0,0
L4508:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 218 ---
L4516:	fn_link  L4492
	fn_link  L4528
	fn_combi_t2 4, 3,0,1,0,0,0
L4528:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 219 ---
L4536:	fn_link  L4516
	fn_link  L4548
	fn_combi_t2 4, 3,0,1,0,0,0
L4548:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 220 ---
L4556:	fn_link  L4536
	fn_link  L4568
	fn_combi_t2 4, 3,0,1,0,0,0
L4568:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 221 ---
L4576:	fn_link  L4556
	fn_link  L4588
	fn_combi_t2 4, 3,0,1,0,0,0
L4588:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 222 ---
L4596:	fn_link  L4576
	fn_link  L4608
	fn_combi_t2 4, 3,0,1,0,0,0
L4608:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 223 ---
L4616:	fn_link  L4596
	fn_link  L4628
	fn_combi_t2 4, 3,0,1,0,0,0
L4628:	fn_box
	.word 0x0000004a	# raw word 74
	fn_box_body
# --- block 224 ---
Calendar.firstDays:	fn_link  L4708
	fn_link  L4728
	fn_link  NanoPrelude.map
	fn_link  L4660
	fn_link  Calendar.takeL
	fn_combi_t48 6, 0,1,2,3,4,5
L4660:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 225 ---
L4668:	fn_link  L4680
	fn_link  L4704
	fn_combi_t8 4, 0,3,2,1,0,0
L4680:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4704:	fn_y
# --- block 226 ---
L4708:	fn_link  Calendar.monthLengths
	fn_link  Calendar.jan1st
	fn_link  L4668
	fn_link  NanoPrelude.scanl
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 227 ---
L4728:	fn_link  L4740
	fn_link  NanoPrelude.rem
	fn_combi_t2 3, 0,2,1,0,0,0
L4740:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 228 ---
NanoPrelude.scanl:	fn_link  L4784
	fn_link  L4760
	fn_combi_t3 3, 0,1,2,0,0,0
L4760:	fn_y
# --- block 229 ---
L4764:	fn_link  L4776
	fn_link  L4780
	fn_combi_t48 5, 0,3,4,1,2,3
L4776:	fn_combi_t0 2, 0,0,0,0,0,0
L4780:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 230 ---
L4784:	fn_link  L4796
	fn_link  L4764
	fn_combi_t7 4, 0,1,2,3,0,0
L4796:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 231 ---
Calendar.jan1st:	fn_link  L4812
	fn_link  L5040
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 232 ---
L4812:	fn_link  L4824
	fn_link  L4848
	fn_combi_t3 3, 0,2,1,0,0,0
L4824:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4848:	fn_y
# --- block 233 ---
L4852:	fn_link  L4872
	fn_link  L4896
	fn_link  NanoPrelude.quot
	fn_link  L4904
	fn_combi_t56 6, 0,1,5,2,4,3
L4872:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4896:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L4904:	fn_y
# --- block 234 ---
L4908:	fn_link  L4920
	fn_link  NanoPrelude.quot
	fn_combi_t42 5, 0,4,1,2,4,3
L4920:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 235 ---
L4928:	fn_link  L4944
	fn_link  L4852
	fn_link  L4908
	fn_combi_t5 4, 0,1,3,2,0,0
L4944:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 236 ---
L4968:	fn_link  L4984
	fn_link  L4928
	fn_link  L5008
	fn_combi_t12 5, 0,1,3,4,2,0
L4984:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5008:	fn_y
# --- block 237 ---
L5012:	fn_link  L5028
	fn_link  NanoPrelude.quot
	fn_link  L5036
	fn_combi_t56 5, 0,1,4,2,3,4
L5028:	fn_box
	.word 0x00000190	# raw word 400
	fn_box_body
L5036:	fn_y
# --- block 238 ---
L5040:	fn_link  L5060
	fn_link  L4968
	fn_link  L5012
	fn_link  NanoPrelude.rem
	fn_combi_t33 6, 0,1,2,4,5,3
L5060:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 239 ---
Calendar.monthLengths:	fn_link  L5292
	fn_link  L5080
	fn_combi_t6 5, 4,0,1,2,0,0
L5080:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 240 ---
L5088:	fn_link  L5100
	fn_link  L5104
	fn_combi_t2 4, 3,0,1,0,0,0
L5100:	fn_combi_t0 2, 0,0,0,0,0,0
L5104:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 241 ---
L5112:	fn_link  L5088
	fn_link  L5124
	fn_combi_t2 4, 3,0,1,0,0,0
L5124:	fn_box
	.word 0x0000001e	# raw word 30
	fn_box_body
# --- block 242 ---
L5132:	fn_link  L5112
	fn_link  L5144
	fn_combi_t2 4, 3,0,1,0,0,0
L5144:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 243 ---
L5152:	fn_link  L5132
	fn_link  L5164
	fn_combi_t2 4, 3,0,1,0,0,0
L5164:	fn_box
	.word 0x0000001e	# raw word 30
	fn_box_body
# --- block 244 ---
L5172:	fn_link  L5152
	fn_link  L5184
	fn_combi_t2 4, 3,0,1,0,0,0
L5184:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 245 ---
L5192:	fn_link  L5172
	fn_link  L5204
	fn_combi_t2 4, 3,0,1,0,0,0
L5204:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 246 ---
L5212:	fn_link  L5192
	fn_link  L5224
	fn_combi_t2 4, 3,0,1,0,0,0
L5224:	fn_box
	.word 0x0000001e	# raw word 30
	fn_box_body
# --- block 247 ---
L5232:	fn_link  L5212
	fn_link  L5244
	fn_combi_t2 4, 3,0,1,0,0,0
L5244:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 248 ---
L5252:	fn_link  L5232
	fn_link  L5264
	fn_combi_t2 4, 3,0,1,0,0,0
L5264:	fn_box
	.word 0x0000001e	# raw word 30
	fn_box_body
# --- block 249 ---
L5272:	fn_link  L5252
	fn_link  L5284
	fn_combi_t2 4, 3,0,1,0,0,0
L5284:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
# --- block 250 ---
L5292:	fn_link  L5272
	fn_link  L5312
	fn_link  L5320
	fn_link  Calendar.leap
	fn_combi_t32 7, 6,0,4,1,2,3
L5312:	fn_box
	.word 0x0000001d	# raw word 29
	fn_box_body
L5320:	fn_box
	.word 0x0000001c	# raw word 28
	fn_box_body
# --- block 251 ---
Calendar.leap:	fn_link  L5344
	fn_link  L5348
	fn_link  L5484
	fn_combi_t16 4, 0,3,1,3,2,0
L5344:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 252 ---
L5348:	fn_link  L5372
	fn_link  L5376
	fn_link  L5380
	fn_link  NanoPrelude.rem
	fn_link  L5388
	fn_combi_t32 6, 0,1,5,2,3,4
L5372:	fn_combi_t0 2, 0,0,0,0,0,0
L5376:	fn_elink _prim_eq
L5380:	fn_box
	.word 0x00000190	# raw word 400
	fn_box_body
L5388:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 253 ---
L5396:	fn_link  L5420
	fn_link  L5424
	fn_link  L5428
	fn_link  NanoPrelude.rem
	fn_link  L5436
	fn_combi_t32 6, 0,1,5,2,3,4
L5420:	fn_combi_t0 2, 0,0,0,0,0,0
L5424:	fn_elink _prim_eq
L5428:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L5436:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 254 ---
L5444:	fn_link  L5464
	fn_link  L5468
	fn_link  NanoPrelude.rem
	fn_link  L5476
	fn_combi_t18 5, 0,1,4,2,3,0
L5464:	fn_elink _prim_eq
L5468:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
L5476:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 255 ---
L5484:	fn_link  L5500
	fn_link  L5396
	fn_link  L5444
	fn_combi_t16 4, 0,3,1,3,2,0
L5500:	fn_combi_t0 2, 1,0,0,0,0,0

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
