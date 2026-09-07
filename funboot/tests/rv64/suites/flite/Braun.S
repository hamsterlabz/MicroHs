# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Braun  (entry @0)
	.text
	.globl	Braun.equal
	.globl	Braun.fromList$27
	.globl	Braun.ilv
	.globl	Braun.int
	.globl	Braun.main
	.globl	Braun.prop
	.globl	Braun.toList
	.globl	Braun.unravel
	.globl	Data.Bool_Type.True
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.all
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.replicate
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Braun.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Braun.main:	fn_link  L84
	fn_elink Braun.int
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L56
	fn_elink NanoPrelude.enumFromTo
L48:	fn_box
	.word 0x000000ff	# raw word 255
	fn_box_body
L56:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L64:	fn_link  L36
	fn_link  L76
	fn_elink NanoPrelude.replicate
L76:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 5 ---
L84:	fn_link  L64
	fn_link  Braun.prop
	fn_elink NanoPrelude.all
# --- block 6 ---
Braun.int:	fn_link  L108
	fn_link  L116
	fn_combi_t2 3, 2,0,1,0,0,0
L108:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L116:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 7 ---
NanoPrelude.all:	fn_link  L148
	fn_link  L136
	fn_combi_t3 3, 0,1,2,0,0,0
L136:	fn_y
# --- block 8 ---
L140:	fn_link  NanoPrelude.$26$26
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 9 ---
L148:	fn_link  L140
	fn_link  L160
	fn_combi_t16 5, 4,0,1,2,3,0
L160:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 10 ---
NanoPrelude.$26$26:	fn_link  L172
	fn_combi_t1 2, 1,0,0,0,0,0
L172:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 11 ---
Braun.prop:	fn_link  Braun.fromList$27
	fn_link  Braun.toList
	fn_link  Braun.equal
	fn_combi_t17 4, 0,3,1,2,3,0
# --- block 12 ---
Braun.equal:	fn_link  L232
	fn_link  L252
	fn_link  L208
	fn_combi_t40 5, 3,4,0,1,2,4
L208:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 13 ---
L212:	fn_link  L224
	fn_link  L228
	fn_combi_t38 6, 4,2,0,1,3,5
L224:	fn_combi_t0 2, 0,0,0,0,0,0
L228:	fn_elink _prim_eq
# --- block 14 ---
L232:	fn_link  Braun.equal
	fn_link  L212
	fn_link  L248
	fn_combi_t48 6, 3,0,1,4,2,5
L248:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 15 ---
L252:	fn_link  L260
	fn_combi_t0 3, 0,0,0,0,0,0
L260:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
Braun.toList:	fn_link  L276
	fn_link  L292
	fn_combi_t2 3, 2,0,1,0,0,0
L276:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 17 ---
L280:	fn_link  Braun.toList
	fn_link  Braun.ilv
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 18 ---
L292:	fn_link  L280
	fn_link  L304
	fn_combi_t16 5, 0,2,1,3,4,0
L304:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 19 ---
Braun.ilv:	fn_link  L360
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 20 ---
L316:	fn_link  Braun.ilv
	fn_link  L328
	fn_combi_t16 5, 0,3,1,2,4,0
L328:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
L332:	fn_link  L316
	fn_link  L344
	fn_combi_t46 6, 0,2,1,3,4,5
L344:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 22 ---
L348:	fn_link  L356
	fn_combi_t40 5, 1,0,3,4,2,4
L356:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L360:	fn_link  L332
	fn_link  L348
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 24 ---
Braun.fromList$27:	fn_link  L432
	fn_link  L384
	fn_combi_t2 3, 2,0,1,0,0,0
L384:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 25 ---
L388:	fn_link  L404
	fn_link  Braun.fromList$27
	fn_link  L408
	fn_combi_t17 5, 0,3,1,4,2,0
L404:	fn_combi_t0 2, 0,0,0,0,0,0
L408:	fn_combi_t4 5, 3,0,1,2,0,0
# --- block 26 ---
L412:	fn_link  L428
	fn_link  Braun.fromList$27
	fn_link  L388
	fn_combi_t43 5, 0,3,4,1,4,2
L428:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 27 ---
L432:	fn_link  Braun.unravel
	fn_link  L412
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 28 ---
Braun.unravel:	fn_link  L500
	fn_link  L512
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 29 ---
L456:	fn_link  L464
	fn_combi_t1 2, 1,0,0,0,0,0
L464:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 30 ---
L468:	fn_link  L480
	fn_link  L484
	fn_combi_t34 6, 5,0,2,4,1,3
L480:	fn_combi_t0 2, 1,0,0,0,0,0
L484:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
L488:	fn_link  L456
	fn_link  L468
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 32 ---
L500:	fn_link  Braun.unravel
	fn_link  L488
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 33 ---
L512:	fn_link  L520
	fn_combi_t2 2, 1,0,0,0,0,0
L520:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 34 ---
NanoPrelude.replicate:	fn_link  L540
	fn_link  L612
	fn_link  L624
	fn_combi_t10 4, 0,1,3,2,3,0
L540:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
L544:	fn_link  L560
	fn_link  L584
	fn_link  NanoPrelude.replicate
	fn_combi_t8 4, 0,1,3,2,0,0
L560:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L584:	fn_y
# --- block 36 ---
L588:	fn_link  L604
	fn_link  L608
	fn_link  Data.Bool_Type.True
	fn_combi_t48 5, 0,1,2,4,3,4
L604:	fn_combi_t2 4, 3,0,1,0,0,0
L608:	fn_elink _error0
# --- block 37 ---
L612:	fn_link  L544
	fn_link  L588
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 38 ---
L624:	fn_link  L636
	fn_link  L640
	fn_combi_t29 6, 0,4,1,2,5,3
L636:	fn_elink _prim_le
L640:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 39 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 40 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L668
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 41 ---
L668:	fn_link  L684
	fn_link  L688
	fn_link  L692
	fn_combi_t10 5, 3,4,0,1,2,0
L684:	fn_combi_t0 2, 1,0,0,0,0,0
L688:	fn_combi_t0 2, 0,0,0,0,0,0
L692:	fn_elink _prim_le
# --- block 42 ---
NanoPrelude.takeWhile:	fn_link  L736
	fn_link  L708
	fn_combi_t3 3, 0,1,2,0,0,0
L708:	fn_y
# --- block 43 ---
L712:	fn_link  L720
	fn_combi_t6 4, 0,2,1,3,0,0
L720:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 44 ---
L724:	fn_link  L732
	fn_combi_t42 5, 1,3,0,2,3,4
L732:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 45 ---
L736:	fn_link  L712
	fn_link  L724
	fn_link  L752
	fn_combi_t48 6, 5,0,1,3,2,4
L752:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
NanoPrelude.enumFrom:	fn_link  L776
	fn_link  L800
	fn_link  NanoPrelude.enumFrom
	fn_link  L804
	fn_combi_t50 5, 0,4,1,2,4,3
L776:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L800:	fn_y
L804:	fn_combi_t2 4, 3,0,1,0,0,0

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
