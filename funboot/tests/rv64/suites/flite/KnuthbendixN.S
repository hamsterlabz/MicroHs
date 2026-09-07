# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/KnuthbendixN  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$3a
	.globl	KnuthbendixN.$21$21
	.globl	KnuthbendixN.applyToIndex
	.globl	KnuthbendixN.argPositions
	.globl	KnuthbendixN.arity
	.globl	KnuthbendixN.before
	.globl	KnuthbendixN.both
	.globl	KnuthbendixN.checkEquations
	.globl	KnuthbendixN.checkTerm
	.globl	KnuthbendixN.compareAll
	.globl	KnuthbendixN.complete
	.globl	KnuthbendixN.completionLoop
	.globl	KnuthbendixN.completionWith
	.globl	KnuthbendixN.completionWith2
	.globl	KnuthbendixN.concatMap
	.globl	KnuthbendixN.concatStrings
	.globl	KnuthbendixN.criticalPairs
	.globl	KnuthbendixN.criticalPairsAt
	.globl	KnuthbendixN.criticalPairsFrom
	.globl	KnuthbendixN.cross
	.globl	KnuthbendixN.duoCriticalPairs
	.globl	KnuthbendixN.elemBy
	.globl	KnuthbendixN.emitStr
	.globl	KnuthbendixN.eq
	.globl	KnuthbendixN.equalStrings
	.globl	KnuthbendixN.equalTerms
	.globl	KnuthbendixN.equiv
	.globl	KnuthbendixN.equivPair
	.globl	KnuthbendixN.funSequence
	.globl	KnuthbendixN.funWeight
	.globl	KnuthbendixN.funcAfter
	.globl	KnuthbendixN.getCriticalPairs
	.globl	KnuthbendixN.insBy
	.globl	KnuthbendixN.intersperse
	.globl	KnuthbendixN.isInfix
	.globl	KnuthbendixN.isVar
	.globl	KnuthbendixN.kbGreaterThan
	.globl	KnuthbendixN.last
	.globl	KnuthbendixN.leq
	.globl	KnuthbendixN.lookUpBy
	.globl	KnuthbendixN.main
	.globl	KnuthbendixN.match
	.globl	KnuthbendixN.matchWith
	.globl	KnuthbendixN.non
	.globl	KnuthbendixN.norm
	.globl	KnuthbendixN.normEqn
	.globl	KnuthbendixN.normRhs
	.globl	KnuthbendixN.normalForms
	.globl	KnuthbendixN.nubBy
	.globl	KnuthbendixN.nubBySans
	.globl	KnuthbendixN.order
	.globl	KnuthbendixN.orderLex
	.globl	KnuthbendixN.orient
	.globl	KnuthbendixN.placeAt
	.globl	KnuthbendixN.positions
	.globl	KnuthbendixN.pow
	.globl	KnuthbendixN.powerOf
	.globl	KnuthbendixN.reduce
	.globl	KnuthbendixN.reduceAt
	.globl	KnuthbendixN.reduceAtWith
	.globl	KnuthbendixN.reduceSplit
	.globl	KnuthbendixN.reducible
	.globl	KnuthbendixN.rename
	.globl	KnuthbendixN.renameNew
	.globl	KnuthbendixN.rn
	.globl	KnuthbendixN.selfCriticalPairs
	.globl	KnuthbendixN.showEqn
	.globl	KnuthbendixN.showEqns
	.globl	KnuthbendixN.showResult
	.globl	KnuthbendixN.showRule
	.globl	KnuthbendixN.showRules
	.globl	KnuthbendixN.showTerm
	.globl	KnuthbendixN.simplifyEquations
	.globl	KnuthbendixN.simplifyRules
	.globl	KnuthbendixN.subst
	.globl	KnuthbendixN.substAdd
	.globl	KnuthbendixN.subterm
	.globl	KnuthbendixN.tally
	.globl	KnuthbendixN.termWeight
	.globl	KnuthbendixN.unify
	.globl	KnuthbendixN.unifyWith
	.globl	KnuthbendixN.unionBy
	.globl	KnuthbendixN.uniqueRules
	.globl	KnuthbendixN.unlines
	.globl	KnuthbendixN.varAt
	.globl	KnuthbendixN.varCounts
	.globl	KnuthbendixN.varWeight
	.globl	KnuthbendixN.variables
	.globl	KnuthbendixN.variations
	.globl	KnuthbendixN.variety
	.globl	KnuthbendixN.vars
	.globl	KnuthbendixN.weights
	.globl	KnuthbendixN.zipWith
	.globl	KnuthbendixN.zipWithRemRight
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$7c$7c
	.globl	NanoPrelude.all
	.globl	NanoPrelude.and
	.globl	NanoPrelude.concat
	.globl	NanoPrelude.curry
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.fromJust
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.head
	.globl	NanoPrelude.isJust
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.null
	.globl	NanoPrelude.pred
	.globl	NanoPrelude.repeat
	.globl	NanoPrelude.snd
	.globl	NanoPrelude.succ
	.globl	NanoPrelude.sum
	.globl	NanoPrelude.tail
	.globl	NanoPrelude.takeWhile
	.globl	NanoPrelude.zip
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  KnuthbendixN.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
KnuthbendixN.main:	fn_link  L280
L32:	fn_link  L760
	fn_link  L1228
L40:	fn_link  L1664
L44:	fn_combi_t10 4, 0,1,3,3,2,0
# --- block 3 ---
L48:	fn_link  L60
	fn_link  L64
	fn_combi_t2 3, 2,0,1,0,0,0
L60:	fn_combi_t0 2, 0,0,0,0,0,0
L64:	fn_box
L68:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L72:	fn_link  L84
L76:	fn_link  L88
L80:	fn_combi_t2 4, 3,0,1,0,0,0
L84:	fn_combi_t0 2, 0,0,0,0,0,0
L88:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 5 ---
L96:	fn_link  L48
L100:	fn_link  L72
L104:	fn_link  L112
L108:	fn_combi_t5 4, 3,0,1,2,0,0
L112:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 6 ---
L116:	fn_link  L128
	fn_link  L96
	fn_combi_t2 4, 3,0,1,0,0,0
L128:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
L132:	fn_link  L144
	fn_link  L148
	fn_combi_t2 3, 2,0,1,0,0,0
L144:	fn_combi_t0 2, 0,0,0,0,0,0
L148:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 8 ---
L156:	fn_link  L168
	fn_link  L172
	fn_combi_t2 4, 3,0,1,0,0,0
L168:	fn_combi_t0 2, 0,0,0,0,0,0
L172:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 9 ---
L180:	fn_link  L132
	fn_link  L156
	fn_link  L196
	fn_combi_t5 4, 3,0,1,2,0,0
L196:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 10 ---
L200:	fn_link  L116
	fn_link  L180
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L212:	fn_link  L224
	fn_link  L228
	fn_combi_t2 3, 2,0,1,0,0,0
L224:	fn_combi_t0 2, 1,0,0,0,0,0
L228:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 12 ---
L236:	fn_link  L248
	fn_link  L252
	fn_combi_t2 4, 3,0,1,0,0,0
L248:	fn_combi_t0 2, 0,0,0,0,0,0
L252:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 13 ---
L260:	fn_link  L212
	fn_link  L236
	fn_link  L276
	fn_combi_t5 4, 3,0,1,2,0,0
L276:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 14 ---
L280:	fn_link  L200
	fn_link  L260
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
L292:	fn_link  L304
	fn_link  L308
	fn_combi_t2 4, 3,0,1,0,0,0
L304:	fn_combi_t0 2, 0,0,0,0,0,0
L308:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 16 ---
L316:	fn_link  L328
	fn_link  L292
	fn_combi_t2 4, 2,0,1,0,0,0
L328:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 17 ---
L332:	fn_link  L344
	fn_link  L348
	fn_combi_t2 4, 3,0,1,0,0,0
L344:	fn_combi_t0 2, 0,0,0,0,0,0
L348:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 18 ---
L356:	fn_link  L376
	fn_link  L332
	fn_link  L380
	fn_link  L384
	fn_combi_t13 6, 5,0,1,2,3,0
L376:	fn_combi_t0 2, 0,0,0,0,0,0
L380:	fn_combi_t0 1, 0,0,0,0,0,0
L384:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 19 ---
L388:	fn_link  L400
	fn_link  L404
	fn_combi_t2 4, 3,0,1,0,0,0
L400:	fn_combi_t0 2, 0,0,0,0,0,0
L404:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 20 ---
L412:	fn_link  L432
	fn_link  L388
	fn_link  L436
	fn_link  L440
	fn_combi_t13 6, 5,0,1,2,3,0
L432:	fn_combi_t0 2, 0,0,0,0,0,0
L436:	fn_combi_t0 1, 0,0,0,0,0,0
L440:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 21 ---
L444:	fn_link  L456
	fn_link  L460
	fn_combi_t2 4, 3,0,1,0,0,0
L456:	fn_combi_t0 2, 0,0,0,0,0,0
L460:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 22 ---
L468:	fn_link  L412
	fn_link  L444
	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 23 ---
L480:	fn_link  L356
	fn_link  L468
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 24 ---
L492:	fn_link  L504
	fn_link  L508
	fn_combi_t2 4, 3,0,1,0,0,0
L504:	fn_combi_t0 2, 0,0,0,0,0,0
L508:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 25 ---
L516:	fn_link  L316
	fn_link  L480
	fn_link  L492
	fn_link  L540
	fn_link  L544
	fn_combi_t33 6, 5,0,1,2,3,4
L540:	fn_combi_t0 1, 0,0,0,0,0,0
L544:	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 26 ---
L548:	fn_link  L560
	fn_link  L516
	fn_combi_t2 4, 3,0,1,0,0,0
L560:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
L564:	fn_link  L576
	fn_link  L580
	fn_combi_t2 4, 3,0,1,0,0,0
L576:	fn_combi_t0 2, 0,0,0,0,0,0
L580:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 28 ---
L588:	fn_link  L564
	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 29 ---
L596:	fn_link  L608
	fn_link  L612
	fn_combi_t2 4, 3,0,1,0,0,0
L608:	fn_combi_t0 2, 0,0,0,0,0,0
L612:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 30 ---
L620:	fn_link  L640
	fn_link  L596
	fn_link  L644
	fn_link  L648
	fn_combi_t13 6, 5,0,1,2,3,0
L640:	fn_combi_t0 2, 0,0,0,0,0,0
L644:	fn_combi_t0 1, 0,0,0,0,0,0
L648:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 31 ---
L652:	fn_link  L664
	fn_link  L668
	fn_combi_t2 4, 3,0,1,0,0,0
L664:	fn_combi_t0 2, 0,0,0,0,0,0
L668:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 32 ---
L676:	fn_link  L688
	fn_link  L652
	fn_combi_t2 4, 2,0,1,0,0,0
L688:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L692:	fn_link  L620
	fn_link  L676
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 34 ---
L704:	fn_link  L716
	fn_link  L720
	fn_combi_t2 4, 3,0,1,0,0,0
L716:	fn_combi_t0 2, 0,0,0,0,0,0
L720:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 35 ---
L728:	fn_link  L588
	fn_link  L692
	fn_link  L704
	fn_link  L752
	fn_link  L756
	fn_combi_t33 6, 5,0,1,2,3,4
L752:	fn_combi_t0 1, 0,0,0,0,0,0
L756:	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 36 ---
L760:	fn_link  L548
	fn_link  L728
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 37 ---
L772:	fn_link  KnuthbendixN.complete
	fn_link  KnuthbendixN.showResult
	fn_link  KnuthbendixN.emitStr
	fn_combi_t54 5, 0,1,2,3,4,3
# --- block 38 ---
L788:	fn_link  L800
	fn_link  L772
	fn_combi_t3 3, 0,1,2,0,0,0
L800:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 39 ---
L804:	fn_link  KnuthbendixN.showEqns
	fn_link  KnuthbendixN.emitStr
	fn_link  L820
	fn_combi_t21 5, 0,1,2,3,4,0
L820:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 40 ---
L824:	fn_link  L804
	fn_combi_t42 5, 0,1,4,2,4,3
# --- block 41 ---
L832:	fn_link  L848
	fn_link  L788
	fn_link  L824
	fn_combi_t11 4, 0,3,1,3,2,0
L848:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 42 ---
L856:	fn_link  L868
	fn_link  L872
	fn_combi_t2 4, 3,0,1,0,0,0
L868:	fn_combi_t0 2, 0,0,0,0,0,0
L872:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 43 ---
L880:	fn_link  L856
	fn_link  L892
	fn_combi_t2 4, 3,0,1,0,0,0
L892:	fn_box
	.word 0x0000003a	# raw word 58
	fn_box_body
# --- block 44 ---
L900:	fn_link  L880
	fn_link  L912
	fn_combi_t2 4, 3,0,1,0,0,0
L912:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 45 ---
L920:	fn_link  L900
	fn_link  L932
	fn_combi_t2 4, 3,0,1,0,0,0
L932:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 46 ---
L940:	fn_link  L920
	fn_link  L952
	fn_combi_t2 4, 3,0,1,0,0,0
L952:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 47 ---
L960:	fn_link  L940
	fn_link  L972
	fn_combi_t2 4, 3,0,1,0,0,0
L972:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 48 ---
L980:	fn_link  L960
	fn_link  L992
	fn_combi_t2 4, 3,0,1,0,0,0
L992:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 49 ---
L1000:	fn_link  L980
	fn_link  L1012
	fn_combi_t2 4, 3,0,1,0,0,0
L1012:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 50 ---
L1020:	fn_link  L1000
	fn_link  L1032
	fn_combi_t2 4, 3,0,1,0,0,0
L1032:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 51 ---
L1040:	fn_link  L1020
	fn_link  L1052
	fn_combi_t2 4, 3,0,1,0,0,0
L1052:	fn_box
	.word 0x00000071	# raw word 113
	fn_box_body
# --- block 52 ---
L1060:	fn_link  L1040
	fn_link  L1072
	fn_combi_t2 4, 3,0,1,0,0,0
L1072:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 53 ---
L1080:	fn_link  L1060
	fn_link  L1092
	fn_combi_t2 4, 3,0,1,0,0,0
L1092:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 54 ---
L1100:	fn_link  L1080
	fn_link  L1112
	fn_combi_t2 4, 3,0,1,0,0,0
L1112:	fn_box
	.word 0x00000067	# raw word 103
	fn_box_body
# --- block 55 ---
L1120:	fn_link  L1100
	fn_link  L1132
	fn_combi_t2 4, 3,0,1,0,0,0
L1132:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 56 ---
L1140:	fn_link  L1120
	fn_link  L1152
	fn_combi_t2 4, 3,0,1,0,0,0
L1152:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 57 ---
L1160:	fn_link  L1140
	fn_link  L1172
	fn_combi_t2 4, 3,0,1,0,0,0
L1172:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 58 ---
L1180:	fn_link  L1160
	fn_link  L1192
	fn_combi_t2 4, 3,0,1,0,0,0
L1192:	fn_box
	.word 0x00000055	# raw word 85
	fn_box_body
# --- block 59 ---
L1200:	fn_link  L1180
	fn_link  L1220
	fn_link  KnuthbendixN.emitStr
	fn_link  L1224
	fn_combi_t41 6, 0,1,2,3,4,5
L1220:	fn_combi_t0 1, 0,0,0,0,0,0
L1224:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 60 ---
L1228:	fn_link  L832
	fn_link  L1200
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 61 ---
L1240:	fn_link  L1252
	fn_link  L1256
	fn_combi_t2 4, 3,0,1,0,0,0
L1252:	fn_combi_t0 2, 0,0,0,0,0,0
L1256:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 62 ---
L1264:	fn_link  L1240
	fn_link  L1276
	fn_combi_t2 4, 3,0,1,0,0,0
L1276:	fn_box
	.word 0x0000006e	# raw word 110
	fn_box_body
# --- block 63 ---
L1284:	fn_link  L1264
	fn_link  L1296
	fn_combi_t2 4, 3,0,1,0,0,0
L1296:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 64 ---
L1304:	fn_link  L1284
	fn_link  L1316
	fn_combi_t2 4, 3,0,1,0,0,0
L1316:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 65 ---
L1324:	fn_link  L1304
	fn_link  L1336
	fn_combi_t2 4, 3,0,1,0,0,0
L1336:	fn_box
	.word 0x00000074	# raw word 116
	fn_box_body
# --- block 66 ---
L1344:	fn_link  L1324
	fn_link  L1356
	fn_combi_t2 4, 3,0,1,0,0,0
L1356:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 67 ---
L1364:	fn_link  L1344
	fn_link  L1376
	fn_combi_t2 4, 3,0,1,0,0,0
L1376:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 68 ---
L1384:	fn_link  L1364
	fn_link  L1396
	fn_combi_t2 4, 3,0,1,0,0,0
L1396:	fn_box
	.word 0x00000071	# raw word 113
	fn_box_body
# --- block 69 ---
L1404:	fn_link  L1384
	fn_link  L1416
	fn_combi_t2 4, 3,0,1,0,0,0
L1416:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 70 ---
L1424:	fn_link  L1404
	fn_link  L1436
	fn_combi_t2 4, 3,0,1,0,0,0
L1436:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 71 ---
L1444:	fn_link  L1424
	fn_link  L1456
	fn_combi_t2 4, 3,0,1,0,0,0
L1456:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 72 ---
L1464:	fn_link  L1444
	fn_link  L1476
	fn_combi_t2 4, 3,0,1,0,0,0
L1476:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 73 ---
L1484:	fn_link  L1464
	fn_link  L1496
	fn_combi_t2 4, 3,0,1,0,0,0
L1496:	fn_box
	.word 0x0000006d	# raw word 109
	fn_box_body
# --- block 74 ---
L1504:	fn_link  L1484
	fn_link  L1516
	fn_combi_t2 4, 3,0,1,0,0,0
L1516:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 75 ---
L1524:	fn_link  L1504
	fn_link  L1536
	fn_combi_t2 4, 3,0,1,0,0,0
L1536:	fn_box
	.word 0x0000006f	# raw word 111
	fn_box_body
# --- block 76 ---
L1544:	fn_link  L1524
	fn_link  L1556
	fn_combi_t2 4, 3,0,1,0,0,0
L1556:	fn_box
	.word 0x00000066	# raw word 102
	fn_box_body
# --- block 77 ---
L1564:	fn_link  L1544
	fn_link  L1576
	fn_combi_t2 4, 3,0,1,0,0,0
L1576:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 78 ---
L1584:	fn_link  L1564
	fn_link  L1596
	fn_combi_t2 4, 3,0,1,0,0,0
L1596:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 79 ---
L1604:	fn_link  L1584
	fn_link  L1616
	fn_combi_t2 4, 3,0,1,0,0,0
L1616:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 80 ---
L1624:	fn_link  L1604
	fn_link  L1636
	fn_combi_t2 4, 3,0,1,0,0,0
L1636:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 81 ---
L1644:	fn_link  L1656
	fn_link  L1624
	fn_elink KnuthbendixN.emitStr
L1656:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 82 ---
L1664:	fn_link  L1644
	fn_link  KnuthbendixN.checkEquations
	fn_combi_t37 5, 0,4,3,1,2,4
# --- block 83 ---
KnuthbendixN.checkEquations:	fn_link  KnuthbendixN.checkTerm
	fn_link  KnuthbendixN.both
	fn_link  NanoPrelude.all
	fn_combi_t13 5, 0,1,2,4,3,0
# --- block 84 ---
NanoPrelude.all:	fn_link  L1716
	fn_link  L1704
	fn_combi_t3 3, 0,1,2,0,0,0
L1704:	fn_y
# --- block 85 ---
L1708:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 86 ---
L1716:	fn_link  L1708
	fn_link  L1728
	fn_combi_t16 5, 4,0,1,2,3,0
L1728:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 87 ---
NanoPrelude.$26$26:	fn_link  L1740
	fn_combi_t1 2, 1,0,0,0,0,0
L1740:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 88 ---
KnuthbendixN.both:	fn_link  L1756
	fn_link  L1760
	fn_combi_t8 4, 3,0,1,2,0,0
L1756:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 89 ---
L1760:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 90 ---
KnuthbendixN.checkTerm:	fn_link  L1872
	fn_link  L1780
	fn_combi_t3 3, 0,1,2,0,0,0
L1780:	fn_y
# --- block 91 ---
L1784:	fn_link  L1792
	fn_combi_t0 2, 0,0,0,0,0,0
L1792:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 92 ---
L1796:	fn_link  L1812
	fn_link  NanoPrelude.length
	fn_link  KnuthbendixN.arity
	fn_combi_t42 6, 0,3,4,1,5,2
L1812:	fn_elink _prim_eq
# --- block 93 ---
L1816:	fn_link  NanoPrelude.$26$26
	fn_combi_t51 6, 0,1,4,5,2,3
# --- block 94 ---
L1824:	fn_link  L1844
	fn_link  L1848
	fn_link  L1796
	fn_link  L1816
	fn_combi_t10 5, 0,1,4,2,3,0
L1844:	fn_combi_t0 2, 1,0,0,0,0,0
L1848:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 95 ---
L1852:	fn_link  NanoPrelude.all
	fn_link  L1824
	fn_link  L1868
	fn_combi_t5 4, 0,1,3,2,0,0
L1868:	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 96 ---
L1872:	fn_link  L1784
	fn_link  L1852
	fn_combi_t12 5, 4,0,2,3,1,0
# --- block 97 ---
KnuthbendixN.arity:	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.lookUpBy
	fn_link  L1944
	fn_combi_t18 5, 0,1,2,4,3,0
# --- block 98 ---
L1900:	fn_link  L1912
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1912:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 99 ---
L1936:	fn_link  L1900
	fn_y
# --- block 100 ---
L1944:	fn_link  NanoPrelude.fst
	fn_link  L1936
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 101 ---
NanoPrelude.fst:	fn_link  L1964
	fn_combi_t1 2, 1,0,0,0,0,0
L1964:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 102 ---
KnuthbendixN.lookUpBy:	fn_link  L2020
	fn_link  L1980
	fn_combi_t7 4, 0,1,2,3,0,0
L1980:	fn_y
# --- block 103 ---
L1984:	fn_link  L2000
	fn_link  L2004
	fn_link  L2008
	fn_combi_t12 5, 0,1,3,4,2,0
L2000:	fn_combi_t1 3, 2,0,0,0,0,0
L2004:	fn_combi_t14 5, 0,1,4,2,3,0
L2008:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 104 ---
L2012:	fn_link  L1984
	fn_combi_t51 6, 4,0,1,2,3,5
# --- block 105 ---
L2020:	fn_link  L2012
	fn_link  L2032
	fn_combi_t46 6, 5,0,1,2,3,4
L2032:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 106 ---
KnuthbendixN.equalStrings:	fn_link  L2100
	fn_link  L2116
	fn_link  L2052
	fn_combi_t40 5, 3,4,0,1,2,4
L2052:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 107 ---
L2056:	fn_link  L2076
	fn_link  L2080
	fn_link  L2084
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L2076:	fn_combi_t0 2, 1,0,0,0,0,0
L2080:	fn_combi_t0 2, 0,0,0,0,0,0
L2084:	fn_elink _prim_eq
# --- block 108 ---
L2088:	fn_link  KnuthbendixN.equalStrings
	fn_link  L2056
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 109 ---
L2100:	fn_link  L2088
	fn_link  L2112
	fn_combi_t16 5, 2,0,1,3,4,0
L2112:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 110 ---
L2116:	fn_link  L2124
	fn_combi_t0 3, 0,0,0,0,0,0
L2124:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 111 ---
NanoPrelude.length:	fn_link  L2140
	fn_link  L2188
	fn_y
L2140:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 112 ---
L2148:	fn_link  L2160
	fn_link  L2184
	fn_combi_t8 5, 2,0,3,1,0,0
L2160:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2184:	fn_y
# --- block 113 ---
L2188:	fn_link  L2148
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 114 ---
KnuthbendixN.emitStr:	fn_link  L2204
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 115 ---
L2204:	fn_link  L2220
	fn_link  KnuthbendixN.emitStr
	fn_link  L2244
	fn_combi_t56 6, 0,1,5,3,4,2
L2220:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L2244:	fn_y
# --- block 116 ---
KnuthbendixN.showEqns:	fn_link  KnuthbendixN.showEqn
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.unlines
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 117 ---
KnuthbendixN.unlines:	fn_link  L2296
	fn_elink KnuthbendixN.concatMap
# --- block 118 ---
L2272:	fn_link  L2284
	fn_link  L2288
	fn_combi_t2 4, 3,0,1,0,0,0
L2284:	fn_combi_t0 2, 0,0,0,0,0,0
L2288:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 119 ---
L2296:	fn_link  L2272
	fn_link  L2312
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t6 4, 0,3,1,2,0,0
L2312:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 120 ---
KnuthbendixN.concatMap:	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.concat
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 121 ---
NanoPrelude.concat:	fn_link  L2340
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L2340:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 122 ---
NanoPrelude.foldr:	fn_link  L2360
	fn_link  L2356
	fn_combi_t7 4, 0,1,2,3,0,0
L2356:	fn_y
# --- block 123 ---
L2360:	fn_link  L2368
	fn_combi_t16 5, 4,2,0,1,3,0
L2368:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 124 ---
Data.List_Type.$2b$2b:	fn_link  L2400
	fn_link  L2384
	fn_combi_t5 4, 0,1,3,2,0,0
L2384:	fn_y
# --- block 125 ---
L2388:	fn_link  L2396
	fn_combi_t6 4, 0,2,1,3,0,0
L2396:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 126 ---
L2400:	fn_link  L2388
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 127 ---
NanoPrelude.map:	fn_link  L2436
	fn_link  L2420
	fn_combi_t3 3, 0,1,2,0,0,0
L2420:	fn_y
# --- block 128 ---
L2424:	fn_link  L2432
	fn_combi_t15 5, 0,1,3,2,4,0
L2432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 129 ---
L2436:	fn_link  L2424
	fn_link  L2448
	fn_combi_t16 5, 4,0,1,2,3,0
L2448:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 130 ---
KnuthbendixN.showEqn:	fn_link  L2528
	fn_link  L2552
	fn_combi_t19 4, 3,0,1,2,2,0
# --- block 131 ---
L2464:	fn_link  L2476
	fn_link  L2480
	fn_combi_t2 4, 3,0,1,0,0,0
L2476:	fn_combi_t0 2, 0,0,0,0,0,0
L2480:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 132 ---
L2488:	fn_link  L2464
	fn_link  L2500
	fn_combi_t2 4, 3,0,1,0,0,0
L2500:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
# --- block 133 ---
L2508:	fn_link  L2488
	fn_link  L2520
	fn_combi_t2 4, 3,0,1,0,0,0
L2520:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 134 ---
L2528:	fn_link  KnuthbendixN.showTerm
	fn_link  L2508
	fn_link  L2548
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L2548:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 135 ---
L2552:	fn_link  KnuthbendixN.showTerm
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 136 ---
KnuthbendixN.showTerm:	fn_link  L3068
	fn_link  L2576
	fn_combi_t3 3, 0,1,2,0,0,0
L2576:	fn_y
# --- block 137 ---
L2580:	fn_link  L2592
	fn_link  L2596
	fn_combi_t2 4, 3,0,1,0,0,0
L2592:	fn_combi_t0 2, 0,0,0,0,0,0
L2596:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 138 ---
L2604:	fn_link  L2580
	fn_link  L2624
	fn_link  KnuthbendixN.$21$21
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t35 6, 0,4,1,5,2,3
L2624:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 139 ---
L2632:	fn_link  L2644
	fn_link  L2648
	fn_combi_t2 4, 3,0,1,0,0,0
L2644:	fn_combi_t0 2, 0,0,0,0,0,0
L2648:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 140 ---
L2656:	fn_link  L2604
	fn_link  L2632
	fn_link  L2676
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L2676:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 141 ---
L2680:	fn_link  L2656
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t16 5, 0,3,1,2,4,0
# --- block 142 ---
L2692:	fn_link  L2704
	fn_link  L2708
	fn_combi_t2 4, 3,0,1,0,0,0
L2704:	fn_combi_t0 2, 0,0,0,0,0,0
L2708:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 143 ---
L2716:	fn_link  L2692
	fn_link  L2732
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L2732:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 144 ---
L2736:	fn_link  L2680
	fn_link  L2716
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 145 ---
L2748:	fn_link  L2764
	fn_link  KnuthbendixN.$21$21
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t21 5, 0,3,1,4,2,0
L2764:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 146 ---
L2772:	fn_link  L2748
	fn_combi_t42 5, 0,1,4,2,3,4
# --- block 147 ---
L2780:	fn_link  L2736
	fn_link  L2772
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 148 ---
L2792:	fn_link  L2804
	fn_link  L2808
	fn_combi_t2 4, 3,0,1,0,0,0
L2804:	fn_combi_t0 2, 0,0,0,0,0,0
L2808:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 149 ---
L2816:	fn_link  L2792
	fn_link  L2832
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L2832:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 150 ---
L2836:	fn_link  L2848
	fn_link  L2852
	fn_combi_t2 4, 3,0,1,0,0,0
L2848:	fn_combi_t0 2, 0,0,0,0,0,0
L2852:	fn_box
	.word 0x00000029	# raw word 41
	fn_box_body
# --- block 151 ---
L2860:	fn_link  L2872
	fn_link  L2876
	fn_combi_t2 4, 3,0,1,0,0,0
L2872:	fn_combi_t0 2, 0,0,0,0,0,0
L2876:	fn_box
	.word 0x0000002c	# raw word 44
	fn_box_body
# --- block 152 ---
L2884:	fn_link  NanoPrelude.map
	fn_link  L2860
	fn_link  L2904
	fn_link  KnuthbendixN.intersperse
	fn_combi_t44 6, 0,1,2,3,4,5
L2904:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 153 ---
L2908:	fn_link  KnuthbendixN.concatStrings
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t41 6, 0,1,2,5,3,4
# --- block 154 ---
L2920:	fn_link  L2836
	fn_link  L2940
	fn_link  L2884
	fn_link  L2908
	fn_combi_t10 5, 0,1,4,2,3,0
L2940:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 155 ---
L2944:	fn_link  L2956
	fn_link  L2960
	fn_combi_t2 4, 3,0,1,0,0,0
L2956:	fn_combi_t0 2, 0,0,0,0,0,0
L2960:	fn_box
	.word 0x00000028	# raw word 40
	fn_box_body
# --- block 156 ---
L2968:	fn_link  L2920
	fn_link  L2944
	fn_link  L2988
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L2988:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 157 ---
L2992:	fn_link  Data.List_Type.$2b$2b
	fn_link  NanoPrelude.null
	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 158 ---
L3004:	fn_link  KnuthbendixN.isInfix
	fn_combi_t42 5, 0,1,3,2,4,3
# --- block 159 ---
L3012:	fn_link  L2968
	fn_link  L2992
	fn_link  L3004
	fn_link  L3032
	fn_combi_t10 5, 0,1,4,2,3,0
L3032:	fn_combi_t33 5, 0,1,2,3,4,4
# --- block 160 ---
L3036:	fn_link  L3044
	fn_combi_t45 5, 0,1,4,2,3,4
L3044:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 161 ---
L3048:	fn_link  L2780
	fn_link  L2816
	fn_link  L3012
	fn_link  L3036
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 162 ---
L3068:	fn_link  L3080
	fn_link  L3048
	fn_combi_t12 5, 4,0,2,3,1,0
L3080:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 163 ---
KnuthbendixN.isInfix:	fn_link  L3112
	fn_link  NanoPrelude.snd
	fn_link  L3104
	fn_link  L3108
	fn_combi_t42 6, 0,1,2,3,4,5
L3104:	fn_combi_t0 2, 0,0,0,0,0,0
L3108:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 164 ---
L3112:	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.lookUpBy
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 165 ---
NanoPrelude.snd:	fn_link  L3132
	fn_combi_t1 2, 1,0,0,0,0,0
L3132:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 166 ---
NanoPrelude.null:	fn_link  L3152
	fn_link  L3148
	fn_combi_t2 3, 2,0,1,0,0,0
L3148:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 167 ---
L3152:	fn_link  L3160
	fn_combi_t0 3, 0,0,0,0,0,0
L3160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 168 ---
KnuthbendixN.concatStrings:	fn_link  L3176
	fn_link  Data.List_Type.$2b$2b
	fn_elink NanoPrelude.foldr
L3176:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 169 ---
KnuthbendixN.intersperse:	fn_link  L3252
	fn_link  L3192
	fn_combi_t3 3, 0,1,2,0,0,0
L3192:	fn_y
# --- block 170 ---
L3196:	fn_link  L3204
	fn_combi_t49 5, 0,1,2,0,3,4
L3204:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 171 ---
L3208:	fn_link  L3216
	fn_combi_t46 6, 0,3,1,2,4,5
L3216:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 172 ---
L3220:	fn_link  L3196
	fn_link  L3208
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 173 ---
L3232:	fn_link  L3240
	fn_combi_t2 4, 3,1,0,0,0,0
L3240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 174 ---
L3244:	fn_link  L3232
	fn_combi_t44 5, 4,0,3,1,2,3
# --- block 175 ---
L3252:	fn_link  L3220
	fn_link  L3244
	fn_link  L3268
	fn_combi_t47 6, 5,0,1,2,3,4
L3268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 176 ---
KnuthbendixN.$21$21:	fn_link  L3292
	fn_link  L3336
	fn_link  L3288
	fn_combi_t47 5, 3,0,1,2,4,4
L3288:	fn_elink _error0
# --- block 177 ---
L3292:	fn_link  L3308
	fn_link  L3332
	fn_link  KnuthbendixN.$21$21
	fn_combi_t17 5, 0,4,1,3,2,0
L3308:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L3332:	fn_y
# --- block 178 ---
L3336:	fn_link  L3348
	fn_link  L3352
	fn_combi_t29 6, 3,0,1,2,5,4
L3348:	fn_elink _prim_eq
L3352:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 179 ---
KnuthbendixN.showResult:	fn_link  L3580
	fn_link  L3768
	fn_link  L3376
	fn_combi_t15 5, 3,0,1,2,4,0
L3376:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 180 ---
L3380:	fn_link  KnuthbendixN.rn
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.showRules
	fn_combi_t16 5, 0,3,1,2,4,0
# --- block 181 ---
L3396:	fn_link  L3408
	fn_link  L3412
	fn_combi_t2 4, 3,0,1,0,0,0
L3408:	fn_combi_t0 2, 0,0,0,0,0,0
L3412:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 182 ---
L3420:	fn_link  L3396
	fn_link  L3432
	fn_combi_t2 4, 3,0,1,0,0,0
L3432:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 183 ---
L3440:	fn_link  L3420
	fn_link  L3452
	fn_combi_t2 4, 3,0,1,0,0,0
L3452:	fn_box
	.word 0x00000073	# raw word 115
	fn_box_body
# --- block 184 ---
L3460:	fn_link  L3440
	fn_link  L3472
	fn_combi_t2 4, 3,0,1,0,0,0
L3472:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 185 ---
L3480:	fn_link  L3460
	fn_link  L3492
	fn_combi_t2 4, 3,0,1,0,0,0
L3492:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 186 ---
L3500:	fn_link  L3480
	fn_link  L3512
	fn_combi_t2 4, 3,0,1,0,0,0
L3512:	fn_box
	.word 0x00000063	# raw word 99
	fn_box_body
# --- block 187 ---
L3520:	fn_link  L3500
	fn_link  L3532
	fn_combi_t2 4, 3,0,1,0,0,0
L3532:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 188 ---
L3540:	fn_link  L3520
	fn_link  L3552
	fn_combi_t2 4, 3,0,1,0,0,0
L3552:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 189 ---
L3560:	fn_link  L3540
	fn_link  L3572
	fn_combi_t2 4, 3,0,1,0,0,0
L3572:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 190 ---
L3580:	fn_link  L3380
	fn_link  L3560
	fn_link  L3600
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L3600:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 191 ---
L3604:	fn_link  L3616
	fn_link  L3620
	fn_combi_t2 4, 3,0,1,0,0,0
L3616:	fn_combi_t0 2, 0,0,0,0,0,0
L3620:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 192 ---
L3628:	fn_link  L3604
	fn_link  L3640
	fn_combi_t2 4, 3,0,1,0,0,0
L3640:	fn_box
	.word 0x00000065	# raw word 101
	fn_box_body
# --- block 193 ---
L3648:	fn_link  L3628
	fn_link  L3660
	fn_combi_t2 4, 3,0,1,0,0,0
L3660:	fn_box
	.word 0x00000072	# raw word 114
	fn_box_body
# --- block 194 ---
L3668:	fn_link  L3648
	fn_link  L3680
	fn_combi_t2 4, 3,0,1,0,0,0
L3680:	fn_box
	.word 0x00000075	# raw word 117
	fn_box_body
# --- block 195 ---
L3688:	fn_link  L3668
	fn_link  L3700
	fn_combi_t2 4, 3,0,1,0,0,0
L3700:	fn_box
	.word 0x0000006c	# raw word 108
	fn_box_body
# --- block 196 ---
L3708:	fn_link  L3688
	fn_link  L3720
	fn_combi_t2 4, 3,0,1,0,0,0
L3720:	fn_box
	.word 0x00000069	# raw word 105
	fn_box_body
# --- block 197 ---
L3728:	fn_link  L3708
	fn_link  L3740
	fn_combi_t2 4, 3,0,1,0,0,0
L3740:	fn_box
	.word 0x00000061	# raw word 97
	fn_box_body
# --- block 198 ---
L3748:	fn_link  L3728
	fn_link  L3760
	fn_combi_t2 4, 3,0,1,0,0,0
L3760:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 199 ---
L3768:	fn_link  L3748
	fn_link  L3780
	fn_combi_t2 4, 3,0,1,0,0,0
L3780:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 200 ---
KnuthbendixN.showRules:	fn_link  KnuthbendixN.showRule
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.unlines
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 201 ---
KnuthbendixN.showRule:	fn_link  L3900
	fn_link  L3924
	fn_combi_t19 4, 3,0,1,2,2,0
# --- block 202 ---
L3816:	fn_link  L3828
	fn_link  L3832
	fn_combi_t2 4, 3,0,1,0,0,0
L3828:	fn_combi_t0 2, 0,0,0,0,0,0
L3832:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 203 ---
L3840:	fn_link  L3816
	fn_link  L3852
	fn_combi_t2 4, 3,0,1,0,0,0
L3852:	fn_box
	.word 0x0000003e	# raw word 62
	fn_box_body
# --- block 204 ---
L3860:	fn_link  L3840
	fn_link  L3872
	fn_combi_t2 4, 3,0,1,0,0,0
L3872:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 205 ---
L3880:	fn_link  L3860
	fn_link  L3892
	fn_combi_t2 4, 3,0,1,0,0,0
L3892:	fn_box
	.word 0x00000020	# raw word 32
	fn_box_body
# --- block 206 ---
L3900:	fn_link  KnuthbendixN.showTerm
	fn_link  L3880
	fn_link  L3920
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t44 6, 0,1,2,3,4,5
L3920:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 207 ---
L3924:	fn_link  KnuthbendixN.showTerm
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 208 ---
KnuthbendixN.rn:	fn_link  L3988
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 209 ---
L3944:	fn_link  KnuthbendixN.variables
	fn_link  L3968
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.vars
	fn_link  NanoPrelude.zip
	fn_combi_t44 6, 0,1,5,2,3,4
L3968:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 210 ---
L3972:	fn_link  KnuthbendixN.subst
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 211 ---
L3980:	fn_link  KnuthbendixN.subst
	fn_combi_t40 5, 4,0,3,1,2,3
# --- block 212 ---
L3988:	fn_link  L3944
	fn_link  L3972
	fn_link  L3980
	fn_combi_t39 5, 0,3,1,4,2,3
# --- block 213 ---
KnuthbendixN.subst:	fn_link  L4088
	fn_link  L4016
	fn_combi_t3 3, 0,1,2,0,0,0
L4016:	fn_y
# --- block 214 ---
L4020:	fn_link  L4032
	fn_link  KnuthbendixN.subst
	fn_combi_t6 4, 0,3,1,2,0,0
L4032:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 215 ---
L4036:	fn_link  L4020
	fn_link  KnuthbendixN.equalStrings
	fn_combi_t42 5, 0,2,4,1,2,3
# --- block 216 ---
L4048:	fn_link  L4036
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 217 ---
L4056:	fn_link  L4048
	fn_link  L4068
	fn_combi_t15 4, 2,0,3,1,3,0
L4068:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 218 ---
L4072:	fn_link  NanoPrelude.map
	fn_link  L4084
	fn_combi_t16 5, 0,3,1,2,4,0
L4084:	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 219 ---
L4088:	fn_link  L4056
	fn_link  L4072
	fn_combi_t15 5, 4,0,3,1,2,0
# --- block 220 ---
NanoPrelude.zip:	fn_link  L4148
	fn_link  L4112
	fn_combi_t6 4, 2,0,1,3,0,0
L4112:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 221 ---
L4116:	fn_link  L4124
	fn_combi_t44 6, 0,1,4,2,3,5
L4124:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 222 ---
L4128:	fn_link  NanoPrelude.zip
	fn_link  L4144
	fn_link  L4116
	fn_combi_t5 4, 0,1,3,2,0,0
L4144:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 223 ---
L4148:	fn_link  L4128
	fn_link  L4160
	fn_combi_t16 5, 2,0,1,3,4,0
L4160:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 224 ---
KnuthbendixN.vars:	fn_link  L4176
	fn_link  L4196
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 225 ---
L4176:	fn_link  L4184
	fn_combi_t2 4, 3,1,0,0,0,0
L4184:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 226 ---
L4188:	fn_link  KnuthbendixN.vars
	fn_elink NanoPrelude.map
# --- block 227 ---
L4196:	fn_link  L4188
	fn_link  L4220
	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.unionBy
	fn_link  NanoPrelude.foldr
	fn_combi_t38 7, 0,1,2,3,4,6
L4220:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 228 ---
KnuthbendixN.unionBy:	fn_link  KnuthbendixN.insBy
	fn_link  NanoPrelude.foldr
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 229 ---
KnuthbendixN.insBy:	fn_link  L4252
	fn_link  L4260
	fn_link  L4256
	fn_combi_t5 4, 0,1,3,2,0,0
L4252:	fn_combi_t2 4, 3,0,1,0,0,0
L4256:	fn_combi_t24 4, 0,1,2,2,3,3
# --- block 230 ---
L4260:	fn_link  KnuthbendixN.elemBy
	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 231 ---
KnuthbendixN.elemBy:	fn_link  L4296
	fn_link  L4280
	fn_combi_t7 4, 0,1,2,3,0,0
L4280:	fn_y
# --- block 232 ---
L4284:	fn_link  L4292
	fn_combi_t28 6, 1,2,4,3,5,0
L4292:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 233 ---
L4296:	fn_link  L4284
	fn_link  L4308
	fn_combi_t46 6, 5,0,1,2,3,4
L4308:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 234 ---
KnuthbendixN.variables:	fn_link  KnuthbendixN.variety
	fn_elink NanoPrelude.tail
# --- block 235 ---
NanoPrelude.tail:	fn_link  L4332
	fn_link  L4336
	fn_combi_t2 3, 2,0,1,0,0,0
L4332:	fn_combi_t0 2, 1,0,0,0,0,0
L4336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 236 ---
KnuthbendixN.variety:	fn_link  L4356
	fn_link  L4352
	fn_combi_t2 4, 3,0,1,0,0,0
L4352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 237 ---
L4356:	fn_link  KnuthbendixN.variety
	fn_link  KnuthbendixN.variations
	fn_elink KnuthbendixN.concatMap
# --- block 238 ---
KnuthbendixN.variations:	fn_link  L4908
	fn_link  L4392
	fn_link  L4396
	fn_link  L4400
	fn_link  NanoPrelude.map
	fn_combi_t40 6, 0,1,2,5,3,4
L4392:	fn_combi_t0 1, 0,0,0,0,0,0
L4396:	fn_combi_t2 4, 3,0,1,0,0,0
L4400:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 239 ---
L4404:	fn_link  L4416
	fn_link  L4420
	fn_combi_t2 4, 3,0,1,0,0,0
L4416:	fn_combi_t0 2, 0,0,0,0,0,0
L4420:	fn_box
	.word 0x0000005a	# raw word 90
	fn_box_body
# --- block 240 ---
L4428:	fn_link  L4404
	fn_link  L4440
	fn_combi_t2 4, 3,0,1,0,0,0
L4440:	fn_box
	.word 0x00000059	# raw word 89
	fn_box_body
# --- block 241 ---
L4448:	fn_link  L4428
	fn_link  L4460
	fn_combi_t2 4, 3,0,1,0,0,0
L4460:	fn_box
	.word 0x00000058	# raw word 88
	fn_box_body
# --- block 242 ---
L4468:	fn_link  L4448
	fn_link  L4480
	fn_combi_t2 4, 3,0,1,0,0,0
L4480:	fn_box
	.word 0x00000057	# raw word 87
	fn_box_body
# --- block 243 ---
L4488:	fn_link  L4468
	fn_link  L4500
	fn_combi_t2 4, 3,0,1,0,0,0
L4500:	fn_box
	.word 0x00000056	# raw word 86
	fn_box_body
# --- block 244 ---
L4508:	fn_link  L4488
	fn_link  L4520
	fn_combi_t2 4, 3,0,1,0,0,0
L4520:	fn_box
	.word 0x00000055	# raw word 85
	fn_box_body
# --- block 245 ---
L4528:	fn_link  L4508
	fn_link  L4540
	fn_combi_t2 4, 3,0,1,0,0,0
L4540:	fn_box
	.word 0x00000054	# raw word 84
	fn_box_body
# --- block 246 ---
L4548:	fn_link  L4528
	fn_link  L4560
	fn_combi_t2 4, 3,0,1,0,0,0
L4560:	fn_box
	.word 0x00000053	# raw word 83
	fn_box_body
# --- block 247 ---
L4568:	fn_link  L4548
	fn_link  L4580
	fn_combi_t2 4, 3,0,1,0,0,0
L4580:	fn_box
	.word 0x00000052	# raw word 82
	fn_box_body
# --- block 248 ---
L4588:	fn_link  L4568
	fn_link  L4600
	fn_combi_t2 4, 3,0,1,0,0,0
L4600:	fn_box
	.word 0x00000051	# raw word 81
	fn_box_body
# --- block 249 ---
L4608:	fn_link  L4588
	fn_link  L4620
	fn_combi_t2 4, 3,0,1,0,0,0
L4620:	fn_box
	.word 0x00000050	# raw word 80
	fn_box_body
# --- block 250 ---
L4628:	fn_link  L4608
	fn_link  L4640
	fn_combi_t2 4, 3,0,1,0,0,0
L4640:	fn_box
	.word 0x0000004f	# raw word 79
	fn_box_body
# --- block 251 ---
L4648:	fn_link  L4628
	fn_link  L4660
	fn_combi_t2 4, 3,0,1,0,0,0
L4660:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 252 ---
L4668:	fn_link  L4648
	fn_link  L4680
	fn_combi_t2 4, 3,0,1,0,0,0
L4680:	fn_box
	.word 0x0000004d	# raw word 77
	fn_box_body
# --- block 253 ---
L4688:	fn_link  L4668
	fn_link  L4700
	fn_combi_t2 4, 3,0,1,0,0,0
L4700:	fn_box
	.word 0x0000004c	# raw word 76
	fn_box_body
# --- block 254 ---
L4708:	fn_link  L4688
	fn_link  L4720
	fn_combi_t2 4, 3,0,1,0,0,0
L4720:	fn_box
	.word 0x0000004b	# raw word 75
	fn_box_body
# --- block 255 ---
L4728:	fn_link  L4708
	fn_link  L4740
	fn_combi_t2 4, 3,0,1,0,0,0
L4740:	fn_box
	.word 0x0000004a	# raw word 74
	fn_box_body
# --- block 256 ---
L4748:	fn_link  L4728
	fn_link  L4760
	fn_combi_t2 4, 3,0,1,0,0,0
L4760:	fn_box
	.word 0x00000049	# raw word 73
	fn_box_body
# --- block 257 ---
L4768:	fn_link  L4748
	fn_link  L4780
	fn_combi_t2 4, 3,0,1,0,0,0
L4780:	fn_box
	.word 0x00000048	# raw word 72
	fn_box_body
# --- block 258 ---
L4788:	fn_link  L4768
	fn_link  L4800
	fn_combi_t2 4, 3,0,1,0,0,0
L4800:	fn_box
	.word 0x00000047	# raw word 71
	fn_box_body
# --- block 259 ---
L4808:	fn_link  L4788
	fn_link  L4820
	fn_combi_t2 4, 3,0,1,0,0,0
L4820:	fn_box
	.word 0x00000046	# raw word 70
	fn_box_body
# --- block 260 ---
L4828:	fn_link  L4808
	fn_link  L4840
	fn_combi_t2 4, 3,0,1,0,0,0
L4840:	fn_box
	.word 0x00000045	# raw word 69
	fn_box_body
# --- block 261 ---
L4848:	fn_link  L4828
	fn_link  L4860
	fn_combi_t2 4, 3,0,1,0,0,0
L4860:	fn_box
	.word 0x00000044	# raw word 68
	fn_box_body
# --- block 262 ---
L4868:	fn_link  L4848
	fn_link  L4880
	fn_combi_t2 4, 3,0,1,0,0,0
L4880:	fn_box
	.word 0x00000043	# raw word 67
	fn_box_body
# --- block 263 ---
L4888:	fn_link  L4868
	fn_link  L4900
	fn_combi_t2 4, 3,0,1,0,0,0
L4900:	fn_box
	.word 0x00000042	# raw word 66
	fn_box_body
# --- block 264 ---
L4908:	fn_link  L4888
	fn_link  L4920
	fn_combi_t2 4, 3,0,1,0,0,0
L4920:	fn_box
	.word 0x00000041	# raw word 65
	fn_box_body
# --- block 265 ---
KnuthbendixN.complete:	fn_link  L4948
	fn_link  L4952
	fn_link  KnuthbendixN.variables
	fn_link  KnuthbendixN.completionLoop
	fn_combi_t23 6, 0,4,1,2,5,3
L4948:	fn_combi_t0 2, 0,0,0,0,0,0
L4952:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 266 ---
KnuthbendixN.completionLoop:	fn_link  L4980
	fn_link  L5040
	fn_link  L5084
	fn_link  L5092
	fn_combi_t52 6, 0,1,2,4,3,5
L4980:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 267 ---
L4984:	fn_link  NanoPrelude.succ
	fn_link  KnuthbendixN.completionWith
	fn_combi_t28 6, 0,2,5,1,3,4
# --- block 268 ---
L4996:	fn_link  L5008
	fn_link  KnuthbendixN.orient
	fn_combi_t42 6, 0,4,1,2,3,5
L5008:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 269 ---
L5012:	fn_link  L4984
	fn_link  L5028
	fn_link  L4996
	fn_combi_t52 6, 0,1,2,3,4,5
L5028:	fn_combi_t23 6, 0,1,3,4,5,2
# --- block 270 ---
L5032:	fn_link  KnuthbendixN.renameNew
	fn_combi_t42 6, 0,1,4,2,3,5
# --- block 271 ---
L5040:	fn_link  L5012
	fn_link  L5032
	fn_combi_t16 5, 0,3,1,2,4,0
# --- block 272 ---
L5052:	fn_link  L5064
	fn_link  L5068
	fn_combi_t29 6, 0,2,1,3,5,4
L5064:	fn_elink _prim_eq
L5068:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
# --- block 273 ---
L5076:	fn_link  L5052
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 274 ---
L5084:	fn_link  L5076
	fn_combi_t30 5, 0,4,1,3,4,2
# --- block 275 ---
L5092:	fn_link  L5100
	fn_combi_t44 5, 3,0,4,1,2,4
L5100:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 276 ---
KnuthbendixN.renameNew:	fn_link  L5196
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 277 ---
L5112:	fn_link  KnuthbendixN.subst
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 278 ---
L5120:	fn_link  KnuthbendixN.subst
	fn_combi_t40 5, 4,0,3,1,2,3
# --- block 279 ---
L5128:	fn_link  L5112
	fn_link  L5120
	fn_link  L5144
	fn_combi_t5 4, 0,1,3,2,0,0
L5144:	fn_combi_t33 6, 5,0,1,2,3,4
# --- block 280 ---
L5148:	fn_link  L5160
	fn_link  L5164
	fn_elink KnuthbendixN.cross
L5160:	fn_combi_t1 3, 2,0,0,0,0,0
L5164:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 281 ---
L5168:	fn_link  L5148
	fn_elink NanoPrelude.curry
# --- block 282 ---
L5176:	fn_link  L5168
	fn_elink KnuthbendixN.zipWithRemRight
# --- block 283 ---
L5184:	fn_link  KnuthbendixN.vars
	fn_link  L5176
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 284 ---
L5196:	fn_link  L5128
	fn_link  L5184
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 285 ---
KnuthbendixN.zipWithRemRight:	fn_link  L5332
	fn_link  L5220
	fn_combi_t3 3, 0,1,2,0,0,0
L5220:	fn_y
# --- block 286 ---
L5224:	fn_link  L5232
	fn_combi_t54 6, 5,0,1,2,3,4
L5232:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 287 ---
L5236:	fn_link  L5224
	fn_link  L5248
	fn_combi_t3 3, 0,1,2,0,0,0
L5248:	fn_combi_t23 6, 0,1,2,3,5,4
# --- block 288 ---
L5252:	fn_link  L5236
	fn_link  L5264
	fn_combi_t3 3, 0,1,2,0,0,0
L5264:	fn_combi_t42 6, 1,3,5,0,2,4
# --- block 289 ---
L5268:	fn_link  L5276
	fn_combi_t2 2, 1,0,0,0,0,0
L5276:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 290 ---
L5280:	fn_link  L5268
	fn_combi_t46 6, 3,0,1,2,4,5
# --- block 291 ---
L5288:	fn_link  L5300
	fn_link  L5304
	fn_combi_t16 5, 4,0,1,2,3,0
L5300:	fn_combi_t2 4, 3,0,1,0,0,0
L5304:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 292 ---
L5308:	fn_link  L5316
	fn_combi_t2 2, 1,0,0,0,0,0
L5316:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 293 ---
L5320:	fn_link  L5288
	fn_link  L5308
	fn_combi_t40 5, 3,4,0,1,2,4
# --- block 294 ---
L5332:	fn_link  L5252
	fn_link  L5280
	fn_link  L5320
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 295 ---
NanoPrelude.curry:	fn_link  L5356
	fn_combi_t7 4, 1,0,2,3,0,0
L5356:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 296 ---
KnuthbendixN.cross:	fn_link  L5368
	fn_combi_t7 4, 3,0,1,2,0,0
L5368:	fn_combi_t15 5, 4,0,2,1,3,0
# --- block 297 ---
KnuthbendixN.orient:	fn_link  L5456
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 298 ---
L5380:	fn_link  L5392
	fn_link  L5396
	fn_combi_t7 4, 0,1,2,3,0,0
L5392:	fn_combi_t2 3, 2,1,0,0,0,0
L5396:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 299 ---
L5400:	fn_link  L5412
	fn_link  KnuthbendixN.order
	fn_combi_t37 5, 0,4,3,1,2,4
L5412:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 300 ---
L5416:	fn_link  L5380
	fn_link  L5400
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 301 ---
L5428:	fn_link  L5416
	fn_link  KnuthbendixN.order
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 302 ---
L5440:	fn_link  L5452
	fn_link  L5428
	fn_combi_t43 5, 0,2,4,1,3,4
L5452:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 303 ---
L5456:	fn_link  L5468
	fn_link  L5440
	fn_combi_t6 3, 0,2,1,2,0,0
L5468:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 304 ---
KnuthbendixN.order:	fn_link  KnuthbendixN.weights
	fn_elink KnuthbendixN.kbGreaterThan
# --- block 305 ---
KnuthbendixN.kbGreaterThan:	fn_link  KnuthbendixN.termWeight
	fn_link  L5808
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 306 ---
L5492:	fn_link  KnuthbendixN.vars
	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.unionBy
	fn_combi_t39 5, 0,1,2,3,2,4
# --- block 307 ---
L5508:	fn_link  KnuthbendixN.varCounts
	fn_link  NanoPrelude.snd
	fn_link  NanoPrelude.map
	fn_combi_t16 5, 0,1,2,3,4,0
# --- block 308 ---
L5524:	fn_link  KnuthbendixN.funSequence
	fn_link  KnuthbendixN.last
	fn_link  KnuthbendixN.powerOf
	fn_combi_t8 4, 0,1,2,3,0,0
# --- block 309 ---
L5540:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 310 ---
L5548:	fn_link  L5524
	fn_link  L5540
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 311 ---
L5560:	fn_link  L5580
	fn_link  L5584
	fn_link  L5588
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L5580:	fn_combi_t0 2, 1,0,0,0,0,0
L5584:	fn_combi_t0 2, 0,0,0,0,0,0
L5588:	fn_elink _prim_eq
# --- block 312 ---
L5592:	fn_link  NanoPrelude.$26$26
	fn_combi_t60 6, 0,1,2,3,4,5
# --- block 313 ---
L5600:	fn_link  KnuthbendixN.eq
	fn_link  KnuthbendixN.compareAll
	fn_link  L5560
	fn_link  L5592
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 314 ---
L5620:	fn_link  L5640
	fn_link  L5644
	fn_link  L5648
	fn_link  NanoPrelude.not
	fn_combi_t52 6, 0,5,4,1,2,3
L5640:	fn_combi_t0 2, 1,0,0,0,0,0
L5644:	fn_combi_t0 2, 0,0,0,0,0,0
L5648:	fn_elink _prim_le
# --- block 315 ---
L5652:	fn_link  NanoPrelude.$26$26
	fn_combi_t46 6, 0,1,2,3,5,4
# --- block 316 ---
L5660:	fn_link  KnuthbendixN.leq
	fn_link  KnuthbendixN.compareAll
	fn_link  L5620
	fn_link  L5652
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 317 ---
L5680:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t44 5, 0,1,4,2,4,3
# --- block 318 ---
L5688:	fn_link  L5680
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 319 ---
L5696:	fn_link  L5688
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 320 ---
L5704:	fn_link  L5600
	fn_link  L5660
	fn_link  L5696
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 321 ---
L5720:	fn_link  L5704
	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 322 ---
L5728:	fn_link  KnuthbendixN.funcAfter
	fn_link  L5548
	fn_link  L5720
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 323 ---
L5744:	fn_link  L5752
	fn_combi_t24 6, 0,1,5,2,3,4
L5752:	fn_combi_t39 5, 0,4,2,3,1,3
# --- block 324 ---
L5756:	fn_link  L5744
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 325 ---
L5764:	fn_link  L5756
	fn_combi_t38 4, 0,1,3,2,2,3
# --- block 326 ---
L5772:	fn_link  L5508
	fn_link  L5728
	fn_link  L5764
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 327 ---
L5788:	fn_link  L5492
	fn_link  L5772
	fn_link  L5804
	fn_combi_t5 4, 0,1,3,2,0,0
L5804:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 328 ---
L5808:	fn_link  KnuthbendixN.termWeight
	fn_link  L5788
	fn_link  L5824
	fn_combi_t26 5, 0,1,3,4,2,3
L5824:	fn_combi_t42 5, 0,4,3,1,2,4
# --- block 329 ---
NanoPrelude.$7c$7c:	fn_link  L5836
	fn_combi_t2 3, 1,2,0,0,0,0
L5836:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 330 ---
NanoPrelude.not:	fn_link  L5852
	fn_link  L5856
	fn_combi_t2 3, 2,0,1,0,0,0
L5852:	fn_combi_t0 2, 0,0,0,0,0,0
L5856:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 331 ---
KnuthbendixN.compareAll:	fn_link  KnuthbendixN.zipWith
	fn_link  NanoPrelude.and
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 332 ---
NanoPrelude.and:	fn_link  L5888
	fn_link  L5884
	fn_combi_t2 3, 2,0,1,0,0,0
L5884:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 333 ---
L5888:	fn_link  NanoPrelude.and
	fn_link  L5900
	fn_combi_t6 4, 2,0,1,3,0,0
L5900:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 334 ---
KnuthbendixN.zipWith:	fn_link  L5956
	fn_link  L5916
	fn_combi_t3 3, 0,1,2,0,0,0
L5916:	fn_y
# --- block 335 ---
L5920:	fn_link  L5928
	fn_combi_t40 6, 0,1,2,4,3,5
L5928:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 336 ---
L5932:	fn_link  L5940
	fn_combi_t48 6, 3,0,1,4,2,5
L5940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 337 ---
L5944:	fn_link  L5920
	fn_link  L5932
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 338 ---
L5956:	fn_link  L5944
	fn_link  L5968
	fn_combi_t46 6, 4,0,1,2,3,5
L5968:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 339 ---
KnuthbendixN.leq:	fn_link  L5988
	fn_link  L5992
	fn_link  L5996
	fn_combi_t10 5, 4,3,0,1,2,0
L5988:	fn_combi_t0 2, 1,0,0,0,0,0
L5992:	fn_combi_t0 2, 0,0,0,0,0,0
L5996:	fn_elink _prim_le
# --- block 340 ---
KnuthbendixN.eq:	fn_link  L6016
	fn_link  L6020
	fn_link  L6024
	fn_combi_t10 5, 4,3,0,1,2,0
L6016:	fn_combi_t0 2, 1,0,0,0,0,0
L6020:	fn_combi_t0 2, 0,0,0,0,0,0
L6024:	fn_elink _prim_eq
# --- block 341 ---
KnuthbendixN.powerOf:	fn_link  L6040
	fn_link  L6108
	fn_combi_t12 5, 3,0,2,4,1,0
# --- block 342 ---
L6040:	fn_link  L6048
	fn_combi_t0 2, 0,0,0,0,0,0
L6048:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 343 ---
L6052:	fn_link  KnuthbendixN.pow
	fn_link  NanoPrelude.null
	fn_link  NanoPrelude.$26$26
	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 344 ---
L6068:	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.isVar
	fn_link  NanoPrelude.$26$26
	fn_combi_t44 6, 0,1,4,2,5,3
# --- block 345 ---
L6084:	fn_link  NanoPrelude.$26$26
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 346 ---
L6092:	fn_link  L6052
	fn_link  L6068
	fn_link  L6084
	fn_combi_t40 5, 0,1,3,4,2,3
# --- block 347 ---
L6108:	fn_link  L6092
	fn_link  L6120
	fn_combi_t46 6, 5,0,1,2,3,4
L6120:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 348 ---
KnuthbendixN.isVar:	fn_link  L6136
	fn_link  L6148
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 349 ---
L6136:	fn_link  L6144
	fn_combi_t0 2, 0,0,0,0,0,0
L6144:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 350 ---
L6148:	fn_link  L6156
	fn_combi_t0 3, 0,0,0,0,0,0
L6156:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 351 ---
KnuthbendixN.pow:	fn_link  L6240
	fn_link  L6172
	fn_combi_t3 3, 0,1,2,0,0,0
L6172:	fn_y
# --- block 352 ---
L6176:	fn_link  L6184
	fn_combi_t0 2, 0,0,0,0,0,0
L6184:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 353 ---
L6188:	fn_link  NanoPrelude.null
	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 354 ---
L6200:	fn_link  KnuthbendixN.equalStrings
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,3,2,4,5
# --- block 355 ---
L6212:	fn_link  L6188
	fn_link  L6200
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 356 ---
L6224:	fn_link  L6212
	fn_link  L6236
	fn_combi_t46 6, 5,0,1,2,3,4
L6236:	fn_elink _error0
# --- block 357 ---
L6240:	fn_link  L6176
	fn_link  L6224
	fn_combi_t12 5, 4,0,2,3,1,0
# --- block 358 ---
KnuthbendixN.last:	fn_link  L6276
	fn_link  L6264
	fn_combi_t2 3, 2,0,1,0,0,0
L6264:	fn_elink _error0
# --- block 359 ---
L6268:	fn_link  KnuthbendixN.last
	fn_combi_t1 4, 0,1,0,0,0,0
# --- block 360 ---
L6276:	fn_link  L6268
	fn_combi_t6 3, 2,1,0,2,0,0
# --- block 361 ---
KnuthbendixN.funSequence:	fn_link  L6292
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 362 ---
L6292:	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.map
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 363 ---
KnuthbendixN.funcAfter:	fn_link  L6340
	fn_link  L6420
	fn_combi_t40 5, 3,0,2,4,1,4
# --- block 364 ---
L6316:	fn_link  L6324
	fn_combi_t0 2, 0,0,0,0,0,0
L6324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 365 ---
L6328:	fn_link  L6336
	fn_combi_t0 3, 0,0,0,0,0,0
L6336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 366 ---
L6340:	fn_link  L6316
	fn_link  L6328
	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 367 ---
L6352:	fn_link  L6360
	fn_combi_t0 2, 0,0,0,0,0,0
L6360:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 368 ---
L6364:	fn_link  KnuthbendixN.funSequence
	fn_link  KnuthbendixN.before
	fn_combi_t10 5, 0,1,2,4,3,0
# --- block 369 ---
L6376:	fn_link  KnuthbendixN.equalStrings
	fn_combi_t37 6, 0,1,4,2,3,5
# --- block 370 ---
L6384:	fn_link  L6376
	fn_link  L6396
	fn_combi_t29 5, 0,1,4,2,4,3
L6396:	fn_combi_t29 5, 0,1,4,2,3,4
# --- block 371 ---
L6400:	fn_link  KnuthbendixN.kbGreaterThan
	fn_link  KnuthbendixN.orderLex
	fn_link  L6364
	fn_link  L6384
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 372 ---
L6420:	fn_link  L6352
	fn_link  L6400
	fn_combi_t32 6, 3,0,2,4,5,1
# --- block 373 ---
KnuthbendixN.before:	fn_link  L6504
	fn_link  L6444
	fn_combi_t16 5, 2,0,1,3,4,0
L6444:	fn_elink _error0
# --- block 374 ---
L6448:	fn_link  KnuthbendixN.equalStrings
	fn_link  NanoPrelude.not
	fn_link  NanoPrelude.$26$26
	fn_combi_t21 5, 0,1,2,4,3,0
# --- block 375 ---
L6464:	fn_link  KnuthbendixN.before
	fn_link  L6448
	fn_link  L6480
	fn_combi_t24 5, 0,1,4,2,3,4
L6480:	fn_combi_t46 6, 0,4,1,5,2,3
# --- block 376 ---
L6484:	fn_link  KnuthbendixN.equalStrings
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 377 ---
L6496:	fn_link  L6484
	fn_combi_t30 5, 0,1,2,3,4,4
# --- block 378 ---
L6504:	fn_link  L6464
	fn_link  L6496
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 379 ---
KnuthbendixN.orderLex:	fn_link  L6612
	fn_link  L6528
	fn_combi_t3 3, 0,1,2,0,0,0
L6528:	fn_y
# --- block 380 ---
L6532:	fn_link  KnuthbendixN.equalTerms
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 381 ---
L6540:	fn_link  L6552
	fn_link  L6532
	fn_combi_t6 4, 0,2,1,3,0,0
L6552:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 382 ---
L6556:	fn_link  L6540
	fn_link  L6568
	fn_combi_t3 3, 0,1,2,0,0,0
L6568:	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 383 ---
L6572:	fn_link  L6580
	fn_combi_t46 6, 3,0,1,2,4,5
L6580:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 384 ---
L6584:	fn_link  L6592
	fn_combi_t0 3, 0,0,0,0,0,0
L6592:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 385 ---
L6596:	fn_link  L6584
	fn_link  L6608
	fn_combi_t40 5, 3,4,0,1,2,4
L6608:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 386 ---
L6612:	fn_link  L6556
	fn_link  L6572
	fn_link  L6596
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 387 ---
KnuthbendixN.equalTerms:	fn_link  L6652
	fn_link  L6704
	fn_combi_t15 4, 2,0,3,1,3,0
# --- block 388 ---
L6640:	fn_link  L6648
	fn_combi_t0 3, 0,0,0,0,0,0
L6648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 389 ---
L6652:	fn_link  KnuthbendixN.equalStrings
	fn_link  L6640
	fn_combi_t6 4, 2,0,1,3,0,0
# --- block 390 ---
L6664:	fn_link  L6672
	fn_combi_t0 2, 0,0,0,0,0,0
L6672:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 391 ---
L6676:	fn_link  KnuthbendixN.equalTerms
	fn_link  KnuthbendixN.zipWith
	fn_link  NanoPrelude.and
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 392 ---
L6692:	fn_link  KnuthbendixN.equalStrings
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 393 ---
L6704:	fn_link  L6664
	fn_link  L6676
	fn_link  L6692
	fn_combi_t34 6, 3,0,4,1,5,2
# --- block 394 ---
KnuthbendixN.varCounts:	fn_link  L6732
	fn_link  L6748
	fn_combi_t6 4, 0,3,1,2,0,0
# --- block 395 ---
L6732:	fn_link  KnuthbendixN.positions
	fn_link  KnuthbendixN.varAt
	fn_link  KnuthbendixN.concatMap
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 396 ---
L6748:	fn_link  L6772
	fn_link  NanoPrelude.repeat
	fn_link  NanoPrelude.zip
	fn_link  KnuthbendixN.tally
	fn_link  NanoPrelude.foldr
	fn_combi_t48 6, 0,1,2,5,3,4
L6772:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 397 ---
KnuthbendixN.tally:	fn_link  L6904
	fn_link  L6792
	fn_combi_t3 3, 0,1,2,0,0,0
L6792:	fn_y
# --- block 398 ---
L6796:	fn_link  NanoPrelude.succ
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 399 ---
L6804:	fn_link  L6816
	fn_link  L6820
	fn_combi_t40 6, 0,1,4,5,2,3
L6816:	fn_combi_t2 3, 2,0,1,0,0,0
L6820:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 400 ---
L6824:	fn_link  KnuthbendixN.equalStrings
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 401 ---
L6832:	fn_link  L6804
	fn_link  L6824
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 402 ---
L6844:	fn_link  L6852
	fn_combi_t38 5, 0,1,4,2,3,4
L6852:	fn_combi_t47 5, 0,4,1,2,4,3
# --- block 403 ---
L6856:	fn_link  L6844
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 404 ---
L6864:	fn_link  L6796
	fn_link  L6884
	fn_link  L6832
	fn_link  L6856
	fn_combi_t10 5, 0,1,4,2,3,0
L6884:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 405 ---
L6888:	fn_link  L6864
	fn_combi_t23 5, 0,1,2,3,4,3
# --- block 406 ---
L6896:	fn_link  L6888
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 407 ---
L6904:	fn_link  L6896
	fn_link  L6916
	fn_combi_t16 5, 4,0,1,2,3,0
L6916:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 408 ---
NanoPrelude.succ:	fn_link  L6932
	fn_link  L6956
	fn_combi_t3 3, 0,2,1,0,0,0
L6932:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L6956:	fn_y
# --- block 409 ---
NanoPrelude.repeat:	fn_link  NanoPrelude.repeat
	fn_link  L6972
	fn_combi_t6 3, 0,2,1,2,0,0
L6972:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 410 ---
KnuthbendixN.varAt:	fn_link  L6992
	fn_link  L7004
	fn_link  KnuthbendixN.subterm
	fn_combi_t9 5, 0,3,4,1,2,0
# --- block 411 ---
L6992:	fn_link  L7000
	fn_combi_t2 4, 3,1,0,0,0,0
L7000:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 412 ---
L7004:	fn_link  L7012
	fn_combi_t0 3, 0,0,0,0,0,0
L7012:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 413 ---
KnuthbendixN.subterm:	fn_link  L7052
	fn_combi_t6 3, 2,1,0,1,0,0
# --- block 414 ---
L7024:	fn_link  L7032
	fn_combi_t0 2, 0,0,0,0,0,0
L7032:	fn_elink _error0
# --- block 415 ---
L7036:	fn_link  NanoPrelude.pred
	fn_link  KnuthbendixN.$21$21
	fn_link  KnuthbendixN.subterm
	fn_combi_t34 7, 0,1,6,2,3,4
# --- block 416 ---
L7052:	fn_link  L7024
	fn_link  L7036
	fn_combi_t12 5, 2,0,3,4,1,0
# --- block 417 ---
NanoPrelude.pred:	fn_link  L7076
	fn_link  L7100
	fn_combi_t3 3, 0,2,1,0,0,0
L7076:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7100:	fn_y
# --- block 418 ---
KnuthbendixN.positions:	fn_link  L7116
	fn_link  L7176
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 419 ---
L7116:	fn_link  L7128
	fn_link  L7132
	fn_combi_t2 5, 4,0,1,0,0,0
L7128:	fn_combi_t0 2, 0,0,0,0,0,0
L7132:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 420 ---
L7136:	fn_link  NanoPrelude.length
	fn_link  L7152
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t6 4, 0,1,2,3,0,0
L7152:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 421 ---
L7160:	fn_link  L7136
	fn_link  KnuthbendixN.argPositions
	fn_link  KnuthbendixN.concatMap
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 422 ---
L7176:	fn_link  L7160
	fn_link  L7192
	fn_link  L7196
	fn_combi_t6 5, 0,1,2,4,0,0
L7192:	fn_combi_t0 2, 0,0,0,0,0,0
L7196:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 423 ---
KnuthbendixN.argPositions:	fn_link  L7216
	fn_link  Data.List_Type.$3a
	fn_link  NanoPrelude.map
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 424 ---
L7216:	fn_link  NanoPrelude.pred
	fn_link  KnuthbendixN.$21$21
	fn_link  KnuthbendixN.positions
	fn_combi_t20 5, 0,1,3,2,4,0
# --- block 425 ---
Data.List_Type.$3a:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 426 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L7252
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 427 ---
L7252:	fn_link  L7268
	fn_link  L7272
	fn_link  L7276
	fn_combi_t10 5, 3,4,0,1,2,0
L7268:	fn_combi_t0 2, 1,0,0,0,0,0
L7272:	fn_combi_t0 2, 0,0,0,0,0,0
L7276:	fn_elink _prim_le
# --- block 428 ---
NanoPrelude.takeWhile:	fn_link  L7320
	fn_link  L7292
	fn_combi_t3 3, 0,1,2,0,0,0
L7292:	fn_y
# --- block 429 ---
L7296:	fn_link  L7304
	fn_combi_t6 4, 0,2,1,3,0,0
L7304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 430 ---
L7308:	fn_link  L7316
	fn_combi_t42 5, 1,3,0,2,3,4
L7316:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 431 ---
L7320:	fn_link  L7296
	fn_link  L7308
	fn_link  L7336
	fn_combi_t48 6, 5,0,1,3,2,4
L7336:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 432 ---
NanoPrelude.enumFrom:	fn_link  L7360
	fn_link  L7384
	fn_link  NanoPrelude.enumFrom
	fn_link  L7388
	fn_combi_t50 5, 0,4,1,2,4,3
L7360:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7384:	fn_y
L7388:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 433 ---
KnuthbendixN.termWeight:	fn_link  L7484
	fn_link  L7404
	fn_combi_t3 3, 0,1,2,0,0,0
L7404:	fn_y
# --- block 434 ---
L7408:	fn_link  KnuthbendixN.varWeight
	fn_combi_t1 3, 0,1,0,0,0,0
# --- block 435 ---
L7416:	fn_link  L7428
	fn_link  KnuthbendixN.funWeight
	fn_combi_t4 4, 0,2,3,1,0,0
L7428:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 436 ---
L7452:	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.sum
	fn_link  L7468
	fn_combi_t54 6, 0,1,2,3,5,4
L7468:	fn_y
# --- block 437 ---
L7472:	fn_link  L7416
	fn_link  L7452
	fn_combi_t16 5, 0,3,1,2,4,0
# --- block 438 ---
L7484:	fn_link  L7408
	fn_link  L7472
	fn_combi_t40 5, 4,0,2,3,1,2
# --- block 439 ---
NanoPrelude.sum:	fn_link  L7508
	fn_link  L7516
	fn_elink NanoPrelude.foldr
L7508:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 440 ---
L7516:	fn_link  L7528
	fn_link  L7552
	fn_combi_t8 4, 0,3,2,1,0,0
L7528:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7552:	fn_y
# --- block 441 ---
KnuthbendixN.funWeight:	fn_link  L7564
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 442 ---
L7564:	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.lookUpBy
	fn_link  NanoPrelude.fromJust
	fn_combi_t18 6, 0,1,2,3,5,0
# --- block 443 ---
NanoPrelude.fromJust:	fn_link  L7592
	fn_link  L7596
	fn_combi_t2 3, 2,0,1,0,0,0
L7592:	fn_combi_t0 1, 0,0,0,0,0,0
L7596:	fn_elink _error0
# --- block 444 ---
KnuthbendixN.varWeight:	fn_link  L7608
	fn_combi_t1 2, 1,0,0,0,0,0
L7608:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 445 ---
KnuthbendixN.weights:	fn_link  L7816
	fn_link  L7624
	fn_combi_t2 3, 2,0,1,0,0,0
L7624:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 446 ---
L7632:	fn_link  L7644
	fn_link  L7648
	fn_combi_t2 4, 3,0,1,0,0,0
L7644:	fn_combi_t0 2, 0,0,0,0,0,0
L7648:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 447 ---
L7656:	fn_link  L7672
	fn_link  L7632
	fn_link  L7680
	fn_combi_t5 4, 3,0,1,2,0,0
L7672:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7680:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 448 ---
L7684:	fn_link  L7696
	fn_link  L7656
	fn_combi_t2 4, 3,0,1,0,0,0
L7696:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 449 ---
L7700:	fn_link  L7712
	fn_link  L7716
	fn_combi_t2 4, 3,0,1,0,0,0
L7712:	fn_combi_t0 2, 0,0,0,0,0,0
L7716:	fn_box
	.word 0x0000002b	# raw word 43
	fn_box_body
# --- block 450 ---
L7724:	fn_link  L7740
	fn_link  L7700
	fn_link  L7748
	fn_combi_t5 4, 3,0,1,2,0,0
L7740:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7748:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 451 ---
L7752:	fn_link  L7684
	fn_link  L7724
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 452 ---
L7764:	fn_link  L7776
	fn_link  L7780
	fn_combi_t2 4, 3,0,1,0,0,0
L7776:	fn_combi_t0 2, 0,0,0,0,0,0
L7780:	fn_box
	.word 0x00000030	# raw word 48
	fn_box_body
# --- block 453 ---
L7788:	fn_link  L7804
	fn_link  L7764
	fn_link  L7812
	fn_combi_t5 4, 3,0,1,2,0,0
L7804:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7812:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 454 ---
L7816:	fn_link  L7752
	fn_link  L7788
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 455 ---
KnuthbendixN.completionWith:	fn_link  L7844
	fn_link  L7940
	fn_link  L7968
	fn_combi_t5 4, 0,1,3,2,0,0
L7844:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 456 ---
L7848:	fn_link  KnuthbendixN.simplifyRules
	fn_link  KnuthbendixN.completionWith2
	fn_combi_t32 5, 0,1,2,3,4,2
# --- block 457 ---
L7860:	fn_link  L7872
	fn_link  L7848
	fn_combi_t3 3, 0,1,2,0,0,0
L7872:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 458 ---
L7876:	fn_link  L7884
	fn_combi_t24 6, 0,1,5,2,3,4
L7884:	fn_combi_t42 5, 0,4,1,2,4,3
# --- block 459 ---
L7888:	fn_link  L7876
	fn_combi_t24 5, 0,1,4,3,2,4
# --- block 460 ---
L7896:	fn_link  KnuthbendixN.getCriticalPairs
	fn_link  L7860
	fn_link  L7888
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 461 ---
L7912:	fn_link  L7920
	fn_combi_t24 6, 0,1,5,2,3,4
L7920:	fn_combi_t46 6, 0,5,1,2,3,4
# --- block 462 ---
L7924:	fn_link  L7912
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 463 ---
L7932:	fn_link  L7924
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 464 ---
L7940:	fn_link  KnuthbendixN.completionLoop
	fn_link  L7896
	fn_link  L7932
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 465 ---
L7956:	fn_link  L7964
	fn_combi_t24 5, 0,1,4,2,3,4
L7964:	fn_combi_t42 5, 0,4,1,2,3,4
# --- block 466 ---
L7968:	fn_link  L7956
	fn_combi_t26 6, 0,1,3,5,4,2
# --- block 467 ---
KnuthbendixN.completionWith2:	fn_link  L8028
	fn_link  L7988
	fn_combi_t6 4, 0,2,1,3,0,0
L7988:	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 468 ---
L7992:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t16 4, 0,1,0,3,2,0
# --- block 469 ---
L8000:	fn_link  KnuthbendixN.simplifyEquations
	fn_link  L8012
	fn_combi_t40 6, 0,1,2,3,4,5
L8012:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 470 ---
L8016:	fn_link  L7992
	fn_link  L8000
	fn_combi_t42 6, 0,2,3,1,4,5
# --- block 471 ---
L8028:	fn_link  KnuthbendixN.uniqueRules
	fn_link  L8016
	fn_link  L8044
	fn_combi_t32 6, 0,1,3,4,5,2
L8044:	fn_combi_t40 6, 3,0,2,4,1,5
# --- block 472 ---
KnuthbendixN.simplifyEquations:	fn_link  L8060
	fn_link  L8076
	fn_combi_t3 4, 0,1,3,0,0,0
# --- block 473 ---
L8060:	fn_link  KnuthbendixN.normEqn
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.uniqueRules
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 474 ---
L8076:	fn_link  KnuthbendixN.equalTerms
	fn_link  L8096
	fn_link  KnuthbendixN.non
	fn_link  NanoPrelude.filter
	fn_combi_t41 6, 0,1,2,3,4,5
L8096:	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 475 ---
NanoPrelude.filter:	fn_link  L8164
	fn_link  L8112
	fn_combi_t3 3, 0,1,2,0,0,0
L8112:	fn_y
# --- block 476 ---
L8116:	fn_link  L8128
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L8128:	fn_elink _error0
# --- block 477 ---
L8132:	fn_link  L8140
	fn_combi_t24 5, 0,1,4,2,3,4
L8140:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 478 ---
L8144:	fn_link  L8160
	fn_link  L8116
	fn_link  L8132
	fn_combi_t26 5, 0,1,3,4,2,4
L8160:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 479 ---
L8164:	fn_link  L8144
	fn_link  L8176
	fn_combi_t16 5, 4,0,1,2,3,0
L8176:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 480 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 481 ---
KnuthbendixN.non:	fn_link  NanoPrelude.not
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 482 ---
KnuthbendixN.uniqueRules:	fn_link  KnuthbendixN.equivPair
	fn_elink KnuthbendixN.nubBy
# --- block 483 ---
KnuthbendixN.nubBy:	fn_link  L8208
	fn_elink KnuthbendixN.nubBySans
L8208:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 484 ---
KnuthbendixN.nubBySans:	fn_link  L8304
	fn_link  L8224
	fn_combi_t7 4, 0,1,2,3,0,0
L8224:	fn_y
# --- block 485 ---
L8228:	fn_link  L8240
	fn_link  KnuthbendixN.nubBySans
	fn_combi_t12 5, 0,1,4,2,3,0
L8240:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 486 ---
L8244:	fn_link  L8252
	fn_combi_t46 5, 0,3,1,2,3,4
L8252:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 487 ---
L8256:	fn_link  KnuthbendixN.elemBy
	fn_combi_t37 6, 0,2,4,1,3,5
# --- block 488 ---
L8264:	fn_link  L8228
	fn_link  L8244
	fn_link  L8256
	fn_link  L8284
	fn_combi_t45 5, 0,1,4,2,3,4
L8284:	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 489 ---
L8288:	fn_link  L8264
	fn_link  L8300
	fn_combi_t3 3, 0,1,2,0,0,0
L8300:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 490 ---
L8304:	fn_link  L8288
	fn_link  L8316
	fn_combi_t46 6, 5,0,1,2,3,4
L8316:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 491 ---
KnuthbendixN.equivPair:	fn_link  L8412
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 492 ---
L8328:	fn_link  KnuthbendixN.equiv
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,5,3,4
# --- block 493 ---
L8340:	fn_link  KnuthbendixN.equiv
	fn_link  L8328
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 494 ---
L8352:	fn_link  KnuthbendixN.equiv
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 495 ---
L8364:	fn_link  KnuthbendixN.equiv
	fn_link  L8352
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 496 ---
L8376:	fn_link  NanoPrelude.$7c$7c
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 497 ---
L8384:	fn_link  L8376
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 498 ---
L8392:	fn_link  L8364
	fn_link  L8384
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 499 ---
L8404:	fn_link  L8392
	fn_combi_t56 5, 1,0,2,4,3,4
# --- block 500 ---
L8412:	fn_link  L8340
	fn_link  L8404
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 501 ---
KnuthbendixN.equiv:	fn_link  KnuthbendixN.match
	fn_link  NanoPrelude.isJust
	fn_link  L8448
	fn_link  L8444
	fn_combi_t24 5, 0,1,4,2,3,4
L8444:	fn_combi_t49 5, 0,4,1,2,4,3
# --- block 502 ---
L8448:	fn_link  KnuthbendixN.match
	fn_link  NanoPrelude.isJust
	fn_link  NanoPrelude.$26$26
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 503 ---
NanoPrelude.isJust:	fn_link  L8480
	fn_link  L8476
	fn_combi_t2 3, 2,0,1,0,0,0
L8476:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 504 ---
L8480:	fn_link  L8488
	fn_combi_t0 2, 0,0,0,0,0,0
L8488:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 505 ---
KnuthbendixN.match:	fn_link  L8512
	fn_link  L8516
	fn_link  L8528
	fn_link  KnuthbendixN.matchWith
	fn_combi_t29 6, 0,1,4,2,5,3
L8512:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 506 ---
L8516:	fn_link  L8524
	fn_combi_t2 4, 3,1,0,0,0,0
L8524:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 507 ---
L8528:	fn_link  L8536
	fn_combi_t2 4, 3,1,0,0,0,0
L8536:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 508 ---
KnuthbendixN.matchWith:	fn_link  L8732
	fn_link  L8912
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 509 ---
L8552:	fn_link  L8568
	fn_link  KnuthbendixN.subst
	fn_link  KnuthbendixN.equalTerms
	fn_combi_t48 6, 0,5,1,3,2,4
L8568:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 510 ---
L8572:	fn_link  L8580
	fn_combi_t24 6, 0,1,5,2,3,4
L8580:	fn_combi_t46 6, 0,1,2,3,5,4
# --- block 511 ---
L8584:	fn_link  L8572
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 512 ---
L8592:	fn_link  KnuthbendixN.matchWith
	fn_link  L8612
	fn_link  L8552
	fn_link  L8584
	fn_combi_t10 5, 0,1,4,2,3,0
L8612:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 513 ---
L8616:	fn_link  L8592
	fn_combi_t23 5, 0,1,2,3,4,1
# --- block 514 ---
L8624:	fn_link  L8636
	fn_link  KnuthbendixN.matchWith
	fn_combi_t42 6, 0,2,5,1,3,4
L8636:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 515 ---
L8640:	fn_link  L8652
	fn_link  L8624
	fn_combi_t30 6, 0,3,1,4,5,2
L8652:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 516 ---
L8656:	fn_link  NanoPrelude.fst
	fn_link  NanoPrelude.map
	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.elemBy
	fn_combi_t42 6, 0,1,5,2,3,4
# --- block 517 ---
L8676:	fn_link  L8684
	fn_combi_t44 5, 0,1,4,2,3,4
L8684:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 518 ---
L8688:	fn_link  L8640
	fn_link  L8656
	fn_link  L8676
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 519 ---
L8704:	fn_link  L8688
	fn_link  L8716
	fn_combi_t40 5, 0,1,2,4,3,4
L8716:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 520 ---
L8720:	fn_link  L8616
	fn_link  L8704
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 521 ---
L8732:	fn_link  L8720
	fn_link  L8744
	fn_combi_t46 6, 2,0,1,3,4,5
L8744:	fn_elink _error0
# --- block 522 ---
L8748:	fn_link  L8756
	fn_combi_t0 2, 0,0,0,0,0,0
L8756:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 523 ---
L8760:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 524 ---
L8768:	fn_link  Data.List_Type.$2b$2b
	fn_link  KnuthbendixN.matchWith
	fn_combi_t40 6, 0,1,3,2,4,5
# --- block 525 ---
L8780:	fn_link  L8760
	fn_link  L8768
	fn_link  L8796
	fn_combi_t10 5, 0,1,4,2,3,0
L8796:	fn_combi_t25 6, 0,3,1,4,5,2
# --- block 526 ---
L8800:	fn_link  L8812
	fn_link  KnuthbendixN.equalStrings
	fn_combi_t37 6, 0,2,4,1,3,5
L8812:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 527 ---
L8816:	fn_link  L8800
	fn_link  L8828
	fn_combi_t29 6, 0,1,5,2,4,3
L8828:	fn_combi_t35 6, 4,0,1,3,5,2
# --- block 528 ---
L8832:	fn_link  L8748
	fn_link  L8780
	fn_link  L8816
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 529 ---
L8848:	fn_link  L8856
	fn_combi_t46 6, 1,0,2,3,4,5
L8856:	fn_elink _error0
# --- block 530 ---
L8860:	fn_link  L8832
	fn_link  L8848
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 531 ---
L8872:	fn_link  L8880
	fn_combi_t0 3, 0,0,0,0,0,0
L8880:	fn_elink _error0
# --- block 532 ---
L8884:	fn_link  L8872
	fn_link  L8896
	fn_combi_t19 5, 2,3,0,4,1,0
L8896:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 533 ---
L8900:	fn_link  L8908
	fn_combi_t45 5, 0,1,4,2,3,4
L8908:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 534 ---
L8912:	fn_link  L8860
	fn_link  L8932
	fn_link  L8884
	fn_link  L8900
	fn_combi_t10 5, 0,1,4,2,3,0
L8932:	fn_combi_t40 5, 3,0,1,4,2,4
# --- block 535 ---
KnuthbendixN.normEqn:	fn_link  KnuthbendixN.norm
	fn_link  L8948
	fn_combi_t19 4, 3,0,1,2,2,0
# --- block 536 ---
L8948:	fn_link  KnuthbendixN.norm
	fn_combi_t40 6, 5,0,2,3,1,4
# --- block 537 ---
KnuthbendixN.norm:	fn_link  KnuthbendixN.normalForms
	fn_link  NanoPrelude.head
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 538 ---
NanoPrelude.head:	fn_link  L8980
	fn_link  L8984
	fn_combi_t2 3, 2,0,1,0,0,0
L8980:	fn_combi_t0 2, 0,0,0,0,0,0
L8984:	fn_elink _error0
# --- block 539 ---
KnuthbendixN.normalForms:	fn_link  L9028
	fn_link  L9000
	fn_combi_t3 3, 0,1,2,0,0,0
L9000:	fn_y
# --- block 540 ---
L9004:	fn_link  L9012
	fn_combi_t2 4, 3,1,0,0,0,0
L9012:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 541 ---
L9016:	fn_link  KnuthbendixN.concatMap
	fn_link  NanoPrelude.null
	fn_combi_t30 5, 0,4,1,2,4,3
# --- block 542 ---
L9028:	fn_link  KnuthbendixN.reduce
	fn_link  L9004
	fn_link  L9016
	fn_link  L9048
	fn_combi_t24 6, 0,1,5,2,3,4
L9048:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 543 ---
KnuthbendixN.reduce:	fn_link  KnuthbendixN.positions
	fn_link  KnuthbendixN.reduceAt
	fn_link  KnuthbendixN.concatMap
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 544 ---
KnuthbendixN.reduceAt:	fn_link  L9084
	fn_link  L9088
	fn_link  L9112
	fn_combi_t5 4, 0,1,3,2,0,0
L9084:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 545 ---
L9088:	fn_link  KnuthbendixN.reduceAtWith
	fn_link  KnuthbendixN.concatMap
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 546 ---
L9100:	fn_link  KnuthbendixN.subterm
	fn_link  KnuthbendixN.isVar
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 547 ---
L9112:	fn_link  L9100
	fn_combi_t24 5, 0,1,3,3,4,2
# --- block 548 ---
KnuthbendixN.reduceAtWith:	fn_link  L9184
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 549 ---
L9128:	fn_link  KnuthbendixN.subst
	fn_link  KnuthbendixN.placeAt
	fn_combi_t26 6, 0,1,5,4,3,2
# --- block 550 ---
L9140:	fn_link  L9156
	fn_link  L9128
	fn_link  L9160
	fn_combi_t5 4, 0,1,3,2,0,0
L9156:	fn_combi_t0 2, 0,0,0,0,0,0
L9160:	fn_combi_t32 7, 6,0,2,3,4,1
# --- block 551 ---
L9164:	fn_link  L9180
	fn_link  KnuthbendixN.subterm
	fn_link  KnuthbendixN.match
	fn_combi_t30 6, 0,5,1,3,4,2
L9180:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 552 ---
L9184:	fn_link  L9140
	fn_link  L9164
	fn_link  L9200
	fn_combi_t15 4, 0,1,3,2,3,0
L9200:	fn_combi_t42 5, 0,2,3,1,2,4
# --- block 553 ---
KnuthbendixN.placeAt:	fn_link  L9280
	fn_link  L9216
	fn_combi_t3 3, 0,1,2,0,0,0
L9216:	fn_y
# --- block 554 ---
L9220:	fn_link  L9228
	fn_combi_t0 2, 0,0,0,0,0,0
L9228:	fn_elink _error0
# --- block 555 ---
L9232:	fn_link  NanoPrelude.pred
	fn_link  KnuthbendixN.applyToIndex
	fn_combi_t15 5, 0,2,4,1,3,0
# --- block 556 ---
L9244:	fn_link  L9252
	fn_combi_t46 6, 0,4,1,2,3,5
L9252:	fn_combi_t2 4, 2,0,1,0,0,0
# --- block 557 ---
L9256:	fn_link  L9232
	fn_link  L9244
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 558 ---
L9268:	fn_link  L9220
	fn_link  L9256
	fn_combi_t32 6, 3,0,2,4,5,1
# --- block 559 ---
L9280:	fn_link  L9268
	fn_combi_t16 5, 3,1,0,2,4,0
# --- block 560 ---
KnuthbendixN.applyToIndex:	fn_link  L9388
	fn_link  L9300
	fn_combi_t3 3, 0,1,2,0,0,0
L9300:	fn_y
# --- block 561 ---
L9304:	fn_link  NanoPrelude.pred
	fn_link  L9316
	fn_combi_t47 6, 0,4,2,1,3,5
L9316:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 562 ---
L9320:	fn_link  L9332
	fn_link  L9336
	fn_combi_t44 6, 0,3,1,2,4,5
L9332:	fn_elink _prim_eq
L9336:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 563 ---
L9344:	fn_link  L9304
	fn_link  L9320
	fn_combi_t12 4, 0,1,2,3,3,0
# --- block 564 ---
L9356:	fn_link  L9364
	fn_combi_t24 5, 0,1,4,2,3,4
L9364:	fn_combi_t47 5, 0,4,1,2,3,4
# --- block 565 ---
L9368:	fn_link  L9384
	fn_link  L9344
	fn_link  L9356
	fn_combi_t26 6, 0,1,4,5,2,3
L9384:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 566 ---
L9388:	fn_link  L9368
	fn_link  L9400
	fn_combi_t46 6, 5,0,1,2,3,4
L9400:	fn_elink _error0
# --- block 567 ---
KnuthbendixN.simplifyRules:	fn_link  L9452
	fn_link  KnuthbendixN.reduceSplit
	fn_combi_t37 5, 0,2,3,4,1,3
# --- block 568 ---
L9416:	fn_link  L9432
	fn_link  KnuthbendixN.normRhs
	fn_link  NanoPrelude.map
	fn_combi_t21 5, 0,1,2,3,4,0
L9432:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 569 ---
L9436:	fn_link  L9448
	fn_link  L9416
	fn_combi_t42 4, 0,2,3,1,2,3
L9448:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 570 ---
L9452:	fn_link  L9436
	fn_link  KnuthbendixN.uniqueRules
	fn_combi_t49 6, 5,3,0,1,2,4
# --- block 571 ---
KnuthbendixN.reduceSplit:	fn_link  L9744
	fn_link  L9476
	fn_combi_t3 4, 0,1,3,0,0,0
L9476:	fn_y
# --- block 572 ---
L9480:	fn_link  L9488
	fn_combi_t2 4, 3,1,0,0,0,0
L9488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 573 ---
L9492:	fn_link  L9500
	fn_combi_t47 6, 5,3,0,1,2,4
L9500:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 574 ---
L9504:	fn_link  L9516
	fn_link  L9492
	fn_combi_t3 3, 0,1,2,0,0,0
L9516:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 575 ---
L9520:	fn_link  NanoPrelude.head
	fn_combi_t5 4, 3,0,2,1,0,0
# --- block 576 ---
L9528:	fn_link  L9536
	fn_combi_t33 6, 5,0,1,2,3,4
L9536:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 577 ---
L9540:	fn_link  L9520
	fn_link  L9528
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 578 ---
L9552:	fn_link  L9564
	fn_link  L9568
	fn_combi_t12 6, 5,0,2,3,1,0
L9564:	fn_combi_t0 2, 0,0,0,0,0,0
L9568:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 579 ---
L9572:	fn_link  NanoPrelude.fst
	fn_link  L9552
	fn_link  KnuthbendixN.reducible
	fn_combi_t40 6, 0,1,4,5,2,3
# --- block 580 ---
L9588:	fn_link  NanoPrelude.null
	fn_link  NanoPrelude.$7c$7c
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 581 ---
L9600:	fn_link  L9572
	fn_link  L9588
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 582 ---
L9612:	fn_link  L9620
	fn_combi_t40 5, 0,1,2,4,3,4
L9620:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 583 ---
L9624:	fn_link  L9612
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 584 ---
L9632:	fn_link  L9540
	fn_link  L9600
	fn_link  L9624
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 585 ---
L9648:	fn_link  L9656
	fn_combi_t38 5, 0,1,2,4,3,4
L9656:	fn_combi_t37 5, 0,1,3,4,2,4
# --- block 586 ---
L9660:	fn_link  L9504
	fn_link  L9632
	fn_link  L9648
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 587 ---
L9676:	fn_link  L9660
	fn_link  L9688
	fn_combi_t3 3, 0,1,2,0,0,0
L9688:	fn_combi_t46 6, 1,2,0,3,5,4
# --- block 588 ---
L9692:	fn_link  KnuthbendixN.reduce
	fn_link  L9676
	fn_link  L9708
	fn_combi_t26 6, 0,1,3,5,2,4
L9708:	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 589 ---
L9712:	fn_link  L9480
	fn_link  L9692
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 590 ---
L9724:	fn_link  L9712
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 591 ---
L9732:	fn_link  L9740
	fn_combi_t2 2, 1,0,0,0,0,0
L9740:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 592 ---
L9744:	fn_link  L9724
	fn_link  L9732
	fn_combi_t16 5, 4,0,1,2,3,0
# --- block 593 ---
KnuthbendixN.reducible:	fn_link  KnuthbendixN.reduce
	fn_link  NanoPrelude.null
	fn_link  NanoPrelude.not
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 594 ---
KnuthbendixN.normRhs:	fn_link  L9780
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 595 ---
L9780:	fn_link  KnuthbendixN.norm
	fn_combi_t16 5, 4,2,0,1,3,0
# --- block 596 ---
KnuthbendixN.getCriticalPairs:	fn_link  L9812
	fn_link  L9828
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 597 ---
L9800:	fn_link  KnuthbendixN.duoCriticalPairs
	fn_link  KnuthbendixN.concatMap
	fn_combi_t12 4, 0,1,2,3,2,0
# --- block 598 ---
L9812:	fn_link  L9824
	fn_link  L9800
	fn_combi_t3 3, 0,1,2,0,0,0
L9824:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 599 ---
L9828:	fn_link  KnuthbendixN.selfCriticalPairs
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 600 ---
KnuthbendixN.selfCriticalPairs:	fn_link  L9892
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 601 ---
L9848:	fn_link  L9864
	fn_link  L9868
	fn_link  KnuthbendixN.criticalPairs
	fn_combi_t42 6, 0,3,1,2,4,5
L9864:	fn_combi_t2 3, 2,0,1,0,0,0
L9868:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 602 ---
L9872:	fn_link  KnuthbendixN.rename
	fn_link  L9848
	fn_link  L9888
	fn_combi_t5 4, 0,1,3,2,0,0
L9888:	fn_combi_t43 5, 0,2,4,1,3,4
# --- block 603 ---
L9892:	fn_link  L9904
	fn_link  L9872
	fn_combi_t14 4, 0,2,3,1,3,0
L9904:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 604 ---
KnuthbendixN.criticalPairs:	fn_link  L10000
	fn_link  L9920
	fn_combi_t52 6, 4,0,1,2,3,5
L9920:	fn_combi_t51 5, 2,0,1,3,3,4
# --- block 605 ---
L9924:	fn_link  KnuthbendixN.positions
	fn_link  NanoPrelude.null
	fn_link  KnuthbendixN.non
	fn_link  NanoPrelude.filter
	fn_combi_t57 6, 4,0,1,2,3,5
# --- block 606 ---
L9944:	fn_link  KnuthbendixN.criticalPairsAt
	fn_link  KnuthbendixN.concatMap
	fn_combi_t56 6, 0,1,2,3,4,5
# --- block 607 ---
L9956:	fn_link  L9972
	fn_link  L9944
	fn_link  L9976
	fn_combi_t5 4, 0,1,3,2,0,0
L9972:	fn_combi_t2 3, 2,0,1,0,0,0
L9976:	fn_combi_t40 5, 0,1,2,3,1,4
# --- block 608 ---
L9980:	fn_link  L9988
	fn_combi_t24 6, 0,1,5,2,3,4
L9988:	fn_combi_t43 6, 0,4,5,1,2,3
# --- block 609 ---
L9992:	fn_link  L9980
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 610 ---
L10000:	fn_link  KnuthbendixN.positions
	fn_link  L9924
	fn_link  L9956
	fn_link  L9992
	fn_combi_t29 6, 0,1,4,2,5,3
# --- block 611 ---
KnuthbendixN.criticalPairsAt:	fn_link  L10208
	fn_combi_t18 5, 2,0,1,3,4,0
# --- block 612 ---
L10028:	fn_link  KnuthbendixN.subterm
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 613 ---
L10036:	fn_link  KnuthbendixN.subst
	fn_link  KnuthbendixN.placeAt
	fn_combi_t12 5, 0,1,4,3,2,0
# --- block 614 ---
L10048:	fn_link  KnuthbendixN.subst
	fn_link  L10036
	fn_link  L10064
	fn_combi_t5 4, 0,1,3,2,0,0
L10064:	fn_combi_t42 5, 0,3,4,1,4,2
# --- block 615 ---
L10068:	fn_link  KnuthbendixN.subst
	fn_link  KnuthbendixN.norm
	fn_link  KnuthbendixN.criticalPairsFrom
	fn_combi_t58 6, 0,1,3,2,5,4
# --- block 616 ---
L10084:	fn_link  KnuthbendixN.norm
	fn_link  L10068
	fn_link  L10100
	fn_combi_t26 5, 0,1,3,4,2,3
L10100:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 617 ---
L10104:	fn_link  L10048
	fn_link  L10084
	fn_link  L10120
	fn_combi_t5 4, 0,1,3,2,0,0
L10120:	fn_combi_t46 6, 0,4,1,2,3,5
# --- block 618 ---
L10124:	fn_link  L10136
	fn_link  KnuthbendixN.unify
	fn_combi_t37 6, 0,5,3,1,2,4
L10136:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 619 ---
L10140:	fn_link  L10104
	fn_link  L10124
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 620 ---
L10152:	fn_link  KnuthbendixN.isVar
	fn_combi_t30 5, 0,3,1,4,3,2
# --- block 621 ---
L10160:	fn_link  L10152
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 622 ---
L10168:	fn_link  L10160
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 623 ---
L10176:	fn_link  L10168
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 624 ---
L10184:	fn_link  L10028
	fn_link  L10204
	fn_link  L10140
	fn_link  L10176
	fn_combi_t10 5, 0,1,4,2,3,0
L10204:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 625 ---
L10208:	fn_link  L10184
	fn_combi_t51 6, 2,0,1,3,4,5
# --- block 626 ---
KnuthbendixN.unify:	fn_link  L10236
	fn_link  L10240
	fn_link  L10252
	fn_link  KnuthbendixN.unifyWith
	fn_combi_t29 6, 0,1,4,2,5,3
L10236:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 627 ---
L10240:	fn_link  L10248
	fn_combi_t2 4, 3,1,0,0,0,0
L10248:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 628 ---
L10252:	fn_link  L10260
	fn_combi_t2 4, 3,1,0,0,0,0
L10260:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 629 ---
KnuthbendixN.unifyWith:	fn_link  L10716
	fn_link  L10972
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 630 ---
L10276:	fn_link  L10288
	fn_link  L10292
	fn_combi_t12 6, 5,0,2,3,1,0
L10288:	fn_combi_t0 2, 0,0,0,0,0,0
L10292:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 631 ---
L10296:	fn_link  L10276
	fn_link  KnuthbendixN.substAdd
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 632 ---
L10308:	fn_link  KnuthbendixN.unifyWith
	fn_combi_t42 6, 0,2,4,1,3,5
# --- block 633 ---
L10316:	fn_link  L10296
	fn_link  L10308
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 634 ---
L10328:	fn_link  KnuthbendixN.vars
	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.elemBy
	fn_combi_t14 5, 0,1,3,2,4,0
# --- block 635 ---
L10344:	fn_link  L10328
	fn_combi_t42 5, 0,1,4,2,3,4
# --- block 636 ---
L10352:	fn_link  L10316
	fn_link  L10344
	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 637 ---
L10364:	fn_link  NanoPrelude.fromJust
	fn_link  KnuthbendixN.substAdd
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 638 ---
L10376:	fn_link  L10364
	fn_link  KnuthbendixN.unifyWith
	fn_combi_t42 6, 0,3,4,1,2,5
# --- block 639 ---
L10388:	fn_link  L10400
	fn_link  NanoPrelude.isJust
	fn_combi_t42 5, 0,4,1,2,3,4
L10400:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 640 ---
L10404:	fn_link  L10416
	fn_link  KnuthbendixN.equalTerms
	fn_combi_t39 6, 0,4,1,2,3,5
L10416:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 641 ---
L10420:	fn_link  L10388
	fn_link  L10404
	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 642 ---
L10432:	fn_link  L10376
	fn_link  L10420
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 643 ---
L10444:	fn_link  L10452
	fn_combi_t29 5, 0,1,4,2,4,3
L10452:	fn_combi_t42 6, 0,3,5,1,4,2
# --- block 644 ---
L10456:	fn_link  L10444
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 645 ---
L10464:	fn_link  L10456
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 646 ---
L10472:	fn_link  L10492
	fn_link  L10352
	fn_link  L10432
	fn_link  L10464
	fn_combi_t29 5, 0,1,4,2,4,3
L10492:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 647 ---
L10496:	fn_link  L10508
	fn_link  KnuthbendixN.equalTerms
	fn_combi_t39 6, 0,3,1,2,4,5
L10508:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 648 ---
L10512:	fn_link  L10496
	fn_link  L10524
	fn_combi_t44 5, 0,1,4,2,3,4
L10524:	fn_combi_t46 6, 0,2,1,3,4,5
# --- block 649 ---
L10528:	fn_link  L10472
	fn_link  L10512
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 650 ---
L10540:	fn_link  L10548
	fn_combi_t24 6, 0,1,5,2,3,4
L10548:	fn_combi_t46 6, 0,5,1,2,3,4
# --- block 651 ---
L10552:	fn_link  L10540
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 652 ---
L10560:	fn_link  L10552
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 653 ---
L10568:	fn_link  L10560
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 654 ---
L10576:	fn_link  KnuthbendixN.unifyWith
	fn_link  L10528
	fn_link  L10568
	fn_combi_t26 5, 0,1,3,4,2,4
# --- block 655 ---
L10592:	fn_link  L10600
	fn_combi_t24 5, 0,1,4,2,3,4
L10600:	fn_combi_t42 5, 0,4,1,2,3,4
# --- block 656 ---
L10604:	fn_link  L10592
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 657 ---
L10612:	fn_link  L10604
	fn_combi_t26 6, 0,1,4,5,3,2
# --- block 658 ---
L10620:	fn_link  KnuthbendixN.unify
	fn_link  L10576
	fn_link  L10612
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 659 ---
L10636:	fn_link  L10644
	fn_combi_t24 6, 0,1,5,2,3,4
L10644:	fn_combi_t42 6, 0,5,3,1,2,4
# --- block 660 ---
L10648:	fn_link  L10636
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 661 ---
L10656:	fn_link  KnuthbendixN.subst
	fn_link  L10620
	fn_link  L10648
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 662 ---
L10672:	fn_link  L10680
	fn_combi_t24 6, 0,1,5,2,4,3
L10680:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 663 ---
L10684:	fn_link  L10704
	fn_link  KnuthbendixN.subst
	fn_link  L10656
	fn_link  L10672
	fn_combi_t24 5, 0,1,4,2,3,4
L10704:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 664 ---
L10708:	fn_link  L10684
	fn_combi_t23 5, 0,1,2,3,4,4
# --- block 665 ---
L10716:	fn_link  L10708
	fn_link  L10728
	fn_combi_t46 6, 2,0,1,3,4,5
L10728:	fn_elink _error0
# --- block 666 ---
L10732:	fn_link  L10744
	fn_link  L10748
	fn_combi_t12 5, 0,1,3,4,2,0
L10744:	fn_combi_t2 4, 2,0,1,0,0,0
L10748:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 667 ---
L10752:	fn_link  L10768
	fn_link  L10772
	fn_link  KnuthbendixN.unifyWith
	fn_combi_t33 6, 0,1,2,5,4,3
L10768:	fn_combi_t1 3, 2,0,0,0,0,0
L10772:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 668 ---
L10776:	fn_link  L10752
	fn_combi_t24 6, 0,1,3,4,5,2
# --- block 669 ---
L10784:	fn_link  L10732
	fn_link  L10776
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 670 ---
L10796:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 671 ---
L10804:	fn_link  Data.List_Type.$2b$2b
	fn_link  KnuthbendixN.unifyWith
	fn_combi_t40 6, 0,1,3,2,4,5
# --- block 672 ---
L10816:	fn_link  L10796
	fn_link  L10804
	fn_link  L10832
	fn_combi_t10 5, 0,1,4,2,3,0
L10832:	fn_combi_t25 6, 0,3,1,4,5,2
# --- block 673 ---
L10836:	fn_link  L10848
	fn_link  KnuthbendixN.equalStrings
	fn_combi_t37 6, 0,2,4,1,3,5
L10848:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 674 ---
L10852:	fn_link  L10836
	fn_link  L10864
	fn_combi_t3 3, 0,1,2,0,0,0
L10864:	fn_combi_t41 5, 3,0,1,4,2,4
# --- block 675 ---
L10868:	fn_link  L10852
	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 676 ---
L10876:	fn_link  L10868
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 677 ---
L10884:	fn_link  L10816
	fn_link  L10876
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 678 ---
L10896:	fn_link  L10784
	fn_link  L10884
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 679 ---
L10908:	fn_link  L10916
	fn_combi_t46 6, 1,0,2,3,4,5
L10916:	fn_elink _error0
# --- block 680 ---
L10920:	fn_link  L10896
	fn_link  L10908
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 681 ---
L10932:	fn_link  L10940
	fn_combi_t0 3, 0,0,0,0,0,0
L10940:	fn_elink _error0
# --- block 682 ---
L10944:	fn_link  L10932
	fn_link  L10956
	fn_combi_t19 5, 2,3,0,4,1,0
L10956:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 683 ---
L10960:	fn_link  L10968
	fn_combi_t45 5, 0,1,4,2,3,4
L10968:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 684 ---
L10972:	fn_link  L10920
	fn_link  L10992
	fn_link  L10944
	fn_link  L10960
	fn_combi_t10 5, 0,1,4,2,3,0
L10992:	fn_combi_t40 5, 3,0,1,4,2,4
# --- block 685 ---
KnuthbendixN.substAdd:	fn_link  L11008
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t16 4, 0,2,1,2,3,0
# --- block 686 ---
L11008:	fn_link  KnuthbendixN.subst
	fn_link  L11028
	fn_link  KnuthbendixN.cross
	fn_link  NanoPrelude.map
	fn_combi_t20 5, 0,1,2,3,4,0
L11028:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 687 ---
KnuthbendixN.criticalPairsFrom:	fn_link  L11048
	fn_link  L11052
	fn_link  L11072
	fn_combi_t10 4, 0,1,3,2,3,0
L11048:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 688 ---
L11052:	fn_link  L11064
	fn_link  L11068
	fn_combi_t12 6, 5,0,2,3,1,0
L11064:	fn_combi_t0 2, 0,0,0,0,0,0
L11068:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 689 ---
L11072:	fn_link  KnuthbendixN.equalTerms
	fn_combi_t28 5, 0,3,4,1,4,2
# --- block 690 ---
KnuthbendixN.rename:	fn_link  L11196
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 691 ---
L11088:	fn_link  KnuthbendixN.equalStrings
	fn_link  KnuthbendixN.elemBy
	fn_link  L11112
	fn_link  KnuthbendixN.non
	fn_link  NanoPrelude.filter
	fn_combi_t61 6, 0,1,2,3,4,5
L11112:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 692 ---
L11116:	fn_link  KnuthbendixN.variables
	fn_link  L11088
	fn_link  L11136
	fn_link  NanoPrelude.map
	fn_combi_t16 5, 0,1,2,4,3,0
L11136:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 693 ---
L11140:	fn_link  L11116
	fn_link  NanoPrelude.zip
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 694 ---
L11152:	fn_link  KnuthbendixN.subst
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 695 ---
L11160:	fn_link  KnuthbendixN.subst
	fn_combi_t40 5, 4,0,3,1,2,3
# --- block 696 ---
L11168:	fn_link  KnuthbendixN.vars
	fn_link  L11140
	fn_link  L11152
	fn_link  L11160
	fn_link  L11192
	fn_combi_t24 6, 0,1,5,2,3,4
L11192:	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 697 ---
L11196:	fn_link  L11168
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 698 ---
KnuthbendixN.duoCriticalPairs:	fn_link  L11232
	fn_link  L11332
	fn_combi_t53 5, 3,0,2,1,2,4
# --- block 699 ---
L11216:	fn_link  L11228
	fn_link  KnuthbendixN.criticalPairs
	fn_combi_t28 6, 0,2,1,3,5,4
L11228:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 700 ---
L11232:	fn_link  L11248
	fn_link  L11216
	fn_link  L11252
	fn_combi_t5 4, 0,1,3,2,0,0
L11248:	fn_combi_t2 3, 2,0,1,0,0,0
L11252:	fn_combi_t44 5, 0,1,4,1,2,3
# --- block 701 ---
L11256:	fn_link  L11268
	fn_link  KnuthbendixN.criticalPairs
	fn_combi_t37 6, 0,2,1,3,4,5
L11268:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 702 ---
L11272:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 703 ---
L11280:	fn_link  L11272
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 704 ---
L11288:	fn_link  L11308
	fn_link  L11256
	fn_link  L11312
	fn_link  L11280
	fn_combi_t52 6, 0,1,2,4,3,5
L11308:	fn_combi_t2 3, 2,0,1,0,0,0
L11312:	fn_combi_t40 5, 0,1,2,3,1,4
# --- block 705 ---
L11316:	fn_link  L11288
	fn_link  L11328
	fn_combi_t3 3, 0,1,2,0,0,0
L11328:	fn_combi_t56 5, 1,0,2,4,3,4
# --- block 706 ---
L11332:	fn_link  L11316
	fn_combi_t37 5, 0,1,3,4,2,4

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
