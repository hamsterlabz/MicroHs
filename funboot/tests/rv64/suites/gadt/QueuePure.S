# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/QueuePure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	GExtra.$3e$3d
	.globl	GExtra.reverse
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	GExtra.zipWith
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	QueuePure.bench
	.globl	QueuePure.main
	.globl	QueuePure.qBalance
	.globl	QueuePure.qEmpty
	.globl	QueuePure.qFromList
	.globl	QueuePure.qMap
	.globl	QueuePure.qSnoc
	.globl	QueuePure.qToList
	.globl	QueuePure.qZipSumWith
	.globl	QueuePure.vals
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  QueuePure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
QueuePure.main:	fn_link  L36
L32:	fn_elink QueuePure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
QueuePure.bench:	fn_link  L400
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
	fn_link  L108
	fn_link  L112
	fn_combi_t20 5, 0,1,4,2,3,0
L76:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_box
	.word 0x5ee9d4b2	# raw word 1592382642
	fn_box_body
L108:	fn_combi_t0 1, 0,0,0,0,0,0
L112:	fn_y
# --- block 5 ---
L116:	fn_link  L56
	fn_link  L136
	fn_link  QueuePure.vals
	fn_link  QueuePure.qFromList
	fn_combi_t20 5, 0,1,2,3,4,0
L136:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 6 ---
L144:	fn_link  L164
	fn_link  L188
	fn_link  L196
	fn_link  L200
	fn_combi_t20 5, 0,1,4,2,3,0
L164:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L188:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L196:	fn_combi_t0 1, 0,0,0,0,0,0
L200:	fn_y
# --- block 7 ---
L204:	fn_link  L144
	fn_link  L224
	fn_link  QueuePure.vals
	fn_link  QueuePure.qFromList
	fn_combi_t20 5, 0,1,2,3,4,0
L224:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 8 ---
L232:	fn_link  L204
	fn_link  Common.mul3plus1
	fn_link  QueuePure.qMap
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 9 ---
L248:	fn_link  GExtra.xor
	fn_link  QueuePure.qZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 10 ---
L260:	fn_link  QueuePure.qToList
	fn_link  L280
	fn_link  GExtra.xor
	fn_link  NanoPrelude.foldr
	fn_combi_t14 5, 0,1,2,3,4,0
L280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L288:	fn_link  QueuePure.qToList
	fn_link  L308
	fn_link  Common.addW
	fn_link  NanoPrelude.foldl
	fn_combi_t14 5, 0,1,2,3,4,0
L308:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 12 ---
L316:	fn_link  L288
	fn_link  Common.hashMix
	fn_combi_t20 4, 0,0,2,1,3,0
# --- block 13 ---
L328:	fn_link  L260
	fn_link  L316
	fn_link  Common.hashMix
	fn_combi_t56 5, 0,1,3,4,2,4
# --- block 14 ---
L344:	fn_link  Common.addW
	fn_link  QueuePure.qZipSumWith
	fn_link  L328
	fn_link  L364
	fn_combi_t10 5, 0,1,4,2,3,0
L364:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 15 ---
L368:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 16 ---
L376:	fn_link  L344
	fn_link  L368
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 17 ---
L388:	fn_link  L248
	fn_link  L376
	fn_combi_t28 5, 0,4,3,1,3,2
# --- block 18 ---
L400:	fn_link  L116
	fn_link  L232
	fn_link  L388
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 19 ---
Common.benchFold:	fn_link  L436
	fn_link  L444
	fn_link  L540
	fn_link  L452
	fn_combi_t26 6, 0,1,4,5,2,3
L436:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L444:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L452:	fn_y
# --- block 20 ---
L456:	fn_link  L468
	fn_link  L492
	fn_combi_t41 6, 2,0,4,1,3,5
L468:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L492:	fn_y
# --- block 21 ---
L496:	fn_link  L456
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 22 ---
L504:	fn_link  L516
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L516:	fn_elink _error0
# --- block 23 ---
L520:	fn_link  L496
	fn_link  L504
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 24 ---
L532:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 25 ---
L540:	fn_link  L520
	fn_link  L532
	fn_link  L556
	fn_combi_t5 4, 0,1,3,2,0,0
L556:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 26 ---
GExtra.$3e$3d:	fn_link  L568
	fn_combi_t3 3, 2,1,0,0,0,0
L568:	fn_elink _prim_geu
# --- block 27 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 28 ---
Common.hashMix:	fn_link  L592
	fn_link  L700
	fn_link  L728
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 29 ---
L592:	fn_link  L612
	fn_link  GExtra.xor
	fn_link  L636
	fn_link  L644
	fn_combi_t60 6, 0,1,2,4,5,3
L612:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L636:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L644:	fn_y
# --- block 30 ---
L648:	fn_link  L668
	fn_link  L692
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L668:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L692:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 31 ---
L700:	fn_link  L648
	fn_link  L716
	fn_link  L724
	fn_combi_t8 4, 0,1,2,3,0,0
L716:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L724:	fn_y
# --- block 32 ---
L728:	fn_link  L744
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L744:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 33 ---
GExtra.xor:	fn_link  L764
	fn_link  L788
	fn_combi_t8 4, 0,3,2,1,0,0
L764:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L788:	fn_y
# --- block 34 ---
GExtra.shiftR:	fn_link  L804
	fn_link  L828
	fn_combi_t8 4, 0,3,2,1,0,0
L804:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L828:	fn_y
# --- block 35 ---
NanoPrelude.foldl:	fn_link  L848
	fn_link  L844
	fn_combi_t3 3, 0,1,2,0,0,0
L844:	fn_y
# --- block 36 ---
L848:	fn_link  L856
	fn_combi_t46 5, 4,3,0,1,2,3
L856:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 37 ---
Common.addW:	fn_link  L872
	fn_link  L896
	fn_combi_t8 4, 0,3,2,1,0,0
L872:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L896:	fn_y
# --- block 38 ---
QueuePure.qToList:	fn_link  L908
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 39 ---
L908:	fn_link  GExtra.reverse
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t6 6, 0,2,1,4,0,0
# --- block 40 ---
Data.List_Type.$2b$2b:	fn_link  L948
	fn_link  L932
	fn_combi_t5 4, 0,1,3,2,0,0
L932:	fn_y
# --- block 41 ---
L936:	fn_link  L944
	fn_combi_t6 4, 0,2,1,3,0,0
L944:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L948:	fn_link  L936
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 43 ---
GExtra.reverse:	fn_link  L968
	fn_link  L972
	fn_elink NanoPrelude.foldl
L968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 44 ---
L972:	fn_link  L980
	fn_combi_t2 3, 0,2,1,0,0,0
L980:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 45 ---
NanoPrelude.foldr:	fn_link  L1000
	fn_link  L996
	fn_combi_t7 4, 0,1,2,3,0,0
L996:	fn_y
# --- block 46 ---
L1000:	fn_link  L1008
	fn_combi_t16 5, 4,2,0,1,3,0
L1008:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 47 ---
QueuePure.qZipSumWith:	fn_link  L1024
	fn_link  NanoPrelude.sum
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 48 ---
L1024:	fn_link  QueuePure.qToList
	fn_link  GExtra.zipWith
	fn_combi_t39 5, 0,2,1,3,1,4
# --- block 49 ---
NanoPrelude.sum:	fn_link  L1048
	fn_link  L1056
	fn_elink NanoPrelude.foldr
L1048:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 50 ---
L1056:	fn_link  L1068
	fn_link  L1092
	fn_combi_t8 4, 0,3,2,1,0,0
L1068:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1092:	fn_y
# --- block 51 ---
GExtra.zipWith:	fn_link  L1148
	fn_link  L1108
	fn_combi_t3 3, 0,1,2,0,0,0
L1108:	fn_y
# --- block 52 ---
L1112:	fn_link  L1120
	fn_combi_t40 6, 0,1,2,4,3,5
L1120:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L1124:	fn_link  L1132
	fn_combi_t48 6, 3,0,1,4,2,5
L1132:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1136:	fn_link  L1112
	fn_link  L1124
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 55 ---
L1148:	fn_link  L1136
	fn_link  L1160
	fn_combi_t46 6, 4,0,1,2,3,5
L1160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 56 ---
QueuePure.qMap:	fn_link  QueuePure.qToList
	fn_link  NanoPrelude.map
	fn_link  QueuePure.qFromList
	fn_combi_t20 5, 0,1,3,2,4,0
# --- block 57 ---
QueuePure.qFromList:	fn_link  QueuePure.qEmpty
	fn_link  QueuePure.qSnoc
	fn_elink NanoPrelude.foldl
# --- block 58 ---
QueuePure.qSnoc:	fn_link  L1212
	fn_link  L1236
	fn_link  L1240
	fn_link  L1268
	fn_combi_t52 6, 4,0,1,5,2,3
L1212:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1236:	fn_y
# --- block 59 ---
L1240:	fn_link  L1252
	fn_link  L1256
	fn_combi_t42 6, 0,3,4,1,2,5
L1252:	fn_combi_t2 4, 3,0,1,0,0,0
L1256:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 60 ---
L1260:	fn_link  QueuePure.qBalance
	fn_combi_t59 6, 0,1,4,2,5,3
# --- block 61 ---
L1268:	fn_link  L1260
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 62 ---
QueuePure.qBalance:	fn_link  L1436
	fn_combi_t3 2, 1,0,1,0,0,0
# --- block 63 ---
L1284:	fn_link  GExtra.reverse
	fn_link  Data.List_Type.$2b$2b
	fn_link  L1300
	fn_combi_t20 5, 0,1,3,2,4,0
L1300:	fn_combi_t9 5, 4,0,1,2,3,0
# --- block 64 ---
L1304:	fn_link  L1312
	fn_combi_t24 6, 0,1,5,2,4,3
L1312:	fn_combi_t36 6, 0,1,5,2,3,4
# --- block 65 ---
L1316:	fn_link  L1336
	fn_link  L1360
	fn_link  L1284
	fn_link  L1304
	fn_combi_t10 5, 0,1,4,2,3,0
L1336:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1360:	fn_y
# --- block 66 ---
L1364:	fn_link  L1376
	fn_link  L1316
	fn_combi_t9 5, 0,2,3,4,1,0
L1376:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 67 ---
L1380:	fn_link  L1392
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,4,5,3
L1392:	fn_elink _error0
# --- block 68 ---
L1396:	fn_link  L1412
	fn_link  L1364
	fn_link  L1380
	fn_combi_t12 5, 0,1,3,4,2,0
L1412:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 69 ---
L1420:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 70 ---
L1428:	fn_link  L1420
	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 71 ---
L1436:	fn_link  L1396
	fn_link  L1428
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 72 ---
QueuePure.qEmpty:	fn_link  L1468
	fn_link  L1476
	fn_link  L1480
	fn_link  L1488
	fn_combi_t9 5, 4,0,1,2,3,0
L1468:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1476:	fn_combi_t0 2, 0,0,0,0,0,0
L1480:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 73 ---
NanoPrelude.map:	fn_link  L1520
	fn_link  L1504
	fn_combi_t3 3, 0,1,2,0,0,0
L1504:	fn_y
# --- block 74 ---
L1508:	fn_link  L1516
	fn_combi_t15 5, 0,1,3,2,4,0
L1516:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 75 ---
L1520:	fn_link  L1508
	fn_link  L1532
	fn_combi_t16 5, 4,0,1,2,3,0
L1532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 76 ---
Common.mul3plus1:	fn_link  L1560
	fn_link  L1584
	fn_link  L1608
	fn_link  L1616
	fn_link  L1620
	fn_combi_t55 6, 0,1,2,5,3,4
L1560:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1584:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1608:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1616:	fn_y
L1620:	fn_y
# --- block 77 ---
QueuePure.vals:	fn_link  L1636
	fn_link  L1724
	fn_combi_t4 4, 0,2,3,1,0,0
L1636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 78 ---
L1640:	fn_link  L1656
	fn_link  L1680
	fn_link  QueuePure.vals
	fn_combi_t8 4, 0,1,3,2,0,0
L1656:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1680:	fn_y
# --- block 79 ---
L1684:	fn_link  L1640
	fn_link  L1696
	fn_combi_t16 4, 0,3,1,2,3,0
L1696:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 80 ---
L1700:	fn_link  L1712
	fn_link  L1716
	fn_combi_t45 6, 4,0,1,2,3,5
L1712:	fn_elink _prim_eq
L1716:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 81 ---
L1724:	fn_link  Common.lcgNext
	fn_link  L1684
	fn_link  L1700
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 82 ---
Common.lcgNext:	fn_link  L1756
	fn_link  L1752
	fn_combi_t3 3, 0,1,2,0,0,0
L1752:	fn_y
# --- block 83 ---
L1756:	fn_link  L1780
	fn_link  L1804
	fn_link  L1828
	fn_link  L1836
	fn_link  L1840
	fn_combi_t55 6, 0,1,2,5,3,4
L1780:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1804:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1828:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1836:	fn_y
L1840:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
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
