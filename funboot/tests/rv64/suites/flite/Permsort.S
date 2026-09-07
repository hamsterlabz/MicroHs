# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Permsort  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.concatMap
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.head
	.globl	NanoPrelude.map
	.globl	Permsort.main
	.globl	Permsort.ord
	.globl	Permsort.perm
	.globl	Permsort.permSort
	.globl	Permsort.place
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Permsort.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Permsort.main:	fn_link  L180
	fn_elink NanoPrelude.head
# --- block 3 ---
L36:	fn_link  L48
	fn_link  L52
	fn_combi_t2 4, 3,0,1,0,0,0
L48:	fn_combi_t0 2, 0,0,0,0,0,0
L52:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 4 ---
L60:	fn_link  L36
	fn_link  L72
	fn_combi_t2 4, 3,0,1,0,0,0
L72:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 5 ---
L80:	fn_link  L60
	fn_link  L92
	fn_combi_t2 4, 3,0,1,0,0,0
L92:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 6 ---
L100:	fn_link  L80
	fn_link  L112
	fn_combi_t2 4, 3,0,1,0,0,0
L112:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 7 ---
L120:	fn_link  L100
	fn_link  L132
	fn_combi_t2 4, 3,0,1,0,0,0
L132:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 8 ---
L140:	fn_link  L120
	fn_link  L152
	fn_combi_t2 4, 3,0,1,0,0,0
L152:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 9 ---
L160:	fn_link  L140
	fn_link  L172
	fn_combi_t2 4, 3,0,1,0,0,0
L172:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 10 ---
L180:	fn_link  L160
	fn_elink Permsort.permSort
# --- block 11 ---
NanoPrelude.head:	fn_link  L200
	fn_link  L204
	fn_combi_t2 3, 2,0,1,0,0,0
L200:	fn_combi_t0 2, 0,0,0,0,0,0
L204:	fn_elink _error0
# --- block 12 ---
Permsort.permSort:	fn_link  Permsort.perm
	fn_link  Permsort.ord
	fn_link  NanoPrelude.filter
	fn_link  NanoPrelude.head
	fn_combi_t20 5, 0,1,2,3,4,0
# --- block 13 ---
NanoPrelude.filter:	fn_link  L292
	fn_link  L240
	fn_combi_t3 3, 0,1,2,0,0,0
L240:	fn_y
# --- block 14 ---
L244:	fn_link  L256
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L256:	fn_elink _error0
# --- block 15 ---
L260:	fn_link  L268
	fn_combi_t24 5, 0,1,4,2,3,4
L268:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 16 ---
L272:	fn_link  L288
	fn_link  L244
	fn_link  L260
	fn_combi_t26 5, 0,1,3,4,2,4
L288:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L292:	fn_link  L272
	fn_link  L304
	fn_combi_t16 5, 4,0,1,2,3,0
L304:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 18 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 19 ---
Permsort.ord:	fn_link  L388
	fn_link  L324
	fn_combi_t2 3, 2,0,1,0,0,0
L324:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 20 ---
L328:	fn_link  L348
	fn_link  L352
	fn_link  L356
	fn_link  NanoPrelude.$26$26
	fn_combi_t52 6, 0,5,4,1,2,3
L348:	fn_combi_t0 2, 1,0,0,0,0,0
L352:	fn_combi_t0 2, 0,0,0,0,0,0
L356:	fn_elink _prim_le
# --- block 21 ---
L360:	fn_link  L380
	fn_link  Permsort.ord
	fn_link  L328
	fn_link  L384
	fn_combi_t10 5, 0,1,4,2,3,0
L380:	fn_combi_t2 4, 3,0,1,0,0,0
L384:	fn_combi_t49 5, 0,3,1,2,3,4
# --- block 22 ---
L388:	fn_link  L360
	fn_link  L400
	fn_combi_t6 4, 3,0,1,2,0,0
L400:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 23 ---
NanoPrelude.$26$26:	fn_link  L412
	fn_combi_t1 2, 1,0,0,0,0,0
L412:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 24 ---
Permsort.perm:	fn_link  L428
	fn_link  L444
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 25 ---
L428:	fn_link  Permsort.perm
	fn_link  Permsort.place
	fn_link  Data.List_Type.concatMap
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 26 ---
L444:	fn_link  L456
	fn_link  L460
	fn_combi_t2 4, 3,0,1,0,0,0
L456:	fn_combi_t0 2, 0,0,0,0,0,0
L460:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
Data.List_Type.concatMap:	fn_link  L488
	fn_link  L476
	fn_combi_t3 3, 0,1,2,0,0,0
L476:	fn_y
# --- block 28 ---
L480:	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 5, 0,1,3,2,4,0
# --- block 29 ---
L488:	fn_link  L480
	fn_link  L500
	fn_combi_t16 5, 4,0,1,2,3,0
L500:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 30 ---
Data.List_Type.$2b$2b:	fn_link  L532
	fn_link  L516
	fn_combi_t5 4, 0,1,3,2,0,0
L516:	fn_y
# --- block 31 ---
L520:	fn_link  L528
	fn_combi_t6 4, 0,2,1,3,0,0
L528:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 32 ---
L532:	fn_link  L520
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 33 ---
Permsort.place:	fn_link  L564
	fn_link  L592
	fn_link  L636
	fn_link  L560
	fn_combi_t53 5, 0,1,4,2,4,3
L560:	fn_y
# --- block 34 ---
L564:	fn_link  L576
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,3,2,4,0
L576:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 35 ---
L580:	fn_link  L588
	fn_combi_t58 4, 0,0,1,0,2,3
L588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L592:	fn_link  L580
	fn_link  L604
	fn_combi_t3 3, 0,1,2,0,0,0
L604:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 37 ---
L608:	fn_link  L616
	fn_combi_t2 4, 3,1,0,0,0,0
L616:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
L620:	fn_link  L632
	fn_link  L608
	fn_combi_t5 5, 4,0,2,1,0,0
L632:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 39 ---
L636:	fn_link  L620
	fn_combi_t45 6, 5,0,1,2,3,4
# --- block 40 ---
NanoPrelude.map:	fn_link  L672
	fn_link  L656
	fn_combi_t3 3, 0,1,2,0,0,0
L656:	fn_y
# --- block 41 ---
L660:	fn_link  L668
	fn_combi_t15 5, 0,1,3,2,4,0
L668:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L672:	fn_link  L660
	fn_link  L684
	fn_combi_t16 5, 4,0,1,2,3,0
L684:	fn_combi_t0 2, 0,0,0,0,0,0

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
