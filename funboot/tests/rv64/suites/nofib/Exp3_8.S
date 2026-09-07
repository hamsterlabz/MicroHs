# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Exp3_8  (entry @0)
	.text
	.globl	Exp3_8.addN
	.globl	Exp3_8.bench
	.globl	Exp3_8.intN
	.globl	Exp3_8.mulN
	.globl	Exp3_8.powN
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Exp3_8.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Exp3_8.bench:	fn_link  L64
	fn_elink Exp3_8.intN
# --- block 3 ---
L36:	fn_link  L44
	fn_combi_t1 3, 2,0,0,0,0,0
L44:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 4 ---
L48:	fn_link  L36
	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 5 ---
L56:	fn_link  L48
	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 6 ---
L64:	fn_link  L76
	fn_link  L56
	fn_elink Exp3_8.powN
L76:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 7 ---
Exp3_8.intN:	fn_link  L104
	fn_link  L96
	fn_combi_t2 3, 2,0,1,0,0,0
L96:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 8 ---
L104:	fn_link  L120
	fn_link  Exp3_8.intN
	fn_link  L144
	fn_combi_t7 4, 0,1,3,2,0,0
L120:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L144:	fn_y
# --- block 9 ---
Exp3_8.powN:	fn_link  L232
	fn_link  L160
	fn_combi_t3 3, 0,1,2,0,0,0
L160:	fn_y
# --- block 10 ---
L164:	fn_link  L180
	fn_link  L204
	fn_link  Exp3_8.mulN
	fn_combi_t50 6, 0,3,4,1,5,2
L180:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L204:	fn_y
# --- block 11 ---
L208:	fn_link  L220
	fn_link  L224
	fn_combi_t29 5, 4,0,1,2,4,3
L220:	fn_elink _prim_eq
L224:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 12 ---
L232:	fn_link  L252
	fn_link  L256
	fn_link  L164
	fn_link  L208
	fn_combi_t40 6, 0,1,4,5,2,3
L252:	fn_combi_t0 2, 0,0,0,0,0,0
L256:	fn_combi_t1 3, 2,0,0,0,0,0
# --- block 13 ---
Exp3_8.mulN:	fn_link  L284
	fn_link  L272
	fn_combi_t3 3, 0,1,2,0,0,0
L272:	fn_y
# --- block 14 ---
L276:	fn_link  Exp3_8.addN
	fn_combi_t5 4, 0,2,3,1,0,0
# --- block 15 ---
L284:	fn_link  L276
	fn_link  L296
	fn_combi_t16 5, 4,0,1,2,3,0
L296:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
Exp3_8.addN:	fn_link  L308
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 17 ---
L308:	fn_link  Exp3_8.addN
	fn_link  L320
	fn_combi_t7 4, 0,1,3,2,0,0
L320:	fn_combi_t1 3, 2,0,0,0,0,0

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
