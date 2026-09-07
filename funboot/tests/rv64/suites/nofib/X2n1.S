# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/X2n1  (entry @0)
	.text
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	X2n1.addC
	.globl	X2n1.bench
	.globl	X2n1.cosD
	.globl	X2n1.f
	.globl	X2n1.mulC
	.globl	X2n1.piD
	.globl	X2n1.powC
	.globl	X2n1.sinD
	.globl	X2n1.sumC
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  X2n1.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
X2n1.bench:	fn_link  L136
	fn_elink _prim_ftoi
# --- block 3 ---
L36:	fn_link  L44
	fn_elink _prim_itof
L44:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 4 ---
L52:	fn_link  L60
	fn_elink _prim_itof
L60:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 5 ---
L68:	fn_link  L36
	fn_link  L52
	fn_elink NanoPrelude.$2f.
# --- block 6 ---
L80:	fn_link  L92
	fn_link  L100
	fn_elink NanoPrelude.enumFromTo
L92:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L100:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 7 ---
L108:	fn_link  L80
	fn_link  X2n1.f
	fn_elink NanoPrelude.map
# --- block 8 ---
L120:	fn_link  L108
	fn_elink X2n1.sumC
# --- block 9 ---
L128:	fn_link  L120
	fn_elink NanoPrelude.fst
# --- block 10 ---
L136:	fn_link  L68
	fn_link  L128
	fn_elink NanoPrelude.$2b.
# --- block 11 ---
NanoPrelude.$2b.:	fn_link  L160
	fn_link  L164
	fn_combi_t8 4, 0,3,2,1,0,0
L160:	fn_elink _prim_fadd
L164:	fn_y
# --- block 12 ---
NanoPrelude.fst:	fn_link  L176
	fn_combi_t1 2, 1,0,0,0,0,0
L176:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 13 ---
X2n1.sumC:	fn_link  L192
	fn_link  L244
	fn_y
# --- block 14 ---
L192:	fn_link  L212
	fn_link  L220
	fn_link  L224
	fn_link  L232
	fn_combi_t15 5, 4,0,1,2,3,0
L212:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L220:	fn_elink _prim_itof
L224:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L232:	fn_elink _prim_itof
# --- block 15 ---
L236:	fn_link  X2n1.addC
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 16 ---
L244:	fn_link  L236
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 17 ---
X2n1.addC:	fn_link  L268
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 18 ---
L260:	fn_link  NanoPrelude.$2b.
	fn_combi_t40 6, 5,0,1,3,2,4
# --- block 19 ---
L268:	fn_link  NanoPrelude.$2b.
	fn_link  L260
	fn_combi_t20 5, 2,0,3,1,4,0
# --- block 20 ---
NanoPrelude.map:	fn_link  L308
	fn_link  L292
	fn_combi_t3 3, 0,1,2,0,0,0
L292:	fn_y
# --- block 21 ---
L296:	fn_link  L304
	fn_combi_t15 5, 0,1,3,2,4,0
L304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 22 ---
L308:	fn_link  L296
	fn_link  L320
	fn_combi_t16 5, 4,0,1,2,3,0
L320:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 23 ---
X2n1.f:	fn_link  L384
	fn_link  L344
	fn_link  L400
	fn_link  X2n1.powC
	fn_combi_t36 5, 0,1,2,3,4,4
L344:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 24 ---
L348:	fn_link  L356
	fn_elink _prim_itof
L356:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 25 ---
L364:	fn_link  X2n1.piD
	fn_link  L348
	fn_elink NanoPrelude.$2a.
# --- block 26 ---
L376:	fn_link  L364
	fn_elink NanoPrelude.$2f.
# --- block 27 ---
L384:	fn_link  L396
	fn_link  L376
	fn_combi_t3 3, 0,1,2,0,0,0
L396:	fn_elink _prim_itof
# --- block 28 ---
L400:	fn_link  X2n1.sinD
	fn_link  X2n1.cosD
	fn_combi_t15 4, 3,0,2,1,2,0
# --- block 29 ---
X2n1.powC:	fn_link  L592
	fn_link  L424
	fn_combi_t3 3, 0,1,2,0,0,0
L424:	fn_y
# --- block 30 ---
L428:	fn_link  L444
	fn_link  L452
	fn_link  L460
	fn_combi_t15 4, 3,0,1,0,2,0
L444:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L452:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L460:	fn_elink _prim_itof
# --- block 31 ---
L464:	fn_link  L476
	fn_link  NanoPrelude.quot
	fn_combi_t7 4, 2,0,3,1,0,0
L476:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 32 ---
L484:	fn_link  X2n1.mulC
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 33 ---
L492:	fn_link  L512
	fn_link  L516
	fn_link  NanoPrelude.rem
	fn_link  L524
	fn_combi_t18 5, 0,1,4,2,3,0
L512:	fn_elink _prim_eq
L516:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L524:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L532:	fn_link  X2n1.mulC
	fn_link  L492
	fn_combi_t30 5, 0,3,1,2,4,4
# --- block 35 ---
L544:	fn_link  L464
	fn_link  L484
	fn_link  L532
	fn_link  L564
	fn_combi_t10 5, 0,1,4,2,3,0
L564:	fn_combi_t49 5, 0,4,1,2,3,4
# --- block 36 ---
L568:	fn_link  L580
	fn_link  L584
	fn_combi_t29 5, 4,0,1,2,4,3
L580:	fn_elink _prim_eq
L584:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 37 ---
L592:	fn_link  L428
	fn_link  L544
	fn_link  L568
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 38 ---
NanoPrelude.rem:	fn_link  L620
	fn_link  L644
	fn_combi_t8 4, 0,3,2,1,0,0
L620:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L644:	fn_y
# --- block 39 ---
X2n1.mulC:	fn_link  L732
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 40 ---
L656:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 6, 0,1,2,5,3,4
# --- block 41 ---
L668:	fn_link  NanoPrelude.$2a.
	fn_link  L656
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 42 ---
L680:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t54 6, 5,0,1,2,3,4
# --- block 43 ---
L692:	fn_link  NanoPrelude.$2a.
	fn_link  L680
	fn_link  L708
	fn_combi_t40 6, 0,1,3,5,2,4
L708:	fn_combi_t38 5, 0,1,3,4,2,3
# --- block 44 ---
L712:	fn_link  L668
	fn_link  L692
	fn_link  L728
	fn_combi_t15 4, 0,1,3,2,3,0
L728:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 45 ---
L732:	fn_link  L712
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 46 ---
NanoPrelude.$2d.:	fn_link  L752
	fn_link  L756
	fn_combi_t8 4, 0,3,2,1,0,0
L752:	fn_elink _prim_fsub
L756:	fn_y
# --- block 47 ---
NanoPrelude.$2a.:	fn_link  L772
	fn_link  L776
	fn_combi_t8 4, 0,3,2,1,0,0
L772:	fn_elink _prim_fmul
L776:	fn_y
# --- block 48 ---
NanoPrelude.quot:	fn_link  L792
	fn_link  L816
	fn_combi_t8 4, 0,3,2,1,0,0
L792:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L816:	fn_y
# --- block 49 ---
X2n1.cosD:	fn_link  L836
	fn_link  L844
	fn_link  L1248
	fn_combi_t6 4, 0,3,1,2,0,0
L836:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L844:	fn_elink _prim_itof
# --- block 50 ---
L848:	fn_link  L856
	fn_elink _prim_itof
L856:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 51 ---
L864:	fn_link  L884
	fn_link  L908
	fn_link  L932
	fn_link  L940
	fn_combi_t55 5, 0,0,4,1,2,3
L884:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L908:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L932:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L940:	fn_y
# --- block 52 ---
L944:	fn_link  L964
	fn_link  L988
	fn_link  L1012
	fn_link  L1020
	fn_combi_t55 5, 0,0,4,1,2,3
L964:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L988:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1012:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1020:	fn_y
# --- block 53 ---
L1024:	fn_link  L1044
	fn_link  L864
	fn_link  L944
	fn_link  L1068
	fn_combi_t58 5, 0,1,4,2,4,3
L1044:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1068:	fn_y
# --- block 54 ---
L1072:	fn_link  L1084
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 4, 0,1,3,0,2,2
L1084:	fn_elink _prim_fneg
# --- block 55 ---
L1088:	fn_link  L1100
	fn_link  L1072
	fn_combi_t3 3, 0,1,2,0,0,0
L1100:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 56 ---
L1104:	fn_link  NanoPrelude.$2f.
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 57 ---
L1112:	fn_link  L1024
	fn_link  L1132
	fn_link  L1088
	fn_link  L1104
	fn_combi_t10 5, 0,1,4,2,3,0
L1132:	fn_elink _prim_itof
# --- block 58 ---
L1136:	fn_link  L1148
	fn_link  L1172
	fn_combi_t8 4, 2,0,3,1,0,0
L1148:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1172:	fn_y
# --- block 59 ---
L1176:	fn_link  NanoPrelude.$2b.
	fn_link  L1136
	fn_link  L1192
	fn_combi_t5 4, 0,1,3,2,0,0
L1192:	fn_combi_t42 5, 0,2,3,1,4,3
# --- block 60 ---
L1196:	fn_link  L1176
	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 61 ---
L1204:	fn_link  L1112
	fn_link  L1196
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 62 ---
L1216:	fn_link  L1228
	fn_link  L1232
	fn_combi_t29 5, 0,2,1,3,4,4
L1228:	fn_elink _prim_ge
L1232:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 63 ---
L1240:	fn_link  L1216
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 64 ---
L1248:	fn_link  L848
	fn_link  L1272
	fn_link  L1204
	fn_link  L1240
	fn_link  L1280
	fn_combi_t27 6, 0,1,2,5,3,4
L1272:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1280:	fn_y
# --- block 65 ---
NanoPrelude.$2f.:	fn_link  L1296
	fn_link  L1300
	fn_combi_t8 4, 0,3,2,1,0,0
L1296:	fn_elink _prim_fdiv
L1300:	fn_y
# --- block 66 ---
X2n1.sinD:	fn_link  L1696
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 67 ---
L1312:	fn_link  L1332
	fn_link  L1356
	fn_link  L1380
	fn_link  L1388
	fn_combi_t55 5, 0,0,4,1,2,3
L1332:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1356:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1380:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1388:	fn_y
# --- block 68 ---
L1392:	fn_link  L1412
	fn_link  L1436
	fn_link  L1460
	fn_link  L1468
	fn_combi_t55 5, 0,0,4,1,2,3
L1412:	fn_force
	fn_tor a0
	addiw a0,a0,3
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1436:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1460:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1468:	fn_y
# --- block 69 ---
L1472:	fn_link  L1492
	fn_link  L1312
	fn_link  L1392
	fn_link  L1516
	fn_combi_t58 5, 0,1,4,2,4,3
L1492:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1516:	fn_y
# --- block 70 ---
L1520:	fn_link  L1532
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 4, 0,1,3,0,2,2
L1532:	fn_elink _prim_fneg
# --- block 71 ---
L1536:	fn_link  L1548
	fn_link  L1520
	fn_combi_t3 3, 0,1,2,0,0,0
L1548:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 72 ---
L1552:	fn_link  NanoPrelude.$2f.
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 73 ---
L1560:	fn_link  L1472
	fn_link  L1580
	fn_link  L1536
	fn_link  L1552
	fn_combi_t10 5, 0,1,4,2,3,0
L1580:	fn_elink _prim_itof
# --- block 74 ---
L1584:	fn_link  L1596
	fn_link  L1620
	fn_combi_t8 4, 2,0,3,1,0,0
L1596:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1620:	fn_y
# --- block 75 ---
L1624:	fn_link  NanoPrelude.$2b.
	fn_link  L1584
	fn_link  L1640
	fn_combi_t5 4, 0,1,3,2,0,0
L1640:	fn_combi_t42 5, 0,2,3,1,4,3
# --- block 76 ---
L1644:	fn_link  L1624
	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 77 ---
L1652:	fn_link  L1560
	fn_link  L1644
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 78 ---
L1664:	fn_link  L1676
	fn_link  L1680
	fn_combi_t29 5, 0,2,1,3,4,4
L1676:	fn_elink _prim_ge
L1680:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 79 ---
L1688:	fn_link  L1664
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 80 ---
L1696:	fn_link  L1716
	fn_link  L1652
	fn_link  L1688
	fn_link  L1724
	fn_combi_t27 5, 0,1,2,4,3,4
L1716:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1724:	fn_y
# --- block 81 ---
X2n1.piD:	fn_link  L1772
	fn_link  L1784
	fn_elink NanoPrelude.$2b.
# --- block 82 ---
L1740:	fn_link  L1748
	fn_elink _prim_itof
L1748:	fn_box
	.word 0x05f5e100	# raw word 100000000
	fn_box_body
# --- block 83 ---
L1756:	fn_link  L1764
	fn_elink _prim_itof
L1764:	fn_box
	.word 0x00d80da1	# raw word 14159265
	fn_box_body
# --- block 84 ---
L1772:	fn_link  L1740
	fn_link  L1756
	fn_elink NanoPrelude.$2f.
# --- block 85 ---
L1784:	fn_link  L1792
	fn_elink _prim_itof
L1792:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 86 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L1816
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 87 ---
L1816:	fn_link  L1832
	fn_link  L1836
	fn_link  L1840
	fn_combi_t10 5, 3,4,0,1,2,0
L1832:	fn_combi_t0 2, 1,0,0,0,0,0
L1836:	fn_combi_t0 2, 0,0,0,0,0,0
L1840:	fn_elink _prim_le
# --- block 88 ---
NanoPrelude.takeWhile:	fn_link  L1884
	fn_link  L1856
	fn_combi_t3 3, 0,1,2,0,0,0
L1856:	fn_y
# --- block 89 ---
L1860:	fn_link  L1868
	fn_combi_t6 4, 0,2,1,3,0,0
L1868:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 90 ---
L1872:	fn_link  L1880
	fn_combi_t42 5, 1,3,0,2,3,4
L1880:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 91 ---
L1884:	fn_link  L1860
	fn_link  L1872
	fn_link  L1900
	fn_combi_t48 6, 5,0,1,3,2,4
L1900:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 92 ---
NanoPrelude.enumFrom:	fn_link  L1924
	fn_link  L1948
	fn_link  NanoPrelude.enumFrom
	fn_link  L1952
	fn_combi_t50 5, 0,4,1,2,4,3
L1924:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1948:	fn_y
L1952:	fn_combi_t2 4, 3,0,1,0,0,0

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
_unimpprim_addiw$202:
	la a0, _unimpprim_addiw$202$name
	tail _unimpfi_halt
_unimpprim_addiw$202$name:
	.asciz "addiw 2"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$203:
	la a0, _unimpprim_addiw$203$name
	tail _unimpfi_halt
_unimpprim_addiw$203$name:
	.asciz "addiw 3"
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
