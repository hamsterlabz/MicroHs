# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Lambda  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Lambda.Add
	.globl	Lambda.App
	.globl	Lambda.Con
	.globl	Lambda.IfZero
	.globl	Lambda.Lam
	.globl	Lambda.Thunk
	.globl	Lambda.Var
	.globl	Lambda.append
	.globl	Lambda.apply
	.globl	Lambda.bench
	.globl	Lambda.bracket
	.globl	Lambda.eqS
	.globl	Lambda.err
	.globl	Lambda.ev
	.globl	Lambda.eval
	.globl	Lambda.evalStateS
	.globl	Lambda.fix
	.globl	Lambda.getS
	.globl	Lambda.hashS
	.globl	Lambda.incr
	.globl	Lambda.isZeroCon
	.globl	Lambda.lfxx
	.globl	Lambda.lookupE
	.globl	Lambda.lookupVar
	.globl	Lambda.nMinus1
	.globl	Lambda.partialSum0
	.globl	Lambda.pp
	.globl	Lambda.ppenv
	.globl	Lambda.ppn
	.globl	Lambda.pushVar
	.globl	Lambda.showI
	.globl	Lambda.showTermD
	.globl	Lambda.simArg
	.globl	Lambda.simpleApply
	.globl	Lambda.simpleEval
	.globl	Lambda.simpleEvalCon
	.globl	Lambda.sum0
	.globl	Lambda.traverseCon
	.globl	Lambda.vF
	.globl	Lambda.vN
	.globl	Lambda.vSum
	.globl	Lambda.vX
	.globl	Lambda.withEnv
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.map
	.globl	NanoPrelude.quot
	.globl	NanoPrelude.rem
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Lambda.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Lambda.bench:	fn_link  L172
L32:	fn_elink Lambda.hashS
# --- block 3 ---
L36:	fn_link  L48
L40:	fn_link  L52
L44:	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
L52:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
L60:	fn_link  Lambda.simArg
L64:	fn_elink Lambda.Con
# --- block 5 ---
L68:	fn_link  L60
L72:	fn_link  Lambda.sum0
L76:	fn_elink Lambda.App
# --- block 6 ---
L80:	fn_link  L92
L84:	fn_link  L68
	fn_elink Lambda.ev
L92:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 7 ---
L96:	fn_link  L36
	fn_link  L80
	fn_elink Lambda.append
# --- block 8 ---
L108:	fn_link  L96
	fn_link  L120
L116:	fn_combi_t2 4, 3,0,1,0,0,0
L120:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 9 ---
L128:	fn_link  Lambda.simArg
	fn_elink Lambda.Con
# --- block 10 ---
L136:	fn_link  L128
	fn_link  Lambda.sum0
	fn_elink Lambda.App
# --- block 11 ---
L148:	fn_link  L136
	fn_link  L160
	fn_elink Lambda.simpleEval
L160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
L164:	fn_link  L148
	fn_elink Lambda.showTermD
# --- block 13 ---
L172:	fn_link  L108
	fn_link  L164
	fn_elink Lambda.append
# --- block 14 ---
Lambda.hashS:	fn_link  L196
	fn_link  L284
	fn_elink NanoPrelude.foldl
L196:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 15 ---
L204:	fn_link  L224
	fn_link  L248
	fn_link  L272
	fn_link  L280
	fn_combi_t41 6, 0,1,4,2,5,3
L224:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L248:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L272:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L280:	fn_y
# --- block 16 ---
L284:	fn_link  L204
	fn_link  L296
	fn_combi_t7 4, 0,1,2,3,0,0
L296:	fn_y
# --- block 17 ---
NanoPrelude.foldl:	fn_link  L316
	fn_link  L312
	fn_combi_t3 3, 0,1,2,0,0,0
L312:	fn_y
# --- block 18 ---
L316:	fn_link  L324
	fn_combi_t46 5, 4,3,0,1,2,3
L324:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 19 ---
Lambda.append:	fn_link  L336
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 20 ---
L336:	fn_link  Lambda.append
	fn_link  L348
	fn_combi_t16 5, 0,3,1,4,2,0
L348:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
Lambda.showTermD:	fn_link  L460
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 22 ---
L360:	fn_link  L372
	fn_link  L376
	fn_combi_t2 4, 3,0,1,0,0,0
L372:	fn_combi_t0 2, 0,0,0,0,0,0
L376:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 23 ---
L384:	fn_link  L360
	fn_link  L396
	fn_combi_t2 4, 3,0,1,0,0,0
L396:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 24 ---
L404:	fn_link  L384
	fn_link  L416
	fn_combi_t2 4, 3,0,1,0,0,0
L416:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 25 ---
L424:	fn_link  L404
	fn_link  L436
	fn_combi_t2 4, 3,0,1,0,0,0
L436:	fn_box
	.word 0x00000043	# raw word 67
	fn_box_body
# --- block 26 ---
L444:	fn_link  Lambda.showI
	fn_link  L424
	fn_link  Lambda.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 27 ---
L460:	fn_link  L444
	fn_link  Lambda.err
	fn_link  L480
	fn_link  L484
	fn_combi_t38 6, 0,4,1,2,5,3
L480:	fn_elink _prim_eq
L484:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 28 ---
Lambda.err:	fn_elink Lambda.err
# --- block 29 ---
Lambda.showI:	fn_link  L704
	fn_link  L516
	fn_link  L716
	fn_link  L808
	fn_combi_t39 5, 0,4,1,4,2,3
L516:	fn_y
# --- block 30 ---
L520:	fn_link  L536
	fn_link  L540
	fn_link  L564
	fn_combi_t13 6, 5,0,3,1,2,0
L536:	fn_combi_t0 2, 0,0,0,0,0,0
L540:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L564:	fn_y
# --- block 31 ---
L568:	fn_link  L588
	fn_link  L612
	fn_link  NanoPrelude.rem
	fn_link  L620
	fn_combi_t18 5, 0,1,4,2,3,0
L588:	fn_force
	fn_tor a0
	addiw a0,a0,48
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L612:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L620:	fn_y
# --- block 32 ---
L624:	fn_link  L636
	fn_link  L568
	fn_combi_t5 5, 4,0,2,1,0,0
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L640:	fn_link  L656
	fn_link  NanoPrelude.quot
	fn_link  Lambda.append
	fn_combi_t21 5, 0,3,1,4,2,0
L656:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 34 ---
L664:	fn_link  L624
	fn_link  L640
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 35 ---
L676:	fn_link  L664
	fn_link  L692
	fn_link  L696
	fn_combi_t44 5, 0,4,1,2,3,4
L692:	fn_elink _prim_lt
L696:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 36 ---
L704:	fn_link  L520
	fn_link  L676
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 37 ---
L716:	fn_link  L732
	fn_link  L756
	fn_link  L764
	fn_combi_t22 5, 4,0,3,1,2,0
L732:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L756:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L764:	fn_y
# --- block 38 ---
L768:	fn_link  L780
	fn_link  L784
	fn_combi_t15 4, 0,2,1,3,2,0
L780:	fn_elink _prim_lt
L784:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 39 ---
L792:	fn_link  L804
	fn_link  L768
	fn_combi_t3 3, 0,1,2,0,0,0
L804:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 40 ---
L808:	fn_link  L828
	fn_link  L836
	fn_link  L792
	fn_link  L840
	fn_combi_t10 5, 0,1,4,2,3,0
L828:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
L836:	fn_combi_t2 4, 3,0,1,0,0,0
L840:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 41 ---
NanoPrelude.quot:	fn_link  L856
	fn_link  L880
	fn_combi_t8 4, 0,3,2,1,0,0
L856:	fn_tor a0
	fn_tor a1
	divw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L880:	fn_y
# --- block 42 ---
NanoPrelude.rem:	fn_link  L896
	fn_link  L920
	fn_combi_t8 4, 0,3,2,1,0,0
L896:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L920:	fn_y
# --- block 43 ---
Lambda.simpleEval:	fn_link  L1212
	fn_link  L1472
	fn_link  L940
	fn_combi_t20 4, 0,1,3,2,3,0
L940:	fn_y
# --- block 44 ---
L944:	fn_link  Lambda.lookupE
	fn_link  L964
	fn_link  Lambda.err
	fn_link  L968
	fn_combi_t42 6, 0,1,2,3,5,4
L964:	fn_combi_t0 1, 0,0,0,0,0,0
L968:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 45 ---
L972:	fn_link  L944
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 46 ---
L980:	fn_link  L996
	fn_link  L1000
	fn_link  L1004
	fn_combi_t45 6, 0,4,1,5,2,3
L996:	fn_combi_t0 2, 0,0,0,0,0,0
L1000:	fn_elink _prim_lt
L1004:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 47 ---
L1012:	fn_link  L1024
	fn_link  Lambda.simpleEvalCon
	fn_combi_t4 4, 0,2,3,1,0,0
L1024:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 48 ---
L1048:	fn_link  Lambda.simpleEvalCon
	fn_link  L1064
	fn_link  Lambda.Con
	fn_combi_t60 6, 0,1,2,3,5,4
L1064:	fn_y
# --- block 49 ---
L1068:	fn_link  L1012
	fn_link  L1048
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 50 ---
L1080:	fn_link  L1068
	fn_link  L1096
	fn_link  L1100
	fn_combi_t45 6, 0,4,1,5,2,3
L1096:	fn_elink _prim_lt
L1100:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 51 ---
L1108:	fn_link  L1128
	fn_link  Lambda.Con
	fn_link  L1080
	fn_link  L1136
	fn_combi_t10 5, 0,1,4,2,3,0
L1128:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1136:	fn_combi_t43 5, 0,3,4,4,1,2
# --- block 52 ---
L1140:	fn_link  L1152
	fn_link  L1156
	fn_combi_t44 5, 0,3,1,2,3,4
L1152:	fn_elink _prim_lt
L1156:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 53 ---
L1164:	fn_link  L1108
	fn_link  L1140
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L1176:	fn_link  L1184
	fn_combi_t29 5, 0,1,4,2,4,3
L1184:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 55 ---
L1188:	fn_link  L1164
	fn_link  L1176
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 56 ---
L1200:	fn_link  L980
	fn_link  L1188
	fn_combi_t39 6, 0,2,1,5,3,4
# --- block 57 ---
L1212:	fn_link  L972
	fn_link  L1200
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 58 ---
L1224:	fn_link  Lambda.Thunk
	fn_combi_t2 5, 0,2,1,0,0,0
# --- block 59 ---
L1232:	fn_link  Lambda.simpleApply
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 60 ---
L1240:	fn_link  L1252
	fn_link  L1256
	fn_combi_t45 6, 0,4,1,5,2,3
L1252:	fn_elink _prim_lt
L1256:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 61 ---
L1264:	fn_link  L1232
	fn_link  L1240
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 62 ---
L1276:	fn_link  Lambda.isZeroCon
	fn_combi_t29 5, 0,1,2,1,4,3
# --- block 63 ---
L1284:	fn_link  L1296
	fn_link  L1276
	fn_combi_t38 5, 0,1,2,3,2,4
L1296:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 64 ---
L1300:	fn_link  Lambda.simpleEval
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 65 ---
L1308:	fn_link  L1300
	fn_link  L1324
	fn_link  L1328
	fn_combi_t15 5, 0,3,1,4,2,0
L1324:	fn_elink _prim_lt
L1328:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 66 ---
L1336:	fn_link  L1284
	fn_link  L1308
	fn_combi_t43 5, 0,3,4,4,1,2
# --- block 67 ---
L1348:	fn_link  L1360
	fn_link  L1364
	fn_combi_t44 5, 0,3,1,2,3,4
L1360:	fn_elink _prim_lt
L1364:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 68 ---
L1372:	fn_link  L1336
	fn_link  L1348
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 69 ---
L1384:	fn_link  L1392
	fn_combi_t29 5, 0,1,4,2,4,3
L1392:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 70 ---
L1396:	fn_link  L1264
	fn_link  L1372
	fn_link  L1384
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 71 ---
L1412:	fn_link  L1224
	fn_link  L1396
	fn_combi_t42 5, 0,2,3,1,2,4
# --- block 72 ---
L1424:	fn_link  L1436
	fn_link  L1440
	fn_combi_t44 5, 0,3,1,2,3,4
L1436:	fn_elink _prim_lt
L1440:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 73 ---
L1448:	fn_link  L1412
	fn_link  L1424
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 74 ---
L1460:	fn_link  L1468
	fn_combi_t57 4, 3,0,1,3,2,3
L1468:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 75 ---
L1472:	fn_link  L1448
	fn_link  L1460
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 76 ---
Lambda.isZeroCon:	fn_link  L1532
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 77 ---
L1492:	fn_link  L1512
	fn_link  L1516
	fn_link  L1520
	fn_link  L1524
	fn_combi_t10 5, 4,0,1,2,3,0
L1512:	fn_combi_t0 2, 1,0,0,0,0,0
L1516:	fn_combi_t0 2, 0,0,0,0,0,0
L1520:	fn_elink _prim_eq
L1524:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 78 ---
L1532:	fn_link  L1492
	fn_link  L1552
	fn_link  L1556
	fn_link  L1560
	fn_combi_t38 6, 0,4,1,2,5,3
L1552:	fn_combi_t0 2, 0,0,0,0,0,0
L1556:	fn_elink _prim_eq
L1560:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 79 ---
Lambda.simpleApply:	fn_link  L1644
	fn_link  L1656
	fn_combi_t21 5, 3,0,1,2,4,0
# --- block 80 ---
L1580:	fn_link  Lambda.Thunk
	fn_combi_t16 5, 4,3,0,2,1,0
# --- block 81 ---
L1588:	fn_link  L1600
	fn_link  Lambda.simpleEval
	fn_combi_t54 6, 0,1,2,3,5,4
L1600:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 82 ---
L1604:	fn_link  L1580
	fn_link  L1588
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 83 ---
L1616:	fn_link  Lambda.err
	fn_link  L1632
	fn_link  L1636
	fn_combi_t38 6, 0,4,1,2,5,3
L1632:	fn_elink _prim_eq
L1636:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 84 ---
L1644:	fn_link  L1604
	fn_link  L1616
	fn_combi_t60 6, 4,0,1,2,3,5
# --- block 85 ---
L1656:	fn_link  Lambda.err
	fn_link  L1672
	fn_link  L1676
	fn_combi_t38 6, 0,4,1,2,5,3
L1672:	fn_elink _prim_eq
L1676:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 86 ---
Lambda.Thunk:	fn_link  L1696
	fn_link  L1700
	fn_combi_t16 5, 4,0,1,2,3,0
L1696:	fn_combi_t2 3, 2,0,1,0,0,0
L1700:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 87 ---
Lambda.Con:	fn_link  L1720
	fn_link  L1724
	fn_combi_t6 4, 3,0,1,2,0,0
L1720:	fn_combi_t1 2, 1,0,0,0,0,0
L1724:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 88 ---
Lambda.simpleEvalCon:	fn_link  L1744
	fn_link  Lambda.simpleEval
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 89 ---
L1744:	fn_link  L1764
	fn_link  Lambda.err
	fn_link  L1768
	fn_link  L1772
	fn_combi_t38 6, 0,4,1,2,5,3
L1764:	fn_combi_t0 1, 0,0,0,0,0,0
L1768:	fn_elink _prim_eq
L1772:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 90 ---
Lambda.lookupE:	fn_link  L1836
	fn_link  L1792
	fn_combi_t3 3, 0,1,2,0,0,0
L1792:	fn_y
# --- block 91 ---
L1796:	fn_link  Lambda.eqS
	fn_combi_t14 5, 0,1,4,2,3,0
# --- block 92 ---
L1804:	fn_link  L1820
	fn_link  L1796
	fn_link  L1824
	fn_combi_t5 4, 0,1,3,2,0,0
L1820:	fn_combi_t1 3, 2,0,0,0,0,0
L1824:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 93 ---
L1828:	fn_link  L1804
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 94 ---
L1836:	fn_link  L1828
	fn_link  L1848
	fn_combi_t16 5, 4,0,1,2,3,0
L1848:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 95 ---
Lambda.eqS:	fn_link  L1916
	fn_link  L1932
	fn_link  L1868
	fn_combi_t40 5, 3,4,0,1,2,4
L1868:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 96 ---
L1872:	fn_link  L1892
	fn_link  L1896
	fn_link  L1900
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L1892:	fn_combi_t0 2, 1,0,0,0,0,0
L1896:	fn_combi_t0 2, 0,0,0,0,0,0
L1900:	fn_elink _prim_eq
# --- block 97 ---
L1904:	fn_link  Lambda.eqS
	fn_link  L1872
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 98 ---
L1916:	fn_link  L1904
	fn_link  L1928
	fn_combi_t16 5, 2,0,1,3,4,0
L1928:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 99 ---
L1932:	fn_link  L1940
	fn_combi_t0 3, 0,0,0,0,0,0
L1940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 100 ---
NanoPrelude.$26$26:	fn_link  L1952
	fn_combi_t1 2, 1,0,0,0,0,0
L1952:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 101 ---
Lambda.App:	fn_link  L1968
	fn_link  L1972
	fn_combi_t16 5, 4,0,1,2,3,0
L1968:	fn_combi_t2 3, 2,0,1,0,0,0
L1972:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 102 ---
Lambda.sum0:	fn_link  Lambda.partialSum0
	fn_link  Lambda.fix
	fn_elink Lambda.App
# --- block 103 ---
Lambda.fix:	fn_link  L2004
	fn_link  Lambda.vF
	fn_elink Lambda.Lam
# --- block 104 ---
L2004:	fn_link  Lambda.lfxx
	fn_link  Lambda.lfxx
	fn_elink Lambda.App
# --- block 105 ---
Lambda.Lam:	fn_link  L2028
	fn_link  L2032
	fn_combi_t16 5, 4,0,1,2,3,0
L2028:	fn_combi_t2 3, 2,0,1,0,0,0
L2032:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 106 ---
Lambda.vF:	fn_link  L2052
	fn_link  L2056
	fn_combi_t2 4, 3,0,1,0,0,0
L2052:	fn_combi_t0 2, 0,0,0,0,0,0
L2056:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 107 ---
Lambda.lfxx:	fn_link  L2112
	fn_link  Lambda.vX
	fn_elink Lambda.Lam
# --- block 108 ---
L2076:	fn_link  Lambda.vX
	fn_elink Lambda.Var
# --- block 109 ---
L2084:	fn_link  Lambda.vX
	fn_elink Lambda.Var
# --- block 110 ---
L2092:	fn_link  L2076
	fn_link  L2084
	fn_elink Lambda.App
# --- block 111 ---
L2104:	fn_link  Lambda.vF
	fn_elink Lambda.Var
# --- block 112 ---
L2112:	fn_link  L2092
	fn_link  L2104
	fn_elink Lambda.App
# --- block 113 ---
Lambda.vX:	fn_link  L2136
	fn_link  L2140
	fn_combi_t2 4, 3,0,1,0,0,0
L2136:	fn_combi_t0 2, 0,0,0,0,0,0
L2140:	fn_box
	.word 0x00000078	# raw word 120
	fn_box_body
# --- block 114 ---
Lambda.Var:	fn_link  L2160
	fn_link  L2164
	fn_combi_t6 4, 3,0,1,2,0,0
L2160:	fn_combi_t1 2, 1,0,0,0,0,0
L2164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 115 ---
Lambda.partialSum0:	fn_link  L2264
	fn_link  Lambda.vSum
	fn_elink Lambda.Lam
# --- block 116 ---
L2184:	fn_link  Lambda.vSum
	fn_elink Lambda.Var
# --- block 117 ---
L2192:	fn_link  Lambda.nMinus1
	fn_link  L2184
	fn_elink Lambda.App
# --- block 118 ---
L2204:	fn_link  Lambda.vN
	fn_elink Lambda.Var
# --- block 119 ---
L2212:	fn_link  L2192
	fn_link  L2204
	fn_elink Lambda.Add
# --- block 120 ---
L2224:	fn_link  L2232
	fn_elink Lambda.Con
L2232:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 121 ---
L2240:	fn_link  Lambda.vN
	fn_elink Lambda.Var
# --- block 122 ---
L2248:	fn_link  L2212
	fn_link  L2224
	fn_link  L2240
	fn_elink Lambda.IfZero
# --- block 123 ---
L2264:	fn_link  L2248
	fn_link  Lambda.vN
	fn_elink Lambda.Lam
# --- block 124 ---
Lambda.vSum:	fn_link  L2320
	fn_link  L2288
	fn_combi_t2 4, 3,0,1,0,0,0
L2288:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 125 ---
L2296:	fn_link  L2308
	fn_link  L2312
	fn_combi_t2 4, 3,0,1,0,0,0
L2308:	fn_combi_t0 2, 0,0,0,0,0,0
L2312:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 126 ---
L2320:	fn_link  L2296
	fn_link  L2332
	fn_combi_t2 4, 3,0,1,0,0,0
L2332:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 127 ---
Lambda.vN:	fn_link  L2352
	fn_link  L2356
	fn_combi_t2 4, 3,0,1,0,0,0
L2352:	fn_combi_t0 2, 0,0,0,0,0,0
L2356:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 128 ---
Lambda.IfZero:	fn_link  L2376
	fn_link  L2380
	fn_combi_t46 6, 5,0,1,2,3,4
L2376:	fn_combi_t4 4, 3,0,1,2,0,0
L2380:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 129 ---
Lambda.Add:	fn_link  L2400
	fn_link  L2404
	fn_combi_t16 5, 4,0,1,2,3,0
L2400:	fn_combi_t2 3, 2,0,1,0,0,0
L2404:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 130 ---
Lambda.nMinus1:	fn_link  L2468
	fn_link  L2476
	fn_elink Lambda.Add
# --- block 131 ---
L2424:	fn_link  L2436
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L2436:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 132 ---
L2460:	fn_link  L2424
	fn_y
# --- block 133 ---
L2468:	fn_link  L2460
	fn_elink Lambda.Con
# --- block 134 ---
L2476:	fn_link  Lambda.vN
	fn_elink Lambda.Var
# --- block 135 ---
Lambda.simArg:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 136 ---
Lambda.ev:	fn_link  L2504
	fn_link  L2632
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 137 ---
L2504:	fn_link  L2520
	fn_link  Lambda.eval
	fn_link  L2524
	fn_combi_t5 4, 0,1,3,2,0,0
L2520:	fn_combi_t0 2, 0,0,0,0,0,0
L2524:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 138 ---
L2528:	fn_link  L2536
	fn_combi_t1 2, 1,0,0,0,0,0
L2536:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 139 ---
L2540:	fn_link  L2552
	fn_link  L2556
	fn_combi_t2 4, 3,0,1,0,0,0
L2552:	fn_combi_t0 2, 0,0,0,0,0,0
L2556:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 140 ---
L2564:	fn_link  L2540
	fn_link  L2576
	fn_combi_t2 4, 3,0,1,0,0,0
L2576:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 141 ---
L2584:	fn_link  Lambda.ppenv
	fn_link  L2564
	fn_link  Lambda.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 142 ---
L2600:	fn_link  Lambda.pp
	fn_link  Lambda.append
	fn_combi_t33 6, 5,0,1,2,3,4
# --- block 143 ---
L2612:	fn_link  L2584
	fn_link  L2600
	fn_link  L2628
	fn_combi_t24 5, 0,1,4,2,4,3
L2628:	fn_combi_t24 5, 0,1,3,3,4,2
# --- block 144 ---
L2632:	fn_link  L2648
	fn_link  L2528
	fn_link  L2612
	fn_combi_t15 4, 0,1,3,3,2,0
L2648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 145 ---
Lambda.pp:	fn_link  L2660
	fn_elink Lambda.ppn
L2660:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 146 ---
Lambda.ppn:	fn_link  L3032
	fn_link  L4068
	fn_link  L2684
	fn_combi_t57 5, 4,0,1,3,2,3
L2684:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 147 ---
L2688:	fn_link  Lambda.showI
	fn_link  L2704
	fn_link  L2708
	fn_combi_t15 5, 0,3,1,4,2,0
L2704:	fn_elink _prim_lt
L2708:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 148 ---
L2716:	fn_link  L2728
	fn_link  L2732
	fn_combi_t2 4, 3,0,1,0,0,0
L2728:	fn_combi_t0 2, 0,0,0,0,0,0
L2732:	fn_box
	.word 0x00000052	# raw word 82
	fn_box_body
# --- block 149 ---
L2740:	fn_link  L2716
	fn_link  L2752
	fn_combi_t2 4, 3,0,1,0,0,0
L2752:	fn_box
	.word 0x00000043	# raw word 67
	fn_box_body
# --- block 150 ---
L2760:	fn_link  L2740
	fn_link  L2772
	fn_combi_t2 4, 3,0,1,0,0,0
L2772:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 151 ---
L2780:	fn_link  L2760
	fn_link  L2792
	fn_combi_t2 4, 3,0,1,0,0,0
L2792:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 152 ---
L2800:	fn_link  L2812
	fn_link  L2816
	fn_combi_t2 4, 3,0,1,0,0,0
L2812:	fn_combi_t0 2, 0,0,0,0,0,0
L2816:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 153 ---
L2824:	fn_link  L2800
	fn_link  L2836
	fn_combi_t2 4, 3,0,1,0,0,0
L2836:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 154 ---
L2844:	fn_link  L2824
	fn_link  L2856
	fn_combi_t2 4, 3,0,1,0,0,0
L2856:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 155 ---
L2864:	fn_link  L2884
	fn_link  Lambda.ppn
	fn_link  L2844
	fn_link  Lambda.append
	fn_combi_t16 5, 0,1,2,3,4,0
L2884:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 156 ---
L2892:	fn_link  L2864
	fn_link  L2912
	fn_link  Lambda.ppn
	fn_link  Lambda.append
	fn_combi_t40 6, 0,1,2,4,3,5
L2912:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 157 ---
L2920:	fn_link  L2892
	fn_link  L2936
	fn_link  Lambda.bracket
	fn_combi_t42 6, 0,3,1,2,4,5
L2936:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 158 ---
L2944:	fn_link  L2920
	fn_link  L2960
	fn_link  L2964
	fn_combi_t45 6, 0,4,1,5,2,3
L2960:	fn_elink _prim_lt
L2964:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 159 ---
L2972:	fn_link  L2780
	fn_link  L2944
	fn_combi_t37 5, 0,2,3,4,4,1
# --- block 160 ---
L2984:	fn_link  L2996
	fn_link  L3000
	fn_combi_t44 5, 0,3,1,2,3,4
L2996:	fn_elink _prim_lt
L3000:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 161 ---
L3008:	fn_link  L2972
	fn_link  L2984
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 162 ---
L3020:	fn_link  L3028
	fn_combi_t29 5, 0,1,4,2,4,3
L3028:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 163 ---
L3032:	fn_link  L3052
	fn_link  L2688
	fn_link  L3008
	fn_link  L3020
	fn_combi_t10 5, 0,1,4,2,3,0
L3052:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 164 ---
L3056:	fn_link  L3068
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3068:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 165 ---
L3092:	fn_link  L3056
	fn_y
# --- block 166 ---
L3100:	fn_link  L3092
	fn_elink Lambda.ppn
# --- block 167 ---
L3108:	fn_link  L3120
	fn_link  L3124
	fn_combi_t2 4, 3,0,1,0,0,0
L3120:	fn_combi_t0 2, 0,0,0,0,0,0
L3124:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 168 ---
L3132:	fn_link  L3108
	fn_link  L3144
	fn_combi_t2 4, 3,0,1,0,0,0
L3144:	fn_box
	.word 0x0000002e	# raw word 46
	fn_box_body
# --- block 169 ---
L3152:	fn_link  L3100
	fn_link  L3132
	fn_link  Lambda.append
	fn_combi_t48 5, 0,3,0,1,2,4
# --- block 170 ---
L3168:	fn_link  L3152
	fn_link  L3184
	fn_link  L3192
	fn_combi_t16 5, 0,1,2,3,4,0
L3184:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
L3192:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 171 ---
L3196:	fn_link  L3168
	fn_link  L3212
	fn_link  Lambda.bracket
	fn_combi_t42 6, 0,3,1,2,4,5
L3212:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 172 ---
L3220:	fn_link  L3240
	fn_link  Lambda.ppn
	fn_link  L3248
	fn_link  L3256
	fn_combi_t16 5, 0,1,2,3,4,0
L3240:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L3248:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
L3256:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 173 ---
L3260:	fn_link  L3220
	fn_link  L3280
	fn_link  Lambda.ppn
	fn_link  Lambda.append
	fn_combi_t40 6, 0,1,2,4,3,5
L3280:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 174 ---
L3288:	fn_link  L3260
	fn_link  L3304
	fn_link  Lambda.bracket
	fn_combi_t42 6, 0,3,1,2,4,5
L3304:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 175 ---
L3312:	fn_link  L3288
	fn_link  L3328
	fn_link  L3332
	fn_combi_t45 6, 0,4,1,5,2,3
L3328:	fn_elink _prim_lt
L3332:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 176 ---
L3340:	fn_link  L3352
	fn_link  L3356
	fn_combi_t2 4, 3,0,1,0,0,0
L3352:	fn_combi_t0 2, 0,0,0,0,0,0
L3356:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 177 ---
L3364:	fn_link  L3340
	fn_link  L3376
	fn_combi_t2 4, 3,0,1,0,0,0
L3376:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 178 ---
L3384:	fn_link  L3364
	fn_link  L3396
	fn_combi_t2 4, 3,0,1,0,0,0
L3396:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 179 ---
L3404:	fn_link  L3384
	fn_link  L3416
	fn_combi_t2 4, 3,0,1,0,0,0
L3416:	fn_box
	.word 0x0000004c	# raw word 76
	fn_box_body
# --- block 180 ---
L3424:	fn_link  L3404
	fn_link  L3436
	fn_combi_t2 4, 3,0,1,0,0,0
L3436:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 181 ---
L3444:	fn_link  L3424
	fn_link  L3456
	fn_combi_t2 4, 3,0,1,0,0,0
L3456:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 182 ---
L3464:	fn_link  L3484
	fn_link  Lambda.ppn
	fn_link  L3444
	fn_link  Lambda.append
	fn_combi_t16 5, 0,1,2,3,4,0
L3484:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 183 ---
L3492:	fn_link  L3464
	fn_link  L3512
	fn_link  Lambda.ppn
	fn_link  Lambda.append
	fn_combi_t40 6, 0,1,2,4,3,5
L3512:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 184 ---
L3520:	fn_link  L3532
	fn_link  L3536
	fn_combi_t2 4, 3,0,1,0,0,0
L3532:	fn_combi_t0 2, 0,0,0,0,0,0
L3536:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 185 ---
L3544:	fn_link  L3520
	fn_link  L3556
	fn_combi_t2 4, 3,0,1,0,0,0
L3556:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 186 ---
L3564:	fn_link  L3544
	fn_link  L3576
	fn_combi_t2 4, 3,0,1,0,0,0
L3576:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 187 ---
L3584:	fn_link  L3564
	fn_link  L3596
	fn_combi_t2 4, 3,0,1,0,0,0
L3596:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 188 ---
L3604:	fn_link  L3584
	fn_link  L3616
	fn_combi_t2 4, 3,0,1,0,0,0
L3616:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 189 ---
L3624:	fn_link  L3604
	fn_link  L3636
	fn_combi_t2 4, 3,0,1,0,0,0
L3636:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 190 ---
L3644:	fn_link  L3492
	fn_link  L3624
	fn_link  Lambda.append
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 191 ---
L3660:	fn_link  L3676
	fn_link  Lambda.ppn
	fn_link  Lambda.append
	fn_combi_t40 6, 0,1,2,3,4,5
L3676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 192 ---
L3684:	fn_link  L3696
	fn_link  L3700
	fn_combi_t2 4, 3,0,1,0,0,0
L3696:	fn_combi_t0 2, 0,0,0,0,0,0
L3700:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 193 ---
L3708:	fn_link  L3684
	fn_link  L3720
	fn_combi_t2 4, 3,0,1,0,0,0
L3720:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 194 ---
L3728:	fn_link  L3708
	fn_link  L3740
	fn_combi_t2 4, 3,0,1,0,0,0
L3740:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 195 ---
L3748:	fn_link  L3728
	fn_link  Lambda.append
	fn_combi_t47 6, 0,1,2,3,4,5
# --- block 196 ---
L3760:	fn_link  L3644
	fn_link  L3660
	fn_link  L3748
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 197 ---
L3776:	fn_link  L3788
	fn_link  Lambda.bracket
	fn_combi_t42 6, 0,2,1,3,4,5
L3788:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 198 ---
L3796:	fn_link  L3760
	fn_link  L3776
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 199 ---
L3808:	fn_link  L3820
	fn_link  L3824
	fn_combi_t2 4, 3,0,1,0,0,0
L3820:	fn_combi_t0 2, 0,0,0,0,0,0
L3824:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 200 ---
L3832:	fn_link  L3808
	fn_link  L3844
	fn_combi_t2 4, 3,0,1,0,0,0
L3844:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 201 ---
L3852:	fn_link  Lambda.ppenv
	fn_link  L3832
	fn_link  Lambda.append
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 202 ---
L3868:	fn_link  L3852
	fn_link  L3888
	fn_link  Lambda.ppn
	fn_link  Lambda.append
	fn_combi_t40 6, 0,1,2,4,3,5
L3888:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 203 ---
L3896:	fn_link  L3868
	fn_link  L3912
	fn_link  Lambda.bracket
	fn_combi_t42 6, 0,3,1,2,4,5
L3912:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 204 ---
L3920:	fn_link  L3896
	fn_link  L3936
	fn_link  L3940
	fn_combi_t45 6, 0,4,1,5,2,3
L3936:	fn_elink _prim_lt
L3940:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 205 ---
L3948:	fn_link  L3920
	fn_combi_t37 5, 0,1,3,4,4,2
# --- block 206 ---
L3956:	fn_link  L3796
	fn_link  L3948
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 207 ---
L3968:	fn_link  L3980
	fn_link  L3984
	fn_combi_t44 5, 0,3,1,2,3,4
L3980:	fn_elink _prim_lt
L3984:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 208 ---
L3992:	fn_link  L3956
	fn_link  L3968
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 209 ---
L4004:	fn_link  L4012
	fn_combi_t29 5, 0,1,4,2,4,3
L4012:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 210 ---
L4016:	fn_link  L3312
	fn_link  L3992
	fn_link  L4004
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 211 ---
L4032:	fn_link  L3196
	fn_link  L4016
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 212 ---
L4044:	fn_link  L4056
	fn_link  L4060
	fn_combi_t44 5, 0,3,1,2,3,4
L4056:	fn_elink _prim_lt
L4060:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 213 ---
L4068:	fn_link  L4032
	fn_link  L4044
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 214 ---
Lambda.bracket:	fn_link  L4120
	fn_link  L4092
	fn_combi_t38 5, 2,3,0,4,1,4
L4092:	fn_elink _prim_le
# --- block 215 ---
L4096:	fn_link  L4108
	fn_link  L4112
	fn_combi_t2 4, 3,0,1,0,0,0
L4108:	fn_combi_t0 2, 0,0,0,0,0,0
L4112:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 216 ---
L4120:	fn_link  L4096
	fn_link  Lambda.append
	fn_link  L4140
	fn_link  L4148
	fn_combi_t16 5, 0,1,2,4,3,0
L4140:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
L4148:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 217 ---
Lambda.ppenv:	fn_link  L4304
	fn_link  L4168
	fn_link  L4176
	fn_combi_t6 4, 0,1,2,3,0,0
L4168:	fn_box
	.word 0x0000005b	# raw word 91
	fn_box_body
L4176:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 218 ---
L4180:	fn_link  L4192
	fn_link  L4196
	fn_combi_t2 4, 3,0,1,0,0,0
L4192:	fn_combi_t0 2, 0,0,0,0,0,0
L4196:	fn_box
	.word 0x0000005d	# raw word 93
	fn_box_body
# --- block 219 ---
L4204:	fn_link  L4216
	fn_link  L4220
	fn_combi_t2 4, 3,0,1,0,0,0
L4216:	fn_combi_t0 2, 0,0,0,0,0,0
L4220:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 220 ---
L4228:	fn_link  L4204
	fn_link  L4240
	fn_combi_t2 4, 3,0,1,0,0,0
L4240:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 221 ---
L4248:	fn_link  L4228
	fn_link  Lambda.pp
	fn_link  Lambda.append
	fn_link  L4272
	fn_link  L4280
	fn_combi_t47 6, 0,1,2,3,5,4
L4272:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
L4280:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 222 ---
L4284:	fn_link  L4248
	fn_link  Lambda.append
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 223 ---
L4296:	fn_link  L4284
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 224 ---
L4304:	fn_link  L4180
	fn_link  L4296
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_link  Lambda.append
	fn_combi_t35 6, 0,1,2,3,5,4
# --- block 225 ---
NanoPrelude.concat:	fn_link  L4340
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L4340:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 226 ---
NanoPrelude.foldr:	fn_link  L4360
	fn_link  L4356
	fn_combi_t7 4, 0,1,2,3,0,0
L4356:	fn_y
# --- block 227 ---
L4360:	fn_link  L4368
	fn_combi_t16 5, 4,2,0,1,3,0
L4368:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 228 ---
Data.List_Type.$2b$2b:	fn_link  L4400
	fn_link  L4384
	fn_combi_t5 4, 0,1,3,2,0,0
L4384:	fn_y
# --- block 229 ---
L4388:	fn_link  L4396
	fn_combi_t6 4, 0,2,1,3,0,0
L4396:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 230 ---
L4400:	fn_link  L4388
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 231 ---
NanoPrelude.map:	fn_link  L4436
	fn_link  L4420
	fn_combi_t3 3, 0,1,2,0,0,0
L4420:	fn_y
# --- block 232 ---
L4424:	fn_link  L4432
	fn_combi_t15 5, 0,1,3,2,4,0
L4432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 233 ---
L4436:	fn_link  L4424
	fn_link  L4448
	fn_combi_t16 5, 4,0,1,2,3,0
L4448:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 234 ---
Lambda.eval:	fn_link  L4764
	fn_link  L5048
	fn_link  L4468
	fn_combi_t19 4, 3,0,1,3,2,0
L4468:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 235 ---
L4472:	fn_link  Lambda.eval
	fn_link  Lambda.lookupVar
	fn_link  L4488
	fn_combi_t5 5, 0,1,3,2,0,0
L4488:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 236 ---
L4492:	fn_link  L4472
	fn_link  Lambda.getS
	fn_link  L4508
	fn_combi_t6 4, 0,1,2,3,0,0
L4508:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 237 ---
L4512:	fn_link  Lambda.Con
	fn_link  L4524
	fn_combi_t3 3, 0,1,2,0,0,0
L4524:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 238 ---
L4528:	fn_link  L4512
	fn_link  L4544
	fn_link  L4548
	fn_combi_t15 5, 0,3,1,4,2,0
L4544:	fn_elink _prim_lt
L4548:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 239 ---
L4556:	fn_link  L4572
	fn_link  Lambda.Con
	fn_link  L4580
	fn_combi_t3 4, 0,1,2,0,0,0
L4572:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4580:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 240 ---
L4584:	fn_link  L4604
	fn_link  L4628
	fn_link  Lambda.Con
	fn_link  L4632
	fn_combi_t64 6, 0,1,2,5,4,3
L4604:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L4628:	fn_y
L4632:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 241 ---
L4636:	fn_link  L4584
	fn_link  Lambda.traverseCon
	fn_link  L4652
	fn_combi_t15 5, 0,1,3,2,4,0
L4652:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 242 ---
L4656:	fn_link  L4636
	fn_link  Lambda.traverseCon
	fn_link  L4672
	fn_combi_t15 5, 0,1,3,2,4,0
L4672:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 243 ---
L4676:	fn_link  L4656
	fn_link  L4692
	fn_link  L4696
	fn_combi_t15 5, 0,3,1,4,2,0
L4692:	fn_elink _prim_lt
L4696:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 244 ---
L4704:	fn_link  L4556
	fn_link  Lambda.incr
	fn_link  L4728
	fn_link  L4676
	fn_link  L4732
	fn_combi_t24 6, 0,1,5,2,3,4
L4728:	fn_combi_t2 3, 0,2,1,0,0,0
L4732:	fn_combi_t49 5, 0,4,4,1,2,3
# --- block 245 ---
L4736:	fn_link  L4704
	fn_link  L4752
	fn_link  L4756
	fn_combi_t44 5, 0,3,1,2,3,4
L4752:	fn_elink _prim_lt
L4756:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 246 ---
L4764:	fn_link  L4492
	fn_link  L4528
	fn_link  L4736
	fn_link  L4784
	fn_combi_t29 5, 0,1,4,2,4,3
L4784:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 247 ---
L4788:	fn_link  Lambda.Thunk
	fn_link  L4800
	fn_combi_t7 4, 0,1,2,3,0,0
L4800:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 248 ---
L4804:	fn_link  L4788
	fn_link  Lambda.getS
	fn_link  L4820
	fn_combi_t6 6, 0,1,2,3,0,0
L4820:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 249 ---
L4824:	fn_link  Lambda.apply
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 250 ---
L4832:	fn_link  L4824
	fn_link  Lambda.eval
	fn_link  L4848
	fn_combi_t15 5, 0,1,3,2,4,0
L4848:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 251 ---
L4852:	fn_link  L4832
	fn_link  L4868
	fn_link  L4872
	fn_combi_t15 5, 0,3,1,4,2,0
L4868:	fn_elink _prim_lt
L4872:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 252 ---
L4880:	fn_link  Lambda.eval
	fn_link  Lambda.isZeroCon
	fn_combi_t39 5, 0,4,1,3,1,2
# --- block 253 ---
L4892:	fn_link  L4880
	fn_link  Lambda.eval
	fn_link  L4908
	fn_combi_t44 6, 0,1,3,2,4,5
L4908:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 254 ---
L4912:	fn_link  Lambda.eval
	fn_link  Lambda.withEnv
	fn_combi_t6 4, 0,3,1,2,0,0
# --- block 255 ---
L4924:	fn_link  L4912
	fn_link  L4940
	fn_link  L4944
	fn_combi_t15 5, 0,3,1,4,2,0
L4940:	fn_elink _prim_lt
L4944:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 256 ---
L4952:	fn_link  L4892
	fn_link  L4924
	fn_combi_t14 4, 0,2,3,3,1,0
# --- block 257 ---
L4964:	fn_link  L4952
	fn_link  L4980
	fn_link  L4984
	fn_combi_t44 5, 0,3,1,2,3,4
L4980:	fn_elink _prim_lt
L4984:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 258 ---
L4992:	fn_link  L4852
	fn_link  L4964
	fn_link  L5008
	fn_combi_t29 5, 0,1,4,2,4,3
L5008:	fn_combi_t48 4, 0,3,1,3,3,2
# --- block 259 ---
L5012:	fn_link  L4804
	fn_link  L4992
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 260 ---
L5024:	fn_link  L5036
	fn_link  L5040
	fn_combi_t44 5, 0,3,1,2,3,4
L5036:	fn_elink _prim_lt
L5040:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 261 ---
L5048:	fn_link  L5012
	fn_link  L5024
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 262 ---
Lambda.withEnv:	fn_link  Lambda.evalStateS
	fn_link  L5072
	fn_combi_t7 4, 0,1,3,2,0,0
L5072:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 263 ---
Lambda.evalStateS:	fn_link  NanoPrelude.fst
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 264 ---
NanoPrelude.fst:	fn_link  L5092
	fn_combi_t1 2, 1,0,0,0,0,0
L5092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 265 ---
Lambda.apply:	fn_link  L5188
	fn_link  L5204
	fn_combi_t8 4, 2,0,1,3,0,0
# --- block 266 ---
L5108:	fn_link  Lambda.Thunk
	fn_link  Lambda.pushVar
	fn_combi_t30 6, 0,3,1,2,5,4
# --- block 267 ---
L5120:	fn_link  Lambda.withEnv
	fn_combi_t47 6, 0,1,2,3,4,5
# --- block 268 ---
L5128:	fn_link  Lambda.eval
	fn_link  L5108
	fn_link  L5120
	fn_combi_t30 6, 0,4,1,3,5,2
# --- block 269 ---
L5144:	fn_link  Lambda.getS
	fn_link  L5156
	fn_combi_t46 6, 0,1,2,3,4,5
L5156:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 270 ---
L5160:	fn_link  Lambda.err
	fn_link  L5176
	fn_link  L5180
	fn_combi_t38 6, 0,4,1,2,5,3
L5176:	fn_elink _prim_eq
L5180:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 271 ---
L5188:	fn_link  L5128
	fn_link  L5144
	fn_link  L5160
	fn_combi_t61 6, 4,0,1,2,3,5
# --- block 272 ---
L5204:	fn_link  Lambda.err
	fn_link  L5220
	fn_link  L5224
	fn_combi_t38 6, 0,4,1,2,5,3
L5220:	fn_elink _prim_eq
L5224:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 273 ---
Lambda.getS:	fn_link  L5244
	fn_link  L5248
	fn_combi_t3 3, 0,1,2,0,0,0
L5244:	fn_combi_t0 1, 0,0,0,0,0,0
L5248:	fn_combi_t2 2, 1,0,0,0,0,0
# --- block 274 ---
Lambda.pushVar:	fn_link  L5288
	fn_link  Lambda.getS
	fn_link  L5268
	fn_combi_t46 6, 0,1,2,3,4,5
L5268:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 275 ---
L5272:	fn_link  L5284
	fn_link  Lambda.withEnv
	fn_combi_t33 6, 0,1,2,3,5,4
L5284:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 276 ---
L5288:	fn_link  L5300
	fn_link  L5272
	fn_combi_t3 3, 0,1,2,0,0,0
L5300:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 277 ---
Lambda.traverseCon:	fn_link  L5360
	fn_link  Lambda.eval
	fn_link  L5320
	fn_combi_t5 4, 0,1,3,2,0,0
L5320:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 278 ---
L5324:	fn_link  L5344
	fn_link  Lambda.err
	fn_link  L5348
	fn_link  L5352
	fn_combi_t38 6, 0,4,1,2,5,3
L5344:	fn_combi_t2 3, 2,0,1,0,0,0
L5348:	fn_elink _prim_eq
L5352:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 279 ---
L5360:	fn_link  L5324
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 280 ---
Lambda.incr:	fn_link  L5376
	fn_combi_t2 3, 2,0,1,0,0,0
L5376:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 281 ---
Lambda.lookupVar:	fn_link  L5432
	fn_link  Lambda.getS
	fn_link  L5400
	fn_combi_t6 4, 0,1,2,3,0,0
L5400:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 282 ---
L5404:	fn_link  Lambda.lookupE
	fn_link  L5424
	fn_link  Lambda.err
	fn_link  L5428
	fn_combi_t42 6, 0,1,2,3,4,5
L5424:	fn_combi_t0 1, 0,0,0,0,0,0
L5428:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 283 ---
L5432:	fn_link  L5404
	fn_link  L5444
	fn_combi_t7 4, 0,1,2,3,0,0
L5444:	fn_combi_t2 3, 2,0,1,0,0,0

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
