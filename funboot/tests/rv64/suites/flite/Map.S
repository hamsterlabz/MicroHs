# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Map  (entry @0)
	.text
	.globl	Map.main
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.foldr$27
	.globl	NanoPrelude.map
	.globl	NanoPrelude.takeWhile
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Map.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Map.main:	fn_link  L120
	fn_link  L44
	fn_link  L132
	fn_elink NanoPrelude.foldr$27
L44:	fn_box
L48:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
L52:	fn_link  L64
	fn_link  L72
	fn_elink NanoPrelude.enumFromTo
L64:	fn_box
	.word 0x00000031	# raw word 49
	fn_box_body
L72:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 4 ---
L80:	fn_link  L92
	fn_link  L116
	fn_combi_t3 3, 0,2,1,0,0,0
L92:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L116:	fn_y
# --- block 5 ---
L120:	fn_link  L52
	fn_link  L80
	fn_elink NanoPrelude.map
# --- block 6 ---
L132:	fn_link  L144
	fn_link  L168
	fn_combi_t8 4, 0,3,2,1,0,0
L144:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L168:	fn_y
# --- block 7 ---
NanoPrelude.foldr$27:	fn_link  L188
	fn_link  L184
	fn_combi_t7 4, 0,1,2,3,0,0
L184:	fn_y
# --- block 8 ---
L188:	fn_link  L196
	fn_combi_t16 5, 4,2,0,1,3,0
L196:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 9 ---
NanoPrelude.map:	fn_link  L228
	fn_link  L212
	fn_combi_t3 3, 0,1,2,0,0,0
L212:	fn_y
# --- block 10 ---
L216:	fn_link  L224
	fn_combi_t15 5, 0,1,3,2,4,0
L224:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L228:	fn_link  L216
	fn_link  L240
	fn_combi_t16 5, 4,0,1,2,3,0
L240:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L260
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 13 ---
L260:	fn_link  L276
	fn_link  L280
	fn_link  L284
	fn_combi_t10 5, 3,4,0,1,2,0
L276:	fn_combi_t0 2, 1,0,0,0,0,0
L280:	fn_combi_t0 2, 0,0,0,0,0,0
L284:	fn_elink _prim_le
# --- block 14 ---
NanoPrelude.takeWhile:	fn_link  L328
	fn_link  L300
	fn_combi_t3 3, 0,1,2,0,0,0
L300:	fn_y
# --- block 15 ---
L304:	fn_link  L312
	fn_combi_t6 4, 0,2,1,3,0,0
L312:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L316:	fn_link  L324
	fn_combi_t42 5, 1,3,0,2,3,4
L324:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 17 ---
L328:	fn_link  L304
	fn_link  L316
	fn_link  L344
	fn_combi_t48 6, 5,0,1,3,2,4
L344:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 18 ---
NanoPrelude.enumFrom:	fn_link  L368
	fn_link  L392
	fn_link  NanoPrelude.enumFrom
	fn_link  L396
	fn_combi_t50 5, 0,4,1,2,4,3
L368:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L392:	fn_y
L396:	fn_combi_t2 4, 3,0,1,0,0,0

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
