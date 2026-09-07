# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Mss  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.concatMap
	.globl	Mss.inits
	.globl	Mss.main
	.globl	Mss.mss
	.globl	Mss.segments
	.globl	Mss.tails
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.init
	.globl	NanoPrelude.map
	.globl	NanoPrelude.maximum
	.globl	NanoPrelude.sum
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Mss.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Mss.main:	fn_link  L80
	fn_elink Mss.mss
# --- block 3 ---
L36:	fn_link  L48
	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L48:	fn_force
	fn_tor a0
	addiw a0,a0,-20
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 4 ---
L72:	fn_link  L36
	fn_y
# --- block 5 ---
L80:	fn_link  L92
	fn_link  L72
	fn_elink NanoPrelude.enumFromTo
L92:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
# --- block 6 ---
Mss.mss:	fn_link  Mss.segments
	fn_link  NanoPrelude.sum
	fn_link  NanoPrelude.map
	fn_link  NanoPrelude.maximum
	fn_combi_t20 5, 0,1,2,3,4,0
# --- block 7 ---
NanoPrelude.maximum:	fn_link  L156
	fn_link  NanoPrelude.foldr
	fn_link  L136
	fn_combi_t6 4, 3,0,1,2,0,0
L136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L144:	fn_link  L152
	fn_combi_t10 3, 2,1,0,2,1,0
L152:	fn_elink _prim_gt
# --- block 9 ---
L156:	fn_link  L168
	fn_link  L144
	fn_combi_t3 3, 0,1,2,0,0,0
L168:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 10 ---
NanoPrelude.foldr:	fn_link  L188
	fn_link  L184
	fn_combi_t7 4, 0,1,2,3,0,0
L184:	fn_y
# --- block 11 ---
L188:	fn_link  L196
	fn_combi_t16 5, 4,2,0,1,3,0
L196:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 12 ---
NanoPrelude.map:	fn_link  L228
	fn_link  L212
	fn_combi_t3 3, 0,1,2,0,0,0
L212:	fn_y
# --- block 13 ---
L216:	fn_link  L224
	fn_combi_t15 5, 0,1,3,2,4,0
L224:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 14 ---
L228:	fn_link  L216
	fn_link  L240
	fn_combi_t16 5, 4,0,1,2,3,0
L240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 15 ---
NanoPrelude.sum:	fn_link  L256
	fn_link  L264
	fn_elink NanoPrelude.foldr
L256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 16 ---
L264:	fn_link  L276
	fn_link  L300
	fn_combi_t8 4, 0,3,2,1,0,0
L276:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L300:	fn_y
# --- block 17 ---
Mss.segments:	fn_link  Mss.inits
	fn_link  Mss.tails
	fn_link  Data.List_Type.concatMap
	fn_combi_t6 4, 0,1,2,3,0,0
# --- block 18 ---
Data.List_Type.concatMap:	fn_link  L344
	fn_link  L332
	fn_combi_t3 3, 0,1,2,0,0,0
L332:	fn_y
# --- block 19 ---
L336:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 20 ---
L344:	fn_link  L336
	fn_link  L356
	fn_combi_t16 5, 4,0,1,2,3,0
L356:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 21 ---
Data.List_Type.$2b$2b:	fn_link  L388
	fn_link  L372
	fn_combi_t5 4, 0,1,3,2,0,0
L372:	fn_y
# --- block 22 ---
L376:	fn_link  L384
	fn_combi_t6 4, 0,2,1,3,0,0
L384:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L388:	fn_link  L376
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 24 ---
Mss.tails:	fn_link  L412
	fn_link  L408
	fn_combi_t2 3, 2,0,1,0,0,0
L408:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 25 ---
L412:	fn_link  Mss.tails
	fn_link  L424
	fn_combi_t40 4, 0,0,2,3,1,3
L424:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
Mss.inits:	fn_link  L444
	fn_link  L448
	fn_link  L468
	fn_combi_t17 4, 3,0,1,2,3,0
L444:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 27 ---
L448:	fn_link  NanoPrelude.init
	fn_link  Mss.inits
	fn_link  L464
	fn_combi_t17 6, 0,3,1,2,3,0
L464:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 28 ---
L468:	fn_link  L480
	fn_link  L484
	fn_combi_t2 4, 3,0,1,0,0,0
L480:	fn_combi_t0 2, 0,0,0,0,0,0
L484:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 29 ---
NanoPrelude.init:	fn_link  L520
	fn_link  L500
	fn_combi_t2 3, 2,0,1,0,0,0
L500:	fn_elink _error0
# --- block 30 ---
L504:	fn_link  NanoPrelude.init
	fn_link  L516
	fn_combi_t6 6, 0,2,1,3,0,0
L516:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
L520:	fn_link  L504
	fn_link  L532
	fn_combi_t16 4, 3,0,1,2,3,0
L532:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 32 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L552
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 33 ---
L552:	fn_link  L568
	fn_link  L572
	fn_link  L576
	fn_combi_t10 5, 3,4,0,1,2,0
L568:	fn_combi_t0 2, 1,0,0,0,0,0
L572:	fn_combi_t0 2, 0,0,0,0,0,0
L576:	fn_elink _prim_le
# --- block 34 ---
NanoPrelude.takeWhile:	fn_link  L620
	fn_link  L592
	fn_combi_t3 3, 0,1,2,0,0,0
L592:	fn_y
# --- block 35 ---
L596:	fn_link  L604
	fn_combi_t6 4, 0,2,1,3,0,0
L604:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L608:	fn_link  L616
	fn_combi_t42 5, 1,3,0,2,3,4
L616:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L620:	fn_link  L596
	fn_link  L608
	fn_link  L636
	fn_combi_t48 6, 5,0,1,3,2,4
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
NanoPrelude.enumFrom:	fn_link  L660
	fn_link  L684
	fn_link  NanoPrelude.enumFrom
	fn_link  L688
	fn_combi_t50 5, 0,4,1,2,4,3
L660:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L684:	fn_y
L688:	fn_combi_t2 4, 3,0,1,0,0,0

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
_unimpprim_addiw$20$2d20:
	la a0, _unimpprim_addiw$20$2d20$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d20$name:
	.asciz "addiw -20"
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
