# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/SumEuler  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.length
	.globl	NanoPrelude.map
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.sum
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	SumEuler.euler
	.globl	SumEuler.hcf
	.globl	SumEuler.main
	.globl	SumEuler.relprime
	.globl	SumEuler.totients
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  SumEuler.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
SumEuler.main:	fn_link  L36
	fn_elink NanoPrelude.sum
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L56
	fn_elink SumEuler.totients
L48:	fn_box
	.word 0x0000001e	# raw word 30
	fn_box_body
L56:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 4 ---
NanoPrelude.sum:	fn_link  L76
	fn_link  L84
	fn_elink NanoPrelude.foldr
L76:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 5 ---
L84:	fn_link  L96
	fn_link  L120
	fn_combi_t8 4, 0,3,2,1,0,0
L96:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L120:	fn_y
# --- block 6 ---
NanoPrelude.foldr:	fn_link  L140
	fn_link  L136
	fn_combi_t7 4, 0,1,2,3,0,0
L136:	fn_y
# --- block 7 ---
L140:	fn_link  L148
	fn_combi_t16 5, 4,2,0,1,3,0
L148:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 8 ---
SumEuler.totients:	fn_link  L164
	fn_link  L208
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 9 ---
L164:	fn_link  L180
	fn_link  L204
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L180:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L204:	fn_y
# --- block 10 ---
L208:	fn_link  L224
	fn_link  SumEuler.euler
	fn_link  NanoPrelude.map
	fn_combi_t48 6, 0,1,2,4,3,5
L224:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
NanoPrelude.map:	fn_link  L256
	fn_link  L240
	fn_combi_t3 3, 0,1,2,0,0,0
L240:	fn_y
# --- block 12 ---
L244:	fn_link  L252
	fn_combi_t15 5, 0,1,3,2,4,0
L252:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 13 ---
L256:	fn_link  L244
	fn_link  L268
	fn_combi_t16 5, 4,0,1,2,3,0
L268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
SumEuler.euler:	fn_link  L292
	fn_link  SumEuler.relprime
	fn_link  NanoPrelude.filter
	fn_link  NanoPrelude.length
	fn_combi_t57 5, 0,1,2,4,3,4
# --- block 15 ---
L292:	fn_link  L312
	fn_link  L336
	fn_link  L340
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t17 5, 0,1,2,4,3,0
L312:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L336:	fn_y
L340:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 16 ---
NanoPrelude.length:	fn_link  L360
	fn_link  L408
	fn_y
L360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 17 ---
L368:	fn_link  L380
	fn_link  L404
	fn_combi_t8 5, 2,0,3,1,0,0
L380:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L404:	fn_y
# --- block 18 ---
L408:	fn_link  L368
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 19 ---
NanoPrelude.filter:	fn_link  L480
	fn_link  L428
	fn_combi_t3 3, 0,1,2,0,0,0
L428:	fn_y
# --- block 20 ---
L432:	fn_link  L444
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L444:	fn_elink _error0
# --- block 21 ---
L448:	fn_link  L456
	fn_combi_t24 5, 0,1,4,2,3,4
L456:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 22 ---
L460:	fn_link  L476
	fn_link  L432
	fn_link  L448
	fn_combi_t26 5, 0,1,3,4,2,4
L476:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L480:	fn_link  L460
	fn_link  L492
	fn_combi_t16 5, 4,0,1,2,3,0
L492:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 25 ---
SumEuler.relprime:	fn_link  L512
	fn_link  L516
	fn_combi_t4 4, 0,2,3,1,0,0
L512:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 26 ---
L516:	fn_link  L536
	fn_link  L540
	fn_link  SumEuler.hcf
	fn_link  L544
	fn_combi_t32 6, 0,1,4,5,2,3
L536:	fn_combi_t0 2, 0,0,0,0,0,0
L540:	fn_elink _prim_eq
L544:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 27 ---
SumEuler.hcf:	fn_link  L564
	fn_link  L576
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 28 ---
L564:	fn_link  NanoPrelude.rem
	fn_link  SumEuler.hcf
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 29 ---
L576:	fn_link  L588
	fn_link  L592
	fn_combi_t29 5, 4,0,1,2,4,3
L588:	fn_elink _prim_eq
L592:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 30 ---
NanoPrelude.rem:	fn_link  L612
	fn_link  L636
	fn_combi_t8 4, 0,3,2,1,0,0
L612:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L636:	fn_y
# --- block 31 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L656
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 32 ---
L656:	fn_link  L672
	fn_link  L676
	fn_link  L680
	fn_combi_t10 5, 3,4,0,1,2,0
L672:	fn_combi_t0 2, 1,0,0,0,0,0
L676:	fn_combi_t0 2, 0,0,0,0,0,0
L680:	fn_elink _prim_le
# --- block 33 ---
NanoPrelude.takeWhile:	fn_link  L724
	fn_link  L696
	fn_combi_t3 3, 0,1,2,0,0,0
L696:	fn_y
# --- block 34 ---
L700:	fn_link  L708
	fn_combi_t6 4, 0,2,1,3,0,0
L708:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 35 ---
L712:	fn_link  L720
	fn_combi_t42 5, 1,3,0,2,3,4
L720:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 36 ---
L724:	fn_link  L700
	fn_link  L712
	fn_link  L740
	fn_combi_t48 6, 5,0,1,3,2,4
L740:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
NanoPrelude.enumFrom:	fn_link  L764
	fn_link  L788
	fn_link  NanoPrelude.enumFrom
	fn_link  L792
	fn_combi_t50 5, 0,4,1,2,4,3
L764:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L788:	fn_y
L792:	fn_combi_t2 4, 3,0,1,0,0,0

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
