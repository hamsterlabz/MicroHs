# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/RFib  (entry @0)
	.text
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$3c$3d.
	.globl	Primitives.primPerformIO
	.globl	RFib.bench
	.globl	RFib.nfib
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  RFib.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
RFib.bench:	fn_link  L52
	fn_elink _prim_ftoi
# --- block 3 ---
L36:	fn_link  L44
	fn_elink _prim_itof
L44:	fn_box
	.word 0x0000000b	# raw word 11
	fn_box_body
# --- block 4 ---
L52:	fn_link  L36
	fn_elink RFib.nfib
# --- block 5 ---
RFib.nfib:	fn_link  L76
	fn_link  L84
	fn_link  L192
	fn_combi_t6 4, 0,3,1,2,0,0
L76:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L84:	fn_elink _prim_itof
# --- block 6 ---
L88:	fn_link  L96
	fn_elink _prim_itof
L96:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 7 ---
L104:	fn_link  L124
	fn_link  L132
	fn_link  NanoPrelude.$2d.
	fn_link  RFib.nfib
	fn_combi_t20 5, 0,1,4,2,3,0
L124:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L132:	fn_elink _prim_itof
# --- block 8 ---
L136:	fn_link  L160
	fn_link  L168
	fn_link  NanoPrelude.$2d.
	fn_link  RFib.nfib
	fn_link  NanoPrelude.$2b.
	fn_combi_t62 6, 0,1,2,5,3,4
L160:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L168:	fn_elink _prim_itof
# --- block 9 ---
L172:	fn_link  L88
	fn_link  L104
	fn_link  L136
	fn_link  NanoPrelude.$2b.
	fn_combi_t34 5, 0,1,4,2,4,3
# --- block 10 ---
L192:	fn_link  L172
	fn_link  L212
	fn_link  L220
	fn_link  NanoPrelude.$3c$3d.
	fn_combi_t39 5, 0,4,1,2,3,4
L212:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L220:	fn_elink _prim_itof
# --- block 11 ---
NanoPrelude.$3c$3d.:	fn_link  L232
	fn_combi_t3 3, 2,1,0,0,0,0
L232:	fn_elink _prim_fle
# --- block 12 ---
NanoPrelude.$2b.:	fn_link  L248
	fn_link  L252
	fn_combi_t8 4, 0,3,2,1,0,0
L248:	fn_elink _prim_fadd
L252:	fn_y
# --- block 13 ---
NanoPrelude.$2d.:	fn_link  L268
	fn_link  L272
	fn_combi_t8 4, 0,3,2,1,0,0
L268:	fn_elink _prim_fsub
L272:	fn_y

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
