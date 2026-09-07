# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Queens2  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.concatMap
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.replicate
	.globl	NanoPrelude.tail
	.globl	Primitives.primPerformIO
	.globl	Queens2.down
	.globl	Queens2.eq
	.globl	Queens2.fill
	.globl	Queens2.left
	.globl	Queens2.lrd
	.globl	Queens2.main
	.globl	Queens2.merge
	.globl	Queens2.next
	.globl	Queens2.nqueens
	.globl	Queens2.one
	.globl	Queens2.right
	.globl	Queens2.sol
	.globl	Queens2.solve
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Queens2.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Queens2.main:	fn_link  L36
	fn_elink Queens2.nqueens
L36:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 3 ---
Queens2.nqueens:	fn_link  L64
	fn_link  NanoPrelude.replicate
	fn_link  Queens2.solve
	fn_link  NanoPrelude.length
	fn_combi_t58 5, 0,1,4,2,4,3
L64:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 4 ---
NanoPrelude.length:	fn_link  L80
	fn_link  L128
	fn_y
L80:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L88:	fn_link  L100
	fn_link  L124
	fn_combi_t8 5, 2,0,3,1,0,0
L100:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L124:	fn_y
# --- block 6 ---
L128:	fn_link  L88
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 7 ---
Queens2.solve:	fn_link  L148
	fn_link  L240
	fn_combi_t4 4, 0,2,3,1,0,0
# --- block 8 ---
L148:	fn_link  L160
	fn_link  L164
	fn_combi_t2 4, 3,0,1,0,0,0
L160:	fn_combi_t0 2, 0,0,0,0,0,0
L164:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 9 ---
L168:	fn_link  L188
	fn_link  L212
	fn_link  Queens2.sol
	fn_link  Data.List_Type.concatMap
	fn_combi_t22 5, 0,1,2,4,3,0
L188:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L212:	fn_y
# --- block 10 ---
L216:	fn_link  L228
	fn_link  L232
	fn_combi_t45 6, 0,4,1,2,3,5
L228:	fn_elink _prim_eq
L232:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L240:	fn_link  Queens2.fill
	fn_link  L168
	fn_link  L216
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 12 ---
Data.List_Type.concatMap:	fn_link  L280
	fn_link  L268
	fn_combi_t3 3, 0,1,2,0,0,0
L268:	fn_y
# --- block 13 ---
L272:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 14 ---
L280:	fn_link  L272
	fn_link  L292
	fn_combi_t16 5, 4,0,1,2,3,0
L292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 15 ---
Data.List_Type.$2b$2b:	fn_link  L324
	fn_link  L308
	fn_combi_t5 4, 0,1,3,2,0,0
L308:	fn_y
# --- block 16 ---
L312:	fn_link  L320
	fn_combi_t6 4, 0,2,1,3,0,0
L320:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L324:	fn_link  L312
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 18 ---
Queens2.sol:	fn_link  L352
	fn_link  L348
	fn_link  NanoPrelude.map
	fn_combi_t44 5, 0,1,4,2,3,4
L348:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
L352:	fn_link  Queens2.next
	fn_link  Queens2.solve
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 20 ---
NanoPrelude.map:	fn_link  L392
	fn_link  L376
	fn_combi_t3 3, 0,1,2,0,0,0
L376:	fn_y
# --- block 21 ---
L380:	fn_link  L388
	fn_combi_t15 5, 0,1,3,2,4,0
L388:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 22 ---
L392:	fn_link  L380
	fn_link  L404
	fn_combi_t16 5, 4,0,1,2,3,0
L404:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 23 ---
Queens2.next:	fn_link  Queens2.right
	fn_link  L420
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 24 ---
L420:	fn_link  Queens2.left
	fn_link  Queens2.down
	fn_link  Queens2.merge
	fn_link  Queens2.merge
	fn_combi_t57 5, 0,1,2,4,3,4
# --- block 25 ---
Queens2.merge:	fn_link  L496
	fn_link  L452
	fn_combi_t6 4, 2,0,1,3,0,0
L452:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
L456:	fn_link  Data.List_Type.$2b$2b
	fn_link  L468
	fn_combi_t40 6, 0,1,2,4,3,5
L468:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 27 ---
L472:	fn_link  Queens2.merge
	fn_link  L456
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 28 ---
L484:	fn_link  L492
	fn_combi_t40 5, 1,0,3,4,2,4
L492:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 29 ---
L496:	fn_link  L472
	fn_link  L484
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 30 ---
Queens2.down:	fn_link  L532
	fn_elink NanoPrelude.map
# --- block 31 ---
L516:	fn_link  L524
	fn_elink Queens2.eq
L524:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 32 ---
L532:	fn_link  L516
	fn_elink Queens2.one
# --- block 33 ---
Queens2.one:	fn_link  L576
	fn_link  L552
	fn_combi_t3 3, 0,1,2,0,0,0
L552:	fn_y
# --- block 34 ---
L556:	fn_link  L564
	fn_combi_t2 4, 3,1,0,0,0,0
L564:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
L568:	fn_link  L556
	fn_combi_t39 5, 1,3,2,4,0,3
# --- block 36 ---
L576:	fn_link  L568
	fn_link  L588
	fn_combi_t16 5, 4,0,1,2,3,0
L588:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
Queens2.eq:	fn_link  L608
	fn_link  L612
	fn_link  L616
	fn_combi_t10 5, 4,3,0,1,2,0
L608:	fn_combi_t0 2, 1,0,0,0,0,0
L612:	fn_combi_t0 2, 0,0,0,0,0,0
L616:	fn_elink _prim_eq
# --- block 38 ---
Queens2.left:	fn_link  NanoPrelude.tail
	fn_link  L644
	fn_link  Queens2.eq
	fn_link  Queens2.one
	fn_link  NanoPrelude.map
	fn_combi_t41 6, 0,1,2,3,4,5
L644:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 39 ---
NanoPrelude.tail:	fn_link  L664
	fn_link  L668
	fn_combi_t2 3, 2,0,1,0,0,0
L664:	fn_combi_t0 2, 1,0,0,0,0,0
L668:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 40 ---
Queens2.right:	fn_link  L720
	fn_link  L688
	fn_link  L692
	fn_combi_t6 4, 0,1,2,3,0,0
L688:	fn_combi_t0 2, 0,0,0,0,0,0
L692:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L696:	fn_link  L704
	fn_elink Queens2.eq
L704:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 42 ---
L712:	fn_link  L696
	fn_elink Queens2.one
# --- block 43 ---
L720:	fn_link  L712
	fn_elink NanoPrelude.map
# --- block 44 ---
Queens2.fill:	fn_link  L776
	fn_link  L740
	fn_combi_t2 3, 2,0,1,0,0,0
L740:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L744:	fn_link  Queens2.fill
	fn_link  L760
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,3,2,4,0
L760:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 46 ---
L764:	fn_link  Queens2.lrd
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 47 ---
L776:	fn_link  L744
	fn_link  L764
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 48 ---
Queens2.lrd:	fn_link  L800
	fn_link  L876
	fn_combi_t5 4, 2,0,3,1,0,0
# --- block 49 ---
L800:	fn_link  L808
	fn_combi_t0 3, 0,0,0,0,0,0
L808:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 50 ---
L812:	fn_link  L824
	fn_link  L828
	fn_combi_t2 4, 3,0,1,0,0,0
L824:	fn_combi_t0 2, 0,0,0,0,0,0
L828:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 51 ---
L836:	fn_link  L812
	fn_link  L848
	fn_combi_t2 4, 3,0,1,0,0,0
L848:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 52 ---
L856:	fn_link  L836
	fn_link  L868
	fn_combi_t2 4, 3,0,1,0,0,0
L868:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 53 ---
L876:	fn_link  L892
	fn_link  L856
	fn_link  L896
	fn_combi_t12 6, 5,0,1,3,2,0
L892:	fn_combi_t0 2, 0,0,0,0,0,0
L896:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 54 ---
NanoPrelude.replicate:	fn_link  L916
	fn_link  L988
	fn_link  L1000
	fn_combi_t10 4, 0,1,3,2,3,0
L916:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 55 ---
L920:	fn_link  L936
	fn_link  L960
	fn_link  NanoPrelude.replicate
	fn_combi_t8 4, 0,1,3,2,0,0
L936:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L960:	fn_y
# --- block 56 ---
L964:	fn_link  L980
	fn_link  L984
	fn_link  Data.Bool_Type.True
	fn_combi_t48 5, 0,1,2,4,3,4
L980:	fn_combi_t2 4, 3,0,1,0,0,0
L984:	fn_elink _error0
# --- block 57 ---
L988:	fn_link  L920
	fn_link  L964
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 58 ---
L1000:	fn_link  L1012
	fn_link  L1016
	fn_combi_t29 6, 0,4,1,2,5,3
L1012:	fn_elink _prim_le
L1016:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 59 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0

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
