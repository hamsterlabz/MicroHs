# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Primes  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	NanoPrelude.enumFrom
	.globl	NanoPrelude.enumFromTo
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.head
	.globl	NanoPrelude.map
	.globl	NanoPrelude.rem
	.globl	NanoPrelude.takeWhile
	.globl	Primes.bench
	.globl	Primes.idx
	.globl	Primes.isdivs
	.globl	Primes.iter
	.globl	Primes.prime
	.globl	Primes.theFilter
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Primes.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Primes.bench:	fn_link  L36
	fn_elink Primes.prime
L36:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 3 ---
Primes.prime:	fn_link  L112
	fn_link  Primes.idx
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
	fn_link  L104
	fn_link  NanoPrelude.enumFromTo
	fn_combi_t50 5, 0,1,2,4,4,3
L76:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_y
L104:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 5 ---
L112:	fn_link  L56
	fn_link  Primes.theFilter
	fn_link  Primes.iter
	fn_link  NanoPrelude.head
	fn_link  NanoPrelude.map
	fn_combi_t48 6, 0,1,2,3,4,5
# --- block 6 ---
Primes.idx:	fn_link  L156
	fn_link  L200
	fn_link  L152
	fn_combi_t47 5, 3,0,1,2,4,4
L152:	fn_elink _error0
# --- block 7 ---
L156:	fn_link  L172
	fn_link  L196
	fn_link  Primes.idx
	fn_combi_t17 5, 0,4,1,3,2,0
L172:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L196:	fn_y
# --- block 8 ---
L200:	fn_link  L212
	fn_link  L216
	fn_combi_t29 6, 3,0,1,2,5,4
L212:	fn_elink _prim_eq
L216:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 9 ---
NanoPrelude.map:	fn_link  L252
	fn_link  L236
	fn_combi_t3 3, 0,1,2,0,0,0
L236:	fn_y
# --- block 10 ---
L240:	fn_link  L248
	fn_combi_t15 5, 0,1,3,2,4,0
L248:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 11 ---
L252:	fn_link  L240
	fn_link  L264
	fn_combi_t16 5, 4,0,1,2,3,0
L264:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 12 ---
NanoPrelude.head:	fn_link  L280
	fn_link  L284
	fn_combi_t2 3, 2,0,1,0,0,0
L280:	fn_combi_t0 2, 0,0,0,0,0,0
L284:	fn_elink _error0
# --- block 13 ---
Primes.iter:	fn_link  L304
	fn_link  L300
	fn_combi_t3 3, 0,1,2,0,0,0
L300:	fn_y
# --- block 14 ---
L304:	fn_link  L312
	fn_combi_t17 4, 0,3,2,1,3,0
L312:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 15 ---
Primes.theFilter:	fn_link  L332
	fn_link  L328
	fn_combi_t2 3, 2,0,1,0,0,0
L328:	fn_elink _error0
# --- block 16 ---
L332:	fn_link  Primes.isdivs
	fn_link  NanoPrelude.filter
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 17 ---
NanoPrelude.filter:	fn_link  L408
	fn_link  L356
	fn_combi_t3 3, 0,1,2,0,0,0
L356:	fn_y
# --- block 18 ---
L360:	fn_link  L372
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L372:	fn_elink _error0
# --- block 19 ---
L376:	fn_link  L384
	fn_combi_t24 5, 0,1,4,2,3,4
L384:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 20 ---
L388:	fn_link  L404
	fn_link  L360
	fn_link  L376
	fn_combi_t26 5, 0,1,3,4,2,4
L404:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 21 ---
L408:	fn_link  L388
	fn_link  L420
	fn_combi_t16 5, 4,0,1,2,3,0
L420:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 22 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 23 ---
Primes.isdivs:	fn_link  L440
	fn_link  L444
	fn_combi_t4 4, 0,2,3,1,0,0
L440:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 24 ---
L444:	fn_link  L464
	fn_link  L468
	fn_link  NanoPrelude.rem
	fn_link  L472
	fn_combi_t32 6, 0,1,5,4,2,3
L464:	fn_combi_t0 2, 0,0,0,0,0,0
L468:	fn_elink _prim_ne
L472:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 25 ---
NanoPrelude.rem:	fn_link  L492
	fn_link  L516
	fn_combi_t8 4, 0,3,2,1,0,0
L492:	fn_tor a0
	fn_tor a1
	remw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L516:	fn_y
# --- block 26 ---
NanoPrelude.enumFromTo:	fn_link  NanoPrelude.enumFrom
	fn_link  L536
	fn_link  NanoPrelude.takeWhile
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 27 ---
L536:	fn_link  L552
	fn_link  L556
	fn_link  L560
	fn_combi_t10 5, 3,4,0,1,2,0
L552:	fn_combi_t0 2, 1,0,0,0,0,0
L556:	fn_combi_t0 2, 0,0,0,0,0,0
L560:	fn_elink _prim_le
# --- block 28 ---
NanoPrelude.takeWhile:	fn_link  L604
	fn_link  L576
	fn_combi_t3 3, 0,1,2,0,0,0
L576:	fn_y
# --- block 29 ---
L580:	fn_link  L588
	fn_combi_t6 4, 0,2,1,3,0,0
L588:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 30 ---
L592:	fn_link  L600
	fn_combi_t42 5, 1,3,0,2,3,4
L600:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 31 ---
L604:	fn_link  L580
	fn_link  L592
	fn_link  L620
	fn_combi_t48 6, 5,0,1,3,2,4
L620:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 32 ---
NanoPrelude.enumFrom:	fn_link  L644
	fn_link  L668
	fn_link  NanoPrelude.enumFrom
	fn_link  L672
	fn_combi_t50 5, 0,4,1,2,4,3
L644:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L668:	fn_y
L672:	fn_combi_t2 4, 3,0,1,0,0,0

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
