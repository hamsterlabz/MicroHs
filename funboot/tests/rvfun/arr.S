# fun assembly : funboot/arr  (entry @0)
	.text
	.globl	Arr.main
	.globl	Arr.putI
	.globl	Primitives.primArrAlloc
	.globl	Primitives.primArrRead
	.globl	Primitives.primArrSlot
	.globl	Primitives.primArrWrite
	.globl	Primitives.primBind
	.globl	Primitives.primIntAdd
	.globl	Primitives.primIntShl
	.globl	Primitives.primPerformIO
	.globl	Primitives.primThen
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  Arr.main
L4:	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
Arr.main:	fn.link  L156
	fn.link  L184
	fn.elink Primitives.primBind
# --- block 3 ---
L40:	fn.link  L56
	fn.link  Arr.putI
	fn.link  Primitives.primThen
	fn.combi.t15 4, [0,1,3,1,2,0]
L56:	fn.box
	.word 0x0000000a	# raw word 10
# --- block 4 ---
L64:	fn.link  L40
	fn.link  L84
	fn.link  Primitives.primArrRead
	fn.link  Primitives.primBind
	fn.combi.t12 5, [0,1,4,2,3,0]
L84:	fn.box
	.word 0x00000000	# raw word 0
# --- block 5 ---
L92:	fn.link  L112
	fn.link  L120
	fn.link  Primitives.primArrWrite
	fn.link  Primitives.primThen
	fn.combi.t18 5, [0,1,4,2,3,0]
L112:	fn.box
	.word 0x00000042	# raw word 66
L120:	fn.box
	.word 0x00000000	# raw word 0
# --- block 6 ---
L128:	fn.link  L64
	fn.link  L92
	fn.combi.t6 3, [0,2,1,2,0,0]
# --- block 7 ---
L140:	fn.link  L128
	fn.link  Arr.putI
	fn.link  Primitives.primThen
	fn.combi.t15 5, [0,1,4,2,3,0]
# --- block 8 ---
L156:	fn.link  L140
	fn.link  L176
	fn.link  Primitives.primArrRead
	fn.link  Primitives.primBind
	fn.combi.t40 5, [0,1,4,2,3,4]
L176:	fn.box
	.word 0x00000000	# raw word 0
# --- block 9 ---
L184:	fn.link  L196
	fn.link  L204
	fn.elink Primitives.primArrAlloc
L196:	fn.box
	.word 0x00000041	# raw word 65
L204:	fn.box
	.word 0x00000001	# raw word 1
# --- block 10 ---
Primitives.primBind:	fn.link  L240
	fn.link  L224
	fn.combi.t7 4, [0,1,2,3,0,0]
L224:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 11 ---
L228:	fn.link  L236
	fn.combi.t5 4, [0,1,3,2,0,0]
L236:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 12 ---
L240:	fn.link  L228
	fn.link  L252
	fn.combi.t16 5, [0,2,1,3,4,0]
L252:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 13 ---
Primitives.primArrAlloc:	fn.link  L272
	fn.link  L276
	fn.link  Primitives.primThen
	fn.combi.t15 5, [0,1,3,2,4,0]
L272:	fn.elink _pm_arr_alloc
L276:	fn.elink _pm_arr_setn
# --- block 14 ---
Primitives.primThen:	fn.link  L308
	fn.link  L292
	fn.combi.t7 4, [0,1,2,3,0,0]
L292:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 15 ---
L296:	fn.link  L304
	fn.combi.t2 4, [0,1,2,0,0,0]
L304:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 16 ---
L308:	fn.link  L296
	fn.link  L320
	fn.combi.t16 5, [0,2,1,3,4,0]
L320:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 17 ---
Primitives.primArrRead:	fn.link  Primitives.primArrSlot
	fn.link  L336
	fn.combi.t7 4, [0,1,2,3,0,0]
L336:	fn.elink _pm_arr_rd
# --- block 18 ---
Primitives.primArrSlot:	fn.link  L360
	fn.link  L356
	fn.link  Primitives.primIntAdd
	fn.combi.t15 5, [0,1,3,2,4,0]
L356:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 19 ---
L360:	fn.link  L380
	fn.link  Primitives.primIntShl
	fn.link  L388
	fn.link  Primitives.primIntAdd
	fn.combi.t16 5, [0,1,2,4,3,0]
L380:	fn.box
	.word 0x00000002	# raw word 2
L388:	fn.box
	.word 0x00000004	# raw word 4
# --- block 20 ---
Primitives.primIntAdd:	fn.link  L408
	fn.link  L432
	fn.combi.t8 4, [0,3,2,1,0,0]
L408:	fn.tor a0
	fn.tor a1
	add a0,a0,a1
	fn.databox a0,a0
	fn.update a0
	jr a0
L432:	fn.y
# --- block 21 ---
Primitives.primIntShl:	fn.link  L448
	fn.link  L472
	fn.combi.t8 4, [0,3,2,1,0,0]
L448:	fn.tor a0
	fn.tor a1
	sll a0,a0,a1
	fn.databox a0,a0
	fn.update a0
	jr a0
L472:	fn.y
# --- block 22 ---
Arr.putI:	fn.link  L492
	fn.link  L488
	fn.combi.t3 3, [0,1,2,0,0,0]
L488:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 23 ---
L492:	fn.link  L504
	fn.link  L508
	fn.combi.t6 4, [0,2,3,1,0,0]
L504:	fn.combi.t0 1, [0,0,0,0,0,0]
L508:	fn.elink _pm_putb
# --- block 24 ---
Primitives.primArrWrite:	fn.link  L524
	fn.link  L528
	fn.combi.t14 5, [0,2,3,1,4,0]
L524:	fn.elink _pm_arr_wr
# --- block 25 ---
L528:	fn.link  Primitives.primArrSlot
	fn.link  L544
	fn.link  Primitives.primThen
	fn.combi.t21 5, [0,1,2,3,4,0]
L544:	fn.elink _pm_arr_setsl

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
