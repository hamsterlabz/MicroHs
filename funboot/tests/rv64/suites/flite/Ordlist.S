# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Ordlist  (entry @0)
	.text
	.globl	Data.List_Type.$2b$2b
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.and
	.globl	NanoPrelude.map
	.globl	Ordlist.boolList
	.globl	Ordlist.implies
	.globl	Ordlist.ins
	.globl	Ordlist.main
	.globl	Ordlist.ord
	.globl	Ordlist.prop
	.globl	Ordlist.top
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Ordlist.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Ordlist.main:	fn_link  L44
	fn_link  L52
	fn_link  L88
	fn_elink Ordlist.top
L44:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L52:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
L60:	fn_link  L68
	fn_combi_t1 3, 1,0,0,0,0,0
L68:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 4 ---
L72:	fn_link  L60
	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 5 ---
L80:	fn_link  L72
	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 6 ---
L88:	fn_link  L80
	fn_combi_t1 3, 1,0,0,0,0,0
# --- block 7 ---
Ordlist.top:	fn_link  L120
	fn_link  L144
	fn_link  NanoPrelude.and
	fn_link  L116
	fn_combi_t48 5, 0,1,2,4,3,4
L116:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 8 ---
L120:	fn_link  Ordlist.boolList
	fn_link  L140
	fn_link  Ordlist.prop
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,2,3,4,0
L140:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 9 ---
L144:	fn_link  Ordlist.boolList
	fn_link  L168
	fn_link  Ordlist.prop
	fn_link  NanoPrelude.map
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t57 6, 0,1,2,3,4,5
L168:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 10 ---
NanoPrelude.and:	fn_link  L188
	fn_link  L184
	fn_combi_t2 3, 2,0,1,0,0,0
L184:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 11 ---
L188:	fn_link  NanoPrelude.and
	fn_link  L200
	fn_combi_t6 4, 2,0,1,3,0,0
L200:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
Data.List_Type.$2b$2b:	fn_link  L232
	fn_link  L216
	fn_combi_t5 4, 0,1,3,2,0,0
L216:	fn_y
# --- block 13 ---
L220:	fn_link  L228
	fn_combi_t6 4, 0,2,1,3,0,0
L228:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 14 ---
L232:	fn_link  L220
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 15 ---
NanoPrelude.map:	fn_link  L268
	fn_link  L252
	fn_combi_t3 3, 0,1,2,0,0,0
L252:	fn_y
# --- block 16 ---
L256:	fn_link  L264
	fn_combi_t15 5, 0,1,3,2,4,0
L264:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 17 ---
L268:	fn_link  L256
	fn_link  L280
	fn_combi_t16 5, 4,0,1,2,3,0
L280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 18 ---
Ordlist.prop:	fn_link  L300
	fn_link  Ordlist.ord
	fn_link  Ordlist.implies
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 19 ---
L300:	fn_link  Ordlist.ins
	fn_link  Ordlist.ord
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 20 ---
Ordlist.implies:	fn_link  L320
	fn_combi_t1 2, 1,0,0,0,0,0
L320:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 21 ---
Ordlist.ord:	fn_link  L380
	fn_link  L336
	fn_combi_t2 3, 2,0,1,0,0,0
L336:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 22 ---
L340:	fn_link  L352
	fn_link  Ordlist.ord
	fn_combi_t7 4, 0,1,2,3,0,0
L352:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 23 ---
L356:	fn_link  Ordlist.implies
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 24 ---
L368:	fn_link  L340
	fn_link  L356
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 25 ---
L380:	fn_link  L368
	fn_link  L392
	fn_combi_t6 4, 3,0,1,2,0,0
L392:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 26 ---
NanoPrelude.$26$26:	fn_link  L404
	fn_combi_t1 2, 1,0,0,0,0,0
L404:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 27 ---
Ordlist.ins:	fn_link  L428
	fn_link  L484
	fn_link  L424
	fn_combi_t20 4, 0,1,3,2,3,0
L424:	fn_y
# --- block 28 ---
L428:	fn_link  L436
	fn_combi_t16 4, 0,1,0,2,3,0
L436:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 29 ---
L440:	fn_link  L448
	fn_combi_t6 4, 0,2,1,3,0,0
L448:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 30 ---
L452:	fn_link  Ordlist.implies
	fn_combi_t42 5, 0,1,3,2,3,4
# --- block 31 ---
L460:	fn_link  L440
	fn_link  L452
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 32 ---
L472:	fn_link  L480
	fn_combi_t2 4, 3,1,0,0,0,0
L480:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
L484:	fn_link  L460
	fn_link  L504
	fn_link  L472
	fn_link  L508
	fn_combi_t38 5, 0,1,4,2,3,4
L504:	fn_combi_t42 4, 0,2,3,1,2,3
L508:	fn_combi_t47 6, 5,0,1,2,4,3
# --- block 34 ---
Ordlist.boolList:	fn_link  L524
	fn_link  L616
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 35 ---
L524:	fn_link  L536
	fn_link  L540
	fn_combi_t2 4, 3,0,1,0,0,0
L536:	fn_combi_t0 2, 0,0,0,0,0,0
L540:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 36 ---
L544:	fn_link  Ordlist.boolList
	fn_link  L564
	fn_link  L568
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,2,3,4,0
L564:	fn_combi_t0 2, 1,0,0,0,0,0
L568:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 37 ---
L572:	fn_link  Ordlist.boolList
	fn_link  L596
	fn_link  L600
	fn_link  NanoPrelude.map
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t57 6, 0,1,2,3,4,5
L596:	fn_combi_t0 2, 0,0,0,0,0,0
L600:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 38 ---
L604:	fn_link  L544
	fn_link  L572
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 39 ---
L616:	fn_link  L604
	fn_link  Ordlist.boolList
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 4, 0,1,3,2,3,0

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
