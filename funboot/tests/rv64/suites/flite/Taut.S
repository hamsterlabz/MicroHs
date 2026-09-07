# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Taut  (entry @0)
	.text
	.globl	Data.Bool_Type.True
	.globl	Data.List_Type.$2b$2b
	.globl	Data.List_Type.$3a
	.globl	NanoPrelude.and
	.globl	NanoPrelude.filter
	.globl	NanoPrelude.foldr1
	.globl	NanoPrelude.fromJust
	.globl	NanoPrelude.length
	.globl	NanoPrelude.lookup
	.globl	NanoPrelude.map
	.globl	NanoPrelude.zip
	.globl	Primitives.primPerformIO
	.globl	Taut.bools
	.globl	Taut.eval
	.globl	Taut.find
	.globl	Taut.imp
	.globl	Taut.isTaut
	.globl	Taut.main
	.globl	Taut.names
	.globl	Taut.neq
	.globl	Taut.rmdups
	.globl	Taut.substs
	.globl	Taut.testProp
	.globl	Taut.vars
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Taut.main
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
	fn_link  L24
	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Taut.main:	fn_link  L44
	fn_link  L52
	fn_link  Taut.testProp
	fn_elink Taut.isTaut
L44:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L52:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 3 ---
Taut.isTaut:	fn_link  L72
	fn_link  NanoPrelude.and
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 4 ---
L72:	fn_link  Taut.substs
	fn_link  Taut.eval
	fn_link  L92
	fn_link  NanoPrelude.map
	fn_combi_t40 5, 0,1,2,4,3,4
L92:	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 5 ---
NanoPrelude.and:	fn_link  L112
	fn_link  L108
	fn_combi_t2 3, 2,0,1,0,0,0
L108:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 6 ---
L112:	fn_link  NanoPrelude.and
	fn_link  L124
	fn_combi_t6 4, 2,0,1,3,0,0
L124:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 7 ---
NanoPrelude.map:	fn_link  L156
	fn_link  L140
	fn_combi_t3 3, 0,1,2,0,0,0
L140:	fn_y
# --- block 8 ---
L144:	fn_link  L152
	fn_combi_t15 5, 0,1,3,2,4,0
L152:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 9 ---
L156:	fn_link  L144
	fn_link  L168
	fn_combi_t16 5, 4,0,1,2,3,0
L168:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 10 ---
Taut.eval:	fn_link  L300
	fn_link  L184
	fn_combi_t3 3, 0,1,2,0,0,0
L184:	fn_y
# --- block 11 ---
L188:	fn_link  Taut.find
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 12 ---
L196:	fn_link  L208
	fn_link  L212
	fn_combi_t4 4, 2,3,0,1,0,0
L208:	fn_combi_t0 2, 0,0,0,0,0,0
L212:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 13 ---
L216:	fn_link  L224
	fn_combi_t14 4, 1,2,0,1,3,0
L224:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 14 ---
L228:	fn_link  L240
	fn_link  L216
	fn_combi_t3 3, 0,1,2,0,0,0
L240:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 15 ---
L244:	fn_link  L252
	fn_combi_t14 4, 1,2,0,1,3,0
L252:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 16 ---
L256:	fn_link  L268
	fn_link  L244
	fn_combi_t3 3, 0,1,2,0,0,0
L268:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 17 ---
L272:	fn_link  L228
	fn_link  L292
	fn_link  L256
	fn_link  L296
	fn_combi_t38 5, 0,1,4,2,3,4
L292:	fn_combi_t0 1, 0,0,0,0,0,0
L296:	fn_combi_t23 6, 5,0,1,2,3,4
# --- block 18 ---
L300:	fn_link  L188
	fn_link  L196
	fn_link  L272
	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 19 ---
Taut.find:	fn_link  NanoPrelude.lookup
	fn_link  NanoPrelude.fromJust
	fn_link  L332
	fn_combi_t16 5, 0,1,2,3,4,0
L332:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 20 ---
NanoPrelude.fromJust:	fn_link  L348
	fn_link  L352
	fn_combi_t2 3, 2,0,1,0,0,0
L348:	fn_combi_t0 1, 0,0,0,0,0,0
L352:	fn_elink _error0
# --- block 21 ---
NanoPrelude.lookup:	fn_link  L416
	fn_link  L368
	fn_combi_t3 3, 0,1,2,0,0,0
L368:	fn_y
# --- block 22 ---
L372:	fn_link  L380
	fn_combi_t15 5, 4,1,0,2,3,0
L380:	fn_elink _prim_eq
# --- block 23 ---
L384:	fn_link  L400
	fn_link  L372
	fn_link  L404
	fn_combi_t5 4, 0,1,3,2,0,0
L400:	fn_combi_t1 3, 2,0,0,0,0,0
L404:	fn_combi_t37 6, 0,2,3,4,1,5
# --- block 24 ---
L408:	fn_link  L384
	fn_combi_t18 5, 3,0,1,2,4,0
# --- block 25 ---
L416:	fn_link  L408
	fn_link  L428
	fn_combi_t16 5, 4,0,1,2,3,0
L428:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 26 ---
Taut.substs:	fn_link  L444
	fn_link  L456
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 27 ---
L444:	fn_link  Taut.vars
	fn_link  Taut.rmdups
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 28 ---
L456:	fn_link  NanoPrelude.length
	fn_link  Taut.bools
	fn_link  NanoPrelude.zip
	fn_link  NanoPrelude.map
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 29 ---
NanoPrelude.zip:	fn_link  L524
	fn_link  L488
	fn_combi_t6 4, 2,0,1,3,0,0
L488:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 30 ---
L492:	fn_link  L500
	fn_combi_t44 6, 0,1,4,2,3,5
L500:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 31 ---
L504:	fn_link  NanoPrelude.zip
	fn_link  L520
	fn_link  L492
	fn_combi_t5 4, 0,1,3,2,0,0
L520:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 32 ---
L524:	fn_link  L504
	fn_link  L536
	fn_combi_t16 5, 2,0,1,3,4,0
L536:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 33 ---
Taut.bools:	fn_link  L552
	fn_link  L676
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 34 ---
L552:	fn_link  L564
	fn_link  L568
	fn_combi_t2 4, 3,0,1,0,0,0
L564:	fn_combi_t0 2, 0,0,0,0,0,0
L568:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 35 ---
L572:	fn_link  L584
	fn_link  L608
	fn_combi_t3 3, 0,2,1,0,0,0
L584:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L608:	fn_y
# --- block 36 ---
L612:	fn_link  Taut.bools
	fn_link  L632
	fn_link  Data.List_Type.$3a
	fn_link  NanoPrelude.map
	fn_combi_t15 5, 0,1,2,3,4,0
L632:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 37 ---
L636:	fn_link  Taut.bools
	fn_link  L660
	fn_link  Data.List_Type.$3a
	fn_link  NanoPrelude.map
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t57 6, 0,1,2,3,4,5
L660:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 38 ---
L664:	fn_link  L612
	fn_link  L636
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 39 ---
L676:	fn_link  L572
	fn_link  L664
	fn_link  L696
	fn_link  L700
	fn_combi_t45 5, 0,4,1,2,3,4
L696:	fn_elink _prim_eq
L700:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 40 ---
Data.List_Type.$2b$2b:	fn_link  L736
	fn_link  L720
	fn_combi_t5 4, 0,1,3,2,0,0
L720:	fn_y
# --- block 41 ---
L724:	fn_link  L732
	fn_combi_t6 4, 0,2,1,3,0,0
L732:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 42 ---
L736:	fn_link  L724
	fn_combi_t6 4, 3,1,0,2,0,0
# --- block 43 ---
Data.List_Type.$3a:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 44 ---
NanoPrelude.length:	fn_link  L760
	fn_link  L808
	fn_y
L760:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 45 ---
L768:	fn_link  L780
	fn_link  L804
	fn_combi_t8 5, 2,0,3,1,0,0
L780:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L804:	fn_y
# --- block 46 ---
L808:	fn_link  L768
	fn_combi_t16 4, 3,2,0,1,2,0
# --- block 47 ---
Taut.rmdups:	fn_link  L848
	fn_link  L828
	fn_combi_t2 3, 2,0,1,0,0,0
L828:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 48 ---
L832:	fn_link  Taut.neq
	fn_link  NanoPrelude.filter
	fn_link  Taut.rmdups
	fn_combi_t19 5, 0,1,2,3,4,0
# --- block 49 ---
L848:	fn_link  L832
	fn_link  L860
	fn_combi_t16 4, 0,2,1,2,3,0
L860:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 50 ---
NanoPrelude.filter:	fn_link  L928
	fn_link  L876
	fn_combi_t3 3, 0,1,2,0,0,0
L876:	fn_y
# --- block 51 ---
L880:	fn_link  L892
	fn_link  Data.Bool_Type.True
	fn_combi_t48 6, 2,4,0,1,3,5
L892:	fn_elink _error0
# --- block 52 ---
L896:	fn_link  L904
	fn_combi_t24 5, 0,1,4,2,3,4
L904:	fn_combi_t48 5, 0,4,1,3,2,4
# --- block 53 ---
L908:	fn_link  L924
	fn_link  L880
	fn_link  L896
	fn_combi_t26 5, 0,1,3,4,2,4
L924:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 54 ---
L928:	fn_link  L908
	fn_link  L940
	fn_combi_t16 5, 4,0,1,2,3,0
L940:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 55 ---
Data.Bool_Type.True:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 56 ---
Taut.neq:	fn_link  L964
	fn_link  L968
	fn_link  L972
	fn_combi_t10 5, 4,3,0,1,2,0
L964:	fn_combi_t0 2, 1,0,0,0,0,0
L968:	fn_combi_t0 2, 0,0,0,0,0,0
L972:	fn_elink _prim_ne
# --- block 57 ---
Taut.vars:	fn_link  L1000
	fn_link  Taut.vars
	fn_link  L1012
	fn_link  L1024
	fn_link  L1036
	fn_combi_t23 6, 5,0,1,2,3,4
# --- block 58 ---
L1000:	fn_link  L1008
	fn_combi_t2 4, 3,1,0,0,0,0
L1008:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 59 ---
L1012:	fn_link  Taut.vars
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 60 ---
L1024:	fn_link  L1032
	fn_combi_t0 2, 0,0,0,0,0,0
L1032:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 61 ---
L1036:	fn_link  Taut.vars
	fn_link  Data.List_Type.$2b$2b
	fn_combi_t15 4, 0,1,2,1,3,0
# --- block 62 ---
Taut.testProp:	fn_link  L1108
	fn_link  L1132
	fn_combi_t2 7, 4,0,1,0,0,0
# --- block 63 ---
L1060:	fn_link  Taut.names
	fn_link  L1072
	fn_elink NanoPrelude.map
L1072:	fn_combi_t1 6, 5,0,0,0,0,0
# --- block 64 ---
L1076:	fn_link  L1060
	fn_link  L1088
	fn_elink NanoPrelude.foldr1
L1088:	fn_combi_t2 7, 2,0,1,0,0,0
# --- block 65 ---
L1092:	fn_link  L1100
	fn_combi_t1 6, 5,0,0,0,0,0
L1100:	fn_box
	.word 0x0000002a	# raw word 42
	fn_box_body
# --- block 66 ---
L1108:	fn_link  L1076
	fn_link  L1092
	fn_combi_t2 7, 4,0,1,0,0,0
# --- block 67 ---
L1120:	fn_link  Taut.names
	fn_link  Taut.imp
	fn_elink NanoPrelude.map
# --- block 68 ---
L1132:	fn_link  L1120
	fn_link  L1144
	fn_elink NanoPrelude.foldr1
L1144:	fn_combi_t2 7, 2,0,1,0,0,0
# --- block 69 ---
NanoPrelude.foldr1:	fn_link  L1164
	fn_link  L1160
	fn_combi_t3 3, 0,1,2,0,0,0
L1160:	fn_y
# --- block 70 ---
L1164:	fn_link  L1180
	fn_link  L1184
	fn_link  L1188
	fn_combi_t47 6, 5,0,1,2,3,4
L1180:	fn_combi_t6 6, 0,2,1,3,0,0
L1184:	fn_combi_t46 4, 3,2,0,1,2,3
L1188:	fn_elink _error0
# --- block 71 ---
Taut.imp:	fn_link  L1212
	fn_link  L1216
	fn_link  L1224
	fn_link  L1228
	fn_combi_t15 5, 0,1,2,3,4,0
L1212:	fn_combi_t1 6, 5,0,0,0,0,0
L1216:	fn_box
	.word 0x0000002a	# raw word 42
	fn_box_body
L1224:	fn_combi_t1 6, 5,0,0,0,0,0
L1228:	fn_combi_t2 7, 4,0,1,0,0,0
# --- block 72 ---
Taut.names:	fn_link  L1336
	fn_link  L1244
	fn_combi_t2 4, 3,0,1,0,0,0
L1244:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 73 ---
L1252:	fn_link  L1264
	fn_link  L1268
	fn_combi_t2 4, 3,0,1,0,0,0
L1264:	fn_combi_t0 2, 0,0,0,0,0,0
L1268:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 74 ---
L1276:	fn_link  L1252
	fn_link  L1288
	fn_combi_t2 4, 3,0,1,0,0,0
L1288:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 75 ---
L1296:	fn_link  L1276
	fn_link  L1308
	fn_combi_t2 4, 3,0,1,0,0,0
L1308:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 76 ---
L1316:	fn_link  L1296
	fn_link  L1328
	fn_combi_t2 4, 3,0,1,0,0,0
L1328:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 77 ---
L1336:	fn_link  L1316
	fn_link  L1348
	fn_combi_t2 4, 3,0,1,0,0,0
L1348:	fn_box
	.word 0x00000001	# raw word 1
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
