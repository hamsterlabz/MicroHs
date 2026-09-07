# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/TribeLie  (entry @0)
	.text
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.map
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	TribeLie.PuzzleAnswer
	.globl	TribeLie.allCombis
	.globl	TribeLie.childs_statement_is_valid
	.globl	TribeLie.count
	.globl	TribeLie.main
	.globl	TribeLie.parent1_statement_is_valid
	.globl	TribeLie.parent2_statement_is_valid
	.globl	TribeLie.predicate
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  TribeLie.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
TribeLie.main:	fn_link  TribeLie.allCombis
	fn_link  TribeLie.predicate
	fn_elink TribeLie.count
# --- block 3 ---
TribeLie.count:	fn_link  L64
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.sum
	fn_link  L60
	fn_combi_t47 6, 0,1,2,3,4,5
L60:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 4 ---
L64:	fn_link  L76
	fn_link  L84
	fn_combi_t4 4, 2,3,0,1,0,0
L76:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L84:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
NanoPrelude.sum:	fn_link  L104
	fn_link  L112
	fn_elink NanoPrelude.foldr
L104:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
L112:	fn_link  L124
	fn_link  L148
	fn_combi_t8 4, 0,3,2,1,0,0
L124:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L148:	fn_y
# --- block 7 ---
NanoPrelude.foldr:	fn_link  L168
	fn_link  L164
	fn_combi_t7 4, 0,1,2,3,0,0
L164:	fn_y
# --- block 8 ---
L168:	fn_link  L176
	fn_combi_t16 5, 4,2,0,1,3,0
L176:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 9 ---
NanoPrelude.map:	fn_link  L208
	fn_link  L192
	fn_combi_t3 3, 0,1,2,0,0,0
L192:	fn_y
# --- block 10 ---
L196:	fn_link  L204
	fn_combi_t15 5, 0,1,3,2,4,0
L204:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L208:	fn_link  L196
	fn_link  L220
	fn_combi_t16 5, 4,0,1,2,3,0
L220:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
TribeLie.predicate:	fn_link  L312
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 13 ---
L232:	fn_link  TribeLie.childs_statement_is_valid
	fn_link  NanoPrelude.$26$26
	fn_link  L248
	fn_combi_t23 7, 0,1,2,3,4,5
L248:	fn_combi_t12 7, 0,1,2,3,4,0
# --- block 14 ---
L252:	fn_link  L260
	fn_combi_t24 6, 0,1,5,2,3,4
L260:	fn_combi_t54 7, 0,1,2,3,5,4
# --- block 15 ---
L264:	fn_link  TribeLie.parent1_statement_is_valid
	fn_link  NanoPrelude.$26$26
	fn_link  L232
	fn_link  L252
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 16 ---
L284:	fn_link  L292
	fn_combi_t24 5, 0,1,4,2,3,4
L292:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 17 ---
L296:	fn_link  TribeLie.parent2_statement_is_valid
	fn_link  L264
	fn_link  L284
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 18 ---
L312:	fn_link  L296
	fn_combi_t23 5, 0,1,2,3,4,4
# --- block 19 ---
NanoPrelude.$26$26:	fn_link  L328
	fn_combi_t1 2, 1,0,0,0,0,0
L328:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 20 ---
TribeLie.childs_statement_is_valid:	fn_link  L344
	fn_link  L348
	fn_combi_t12 4, 2,3,0,1,0,0
L344:	fn_combi_t0 2, 0,0,0,0,0,0
L348:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 21 ---
TribeLie.parent1_statement_is_valid:	fn_link  L364
	fn_link  L368
	fn_combi_t12 4, 2,3,0,1,0,0
L364:	fn_combi_t0 2, 0,0,0,0,0,0
L368:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 22 ---
TribeLie.parent2_statement_is_valid:	fn_link  L392
	fn_link  L396
	fn_link  L404
	fn_link  L400
	fn_combi_t10 5, 0,1,4,2,3,0
L392:	fn_combi_t0 2, 1,0,0,0,0,0
L396:	fn_combi_t0 2, 0,0,0,0,0,0
L400:	fn_combi_t42 5, 0,3,4,4,1,2
# --- block 23 ---
L404:	fn_link  L416
	fn_link  L420
	fn_combi_t58 5, 2,3,0,4,1,0
L416:	fn_combi_t0 2, 1,0,0,0,0,0
L420:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
TribeLie.allCombis:	fn_link  L456
	fn_link  L1080
	fn_y
# --- block 25 ---
L436:	fn_link  L448
	fn_link  L452
	fn_combi_t2 4, 3,0,1,0,0,0
L448:	fn_combi_t0 2, 0,0,0,0,0,0
L452:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 26 ---
L456:	fn_link  L436
	fn_link  L468
	fn_combi_t2 4, 3,0,1,0,0,0
L468:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
L472:	fn_link  L484
	fn_link  L488
	fn_combi_t2 4, 3,0,1,0,0,0
L484:	fn_combi_t0 2, 0,0,0,0,0,0
L488:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 28 ---
L492:	fn_link  L472
	fn_link  L504
	fn_combi_t2 4, 3,0,1,0,0,0
L504:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 29 ---
L508:	fn_link  L520
	fn_link  L524
	fn_combi_t2 4, 3,0,1,0,0,0
L520:	fn_combi_t0 2, 0,0,0,0,0,0
L524:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 30 ---
L528:	fn_link  L508
	fn_link  L540
	fn_combi_t2 4, 3,0,1,0,0,0
L540:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
L544:	fn_link  L556
	fn_link  L560
	fn_combi_t2 4, 3,0,1,0,0,0
L556:	fn_combi_t0 2, 0,0,0,0,0,0
L560:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 32 ---
L564:	fn_link  L544
	fn_link  L576
	fn_combi_t2 4, 3,0,1,0,0,0
L576:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L580:	fn_link  L592
	fn_link  L596
	fn_combi_t2 4, 3,0,1,0,0,0
L592:	fn_combi_t0 2, 0,0,0,0,0,0
L596:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 34 ---
L600:	fn_link  L580
	fn_link  L612
	fn_combi_t2 4, 3,0,1,0,0,0
L612:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
L616:	fn_link  L628
	fn_link  L632
	fn_combi_t2 4, 3,0,1,0,0,0
L628:	fn_combi_t0 2, 0,0,0,0,0,0
L632:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 36 ---
L636:	fn_link  L616
	fn_link  L648
	fn_combi_t2 4, 3,0,1,0,0,0
L648:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L652:	fn_link  L664
	fn_link  L668
	fn_combi_t2 4, 3,0,1,0,0,0
L664:	fn_combi_t0 2, 0,0,0,0,0,0
L668:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 38 ---
L672:	fn_link  L652
	fn_link  L684
	fn_combi_t2 4, 3,0,1,0,0,0
L684:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 39 ---
L688:	fn_link  L700
	fn_link  L704
	fn_combi_t2 4, 3,0,1,0,0,0
L700:	fn_combi_t0 2, 0,0,0,0,0,0
L704:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 40 ---
L708:	fn_link  L688
	fn_link  L720
	fn_combi_t2 4, 3,0,1,0,0,0
L720:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
L724:	fn_link  L732
	fn_combi_t51 6, 0,1,2,3,4,5
L732:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L736:	fn_link  TribeLie.PuzzleAnswer
	fn_link  L724
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 43 ---
L748:	fn_link  L760
	fn_link  L764
	fn_combi_t54 6, 0,1,2,3,4,5
L760:	fn_combi_t37 6, 0,1,2,4,3,5
L764:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 44 ---
L768:	fn_link  L736
	fn_link  L748
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 45 ---
L780:	fn_link  L788
	fn_combi_t32 6, 0,1,3,4,5,2
L788:	fn_y
# --- block 46 ---
L792:	fn_link  L780
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 47 ---
L800:	fn_link  L708
	fn_link  L768
	fn_link  L792
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 48 ---
L816:	fn_link  L824
	fn_combi_t51 6, 0,1,2,3,4,5
L824:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 49 ---
L828:	fn_link  L836
	fn_combi_t32 6, 0,1,3,4,5,2
L836:	fn_y
# --- block 50 ---
L840:	fn_link  L828
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 51 ---
L848:	fn_link  L672
	fn_link  L800
	fn_link  L816
	fn_link  L840
	fn_combi_t33 6, 0,1,2,4,5,3
# --- block 52 ---
L868:	fn_link  L848
	fn_link  L880
	fn_combi_t51 6, 0,1,2,3,4,5
L880:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 53 ---
L884:	fn_link  L892
	fn_combi_t32 6, 0,1,3,4,5,2
L892:	fn_y
# --- block 54 ---
L896:	fn_link  L884
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 55 ---
L904:	fn_link  L636
	fn_link  L868
	fn_link  L896
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 56 ---
L920:	fn_link  L904
	fn_link  L932
	fn_combi_t18 5, 0,1,2,3,4,0
L932:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 57 ---
L936:	fn_link  L944
	fn_combi_t32 6, 0,1,3,4,5,2
L944:	fn_y
# --- block 58 ---
L948:	fn_link  L600
	fn_link  L920
	fn_link  L936
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 59 ---
L964:	fn_link  L948
	fn_link  L976
	fn_combi_t7 4, 0,1,2,3,0,0
L976:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 60 ---
L980:	fn_link  L988
	fn_combi_t32 6, 0,1,3,4,5,2
L988:	fn_y
# --- block 61 ---
L992:	fn_link  L564
	fn_link  L964
	fn_link  L980
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 62 ---
L1008:	fn_link  L992
	fn_link  L1020
	fn_combi_t3 3, 0,1,2,0,0,0
L1020:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 63 ---
L1024:	fn_link  L1032
	fn_combi_t32 6, 0,1,3,4,5,2
L1032:	fn_y
# --- block 64 ---
L1036:	fn_link  L528
	fn_link  L1008
	fn_link  L1024
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 65 ---
L1052:	fn_link  L1036
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 66 ---
L1060:	fn_link  L492
	fn_link  L1052
	fn_link  L1076
	fn_combi_t32 6, 0,1,3,4,5,2
L1076:	fn_y
# --- block 67 ---
L1080:	fn_link  L1060
	fn_link  L1092
	fn_combi_t6 4, 3,0,1,2,0,0
L1092:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 68 ---
TribeLie.PuzzleAnswer:	fn_link  L1108
	fn_link  L1112
	fn_combi_t51 6, 0,1,2,3,4,5
L1108:	fn_combi_t23 6, 5,0,1,2,3,4
L1112:	fn_combi_t23 6, 0,1,5,2,3,4

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
