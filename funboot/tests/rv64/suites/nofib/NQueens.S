# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/NQueens  (entry @0)
	.text
	.globl	NQueens.bench
	.globl	NQueens.nsoln
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.length
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  NQueens.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
NQueens.bench:	fn_link  L36
	fn_elink NQueens.nsoln
L36:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 3 ---
NQueens.nsoln:	fn_link  L648
	fn_link  L60
	fn_link  NanoPrelude.length
	fn_combi_t19 4, 0,1,2,3,3,0
L60:	fn_y
# --- block 4 ---
L64:	fn_link  L76
	fn_link  L80
	fn_combi_t2 4, 3,0,1,0,0,0
L76:	fn_combi_t0 2, 0,0,0,0,0,0
L80:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 5 ---
L84:	fn_link  L92
	fn_combi_t40 5, 0,0,3,1,2,4
L92:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 6 ---
L96:	fn_link  L108
	fn_link  L132
	fn_combi_t8 4, 2,0,3,1,0,0
L108:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L132:	fn_y
# --- block 7 ---
L136:	fn_link  L152
	fn_link  L156
	fn_link  L180
	fn_combi_t41 6, 0,4,5,1,3,2
L152:	fn_elink _prim_ne
L156:	fn_tor a0
	fn_tor a1
	subw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L180:	fn_y
# --- block 8 ---
L184:	fn_link  L196
	fn_link  L136
	fn_combi_t9 5, 0,2,3,4,1,0
L196:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 9 ---
L200:	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 10 ---
L208:	fn_link  L200
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 11 ---
L216:	fn_link  L96
	fn_link  L236
	fn_link  L184
	fn_link  L208
	fn_combi_t38 6, 0,1,4,2,3,5
L236:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 12 ---
L240:	fn_link  L256
	fn_link  L260
	fn_link  L284
	fn_combi_t41 6, 0,4,5,1,3,2
L256:	fn_elink _prim_ne
L260:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L284:	fn_y
# --- block 13 ---
L288:	fn_link  L300
	fn_link  L240
	fn_combi_t9 5, 0,2,3,4,1,0
L300:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L304:	fn_link  L324
	fn_link  L328
	fn_link  L332
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L324:	fn_combi_t0 2, 1,0,0,0,0,0
L328:	fn_combi_t0 2, 0,0,0,0,0,0
L332:	fn_elink _prim_ne
# --- block 15 ---
L336:	fn_link  L344
	fn_combi_t38 5, 0,1,4,2,3,4
L344:	fn_combi_t57 6, 0,1,2,3,4,5
# --- block 16 ---
L348:	fn_link  NanoPrelude.$26$26
	fn_link  L304
	fn_link  L336
	fn_combi_t38 6, 0,1,3,2,4,5
# --- block 17 ---
L364:	fn_link  L288
	fn_link  L348
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 18 ---
L376:	fn_link  L392
	fn_link  L364
	fn_link  L396
	fn_combi_t5 4, 0,1,3,2,0,0
L392:	fn_combi_t0 2, 1,0,0,0,0,0
L396:	fn_combi_t37 5, 0,2,4,1,3,4
# --- block 19 ---
L400:	fn_link  L408
	fn_combi_t48 5, 4,0,1,3,2,3
L408:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 20 ---
L412:	fn_link  L216
	fn_link  L376
	fn_link  L400
	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 21 ---
L428:	fn_link  L448
	fn_link  L456
	fn_link  L412
	fn_link  L460
	fn_combi_t27 6, 0,1,2,5,3,4
L448:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L456:	fn_combi_t0 1, 0,0,0,0,0,0
L460:	fn_y
# --- block 22 ---
L464:	fn_link  L428
	fn_link  L476
	fn_combi_t3 3, 0,1,2,0,0,0
L476:	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 23 ---
L480:	fn_link  L84
	fn_link  L464
	fn_link  L496
	fn_combi_t15 4, 0,1,3,2,3,0
L496:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 24 ---
L500:	fn_link  L480
	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 25 ---
L508:	fn_link  L516
	fn_combi_t44 6, 0,1,5,2,3,4
L516:	fn_y
# --- block 26 ---
L520:	fn_link  L508
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 27 ---
L528:	fn_link  L548
	fn_link  NanoPrelude.enumFromTo
	fn_link  L500
	fn_link  L520
	fn_combi_t24 6, 0,1,5,2,3,4
L548:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 28 ---
L556:	fn_link  L528
	fn_link  L568
	fn_combi_t16 5, 4,0,1,2,3,0
L568:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 29 ---
L572:	fn_link  L580
	fn_combi_t50 5, 0,1,3,0,4,2
L580:	fn_y
# --- block 30 ---
L584:	fn_link  L600
	fn_link  L556
	fn_link  L572
	fn_combi_t5 4, 0,1,3,2,0,0
L600:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 31 ---
L624:	fn_link  L636
	fn_link  L640
	fn_combi_t29 5, 4,0,1,2,4,3
L636:	fn_elink _prim_eq
L640:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 32 ---
L648:	fn_link  L64
	fn_link  L584
	fn_link  L624
	fn_combi_t12 5, 0,1,3,4,2,0
# --- block 33 ---
NanoPrelude.length:	fn_link  L676
	fn_link  L724
	fn_y
L676:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L684:	fn_link  L696
	fn_link  L720
	fn_combi_t8 5, 2,0,3,1,0,0
L696:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L720:	fn_y
# --- block 35 ---
L724:	fn_link  L684
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 36 ---
NanoPrelude.$26$26:	fn_link  L740
	fn_combi_t1 2, 1,0,0,0,0,0
L740:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L760
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 38 ---
L760:	fn_link  L776
	fn_link  L780
	fn_link  L784
	fn_combi_t10 5, 3,4,0,1,2,0
L776:	fn_combi_t0 2, 1,0,0,0,0,0
L780:	fn_combi_t0 2, 0,0,0,0,0,0
L784:	fn_elink _prim_le
# --- block 39 ---
NanoPrelude.takeWhile:	fn_link  L828
	fn_link  L800
	fn_combi_t3 3, 0,1,2,0,0,0
L800:	fn_y
# --- block 40 ---
L804:	fn_link  L812
	fn_combi_t6 4, 0,2,1,3,0,0
L812:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L816:	fn_link  L824
	fn_combi_t42 5, 1,3,0,2,3,4
L824:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
L828:	fn_link  L804
	fn_link  L816
	fn_link  L844
	fn_combi_t48 6, 5,0,1,3,2,4
L844:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 43 ---
NanoPrelude.enumFrom:	fn_link  L868
	fn_link  L892
	fn_link  NanoPrelude.enumFrom
	fn_link  L896
	fn_combi_t50 5, 0,4,1,2,4,3
L868:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L892:	fn_y
L896:	fn_combi_t2 4, 3,0,1,0,0,0

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
