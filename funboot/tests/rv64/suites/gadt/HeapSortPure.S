# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/HeapSortPure  (entry @0)
	.text
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3c$3d
	.globl	GExtra.$3e$3d
	.globl	GExtra.last
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	HeapSortPure.bench
	.globl	HeapSortPure.drain
	.globl	HeapSortPure.drawLcg
	.globl	HeapSortPure.hsort
	.globl	HeapSortPure.insertH
	.globl	HeapSortPure.main
	.globl	HeapSortPure.mergeH
	.globl	NanoPrelude.foldl
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.head
	.globl	NanoPrelude.sum
	.globl	Primitives.primPerformIO
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  HeapSortPure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
HeapSortPure.main:	fn_link  L36
	fn_elink HeapSortPure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
HeapSortPure.bench:	fn_link  L320
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L76
	fn_link  L100
L64:	fn_link  L108
	fn_link  L112
	fn_combi_t20 5, 0,1,4,2,3,0
L76:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L100:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L108:	fn_combi_t0 1, 0,0,0,0,0,0
L112:	fn_y
# --- block 5 ---
L116:	fn_link  L136
	fn_link  L160
	fn_link  L184
	fn_link  L192
	fn_combi_t55 6, 5,0,1,4,2,3
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
# --- block 6 ---
L196:	fn_link  L116
	fn_link  L208
	fn_combi_t7 4, 0,1,2,3,0,0
L208:	fn_y
# --- block 7 ---
L212:	fn_link  NanoPrelude.head
	fn_link  Common.hashMix
	fn_combi_t20 4, 0,0,2,1,3,0
# --- block 8 ---
L224:	fn_link  GExtra.last
	fn_link  L212
	fn_link  Common.hashMix
	fn_combi_t56 5, 0,1,3,4,2,4
# --- block 9 ---
L240:	fn_link  NanoPrelude.sum
	fn_link  L224
	fn_link  Common.hashMix
	fn_combi_t56 5, 0,1,3,4,2,4
# --- block 10 ---
L256:	fn_link  L280
	fn_link  L196
	fn_link  NanoPrelude.foldl
	fn_link  L240
	fn_link  L288
	fn_combi_t24 6, 0,1,5,2,3,4
L280:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L288:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 11 ---
L292:	fn_link  L312
	fn_link  HeapSortPure.drawLcg
	fn_link  HeapSortPure.hsort
	fn_link  L256
	fn_combi_t49 6, 0,5,1,2,3,4
L312:	fn_box
	.word 0x00000040	# raw word 64
	fn_box_body
# --- block 12 ---
L320:	fn_link  L56
	fn_link  L292
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 13 ---
Common.benchFold:	fn_link  L352
	fn_link  L360
	fn_link  L456
	fn_link  L368
	fn_combi_t26 6, 0,1,4,5,2,3
L352:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L360:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L368:	fn_y
# --- block 14 ---
L372:	fn_link  L384
	fn_link  L408
	fn_combi_t41 6, 2,0,4,1,3,5
L384:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L408:	fn_y
# --- block 15 ---
L412:	fn_link  L372
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 16 ---
L420:	fn_link  L432
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L432:	fn_elink _error0
# --- block 17 ---
L436:	fn_link  L412
	fn_link  L420
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 18 ---
L448:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 19 ---
L456:	fn_link  L436
	fn_link  L448
	fn_link  L472
	fn_combi_t5 4, 0,1,3,2,0,0
L472:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 20 ---
GExtra.$3e$3d:	fn_link  L484
	fn_combi_t3 3, 2,1,0,0,0,0
L484:	fn_elink _prim_geu
# --- block 21 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 22 ---
Common.hashMix:	fn_link  L508
	fn_link  L616
	fn_link  L644
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 23 ---
L508:	fn_link  L528
	fn_link  GExtra.xor
	fn_link  L552
	fn_link  L560
	fn_combi_t60 6, 0,1,2,4,5,3
L528:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L552:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L560:	fn_y
# --- block 24 ---
L564:	fn_link  L584
	fn_link  L608
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L584:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L608:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 25 ---
L616:	fn_link  L564
	fn_link  L632
	fn_link  L640
	fn_combi_t8 4, 0,1,2,3,0,0
L632:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L640:	fn_y
# --- block 26 ---
L644:	fn_link  L660
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L660:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 27 ---
GExtra.xor:	fn_link  L680
	fn_link  L704
	fn_combi_t8 4, 0,3,2,1,0,0
L680:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L704:	fn_y
# --- block 28 ---
GExtra.shiftR:	fn_link  L720
	fn_link  L744
	fn_combi_t8 4, 0,3,2,1,0,0
L720:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L744:	fn_y
# --- block 29 ---
NanoPrelude.head:	fn_link  L760
	fn_link  L764
	fn_combi_t2 3, 2,0,1,0,0,0
L760:	fn_combi_t0 2, 0,0,0,0,0,0
L764:	fn_elink _error0
# --- block 30 ---
GExtra.last:	fn_link  L792
	fn_link  L780
	fn_combi_t2 3, 2,0,1,0,0,0
L780:	fn_elink _error0
# --- block 31 ---
L784:	fn_link  GExtra.last
	fn_combi_t1 4, 0,1,0,0,0,0
# --- block 32 ---
L792:	fn_link  L784
	fn_combi_t6 3, 2,1,0,2,0,0
# --- block 33 ---
NanoPrelude.sum:	fn_link  L812
	fn_link  L820
	fn_elink NanoPrelude.foldr
L812:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L820:	fn_link  L832
	fn_link  L856
	fn_combi_t8 4, 0,3,2,1,0,0
L832:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L856:	fn_y
# --- block 35 ---
NanoPrelude.foldr:	fn_link  L876
	fn_link  L872
	fn_combi_t7 4, 0,1,2,3,0,0
L872:	fn_y
# --- block 36 ---
L876:	fn_link  L884
	fn_combi_t16 5, 4,2,0,1,3,0
L884:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 37 ---
NanoPrelude.foldl:	fn_link  L904
	fn_link  L900
	fn_combi_t3 3, 0,1,2,0,0,0
L900:	fn_y
# --- block 38 ---
L904:	fn_link  L912
	fn_combi_t46 5, 4,3,0,1,2,3
L912:	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 39 ---
HeapSortPure.hsort:	fn_link  L928
	fn_link  HeapSortPure.drain
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 40 ---
L928:	fn_link  L940
	fn_link  HeapSortPure.insertH
	fn_elink NanoPrelude.foldr
L940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 41 ---
HeapSortPure.drain:	fn_link  L960
	fn_link  L956
	fn_combi_t2 3, 2,0,1,0,0,0
L956:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 42 ---
L960:	fn_link  HeapSortPure.mergeH
	fn_link  HeapSortPure.drain
	fn_link  L976
	fn_combi_t49 6, 0,3,1,2,4,5
L976:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 43 ---
HeapSortPure.mergeH:	fn_link  L1096
	fn_link  L992
	fn_combi_t3 3, 0,1,2,0,0,0
L992:	fn_y
# --- block 44 ---
L996:	fn_link  HeapSortPure.mergeH
	fn_link  L1008
	fn_combi_t30 6, 0,3,1,5,2,4
L1008:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 45 ---
L1012:	fn_link  L1020
	fn_combi_t11 5, 0,2,1,4,3,0
L1020:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 46 ---
L1024:	fn_link  L1036
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L1036:	fn_elink _error0
# --- block 47 ---
L1040:	fn_link  GExtra.$3c$3d
	fn_combi_t28 6, 0,1,2,3,5,4
# --- block 48 ---
L1048:	fn_link  L1012
	fn_link  L1024
	fn_link  L1040
	fn_link  L1068
	fn_combi_t45 6, 0,1,5,2,3,4
L1068:	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 49 ---
L1072:	fn_link  L1048
	fn_link  L1088
	fn_link  L1092
	fn_combi_t15 5, 0,1,3,2,4,0
L1088:	fn_combi_t49 6, 1,0,2,3,4,5
L1092:	fn_combi_t39 5, 0,2,1,4,3,4
# --- block 50 ---
L1096:	fn_link  L996
	fn_link  L1072
	fn_link  L1112
	fn_combi_t30 5, 0,3,1,3,4,2
L1112:	fn_combi_t48 4, 0,3,1,3,2,3
# --- block 51 ---
GExtra.$3c$3d:	fn_link  L1124
	fn_combi_t3 3, 2,1,0,0,0,0
L1124:	fn_elink _prim_leu
# --- block 52 ---
HeapSortPure.insertH:	fn_link  L1148
	fn_link  L1152
	fn_link  L1156
	fn_link  HeapSortPure.mergeH
	fn_combi_t18 5, 0,1,4,2,3,0
L1148:	fn_combi_t0 2, 0,0,0,0,0,0
L1152:	fn_combi_t0 2, 0,0,0,0,0,0
L1156:	fn_combi_t4 5, 4,0,1,2,0,0
# --- block 53 ---
HeapSortPure.drawLcg:	fn_link  L1172
	fn_link  L1260
	fn_combi_t4 4, 0,2,3,1,0,0
L1172:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 54 ---
L1176:	fn_link  L1192
	fn_link  L1216
	fn_link  HeapSortPure.drawLcg
	fn_combi_t8 4, 0,1,3,2,0,0
L1192:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1216:	fn_y
# --- block 55 ---
L1220:	fn_link  L1176
	fn_link  L1232
	fn_combi_t16 4, 0,3,1,2,3,0
L1232:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 56 ---
L1236:	fn_link  L1248
	fn_link  L1252
	fn_combi_t45 6, 4,0,1,2,3,5
L1248:	fn_elink _prim_eq
L1252:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 57 ---
L1260:	fn_link  Common.lcgNext
	fn_link  L1220
	fn_link  L1236
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 58 ---
Common.lcgNext:	fn_link  L1292
	fn_link  L1288
	fn_combi_t3 3, 0,1,2,0,0,0
L1288:	fn_y
# --- block 59 ---
L1292:	fn_link  L1316
	fn_link  L1340
	fn_link  L1364
	fn_link  L1372
	fn_link  L1376
	fn_combi_t55 6, 0,1,2,5,3,4
L1316:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1340:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1364:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1372:	fn_y
L1376:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
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
