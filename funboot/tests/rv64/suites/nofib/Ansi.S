# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Ansi  (entry @0)
	.text
	.globl	Ansi.append
	.globl	Ansi.at
	.globl	Ansi.bench
	.globl	Ansi.cls
	.globl	Ansi.copy
	.globl	Ansi.end
	.globl	Ansi.goto
	.globl	Ansi.hashS
	.globl	Ansi.highlight
	.globl	Ansi.moveTo
	.globl	Ansi.pressAnyKey
	.globl	Ansi.program
	.globl	Ansi.promptReadAt
	.globl	Ansi.readAt
	.globl	Ansi.readChar
	.globl	Ansi.repeatL
	.globl	Ansi.revL
	.globl	Ansi.ringBell
	.globl	Ansi.showN
	.globl	Ansi.simIter
	.globl	Ansi.str1
	.globl	Ansi.str2
	.globl	Ansi.str3
	.globl	Ansi.str4
	.globl	Ansi.str5
	.globl	Ansi.str6
	.globl	Ansi.str7
	.globl	Ansi.str8
	.globl	Ansi.str9
	.globl	Ansi.tailL
	.globl	Ansi.takeL
	.globl	Ansi.writeAt
	.globl	Ansi.writeChar
	.globl	Ansi.writeString
	.globl	Ansi.writes
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Ansi.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Ansi.bench:	fn_link  L56
L32:	fn_elink Ansi.hashS
# --- block 3 ---
L36:	fn_link  Ansi.program
L40:	fn_elink Ansi.repeatL
# --- block 4 ---
L44:	fn_link  L36
L48:	fn_link  Ansi.simIter
	fn_elink Ansi.takeL
# --- block 5 ---
L56:	fn_link  L76
	fn_link  L44
	fn_link  L80
L68:	fn_link  L84
L72:	fn_elink NanoPrelude.foldr
L76:	fn_combi_t0 2, 0,0,0,0,0,0
L80:	fn_combi_t0 1, 0,0,0,0,0,0
L84:	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 6 ---
Ansi.hashS:	fn_link  L100
	fn_link  L188
L96:	fn_elink NanoPrelude.foldl
L100:	fn_box
L104:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
L108:	fn_link  L128
L112:	fn_link  L152
L116:	fn_link  L176
L120:	fn_link  L184
	fn_combi_t41 6, 0,1,4,2,5,3
L128:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L152:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L176:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L184:	fn_y
# --- block 8 ---
L188:	fn_link  L108
	fn_link  L200
	fn_combi_t7 4, 0,1,2,3,0,0
L200:	fn_y
# --- block 9 ---
NanoPrelude.foldl:	fn_link  L220
	fn_link  L216
	fn_combi_t3 3, 0,1,2,0,0,0
L216:	fn_y
# --- block 10 ---
L220:	fn_link  L228
	fn_combi_t46 5, 4,3,0,1,2,3
L228:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 11 ---
NanoPrelude.foldr:	fn_link  L248
	fn_link  L244
	fn_combi_t7 4, 0,1,2,3,0,0
L244:	fn_y
# --- block 12 ---
L248:	fn_link  L256
	fn_combi_t16 5, 4,2,0,1,3,0
L256:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 13 ---
Ansi.takeL:	fn_link  L276
	fn_link  L324
	fn_link  L340
	fn_combi_t24 5, 0,1,3,3,4,2
L276:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L280:	fn_link  L296
	fn_link  L320
	fn_link  Ansi.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L296:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L320:	fn_y
# --- block 15 ---
L324:	fn_link  L280
	fn_link  L336
	fn_combi_t16 5, 0,3,1,2,4,0
L336:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L340:	fn_link  L356
	fn_link  L360
	fn_link  L364
	fn_combi_t44 6, 0,4,1,5,2,3
L356:	fn_combi_t0 2, 0,0,0,0,0,0
L360:	fn_elink _prim_le
L364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 17 ---
Ansi.simIter:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 18 ---
Ansi.repeatL:	fn_link  Ansi.repeatL
	fn_link  L392
	fn_combi_t6 3, 0,2,1,2,0,0
L392:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
Ansi.program:	fn_link  L688
	fn_link  L1020
	fn_elink Ansi.writes
# --- block 20 ---
L408:	fn_link  L420
	fn_link  L424
	fn_combi_t2 4, 3,0,1,0,0,0
L420:	fn_combi_t0 2, 0,0,0,0,0,0
L424:	fn_box
	.word 0x00000021	# raw word 33
	fn_box_body
# --- block 21 ---
L432:	fn_link  L408
	fn_link  Ansi.append
	fn_link  Ansi.str8
	fn_link  Ansi.append
	fn_combi_t16 5, 0,1,2,4,3,0
# --- block 22 ---
L452:	fn_link  Ansi.end
	fn_elink Ansi.pressAnyKey
# --- block 23 ---
L460:	fn_link  L452
	fn_link  Ansi.str9
	fn_elink Ansi.writeString
# --- block 24 ---
L472:	fn_link  L484
	fn_link  L492
	fn_combi_t2 3, 2,0,1,0,0,0
L484:	fn_box
	.word 0x00000017	# raw word 23
	fn_box_body
L492:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 25 ---
L500:	fn_link  L460
	fn_link  L472
	fn_elink Ansi.moveTo
# --- block 26 ---
L512:	fn_link  L536
	fn_link  L560
	fn_link  L568
	fn_link  NanoPrelude.length
	fn_link  NanoPrelude.quot
	fn_combi_t38 6, 0,1,5,2,3,4
L536:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L560:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
L568:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 27 ---
L576:	fn_link  L592
	fn_link  L512
	fn_link  L600
	fn_combi_t13 5, 4,0,1,3,2,0
L592:	fn_box
	.word 0x00000012	# raw word 18
	fn_box_body
L600:	fn_y
# --- block 28 ---
L604:	fn_link  L500
	fn_link  L576
	fn_link  Ansi.writeAt
	fn_combi_t10 4, 0,1,3,3,2,0
# --- block 29 ---
L620:	fn_link  L432
	fn_link  L604
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 30 ---
L632:	fn_link  L644
	fn_link  L652
	fn_combi_t2 3, 2,0,1,0,0,0
L644:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
L652:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 31 ---
L660:	fn_link  L620
	fn_link  Ansi.str7
	fn_link  L680
	fn_link  L632
	fn_elink Ansi.promptReadAt
L680:	fn_box
	.word 0x00000012	# raw word 18
	fn_box_body
# --- block 32 ---
L688:	fn_link  L660
	fn_elink Ansi.pressAnyKey
# --- block 33 ---
L696:	fn_link  L708
	fn_link  L716
	fn_combi_t2 3, 2,0,1,0,0,0
L708:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
L716:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 34 ---
L724:	fn_link  Ansi.str6
	fn_link  L696
	fn_elink Ansi.at
# --- block 35 ---
L736:	fn_link  L748
	fn_link  L724
	fn_combi_t2 4, 3,0,1,0,0,0
L748:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 36 ---
L752:	fn_link  L764
	fn_link  L772
	fn_combi_t2 3, 2,0,1,0,0,0
L764:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
L772:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 37 ---
L780:	fn_link  Ansi.str5
	fn_link  L752
	fn_elink Ansi.at
# --- block 38 ---
L792:	fn_link  L736
	fn_link  L780
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 39 ---
L804:	fn_link  L816
	fn_link  L824
	fn_combi_t2 3, 2,0,1,0,0,0
L816:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L824:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 40 ---
L832:	fn_link  Ansi.str4
	fn_link  L804
	fn_elink Ansi.at
# --- block 41 ---
L844:	fn_link  L792
	fn_link  L832
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L856:	fn_link  L868
	fn_link  L876
	fn_combi_t2 3, 2,0,1,0,0,0
L868:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L876:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 43 ---
L884:	fn_link  Ansi.str3
	fn_link  L856
	fn_elink Ansi.at
# --- block 44 ---
L896:	fn_link  L844
	fn_link  L884
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 45 ---
L908:	fn_link  L920
	fn_link  L928
	fn_combi_t2 3, 2,0,1,0,0,0
L920:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L928:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 46 ---
L936:	fn_link  Ansi.str2
	fn_link  L908
	fn_elink Ansi.at
# --- block 47 ---
L948:	fn_link  L896
	fn_link  L936
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 48 ---
L960:	fn_link  Ansi.str1
	fn_elink Ansi.highlight
# --- block 49 ---
L968:	fn_link  L980
	fn_link  L988
	fn_combi_t2 3, 2,0,1,0,0,0
L980:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L988:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 50 ---
L996:	fn_link  L960
	fn_link  L968
	fn_elink Ansi.at
# --- block 51 ---
L1008:	fn_link  L948
	fn_link  L996
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 52 ---
L1020:	fn_link  L1008
	fn_link  Ansi.cls
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
Ansi.writes:	fn_link  NanoPrelude.concat
	fn_link  Ansi.writeString
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
Ansi.writeString:	fn_link  Ansi.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 55 ---
Ansi.append:	fn_link  L1060
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 56 ---
L1060:	fn_link  Ansi.append
	fn_link  L1072
	fn_combi_t16 5, 0,3,1,4,2,0
L1072:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 57 ---
NanoPrelude.concat:	fn_link  L1088
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L1088:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
Data.List_Type.$2b$2b:	fn_link  L1120
	fn_link  L1104
	fn_combi_t5 4, 0,1,3,2,0,0
L1104:	fn_y
# --- block 59 ---
L1108:	fn_link  L1116
	fn_combi_t6 4, 0,2,1,3,0,0
L1116:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 60 ---
L1120:	fn_link  L1108
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 61 ---
Ansi.cls:	fn_link  L1140
	fn_link  L1144
	fn_combi_t2 4, 3,0,1,0,0,0
L1140:	fn_combi_t0 2, 0,0,0,0,0,0
L1144:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 62 ---
Ansi.at:	fn_link  L1160
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 63 ---
L1160:	fn_link  Ansi.goto
	fn_link  Ansi.append
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 64 ---
Ansi.goto:	fn_link  L1228
	fn_link  L1264
	fn_link  L1192
	fn_link  L1200
	fn_combi_t47 6, 0,1,2,3,4,5
L1192:	fn_box
	.word 0x0000001b	# raw word 27
	fn_box_body
L1200:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 65 ---
L1204:	fn_link  L1216
	fn_link  L1220
	fn_combi_t2 4, 3,0,1,0,0,0
L1216:	fn_combi_t0 2, 0,0,0,0,0,0
L1220:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 66 ---
L1228:	fn_link  L1204
	fn_link  Ansi.showN
	fn_link  Ansi.append
	fn_link  L1252
	fn_link  L1260
	fn_combi_t47 6, 0,1,2,3,5,4
L1252:	fn_box
	.word 0x0000003b	# raw word 59
	fn_box_body
L1260:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 67 ---
L1264:	fn_link  Ansi.showN
	fn_link  Ansi.append
	fn_link  L1284
	fn_link  L1292
	fn_combi_t47 6, 0,1,2,3,5,4
L1284:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L1292:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 68 ---
Ansi.showN:	fn_link  L1308
	fn_link  L1468
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 69 ---
L1308:	fn_link  L1324
	fn_link  L1328
	fn_link  L1352
	fn_combi_t13 6, 5,0,3,1,2,0
L1324:	fn_combi_t0 2, 0,0,0,0,0,0
L1328:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1352:	fn_y
# --- block 70 ---
L1356:	fn_link  L1376
	fn_link  L1400
	fn_link  NanoPrelude.rem
	fn_link  L1408
	fn_combi_t18 5, 0,1,4,2,3,0
L1376:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1400:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L1408:	fn_y
# --- block 71 ---
L1412:	fn_link  L1424
	fn_link  L1356
	fn_combi_t5 5, 4,0,2,1,0,0
L1424:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 72 ---
L1428:	fn_link  L1448
	fn_link  NanoPrelude.quot
	fn_link  Ansi.showN
	fn_link  Ansi.append
	fn_combi_t21 5, 0,1,2,4,3,0
L1448:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 73 ---
L1456:	fn_link  L1412
	fn_link  L1428
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 74 ---
L1468:	fn_link  L1456
	fn_link  L1484
	fn_link  L1488
	fn_combi_t15 4, 0,3,1,2,3,0
L1484:	fn_elink _prim_lt
L1488:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 75 ---
NanoPrelude.quot:	fn_link  L1508
	fn_link  L1532
	fn_combi_t8 4, 0,3,2,1,0,0
L1508:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1532:	fn_y
# --- block 76 ---
NanoPrelude.rem:	fn_link  L1548
	fn_link  L1572
	fn_combi_t8 4, 0,3,2,1,0,0
L1548:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1572:	fn_y
# --- block 77 ---
Ansi.highlight:	fn_link  L1660
	fn_link  Ansi.append
	fn_link  L1744
	fn_link  Ansi.append
	fn_combi_t16 5, 0,1,2,4,3,0
# --- block 78 ---
L1596:	fn_link  L1608
	fn_link  L1612
	fn_combi_t2 4, 3,0,1,0,0,0
L1608:	fn_combi_t0 2, 0,0,0,0,0,0
L1612:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 79 ---
L1620:	fn_link  L1596
	fn_link  L1632
	fn_combi_t2 4, 3,0,1,0,0,0
L1632:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 80 ---
L1640:	fn_link  L1620
	fn_link  L1652
	fn_combi_t2 4, 3,0,1,0,0,0
L1652:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 81 ---
L1660:	fn_link  L1640
	fn_link  L1672
	fn_combi_t2 4, 3,0,1,0,0,0
L1672:	fn_box
	.word 0x0000001b	# raw word 27
	fn_box_body
# --- block 82 ---
L1680:	fn_link  L1692
	fn_link  L1696
	fn_combi_t2 4, 3,0,1,0,0,0
L1692:	fn_combi_t0 2, 0,0,0,0,0,0
L1696:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 83 ---
L1704:	fn_link  L1680
	fn_link  L1716
	fn_combi_t2 4, 3,0,1,0,0,0
L1716:	fn_box
	.word 0x00000037	# raw word 55
	fn_box_body
# --- block 84 ---
L1724:	fn_link  L1704
	fn_link  L1736
	fn_combi_t2 4, 3,0,1,0,0,0
L1736:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
# --- block 85 ---
L1744:	fn_link  L1724
	fn_link  L1756
	fn_combi_t2 4, 3,0,1,0,0,0
L1756:	fn_box
	.word 0x0000001b	# raw word 27
	fn_box_body
# --- block 86 ---
Ansi.str1:	fn_link  L2168
	fn_link  L1776
	fn_combi_t2 4, 3,0,1,0,0,0
L1776:	fn_box
	.word 0x00000044	# raw word 68
	fn_box_body
# --- block 87 ---
L1784:	fn_link  L1796
	fn_link  L1800
	fn_combi_t2 4, 3,0,1,0,0,0
L1796:	fn_combi_t0 2, 0,0,0,0,0,0
L1800:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 88 ---
L1808:	fn_link  L1784
	fn_link  L1820
	fn_combi_t2 4, 3,0,1,0,0,0
L1820:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 89 ---
L1828:	fn_link  L1808
	fn_link  L1840
	fn_combi_t2 4, 3,0,1,0,0,0
L1840:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 90 ---
L1848:	fn_link  L1828
	fn_link  L1860
	fn_combi_t2 4, 3,0,1,0,0,0
L1860:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 91 ---
L1868:	fn_link  L1848
	fn_link  L1880
	fn_combi_t2 4, 3,0,1,0,0,0
L1880:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 92 ---
L1888:	fn_link  L1868
	fn_link  L1900
	fn_combi_t2 4, 3,0,1,0,0,0
L1900:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 93 ---
L1908:	fn_link  L1888
	fn_link  L1920
	fn_combi_t2 4, 3,0,1,0,0,0
L1920:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 94 ---
L1928:	fn_link  L1908
	fn_link  L1940
	fn_combi_t2 4, 3,0,1,0,0,0
L1940:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 95 ---
L1948:	fn_link  L1928
	fn_link  L1960
	fn_combi_t2 4, 3,0,1,0,0,0
L1960:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 96 ---
L1968:	fn_link  L1948
	fn_link  L1980
	fn_combi_t2 4, 3,0,1,0,0,0
L1980:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 97 ---
L1988:	fn_link  L1968
	fn_link  L2000
	fn_combi_t2 4, 3,0,1,0,0,0
L2000:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 98 ---
L2008:	fn_link  L1988
	fn_link  L2020
	fn_combi_t2 4, 3,0,1,0,0,0
L2020:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 99 ---
L2028:	fn_link  L2008
	fn_link  L2040
	fn_combi_t2 4, 3,0,1,0,0,0
L2040:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 100 ---
L2048:	fn_link  L2028
	fn_link  L2060
	fn_combi_t2 4, 3,0,1,0,0,0
L2060:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 101 ---
L2068:	fn_link  L2048
	fn_link  L2080
	fn_combi_t2 4, 3,0,1,0,0,0
L2080:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 102 ---
L2088:	fn_link  L2068
	fn_link  L2100
	fn_combi_t2 4, 3,0,1,0,0,0
L2100:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 103 ---
L2108:	fn_link  L2088
	fn_link  L2120
	fn_combi_t2 4, 3,0,1,0,0,0
L2120:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 104 ---
L2128:	fn_link  L2108
	fn_link  L2140
	fn_combi_t2 4, 3,0,1,0,0,0
L2140:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 105 ---
L2148:	fn_link  L2128
	fn_link  L2160
	fn_combi_t2 4, 3,0,1,0,0,0
L2160:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 106 ---
L2168:	fn_link  L2148
	fn_link  L2180
	fn_combi_t2 4, 3,0,1,0,0,0
L2180:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 107 ---
Ansi.str2:	fn_link  L2392
	fn_link  L2200
	fn_combi_t2 4, 3,0,1,0,0,0
L2200:	fn_box
	.word 0x00000056	# raw word 86
	fn_box_body
# --- block 108 ---
L2208:	fn_link  L2220
	fn_link  L2224
	fn_combi_t2 4, 3,0,1,0,0,0
L2220:	fn_combi_t0 2, 0,0,0,0,0,0
L2224:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 109 ---
L2232:	fn_link  L2208
	fn_link  L2244
	fn_combi_t2 4, 3,0,1,0,0,0
L2244:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 110 ---
L2252:	fn_link  L2232
	fn_link  L2264
	fn_combi_t2 4, 3,0,1,0,0,0
L2264:	fn_box
	.word 0x00000031	# raw word 49
	fn_box_body
# --- block 111 ---
L2272:	fn_link  L2252
	fn_link  L2284
	fn_combi_t2 4, 3,0,1,0,0,0
L2284:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 112 ---
L2292:	fn_link  L2272
	fn_link  L2304
	fn_combi_t2 4, 3,0,1,0,0,0
L2304:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 113 ---
L2312:	fn_link  L2292
	fn_link  L2324
	fn_combi_t2 4, 3,0,1,0,0,0
L2324:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 114 ---
L2332:	fn_link  L2312
	fn_link  L2344
	fn_combi_t2 4, 3,0,1,0,0,0
L2344:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 115 ---
L2352:	fn_link  L2332
	fn_link  L2364
	fn_combi_t2 4, 3,0,1,0,0,0
L2364:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 116 ---
L2372:	fn_link  L2352
	fn_link  L2384
	fn_combi_t2 4, 3,0,1,0,0,0
L2384:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 117 ---
L2392:	fn_link  L2372
	fn_link  L2404
	fn_combi_t2 4, 3,0,1,0,0,0
L2404:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 118 ---
Ansi.str3:	fn_link  L3236
	fn_link  L2424
	fn_combi_t2 4, 3,0,1,0,0,0
L2424:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 119 ---
L2432:	fn_link  L2444
	fn_link  L2448
	fn_combi_t2 4, 3,0,1,0,0,0
L2444:	fn_combi_t0 2, 0,0,0,0,0,0
L2448:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 120 ---
L2456:	fn_link  L2432
	fn_link  L2468
	fn_combi_t2 4, 3,0,1,0,0,0
L2468:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 121 ---
L2476:	fn_link  L2456
	fn_link  L2488
	fn_combi_t2 4, 3,0,1,0,0,0
L2488:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 122 ---
L2496:	fn_link  L2476
	fn_link  L2508
	fn_combi_t2 4, 3,0,1,0,0,0
L2508:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 123 ---
L2516:	fn_link  L2496
	fn_link  L2528
	fn_combi_t2 4, 3,0,1,0,0,0
L2528:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 124 ---
L2536:	fn_link  L2516
	fn_link  L2548
	fn_combi_t2 4, 3,0,1,0,0,0
L2548:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 125 ---
L2556:	fn_link  L2536
	fn_link  L2568
	fn_combi_t2 4, 3,0,1,0,0,0
L2568:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 126 ---
L2576:	fn_link  L2556
	fn_link  L2588
	fn_combi_t2 4, 3,0,1,0,0,0
L2588:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 127 ---
L2596:	fn_link  L2576
	fn_link  L2608
	fn_combi_t2 4, 3,0,1,0,0,0
L2608:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 128 ---
L2616:	fn_link  L2596
	fn_link  L2628
	fn_combi_t2 4, 3,0,1,0,0,0
L2628:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 129 ---
L2636:	fn_link  L2616
	fn_link  L2648
	fn_combi_t2 4, 3,0,1,0,0,0
L2648:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 130 ---
L2656:	fn_link  L2636
	fn_link  L2668
	fn_combi_t2 4, 3,0,1,0,0,0
L2668:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 131 ---
L2676:	fn_link  L2656
	fn_link  L2688
	fn_combi_t2 4, 3,0,1,0,0,0
L2688:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 132 ---
L2696:	fn_link  L2676
	fn_link  L2708
	fn_combi_t2 4, 3,0,1,0,0,0
L2708:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 133 ---
L2716:	fn_link  L2696
	fn_link  L2728
	fn_combi_t2 4, 3,0,1,0,0,0
L2728:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 134 ---
L2736:	fn_link  L2716
	fn_link  L2748
	fn_combi_t2 4, 3,0,1,0,0,0
L2748:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 135 ---
L2756:	fn_link  L2736
	fn_link  L2768
	fn_combi_t2 4, 3,0,1,0,0,0
L2768:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 136 ---
L2776:	fn_link  L2756
	fn_link  L2788
	fn_combi_t2 4, 3,0,1,0,0,0
L2788:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 137 ---
L2796:	fn_link  L2776
	fn_link  L2808
	fn_combi_t2 4, 3,0,1,0,0,0
L2808:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 138 ---
L2816:	fn_link  L2796
	fn_link  L2828
	fn_combi_t2 4, 3,0,1,0,0,0
L2828:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 139 ---
L2836:	fn_link  L2816
	fn_link  L2848
	fn_combi_t2 4, 3,0,1,0,0,0
L2848:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 140 ---
L2856:	fn_link  L2836
	fn_link  L2868
	fn_combi_t2 4, 3,0,1,0,0,0
L2868:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 141 ---
L2876:	fn_link  L2856
	fn_link  L2888
	fn_combi_t2 4, 3,0,1,0,0,0
L2888:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 142 ---
L2896:	fn_link  L2876
	fn_link  L2908
	fn_combi_t2 4, 3,0,1,0,0,0
L2908:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 143 ---
L2916:	fn_link  L2896
	fn_link  L2928
	fn_combi_t2 4, 3,0,1,0,0,0
L2928:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 144 ---
L2936:	fn_link  L2916
	fn_link  L2948
	fn_combi_t2 4, 3,0,1,0,0,0
L2948:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 145 ---
L2956:	fn_link  L2936
	fn_link  L2968
	fn_combi_t2 4, 3,0,1,0,0,0
L2968:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 146 ---
L2976:	fn_link  L2956
	fn_link  L2988
	fn_combi_t2 4, 3,0,1,0,0,0
L2988:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 147 ---
L2996:	fn_link  L2976
	fn_link  L3008
	fn_combi_t2 4, 3,0,1,0,0,0
L3008:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 148 ---
L3016:	fn_link  L2996
	fn_link  L3028
	fn_combi_t2 4, 3,0,1,0,0,0
L3028:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 149 ---
L3036:	fn_link  L3016
	fn_link  L3048
	fn_combi_t2 4, 3,0,1,0,0,0
L3048:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 150 ---
L3056:	fn_link  L3036
	fn_link  L3068
	fn_combi_t2 4, 3,0,1,0,0,0
L3068:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 151 ---
L3076:	fn_link  L3056
	fn_link  L3088
	fn_combi_t2 4, 3,0,1,0,0,0
L3088:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 152 ---
L3096:	fn_link  L3076
	fn_link  L3108
	fn_combi_t2 4, 3,0,1,0,0,0
L3108:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 153 ---
L3116:	fn_link  L3096
	fn_link  L3128
	fn_combi_t2 4, 3,0,1,0,0,0
L3128:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 154 ---
L3136:	fn_link  L3116
	fn_link  L3148
	fn_combi_t2 4, 3,0,1,0,0,0
L3148:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 155 ---
L3156:	fn_link  L3136
	fn_link  L3168
	fn_combi_t2 4, 3,0,1,0,0,0
L3168:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 156 ---
L3176:	fn_link  L3156
	fn_link  L3188
	fn_combi_t2 4, 3,0,1,0,0,0
L3188:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 157 ---
L3196:	fn_link  L3176
	fn_link  L3208
	fn_combi_t2 4, 3,0,1,0,0,0
L3208:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 158 ---
L3216:	fn_link  L3196
	fn_link  L3228
	fn_combi_t2 4, 3,0,1,0,0,0
L3228:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 159 ---
L3236:	fn_link  L3216
	fn_link  L3248
	fn_combi_t2 4, 3,0,1,0,0,0
L3248:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 160 ---
Ansi.str4:	fn_link  L4080
	fn_link  L3268
	fn_combi_t2 4, 3,0,1,0,0,0
L3268:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 161 ---
L3276:	fn_link  L3288
	fn_link  L3292
	fn_combi_t2 4, 3,0,1,0,0,0
L3288:	fn_combi_t0 2, 0,0,0,0,0,0
L3292:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 162 ---
L3300:	fn_link  L3276
	fn_link  L3312
	fn_combi_t2 4, 3,0,1,0,0,0
L3312:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 163 ---
L3320:	fn_link  L3300
	fn_link  L3332
	fn_combi_t2 4, 3,0,1,0,0,0
L3332:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 164 ---
L3340:	fn_link  L3320
	fn_link  L3352
	fn_combi_t2 4, 3,0,1,0,0,0
L3352:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 165 ---
L3360:	fn_link  L3340
	fn_link  L3372
	fn_combi_t2 4, 3,0,1,0,0,0
L3372:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 166 ---
L3380:	fn_link  L3360
	fn_link  L3392
	fn_combi_t2 4, 3,0,1,0,0,0
L3392:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 167 ---
L3400:	fn_link  L3380
	fn_link  L3412
	fn_combi_t2 4, 3,0,1,0,0,0
L3412:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 168 ---
L3420:	fn_link  L3400
	fn_link  L3432
	fn_combi_t2 4, 3,0,1,0,0,0
L3432:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 169 ---
L3440:	fn_link  L3420
	fn_link  L3452
	fn_combi_t2 4, 3,0,1,0,0,0
L3452:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 170 ---
L3460:	fn_link  L3440
	fn_link  L3472
	fn_combi_t2 4, 3,0,1,0,0,0
L3472:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 171 ---
L3480:	fn_link  L3460
	fn_link  L3492
	fn_combi_t2 4, 3,0,1,0,0,0
L3492:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 172 ---
L3500:	fn_link  L3480
	fn_link  L3512
	fn_combi_t2 4, 3,0,1,0,0,0
L3512:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 173 ---
L3520:	fn_link  L3500
	fn_link  L3532
	fn_combi_t2 4, 3,0,1,0,0,0
L3532:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 174 ---
L3540:	fn_link  L3520
	fn_link  L3552
	fn_combi_t2 4, 3,0,1,0,0,0
L3552:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 175 ---
L3560:	fn_link  L3540
	fn_link  L3572
	fn_combi_t2 4, 3,0,1,0,0,0
L3572:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 176 ---
L3580:	fn_link  L3560
	fn_link  L3592
	fn_combi_t2 4, 3,0,1,0,0,0
L3592:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 177 ---
L3600:	fn_link  L3580
	fn_link  L3612
	fn_combi_t2 4, 3,0,1,0,0,0
L3612:	fn_box
	.word 0x00000076	# raw word 118
	fn_box_body
# --- block 178 ---
L3620:	fn_link  L3600
	fn_link  L3632
	fn_combi_t2 4, 3,0,1,0,0,0
L3632:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 179 ---
L3640:	fn_link  L3620
	fn_link  L3652
	fn_combi_t2 4, 3,0,1,0,0,0
L3652:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 180 ---
L3660:	fn_link  L3640
	fn_link  L3672
	fn_combi_t2 4, 3,0,1,0,0,0
L3672:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 181 ---
L3680:	fn_link  L3660
	fn_link  L3692
	fn_combi_t2 4, 3,0,1,0,0,0
L3692:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 182 ---
L3700:	fn_link  L3680
	fn_link  L3712
	fn_combi_t2 4, 3,0,1,0,0,0
L3712:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 183 ---
L3720:	fn_link  L3700
	fn_link  L3732
	fn_combi_t2 4, 3,0,1,0,0,0
L3732:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 184 ---
L3740:	fn_link  L3720
	fn_link  L3752
	fn_combi_t2 4, 3,0,1,0,0,0
L3752:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 185 ---
L3760:	fn_link  L3740
	fn_link  L3772
	fn_combi_t2 4, 3,0,1,0,0,0
L3772:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 186 ---
L3780:	fn_link  L3760
	fn_link  L3792
	fn_combi_t2 4, 3,0,1,0,0,0
L3792:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 187 ---
L3800:	fn_link  L3780
	fn_link  L3812
	fn_combi_t2 4, 3,0,1,0,0,0
L3812:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 188 ---
L3820:	fn_link  L3800
	fn_link  L3832
	fn_combi_t2 4, 3,0,1,0,0,0
L3832:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 189 ---
L3840:	fn_link  L3820
	fn_link  L3852
	fn_combi_t2 4, 3,0,1,0,0,0
L3852:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 190 ---
L3860:	fn_link  L3840
	fn_link  L3872
	fn_combi_t2 4, 3,0,1,0,0,0
L3872:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 191 ---
L3880:	fn_link  L3860
	fn_link  L3892
	fn_combi_t2 4, 3,0,1,0,0,0
L3892:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 192 ---
L3900:	fn_link  L3880
	fn_link  L3912
	fn_combi_t2 4, 3,0,1,0,0,0
L3912:	fn_box
	.word 0x00000062	# raw word 98
	fn_box_body
# --- block 193 ---
L3920:	fn_link  L3900
	fn_link  L3932
	fn_combi_t2 4, 3,0,1,0,0,0
L3932:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 194 ---
L3940:	fn_link  L3920
	fn_link  L3952
	fn_combi_t2 4, 3,0,1,0,0,0
L3952:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 195 ---
L3960:	fn_link  L3940
	fn_link  L3972
	fn_combi_t2 4, 3,0,1,0,0,0
L3972:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 196 ---
L3980:	fn_link  L3960
	fn_link  L3992
	fn_combi_t2 4, 3,0,1,0,0,0
L3992:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 197 ---
L4000:	fn_link  L3980
	fn_link  L4012
	fn_combi_t2 4, 3,0,1,0,0,0
L4012:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 198 ---
L4020:	fn_link  L4000
	fn_link  L4032
	fn_combi_t2 4, 3,0,1,0,0,0
L4032:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 199 ---
L4040:	fn_link  L4020
	fn_link  L4052
	fn_combi_t2 4, 3,0,1,0,0,0
L4052:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 200 ---
L4060:	fn_link  L4040
	fn_link  L4072
	fn_combi_t2 4, 3,0,1,0,0,0
L4072:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 201 ---
L4080:	fn_link  L4060
	fn_link  L4092
	fn_combi_t2 4, 3,0,1,0,0,0
L4092:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 202 ---
Ansi.str5:	fn_link  L4864
	fn_link  L4112
	fn_combi_t2 4, 3,0,1,0,0,0
L4112:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 203 ---
L4120:	fn_link  L4132
	fn_link  L4136
	fn_combi_t2 4, 3,0,1,0,0,0
L4132:	fn_combi_t0 2, 0,0,0,0,0,0
L4136:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 204 ---
L4144:	fn_link  L4120
	fn_link  L4156
	fn_combi_t2 4, 3,0,1,0,0,0
L4156:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 205 ---
L4164:	fn_link  L4144
	fn_link  L4176
	fn_combi_t2 4, 3,0,1,0,0,0
L4176:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 206 ---
L4184:	fn_link  L4164
	fn_link  L4196
	fn_combi_t2 4, 3,0,1,0,0,0
L4196:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 207 ---
L4204:	fn_link  L4184
	fn_link  L4216
	fn_combi_t2 4, 3,0,1,0,0,0
L4216:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 208 ---
L4224:	fn_link  L4204
	fn_link  L4236
	fn_combi_t2 4, 3,0,1,0,0,0
L4236:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 209 ---
L4244:	fn_link  L4224
	fn_link  L4256
	fn_combi_t2 4, 3,0,1,0,0,0
L4256:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 210 ---
L4264:	fn_link  L4244
	fn_link  L4276
	fn_combi_t2 4, 3,0,1,0,0,0
L4276:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 211 ---
L4284:	fn_link  L4264
	fn_link  L4296
	fn_combi_t2 4, 3,0,1,0,0,0
L4296:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 212 ---
L4304:	fn_link  L4284
	fn_link  L4316
	fn_combi_t2 4, 3,0,1,0,0,0
L4316:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 213 ---
L4324:	fn_link  L4304
	fn_link  L4336
	fn_combi_t2 4, 3,0,1,0,0,0
L4336:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 214 ---
L4344:	fn_link  L4324
	fn_link  L4356
	fn_combi_t2 4, 3,0,1,0,0,0
L4356:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 215 ---
L4364:	fn_link  L4344
	fn_link  L4376
	fn_combi_t2 4, 3,0,1,0,0,0
L4376:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 216 ---
L4384:	fn_link  L4364
	fn_link  L4396
	fn_combi_t2 4, 3,0,1,0,0,0
L4396:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 217 ---
L4404:	fn_link  L4384
	fn_link  L4416
	fn_combi_t2 4, 3,0,1,0,0,0
L4416:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 218 ---
L4424:	fn_link  L4404
	fn_link  L4436
	fn_combi_t2 4, 3,0,1,0,0,0
L4436:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 219 ---
L4444:	fn_link  L4424
	fn_link  L4456
	fn_combi_t2 4, 3,0,1,0,0,0
L4456:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 220 ---
L4464:	fn_link  L4444
	fn_link  L4476
	fn_combi_t2 4, 3,0,1,0,0,0
L4476:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 221 ---
L4484:	fn_link  L4464
	fn_link  L4496
	fn_combi_t2 4, 3,0,1,0,0,0
L4496:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 222 ---
L4504:	fn_link  L4484
	fn_link  L4516
	fn_combi_t2 4, 3,0,1,0,0,0
L4516:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 223 ---
L4524:	fn_link  L4504
	fn_link  L4536
	fn_combi_t2 4, 3,0,1,0,0,0
L4536:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 224 ---
L4544:	fn_link  L4524
	fn_link  L4556
	fn_combi_t2 4, 3,0,1,0,0,0
L4556:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 225 ---
L4564:	fn_link  L4544
	fn_link  L4576
	fn_combi_t2 4, 3,0,1,0,0,0
L4576:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 226 ---
L4584:	fn_link  L4564
	fn_link  L4596
	fn_combi_t2 4, 3,0,1,0,0,0
L4596:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 227 ---
L4604:	fn_link  L4584
	fn_link  L4616
	fn_combi_t2 4, 3,0,1,0,0,0
L4616:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 228 ---
L4624:	fn_link  L4604
	fn_link  L4636
	fn_combi_t2 4, 3,0,1,0,0,0
L4636:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 229 ---
L4644:	fn_link  L4624
	fn_link  L4656
	fn_combi_t2 4, 3,0,1,0,0,0
L4656:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 230 ---
L4664:	fn_link  L4644
	fn_link  L4676
	fn_combi_t2 4, 3,0,1,0,0,0
L4676:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 231 ---
L4684:	fn_link  L4664
	fn_link  L4696
	fn_combi_t2 4, 3,0,1,0,0,0
L4696:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 232 ---
L4704:	fn_link  L4684
	fn_link  L4716
	fn_combi_t2 4, 3,0,1,0,0,0
L4716:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 233 ---
L4724:	fn_link  L4704
	fn_link  L4736
	fn_combi_t2 4, 3,0,1,0,0,0
L4736:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 234 ---
L4744:	fn_link  L4724
	fn_link  L4756
	fn_combi_t2 4, 3,0,1,0,0,0
L4756:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 235 ---
L4764:	fn_link  L4744
	fn_link  L4776
	fn_combi_t2 4, 3,0,1,0,0,0
L4776:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 236 ---
L4784:	fn_link  L4764
	fn_link  L4796
	fn_combi_t2 4, 3,0,1,0,0,0
L4796:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 237 ---
L4804:	fn_link  L4784
	fn_link  L4816
	fn_combi_t2 4, 3,0,1,0,0,0
L4816:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 238 ---
L4824:	fn_link  L4804
	fn_link  L4836
	fn_combi_t2 4, 3,0,1,0,0,0
L4836:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 239 ---
L4844:	fn_link  L4824
	fn_link  L4856
	fn_combi_t2 4, 3,0,1,0,0,0
L4856:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 240 ---
L4864:	fn_link  L4844
	fn_link  L4876
	fn_combi_t2 4, 3,0,1,0,0,0
L4876:	fn_box
	.word 0x00000068	# raw word 104
	fn_box_body
# --- block 241 ---
Ansi.str6:	fn_link  L5588
	fn_link  L4896
	fn_combi_t2 4, 3,0,1,0,0,0
L4896:	fn_box
	.word 0x00000050	# raw word 80
	fn_box_body
# --- block 242 ---
L4904:	fn_link  L4916
	fn_link  L4920
	fn_combi_t2 4, 3,0,1,0,0,0
L4916:	fn_combi_t0 2, 0,0,0,0,0,0
L4920:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 243 ---
L4928:	fn_link  L4904
	fn_link  L4940
	fn_combi_t2 4, 3,0,1,0,0,0
L4940:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 244 ---
L4948:	fn_link  L4928
	fn_link  L4960
	fn_combi_t2 4, 3,0,1,0,0,0
L4960:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 245 ---
L4968:	fn_link  L4948
	fn_link  L4980
	fn_combi_t2 4, 3,0,1,0,0,0
L4980:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 246 ---
L4988:	fn_link  L4968
	fn_link  L5000
	fn_combi_t2 4, 3,0,1,0,0,0
L5000:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 247 ---
L5008:	fn_link  L4988
	fn_link  L5020
	fn_combi_t2 4, 3,0,1,0,0,0
L5020:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 248 ---
L5028:	fn_link  L5008
	fn_link  L5040
	fn_combi_t2 4, 3,0,1,0,0,0
L5040:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 249 ---
L5048:	fn_link  L5028
	fn_link  L5060
	fn_combi_t2 4, 3,0,1,0,0,0
L5060:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 250 ---
L5068:	fn_link  L5048
	fn_link  L5080
	fn_combi_t2 4, 3,0,1,0,0,0
L5080:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 251 ---
L5088:	fn_link  L5068
	fn_link  L5100
	fn_combi_t2 4, 3,0,1,0,0,0
L5100:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 252 ---
L5108:	fn_link  L5088
	fn_link  L5120
	fn_combi_t2 4, 3,0,1,0,0,0
L5120:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 253 ---
L5128:	fn_link  L5108
	fn_link  L5140
	fn_combi_t2 4, 3,0,1,0,0,0
L5140:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 254 ---
L5148:	fn_link  L5128
	fn_link  L5160
	fn_combi_t2 4, 3,0,1,0,0,0
L5160:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 255 ---
L5168:	fn_link  L5148
	fn_link  L5180
	fn_combi_t2 4, 3,0,1,0,0,0
L5180:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 256 ---
L5188:	fn_link  L5168
	fn_link  L5200
	fn_combi_t2 4, 3,0,1,0,0,0
L5200:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 257 ---
L5208:	fn_link  L5188
	fn_link  L5220
	fn_combi_t2 4, 3,0,1,0,0,0
L5220:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 258 ---
L5228:	fn_link  L5208
	fn_link  L5240
	fn_combi_t2 4, 3,0,1,0,0,0
L5240:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 259 ---
L5248:	fn_link  L5228
	fn_link  L5260
	fn_combi_t2 4, 3,0,1,0,0,0
L5260:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 260 ---
L5268:	fn_link  L5248
	fn_link  L5280
	fn_combi_t2 4, 3,0,1,0,0,0
L5280:	fn_box
	.word 0x0000006b	# raw word 107
	fn_box_body
# --- block 261 ---
L5288:	fn_link  L5268
	fn_link  L5300
	fn_combi_t2 4, 3,0,1,0,0,0
L5300:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 262 ---
L5308:	fn_link  L5288
	fn_link  L5320
	fn_combi_t2 4, 3,0,1,0,0,0
L5320:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 263 ---
L5328:	fn_link  L5308
	fn_link  L5340
	fn_combi_t2 4, 3,0,1,0,0,0
L5340:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 264 ---
L5348:	fn_link  L5328
	fn_link  L5360
	fn_combi_t2 4, 3,0,1,0,0,0
L5360:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 265 ---
L5368:	fn_link  L5348
	fn_link  L5380
	fn_combi_t2 4, 3,0,1,0,0,0
L5380:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 266 ---
L5388:	fn_link  L5368
	fn_link  L5400
	fn_combi_t2 4, 3,0,1,0,0,0
L5400:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 267 ---
L5408:	fn_link  L5388
	fn_link  L5420
	fn_combi_t2 4, 3,0,1,0,0,0
L5420:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 268 ---
L5428:	fn_link  L5408
	fn_link  L5440
	fn_combi_t2 4, 3,0,1,0,0,0
L5440:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 269 ---
L5448:	fn_link  L5428
	fn_link  L5460
	fn_combi_t2 4, 3,0,1,0,0,0
L5460:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 270 ---
L5468:	fn_link  L5448
	fn_link  L5480
	fn_combi_t2 4, 3,0,1,0,0,0
L5480:	fn_box
	.word 0x00000070	# raw word 112
	fn_box_body
# --- block 271 ---
L5488:	fn_link  L5468
	fn_link  L5500
	fn_combi_t2 4, 3,0,1,0,0,0
L5500:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 272 ---
L5508:	fn_link  L5488
	fn_link  L5520
	fn_combi_t2 4, 3,0,1,0,0,0
L5520:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 273 ---
L5528:	fn_link  L5508
	fn_link  L5540
	fn_combi_t2 4, 3,0,1,0,0,0
L5540:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 274 ---
L5548:	fn_link  L5528
	fn_link  L5560
	fn_combi_t2 4, 3,0,1,0,0,0
L5560:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 275 ---
L5568:	fn_link  L5548
	fn_link  L5580
	fn_combi_t2 4, 3,0,1,0,0,0
L5580:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 276 ---
L5588:	fn_link  L5568
	fn_link  L5600
	fn_combi_t2 4, 3,0,1,0,0,0
L5600:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 277 ---
Ansi.pressAnyKey:	fn_link  L5620
	fn_link  Ansi.readChar
	fn_combi_t6 3, 0,2,1,2,0,0
L5620:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 278 ---
Ansi.readChar:	fn_link  L5632
	fn_combi_t5 4, 3,1,0,2,0,0
L5632:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 279 ---
Ansi.promptReadAt:	fn_link  L5708
	fn_link  L5744
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 280 ---
L5648:	fn_link  L5664
	fn_link  NanoPrelude.length
	fn_link  L5688
	fn_combi_t62 6, 5,0,1,3,4,2
L5664:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5688:	fn_y
# --- block 281 ---
L5692:	fn_link  L5648
	fn_combi_t9 5, 0,1,2,4,3,0
# --- block 282 ---
L5700:	fn_link  Ansi.readAt
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 283 ---
L5708:	fn_link  L5692
	fn_link  L5700
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 284 ---
L5720:	fn_link  Ansi.writeAt
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 285 ---
L5728:	fn_link  L5740
	fn_link  L5720
	fn_combi_t38 5, 0,1,4,2,3,4
L5740:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 286 ---
L5744:	fn_link  L5728
	fn_combi_t58 5, 1,0,3,2,3,4
# --- block 287 ---
Ansi.writeAt:	fn_link  L5760
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 288 ---
L5760:	fn_link  Ansi.goto
	fn_link  Ansi.append
	fn_link  Ansi.writeString
	fn_combi_t54 6, 0,1,2,4,5,3
# --- block 289 ---
Ansi.readAt:	fn_link  L6520
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 290 ---
L5784:	fn_link  Ansi.revL
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 291 ---
L5792:	fn_link  L5800
	fn_combi_t1 2, 1,0,0,0,0,0
L5800:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 292 ---
L5804:	fn_link  L5812
	fn_combi_t2 3, 0,2,1,0,0,0
L5812:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 293 ---
L5816:	fn_link  L5828
	fn_link  L5852
	fn_combi_t41 6, 2,0,3,1,4,5
L5828:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L5852:	fn_y
# --- block 294 ---
L5856:	fn_link  Ansi.writeChar
	fn_combi_t47 5, 0,4,1,2,3,4
# --- block 295 ---
L5864:	fn_link  L5804
	fn_link  L5816
	fn_link  L5856
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 296 ---
L5880:	fn_link  Ansi.ringBell
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 297 ---
L5888:	fn_link  L5896
	fn_combi_t38 6, 1,2,0,3,4,5
L5896:	fn_elink _prim_lt
# --- block 298 ---
L5900:	fn_link  L5888
	fn_link  L5912
	fn_combi_t3 3, 0,1,2,0,0,0
L5912:	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 299 ---
L5916:	fn_link  L5900
	fn_link  L5928
	fn_combi_t3 3, 0,1,2,0,0,0
L5928:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 300 ---
L5932:	fn_link  L5864
	fn_link  L5880
	fn_link  L5916
	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 301 ---
L5948:	fn_link  L5960
	fn_link  L5964
	fn_combi_t29 5, 0,4,1,2,4,3
L5960:	fn_elink _prim_eq
L5964:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 302 ---
L5972:	fn_link  L5948
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 303 ---
L5980:	fn_link  L5932
	fn_link  L5972
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 304 ---
L5992:	fn_link  L6004
	fn_link  L6008
	fn_combi_t29 5, 0,4,1,2,4,3
L6004:	fn_elink _prim_eq
L6008:	fn_box
	.word 0x0000007f	# raw word 127
	fn_box_body
# --- block 305 ---
L6016:	fn_link  L5992
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 306 ---
L6024:	fn_link  L6016
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 307 ---
L6032:	fn_link  L5980
	fn_link  L6024
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 308 ---
L6044:	fn_link  L6056
	fn_link  L6060
	fn_combi_t29 5, 0,4,1,2,4,3
L6056:	fn_elink _prim_eq
L6060:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 309 ---
L6068:	fn_link  L6044
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 310 ---
L6076:	fn_link  L6068
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 311 ---
L6084:	fn_link  Ansi.readChar
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 312 ---
L6092:	fn_link  L6076
	fn_link  L6084
	fn_link  L6108
	fn_combi_t38 5, 0,1,4,2,3,4
L6108:	fn_combi_t52 5, 0,1,2,3,3,4
# --- block 313 ---
L6112:	fn_link  L6032
	fn_link  L6092
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 314 ---
L6124:	fn_link  Ansi.tailL
	fn_link  L6140
	fn_link  L6164
	fn_combi_t41 6, 3,0,4,1,2,5
L6140:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6164:	fn_y
# --- block 315 ---
L6168:	fn_link  L6180
	fn_link  L6184
	fn_combi_t2 4, 3,0,1,0,0,0
L6180:	fn_combi_t0 2, 0,0,0,0,0,0
L6184:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 316 ---
L6192:	fn_link  L6168
	fn_link  L6204
	fn_combi_t2 4, 3,0,1,0,0,0
L6204:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
# --- block 317 ---
L6212:	fn_link  L6192
	fn_link  L6224
	fn_combi_t2 4, 3,0,1,0,0,0
L6224:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 318 ---
L6232:	fn_link  L6124
	fn_link  L6212
	fn_link  Ansi.writeString
	fn_combi_t46 6, 0,1,2,3,4,5
# --- block 319 ---
L6248:	fn_link  L6264
	fn_link  L6268
	fn_link  Ansi.ringBell
	fn_combi_t7 4, 0,3,1,2,0,0
L6264:	fn_combi_t0 2, 0,0,0,0,0,0
L6268:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 320 ---
L6276:	fn_link  L6288
	fn_link  L6292
	fn_combi_t38 6, 0,4,1,2,3,5
L6288:	fn_elink _prim_gt
L6292:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 321 ---
L6300:	fn_link  L6248
	fn_link  L6276
	fn_combi_t29 5, 0,1,2,3,4,4
# --- block 322 ---
L6312:	fn_link  L6232
	fn_link  L6300
	fn_combi_t34 5, 4,0,2,1,2,3
# --- block 323 ---
L6324:	fn_link  L6312
	fn_combi_t46 5, 0,3,1,2,4,3
# --- block 324 ---
L6332:	fn_link  L6112
	fn_link  L6324
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 325 ---
L6344:	fn_link  L6364
	fn_link  L5792
	fn_link  L6332
	fn_link  L6368
	fn_combi_t10 5, 0,1,4,2,3,0
L6364:	fn_combi_t0 2, 0,0,0,0,0,0
L6368:	fn_combi_t39 5, 0,3,1,4,4,2
# --- block 326 ---
L6372:	fn_link  L6380
	fn_combi_t24 6, 0,1,5,2,3,4
L6380:	fn_y
# --- block 327 ---
L6384:	fn_link  L6408
	fn_link  L6412
	fn_link  L6420
	fn_link  L6344
	fn_link  L6372
	fn_combi_t24 6, 0,1,5,2,3,4
L6408:	fn_combi_t0 2, 0,0,0,0,0,0
L6412:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6420:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 328 ---
L6424:	fn_link  Ansi.writeAt
	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 329 ---
L6432:	fn_link  L6452
	fn_link  Ansi.copy
	fn_link  L6460
	fn_link  L6424
	fn_combi_t24 6, 0,1,5,2,4,3
L6452:	fn_box
	.word 0x0000005f	# raw word 95
	fn_box_body
L6460:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 330 ---
L6464:	fn_link  Ansi.moveTo
	fn_link  L6432
	fn_link  L6480
	fn_combi_t12 5, 0,1,3,4,2,0
L6480:	fn_combi_t48 6, 0,2,1,3,4,5
# --- block 331 ---
L6484:	fn_link  L6492
	fn_combi_t29 5, 0,1,4,2,4,3
L6492:	fn_combi_t25 5, 0,4,1,4,2,3
# --- block 332 ---
L6496:	fn_link  L6384
	fn_link  L6516
	fn_link  L6464
	fn_link  L6484
	fn_combi_t38 5, 0,1,4,2,3,4
L6516:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 333 ---
L6520:	fn_link  L5784
	fn_link  L6496
	fn_combi_t14 5, 0,2,4,1,3,0
# --- block 334 ---
Ansi.copy:	fn_link  Ansi.repeatL
	fn_link  Ansi.takeL
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 335 ---
Ansi.moveTo:	fn_link  L6552
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 336 ---
L6552:	fn_link  Ansi.goto
	fn_link  Ansi.writeString
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 337 ---
Ansi.ringBell:	fn_link  L6572
	fn_elink Ansi.writeChar
L6572:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 338 ---
Ansi.writeChar:	fn_link  L6588
	fn_combi_t6 4, 0,1,2,3,0,0
L6588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 339 ---
Ansi.tailL:	fn_link  L6604
	fn_link  L6608
	fn_combi_t2 3, 2,0,1,0,0,0
L6604:	fn_combi_t0 2, 1,0,0,0,0,0
L6608:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 340 ---
Ansi.revL:	fn_link  L6624
	fn_link  L6628
	fn_elink NanoPrelude.foldl
L6624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 341 ---
L6628:	fn_link  L6636
	fn_combi_t2 3, 0,2,1,0,0,0
L6636:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 342 ---
NanoPrelude.length:	fn_link  L6652
	fn_link  L6700
	fn_y
L6652:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 343 ---
L6660:	fn_link  L6672
	fn_link  L6696
	fn_combi_t8 5, 2,0,3,1,0,0
L6672:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6696:	fn_y
# --- block 344 ---
L6700:	fn_link  L6660
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 345 ---
Ansi.str7:	fn_link  L7172
	fn_link  L6720
	fn_combi_t2 4, 3,0,1,0,0,0
L6720:	fn_box
	.word 0x00000050	# raw word 80
	fn_box_body
# --- block 346 ---
L6728:	fn_link  L6740
	fn_link  L6744
	fn_combi_t2 4, 3,0,1,0,0,0
L6740:	fn_combi_t0 2, 0,0,0,0,0,0
L6744:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 347 ---
L6752:	fn_link  L6728
	fn_link  L6764
	fn_combi_t2 4, 3,0,1,0,0,0
L6764:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 348 ---
L6772:	fn_link  L6752
	fn_link  L6784
	fn_combi_t2 4, 3,0,1,0,0,0
L6784:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 349 ---
L6792:	fn_link  L6772
	fn_link  L6804
	fn_combi_t2 4, 3,0,1,0,0,0
L6804:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 350 ---
L6812:	fn_link  L6792
	fn_link  L6824
	fn_combi_t2 4, 3,0,1,0,0,0
L6824:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 351 ---
L6832:	fn_link  L6812
	fn_link  L6844
	fn_combi_t2 4, 3,0,1,0,0,0
L6844:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 352 ---
L6852:	fn_link  L6832
	fn_link  L6864
	fn_combi_t2 4, 3,0,1,0,0,0
L6864:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 353 ---
L6872:	fn_link  L6852
	fn_link  L6884
	fn_combi_t2 4, 3,0,1,0,0,0
L6884:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 354 ---
L6892:	fn_link  L6872
	fn_link  L6904
	fn_combi_t2 4, 3,0,1,0,0,0
L6904:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 355 ---
L6912:	fn_link  L6892
	fn_link  L6924
	fn_combi_t2 4, 3,0,1,0,0,0
L6924:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 356 ---
L6932:	fn_link  L6912
	fn_link  L6944
	fn_combi_t2 4, 3,0,1,0,0,0
L6944:	fn_box
	.word 0x00000079	# raw word 121
	fn_box_body
# --- block 357 ---
L6952:	fn_link  L6932
	fn_link  L6964
	fn_combi_t2 4, 3,0,1,0,0,0
L6964:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 358 ---
L6972:	fn_link  L6952
	fn_link  L6984
	fn_combi_t2 4, 3,0,1,0,0,0
L6984:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 359 ---
L6992:	fn_link  L6972
	fn_link  L7004
	fn_combi_t2 4, 3,0,1,0,0,0
L7004:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 360 ---
L7012:	fn_link  L6992
	fn_link  L7024
	fn_combi_t2 4, 3,0,1,0,0,0
L7024:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 361 ---
L7032:	fn_link  L7012
	fn_link  L7044
	fn_combi_t2 4, 3,0,1,0,0,0
L7044:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 362 ---
L7052:	fn_link  L7032
	fn_link  L7064
	fn_combi_t2 4, 3,0,1,0,0,0
L7064:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 363 ---
L7072:	fn_link  L7052
	fn_link  L7084
	fn_combi_t2 4, 3,0,1,0,0,0
L7084:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 364 ---
L7092:	fn_link  L7072
	fn_link  L7104
	fn_combi_t2 4, 3,0,1,0,0,0
L7104:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 365 ---
L7112:	fn_link  L7092
	fn_link  L7124
	fn_combi_t2 4, 3,0,1,0,0,0
L7124:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 366 ---
L7132:	fn_link  L7112
	fn_link  L7144
	fn_combi_t2 4, 3,0,1,0,0,0
L7144:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 367 ---
L7152:	fn_link  L7132
	fn_link  L7164
	fn_combi_t2 4, 3,0,1,0,0,0
L7164:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 368 ---
L7172:	fn_link  L7152
	fn_link  L7184
	fn_combi_t2 4, 3,0,1,0,0,0
L7184:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 369 ---
Ansi.str9:	fn_link  L7476
	fn_link  L7204
	fn_combi_t2 4, 3,0,1,0,0,0
L7204:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 370 ---
L7212:	fn_link  L7224
	fn_link  L7228
	fn_combi_t2 4, 3,0,1,0,0,0
L7224:	fn_combi_t0 2, 0,0,0,0,0,0
L7228:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 371 ---
L7236:	fn_link  L7212
	fn_link  L7248
	fn_combi_t2 4, 3,0,1,0,0,0
L7248:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 372 ---
L7256:	fn_link  L7236
	fn_link  L7268
	fn_combi_t2 4, 3,0,1,0,0,0
L7268:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 373 ---
L7276:	fn_link  L7256
	fn_link  L7288
	fn_combi_t2 4, 3,0,1,0,0,0
L7288:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 374 ---
L7296:	fn_link  L7276
	fn_link  L7308
	fn_combi_t2 4, 3,0,1,0,0,0
L7308:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 375 ---
L7316:	fn_link  L7296
	fn_link  L7328
	fn_combi_t2 4, 3,0,1,0,0,0
L7328:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 376 ---
L7336:	fn_link  L7316
	fn_link  L7348
	fn_combi_t2 4, 3,0,1,0,0,0
L7348:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 377 ---
L7356:	fn_link  L7336
	fn_link  L7368
	fn_combi_t2 4, 3,0,1,0,0,0
L7368:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 378 ---
L7376:	fn_link  L7356
	fn_link  L7388
	fn_combi_t2 4, 3,0,1,0,0,0
L7388:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 379 ---
L7396:	fn_link  L7376
	fn_link  L7408
	fn_combi_t2 4, 3,0,1,0,0,0
L7408:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 380 ---
L7416:	fn_link  L7396
	fn_link  L7428
	fn_combi_t2 4, 3,0,1,0,0,0
L7428:	fn_box
	.word 0x00000077	# raw word 119
	fn_box_body
# --- block 381 ---
L7436:	fn_link  L7416
	fn_link  L7448
	fn_combi_t2 4, 3,0,1,0,0,0
L7448:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 382 ---
L7456:	fn_link  L7436
	fn_link  L7468
	fn_combi_t2 4, 3,0,1,0,0,0
L7468:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 383 ---
L7476:	fn_link  L7456
	fn_link  L7488
	fn_combi_t2 4, 3,0,1,0,0,0
L7488:	fn_box
	.word 0x00000027	# raw word 39
	fn_box_body
# --- block 384 ---
Ansi.end:	fn_link  L7504
	fn_combi_t0 2, 0,0,0,0,0,0
L7504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 385 ---
Ansi.str8:	fn_link  L7612
	fn_link  L7520
	fn_combi_t2 4, 3,0,1,0,0,0
L7520:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 386 ---
L7528:	fn_link  L7540
	fn_link  L7544
	fn_combi_t2 4, 3,0,1,0,0,0
L7540:	fn_combi_t0 2, 0,0,0,0,0,0
L7544:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 387 ---
L7552:	fn_link  L7528
	fn_link  L7564
	fn_combi_t2 4, 3,0,1,0,0,0
L7564:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 388 ---
L7572:	fn_link  L7552
	fn_link  L7584
	fn_combi_t2 4, 3,0,1,0,0,0
L7584:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 389 ---
L7592:	fn_link  L7572
	fn_link  L7604
	fn_combi_t2 4, 3,0,1,0,0,0
L7604:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 390 ---
L7612:	fn_link  L7592
	fn_link  L7624
	fn_combi_t2 4, 3,0,1,0,0,0
L7624:	fn_box
	.word 0x00000065	# raw word 101
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
