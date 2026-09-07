# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/TreePari  (entry @0)
	.text
	.globl	Primitives.primPerformIO
	.globl	TreePari.main
	.globl	TreePari.mkTree
	.globl	TreePari.pariWhere
	.globl	TreePari.peek
	.globl	TreePari.withTwoLeaf
	.globl	TreePari.xor
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  TreePari.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
TreePari.main:	fn_link  L52
	fn_elink TreePari.peek
# --- block 3 ---
L36:	fn_link  L44
	fn_elink TreePari.mkTree
L44:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
# --- block 4 ---
L52:	fn_link  L36
	fn_link  TreePari.withTwoLeaf
	fn_elink TreePari.pariWhere
# --- block 5 ---
TreePari.peek:	fn_link  L76
	fn_link  L84
	fn_combi_t2 3, 2,0,1,0,0,0
L76:	fn_box
	.word 0x0000002a	# raw word 42
	fn_box_body
L84:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
TreePari.pariWhere:	fn_link  L112
	fn_link  L136
	fn_link  L168
	fn_link  L116
	fn_combi_t53 5, 0,1,4,2,4,3
L112:	fn_combi_t0 2, 0,0,0,0,0,0
L116:	fn_y
# --- block 7 ---
L120:	fn_link  TreePari.xor
	fn_link  L132
	fn_combi_t31 4, 0,1,1,2,3,2
L132:	fn_combi_t13 5, 0,1,2,4,3,0
# --- block 8 ---
L136:	fn_link  L156
	fn_link  L120
	fn_link  L160
	fn_link  L164
	fn_combi_t25 6, 0,1,2,5,4,3
L156:	fn_combi_t0 2, 1,0,0,0,0,0
L160:	fn_combi_t2 3, 0,2,1,0,0,0
L164:	fn_combi_t46 6, 0,1,2,5,3,4
# --- block 9 ---
L168:	fn_link  L192
	fn_link  L196
	fn_link  L200
	fn_link  L204
	fn_link  L208
	fn_combi_t46 6, 0,1,5,2,3,4
L192:	fn_combi_t0 2, 0,0,0,0,0,0
L196:	fn_combi_t0 2, 1,0,0,0,0,0
L200:	fn_combi_t0 2, 0,0,0,0,0,0
L204:	fn_combi_t6 3, 2,0,1,2,0,0
L208:	fn_combi_t16 5, 0,1,2,4,3,0
# --- block 10 ---
TreePari.xor:	fn_link  L236
	fn_link  L228
	fn_link  L232
	fn_combi_t40 5, 3,4,0,1,2,4
L228:	fn_combi_t0 2, 0,0,0,0,0,0
L232:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 11 ---
L236:	fn_link  L248
	fn_link  L252
	fn_combi_t2 3, 2,0,1,0,0,0
L248:	fn_combi_t0 2, 1,0,0,0,0,0
L252:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
TreePari.withTwoLeaf:	fn_link  L284
	fn_link  L268
	fn_combi_t2 3, 2,0,1,0,0,0
L268:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 13 ---
L272:	fn_link  L280
	fn_combi_t0 3, 0,0,0,0,0,0
L280:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L284:	fn_link  L272
	fn_link  L296
	fn_combi_t12 4, 2,3,0,1,1,0
L296:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 15 ---
TreePari.mkTree:	fn_link  L312
	fn_link  L372
	fn_combi_t2 3, 0,2,1,0,0,0
L312:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
L316:	fn_link  L328
	fn_link  L352
	fn_combi_t3 3, 0,2,1,0,0,0
L328:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L352:	fn_y
# --- block 17 ---
L356:	fn_link  TreePari.mkTree
	fn_link  L368
	fn_combi_t15 3, 0,1,2,1,2,0
L368:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 18 ---
L372:	fn_link  L316
	fn_link  L356
	fn_link  L392
	fn_link  L396
	fn_combi_t45 5, 0,4,1,2,3,4
L392:	fn_elink _prim_eq
L396:	fn_box
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
