# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/TuplePure  (entry @0)
	.text
	.globl	Common.addW
	.globl	Common.benchFold
	.globl	Common.hashMix
	.globl	Common.lcgNext
	.globl	Common.mul3plus1
	.globl	Data.Bool_Type.True
	.globl	GExtra.$3e$3d
	.globl	GExtra.shiftR
	.globl	GExtra.xor
	.globl	Primitives.primPerformIO
	.globl	TuplePure.bench
	.globl	TuplePure.draw3
	.globl	TuplePure.dropFirst
	.globl	TuplePure.main
	.globl	TuplePure.tFoldl
	.globl	TuplePure.tFoldr
	.globl	TuplePure.tMap
	.globl	TuplePure.tZipWith
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  TuplePure.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
TuplePure.main:	fn_link  L36
	fn_elink TuplePure.bench
L36:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 3 ---
TuplePure.bench:	fn_link  L576
	fn_link  Common.benchFold
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 4 ---
L56:	fn_link  L80
	fn_link  L104
	fn_link  L112
	fn_link  L116
	fn_link  TuplePure.draw3
	fn_combi_t62 6, 0,1,2,5,3,4
L80:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L104:	fn_box
	.word 0xa1f32c97	# raw word 2717068439
	fn_box_body
L112:	fn_combi_t0 1, 0,0,0,0,0,0
L116:	fn_y
# --- block 5 ---
L120:	fn_link  L144
	fn_link  L168
	fn_link  L172
	fn_link  L180
	fn_link  TuplePure.draw3
	fn_combi_t63 6, 0,1,2,5,3,4
L144:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L168:	fn_combi_t0 2, 1,0,0,0,0,0
L172:	fn_box
	.word 0x5ee9d4b2	# raw word 1592382642
	fn_box_body
L180:	fn_y
# --- block 6 ---
L184:	fn_link  L196
	fn_link  L120
	fn_combi_t2 3, 0,2,1,0,0,0
L196:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
L200:	fn_link  L216
	fn_link  L220
	fn_link  GExtra.xor
	fn_combi_t57 4, 0,0,3,1,3,2
L216:	fn_combi_t0 3, 1,0,0,0,0,0
L220:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 8 ---
L224:	fn_link  L240
	fn_link  L244
	fn_link  GExtra.xor
	fn_combi_t57 4, 0,0,3,1,3,2
L240:	fn_combi_t0 3, 1,0,0,0,0,0
L244:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 9 ---
L248:	fn_link  L264
	fn_link  L268
	fn_link  GExtra.xor
	fn_combi_t57 4, 0,0,3,1,3,2
L264:	fn_combi_t0 3, 1,0,0,0,0,0
L268:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 10 ---
L272:	fn_link  L284
	fn_link  GExtra.xor
	fn_elink TuplePure.tFoldr
L284:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 11 ---
L292:	fn_link  L312
	fn_link  Common.addW
	fn_link  TuplePure.tFoldl
	fn_link  Common.hashMix
	fn_combi_t46 6, 0,4,1,2,3,5
L312:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 12 ---
L320:	fn_link  L272
	fn_link  L292
	fn_link  Common.hashMix
	fn_combi_t40 5, 0,1,3,4,2,4
# --- block 13 ---
L336:	fn_link  Common.hashMix
	fn_combi_t48 5, 0,1,2,4,4,3
# --- block 14 ---
L344:	fn_link  L364
	fn_link  L248
	fn_link  L320
	fn_link  L336
	fn_combi_t26 6, 0,1,4,5,2,3
L364:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 15 ---
L368:	fn_link  L344
	fn_link  Common.hashMix
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 16 ---
L380:	fn_link  Common.hashMix
	fn_combi_t62 5, 0,1,2,4,4,3
# --- block 17 ---
L388:	fn_link  L380
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 18 ---
L396:	fn_link  L416
	fn_link  L224
	fn_link  L368
	fn_link  L388
	fn_combi_t10 5, 0,1,4,2,3,0
L416:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 19 ---
L420:	fn_link  L428
	fn_combi_t26 6, 0,1,4,5,2,3
L428:	fn_combi_t48 5, 0,4,1,3,3,2
# --- block 20 ---
L432:	fn_link  L452
	fn_link  L200
	fn_link  L396
	fn_link  L420
	fn_combi_t10 5, 0,1,4,2,3,0
L452:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 21 ---
L456:	fn_link  L464
	fn_combi_t44 5, 0,1,4,2,3,4
L464:	fn_combi_t39 5, 0,4,1,3,2,3
# --- block 22 ---
L468:	fn_link  GExtra.xor
	fn_link  TuplePure.tZipWith
	fn_link  L432
	fn_link  L456
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 23 ---
L488:	fn_link  Common.addW
	fn_link  TuplePure.tZipWith
	fn_link  L468
	fn_link  L508
	fn_combi_t10 5, 0,1,4,2,3,0
L508:	fn_combi_t30 5, 0,4,1,2,4,3
# --- block 24 ---
L512:	fn_link  L184
	fn_link  L488
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 25 ---
L524:	fn_link  L532
	fn_combi_t24 6, 0,1,5,2,3,4
L532:	fn_combi_t40 5, 0,2,3,4,1,4
# --- block 26 ---
L536:	fn_link  Common.mul3plus1
	fn_link  TuplePure.tMap
	fn_link  TuplePure.dropFirst
	fn_link  L512
	fn_link  L524
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 27 ---
L560:	fn_link  L572
	fn_link  L536
	fn_combi_t14 4, 0,3,2,2,1,0
L572:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 28 ---
L576:	fn_link  L56
	fn_link  L560
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 29 ---
Common.benchFold:	fn_link  L608
	fn_link  L616
	fn_link  L712
	fn_link  L624
	fn_combi_t26 6, 0,1,4,5,2,3
L608:	fn_box
	.word 0x00c0ffee	# raw word 12648430
	fn_box_body
L616:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L624:	fn_y
# --- block 30 ---
L628:	fn_link  L640
	fn_link  L664
	fn_combi_t41 6, 2,0,4,1,3,5
L640:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L664:	fn_y
# --- block 31 ---
L668:	fn_link  L628
	fn_combi_t11 4, 0,2,1,3,3,0
# --- block 32 ---
L676:	fn_link  L688
	fn_link  Data.Bool_Type.True
	fn_combi_t46 6, 0,1,2,3,4,5
L688:	fn_elink _error0
# --- block 33 ---
L692:	fn_link  L668
	fn_link  L676
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 34 ---
L704:	fn_link  GExtra.$3e$3d
	fn_combi_t28 5, 0,3,1,2,4,4
# --- block 35 ---
L712:	fn_link  L692
	fn_link  L704
	fn_link  L728
	fn_combi_t5 4, 0,1,3,2,0,0
L728:	fn_combi_t32 5, 0,1,2,3,4,4
# --- block 36 ---
GExtra.$3e$3d:	fn_link  L740
	fn_combi_t3 3, 2,1,0,0,0,0
L740:	fn_elink _prim_geu
# --- block 37 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 38 ---
Common.hashMix:	fn_link  L764
	fn_link  L872
	fn_link  L900
	fn_combi_t21 5, 0,1,2,3,4,0
# --- block 39 ---
L764:	fn_link  L784
	fn_link  GExtra.xor
	fn_link  L808
	fn_link  L816
	fn_combi_t60 6, 0,1,2,4,5,3
L784:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L808:	fn_box
	.word 0x85ebca6b	# raw word 2246822507
	fn_box_body
L816:	fn_y
# --- block 40 ---
L820:	fn_link  L840
	fn_link  L864
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t30 5, 0,4,1,4,2,3
L840:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L864:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 41 ---
L872:	fn_link  L820
	fn_link  L888
	fn_link  L896
	fn_combi_t8 4, 0,1,2,3,0,0
L888:	fn_box
	.word 0xc2b2ae35	# raw word 3266489909
	fn_box_body
L896:	fn_y
# --- block 42 ---
L900:	fn_link  L916
	fn_link  GExtra.shiftR
	fn_link  GExtra.xor
	fn_combi_t16 4, 0,3,1,3,2,0
L916:	fn_box
	.word 0x00000010	# raw word 16
	fn_box_body
# --- block 43 ---
GExtra.xor:	fn_link  L936
	fn_link  L960
	fn_combi_t8 4, 0,3,2,1,0,0
L936:	fn_tor a0
	fn_tor a1
	xor a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L960:	fn_y
# --- block 44 ---
GExtra.shiftR:	fn_link  L976
	fn_link  L1000
	fn_combi_t8 4, 0,3,2,1,0,0
L976:	fn_tor a0
	fn_tor a1
	srlw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1000:	fn_y
# --- block 45 ---
TuplePure.tFoldl:	fn_link  L1016
	fn_link  L1020
	fn_combi_t19 5, 4,0,1,2,3,0
L1016:	fn_combi_t0 1, 0,0,0,0,0,0
L1020:	fn_combi_t54 4, 0,0,0,1,2,3
# --- block 46 ---
Common.addW:	fn_link  L1036
	fn_link  L1060
	fn_combi_t8 4, 0,3,2,1,0,0
L1036:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1060:	fn_y
# --- block 47 ---
TuplePure.tFoldr:	fn_link  L1080
	fn_link  L1076
	fn_combi_t52 5, 4,0,1,2,2,3
L1076:	fn_combi_t46 6, 1,3,0,2,4,5
# --- block 48 ---
L1080:	fn_link  L1092
	fn_link  L1096
	fn_combi_t3 3, 0,1,2,0,0,0
L1092:	fn_combi_t0 1, 0,0,0,0,0,0
L1096:	fn_combi_t16 4, 0,2,0,3,1,0
# --- block 49 ---
TuplePure.tZipWith:	fn_link  L1140
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 50 ---
L1108:	fn_link  L1116
	fn_combi_t40 6, 0,1,2,4,3,5
L1116:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 51 ---
L1120:	fn_link  L1108
	fn_combi_t14 4, 0,1,2,1,3,0
# --- block 52 ---
L1128:	fn_link  L1136
	fn_combi_t52 6, 1,0,2,4,3,5
L1136:	fn_combi_t42 6, 0,3,4,1,2,5
# --- block 53 ---
L1140:	fn_link  L1120
	fn_link  L1128
	fn_combi_t30 5, 0,3,1,2,4,2
# --- block 54 ---
TuplePure.draw3:	fn_link  Common.lcgNext
	fn_link  L1196
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 55 ---
L1164:	fn_link  L1172
	fn_combi_t32 5, 4,0,1,2,3,3
L1172:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 56 ---
L1176:	fn_link  Common.lcgNext
	fn_link  L1192
	fn_link  L1164
	fn_combi_t43 5, 0,3,4,1,2,4
L1192:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 57 ---
L1196:	fn_link  Common.lcgNext
	fn_link  L1176
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 58 ---
Common.lcgNext:	fn_link  L1224
	fn_link  L1220
	fn_combi_t3 3, 0,1,2,0,0,0
L1220:	fn_y
# --- block 59 ---
L1224:	fn_link  L1248
	fn_link  L1272
	fn_link  L1296
	fn_link  L1304
	fn_link  L1308
	fn_combi_t55 6, 0,1,2,5,3,4
L1248:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1272:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1296:	fn_box
	.word 0x0019660d	# raw word 1664525
	fn_box_body
L1304:	fn_y
L1308:	fn_box
	.word 0x3c6ef35f	# raw word 1013904223
	fn_box_body
# --- block 60 ---
TuplePure.dropFirst:	fn_link  L1324
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 61 ---
L1324:	fn_link  L1336
	fn_link  L1344
	fn_combi_t1 3, 0,1,0,0,0,0
L1336:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L1344:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 62 ---
TuplePure.tMap:	fn_link  L1384
	fn_combi_t3 3, 2,0,1,0,0,0
# --- block 63 ---
L1356:	fn_link  L1364
	fn_combi_t15 4, 0,1,2,1,3,0
L1364:	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 64 ---
L1368:	fn_link  L1380
	fn_link  L1356
	fn_combi_t3 3, 0,1,2,0,0,0
L1380:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 65 ---
L1384:	fn_link  L1368
	fn_combi_t37 5, 0,1,2,3,1,4
# --- block 66 ---
Common.mul3plus1:	fn_link  L1416
	fn_link  L1440
	fn_link  L1464
	fn_link  L1472
	fn_link  L1476
	fn_combi_t55 6, 0,1,2,5,3,4
L1416:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1440:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L1464:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L1472:	fn_y
L1476:	fn_y

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
