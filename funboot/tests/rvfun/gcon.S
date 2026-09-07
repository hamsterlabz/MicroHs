# fun assembly : funboot/gcon  (entry @0)
	.text
	.globl	Primitives.primPerformIO
	.globl	V1.main
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  V1.main
	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
V1.main:	fn.link  L36
	fn.combi.t1 2, [1,0,0,0,0,0]
L36:	fn.combi.t0 1, [0,0,0,0,0,0]

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
