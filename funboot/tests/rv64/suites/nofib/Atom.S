# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Atom  (entry @0)
	.text
	.globl	Atom..$2a
	.globl	Atom.addL
	.globl	Atom.bench
	.globl	Atom.hpos
	.globl	Atom.mulL
	.globl	Atom.propagate
	.globl	Atom.runExperiment
	.globl	Atom.simN
	.globl	Atom.takeL
	.globl	Atom.test
	.globl	Atom.testforce
	.globl	Atom.zipWithL
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.foldl
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Atom.bench
	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Atom.bench:	fn_link  L52
	fn_link  L44
	fn_link  L72
	fn_elink NanoPrelude.foldl
L44:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
L52:	fn_link  Atom.test
	fn_link  Atom.simN
	fn_elink Atom.takeL
# --- block 4 ---
L64:	fn_link  Atom.hpos
	fn_combi_t2 4, 0,1,2,0,0,0
# --- block 5 ---
L72:	fn_link  L64
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 6 ---
NanoPrelude.foldl:	fn_link  L96
	fn_link  L92
	fn_combi_t3 3, 0,1,2,0,0,0
L92:	fn_y
# --- block 7 ---
L96:	fn_link  L104
L100:	fn_combi_t46 5, 4,3,0,1,2,3
L104:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 8 ---
Atom.hpos:	fn_link  L232
	fn_combi_t6 3, 2,1,0,1,0,0
# --- block 9 ---
L116:	fn_link  L136
	fn_link  L160
	fn_link  L184
	fn_link  L192
	fn_combi_t13 5, 0,1,4,2,3,0
L136:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L160:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L184:	fn_box
	.word 0x0000001f	# raw word 31
	fn_box_body
L192:	fn_y
# --- block 10 ---
L196:	fn_link  L216
	fn_link  L224
	fn_link  NanoPrelude.$2a.
	fn_link  L228
	fn_combi_t34 6, 0,1,5,2,3,4
L216:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L224:	fn_elink _prim_itof
L228:	fn_elink _prim_ftoi
# --- block 11 ---
L232:	fn_link  L116
	fn_link  L196
	fn_link  L252
	fn_link  Atom.hpos
	fn_combi_t61 6, 0,1,2,3,4,5
L252:	fn_y
# --- block 12 ---
NanoPrelude.$2a.:	fn_link  L268
	fn_link  L272
	fn_combi_t8 4, 0,3,2,1,0,0
L268:	fn_elink _prim_fmul
L272:	fn_y
# --- block 13 ---
Atom.takeL:	fn_link  L292
	fn_link  L340
	fn_link  L356
	fn_combi_t24 5, 0,1,3,3,4,2
L292:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 14 ---
L296:	fn_link  L312
	fn_link  L336
	fn_link  Atom.takeL
	fn_combi_t8 4, 0,1,3,2,0,0
L312:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L336:	fn_y
# --- block 15 ---
L340:	fn_link  L296
	fn_link  L352
	fn_combi_t16 5, 0,3,1,2,4,0
L352:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 16 ---
L356:	fn_link  L372
	fn_link  L376
	fn_link  L380
	fn_combi_t44 6, 0,4,1,5,2,3
L372:	fn_combi_t0 2, 0,0,0,0,0,0
L376:	fn_elink _prim_le
L380:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 17 ---
Atom.simN:	fn_box
	.word 0x00000014	# raw word 20
	fn_box_body
# --- block 18 ---
Atom.test:	fn_link  L480
	fn_link  L508
	fn_link  L556
	fn_link  Atom.testforce
	fn_elink Atom.runExperiment
# --- block 19 ---
L416:	fn_link  L424
	fn_elink _prim_itof
L424:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 20 ---
L432:	fn_link  L444
	fn_link  L416
	fn_combi_t2 4, 3,0,1,0,0,0
L444:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 21 ---
L448:	fn_link  L456
	fn_elink _prim_itof
L456:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 22 ---
L464:	fn_link  L476
	fn_link  L448
	fn_combi_t2 4, 3,0,1,0,0,0
L476:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 23 ---
L480:	fn_link  L432
	fn_link  L464
	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 24 ---
L492:	fn_link  L500
	fn_elink _prim_itof
L500:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 25 ---
L508:	fn_link  L520
	fn_link  L492
	fn_combi_t2 4, 3,0,1,0,0,0
L520:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
L524:	fn_link  L532
	fn_elink _prim_itof
L532:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
# --- block 27 ---
L540:	fn_link  L548
	fn_elink _prim_itof
L548:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 28 ---
L556:	fn_link  L524
	fn_link  L540
	fn_elink NanoPrelude.$2f.
# --- block 29 ---
Atom.runExperiment:	fn_link  L620
	fn_link  L580
	fn_combi_t51 6, 0,1,2,3,4,5
L580:	fn_y
# --- block 30 ---
L584:	fn_link  Atom.propagate
	fn_link  Atom.zipWithL
	fn_combi_t44 6, 0,1,3,2,4,5
# --- block 31 ---
L596:	fn_link  L604
	fn_combi_t46 5, 0,3,1,2,4,4
L604:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 32 ---
L608:	fn_link  L584
	fn_link  L596
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 33 ---
L620:	fn_link  L636
	fn_link  L608
	fn_link  L640
	fn_combi_t5 4, 0,1,3,2,0,0
L636:	fn_combi_t0 1, 0,0,0,0,0,0
L640:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 34 ---
Atom.zipWithL:	fn_link  L696
	fn_link  L656
	fn_combi_t3 3, 0,1,2,0,0,0
L656:	fn_y
# --- block 35 ---
L660:	fn_link  L668
	fn_combi_t40 6, 0,1,2,4,3,5
L668:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 36 ---
L672:	fn_link  L680
	fn_combi_t48 6, 3,0,1,4,2,5
L680:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 37 ---
L684:	fn_link  L660
	fn_link  L672
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 38 ---
L696:	fn_link  L684
	fn_link  L708
	fn_combi_t46 6, 4,0,1,2,3,5
L708:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 39 ---
Atom.propagate:	fn_link  L752
	fn_combi_t7 4, 3,0,1,2,0,0
# --- block 40 ---
L720:	fn_link  Atom..$2a
	fn_link  Atom.addL
	fn_combi_t16 5, 0,4,1,2,3,0
# --- block 41 ---
L732:	fn_link  Atom..$2a
	fn_link  Atom.addL
	fn_link  L748
	fn_combi_t58 6, 0,1,4,2,3,5
L748:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 42 ---
L752:	fn_link  L720
	fn_link  L732
	fn_link  L768
	fn_combi_t15 4, 0,1,3,2,3,0
L768:	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 43 ---
Atom.addL:	fn_link  L816
	fn_combi_t16 3, 2,1,0,1,2,0
# --- block 44 ---
L780:	fn_link  NanoPrelude.$2b.
	fn_link  L792
	fn_combi_t40 6, 0,1,2,4,3,5
L792:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 45 ---
L796:	fn_link  Atom.addL
	fn_link  L780
	fn_link  L812
	fn_combi_t48 6, 3,0,1,4,2,5
L812:	fn_elink _error0
# --- block 46 ---
L816:	fn_link  L796
	fn_combi_t6 5, 1,2,0,2,0,0
# --- block 47 ---
NanoPrelude.$2b.:	fn_link  L836
	fn_link  L840
	fn_combi_t8 4, 0,3,2,1,0,0
L836:	fn_elink _prim_fadd
L840:	fn_y
# --- block 48 ---
Atom..$2a:	fn_link  L876
	fn_link  L856
	fn_combi_t3 3, 0,1,2,0,0,0
L856:	fn_y
# --- block 49 ---
L860:	fn_link  NanoPrelude.$2a.
	fn_link  L872
	fn_combi_t40 6, 0,1,2,4,3,5
L872:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 50 ---
L876:	fn_link  L860
	fn_link  L888
	fn_combi_t16 5, 4,0,1,2,3,0
L888:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 51 ---
Atom.testforce:	fn_link  L980
	fn_link  L904
	fn_combi_t3 3, 0,1,2,0,0,0
L904:	fn_y
# --- block 52 ---
L908:	fn_link  L928
	fn_link  L936
	fn_link  L940
	fn_link  Atom..$2a
	fn_combi_t41 6, 0,1,2,3,4,5
L928:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L936:	fn_elink _prim_itof
L940:	fn_elink _prim_fneg
# --- block 53 ---
L944:	fn_link  Atom.mulL
	fn_link  L908
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 54 ---
L956:	fn_link  L944
	fn_link  L968
	fn_combi_t40 7, 0,1,2,5,3,4
L968:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 55 ---
L972:	fn_link  L956
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 56 ---
L980:	fn_link  L972
	fn_link  L992
	fn_combi_t16 5, 4,0,1,2,3,0
L992:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 57 ---
Atom.mulL:	fn_link  L1056
L1000:	fn_link  L1008
	fn_combi_t16 4, 3,0,1,2,3,0
L1008:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 58 ---
L1012:	fn_link  Atom.mulL
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 59 ---
L1020:	fn_link  L1012
	fn_link  NanoPrelude.$2a.
	fn_link  L1036
	fn_combi_t40 6, 0,1,3,4,2,5
L1036:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 60 ---
L1040:	fn_link  L1020
	fn_link  L1052
	fn_combi_t6 5, 2,0,1,3,0,0
L1052:	fn_elink _error0
# --- block 61 ---
L1056:	fn_link  L1040
	fn_link  L1068
	fn_combi_t6 6, 2,0,1,3,0,0
L1068:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 62 ---
NanoPrelude.$2f.:	fn_link  L1084
	fn_link  L1088
	fn_combi_t8 4, 0,3,2,1,0,0
L1084:	fn_elink _prim_fdiv
L1088:	fn_y

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
