# fun assembly : funboot/caf  (entry @0)
	.text
	.globl	Caf.main
	.globl	Caf.putI
	.globl	Caf.ref
	.globl	Data.IORef.newIORef
	.globl	Data.IORef.readIORef
	.globl	Data.IORef.writeIORef
	.globl	Primitives.primArrAlloc
	.globl	Primitives.primArrRead
	.globl	Primitives.primArrSlot
	.globl	Primitives.primArrWrite
	.globl	Primitives.primBind
	.globl	Primitives.primIntAdd
	.globl	Primitives.primIntShl
	.globl	Primitives.primPerformIO
	.globl	Primitives.primReturn
	.globl	Primitives.primThen
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  Caf.main
L4:	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
Caf.main:	fn.link  L76
	fn.link  L88
	fn.elink Primitives.primThen
# --- block 3 ---
L40:	fn.link  L60
	fn.link  Caf.putI
	fn.link  Caf.putI
L52:	fn.link  Primitives.primThen
	fn.combi.t15 5, [0,1,4,2,3,0]
L60:	fn.box
	.word 0x0000000a	# raw word 10
# --- block 4 ---
L68:	fn.link  Caf.ref
	fn.elink Data.IORef.readIORef
# --- block 5 ---
L76:	fn.link  L40
	fn.link  L68
	fn.elink Primitives.primBind
# --- block 6 ---
L88:	fn.link  L100
	fn.link  Caf.ref
	fn.elink Data.IORef.writeIORef
L100:	fn.box
	.word 0x00000037	# raw word 55
# --- block 7 ---
Primitives.primThen:	fn.link  L136
	fn.link  L120
	fn.combi.t7 4, [0,1,2,3,0,0]
L120:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 8 ---
L124:	fn.link  L132
	fn.combi.t2 4, [0,1,2,0,0,0]
L132:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 9 ---
L136:	fn.link  L124
	fn.link  L148
	fn.combi.t16 5, [0,2,1,3,4,0]
L148:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 10 ---
Data.IORef.writeIORef:	fn.link  L164
	fn.link  Primitives.primArrWrite
	fn.combi.t2 3, [0,2,1,0,0,0]
L164:	fn.box
	.word 0x00000000	# raw word 0
# --- block 11 ---
Primitives.primArrWrite:	fn.link  L192
	fn.link  L212
	fn.link  L188
	fn.combi.t56 6, [0,1,3,4,2,5]
L188:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 12 ---
L192:	fn.link  L204
	fn.link  L208
	fn.combi.t6 4, [0,2,3,1,0,0]
L204:	fn.combi.t0 1, [0,0,0,0,0,0]
L208:	fn.elink _pm_arr_wr
# --- block 13 ---
L212:	fn.link  Primitives.primArrSlot
	fn.link  L224
	fn.combi.t40 6, [0,1,2,3,4,5]
L224:	fn.elink _pm_arr_setsl
# --- block 14 ---
Primitives.primArrSlot:	fn.link  L248
	fn.link  L244
	fn.link  Primitives.primIntAdd
	fn.combi.t15 5, [0,1,3,2,4,0]
L244:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 15 ---
L248:	fn.link  L268
	fn.link  Primitives.primIntShl
	fn.link  L276
	fn.link  Primitives.primIntAdd
	fn.combi.t16 5, [0,1,2,4,3,0]
L268:	fn.box
	.word 0x00000002	# raw word 2
L276:	fn.box
	.word 0x00000004	# raw word 4
# --- block 16 ---
Primitives.primIntAdd:	fn.link  L296
	fn.link  L320
	fn.combi.t8 4, [0,3,2,1,0,0]
L296:	fn.tor a0
	fn.tor a1
	add a0,a0,a1
	fn.databox a0,a0
	fn.update a0
	jr a0
L320:	fn.y
# --- block 17 ---
Primitives.primIntShl:	fn.link  L336
	fn.link  L360
	fn.combi.t8 4, [0,3,2,1,0,0]
L336:	fn.tor a0
	fn.tor a1
	sll a0,a0,a1
	fn.databox a0,a0
	fn.update a0
	jr a0
L360:	fn.y
# --- block 18 ---
Caf.ref:	fn.link  L372
	fn.elink Primitives.primPerformIO
# --- block 19 ---
L372:	fn.link  L380
	fn.elink Data.IORef.newIORef
L380:	fn.box
	.word 0x00000035	# raw word 53
# --- block 20 ---
Data.IORef.newIORef:	fn.link  L416
	fn.link  L408
	fn.link  Primitives.primArrAlloc
	fn.link  Primitives.primBind
	fn.combi.t12 5, [0,1,2,4,3,0]
L408:	fn.box
	.word 0x00000001	# raw word 1
# --- block 21 ---
L416:	fn.link  L428
	fn.link  Primitives.primReturn
	fn.combi.t3 3, [0,1,2,0,0,0]
L428:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 22 ---
Primitives.primBind:	fn.link  L460
	fn.link  L444
	fn.combi.t7 4, [0,1,2,3,0,0]
L444:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 23 ---
L448:	fn.link  L456
	fn.combi.t5 4, [0,1,3,2,0,0]
L456:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 24 ---
L460:	fn.link  L448
	fn.link  L472
	fn.combi.t16 5, [0,2,1,3,4,0]
L472:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 25 ---
Primitives.primArrAlloc:	fn.link  L492
	fn.link  L488
	fn.combi.t7 4, [0,1,2,3,0,0]
L488:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 26 ---
L492:	fn.link  L504
	fn.link  L508
	fn.combi.t16 5, [0,2,1,3,4,0]
L504:	fn.elink _pm_arr_alloc
L508:	fn.elink _pm_arr_setn
# --- block 27 ---
Primitives.primReturn:	fn.link  L524
	fn.link  L528
	fn.combi.t3 3, [0,1,2,0,0,0]
L524:	fn.combi.t1 2, [1,0,0,0,0,0]
L528:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 28 ---
Data.IORef.readIORef:	fn.link  L544
	fn.link  Primitives.primArrRead
	fn.combi.t2 3, [0,2,1,0,0,0]
L544:	fn.box
	.word 0x00000000	# raw word 0
# --- block 29 ---
Primitives.primArrRead:	fn.link  Primitives.primArrSlot
	fn.link  L568
	fn.link  L572
	fn.combi.t21 5, [0,1,2,3,4,0]
L568:	fn.elink _pm_arr_rd
L572:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 30 ---
Caf.putI:	fn.link  L592
	fn.link  L588
	fn.combi.t3 3, [0,1,2,0,0,0]
L588:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 31 ---
L592:	fn.link  L604
	fn.link  L608
	fn.combi.t6 4, [0,2,3,1,0,0]
L604:	fn.combi.t0 1, [0,0,0,0,0,0]
L608:	fn.elink _pm_putb

# --- unimplemented foreign-import / primitive stubs ---
	.balign 4
_unimpfi__$26closeb:
	la a0, _unimpfi__$26closeb$name
	j _unimpfi_halt
_unimpfi__$26closeb$name:
	.asciz "&closeb"
	.balign 4
	.balign 4
_unimpfi_acos:
	la a0, _unimpfi_acos$name
	j _unimpfi_halt
_unimpfi_acos$name:
	.asciz "acos"
	.balign 4
	.balign 4
_unimpfi_asin:
	la a0, _unimpfi_asin$name
	j _unimpfi_halt
_unimpfi_asin$name:
	.asciz "asin"
	.balign 4
	.balign 4
_unimpfi_atan:
	la a0, _unimpfi_atan$name
	j _unimpfi_halt
_unimpfi_atan$name:
	.asciz "atan"
	.balign 4
	.balign 4
_unimpfi_atan2:
	la a0, _unimpfi_atan2$name
	j _unimpfi_halt
_unimpfi_atan2$name:
	.asciz "atan2"
	.balign 4
	.balign 4
_unimpfi_calloc:
	la a0, _unimpfi_calloc$name
	j _unimpfi_halt
_unimpfi_calloc$name:
	.asciz "calloc"
	.balign 4
	.balign 4
_unimpfi_cos:
	la a0, _unimpfi_cos$name
	j _unimpfi_halt
_unimpfi_cos$name:
	.asciz "cos"
	.balign 4
	.balign 4
_unimpfi_exp:
	la a0, _unimpfi_exp$name
	j _unimpfi_halt
_unimpfi_exp$name:
	.asciz "exp"
	.balign 4
	.balign 4
_unimpfi_free:
	la a0, _unimpfi_free$name
	j _unimpfi_halt
_unimpfi_free$name:
	.asciz "free"
	.balign 4
	.balign 4
_unimpfi_iswindows:
	la a0, _unimpfi_iswindows$name
	j _unimpfi_halt
_unimpfi_iswindows$name:
	.asciz "iswindows"
	.balign 4
	.balign 4
_unimpfi_log:
	la a0, _unimpfi_log$name
	j _unimpfi_halt
_unimpfi_log$name:
	.asciz "log"
	.balign 4
	.balign 4
_unimpfi_malloc:
	la a0, _unimpfi_malloc$name
	j _unimpfi_halt
_unimpfi_malloc$name:
	.asciz "malloc"
	.balign 4
	.balign 4
_unimpfi_peekPtr:
	la a0, _unimpfi_peekPtr$name
	j _unimpfi_halt
_unimpfi_peekPtr$name:
	.asciz "peekPtr"
	.balign 4
	.balign 4
_unimpfi_peekWord:
	la a0, _unimpfi_peekWord$name
	j _unimpfi_halt
_unimpfi_peekWord$name:
	.asciz "peekWord"
	.balign 4
	.balign 4
_unimpfi_peek_flt:
	la a0, _unimpfi_peek_flt$name
	j _unimpfi_halt
_unimpfi_peek_flt$name:
	.asciz "peek_flt"
	.balign 4
	.balign 4
_unimpfi_peek_int:
	la a0, _unimpfi_peek_int$name
	j _unimpfi_halt
_unimpfi_peek_int$name:
	.asciz "peek_int"
	.balign 4
	.balign 4
_unimpfi_peek_int16:
	la a0, _unimpfi_peek_int16$name
	j _unimpfi_halt
_unimpfi_peek_int16$name:
	.asciz "peek_int16"
	.balign 4
	.balign 4
_unimpfi_peek_int32:
	la a0, _unimpfi_peek_int32$name
	j _unimpfi_halt
_unimpfi_peek_int32$name:
	.asciz "peek_int32"
	.balign 4
	.balign 4
_unimpfi_peek_int64:
	la a0, _unimpfi_peek_int64$name
	j _unimpfi_halt
_unimpfi_peek_int64$name:
	.asciz "peek_int64"
	.balign 4
	.balign 4
_unimpfi_peek_int8:
	la a0, _unimpfi_peek_int8$name
	j _unimpfi_halt
_unimpfi_peek_int8$name:
	.asciz "peek_int8"
	.balign 4
	.balign 4
_unimpfi_peek_llong:
	la a0, _unimpfi_peek_llong$name
	j _unimpfi_halt
_unimpfi_peek_llong$name:
	.asciz "peek_llong"
	.balign 4
	.balign 4
_unimpfi_peek_long:
	la a0, _unimpfi_peek_long$name
	j _unimpfi_halt
_unimpfi_peek_long$name:
	.asciz "peek_long"
	.balign 4
	.balign 4
_unimpfi_peek_uint:
	la a0, _unimpfi_peek_uint$name
	j _unimpfi_halt
_unimpfi_peek_uint$name:
	.asciz "peek_uint"
	.balign 4
	.balign 4
_unimpfi_peek_uint16:
	la a0, _unimpfi_peek_uint16$name
	j _unimpfi_halt
_unimpfi_peek_uint16$name:
	.asciz "peek_uint16"
	.balign 4
	.balign 4
_unimpfi_peek_uint32:
	la a0, _unimpfi_peek_uint32$name
	j _unimpfi_halt
_unimpfi_peek_uint32$name:
	.asciz "peek_uint32"
	.balign 4
	.balign 4
_unimpfi_peek_uint64:
	la a0, _unimpfi_peek_uint64$name
	j _unimpfi_halt
_unimpfi_peek_uint64$name:
	.asciz "peek_uint64"
	.balign 4
	.balign 4
_unimpfi_peek_uint8:
	la a0, _unimpfi_peek_uint8$name
	j _unimpfi_halt
_unimpfi_peek_uint8$name:
	.asciz "peek_uint8"
	.balign 4
	.balign 4
_unimpfi_peek_ullong:
	la a0, _unimpfi_peek_ullong$name
	j _unimpfi_halt
_unimpfi_peek_ullong$name:
	.asciz "peek_ullong"
	.balign 4
	.balign 4
_unimpfi_peek_ulong:
	la a0, _unimpfi_peek_ulong$name
	j _unimpfi_halt
_unimpfi_peek_ulong$name:
	.asciz "peek_ulong"
	.balign 4
	.balign 4
_unimpfi_pokePtr:
	la a0, _unimpfi_pokePtr$name
	j _unimpfi_halt
_unimpfi_pokePtr$name:
	.asciz "pokePtr"
	.balign 4
	.balign 4
_unimpfi_pokeWord:
	la a0, _unimpfi_pokeWord$name
	j _unimpfi_halt
_unimpfi_pokeWord$name:
	.asciz "pokeWord"
	.balign 4
	.balign 4
_unimpfi_poke_flt:
	la a0, _unimpfi_poke_flt$name
	j _unimpfi_halt
_unimpfi_poke_flt$name:
	.asciz "poke_flt"
	.balign 4
	.balign 4
_unimpfi_poke_int:
	la a0, _unimpfi_poke_int$name
	j _unimpfi_halt
_unimpfi_poke_int$name:
	.asciz "poke_int"
	.balign 4
	.balign 4
_unimpfi_poke_int16:
	la a0, _unimpfi_poke_int16$name
	j _unimpfi_halt
_unimpfi_poke_int16$name:
	.asciz "poke_int16"
	.balign 4
	.balign 4
_unimpfi_poke_int32:
	la a0, _unimpfi_poke_int32$name
	j _unimpfi_halt
_unimpfi_poke_int32$name:
	.asciz "poke_int32"
	.balign 4
	.balign 4
_unimpfi_poke_int64:
	la a0, _unimpfi_poke_int64$name
	j _unimpfi_halt
_unimpfi_poke_int64$name:
	.asciz "poke_int64"
	.balign 4
	.balign 4
_unimpfi_poke_int8:
	la a0, _unimpfi_poke_int8$name
	j _unimpfi_halt
_unimpfi_poke_int8$name:
	.asciz "poke_int8"
	.balign 4
	.balign 4
_unimpfi_poke_llong:
	la a0, _unimpfi_poke_llong$name
	j _unimpfi_halt
_unimpfi_poke_llong$name:
	.asciz "poke_llong"
	.balign 4
	.balign 4
_unimpfi_poke_long:
	la a0, _unimpfi_poke_long$name
	j _unimpfi_halt
_unimpfi_poke_long$name:
	.asciz "poke_long"
	.balign 4
	.balign 4
_unimpfi_poke_uint:
	la a0, _unimpfi_poke_uint$name
	j _unimpfi_halt
_unimpfi_poke_uint$name:
	.asciz "poke_uint"
	.balign 4
	.balign 4
_unimpfi_poke_uint16:
	la a0, _unimpfi_poke_uint16$name
	j _unimpfi_halt
_unimpfi_poke_uint16$name:
	.asciz "poke_uint16"
	.balign 4
	.balign 4
_unimpfi_poke_uint32:
	la a0, _unimpfi_poke_uint32$name
	j _unimpfi_halt
_unimpfi_poke_uint32$name:
	.asciz "poke_uint32"
	.balign 4
	.balign 4
_unimpfi_poke_uint64:
	la a0, _unimpfi_poke_uint64$name
	j _unimpfi_halt
_unimpfi_poke_uint64$name:
	.asciz "poke_uint64"
	.balign 4
	.balign 4
_unimpfi_poke_uint8:
	la a0, _unimpfi_poke_uint8$name
	j _unimpfi_halt
_unimpfi_poke_uint8$name:
	.asciz "poke_uint8"
	.balign 4
	.balign 4
_unimpfi_poke_ullong:
	la a0, _unimpfi_poke_ullong$name
	j _unimpfi_halt
_unimpfi_poke_ullong$name:
	.asciz "poke_ullong"
	.balign 4
	.balign 4
_unimpfi_poke_ulong:
	la a0, _unimpfi_poke_ulong$name
	j _unimpfi_halt
_unimpfi_poke_ulong$name:
	.asciz "poke_ulong"
	.balign 4
	.balign 4
_unimpfi_sin:
	la a0, _unimpfi_sin$name
	j _unimpfi_halt
_unimpfi_sin$name:
	.asciz "sin"
	.balign 4
	.balign 4
_unimpfi_sizeof_int:
	la a0, _unimpfi_sizeof_int$name
	j _unimpfi_halt
_unimpfi_sizeof_int$name:
	.asciz "sizeof_int"
	.balign 4
	.balign 4
_unimpfi_sizeof_llong:
	la a0, _unimpfi_sizeof_llong$name
	j _unimpfi_halt
_unimpfi_sizeof_llong$name:
	.asciz "sizeof_llong"
	.balign 4
	.balign 4
_unimpfi_sizeof_long:
	la a0, _unimpfi_sizeof_long$name
	j _unimpfi_halt
_unimpfi_sizeof_long$name:
	.asciz "sizeof_long"
	.balign 4
	.balign 4
_unimpfi_sqrt:
	la a0, _unimpfi_sqrt$name
	j _unimpfi_halt
_unimpfi_sqrt$name:
	.asciz "sqrt"
	.balign 4
	.balign 4
_unimpfi_tan:
	la a0, _unimpfi_tan$name
	j _unimpfi_halt
_unimpfi_tan$name:
	.asciz "tan"
	.balign 4
	.balign 4
_unimpfi_tmpname:
	la a0, _unimpfi_tmpname$name
	j _unimpfi_halt
_unimpfi_tmpname$name:
	.asciz "tmpname"
	.balign 4
	.balign 4
_unimpprim_catch:
	la a0, _unimpprim_catch$name
	j _unimpfi_halt
_unimpprim_catch$name:
	.asciz "catch"
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
