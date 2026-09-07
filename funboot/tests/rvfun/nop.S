# fun assembly : funboot/nop  (entry @0)
	.text
	.globl	Control.Applicative.$2a$3e$24dflt
	.globl	Control.Applicative.$3c$2a$24dflt
	.globl	Control.Applicative.$3c$2a$3e
	.globl	Control.Applicative.Applicative$24C
	.globl	Control.Applicative.Applicative$24super1
	.globl	Control.Applicative.liftA2$24dflt
	.globl	Control.Monad.$3e$3e$3d
	.globl	Control.Monad.ap
	.globl	Control.Monad.return
	.globl	Data.Functor.$3c$24
	.globl	Data.Functor.$3c$24$24dflt
	.globl	Data.Functor.fmap
	.globl	Nop.main
	.globl	Primitives.primBind
	.globl	Primitives.primPerformIO
	.globl	Primitives.primReturn
	.globl	Primitives.primThen
	.globl	System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	.globl	System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn.link  Nop.main
	fn.elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn.link  L20
	fn.link  L24
	fn.combi.t2 3, [0,2,1,0,0,0]
L20:	fn.combi.t0 1, [0,0,0,0,0,0]
L24:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 2 ---
Nop.main:	fn.link  L40
	fn.link  System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	fn.elink Control.Monad.return
L40:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 3 ---
Control.Monad.return:	fn.link  L52
	fn.combi.t1 2, [1,0,0,0,0,0]
L52:	fn.combi.t0 4, [3,0,0,0,0,0]
# --- block 4 ---
System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29:	fn.link  Primitives.primReturn
	fn.link  Primitives.primThen
	fn.link  Primitives.primBind
	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.combi.t9 5, [4,0,1,2,3,0]
# --- block 5 ---
System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29:	fn.link  L104
	fn.link  L112
	fn.link  L120
	fn.link  L128
	fn.link  Primitives.primReturn
	fn.link  System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	fn.elink Control.Applicative.Applicative$24C
# --- block 6 ---
L104:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.liftA2$24dflt
# --- block 7 ---
L112:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.$3c$2a$24dflt
# --- block 8 ---
L120:	fn.link  System.IO.Internal.inst$24$28Control.Applicative.Applicative$40Primitives.IO$29
	fn.elink Control.Applicative.$2a$3e$24dflt
# --- block 9 ---
L128:	fn.link  System.IO.Internal.inst$24$28Control.Monad.Monad$40Primitives.IO$29
	fn.elink Control.Monad.ap
# --- block 10 ---
Control.Applicative.Applicative$24C:	fn.link  L148
	fn.link  L152
	fn.combi.t7 4, [0,1,2,3,0,0]
L148:	fn.combi.t23 6, [5,0,1,2,3,4]
L152:	fn.combi.t23 6, [0,1,2,3,5,4]
# --- block 11 ---
System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29:	fn.link  L168
	fn.link  L184
	fn.combi.t2 3, [2,0,1,0,0,0]
# --- block 12 ---
L168:	fn.link  System.IO.Internal.inst$24$28Data.Functor.Functor$40Primitives.IO$29
	fn.elink Data.Functor.$3c$24$24dflt
# --- block 13 ---
L176:	fn.link  Primitives.primReturn
	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 14 ---
L184:	fn.link  L176
	fn.link  Primitives.primBind
	fn.combi.t6 4, [0,3,1,2,0,0]
# --- block 15 ---
Primitives.primBind:	fn.link  L224
	fn.link  L208
	fn.combi.t7 4, [0,1,2,3,0,0]
L208:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 16 ---
L212:	fn.link  L220
	fn.combi.t5 4, [0,1,3,2,0,0]
L220:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 17 ---
L224:	fn.link  L212
	fn.link  L236
	fn.combi.t16 5, [0,2,1,3,4,0]
L236:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 18 ---
Primitives.primReturn:	fn.link  L252
	fn.link  L256
	fn.combi.t3 3, [0,1,2,0,0,0]
L252:	fn.combi.t1 2, [1,0,0,0,0,0]
L256:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 19 ---
Data.Functor.$3c$24$24dflt:	fn.link  L276
	fn.link  Data.Functor.fmap
	fn.link  L280
	fn.combi.t5 4, [0,1,3,2,0,0]
L276:	fn.combi.t0 2, [0,0,0,0,0,0]
L280:	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 20 ---
Data.Functor.fmap:	fn.link  L292
	fn.combi.t1 2, [1,0,0,0,0,0]
L292:	fn.combi.t0 2, [0,0,0,0,0,0]
# --- block 21 ---
Control.Monad.ap:	fn.link  L316
	fn.link  Control.Monad.$3e$3e$3d
	fn.combi.t42 5, [0,2,3,1,2,4]
# --- block 22 ---
L308:	fn.link  Control.Monad.return
	fn.combi.t6 4, [0,1,2,3,0,0]
# --- block 23 ---
L316:	fn.link  L308
	fn.link  Control.Monad.$3e$3e$3d
	fn.combi.t42 5, [0,2,3,1,2,4]
# --- block 24 ---
Control.Monad.$3e$3e$3d:	fn.link  L336
	fn.combi.t1 2, [1,0,0,0,0,0]
L336:	fn.combi.t0 4, [1,0,0,0,0,0]
# --- block 25 ---
Control.Applicative.$2a$3e$24dflt:	fn.link  L352
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t16 4, [0,2,1,2,3,0]
# --- block 26 ---
L352:	fn.link  L368
	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.$3c$24
	fn.combi.t5 4, [0,1,3,2,0,0]
L368:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 27 ---
Control.Applicative.$3c$2a$3e:	fn.link  L380
	fn.combi.t1 2, [1,0,0,0,0,0]
L380:	fn.combi.t0 6, [2,0,0,0,0,0]
# --- block 28 ---
Data.Functor.$3c$24:	fn.link  L392
	fn.combi.t1 2, [1,0,0,0,0,0]
L392:	fn.combi.t0 2, [1,0,0,0,0,0]
# --- block 29 ---
Control.Applicative.Applicative$24super1:	fn.link  L404
	fn.combi.t1 2, [1,0,0,0,0,0]
L404:	fn.combi.t0 6, [0,0,0,0,0,0]
# --- block 30 ---
Control.Applicative.$3c$2a$24dflt:	fn.link  L420
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t16 4, [0,2,1,2,3,0]
# --- block 31 ---
L420:	fn.link  L436
	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.fmap
	fn.combi.t5 4, [0,1,3,2,0,0]
L436:	fn.combi.t0 2, [0,0,0,0,0,0]
# --- block 32 ---
Control.Applicative.liftA2$24dflt:	fn.link  L452
	fn.link  Control.Applicative.$3c$2a$3e
	fn.combi.t46 5, [0,2,1,2,3,4]
# --- block 33 ---
L452:	fn.link  Control.Applicative.Applicative$24super1
	fn.link  Data.Functor.fmap
	fn.combi.t3 3, [0,1,2,0,0,0]
# --- block 34 ---
Primitives.primThen:	fn.link  L492
	fn.link  L476
	fn.combi.t7 4, [0,1,2,3,0,0]
L476:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 35 ---
L480:	fn.link  L488
	fn.combi.t2 4, [0,1,2,0,0,0]
L488:	fn.combi.t0 1, [0,0,0,0,0,0]
# --- block 36 ---
L492:	fn.link  L480
	fn.link  L504
	fn.combi.t16 5, [0,2,1,3,4,0]
L504:	fn.combi.t0 1, [0,0,0,0,0,0]

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
