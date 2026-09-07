# fun assembly : funboot/two  (entry @0)
	.text
	.globl	Primitives.primPerformIO
	.globl	Primitives.primThen
	.globl	Two.main
	.globl	Two.putI
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  Two.main
	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
Two.main:	fn.link  L72
	fn.link  L84
	fn.elink Primitives.primThen
# --- block 3 ---
L40:	fn.link  L48
	fn.elink Two.putI
L48:	fn.box
	.word 0x0000000a	# raw word 10
# --- block 4 ---
L56:	fn.link  L64
	fn.elink Two.putI
L64:	fn.box
	.word 0x00000042	# raw word 66
# --- block 5 ---
L72:	fn.link  L40
	fn.link  L56
	fn.elink Primitives.primThen
# --- block 6 ---
L84:	fn.link  L92
	fn.elink Two.putI
L92:	fn.box
	.word 0x00000041	# raw word 65
# --- block 7 ---
Primitives.primThen:	fn.link  L128
	fn.link  L112
	fn.combi.t7 4, [0,1,2,3,0,0]
L112:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 8 ---
L116:	fn.link  L124
	fn.combi.t2 4, [0,1,2,0,0,0]
L124:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 9 ---
L128:	fn.link  L116
	fn.link  L140
	fn.combi.t16 5, [0,2,1,3,4,0]
L140:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 10 ---
Two.putI:	fn.link  L160
	fn.link  L156
	fn.combi.t3 3, [0,1,2,0,0,0]
L156:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 11 ---
L160:	fn.link  L172
	fn.link  L176
	fn.combi.t6 4, [0,2,3,1,0,0]
L172:	fn.combi.t0 1, [0,0,0,0,0,0]
L176:	fn.elink _pm_putb

# --- unimplemented foreign-import / primitive stubs ---
	.balign 4
_unimpfi_iswindows:
	la a0, _unimpfi_iswindows$name
	j _unimpfi_halt
_unimpfi_iswindows$name:
	.asciz "iswindows"
	.balign 4
	.balign 4
_unimpprim_fread:
	la a0, _unimpprim_fread$name
	j _unimpfi_halt
_unimpprim_fread$name:
	.asciz "fread"
	.balign 4
	.balign 4
_unimpprim_fshow:
	la a0, _unimpprim_fshow$name
	j _unimpfi_halt
_unimpprim_fshow$name:
	.asciz "fshow"
	.balign 4
	.balign 4
_unimpprim_newCAStringLen:
	la a0, _unimpprim_newCAStringLen$name
	j _unimpfi_halt
_unimpprim_newCAStringLen$name:
	.asciz "newCAStringLen"
	.balign 4
	.balign 4
_unimpprim_peekCAString:
	la a0, _unimpprim_peekCAString$name
	j _unimpfi_halt
_unimpprim_peekCAString$name:
	.asciz "peekCAString"
	.balign 4
	.balign 4
_unimpprim_peekCAStringLen:
	la a0, _unimpprim_peekCAStringLen$name
	j _unimpfi_halt
_unimpprim_peekCAStringLen$name:
	.asciz "peekCAStringLen"
	.balign 4
	.balign 4
_unimpprim_rnf:
	la a0, _unimpprim_rnf$name
	j _unimpfi_halt
_unimpprim_rnf$name:
	.asciz "rnf"
	.balign 4
	.balign 4
_unimpprim_scmp:
	la a0, _unimpprim_scmp$name
	j _unimpfi_halt
_unimpprim_scmp$name:
	.asciz "scmp"
	.balign 4
	.balign 4
_unimpprim_sequal:
	la a0, _unimpprim_sequal$name
	j _unimpfi_halt
_unimpprim_sequal$name:
	.asciz "sequal"
	.balign 4
