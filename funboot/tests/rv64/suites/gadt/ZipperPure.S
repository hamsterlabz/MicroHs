# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/ZipperPure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	GExtra.$3c
	.globl	GExtra.$3e$3d
	.globl	GExtra..$26.
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	GExtra.zipWith
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	ZipperPure.bench
	.globl	ZipperPure.keys
	.globl	ZipperPure.main
	.globl	ZipperPure.tFoldl
	.globl	ZipperPure.tFoldr
	.globl	ZipperPure.tInsert
	.globl	ZipperPure.tMap
	.globl	ZipperPure.tToList
	.globl	ZipperPure.tZipSumWith
	.globl	ZipperPure.zDelete
	.globl	ZipperPure.zDownL
	.globl	ZipperPure.zDownR
	.globl	ZipperPure.zInsert
	.globl	ZipperPure.zModify
	.globl	ZipperPure.zReplace
	.globl	ZipperPure.zTop
	.globl	ZipperPure.zUp
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  ZipperPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
ZipperPure.main:	fn_link  L36
	fn_elink ZipperPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
ZipperPure.bench:	fn_link  L520
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
	fn_link  L132
	fn_link  ZipperPure.keys
	fn_combi_t6 4, 0,1,2,3,0,0
L132:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 6 ---
L140:	fn_link  L116
	fn_link  L160
	fn_link  ZipperPure.tInsert
	fn_link  NanoPrelude.foldl
	fn_combi_t14 5, 0,1,2,3,4,0
L160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
L164:	fn_link  L184
	fn_link  L208
	fn_link  L216
	fn_link  L220
	fn_combi_t20 5, 0,1,4,2,3,0
L184:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L208:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L216:	fn_combi_t0 1, 0,0,0,0,0,0
L220:	fn_y
# --- block 8 ---
L224:	fn_link  L164
	fn_link  L240
	fn_link  ZipperPure.keys
	fn_combi_t6 4, 0,1,2,3,0,0
L240:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 9 ---
L248:	fn_link  L224
	fn_link  L272
	fn_link  ZipperPure.tInsert
	fn_link  NanoPrelude.foldl
	fn_link  L276
	fn_combi_t56 6, 0,1,2,3,4,5
L272:	fn_combi_t0 2, 0,0,0,0,0,0
L276:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 10 ---
L280:	fn_link  L300
	fn_link  L248
	fn_link  ZipperPure.zDownL
	fn_link  ZipperPure.zDownR
	fn_combi_t21 5, 0,1,2,4,3,0
L300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 11 ---
L304:	fn_link  L280
	fn_link  Common.mul3plus1
	fn_link  ZipperPure.zModify
	fn_link  L328
	fn_link  ZipperPure.zInsert
	fn_combi_t48 6, 0,1,2,3,4,5
L328:	fn_box
	.word 0xcafebabe	# raw word 3405691582
	fn_box_body
# --- block 12 ---
L336:	fn_link  L304
	fn_link  ZipperPure.zUp
	fn_link  ZipperPure.zDownL
	fn_link  ZipperPure.zDelete
	fn_combi_t64 5, 0,1,2,2,3,4
# --- block 13 ---
L356:	fn_link  L380
	fn_link  L336
	fn_link  ZipperPure.zTop
	fn_link  Common.mul3plus1
	fn_link  ZipperPure.tMap
	fn_combi_t47 6, 0,1,2,3,5,4
L380:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L384:	fn_link  GExtra.xor
	fn_link  ZipperPure.tZipSumWith
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 15 ---
L396:	fn_link  L416
	fn_link  Common.addW
	fn_link  ZipperPure.tFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L416:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 16 ---
L424:	fn_link  Common.hashMix
	fn_combi_t57 4, 0,0,1,3,2,3
# --- block 17 ---
L432:	fn_link  L456
	fn_link  GExtra.xor
	fn_link  ZipperPure.tFoldr
	fn_link  L396
	fn_link  L424
	fn_combi_t44 6, 0,1,5,2,3,4
L456:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 18 ---
L464:	fn_link  Common.addW
	fn_link  ZipperPure.tZipSumWith
	fn_link  L432
	fn_link  L484
	fn_combi_t10 5, 0,1,4,2,3,0
L484:	fn_combi_t46 5, 0,4,1,2,4,3
# --- block 19 ---
L488:	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 20 ---
L496:	fn_link  L464
	fn_link  L488
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 21 ---
L508:	fn_link  L384
	fn_link  L496
	fn_combi_t28 5, 0,4,3,1,3,2
# --- block 22 ---
L520:	fn_link  L140
	fn_link  L356
	fn_link  L508
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 23 ---
Common.benchFold:	fn_link  L556
	fn_link  L564
	fn_link  L660
	fn_link  L572
	fn_combi_t26 6, 0,1,4,5,2,3
L556:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L564:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L572:	fn_y
# --- block 24 ---
L576:	fn_link  L588
	fn_link  L612
	fn_combi_t41 6, 2,0,4,1,3,5
L588:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L612:	fn_y
# --- block 25 ---
L616:	fn_link  L576
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 26 ---
L624:	fn_link  L636
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L636:	fn_elink _error0
# --- block 27 ---
L640:	fn_link  L616
	fn_link  L624
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 28 ---
L652:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 29 ---
L660:	fn_link  L640
	fn_link  L652
	fn_link  L676
	fn_combi_t5 4, 0,1,3,2,0,0
L676:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 30 ---
GExtra.$3e$3d:	fn_link  L688
	fn_combi_t3 3, 2,1,0,0,0,0
L688:	fn_elink _prim_geu
# --- block 31 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 32 ---
Common.hashMix:	fn_link  L712
	fn_link  L820
	fn_link  L848
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 33 ---
L712:	fn_link  L732
	fn_link  GExtra.xor
	fn_link  L756
	fn_link  L764
	fn_combi_t60 6, 0,1,2,4,5,3
L732:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L756:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L764:	fn_y
# --- block 34 ---
L768:	fn_link  L788
	fn_link  L812
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L788:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L812:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 35 ---
L820:	fn_link  L768
	fn_link  L836
	fn_link  L844
	fn_combi_t8 4, 0,1,2,3,0,0
L836:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L844:	fn_y
# --- block 36 ---
L848:	fn_link  L864
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L864:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 37 ---
GExtra.xor:	fn_link  L884
	fn_link  L908
	fn_combi_t8 4, 0,3,2,1,0,0
L884:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L908:	fn_y
# --- block 38 ---
GExtra.shiftR:	fn_link  L924
	fn_link  L948
	fn_combi_t8 4, 0,3,2,1,0,0
L924:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L948:	fn_y
# --- block 39 ---
ZipperPure.tFoldl:	fn_link  L972
	fn_link  L976
	fn_link  L980
	fn_link  L984
	fn_combi_t19 5, 0,1,2,4,3,0
L972:	fn_combi_t0 1, 0,0,0,0,0,0
L976:	fn_combi_t54 5, 1,0,1,2,4,3
L980:	fn_combi_t47 5, 4,3,0,1,2,3
L984:	fn_y
# --- block 40 ---
Common.addW:	fn_link  L1000
	fn_link  L1024
	fn_combi_t8 4, 0,3,2,1,0,0
L1000:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1024:	fn_y
# --- block 41 ---
ZipperPure.tFoldr:	fn_link  L1080
	fn_link  L1040
	fn_combi_t3 3, 0,1,2,0,0,0
L1040:	fn_y
# --- block 42 ---
L1044:	fn_link  L1056
	fn_link  L1060
	fn_combi_t6 4, 0,2,1,3,0,0
L1056:	fn_combi_t0 1, 0,0,0,0,0,0
L1060:	fn_combi_t58 5, 1,0,3,1,2,4
# --- block 43 ---
L1064:	fn_link  L1044
	fn_link  L1076
	fn_combi_t3 3, 0,1,2,0,0,0
L1076:	fn_combi_t23 6, 0,1,2,3,5,4
# --- block 44 ---
L1080:	fn_link  L1064
	fn_combi_t46 5, 4,3,0,1,2,3
# --- block 45 ---
ZipperPure.tZipSumWith:	fn_link  L1100
	fn_link  NanoPrelude.sum
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 46 ---
L1100:	fn_link  ZipperPure.tToList
	fn_link  GExtra.zipWith
	fn_combi_t39 5, 0,2,1,3,1,4
# --- block 47 ---
NanoPrelude.sum:	fn_link  L1124
	fn_link  L1132
	fn_elink NanoPrelude.foldr
L1124:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 48 ---
L1132:	fn_link  L1144
	fn_link  L1168
	fn_combi_t8 4, 0,3,2,1,0,0
L1144:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1168:	fn_y
# --- block 49 ---
NanoPrelude.foldr:	fn_link  L1188
	fn_link  L1184
	fn_combi_t7 4, 0,1,2,3,0,0
L1184:	fn_y
# --- block 50 ---
L1188:	fn_link  L1196
	fn_combi_t16 5, 4,2,0,1,3,0
L1196:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 51 ---
GExtra.zipWith:	fn_link  L1252
	fn_link  L1212
	fn_combi_t3 3, 0,1,2,0,0,0
L1212:	fn_y
# --- block 52 ---
L1216:	fn_link  L1224
	fn_combi_t40 6, 0,1,2,4,3,5
L1224:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 53 ---
L1228:	fn_link  L1236
	fn_combi_t48 6, 3,0,1,4,2,5
L1236:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1240:	fn_link  L1216
	fn_link  L1228
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 55 ---
L1252:	fn_link  L1240
	fn_link  L1264
	fn_combi_t46 6, 4,0,1,2,3,5
L1264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 56 ---
ZipperPure.tToList:	fn_link  L1312
	fn_link  L1280
	fn_combi_t2 3, 2,0,1,0,0,0
L1280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
L1284:	fn_link  L1292
	fn_combi_t2 4, 3,1,0,0,0,0
L1292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
L1296:	fn_link  ZipperPure.tToList
	fn_link  L1284
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 59 ---
L1312:	fn_link  L1296
	fn_link  ZipperPure.tToList
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 60 ---
Data.List_Type.$2b$2b:	fn_link  L1356
	fn_link  L1340
	fn_combi_t5 4, 0,1,3,2,0,0
L1340:	fn_y
# --- block 61 ---
L1344:	fn_link  L1352
	fn_combi_t6 4, 0,2,1,3,0,0
L1352:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 62 ---
L1356:	fn_link  L1344
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 63 ---
ZipperPure.tMap:	fn_link  L1392
	fn_link  L1376
	fn_combi_t3 3, 0,1,2,0,0,0
L1376:	fn_y
# --- block 64 ---
L1380:	fn_link  L1388
	fn_combi_t15 5, 0,1,3,2,4,0
L1388:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 65 ---
L1392:	fn_link  L1380
	fn_link  L1408
	fn_link  L1412
	fn_combi_t47 6, 5,0,1,2,3,4
L1408:	fn_combi_t37 5, 0,1,2,3,1,4
L1412:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 66 ---
Common.mul3plus1:	fn_link  L1440
	fn_link  L1464
	fn_link  L1488
	fn_link  L1496
	fn_link  L1500
	fn_combi_t55 6, 0,1,2,5,3,4
L1440:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1464:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1488:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1496:	fn_y
L1500:	fn_y
# --- block 67 ---
ZipperPure.zTop:	fn_link  L1524
	fn_combi_t3 2, 1,0,1,0,0,0
# --- block 68 ---
L1512:	fn_link  ZipperPure.zUp
	fn_link  ZipperPure.zTop
	fn_combi_t3 5, 0,1,2,0,0,0
# --- block 69 ---
L1524:	fn_link  L1512
	fn_combi_t6 4, 3,1,0,1,0,0
# --- block 70 ---
ZipperPure.zUp:	fn_link  L1620
	fn_combi_t3 2, 1,0,1,0,0,0
# --- block 71 ---
L1540:	fn_link  L1552
	fn_link  L1556
	fn_combi_t32 6, 0,1,4,5,2,3
L1552:	fn_combi_t4 5, 4,0,1,2,0,0
L1556:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 72 ---
L1560:	fn_link  L1572
	fn_link  L1576
	fn_combi_t32 6, 0,1,4,2,5,3
L1572:	fn_combi_t4 5, 4,0,1,2,0,0
L1576:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 73 ---
L1580:	fn_link  L1560
	fn_link  L1592
	fn_combi_t7 4, 0,1,2,3,0,0
L1592:	fn_combi_t40 5, 1,0,2,4,3,4
# --- block 74 ---
L1596:	fn_link  L1580
	fn_link  L1608
	fn_combi_t3 3, 0,1,2,0,0,0
L1608:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 75 ---
L1612:	fn_link  L1596
	fn_combi_t56 5, 3,0,1,4,2,4
# --- block 76 ---
L1620:	fn_link  L1540
	fn_link  L1612
	fn_combi_t48 5, 4,2,0,3,1,3
# --- block 77 ---
ZipperPure.zDelete:	fn_link  L1640
	fn_elink ZipperPure.zReplace
L1640:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 78 ---
ZipperPure.zReplace:	fn_link  L1652
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 79 ---
L1652:	fn_link  L1660
	fn_combi_t1 3, 0,1,0,0,0,0
L1660:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 80 ---
ZipperPure.zDownL:	fn_link  L1716
	fn_combi_t3 2, 1,0,1,0,0,0
# --- block 81 ---
L1672:	fn_link  L1688
	fn_link  L1692
	fn_link  L1696
	fn_combi_t32 6, 0,1,2,4,5,3
L1688:	fn_combi_t0 2, 0,0,0,0,0,0
L1692:	fn_combi_t4 4, 3,0,1,2,0,0
L1696:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 82 ---
L1700:	fn_link  L1672
	fn_link  L1712
	fn_combi_t46 6, 0,4,1,2,3,5
L1712:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 83 ---
L1716:	fn_link  L1700
	fn_combi_t6 4, 2,1,0,3,0,0
# --- block 84 ---
ZipperPure.zInsert:	fn_link  L1744
	fn_link  L1748
	fn_link  L1752
	fn_link  ZipperPure.zReplace
	fn_combi_t18 5, 0,1,4,2,3,0
L1744:	fn_combi_t0 2, 0,0,0,0,0,0
L1748:	fn_combi_t0 2, 0,0,0,0,0,0
L1752:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 85 ---
ZipperPure.zModify:	fn_link  L1792
	fn_combi_t7 3, 2,0,1,2,0,0
# --- block 86 ---
L1764:	fn_link  L1776
	fn_link  L1780
	fn_combi_t52 6, 0,1,2,3,4,5
L1776:	fn_combi_t4 5, 4,0,1,2,0,0
L1780:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 87 ---
L1784:	fn_link  L1764
	fn_combi_t23 6, 0,1,3,4,5,2
# --- block 88 ---
L1792:	fn_link  L1784
	fn_combi_t16 5, 3,2,0,1,4,0
# --- block 89 ---
ZipperPure.zDownR:	fn_link  L1852
	fn_combi_t3 2, 1,0,1,0,0,0
# --- block 90 ---
L1808:	fn_link  L1824
	fn_link  L1828
	fn_link  L1832
	fn_combi_t32 6, 0,1,2,4,5,3
L1824:	fn_combi_t0 2, 1,0,0,0,0,0
L1828:	fn_combi_t4 4, 3,0,1,2,0,0
L1832:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 91 ---
L1836:	fn_link  L1808
	fn_link  L1848
	fn_combi_t46 6, 0,5,1,2,3,4
L1848:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 92 ---
L1852:	fn_link  L1836
	fn_combi_t6 4, 2,1,0,3,0,0
# --- block 93 ---
NanoPrelude.foldl:	fn_link  L1876
	fn_link  L1872
	fn_combi_t3 3, 0,1,2,0,0,0
L1872:	fn_y
# --- block 94 ---
L1876:	fn_link  L1884
	fn_combi_t46 5, 4,3,0,1,2,3
L1884:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 95 ---
ZipperPure.tInsert:	fn_link  L2020
	fn_link  L2040
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 96 ---
L1900:	fn_link  ZipperPure.tInsert
	fn_link  L1912
	fn_combi_t16 5, 0,3,1,4,2,0
L1912:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 97 ---
L1916:	fn_link  ZipperPure.tInsert
	fn_link  L1928
	fn_combi_t42 6, 0,3,4,1,5,2
L1928:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 98 ---
L1932:	fn_link  L1944
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L1944:	fn_elink _error0
# --- block 99 ---
L1948:	fn_link  L1916
	fn_link  L1932
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 100 ---
L1960:	fn_link  GExtra.$3c
	fn_combi_t42 6, 0,1,3,2,4,5
# --- block 101 ---
L1968:	fn_link  L1948
	fn_link  L1960
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 102 ---
L1980:	fn_link  L1968
	fn_link  L1992
	fn_combi_t40 5, 0,1,2,4,3,4
L1992:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 103 ---
L1996:	fn_link  L1900
	fn_link  L1980
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 104 ---
L2008:	fn_link  L2016
	fn_combi_t29 6, 2,1,0,3,5,4
L2016:	fn_elink _prim_eq
# --- block 105 ---
L2020:	fn_link  L1996
	fn_link  L2008
	fn_link  L2036
	fn_combi_t29 5, 0,1,4,2,4,3
L2036:	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 106 ---
L2040:	fn_link  L2052
	fn_link  L2056
	fn_combi_t18 4, 2,0,3,1,1,0
L2052:	fn_combi_t0 2, 0,0,0,0,0,0
L2056:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 107 ---
GExtra.$3c:	fn_link  L2068
	fn_combi_t3 3, 2,1,0,0,0,0
L2068:	fn_elink _prim_ltu
# --- block 108 ---
ZipperPure.keys:	fn_link  L2084
	fn_link  L2196
	fn_combi_t4 4, 0,2,3,1,0,0
L2084:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 109 ---
L2088:	fn_link  L2104
	fn_link  L2128
	fn_link  ZipperPure.keys
	fn_combi_t8 4, 0,1,3,2,0,0
L2104:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2128:	fn_y
# --- block 110 ---
L2132:	fn_link  L2148
	fn_link  GExtra..$26.
	fn_link  L2156
	fn_combi_t40 5, 0,1,4,2,3,4
L2148:	fn_box
	.word 0x0000ffff	# raw word 65535
	fn_box_body
L2156:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 111 ---
L2160:	fn_link  L2088
	fn_link  L2132
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 112 ---
L2172:	fn_link  L2184
	fn_link  L2188
	fn_combi_t45 6, 4,0,1,2,3,5
L2184:	fn_elink _prim_eq
L2188:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 113 ---
L2196:	fn_link  Common.lcgNext
	fn_link  L2160
	fn_link  L2172
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 114 ---
GExtra..$26.:	fn_link  L2224
	fn_link  L2248
	fn_combi_t8 4, 0,3,2,1,0,0
L2224:	fn_tor a0
	fn_tor a1
	and a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2248:	fn_y
# --- block 115 ---
Common.lcgNext:	fn_link  L2268
	fn_link  L2264
	fn_combi_t3 3, 0,1,2,0,0,0
L2264:	fn_y
# --- block 116 ---
L2268:	fn_link  L2292
	fn_link  L2316
	fn_link  L2340
	fn_link  L2348
	fn_link  L2352
	fn_combi_t55 6, 0,1,2,5,3,4
L2292:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2316:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2340:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L2348:	fn_y
L2352:	fn_box
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
