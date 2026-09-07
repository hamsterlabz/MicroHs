# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/TreeSum  (entry @0)
	.text
	.globl	Primitives.primPerformIO
	.globl	TreeSum.main
	.globl	TreeSum.mkTree
	.globl	TreeSum.treeSum
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  TreeSum.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
TreeSum.main:	fn_link  L36
	fn_elink TreeSum.treeSum
# --- block 3 ---
L36:	fn_link  L44
	fn_elink TreeSum.mkTree
L44:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 4 ---
TreeSum.treeSum:	fn_link  L116
	fn_link  L64
	fn_combi_t2 3, 2,0,1,0,0,0
L64:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 5 ---
L72:	fn_link  L88
	fn_link  TreeSum.treeSum
	fn_link  L112
	fn_combi_t58 5, 0,1,4,1,3,2
L88:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L112:	fn_y
# --- block 6 ---
L116:	fn_link  L132
	fn_link  L72
	fn_link  L156
	fn_combi_t18 5, 0,1,3,4,2,0
L132:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L156:	fn_y
# --- block 7 ---
TreeSum.mkTree:	fn_link  L172
	fn_link  L232
	fn_combi_t2 3, 0,2,1,0,0,0
L172:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 8 ---
L176:	fn_link  L188
	fn_link  L212
	fn_combi_t3 3, 0,2,1,0,0,0
L188:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L212:	fn_y
# --- block 9 ---
L216:	fn_link  TreeSum.mkTree
	fn_link  L228
	fn_combi_t15 3, 0,1,2,1,2,0
L228:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 10 ---
L232:	fn_link  L176
	fn_link  L216
	fn_link  L252
	fn_link  L256
	fn_combi_t45 5, 0,4,1,2,3,4
L252:	fn_elink _prim_eq
L256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body

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
