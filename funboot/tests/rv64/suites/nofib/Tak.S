# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Tak  (entry @0)
	.text
	.globl	NanoPrelude.not
	.globl	Primitives.primPerformIO
	.globl	Tak.bench
	.globl	Tak.tak
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Tak.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Tak.bench:	fn_link  L44
	fn_link  L52
	fn_link  L60
	fn_elink Tak.tak
L44:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L52:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
L60:	fn_box
	.word 0x00000009	# raw word 9
	fn_box_body
# --- block 3 ---
Tak.tak:	fn_link  L80
	fn_link  L292
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 4 ---
L80:	fn_link  L96
	fn_link  L120
	fn_link  Tak.tak
	fn_combi_t27 6, 0,1,5,2,3,4
L96:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L120:	fn_y
# --- block 5 ---
L124:	fn_link  L140
	fn_link  L164
	fn_link  Tak.tak
	fn_combi_t27 6, 0,1,4,2,5,3
L140:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L164:	fn_y
# --- block 6 ---
L168:	fn_link  L184
	fn_link  L208
	fn_link  Tak.tak
	fn_combi_t8 4, 0,1,3,2,0,0
L184:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L208:	fn_y
# --- block 7 ---
L212:	fn_link  Tak.tak
	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 8 ---
L220:	fn_link  L168
	fn_link  L212
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 9 ---
L232:	fn_link  L124
	fn_link  L220
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 10 ---
L244:	fn_link  L264
	fn_link  L268
	fn_link  L272
	fn_link  NanoPrelude.not
	fn_combi_t52 6, 0,4,5,1,2,3
L264:	fn_combi_t0 2, 1,0,0,0,0,0
L268:	fn_combi_t0 2, 0,0,0,0,0,0
L272:	fn_elink _prim_lt
# --- block 11 ---
L276:	fn_link  L244
	fn_link  L288
	fn_combi_t40 5, 0,1,2,4,3,4
L288:	fn_combi_t34 4, 0,1,3,2,3,3
# --- block 12 ---
L292:	fn_link  L232
	fn_link  L276
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 13 ---
NanoPrelude.not:	fn_link  L316
	fn_link  L320
	fn_combi_t2 3, 2,0,1,0,0,0
L316:	fn_combi_t0 2, 0,0,0,0,0,0
L320:	fn_combi_t0 2, 1,0,0,0,0,0

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
