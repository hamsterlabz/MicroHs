# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Kahan  (entry @0)
	.text
	.globl	GExtra.$3c$3d
	.globl	GExtra..$26.
	.globl	GExtra.shiftL
	.globl	GExtra.shiftR
	.globl	GExtra.wToD
	.globl	GExtra.xor
	.globl	Kahan.bench
	.globl	Kahan.inner
	.globl	Kahan.outer
	.globl	Kahan.prng
	.globl	Kahan.simVdim
	.globl	Kahan.simVnum
	.globl	Kahan.sumD
	.globl	Kahan.two32
	.globl	Kahan.zeros
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Kahan.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Kahan.bench:	fn_link  L84
	fn_elink _prim_ftoi
# --- block 3 ---
L36:	fn_link  Kahan.simVdim
	fn_elink Kahan.zeros
# --- block 4 ---
L44:	fn_link  Kahan.simVdim
	fn_elink Kahan.zeros
# --- block 5 ---
L52:	fn_link  L36
	fn_link  L44
	fn_link  L68
	fn_elink Kahan.outer
L68:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 6 ---
L76:	fn_link  L52
	fn_elink Kahan.sumD
# --- block 7 ---
L84:	fn_link  Kahan.two32
	fn_link  L76
	fn_elink NanoPrelude.$2f.
# --- block 8 ---
NanoPrelude.$2f.:	fn_link  L108
	fn_link  L112
	fn_combi_t8 4, 0,3,2,1,0,0
L108:	fn_elink _prim_fdiv
L112:	fn_y
# --- block 9 ---
Kahan.sumD:	fn_link  L128
	fn_link  L152
	fn_y
# --- block 10 ---
L128:	fn_link  L136
	fn_elink _prim_itof
L136:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L144:	fn_link  NanoPrelude.$2b.
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 12 ---
L152:	fn_link  L144
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 13 ---
NanoPrelude.$2b.:	fn_link  L172
	fn_link  L176
	fn_combi_t8 4, 0,3,2,1,0,0
L172:	fn_elink _prim_fadd
L176:	fn_y
# --- block 14 ---
Kahan.outer:	fn_link  L260
	fn_link  L272
	fn_combi_t30 4, 0,2,1,2,3,3
# --- block 15 ---
L192:	fn_link  L212
	fn_link  L216
	fn_link  L240
	fn_link  Kahan.outer
	fn_combi_t41 6, 0,1,4,2,5,3
L212:	fn_combi_t0 2, 0,0,0,0,0,0
L216:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L240:	fn_y
# --- block 16 ---
L244:	fn_link  L256
	fn_link  L192
	fn_combi_t14 4, 0,2,3,3,1,0
L256:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 17 ---
L260:	fn_link  Kahan.inner
	fn_link  L244
	fn_combi_t46 5, 0,2,1,2,3,4
# --- block 18 ---
L272:	fn_link  Kahan.simVnum
	fn_link  GExtra.$3c$3d
	fn_combi_t37 6, 0,2,1,4,3,5
# --- block 19 ---
GExtra.$3c$3d:	fn_link  L292
	fn_combi_t3 3, 2,1,0,0,0,0
L292:	fn_elink _prim_leu
# --- block 20 ---
Kahan.simVnum:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 21 ---
Kahan.inner:	fn_link  L480
	fn_link  L520
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 22 ---
L316:	fn_link  Kahan.prng
	fn_link  Kahan.inner
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 23 ---
L328:	fn_link  NanoPrelude.$2d.
	fn_link  L340
	fn_combi_t54 5, 0,1,1,4,2,3
L340:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 24 ---
L344:	fn_link  L356
	fn_link  L328
	fn_combi_t37 6, 0,2,3,4,5,1
L356:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 25 ---
L360:	fn_link  L372
	fn_link  L376
	fn_combi_t34 6, 5,0,2,4,1,3
L372:	fn_combi_t0 2, 0,0,0,0,0,0
L376:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 26 ---
L380:	fn_link  L360
	fn_combi_t30 4, 0,3,1,3,2,2
# --- block 27 ---
L388:	fn_link  L380
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 28 ---
L396:	fn_link  L344
	fn_link  L388
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 29 ---
L408:	fn_link  L396
	fn_link  L420
	fn_combi_t3 3, 0,1,2,0,0,0
L420:	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 30 ---
L424:	fn_link  L408
	fn_combi_t25 5, 0,3,1,4,2,3
# --- block 31 ---
L432:	fn_link  NanoPrelude.$2b.
	fn_link  L316
	fn_link  L424
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 32 ---
L448:	fn_link  L456
	fn_combi_t24 6, 0,1,5,2,3,4
L456:	fn_combi_t47 6, 0,4,1,2,3,5
# --- block 33 ---
L460:	fn_link  GExtra.wToD
	fn_link  NanoPrelude.$2d.
	fn_link  L432
	fn_link  L448
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 34 ---
L480:	fn_link  L460
	fn_link  L492
	fn_combi_t46 6, 3,0,1,2,4,5
L492:	fn_elink _error0
# --- block 35 ---
L496:	fn_link  L504
	fn_combi_t0 3, 0,0,0,0,0,0
L504:	fn_elink _error0
# --- block 36 ---
L508:	fn_link  L516
	fn_combi_t2 2, 1,0,0,0,0,0
L516:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L520:	fn_link  L496
	fn_link  L508
	fn_combi_t40 5, 3,4,0,1,2,4
# --- block 38 ---
NanoPrelude.$2d.:	fn_link  L544
	fn_link  L548
	fn_combi_t8 4, 0,3,2,1,0,0
L544:	fn_elink _prim_fsub
L548:	fn_y
# --- block 39 ---
Kahan.prng:	fn_link  L568
	fn_link  L592
	fn_link  L616
	fn_combi_t8 4, 0,1,2,3,0,0
# --- block 40 ---
L568:	fn_link  L584
	fn_link  GExtra.shiftL
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L584:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 41 ---
L592:	fn_link  L608
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L608:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 42 ---
L616:	fn_link  L632
	fn_link  GExtra.shiftL
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L632:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 43 ---
GExtra.xor:	fn_link  L652
	fn_link  L676
	fn_combi_t8 4, 0,3,2,1,0,0
L652:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L676:	fn_y
# --- block 44 ---
GExtra.shiftL:	fn_link  L692
	fn_link  L716
	fn_combi_t8 4, 0,3,2,1,0,0
L692:	fn_tor a0
	fn_tor a1
	sllw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L716:	fn_y
# --- block 45 ---
GExtra.shiftR:	fn_link  L732
	fn_link  L756
	fn_combi_t8 4, 0,3,2,1,0,0
L732:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L756:	fn_y
# --- block 46 ---
GExtra.wToD:	fn_link  L776
	fn_link  L820
	fn_link  NanoPrelude.$2b.
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 47 ---
L776:	fn_link  L792
	fn_link  GExtra..$26.
	fn_link  L800
	fn_combi_t7 4, 0,1,3,2,0,0
L792:	fn_box
	.word 0x0000ffff	# raw word 65535
	fn_box_body
L800:	fn_elink _prim_itof
# --- block 48 ---
L804:	fn_link  L812
	fn_elink _prim_itof
L812:	fn_box
	.word 0x00010000	# raw word 65536
	fn_box_body
# --- block 49 ---
L820:	fn_link  L804
	fn_link  L844
	fn_link  GExtra.shiftR
	fn_link  L852
	fn_link  NanoPrelude.$2a.
	fn_combi_t35 6, 0,1,2,5,3,4
L844:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
L852:	fn_elink _prim_itof
# --- block 50 ---
NanoPrelude.$2a.:	fn_link  L868
	fn_link  L872
	fn_combi_t8 4, 0,3,2,1,0,0
L868:	fn_elink _prim_fmul
L872:	fn_y
# --- block 51 ---
GExtra..$26.:	fn_link  L888
	fn_link  L912
	fn_combi_t8 4, 0,3,2,1,0,0
L888:	fn_tor a0
	fn_tor a1
	and a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L912:	fn_y
# --- block 52 ---
Kahan.zeros:	fn_link  L936
	fn_link  L996
	fn_link  L940
	fn_link  L944
	fn_combi_t29 5, 4,0,1,2,4,3
L936:	fn_combi_t0 2, 0,0,0,0,0,0
L940:	fn_elink _prim_eq
L944:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 53 ---
L952:	fn_link  L968
	fn_link  L992
	fn_link  Kahan.zeros
	fn_combi_t8 4, 0,1,3,2,0,0
L968:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L992:	fn_y
# --- block 54 ---
L996:	fn_link  L952
	fn_link  L1016
	fn_link  L1024
	fn_link  L1028
	fn_combi_t15 5, 0,1,2,3,4,0
L1016:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1024:	fn_elink _prim_itof
L1028:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 55 ---
Kahan.simVdim:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 56 ---
Kahan.two32:	fn_link  L1052
	fn_link  L1068
	fn_elink NanoPrelude.$2a.
# --- block 57 ---
L1052:	fn_link  L1060
	fn_elink _prim_itof
L1060:	fn_box
	.word 0x00010000	# raw word 65536
	fn_box_body
# --- block 58 ---
L1068:	fn_link  L1076
	fn_elink _prim_itof
L1076:	fn_box
	.word 0x00010000	# raw word 65536
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
