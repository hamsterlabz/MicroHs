# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/PerfDemo  (entry @0)
	.text
	.globl	PerfDemo.fib
	.globl	PerfDemo.main
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  PerfDemo.main
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
PerfDemo.main:	fn_link  L36
	fn_elink PerfDemo.fib
L36:	fn_box
	.word 0x0000000f	# raw word 15
	fn_box_body
# --- block 3 ---
PerfDemo.fib:	fn_link  L56
	fn_link  L184
	fn_combi_t2 3, 0,2,1,0,0,0
L56:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 4 ---
L64:	fn_link  L84
	fn_link  L108
	fn_link  L132
	fn_link  PerfDemo.fib
	fn_combi_t13 5, 0,1,4,2,3,0
L84:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L108:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L132:	fn_y
# --- block 5 ---
L136:	fn_link  L64
	fn_link  L156
	fn_link  L180
	fn_link  PerfDemo.fib
	fn_combi_t41 5, 0,1,4,2,3,4
L156:	fn_force
	fn_tor a0
	addiw a0,a0,-2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L180:	fn_y
# --- block 6 ---
L184:	fn_link  L136
	fn_link  L204
	fn_link  L208
	fn_link  L212
	fn_combi_t45 5, 0,4,1,2,3,4
L204:	fn_y
L208:	fn_elink _prim_le
L212:	fn_box
	.word 0x00000001	# raw word 1
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
_unimpprim_addiw$20$2d2:
	la a0, _unimpprim_addiw$20$2d2$name
	tail _unimpfi_halt
_unimpprim_addiw$20$2d2$name:
	.asciz "addiw -2"
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
