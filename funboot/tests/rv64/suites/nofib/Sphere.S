# fun assembly : /home/cecil/work/MicroHs/funboot/rv64g/build/Sphere  (entry @0)
	.text
	.globl	NanoPrelude.$26$26
	.globl	NanoPrelude.$2a.
	.globl	NanoPrelude.$2b.
	.globl	NanoPrelude.$2d.
	.globl	NanoPrelude.$2f.
	.globl	NanoPrelude.$3c$3d.
	.globl	NanoPrelude.$3c.
	.globl	NanoPrelude.foldr
	.globl	NanoPrelude.fst
	.globl	NanoPrelude.map
	.globl	NanoPrelude.not
	.globl	NanoPrelude.null
	.globl	NanoPrelude.snd
	.globl	Primitives.primPerformIO
	.globl	Sphere.Ambient
	.globl	Sphere.Diffuse
	.globl	Sphere.Reflect
	.globl	Sphere.Specpow
	.globl	Sphere.Specular
	.globl	Sphere.ambientsurf
	.globl	Sphere.append
	.globl	Sphere.background
	.globl	Sphere.bench
	.globl	Sphere.bodysurf
	.globl	Sphere.camparams
	.globl	Sphere.cosD
	.globl	Sphere.d
	.globl	Sphere.diffusesurf
	.globl	Sphere.dtor
	.globl	Sphere.epsilon
	.globl	Sphere.fov
	.globl	Sphere.fromTo
	.globl	Sphere.hashV
	.globl	Sphere.headD
	.globl	Sphere.infinity
	.globl	Sphere.is_zerovector
	.globl	Sphere.lightcolour
	.globl	Sphere.lightdirection
	.globl	Sphere.lightray
	.globl	Sphere.lookat
	.globl	Sphere.lookfrom
	.globl	Sphere.piD
	.globl	Sphere.powD
	.globl	Sphere.ray
	.globl	Sphere.reflectray
	.globl	Sphere.reflectsurf
	.globl	Sphere.refractray
	.globl	Sphere.refractsurf
	.globl	Sphere.roundU8
	.globl	Sphere.s2
	.globl	Sphere.shade
	.globl	Sphere.shadowed
	.globl	Sphere.simWin
	.globl	Sphere.sinD
	.globl	Sphere.specpowsurf
	.globl	Sphere.specularsurf
	.globl	Sphere.sphereintersect
	.globl	Sphere.spherenormal
	.globl	Sphere.spheresurf
	.globl	Sphere.tanD
	.globl	Sphere.testlights
	.globl	Sphere.testspheres
	.globl	Sphere.trace
	.globl	Sphere.tracepixel
	.globl	Sphere.transmitray
	.globl	Sphere.transmitsurf
	.globl	Sphere.vecadd
	.globl	Sphere.veccross
	.globl	Sphere.vecdot
	.globl	Sphere.vecmult
	.globl	Sphere.vecnorm
	.globl	Sphere.vecscale
	.globl	Sphere.vecsub
	.globl	Sphere.vecsum
	.globl	Sphere.vup
	.globl	_funMain
	.globl	main
	.option arch, +xfun
main:
# --- block 0 ---
_funMain:	fn_link  Sphere.bench
L4:	fn_elink Primitives.primPerformIO
# --- block 1 ---
Primitives.primPerformIO:	fn_link  L20
L12:	fn_link  L24
L16:	fn_combi_t2 3, 0,2,1,0,0,0
L20:	fn_combi_t0 1, 0,0,0,0,0,0
L24:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 2 ---
Sphere.bench:	fn_link  L44
	fn_elink Sphere.hashV
# --- block 3 ---
L36:	fn_link  Sphere.simWin
	fn_elink Sphere.ray
# --- block 4 ---
L44:	fn_link  L36
	fn_link  NanoPrelude.snd
	fn_elink NanoPrelude.map
# --- block 5 ---
Sphere.hashV:	fn_link  L68
L60:	fn_link  L428
	fn_elink NanoPrelude.foldr
L68:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 6 ---
L76:	fn_link  L96
	fn_link  L104
	fn_link  NanoPrelude.$2a.
	fn_link  Sphere.roundU8
	fn_combi_t19 5, 0,1,2,3,4,0
L96:	fn_box
L100:	.word 0x000000ff	# raw word 255
	fn_box_body
L104:	fn_elink _prim_itof
# --- block 7 ---
L108:	fn_link  L116
	fn_combi_t2 3, 1,2,0,0,0,0
L116:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 8 ---
L140:	fn_link  L156
	fn_link  L180
	fn_link  L188
	fn_combi_t35 6, 0,1,3,5,2,4
L156:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L180:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
L188:	fn_y
# --- block 9 ---
L192:	fn_link  L200
	fn_combi_t33 6, 0,1,2,4,5,3
L200:	fn_y
# --- block 10 ---
L204:	fn_link  L224
	fn_link  L108
	fn_link  L140
	fn_link  L192
	fn_combi_t29 5, 0,1,4,2,4,3
L224:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
# --- block 11 ---
L248:	fn_link  L264
	fn_link  L288
	fn_link  L296
	fn_combi_t35 6, 0,1,3,5,2,4
L264:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L288:	fn_box
	.word 0x00000017	# raw word 23
	fn_box_body
L296:	fn_y
# --- block 12 ---
L300:	fn_link  L308
	fn_combi_t33 6, 0,1,2,4,5,3
L308:	fn_y
# --- block 13 ---
L312:	fn_link  L248
	fn_link  L300
	fn_combi_t29 6, 0,1,2,3,5,4
# --- block 14 ---
L324:	fn_link  L340
	fn_link  L204
	fn_link  L312
	fn_combi_t11 4, 0,3,1,3,2,0
L340:	fn_tor a0
	fn_tor a1
	addw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
L360:	fn_go a0
# --- block 15 ---
L364:	fn_link  L380
	fn_link  L404
	fn_link  L412
	fn_combi_t41 6, 0,1,3,2,4,5
L380:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L404:	fn_box
	.word 0x0000003d	# raw word 61
	fn_box_body
L412:	fn_y
# --- block 16 ---
L416:	fn_link  L424
	fn_combi_t54 6, 0,1,2,3,4,5
L424:	fn_y
# --- block 17 ---
L428:	fn_link  L76
	fn_link  L324
	fn_link  L364
	fn_link  L416
	fn_combi_t57 6, 4,0,1,5,2,3
# --- block 18 ---
NanoPrelude.foldr:	fn_link  L464
	fn_link  L460
	fn_combi_t7 4, 0,1,2,3,0,0
L460:	fn_y
# --- block 19 ---
L464:	fn_link  L472
	fn_combi_t16 5, 4,2,0,1,3,0
L472:	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 20 ---
Sphere.roundU8:	fn_link  L500
	fn_link  L508
	fn_link  Sphere.d
	fn_link  NanoPrelude.$2b.
	fn_link  L516
	fn_combi_t58 6, 0,1,5,2,3,4
L500:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L508:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L516:	fn_elink _prim_ftoi
# --- block 21 ---
NanoPrelude.$2b.:	fn_link  L532
	fn_link  L536
	fn_combi_t8 4, 0,3,2,1,0,0
L532:	fn_elink _prim_fadd
L536:	fn_y
# --- block 22 ---
Sphere.d:	fn_link  L552
	fn_link  NanoPrelude.$2f.
	fn_combi_t15 4, 0,1,2,1,3,0
L552:	fn_elink _prim_itof
# --- block 23 ---
NanoPrelude.$2f.:	fn_link  L568
	fn_link  L572
	fn_combi_t8 4, 0,3,2,1,0,0
L568:	fn_elink _prim_fdiv
L572:	fn_y
# --- block 24 ---
NanoPrelude.$2a.:	fn_link  L588
	fn_link  L592
	fn_combi_t8 4, 0,3,2,1,0,0
L588:	fn_elink _prim_fmul
L592:	fn_y
# --- block 25 ---
NanoPrelude.map:	fn_link  L624
	fn_link  L608
	fn_combi_t3 3, 0,1,2,0,0,0
L608:	fn_y
# --- block 26 ---
L612:	fn_link  L620
	fn_combi_t15 5, 0,1,3,2,4,0
L620:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 27 ---
L624:	fn_link  L612
	fn_link  L636
	fn_combi_t16 5, 4,0,1,2,3,0
L636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 28 ---
NanoPrelude.snd:	fn_link  L648
	fn_combi_t1 2, 1,0,0,0,0,0
L648:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 29 ---
Sphere.ray:	fn_link  L684
	fn_link  L1008
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 30 ---
L664:	fn_link  Sphere.fov
	fn_link  Sphere.vup
	fn_link  Sphere.lookat
	fn_link  Sphere.lookfrom
	fn_elink Sphere.camparams
# --- block 31 ---
L684:	fn_link  L696
	fn_link  L664
	fn_combi_t3 3, 0,1,2,0,0,0
L696:	fn_elink _prim_itof
# --- block 32 ---
L700:	fn_link  L720
	fn_link  L744
	fn_link  L748
	fn_link  Sphere.fromTo
	fn_combi_t17 5, 0,1,2,4,3,0
L720:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L744:	fn_y
L748:	fn_box
L752:	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 33 ---
L756:	fn_link  L776
	fn_link  L800
	fn_link  L804
	fn_link  Sphere.fromTo
	fn_combi_t17 5, 0,1,2,4,3,0
L776:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L800:	fn_y
L804:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 34 ---
L812:	fn_link  L832
	fn_link  Sphere.testlights
	fn_link  Sphere.testspheres
	fn_link  Sphere.tracepixel
	fn_combi_t14 5, 0,1,2,3,4,0
L832:	fn_elink _prim_itof
# --- block 35 ---
L836:	fn_link  L856
	fn_link  L860
	fn_link  L812
	fn_link  L864
	fn_combi_t24 6, 0,1,5,2,4,3
L856:	fn_combi_t0 3, 0,0,0,0,0,0
L860:	fn_elink _prim_itof
L864:	fn_combi_t29 6, 0,1,5,2,3,4
# --- block 36 ---
L868:	fn_link  L880
	fn_link  L836
	fn_combi_t14 4, 0,2,3,2,1,0
L880:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 37 ---
L884:	fn_link  L896
	fn_link  L868
	fn_combi_t37 5, 0,2,3,4,2,1
L896:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 38 ---
L900:	fn_link  L908
	fn_combi_t40 5, 4,0,1,3,2,3
L908:	fn_combi_t2 3, 2,0,1,0,0,0
# --- block 39 ---
L912:	fn_link  L884
	fn_link  L900
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 40 ---
L924:	fn_link  L932
	fn_combi_t40 6, 0,1,2,4,3,5
L932:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 41 ---
L936:	fn_link  L912
	fn_link  L924
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 42 ---
L948:	fn_link  L936
	fn_link  L960
	fn_combi_t3 3, 0,1,2,0,0,0
L960:	fn_combi_t44 6, 5,1,3,0,2,4
# --- block 43 ---
L964:	fn_link  L972
	fn_combi_t32 6, 0,1,3,4,5,2
L972:	fn_y
# --- block 44 ---
L976:	fn_link  L756
	fn_link  L948
	fn_link  L964
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 45 ---
L992:	fn_link  L976
	fn_link  L1004
L1000:	fn_combi_t46 6, 5,0,1,2,3,4
L1004:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 46 ---
L1008:	fn_link  L700
	fn_link  L992
	fn_link  L1024
	fn_combi_t40 5, 0,1,3,4,2,3
L1024:	fn_y
# --- block 47 ---
Sphere.tracepixel:	fn_link  Sphere.lookfrom
	fn_link  L1088
	fn_link  L1256
	fn_link  L1048
	fn_combi_t10 5, 0,1,4,2,3,0
L1048:	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 48 ---
L1052:	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t58 5, 0,0,3,1,4,2
# --- block 49 ---
L1064:	fn_link  Sphere.vecnorm
	fn_combi_t35 6, 0,1,2,5,3,4
# --- block 50 ---
L1072:	fn_link  L1064
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 51 ---
L1080:	fn_link  L1072
	fn_combi_t24 6, 0,1,5,2,4,3
# --- block 52 ---
L1088:	fn_link  L1108
	fn_link  Sphere.vecscale
	fn_link  L1052
	fn_link  L1080
	fn_combi_t10 5, 0,1,4,2,3,0
L1108:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 53 ---
L1112:	fn_link  L1120
	fn_elink _prim_itof
L1120:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 54 ---
L1128:	fn_link  L1112
	fn_link  L1144
	fn_link  L1152
	fn_combi_t29 4, 3,0,1,0,1,2
L1144:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1152:	fn_elink _prim_itof
# --- block 55 ---
L1156:	fn_link  L1168
	fn_link  Sphere.shade
	fn_combi_t25 6, 0,2,5,1,3,4
L1168:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 56 ---
L1172:	fn_link  L1128
	fn_link  L1192
	fn_link  L1156
	fn_link  L1196
	fn_combi_t26 6, 0,1,4,5,2,3
L1192:	fn_combi_t0 3, 1,0,0,0,0,0
L1196:	fn_combi_t28 5, 0,3,4,4,1,2
# --- block 57 ---
L1200:	fn_link  Sphere.background
	fn_link  L1212
	fn_combi_t42 5, 4,0,1,2,3,4
L1212:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 58 ---
L1216:	fn_link  L1200
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 59 ---
L1224:	fn_link  L1172
	fn_link  L1216
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 60 ---
L1236:	fn_link  Sphere.trace
	fn_link  L1224
	fn_link  L1252
	fn_combi_t10 5, 0,1,4,2,3,0
L1252:	fn_combi_t30 5, 0,4,1,2,4,3
# --- block 61 ---
L1256:	fn_link  L1236
	fn_link  L1268
	fn_combi_t7 4, 0,1,2,3,0,0
L1268:	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 62 ---
Sphere.background:	fn_link  L1312
	fn_link  L1340
	fn_link  L1296
	fn_link  L1304
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L1296:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L1304:	fn_box
	.word 0x0000004e	# raw word 78
	fn_box_body
# --- block 63 ---
L1312:	fn_link  L1324
	fn_link  L1332
	fn_elink Sphere.d
L1324:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L1332:	fn_box
	.word 0x000002f1	# raw word 753
	fn_box_body
# --- block 64 ---
L1340:	fn_link  L1352
	fn_link  L1360
	fn_elink Sphere.d
L1352:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L1360:	fn_box
	.word 0x00000169	# raw word 361
	fn_box_body
# --- block 65 ---
Sphere.shade:	fn_link  Sphere.spheresurf
	fn_link  Sphere.transmitsurf
	fn_link  L2092
	fn_link  L2132
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 66 ---
L1388:	fn_link  Sphere.bodysurf
	fn_link  Sphere.vecscale
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 67 ---
L1400:	fn_link  Sphere.reflectsurf
	fn_link  Sphere.specularsurf
	fn_link  Sphere.vecscale
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 68 ---
L1416:	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 69 ---
L1428:	fn_link  L1448
	fn_link  L1456
	fn_link  L1460
	fn_link  NanoPrelude.$2a.
	fn_combi_t41 6, 0,1,2,3,4,5
L1448:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L1456:	fn_elink _prim_itof
L1460:	fn_elink _prim_fneg
# --- block 70 ---
L1464:	fn_link  Sphere.vecdot
	fn_link  L1428
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 71 ---
L1476:	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t48 5, 0,3,1,4,2,4
# --- block 72 ---
L1488:	fn_link  L1464
	fn_link  L1476
	fn_combi_t5 3, 0,1,2,2,0,0
# --- block 73 ---
L1500:	fn_link  Sphere.lightray
	fn_combi_t23 6, 0,5,2,3,4,1
# --- block 74 ---
L1508:	fn_link  L1516
	fn_elink _prim_itof
L1516:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 75 ---
L1524:	fn_link  L1508
	fn_link  L1540
	fn_link  L1548
	fn_combi_t29 4, 3,0,1,0,1,2
L1540:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L1548:	fn_elink _prim_itof
# --- block 76 ---
L1552:	fn_link  Sphere.ambientsurf
	fn_link  L1524
	fn_link  Sphere.vecmult
	fn_link  Sphere.vecadd
	fn_combi_t20 5, 0,1,2,3,4,0
# --- block 77 ---
L1572:	fn_link  NanoPrelude.map
	fn_link  Sphere.vecsum
	fn_link  L1552
	fn_link  L1592
	fn_combi_t10 5, 0,1,4,2,3,0
L1592:	fn_combi_t61 6, 0,1,2,3,5,4
# --- block 78 ---
L1596:	fn_link  L1572
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 79 ---
L1604:	fn_link  L1500
	fn_link  L1596
	fn_combi_t11 4, 0,3,1,3,2,0
# --- block 80 ---
L1616:	fn_link  L1624
	fn_combi_t2 3, 2,0,1,0,0,0
L1624:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 81 ---
L1628:	fn_link  Sphere.transmitray
	fn_combi_t23 6, 0,1,5,4,2,3
# --- block 82 ---
L1636:	fn_link  Sphere.refractsurf
	fn_link  L1628
	fn_combi_t14 5, 0,2,3,1,4,0
# --- block 83 ---
L1648:	fn_link  L1636
	fn_link  L1660
	fn_combi_t32 6, 0,1,2,3,5,4
L1660:	fn_combi_t23 6, 0,3,5,2,1,4
# --- block 84 ---
L1664:	fn_link  Sphere.epsilon
	fn_link  NanoPrelude.$3c.
	fn_combi_t42 6, 0,2,1,3,4,5
# --- block 85 ---
L1676:	fn_link  L1664
	fn_combi_t46 6, 0,3,1,2,4,5
# --- block 86 ---
L1684:	fn_link  L1648
	fn_link  L1676
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 87 ---
L1696:	fn_link  L1704
	fn_combi_t32 6, 0,1,3,4,5,2
L1704:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 88 ---
L1708:	fn_link  L1616
	fn_link  L1684
	fn_link  L1696
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 89 ---
L1724:	fn_link  Sphere.vecadd
	fn_link  L1736
	fn_combi_t42 5, 4,0,3,1,2,3
L1736:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 90 ---
L1740:	fn_link  L1752
	fn_link  L1724
	fn_combi_t6 4, 0,2,1,3,0,0
L1752:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 91 ---
L1756:	fn_link  Sphere.reflectray
	fn_combi_t23 6, 0,3,4,1,5,2
# --- block 92 ---
L1764:	fn_link  Sphere.is_zerovector
	fn_combi_t30 4, 0,3,1,3,2,2
# --- block 93 ---
L1772:	fn_link  L1756
	fn_link  L1764
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 94 ---
L1784:	fn_link  L1792
	fn_combi_t24 6, 0,1,5,2,3,4
L1792:	fn_combi_t41 5, 0,1,4,3,2,4
# --- block 95 ---
L1796:	fn_link  L1784
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 96 ---
L1804:	fn_link  L1820
	fn_link  L1772
	fn_link  L1796
	fn_combi_t12 5, 0,1,3,4,2,0
L1820:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 97 ---
L1824:	fn_link  L1844
	fn_link  L1740
	fn_link  L1804
	fn_link  L1848
	fn_combi_t10 5, 0,1,4,2,3,0
L1844:	fn_combi_t0 2, 1,0,0,0,0,0
L1848:	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 98 ---
L1852:	fn_link  L1860
	fn_combi_t40 5, 0,1,3,4,2,4
L1860:	fn_combi_t48 5, 0,4,1,2,3,4
# --- block 99 ---
L1864:	fn_link  L1852
	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 100 ---
L1872:	fn_link  L1864
	fn_combi_t44 5, 0,1,3,2,3,4
# --- block 101 ---
L1880:	fn_link  L1824
	fn_link  L1872
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 102 ---
L1892:	fn_link  L1900
	fn_combi_t29 5, 0,1,4,2,4,3
L1900:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 103 ---
L1904:	fn_link  L1892
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 104 ---
L1912:	fn_link  L1904
	fn_combi_t26 6, 0,1,2,5,3,4
# --- block 105 ---
L1920:	fn_link  L1880
	fn_link  L1912
	fn_combi_t53 6, 0,1,2,3,4,5
# --- block 106 ---
L1932:	fn_link  L1708
	fn_link  L1920
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 107 ---
L1944:	fn_link  L1952
	fn_combi_t38 5, 0,1,4,2,3,4
L1952:	fn_combi_t28 5, 0,3,4,1,4,2
# --- block 108 ---
L1956:	fn_link  L1488
	fn_link  L1604
	fn_link  L1932
	fn_link  L1944
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 109 ---
L1976:	fn_link  L1984
	fn_combi_t24 6, 0,1,5,2,3,4
L1984:	fn_combi_t42 5, 0,4,3,1,3,2
# --- block 110 ---
L1988:	fn_link  L1976
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 111 ---
L1996:	fn_link  L1988
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 112 ---
L2004:	fn_link  L1996
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 113 ---
L2012:	fn_link  Sphere.spherenormal
	fn_link  L1956
	fn_link  L2004
	fn_combi_t26 6, 0,1,3,5,2,4
# --- block 114 ---
L2028:	fn_link  L2036
	fn_combi_t53 6, 0,1,2,3,4,5
L2036:	fn_combi_t28 5, 0,1,4,3,4,2
# --- block 115 ---
L2040:	fn_link  L2012
	fn_link  L2028
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 116 ---
L2052:	fn_link  L1416
	fn_link  L2040
	fn_link  L2068
	fn_combi_t5 4, 0,1,3,2,0,0
L2068:	fn_combi_t42 5, 0,2,4,1,3,4
# --- block 117 ---
L2072:	fn_link  L2080
	fn_combi_t26 6, 0,1,4,5,2,3
L2080:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 118 ---
L2084:	fn_link  L2072
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 119 ---
L2092:	fn_link  L1388
	fn_link  L1400
	fn_link  L2052
	fn_link  L2084
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 120 ---
L2112:	fn_link  L2120
	fn_combi_t38 6, 0,1,5,2,3,4
L2120:	fn_combi_t37 5, 0,3,4,2,1,2
# --- block 121 ---
L2124:	fn_link  L2112
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 122 ---
L2132:	fn_link  L2124
	fn_combi_t24 5, 0,1,4,2,3,4
# --- block 123 ---
Sphere.is_zerovector:	fn_link  L2196
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 124 ---
L2148:	fn_link  Sphere.epsilon
	fn_link  NanoPrelude.$3c.
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 125 ---
L2160:	fn_link  L2148
	fn_link  Sphere.epsilon
	fn_link  NanoPrelude.$3c.
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,4,2,3,5
# --- block 126 ---
L2180:	fn_link  Sphere.epsilon
	fn_link  NanoPrelude.$3c.
	fn_link  NanoPrelude.$26$26
	fn_combi_t40 6, 0,1,3,2,4,5
# --- block 127 ---
L2196:	fn_link  L2160
	fn_link  L2180
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 128 ---
NanoPrelude.$26$26:	fn_link  L2216
	fn_combi_t1 2, 1,0,0,0,0,0
L2216:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 129 ---
NanoPrelude.$3c.:	fn_link  L2228
	fn_combi_t3 3, 2,1,0,0,0,0
L2228:	fn_elink _prim_flt
# --- block 130 ---
Sphere.epsilon:	fn_link  L2244
	fn_link  L2252
	fn_elink Sphere.d
L2244:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L2252:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 131 ---
Sphere.reflectray:	fn_link  Sphere.vecmult
	fn_link  L2456
	fn_link  L2276
	fn_combi_t12 5, 0,1,3,4,2,0
L2276:	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 132 ---
L2280:	fn_link  Sphere.epsilon
	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t16 5, 0,3,1,4,2,0
# --- block 133 ---
L2296:	fn_link  Sphere.testspheres
	fn_link  Sphere.trace
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 134 ---
L2308:	fn_link  L2320
	fn_link  Sphere.shade
	fn_combi_t25 6, 0,3,5,1,4,2
L2320:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 135 ---
L2324:	fn_link  L2340
	fn_link  L2308
	fn_link  L2344
	fn_combi_t12 5, 0,1,3,4,2,0
L2340:	fn_combi_t0 3, 1,0,0,0,0,0
L2344:	fn_combi_t28 5, 0,3,4,4,1,2
# --- block 136 ---
L2348:	fn_link  Sphere.background
	fn_link  L2364
	fn_link  Sphere.vecmult
	fn_combi_t56 5, 0,4,1,2,3,4
L2364:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 137 ---
L2368:	fn_link  L2324
	fn_link  L2348
	fn_combi_t51 6, 0,1,2,3,4,5
# --- block 138 ---
L2380:	fn_link  Sphere.vecadd
	fn_combi_t46 6, 0,1,2,4,5,3
# --- block 139 ---
L2388:	fn_link  L2380
	fn_combi_t30 6, 0,4,1,2,5,3
# --- block 140 ---
L2396:	fn_link  Sphere.is_zerovector
	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 141 ---
L2404:	fn_link  L2396
	fn_combi_t26 4, 0,1,2,3,2,3
# --- block 142 ---
L2412:	fn_link  L2368
	fn_link  L2388
	fn_link  L2404
	fn_combi_t52 6, 0,1,2,3,4,5
# --- block 143 ---
L2428:	fn_link  L2436
	fn_combi_t26 6, 0,1,4,5,2,3
L2436:	fn_combi_t37 5, 0,4,3,2,1,2
# --- block 144 ---
L2440:	fn_link  L2296
	fn_link  L2412
	fn_link  L2428
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 145 ---
L2456:	fn_link  L2280
	fn_link  L2440
	fn_combi_t16 4, 0,3,1,2,3,0
# --- block 146 ---
Sphere.vecadd:	fn_link  L2520
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 147 ---
L2476:	fn_link  NanoPrelude.$2b.
	fn_combi_t26 6, 5,0,1,2,3,4
# --- block 148 ---
L2484:	fn_link  L2492
	fn_combi_t29 5, 0,1,4,2,3,2
L2492:	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 149 ---
L2496:	fn_link  NanoPrelude.$2b.
	fn_link  L2476
	fn_link  L2484
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 150 ---
L2512:	fn_link  L2496
	fn_combi_t9 5, 0,1,2,4,3,0
# --- block 151 ---
L2520:	fn_link  L2512
	fn_combi_t18 5, 1,0,2,3,4,0
# --- block 152 ---
Sphere.vecmult:	fn_link  L2580
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 153 ---
L2536:	fn_link  NanoPrelude.$2a.
	fn_combi_t26 6, 5,0,1,2,3,4
# --- block 154 ---
L2544:	fn_link  L2552
	fn_combi_t29 5, 0,1,4,2,3,2
L2552:	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 155 ---
L2556:	fn_link  NanoPrelude.$2a.
	fn_link  L2536
	fn_link  L2544
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 156 ---
L2572:	fn_link  L2556
	fn_combi_t9 5, 0,1,2,4,3,0
# --- block 157 ---
L2580:	fn_link  L2572
	fn_combi_t18 5, 1,0,2,3,4,0
# --- block 158 ---
Sphere.trace:	fn_link  L2696
	fn_link  L2868
	fn_combi_t46 5, 0,2,1,2,3,4
# --- block 159 ---
L2600:	fn_link  L2608
	fn_combi_t5 4, 3,2,0,1,0,0
L2608:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 160 ---
L2612:	fn_link  L2600
	fn_link  L2624
	fn_combi_t40 6, 0,1,3,5,2,4
L2624:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 161 ---
L2628:	fn_link  L2636
	fn_combi_t39 5, 4,0,1,3,2,4
L2636:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 162 ---
L2640:	fn_link  L2612
	fn_link  L2628
	fn_link  L2656
	fn_combi_t15 4, 0,1,3,2,3,0
L2656:	fn_combi_t26 5, 0,1,2,4,4,3
# --- block 163 ---
L2660:	fn_link  Sphere.sphereintersect
	fn_link  L2640
	fn_link  L2676
	fn_combi_t24 6, 0,1,5,2,3,4
L2676:	fn_combi_t46 5, 0,4,1,2,3,4
# --- block 164 ---
L2680:	fn_link  L2660
	fn_link  L2692
	fn_combi_t46 6, 5,0,1,2,3,4
L2692:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 165 ---
L2696:	fn_link  L2680
	fn_link  L2708
	fn_combi_t12 5, 0,1,3,4,2,0
L2708:	fn_y
# --- block 166 ---
L2712:	fn_link  L2724
	fn_link  L2728
	fn_combi_t2 3, 2,0,1,0,0,0
L2724:	fn_combi_t0 2, 1,0,0,0,0,0
L2728:	fn_elink _error0
# --- block 167 ---
L2732:	fn_link  NanoPrelude.$3c.
	fn_combi_t28 6, 0,1,4,2,5,3
# --- block 168 ---
L2740:	fn_link  L2756
	fn_link  L2732
	fn_link  L2760
	fn_combi_t38 4, 0,1,3,2,2,3
L2756:	fn_combi_t2 3, 2,0,1,0,0,0
L2760:	fn_combi_t29 5, 0,1,4,2,3,4
# --- block 169 ---
L2764:	fn_link  L2740
	fn_combi_t7 4, 1,0,2,3,0,0
# --- block 170 ---
L2772:	fn_link  L2764
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 171 ---
L2780:	fn_link  L2712
	fn_link  Sphere.headD
	fn_link  L2772
	fn_link  NanoPrelude.foldr
	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 172 ---
L2800:	fn_link  Sphere.headD
	fn_link  Sphere.infinity
	fn_link  L2816
	fn_combi_t14 5, 4,0,1,2,3,0
L2816:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 173 ---
L2820:	fn_link  L2836
	fn_link  L2840
	fn_link  L2844
	fn_combi_t39 5, 4,0,3,1,3,2
L2836:	fn_combi_t0 2, 1,0,0,0,0,0
L2840:	fn_combi_t0 2, 0,0,0,0,0,0
L2844:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 174 ---
L2848:	fn_link  L2864
	fn_link  L2820
	fn_link  NanoPrelude.null
	fn_combi_t31 6, 0,4,1,2,5,3
L2864:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 175 ---
L2868:	fn_link  L2780
	fn_link  L2800
	fn_link  L2848
	fn_combi_t38 5, 0,1,3,4,2,4
# --- block 176 ---
NanoPrelude.null:	fn_link  L2900
	fn_link  L2896
	fn_combi_t2 3, 2,0,1,0,0,0
L2896:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 177 ---
L2900:	fn_link  L2908
	fn_combi_t0 3, 0,0,0,0,0,0
L2908:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 178 ---
Sphere.infinity:	fn_link  L2956
	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 179 ---
L2924:	fn_link  L2932
	fn_elink _prim_itof
L2932:	fn_box
	.word 0x000186a0	# raw word 100000
	fn_box_body
# --- block 180 ---
L2940:	fn_link  L2948
	fn_elink _prim_itof
L2948:	fn_box
	.word 0x000186a0	# raw word 100000
	fn_box_body
# --- block 181 ---
L2956:	fn_link  L2924
	fn_link  L2940
	fn_elink NanoPrelude.$2a.
# --- block 182 ---
Sphere.headD:	fn_link  L2980
	fn_link  L2984
	fn_combi_t2 3, 2,0,1,0,0,0
L2980:	fn_combi_t0 2, 0,0,0,0,0,0
L2984:	fn_elink _error0
# --- block 183 ---
Sphere.sphereintersect:	fn_link  L3000
	fn_link  L3344
	fn_combi_t14 5, 0,2,3,1,4,0
L3000:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 184 ---
L3004:	fn_link  L3016
	fn_link  Sphere.vecsub
	fn_combi_t6 4, 0,2,3,1,0,0
L3016:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 185 ---
L3020:	fn_link  Sphere.vecdot
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 186 ---
L3028:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_link  NanoPrelude.$2b.
	fn_combi_t54 5, 0,1,2,4,4,3
# --- block 187 ---
L3044:	fn_link  L3020
	fn_link  L3028
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 188 ---
L3056:	fn_link  NanoPrelude.$2a.
	fn_link  L3044
	fn_combi_t42 5, 0,2,3,1,4,4
# --- block 189 ---
L3068:	fn_link  L3084
	fn_link  L3088
	fn_link  NanoPrelude.$2d.
	fn_combi_t15 5, 0,1,3,2,4,0
L3084:	fn_elink _prim_fsqrt
L3088:	fn_elink _prim_fneg
# --- block 190 ---
L3092:	fn_link  L3108
	fn_link  L3112
	fn_link  NanoPrelude.$2b.
	fn_combi_t15 5, 0,1,3,2,4,0
L3108:	fn_elink _prim_fsqrt
L3112:	fn_elink _prim_fneg
# --- block 191 ---
L3116:	fn_link  L3132
	fn_link  L3140
	fn_link  L3144
	fn_combi_t6 4, 3,0,1,2,0,0
L3132:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3140:	fn_elink _prim_itof
L3144:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 192 ---
L3148:	fn_link  L3164
	fn_link  L3172
	fn_link  L3176
	fn_combi_t6 4, 3,0,1,2,0,0
L3164:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3172:	fn_elink _prim_itof
L3176:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 193 ---
L3180:	fn_link  L3188
	fn_combi_t2 3, 2,0,1,0,0,0
L3188:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 194 ---
L3192:	fn_link  L3180
	fn_link  L3212
	fn_link  L3220
	fn_link  NanoPrelude.$3c.
	fn_combi_t39 5, 0,4,1,2,3,4
L3212:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3220:	fn_elink _prim_itof
# --- block 195 ---
L3224:	fn_link  L3148
	fn_link  L3192
	fn_combi_t16 4, 0,2,0,3,1,0
# --- block 196 ---
L3236:	fn_link  L3252
	fn_link  L3260
	fn_link  NanoPrelude.$3c.
	fn_combi_t39 6, 0,3,1,2,4,5
L3252:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3260:	fn_elink _prim_itof
# --- block 197 ---
L3264:	fn_link  L3116
	fn_link  L3224
	fn_link  L3236
	fn_combi_t25 6, 0,3,1,5,4,2
# --- block 198 ---
L3280:	fn_link  L3264
	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 199 ---
L3288:	fn_link  L3068
	fn_link  L3092
	fn_link  L3280
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 200 ---
L3304:	fn_link  L3288
	fn_combi_t48 5, 0,4,1,4,2,3
# --- block 201 ---
L3312:	fn_link  L3328
	fn_link  L3056
	fn_link  L3304
	fn_combi_t10 5, 0,1,4,3,2,0
L3328:	fn_combi_t0 3, 1,0,0,0,0,0
# --- block 202 ---
L3332:	fn_link  Sphere.vecdot
	fn_link  L3312
	fn_combi_t42 5, 0,3,4,1,4,2
# --- block 203 ---
L3344:	fn_link  L3004
	fn_link  L3332
	fn_combi_t42 5, 0,3,4,1,2,4
# --- block 204 ---
NanoPrelude.$2d.:	fn_link  L3368
	fn_link  L3372
	fn_combi_t8 4, 0,3,2,1,0,0
L3368:	fn_elink _prim_fsub
L3372:	fn_y
# --- block 205 ---
Sphere.vecdot:	fn_link  L3440
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 206 ---
L3384:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 6, 0,1,2,4,3,5
# --- block 207 ---
L3396:	fn_link  NanoPrelude.$2a.
	fn_link  L3384
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 208 ---
L3408:	fn_link  NanoPrelude.$2b.
	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 209 ---
L3416:	fn_link  L3408
	fn_combi_t26 6, 0,1,3,5,2,4
# --- block 210 ---
L3424:	fn_link  NanoPrelude.$2a.
	fn_link  L3396
	fn_link  L3416
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 211 ---
L3440:	fn_link  L3424
	fn_combi_t18 5, 1,0,2,3,4,0
# --- block 212 ---
Sphere.vecsub:	fn_link  L3500
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 213 ---
L3456:	fn_link  NanoPrelude.$2d.
	fn_combi_t26 6, 5,0,1,2,3,4
# --- block 214 ---
L3464:	fn_link  L3472
	fn_combi_t29 5, 0,1,4,2,3,2
L3472:	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 215 ---
L3476:	fn_link  NanoPrelude.$2d.
	fn_link  L3456
	fn_link  L3464
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 216 ---
L3492:	fn_link  L3476
	fn_combi_t9 5, 0,1,2,4,3,0
# --- block 217 ---
L3500:	fn_link  L3492
	fn_combi_t18 5, 1,0,2,3,4,0
# --- block 218 ---
Sphere.testspheres:	fn_link  L4900
	fn_link  L5004
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 219 ---
L3520:	fn_link  L3532
	fn_link  L3540
	fn_elink Sphere.d
L3532:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3540:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 220 ---
L3548:	fn_link  L3556
	fn_elink _prim_itof
L3556:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 221 ---
L3564:	fn_link  L3576
	fn_link  L3584
	fn_elink Sphere.d
L3576:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3584:	fn_box
	.word 0x0007316d	# raw word 471405
	fn_box_body
# --- block 222 ---
L3592:	fn_link  L3564
	fn_elink _prim_fneg
# --- block 223 ---
L3600:	fn_link  L3548
	fn_link  L3592
	fn_link  L3624
	fn_link  L3632
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L3624:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3632:	fn_box
	.word 0x0007316d	# raw word 471405
	fn_box_body
# --- block 224 ---
L3640:	fn_link  Sphere.s2
	fn_link  L3520
	fn_link  L3600
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 225 ---
L3656:	fn_link  L3668
	fn_link  L3640
	fn_combi_t2 4, 3,0,1,0,0,0
L3668:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 226 ---
L3672:	fn_link  L3684
	fn_link  L3692
	fn_elink Sphere.d
L3684:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3692:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 227 ---
L3700:	fn_link  L3712
	fn_link  L3720
	fn_elink Sphere.d
L3712:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3720:	fn_box
	.word 0x0009d36f	# raw word 643951
	fn_box_body
# --- block 228 ---
L3728:	fn_link  L3700
	fn_elink _prim_fneg
# --- block 229 ---
L3736:	fn_link  L3728
	fn_link  L3760
	fn_link  L3768
	fn_link  Sphere.d
	fn_link  L3776
	fn_combi_t35 6, 5,0,1,2,3,4
L3760:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3768:	fn_box
	.word 0x0002a202	# raw word 172546
	fn_box_body
L3776:	fn_elink _prim_fneg
# --- block 230 ---
L3780:	fn_link  L3796
	fn_link  L3804
	fn_link  L3736
	fn_combi_t6 4, 0,3,1,2,0,0
L3796:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L3804:	fn_elink _prim_itof
# --- block 231 ---
L3808:	fn_link  Sphere.s2
	fn_link  L3672
	fn_link  L3780
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 232 ---
L3824:	fn_link  L3656
	fn_link  L3808
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 233 ---
L3836:	fn_link  L3848
	fn_link  L3856
	fn_elink Sphere.d
L3848:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3856:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 234 ---
L3864:	fn_link  L3876
	fn_link  L3884
	fn_elink Sphere.d
L3876:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3884:	fn_box
	.word 0x00084e4b	# raw word 544331
	fn_box_body
# --- block 235 ---
L3892:	fn_link  L3904
	fn_link  L3912
	fn_elink Sphere.d
L3904:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L3912:	fn_box
	.word 0x0005ac49	# raw word 371785
	fn_box_body
# --- block 236 ---
L3920:	fn_link  L3892
	fn_elink _prim_fneg
# --- block 237 ---
L3928:	fn_link  L3864
	fn_link  L3920
	fn_link  L3952
	fn_link  L3960
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L3952:	fn_box
	.word 0x00989680	# raw word 10000000
	fn_box_body
L3960:	fn_box
	.word 0x000f3363	# raw word 996195
	fn_box_body
# --- block 238 ---
L3968:	fn_link  Sphere.s2
	fn_link  L3836
	fn_link  L3928
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 239 ---
L3984:	fn_link  L3824
	fn_link  L3968
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 240 ---
L3996:	fn_link  L4008
	fn_link  L4016
	fn_elink Sphere.d
L4008:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4016:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 241 ---
L4024:	fn_link  L4036
	fn_link  L4044
	fn_elink Sphere.d
L4036:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4044:	fn_box
	.word 0x0002a202	# raw word 172546
	fn_box_body
# --- block 242 ---
L4052:	fn_link  L4024
	fn_elink _prim_fneg
# --- block 243 ---
L4060:	fn_link  L4052
	fn_link  L4084
	fn_link  L4092
	fn_link  Sphere.d
	fn_link  L4100
	fn_combi_t35 6, 5,0,1,2,3,4
L4084:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4092:	fn_box
	.word 0x0009d36f	# raw word 643951
	fn_box_body
L4100:	fn_elink _prim_fneg
# --- block 244 ---
L4104:	fn_link  L4120
	fn_link  L4128
	fn_link  L4060
	fn_combi_t6 4, 0,3,1,2,0,0
L4120:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4128:	fn_elink _prim_itof
# --- block 245 ---
L4132:	fn_link  Sphere.s2
	fn_link  L3996
	fn_link  L4104
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 246 ---
L4148:	fn_link  L3984
	fn_link  L4132
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 247 ---
L4160:	fn_link  L4172
	fn_link  L4180
	fn_elink Sphere.d
L4172:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4180:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 248 ---
L4188:	fn_link  L4200
	fn_link  L4208
	fn_elink Sphere.d
L4200:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4208:	fn_box
	.word 0x0007316d	# raw word 471405
	fn_box_body
# --- block 249 ---
L4216:	fn_link  L4188
	fn_link  L4240
	fn_link  L4248
	fn_link  Sphere.d
	fn_link  L4256
	fn_combi_t35 6, 5,0,1,2,3,4
L4240:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4248:	fn_box
	.word 0x0007316d	# raw word 471405
	fn_box_body
L4256:	fn_elink _prim_fneg
# --- block 250 ---
L4260:	fn_link  L4276
	fn_link  L4284
	fn_link  L4216
	fn_combi_t6 4, 0,3,1,2,0,0
L4276:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4284:	fn_elink _prim_itof
# --- block 251 ---
L4288:	fn_link  Sphere.s2
	fn_link  L4160
	fn_link  L4260
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 252 ---
L4304:	fn_link  L4148
	fn_link  L4288
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 253 ---
L4316:	fn_link  L4328
	fn_link  L4336
	fn_elink Sphere.d
L4328:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4336:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 254 ---
L4344:	fn_link  L4356
	fn_link  L4364
	fn_elink Sphere.d
L4356:	fn_box
	.word 0x00989680	# raw word 10000000
	fn_box_body
L4364:	fn_box
	.word 0x000f3363	# raw word 996195
	fn_box_body
# --- block 255 ---
L4372:	fn_link  L4344
	fn_link  L4396
	fn_link  L4404
	fn_link  Sphere.d
	fn_link  L4412
	fn_combi_t35 6, 5,0,1,2,3,4
L4396:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4404:	fn_box
	.word 0x0005ac49	# raw word 371785
	fn_box_body
L4412:	fn_elink _prim_fneg
# --- block 256 ---
L4416:	fn_link  L4436
	fn_link  L4444
	fn_link  Sphere.d
	fn_link  L4372
	fn_combi_t16 5, 0,4,1,2,3,0
L4436:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4444:	fn_box
	.word 0x00084e4b	# raw word 544331
	fn_box_body
# --- block 257 ---
L4452:	fn_link  Sphere.s2
	fn_link  L4316
	fn_link  L4416
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 258 ---
L4468:	fn_link  L4304
	fn_link  L4452
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 259 ---
L4480:	fn_link  L4492
	fn_link  L4500
	fn_elink Sphere.d
L4492:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4500:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 260 ---
L4508:	fn_link  L4516
	fn_elink _prim_itof
L4516:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 261 ---
L4524:	fn_link  L4536
	fn_link  L4544
	fn_elink Sphere.d
L4536:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4544:	fn_box
	.word 0x0009d36f	# raw word 643951
	fn_box_body
# --- block 262 ---
L4552:	fn_link  L4508
	fn_link  L4524
	fn_link  L4576
	fn_link  L4584
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L4576:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4584:	fn_box
	.word 0x0002a202	# raw word 172546
	fn_box_body
# --- block 263 ---
L4592:	fn_link  Sphere.s2
	fn_link  L4480
	fn_link  L4552
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 264 ---
L4608:	fn_link  L4468
	fn_link  L4592
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 265 ---
L4620:	fn_link  L4632
	fn_link  L4640
	fn_elink Sphere.d
L4632:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4640:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 266 ---
L4648:	fn_link  L4656
	fn_elink _prim_itof
L4656:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 267 ---
L4664:	fn_link  L4676
	fn_link  L4684
	fn_elink Sphere.d
L4676:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4684:	fn_box
	.word 0x0002a202	# raw word 172546
	fn_box_body
# --- block 268 ---
L4692:	fn_link  L4648
	fn_link  L4664
	fn_link  L4716
	fn_link  L4724
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L4716:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4724:	fn_box
	.word 0x0009d36f	# raw word 643951
	fn_box_body
# --- block 269 ---
L4732:	fn_link  Sphere.s2
	fn_link  L4620
	fn_link  L4692
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 270 ---
L4748:	fn_link  L4608
	fn_link  L4732
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 271 ---
L4760:	fn_link  L4772
	fn_link  L4780
	fn_elink Sphere.d
L4772:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4780:	fn_box
	.word 0x00028b0b	# raw word 166667
	fn_box_body
# --- block 272 ---
L4788:	fn_link  L4800
	fn_link  L4808
	fn_elink Sphere.d
L4800:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4808:	fn_box
	.word 0x00084e4b	# raw word 544331
	fn_box_body
# --- block 273 ---
L4816:	fn_link  L4828
	fn_link  L4836
	fn_elink Sphere.d
L4828:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4836:	fn_box
	.word 0x00042726	# raw word 272166
	fn_box_body
# --- block 274 ---
L4844:	fn_link  L4788
	fn_link  L4816
	fn_link  L4868
	fn_link  L4876
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L4868:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L4876:	fn_box
	.word 0x00042726	# raw word 272166
	fn_box_body
# --- block 275 ---
L4884:	fn_link  Sphere.s2
	fn_link  L4760
	fn_link  L4844
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 276 ---
L4900:	fn_link  L4748
	fn_link  L4884
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 277 ---
L4912:	fn_link  L4924
	fn_link  L4932
	fn_elink Sphere.d
L4924:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L4932:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 278 ---
L4940:	fn_link  L4948
	fn_elink _prim_itof
L4948:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 279 ---
L4956:	fn_link  L4940
	fn_link  L4980
	fn_link  L4988
	fn_link  L4992
	fn_link  L5000
	fn_combi_t29 6, 5,0,1,2,3,4
L4980:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L4988:	fn_elink _prim_itof
L4992:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L5000:	fn_elink _prim_itof
# --- block 280 ---
L5004:	fn_link  Sphere.s2
	fn_link  L4912
	fn_link  L4956
	fn_combi_t4 4, 3,0,1,2,0,0
# --- block 281 ---
Sphere.s2:	fn_link  L5340
	fn_link  L5448
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 282 ---
L5032:	fn_link  L5044
	fn_link  L5052
	fn_elink Sphere.d
L5044:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5052:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 283 ---
L5060:	fn_link  L5032
	fn_elink Sphere.Reflect
# --- block 284 ---
L5068:	fn_link  L5080
	fn_link  L5060
	fn_combi_t2 4, 3,0,1,0,0,0
L5080:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 285 ---
L5084:	fn_link  L5092
	fn_elink _prim_itof
L5092:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 286 ---
L5100:	fn_link  L5084
	fn_elink Sphere.Specpow
# --- block 287 ---
L5108:	fn_link  L5068
	fn_link  L5100
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 288 ---
L5120:	fn_link  L5132
	fn_link  L5140
	fn_elink Sphere.d
L5132:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5140:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 289 ---
L5148:	fn_link  L5160
	fn_link  L5168
	fn_elink Sphere.d
L5160:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5168:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 290 ---
L5176:	fn_link  L5120
	fn_link  L5148
	fn_link  L5200
	fn_link  L5208
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L5200:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5208:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
# --- block 291 ---
L5216:	fn_link  L5176
	fn_elink Sphere.Specular
# --- block 292 ---
L5224:	fn_link  L5108
	fn_link  L5216
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 293 ---
L5236:	fn_link  L5248
	fn_link  L5256
	fn_elink Sphere.d
L5248:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
L5256:	fn_box
	.word 0x00000023	# raw word 35
	fn_box_body
# --- block 294 ---
L5264:	fn_link  L5276
	fn_link  L5284
	fn_elink Sphere.d
L5276:	fn_box
	.word 0x00000064	# raw word 100
	fn_box_body
L5284:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 295 ---
L5292:	fn_link  L5236
	fn_link  L5264
	fn_link  L5316
	fn_link  L5324
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L5316:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L5324:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 296 ---
L5332:	fn_link  L5292
	fn_elink Sphere.Diffuse
# --- block 297 ---
L5340:	fn_link  L5224
	fn_link  L5332
	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 298 ---
L5352:	fn_link  L5364
	fn_link  L5372
	fn_elink Sphere.d
L5364:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L5372:	fn_box
	.word 0x00000019	# raw word 25
	fn_box_body
# --- block 299 ---
L5380:	fn_link  L5392
	fn_link  L5400
	fn_elink Sphere.d
L5392:	fn_box
	.word 0x00002710	# raw word 10000
	fn_box_body
L5400:	fn_box
	.word 0x00000145	# raw word 325
	fn_box_body
# --- block 300 ---
L5408:	fn_link  L5352
	fn_link  L5380
	fn_link  L5432
	fn_link  L5440
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L5432:	fn_box
	.word 0x000003e8	# raw word 1000
	fn_box_body
L5440:	fn_box
	.word 0x00000023	# raw word 35
	fn_box_body
# --- block 301 ---
L5448:	fn_link  L5408
	fn_elink Sphere.Ambient
# --- block 302 ---
Sphere.Ambient:	fn_link  L5468
	fn_link  L5472
	fn_combi_t6 4, 3,0,1,2,0,0
L5468:	fn_combi_t1 2, 1,0,0,0,0,0
L5472:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 303 ---
Sphere.Diffuse:	fn_link  L5492
	fn_link  L5496
	fn_combi_t6 4, 3,0,1,2,0,0
L5492:	fn_combi_t1 2, 1,0,0,0,0,0
L5496:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 304 ---
Sphere.Specular:	fn_link  L5516
	fn_link  L5520
	fn_combi_t6 4, 3,0,1,2,0,0
L5516:	fn_combi_t1 2, 1,0,0,0,0,0
L5520:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 305 ---
Sphere.Specpow:	fn_link  L5540
	fn_link  L5544
	fn_combi_t6 4, 3,0,1,2,0,0
L5540:	fn_combi_t1 2, 1,0,0,0,0,0
L5544:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 306 ---
Sphere.Reflect:	fn_link  L5564
	fn_link  L5568
	fn_combi_t6 4, 3,0,1,2,0,0
L5564:	fn_combi_t1 2, 1,0,0,0,0,0
L5568:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 307 ---
Sphere.vecscale:	fn_link  L5620
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 308 ---
L5584:	fn_link  NanoPrelude.$2a.
	fn_combi_t26 6, 5,0,1,2,3,4
# --- block 309 ---
L5592:	fn_link  L5600
	fn_combi_t29 5, 0,1,4,2,3,2
L5600:	fn_combi_t44 6, 0,1,4,2,3,5
# --- block 310 ---
L5604:	fn_link  NanoPrelude.$2a.
	fn_link  L5584
	fn_link  L5592
	fn_combi_t10 4, 0,1,3,2,3,0
# --- block 311 ---
L5620:	fn_link  L5604
	fn_combi_t4 3, 0,1,2,1,0,0
# --- block 312 ---
Sphere.transmitray:	fn_link  Sphere.vecmult
	fn_link  L5652
	fn_link  L5924
	fn_link  L5648
	fn_combi_t26 6, 0,1,4,5,2,3
L5648:	fn_combi_t30 6, 0,3,1,4,5,2
# --- block 313 ---
L5652:	fn_link  L5664
	fn_link  Sphere.refractray
	fn_combi_t9 5, 0,3,2,4,1,0
L5664:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 314 ---
L5668:	fn_link  Sphere.epsilon
	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t16 5, 0,3,1,4,2,0
# --- block 315 ---
L5684:	fn_link  Sphere.testspheres
	fn_link  Sphere.trace
	fn_combi_t4 4, 0,1,3,2,0,0
# --- block 316 ---
L5696:	fn_link  L5704
	fn_combi_t2 3, 2,0,1,0,0,0
L5704:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 317 ---
L5708:	fn_link  L5720
	fn_link  Sphere.shade
	fn_combi_t25 6, 0,2,5,1,4,3
L5720:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 318 ---
L5724:	fn_link  L5740
	fn_link  L5708
	fn_link  L5744
	fn_combi_t26 6, 0,1,3,5,2,4
L5740:	fn_combi_t0 3, 1,0,0,0,0,0
L5744:	fn_combi_t28 5, 0,3,4,4,1,2
# --- block 319 ---
L5748:	fn_link  Sphere.background
	fn_link  L5764
	fn_link  Sphere.vecmult
	fn_combi_t56 5, 0,4,1,2,3,4
L5764:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 320 ---
L5768:	fn_link  L5748
	fn_combi_t26 6, 0,1,3,4,5,2
# --- block 321 ---
L5776:	fn_link  L5724
	fn_link  L5768
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 322 ---
L5788:	fn_link  Sphere.vecadd
	fn_link  L5800
	fn_combi_t47 6, 5,0,1,2,4,3
L5800:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 323 ---
L5804:	fn_link  L5788
	fn_combi_t32 6, 0,1,3,4,5,2
# --- block 324 ---
L5812:	fn_link  L5776
	fn_link  L5804
	fn_combi_t12 5, 0,1,2,4,3,0
# --- block 325 ---
L5824:	fn_link  Sphere.is_zerovector
	fn_combi_t30 6, 0,1,2,4,5,3
# --- block 326 ---
L5832:	fn_link  L5824
	fn_combi_t30 5, 0,3,1,3,4,2
# --- block 327 ---
L5840:	fn_link  L5832
	fn_combi_t40 5, 0,1,3,4,2,3
# --- block 328 ---
L5848:	fn_link  L5696
	fn_link  L5812
	fn_link  L5840
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 329 ---
L5864:	fn_link  L5872
	fn_combi_t32 6, 0,1,3,4,5,2
L5872:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 330 ---
L5876:	fn_link  L5684
	fn_link  L5848
	fn_link  L5864
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 331 ---
L5892:	fn_link  L5668
	fn_link  L5876
	fn_link  L5908
	fn_combi_t40 6, 0,1,3,4,2,5
L5908:	fn_combi_t37 5, 0,2,4,3,1,3
# --- block 332 ---
L5912:	fn_link  L5920
	fn_combi_t24 5, 0,1,4,2,3,4
L5920:	fn_combi_t44 6, 0,1,5,2,3,4
# --- block 333 ---
L5924:	fn_link  L5892
	fn_link  L5912
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 334 ---
Sphere.refractray:	fn_link  L5956
	fn_link  L6484
	fn_link  L5952
	fn_combi_t5 4, 0,1,3,2,0,0
L5952:	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 335 ---
L5956:	fn_link  Sphere.vecdot
	fn_link  L5968
	fn_combi_t7 4, 0,1,2,3,0,0
L5968:	fn_elink _prim_fneg
# --- block 336 ---
L5972:	fn_link  L5980
	fn_elink _prim_itof
L5980:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 337 ---
L5988:	fn_link  L5972
	fn_elink NanoPrelude.$2f.
# --- block 338 ---
L5996:	fn_link  L6016
	fn_link  L6024
	fn_link  L6028
	fn_link  Sphere.vecscale
	fn_combi_t59 6, 5,0,4,1,2,3
L6016:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6024:	fn_elink _prim_itof
L6028:	fn_elink _prim_fneg
# --- block 339 ---
L6032:	fn_link  L6044
	fn_link  L5996
	fn_combi_t28 6, 0,3,5,1,4,2
L6044:	fn_elink _prim_fneg
# --- block 340 ---
L6048:	fn_link  L5988
	fn_link  L6032
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 341 ---
L6060:	fn_link  L6076
	fn_link  L6084
	fn_link  NanoPrelude.$3c.
	fn_combi_t39 5, 0,4,1,2,3,4
L6076:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6084:	fn_elink _prim_itof
# --- block 342 ---
L6088:	fn_link  L6060
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 343 ---
L6096:	fn_link  L6108
	fn_link  L6088
	fn_combi_t3 3, 0,1,2,0,0,0
L6108:	fn_combi_t4 4, 3,1,2,0,0,0
# --- block 344 ---
L6112:	fn_link  NanoPrelude.$2a.
	fn_link  L6132
	fn_link  L6140
	fn_link  NanoPrelude.$2d.
	fn_combi_t44 5, 0,1,2,3,4,4
L6132:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6140:	fn_elink _prim_itof
# --- block 345 ---
L6144:	fn_link  L6112
	fn_link  NanoPrelude.$2a.
	fn_combi_t40 4, 0,0,2,2,1,3
# --- block 346 ---
L6156:	fn_link  L6168
	fn_link  L6144
	fn_combi_t3 3, 0,1,2,0,0,0
L6168:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 347 ---
L6172:	fn_link  L6156
	fn_link  L6192
	fn_link  L6200
	fn_link  NanoPrelude.$2d.
	fn_combi_t44 6, 0,1,2,3,4,5
L6192:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6200:	fn_elink _prim_itof
# --- block 348 ---
L6204:	fn_link  L6212
	fn_elink _prim_itof
L6212:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 349 ---
L6220:	fn_link  L6204
	fn_link  L6236
	fn_link  L6244
	fn_combi_t29 4, 3,0,1,0,1,2
L6236:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6244:	fn_elink _prim_itof
# --- block 350 ---
L6248:	fn_link  L6220
	fn_link  L6260
	fn_combi_t2 3, 2,0,1,0,0,0
L6260:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 351 ---
L6264:	fn_link  L6280
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t40 6, 0,1,3,4,2,5
L6280:	fn_elink _prim_fsqrt
# --- block 352 ---
L6284:	fn_link  L6300
	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t57 6, 0,1,3,2,4,5
L6300:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 353 ---
L6304:	fn_link  L6264
	fn_link  L6284
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 354 ---
L6316:	fn_link  L6324
	fn_combi_t24 5, 0,1,4,2,3,4
L6324:	fn_combi_t42 6, 0,4,5,1,2,3
# --- block 355 ---
L6328:	fn_link  Sphere.vecscale
	fn_link  L6304
	fn_link  L6316
	fn_combi_t10 5, 0,1,4,2,3,0
# --- block 356 ---
L6344:	fn_link  L6352
	fn_combi_t46 6, 5,0,1,2,3,4
L6352:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 357 ---
L6356:	fn_link  L6328
	fn_link  L6344
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 358 ---
L6368:	fn_link  L6384
	fn_link  L6392
	fn_link  NanoPrelude.$3c.
	fn_combi_t39 5, 0,4,1,2,3,4
L6384:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6392:	fn_elink _prim_itof
# --- block 359 ---
L6396:	fn_link  L6368
	fn_combi_t29 5, 0,1,4,3,4,2
# --- block 360 ---
L6404:	fn_link  L6396
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 361 ---
L6412:	fn_link  L6172
	fn_link  L6248
	fn_link  L6356
	fn_link  L6404
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 362 ---
L6432:	fn_link  L6452
	fn_link  L6456
	fn_link  L6412
	fn_link  L6460
	fn_combi_t10 5, 0,1,4,2,3,0
L6452:	fn_combi_t0 3, 2,0,0,0,0,0
L6456:	fn_combi_t0 3, 1,0,0,0,0,0
L6460:	fn_combi_t39 4, 0,3,3,2,3,1
# --- block 363 ---
L6464:	fn_link  L6096
	fn_link  L6432
	fn_link  L6480
	fn_combi_t29 6, 0,1,5,2,3,4
L6480:	fn_combi_t53 5, 0,1,3,2,3,4
# --- block 364 ---
L6484:	fn_link  L6048
	fn_link  L6464
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 365 ---
Sphere.refractsurf:	fn_link  L6524
	fn_link  L6620
	fn_link  L6520
	fn_link  Sphere.append
	fn_link  Sphere.headD
	fn_combi_t54 6, 0,1,2,3,5,4
L6520:	fn_y
# --- block 366 ---
L6524:	fn_link  L6540
	fn_link  L6544
	fn_link  L6552
	fn_combi_t5 5, 4,0,1,2,0,0
L6540:	fn_combi_t0 2, 0,0,0,0,0,0
L6544:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L6552:	fn_elink _prim_itof
# --- block 367 ---
L6556:	fn_link  L6564
	fn_combi_t6 4, 0,3,1,2,0,0
L6564:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 368 ---
L6568:	fn_link  L6580
	fn_link  L6584
	fn_combi_t15 5, 0,4,1,2,3,0
L6580:	fn_elink _prim_eq
L6584:	fn_box
	.word 0x00000006	# raw word 6
	fn_box_body
# --- block 369 ---
L6592:	fn_link  L6556
	fn_link  L6568
	fn_link  L6608
	fn_combi_t15 4, 0,1,3,2,3,0
L6608:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 370 ---
L6612:	fn_link  L6592
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 371 ---
L6620:	fn_link  L6612
	fn_link  L6632
	fn_combi_t6 4, 3,0,1,2,0,0
L6632:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 372 ---
Sphere.append:	fn_link  L6644
	fn_combi_t6 3, 1,2,0,2,0,0
# --- block 373 ---
L6644:	fn_link  Sphere.append
	fn_link  L6656
	fn_combi_t16 5, 0,3,1,4,2,0
L6656:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 374 ---
Sphere.ambientsurf:	fn_link  L6680
	fn_link  L6688
	fn_link  L6800
	fn_link  Sphere.headD
	fn_combi_t20 5, 0,1,4,2,3,0
L6680:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6688:	fn_elink _prim_itof
# --- block 375 ---
L6692:	fn_link  L6708
	fn_link  L6712
	fn_link  L6716
	fn_combi_t13 6, 5,0,1,3,2,0
L6708:	fn_combi_t0 2, 0,0,0,0,0,0
L6712:	fn_combi_t0 1, 0,0,0,0,0,0
L6716:	fn_combi_t4 2, 1,0,0,0,0,0
# --- block 376 ---
L6720:	fn_link  L6728
	fn_combi_t6 4, 0,3,1,2,0,0
L6728:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 377 ---
L6732:	fn_link  L6744
	fn_link  L6748
	fn_combi_t15 5, 0,4,1,2,3,0
L6744:	fn_elink _prim_eq
L6748:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 378 ---
L6756:	fn_link  L6720
	fn_link  L6732
	fn_link  L6772
	fn_combi_t15 4, 0,1,3,2,3,0
L6772:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 379 ---
L6776:	fn_link  L6756
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 380 ---
L6784:	fn_link  L6776
	fn_link  L6796
	fn_combi_t6 4, 3,0,1,2,0,0
L6796:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 381 ---
L6800:	fn_link  L6692
	fn_link  L6784
	fn_link  L6820
	fn_link  Sphere.append
	fn_combi_t40 6, 0,1,2,4,3,5
L6820:	fn_y
# --- block 382 ---
Sphere.vecsum:	fn_link  L6852
	fn_link  Sphere.vecadd
	fn_elink NanoPrelude.foldr
# --- block 383 ---
L6836:	fn_link  L6844
	fn_elink _prim_itof
L6844:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 384 ---
L6852:	fn_link  L6836
	fn_combi_t4 2, 1,0,0,0,0,0
# --- block 385 ---
Sphere.lightray:	fn_link  L6872
	fn_link  L7584
	fn_combi_t42 4, 0,2,3,1,2,3
# --- block 386 ---
L6872:	fn_link  L6884
	fn_link  Sphere.lightdirection
	fn_combi_t4 4, 0,2,3,1,0,0
L6884:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 387 ---
L6888:	fn_link  Sphere.vecdot
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 388 ---
L6896:	fn_link  Sphere.lightcolour
	fn_link  Sphere.shadowed
	fn_combi_t14 5, 0,3,4,1,2,0
# --- block 389 ---
L6908:	fn_link  L6916
	fn_elink _prim_itof
L6916:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 390 ---
L6924:	fn_link  L6908
	fn_link  L6940
	fn_link  L6948
	fn_combi_t29 4, 3,0,1,0,1,2
L6940:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L6948:	fn_elink _prim_itof
# --- block 391 ---
L6952:	fn_link  Sphere.vecdot
	fn_link  L6964
	fn_combi_t7 4, 0,1,2,3,0,0
L6964:	fn_elink _prim_fneg
# --- block 392 ---
L6968:	fn_link  L6976
	fn_elink _prim_itof
L6976:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 393 ---
L6984:	fn_link  L6968
	fn_link  L7000
	fn_link  L7008
	fn_combi_t29 4, 3,0,1,0,1,2
L7000:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7008:	fn_elink _prim_itof
# --- block 394 ---
L7012:	fn_link  Sphere.powD
	fn_link  Sphere.bodysurf
	fn_link  Sphere.vecscale
	fn_combi_t44 6, 0,1,3,2,5,4
# --- block 395 ---
L7028:	fn_link  L7012
	fn_link  Sphere.vecmult
	fn_combi_t32 6, 0,1,2,4,5,3
# --- block 396 ---
L7040:	fn_link  L7056
	fn_link  L7064
	fn_link  NanoPrelude.$3c$3d.
	fn_combi_t39 5, 0,4,1,2,3,4
L7056:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7064:	fn_elink _prim_itof
# --- block 397 ---
L7068:	fn_link  L7028
	fn_link  L7040
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 398 ---
L7080:	fn_link  L7096
	fn_link  Sphere.vecscale
	fn_link  Sphere.vecmult
	fn_combi_t34 6, 0,1,5,2,3,4
L7096:	fn_elink _prim_fneg
# --- block 399 ---
L7100:	fn_link  Sphere.vecadd
	fn_combi_t44 6, 0,1,5,2,4,3
# --- block 400 ---
L7108:	fn_link  L7080
	fn_link  L7100
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 401 ---
L7120:	fn_link  L7108
	fn_link  L7132
	fn_combi_t3 3, 0,1,2,0,0,0
L7132:	fn_combi_t25 6, 0,1,2,5,3,4
# --- block 402 ---
L7136:	fn_link  L7120
	fn_link  L7148
	fn_combi_t24 6, 0,1,5,2,3,4
L7148:	fn_combi_t25 5, 0,4,1,4,2,3
# --- block 403 ---
L7152:	fn_link  L6984
	fn_link  L7068
	fn_link  L7136
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 404 ---
L7168:	fn_link  L7176
	fn_elink _prim_itof
L7176:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 405 ---
L7184:	fn_link  L7168
	fn_link  L7200
	fn_link  L7208
	fn_combi_t29 4, 3,0,1,0,1,2
L7200:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7208:	fn_elink _prim_itof
# --- block 406 ---
L7212:	fn_link  Sphere.powD
	fn_link  Sphere.specularsurf
	fn_link  Sphere.vecscale
	fn_combi_t44 6, 0,1,3,2,5,4
# --- block 407 ---
L7228:	fn_link  L7212
	fn_link  Sphere.vecmult
	fn_combi_t32 6, 0,1,2,4,5,3
# --- block 408 ---
L7240:	fn_link  L7256
	fn_link  L7264
	fn_link  NanoPrelude.$3c$3d.
	fn_combi_t39 5, 0,4,1,2,3,4
L7256:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7264:	fn_elink _prim_itof
# --- block 409 ---
L7268:	fn_link  L7228
	fn_link  L7240
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 410 ---
L7280:	fn_link  Sphere.vecscale
	fn_link  Sphere.vecmult
	fn_link  Sphere.vecadd
	fn_combi_t54 6, 0,1,2,5,3,4
# --- block 411 ---
L7296:	fn_link  L7304
	fn_combi_t29 5, 0,1,4,2,4,3
L7304:	fn_combi_t46 6, 0,5,1,4,3,2
# --- block 412 ---
L7308:	fn_link  L7184
	fn_link  L7268
	fn_link  L7280
	fn_link  L7296
	fn_combi_t29 6, 0,1,5,2,4,3
# --- block 413 ---
L7328:	fn_link  Sphere.vecdot
	fn_link  L7308
	fn_link  L7344
	fn_combi_t10 5, 0,1,4,2,3,0
L7344:	fn_combi_t42 6, 0,4,5,1,2,3
# --- block 414 ---
L7348:	fn_link  L7364
	fn_link  L7372
	fn_link  NanoPrelude.$3c$3d.
	fn_combi_t39 6, 0,3,1,2,4,5
L7364:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7372:	fn_elink _prim_itof
# --- block 415 ---
L7376:	fn_link  L7348
	fn_link  L7388
	fn_combi_t44 5, 0,1,3,2,3,4
L7388:	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 416 ---
L7392:	fn_link  L7328
	fn_link  L7376
	fn_combi_t18 5, 0,1,2,3,4,0
# --- block 417 ---
L7404:	fn_link  L7412
	fn_combi_t29 5, 0,1,4,2,4,3
L7412:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 418 ---
L7416:	fn_link  L7404
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 419 ---
L7424:	fn_link  L7416
	fn_combi_t45 5, 0,1,4,2,3,4
# --- block 420 ---
L7432:	fn_link  L7424
	fn_combi_t29 5, 0,1,4,2,4,3
# --- block 421 ---
L7440:	fn_link  L6952
	fn_link  L7152
	fn_link  L7392
	fn_link  L7432
	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 422 ---
L7460:	fn_link  Sphere.diffusesurf
	fn_link  L7440
	fn_combi_t9 5, 0,2,3,4,1,0
# --- block 423 ---
L7472:	fn_link  L7480
	fn_combi_t26 5, 0,1,3,4,3,2
L7480:	fn_combi_t37 5, 0,3,4,1,2,1
# --- block 424 ---
L7484:	fn_link  Sphere.specpowsurf
	fn_link  L7460
	fn_link  L7472
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 425 ---
L7500:	fn_link  L7508
	fn_combi_t31 5, 4,0,1,4,3,2
L7508:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 426 ---
L7512:	fn_link  L7500
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 427 ---
L7520:	fn_link  L7512
	fn_combi_t26 6, 0,1,4,5,2,3
# --- block 428 ---
L7528:	fn_link  L7548
	fn_link  L6924
	fn_link  L7484
	fn_link  L7520
	fn_combi_t10 5, 0,1,4,2,3,0
L7548:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 429 ---
L7552:	fn_link  L7560
	fn_combi_t24 6, 0,1,5,2,3,4
L7560:	fn_combi_t39 4, 0,3,1,3,2,3
# --- block 430 ---
L7564:	fn_link  L7528
	fn_link  L7552
	fn_combi_t24 6, 0,1,5,2,3,4
# --- block 431 ---
L7576:	fn_link  L7564
	fn_combi_t29 6, 0,1,3,2,5,4
# --- block 432 ---
L7584:	fn_link  L6888
	fn_link  L6896
	fn_link  L7576
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 433 ---
NanoPrelude.$3c$3d.:	fn_link  L7608
	fn_combi_t3 3, 2,1,0,0,0,0
L7608:	fn_elink _prim_fle
# --- block 434 ---
Sphere.specularsurf:	fn_link  L7632
	fn_link  L7640
	fn_link  L7752
	fn_link  Sphere.headD
	fn_combi_t20 5, 0,1,4,2,3,0
L7632:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L7640:	fn_elink _prim_itof
# --- block 435 ---
L7644:	fn_link  L7660
	fn_link  L7664
	fn_link  L7668
	fn_combi_t13 6, 5,0,1,3,2,0
L7660:	fn_combi_t0 2, 0,0,0,0,0,0
L7664:	fn_combi_t0 1, 0,0,0,0,0,0
L7668:	fn_combi_t4 2, 1,0,0,0,0,0
# --- block 436 ---
L7672:	fn_link  L7680
	fn_combi_t6 4, 0,3,1,2,0,0
L7680:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 437 ---
L7684:	fn_link  L7696
	fn_link  L7700
	fn_combi_t15 5, 0,4,1,2,3,0
L7696:	fn_elink _prim_eq
L7700:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 438 ---
L7708:	fn_link  L7672
	fn_link  L7684
	fn_link  L7724
	fn_combi_t15 4, 0,1,3,2,3,0
L7724:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 439 ---
L7728:	fn_link  L7708
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 440 ---
L7736:	fn_link  L7728
	fn_link  L7748
	fn_combi_t6 4, 3,0,1,2,0,0
L7748:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 441 ---
L7752:	fn_link  L7644
	fn_link  L7736
	fn_link  L7772
	fn_link  Sphere.append
	fn_combi_t40 6, 0,1,2,4,3,5
L7772:	fn_y
# --- block 442 ---
Sphere.powD:	fn_link  L7792
	fn_link  L7868
	fn_link  L7796
	fn_combi_t15 5, 0,1,3,2,4,0
L7792:	fn_elink _prim_ftoi
L7796:	fn_y
# --- block 443 ---
L7800:	fn_link  L7816
	fn_link  L7840
	fn_link  NanoPrelude.$2a.
	fn_combi_t50 6, 0,3,4,1,5,2
L7816:	fn_force
	fn_tor a0
	addiw a0,a0,-1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L7840:	fn_y
# --- block 444 ---
L7844:	fn_link  L7856
	fn_link  L7860
	fn_combi_t29 5, 0,4,1,2,4,3
L7856:	fn_elink _prim_le
L7860:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 445 ---
L7868:	fn_link  L7888
	fn_link  L7896
	fn_link  L7800
	fn_link  L7844
	fn_combi_t40 6, 0,1,4,5,2,3
L7888:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7896:	fn_elink _prim_itof
# --- block 446 ---
Sphere.bodysurf:	fn_link  L7920
	fn_link  L7928
	fn_link  L8040
	fn_link  Sphere.headD
	fn_combi_t20 5, 0,1,4,2,3,0
L7920:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L7928:	fn_elink _prim_itof
# --- block 447 ---
L7932:	fn_link  L7948
	fn_link  L7952
	fn_link  L7956
	fn_combi_t13 6, 5,0,1,3,2,0
L7948:	fn_combi_t0 2, 0,0,0,0,0,0
L7952:	fn_combi_t0 1, 0,0,0,0,0,0
L7956:	fn_combi_t4 2, 1,0,0,0,0,0
# --- block 448 ---
L7960:	fn_link  L7968
	fn_combi_t6 4, 0,3,1,2,0,0
L7968:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 449 ---
L7972:	fn_link  L7984
	fn_link  L7988
	fn_combi_t15 5, 0,4,1,2,3,0
L7984:	fn_elink _prim_eq
L7988:	fn_box
	.word 0x00000007	# raw word 7
	fn_box_body
# --- block 450 ---
L7996:	fn_link  L7960
	fn_link  L7972
	fn_link  L8012
	fn_combi_t15 4, 0,1,3,2,3,0
L8012:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 451 ---
L8016:	fn_link  L7996
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 452 ---
L8024:	fn_link  L8016
	fn_link  L8036
	fn_combi_t6 4, 3,0,1,2,0,0
L8036:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 453 ---
L8040:	fn_link  L7932
	fn_link  L8024
	fn_link  L8060
	fn_link  Sphere.append
	fn_combi_t40 6, 0,1,2,4,3,5
L8060:	fn_y
# --- block 454 ---
Sphere.diffusesurf:	fn_link  L8084
	fn_link  L8092
	fn_link  L8204
	fn_link  Sphere.headD
	fn_combi_t20 5, 0,1,4,2,3,0
L8084:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8092:	fn_elink _prim_itof
# --- block 455 ---
L8096:	fn_link  L8112
	fn_link  L8116
	fn_link  L8120
	fn_combi_t13 6, 5,0,1,3,2,0
L8112:	fn_combi_t0 2, 0,0,0,0,0,0
L8116:	fn_combi_t0 1, 0,0,0,0,0,0
L8120:	fn_combi_t4 2, 1,0,0,0,0,0
# --- block 456 ---
L8124:	fn_link  L8132
	fn_combi_t6 4, 0,3,1,2,0,0
L8132:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 457 ---
L8136:	fn_link  L8148
	fn_link  L8152
	fn_combi_t15 5, 0,4,1,2,3,0
L8148:	fn_elink _prim_eq
L8152:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 458 ---
L8160:	fn_link  L8124
	fn_link  L8136
	fn_link  L8176
	fn_combi_t15 4, 0,1,3,2,3,0
L8176:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 459 ---
L8180:	fn_link  L8160
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 460 ---
L8188:	fn_link  L8180
	fn_link  L8200
	fn_combi_t6 4, 3,0,1,2,0,0
L8200:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 461 ---
L8204:	fn_link  L8096
	fn_link  L8188
	fn_link  L8224
	fn_link  Sphere.append
	fn_combi_t40 6, 0,1,2,4,3,5
L8224:	fn_y
# --- block 462 ---
Sphere.specpowsurf:	fn_link  L8256
	fn_link  L8352
	fn_link  L8252
	fn_link  Sphere.append
	fn_link  Sphere.headD
	fn_combi_t54 6, 0,1,2,3,5,4
L8252:	fn_y
# --- block 463 ---
L8256:	fn_link  L8272
	fn_link  L8276
	fn_link  L8284
	fn_combi_t5 5, 4,0,1,2,0,0
L8272:	fn_combi_t0 2, 0,0,0,0,0,0
L8276:	fn_box
	.word 0x00000008	# raw word 8
	fn_box_body
L8284:	fn_elink _prim_itof
# --- block 464 ---
L8288:	fn_link  L8296
	fn_combi_t6 4, 0,3,1,2,0,0
L8296:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 465 ---
L8300:	fn_link  L8312
	fn_link  L8316
	fn_combi_t15 5, 0,4,1,2,3,0
L8312:	fn_elink _prim_eq
L8316:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 466 ---
L8324:	fn_link  L8288
	fn_link  L8300
	fn_link  L8340
	fn_combi_t15 4, 0,1,3,2,3,0
L8340:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 467 ---
L8344:	fn_link  L8324
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 468 ---
L8352:	fn_link  L8344
	fn_link  L8364
	fn_combi_t6 4, 3,0,1,2,0,0
L8364:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 469 ---
Sphere.shadowed:	fn_link  L8392
	fn_link  L8404
	fn_link  L8444
	fn_link  L8388
	fn_combi_t10 5, 0,1,4,2,3,0
L8388:	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 470 ---
L8392:	fn_link  L8400
	fn_combi_t2 3, 2,0,1,0,0,0
L8400:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 471 ---
L8404:	fn_link  L8412
	fn_combi_t2 3, 2,0,1,0,0,0
L8412:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 472 ---
L8416:	fn_link  Sphere.epsilon
	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t16 5, 0,3,1,4,2,0
# --- block 473 ---
L8432:	fn_link  Sphere.testspheres
	fn_link  Sphere.trace
	fn_combi_t25 5, 0,1,2,4,4,3
# --- block 474 ---
L8444:	fn_link  L8464
	fn_link  L8416
	fn_link  L8432
	fn_link  NanoPrelude.not
	fn_combi_t52 6, 0,1,2,4,3,5
L8464:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 475 ---
NanoPrelude.not:	fn_link  L8480
	fn_link  L8484
	fn_combi_t2 3, 2,0,1,0,0,0
L8480:	fn_combi_t0 2, 0,0,0,0,0,0
L8484:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 476 ---
Sphere.lightcolour:	fn_link  L8500
	fn_link  L8504
	fn_combi_t2 3, 2,0,1,0,0,0
L8500:	fn_combi_t0 2, 1,0,0,0,0,0
L8504:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 477 ---
Sphere.lightdirection:	fn_link  L8520
	fn_link  L8532
	fn_combi_t6 4, 2,0,1,3,0,0
# --- block 478 ---
L8520:	fn_link  Sphere.vecsub
	fn_link  Sphere.vecnorm
	fn_combi_t7 5, 0,1,3,2,0,0
# --- block 479 ---
L8532:	fn_link  Sphere.infinity
	fn_link  Sphere.vecnorm
	fn_link  NanoPrelude.fst
	fn_combi_t13 6, 5,0,1,3,2,0
# --- block 480 ---
NanoPrelude.fst:	fn_link  L8556
	fn_combi_t1 2, 1,0,0,0,0,0
L8556:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 481 ---
Sphere.vecnorm:	fn_link  L8692
	fn_combi_t1 2, 1,0,0,0,0,0
# --- block 482 ---
L8568:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 483 ---
L8576:	fn_link  L8568
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2b.
	fn_combi_t40 5, 0,1,3,3,2,4
# --- block 484 ---
L8592:	fn_link  L8608
	fn_link  L8576
	fn_link  NanoPrelude.$2b.
	fn_combi_t19 5, 0,1,2,3,4,0
L8608:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 485 ---
L8612:	fn_link  L8620
	fn_combi_t58 5, 0,1,3,2,4,4
L8620:	fn_elink _prim_fsqrt
# --- block 486 ---
L8624:	fn_link  NanoPrelude.$2a.
	fn_link  L8592
	fn_link  L8612
	fn_combi_t5 4, 0,1,3,2,0,0
# --- block 487 ---
L8640:	fn_link  NanoPrelude.$2f.
	fn_combi_t26 6, 5,0,1,4,2,3
# --- block 488 ---
L8648:	fn_link  NanoPrelude.$2f.
	fn_link  L8640
	fn_link  L8664
	fn_combi_t29 5, 0,1,3,2,4,2
L8664:	fn_combi_t44 5, 0,1,4,2,3,4
# --- block 489 ---
L8668:	fn_link  L8676
	fn_combi_t38 5, 0,1,2,4,3,4
L8676:	fn_combi_t32 4, 3,0,1,2,2,2
# --- block 490 ---
L8680:	fn_link  L8648
	fn_link  L8668
	fn_combi_t38 5, 0,1,2,4,3,4
# --- block 491 ---
L8692:	fn_link  L8624
	fn_link  L8680
	fn_combi_t6 3, 0,2,1,2,0,0
# --- block 492 ---
Sphere.spherenormal:	fn_link  L8716
	fn_link  L8776
	fn_combi_t6 4, 0,2,1,3,0,0
L8716:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 493 ---
L8720:	fn_link  L8740
	fn_link  L8744
	fn_link  L8752
	fn_link  NanoPrelude.$2f.
	fn_combi_t15 5, 0,1,2,4,3,0
L8740:	fn_combi_t0 3, 1,0,0,0,0,0
L8744:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L8752:	fn_elink _prim_itof
# --- block 494 ---
L8756:	fn_link  L8772
	fn_link  Sphere.vecsub
	fn_link  Sphere.vecscale
	fn_combi_t20 5, 0,1,3,4,2,0
L8772:	fn_combi_t0 3, 0,0,0,0,0,0
# --- block 495 ---
L8776:	fn_link  L8720
	fn_link  L8756
	fn_combi_t14 4, 0,2,3,1,3,0
# --- block 496 ---
Sphere.reflectsurf:	fn_link  L8816
	fn_link  L8912
	fn_link  L8812
	fn_link  Sphere.append
	fn_link  Sphere.headD
	fn_combi_t54 6, 0,1,2,3,5,4
L8812:	fn_y
# --- block 497 ---
L8816:	fn_link  L8832
	fn_link  L8836
	fn_link  L8844
	fn_combi_t5 5, 4,0,1,2,0,0
L8832:	fn_combi_t0 2, 0,0,0,0,0,0
L8836:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8844:	fn_elink _prim_itof
# --- block 498 ---
L8848:	fn_link  L8856
	fn_combi_t6 4, 0,3,1,2,0,0
L8856:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 499 ---
L8860:	fn_link  L8872
	fn_link  L8876
	fn_combi_t15 5, 0,4,1,2,3,0
L8872:	fn_elink _prim_eq
L8876:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
# --- block 500 ---
L8884:	fn_link  L8848
	fn_link  L8860
	fn_link  L8900
	fn_combi_t15 4, 0,1,3,2,3,0
L8900:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 501 ---
L8904:	fn_link  L8884
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 502 ---
L8912:	fn_link  L8904
	fn_link  L8924
	fn_combi_t6 4, 3,0,1,2,0,0
L8924:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 503 ---
Sphere.transmitsurf:	fn_link  L8956
	fn_link  L9052
	fn_link  L8952
	fn_link  Sphere.append
	fn_link  Sphere.headD
	fn_combi_t54 6, 0,1,2,3,5,4
L8952:	fn_y
# --- block 504 ---
L8956:	fn_link  L8972
	fn_link  L8976
	fn_link  L8984
	fn_combi_t5 5, 4,0,1,2,0,0
L8972:	fn_combi_t0 2, 0,0,0,0,0,0
L8976:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L8984:	fn_elink _prim_itof
# --- block 505 ---
L8988:	fn_link  L8996
	fn_combi_t6 4, 0,3,1,2,0,0
L8996:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 506 ---
L9000:	fn_link  L9012
	fn_link  L9016
	fn_combi_t15 5, 0,4,1,2,3,0
L9012:	fn_elink _prim_eq
L9016:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 507 ---
L9024:	fn_link  L8988
	fn_link  L9000
	fn_link  L9040
	fn_combi_t15 4, 0,1,3,2,3,0
L9040:	fn_combi_t43 5, 0,2,3,4,1,2
# --- block 508 ---
L9044:	fn_link  L9024
	fn_combi_t7 4, 2,0,1,3,0,0
# --- block 509 ---
L9052:	fn_link  L9044
	fn_link  L9064
	fn_combi_t6 4, 3,0,1,2,0,0
L9064:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 510 ---
Sphere.spheresurf:	fn_link  L9076
	fn_combi_t1 2, 1,0,0,0,0,0
L9076:	fn_combi_t0 3, 2,0,0,0,0,0
# --- block 511 ---
Sphere.lookfrom:	fn_link  L9120
	fn_link  L9148
	fn_link  L9104
	fn_link  L9112
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L9104:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9112:	fn_box
	.word 0x00000015	# raw word 21
	fn_box_body
# --- block 512 ---
L9120:	fn_link  L9132
	fn_link  L9140
	fn_elink Sphere.d
L9132:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9140:	fn_box
	.word 0x00000011	# raw word 17
	fn_box_body
# --- block 513 ---
L9148:	fn_link  L9160
	fn_link  L9168
	fn_elink Sphere.d
L9160:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9168:	fn_box
	.word 0x0000000d	# raw word 13
	fn_box_body
# --- block 514 ---
Sphere.testlights:	fn_link  L9256
	fn_link  L9464
	fn_link  L9500
	fn_link  L9196
	fn_combi_t40 6, 5,0,1,3,2,3
L9196:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 515 ---
L9200:	fn_link  L9212
	fn_link  L9220
	fn_elink Sphere.d
L9212:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L9220:	fn_box
	.word 0x000467a3	# raw word 288675
	fn_box_body
# --- block 516 ---
L9228:	fn_link  L9240
	fn_link  L9248
	fn_elink Sphere.d
L9240:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L9248:	fn_box
	.word 0x000467a3	# raw word 288675
	fn_box_body
# --- block 517 ---
L9256:	fn_link  L9200
	fn_link  L9228
	fn_link  L9280
	fn_link  L9288
	fn_link  Sphere.d
	fn_combi_t26 6, 5,0,1,2,3,4
L9280:	fn_box
	.word 0x000f4240	# raw word 1000000
	fn_box_body
L9288:	fn_box
	.word 0x000467a3	# raw word 288675
	fn_box_body
# --- block 518 ---
L9296:	fn_link  L9316
	fn_link  L9324
	fn_link  L9332
	fn_link  L9336
	fn_combi_t41 5, 4,0,1,2,1,3
L9316:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9324:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L9332:	fn_elink _prim_itof
L9336:	fn_elink _prim_fneg
# --- block 519 ---
L9340:	fn_link  L9356
	fn_link  L9364
	fn_link  L9296
	fn_combi_t6 4, 0,3,1,2,0,0
L9356:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
L9364:	fn_elink _prim_itof
# --- block 520 ---
L9368:	fn_link  L9384
	fn_link  L9340
	fn_link  L9388
	fn_combi_t12 6, 5,0,1,3,2,0
L9384:	fn_combi_t0 2, 0,0,0,0,0,0
L9388:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 521 ---
L9392:	fn_link  L9412
	fn_link  L9420
	fn_link  L9424
	fn_link  L9432
	fn_combi_t45 5, 4,0,1,2,0,3
L9412:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L9420:	fn_elink _prim_fneg
L9424:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L9432:	fn_elink _prim_itof
# --- block 522 ---
L9436:	fn_link  L9452
	fn_link  L9460
	fn_link  L9392
	fn_combi_t6 4, 0,3,1,2,0,0
L9452:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L9460:	fn_elink _prim_itof
# --- block 523 ---
L9464:	fn_link  L9368
	fn_link  L9436
	fn_link  L9480
	fn_combi_t40 6, 5,0,1,3,2,3
L9480:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 524 ---
L9484:	fn_link  L9492
	fn_elink _prim_itof
L9492:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
# --- block 525 ---
L9500:	fn_link  L9484
	fn_link  L9520
	fn_link  L9528
	fn_link  L9536
	fn_combi_t29 5, 4,0,1,0,2,3
L9520:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
L9528:	fn_box
	.word 0x00000004	# raw word 4
	fn_box_body
L9536:	fn_elink _prim_itof
# --- block 526 ---
Sphere.fromTo:	fn_link  L9556
	fn_link  L9604
	fn_link  L9620
	fn_combi_t10 4, 0,1,3,2,3,0
L9556:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 527 ---
L9560:	fn_link  L9576
	fn_link  L9600
	fn_link  Sphere.fromTo
	fn_combi_t8 4, 0,1,3,2,0,0
L9576:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L9600:	fn_y
# --- block 528 ---
L9604:	fn_link  L9560
	fn_link  L9616
	fn_combi_t16 4, 0,2,1,2,3,0
L9616:	fn_combi_t2 4, 3,0,1,0,0,0
# --- block 529 ---
L9620:	fn_link  L9628
	fn_combi_t29 5, 4,3,0,1,4,2
L9628:	fn_elink _prim_gt
# --- block 530 ---
Sphere.camparams:	fn_link  L9644
	fn_link  L10192
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 531 ---
L9644:	fn_link  Sphere.vecsub
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 532 ---
L9652:	fn_link  L9660
	fn_combi_t1 2, 1,0,0,0,0,0
L9660:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 533 ---
L9664:	fn_link  L9680
	fn_link  Sphere.veccross
	fn_link  Sphere.vecnorm
	fn_combi_t12 5, 0,1,4,3,2,0
L9680:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 534 ---
L9684:	fn_link  L9708
	fn_link  L9716
	fn_link  NanoPrelude.$2f.
	fn_link  Sphere.dtor
	fn_link  Sphere.tanD
	fn_combi_t62 6, 0,1,2,5,3,4
L9708:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9716:	fn_elink _prim_itof
# --- block 535 ---
L9720:	fn_link  L9736
	fn_link  L9744
	fn_link  NanoPrelude.$2a.
	fn_combi_t33 5, 0,0,1,2,4,3
L9736:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9744:	fn_elink _prim_itof
# --- block 536 ---
L9748:	fn_link  L9684
	fn_link  L9720
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 537 ---
L9760:	fn_link  L9780
	fn_link  Sphere.veccross
	fn_link  Sphere.vecnorm
	fn_link  Sphere.vecscale
	fn_combi_t54 6, 0,1,2,5,4,3
L9780:	fn_combi_t0 2, 0,0,0,0,0,0
# --- block 538 ---
L9784:	fn_link  NanoPrelude.$2f.
	fn_link  L9760
	fn_link  L9800
	fn_combi_t24 6, 0,1,5,2,3,4
L9800:	fn_combi_t47 6, 0,4,1,2,5,3
# --- block 539 ---
L9804:	fn_link  L9748
	fn_link  L9784
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 540 ---
L9816:	fn_link  L9840
	fn_link  L9848
	fn_link  NanoPrelude.$2f.
	fn_link  Sphere.dtor
	fn_link  Sphere.tanD
	fn_combi_t62 6, 0,1,2,5,3,4
L9840:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9848:	fn_elink _prim_itof
# --- block 541 ---
L9852:	fn_link  L9868
	fn_link  L9876
	fn_link  NanoPrelude.$2a.
	fn_combi_t33 5, 0,0,1,2,4,3
L9868:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L9876:	fn_elink _prim_itof
# --- block 542 ---
L9880:	fn_link  L9816
	fn_link  L9852
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 543 ---
L9892:	fn_link  NanoPrelude.$2f.
	fn_link  Sphere.vecscale
	fn_combi_t47 6, 0,4,1,2,5,3
# --- block 544 ---
L9904:	fn_link  L9916
	fn_link  L9924
	fn_elink Sphere.d
L9916:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9924:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 545 ---
L9932:	fn_link  L9904
	fn_elink NanoPrelude.$2a.
# --- block 546 ---
L9940:	fn_link  L9932
	fn_link  Sphere.vecscale
	fn_combi_t6 4, 0,3,1,2,0,0
# --- block 547 ---
L9952:	fn_link  L9964
	fn_link  L9972
	fn_elink Sphere.d
L9964:	fn_box
	.word 0x0000000a	# raw word 10
	fn_box_body
L9972:	fn_box
	.word 0x00000005	# raw word 5
	fn_box_body
# --- block 548 ---
L9980:	fn_link  L9952
	fn_elink NanoPrelude.$2a.
# --- block 549 ---
L9988:	fn_link  Sphere.vecscale
	fn_link  Sphere.vecadd
	fn_combi_t40 6, 0,1,5,2,3,4
# --- block 550 ---
L10000:	fn_link  L9940
	fn_link  L9980
	fn_link  L9988
	fn_combi_t15 5, 0,1,4,2,3,0
# --- block 551 ---
L10016:	fn_link  Sphere.vecsub
	fn_combi_t26 6, 5,0,1,2,4,3
# --- block 552 ---
L10024:	fn_link  L10000
	fn_link  L10016
	fn_link  L10040
	fn_combi_t44 6, 0,1,5,2,3,4
L10040:	fn_combi_t26 4, 0,1,3,2,3,2
# --- block 553 ---
L10044:	fn_link  L10052
	fn_combi_t40 5, 0,1,3,4,2,3
L10052:	fn_combi_t40 5, 0,1,2,4,3,4
# --- block 554 ---
L10056:	fn_link  L9880
	fn_link  L9892
	fn_link  L10024
	fn_link  L10044
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 555 ---
L10076:	fn_link  L10056
	fn_link  L10088
	fn_combi_t51 6, 0,1,2,3,4,5
L10088:	fn_combi_t39 5, 0,4,1,4,2,3
# --- block 556 ---
L10092:	fn_link  L10100
	fn_combi_t26 6, 0,1,2,5,3,4
L10100:	fn_combi_t25 6, 0,3,1,5,4,2
# --- block 557 ---
L10104:	fn_link  L10076
	fn_link  L10092
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 558 ---
L10116:	fn_link  L10104
	fn_combi_t28 5, 0,1,4,2,4,3
# --- block 559 ---
L10124:	fn_link  L10140
	fn_link  L9804
	fn_link  L10116
	fn_combi_t11 4, 0,3,1,3,2,0
L10140:	fn_combi_t0 2, 1,0,0,0,0,0
# --- block 560 ---
L10144:	fn_link  L10124
	fn_link  L10156
	fn_combi_t32 6, 0,1,3,4,5,2
L10156:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 561 ---
L10160:	fn_link  L9664
	fn_link  L10144
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 562 ---
L10172:	fn_link  L9652
	fn_link  L10160
	fn_link  L10188
	fn_combi_t32 6, 0,1,3,4,5,2
L10188:	fn_combi_t37 5, 0,2,3,4,1,4
# --- block 563 ---
L10192:	fn_link  Sphere.vecnorm
	fn_link  L10172
	fn_link  L10208
	fn_combi_t26 6, 0,1,4,5,2,3
L10208:	fn_combi_t37 4, 0,3,3,2,1,2
# --- block 564 ---
Sphere.tanD:	fn_link  Sphere.cosD
	fn_link  Sphere.sinD
	fn_link  NanoPrelude.$2f.
	fn_combi_t15 4, 0,1,3,2,3,0
# --- block 565 ---
Sphere.sinD:	fn_link  L10620
	fn_combi_t2 2, 0,1,1,0,0,0
# --- block 566 ---
L10236:	fn_link  L10256
	fn_link  L10280
	fn_link  L10304
	fn_link  L10312
	fn_combi_t55 5, 0,0,4,1,2,3
L10256:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10280:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10304:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10312:	fn_y
# --- block 567 ---
L10316:	fn_link  L10336
	fn_link  L10360
	fn_link  L10384
	fn_link  L10392
	fn_combi_t55 5, 0,0,4,1,2,3
L10336:	fn_force
	fn_tor a0
	addiw a0,a0,3
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10360:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10384:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10392:	fn_y
# --- block 568 ---
L10396:	fn_link  L10416
	fn_link  L10236
	fn_link  L10316
	fn_link  L10440
	fn_combi_t58 5, 0,1,4,2,4,3
L10416:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10440:	fn_y
# --- block 569 ---
L10444:	fn_link  L10456
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 4, 0,1,3,0,2,2
L10456:	fn_elink _prim_fneg
# --- block 570 ---
L10460:	fn_link  L10472
	fn_link  L10444
	fn_combi_t3 3, 0,1,2,0,0,0
L10472:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 571 ---
L10476:	fn_link  NanoPrelude.$2f.
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 572 ---
L10484:	fn_link  L10396
	fn_link  L10504
	fn_link  L10460
	fn_link  L10476
	fn_combi_t10 5, 0,1,4,2,3,0
L10504:	fn_elink _prim_itof
# --- block 573 ---
L10508:	fn_link  L10520
	fn_link  L10544
	fn_combi_t8 4, 2,0,3,1,0,0
L10520:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10544:	fn_y
# --- block 574 ---
L10548:	fn_link  NanoPrelude.$2b.
	fn_link  L10508
	fn_link  L10564
	fn_combi_t5 4, 0,1,3,2,0,0
L10564:	fn_combi_t42 5, 0,2,3,1,4,3
# --- block 575 ---
L10568:	fn_link  L10548
	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 576 ---
L10576:	fn_link  L10484
	fn_link  L10568
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 577 ---
L10588:	fn_link  L10600
	fn_link  L10604
	fn_combi_t29 5, 0,2,1,3,4,4
L10600:	fn_elink _prim_ge
L10604:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 578 ---
L10612:	fn_link  L10588
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 579 ---
L10620:	fn_link  L10640
	fn_link  L10576
	fn_link  L10612
	fn_link  L10648
	fn_combi_t27 5, 0,1,2,4,3,4
L10640:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L10648:	fn_y
# --- block 580 ---
Sphere.cosD:	fn_link  L10668
	fn_link  L10676
	fn_link  L11080
	fn_combi_t6 4, 0,3,1,2,0,0
L10668:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
L10676:	fn_elink _prim_itof
# --- block 581 ---
L10680:	fn_link  L10688
	fn_elink _prim_itof
L10688:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 582 ---
L10696:	fn_link  L10716
	fn_link  L10740
	fn_link  L10764
	fn_link  L10772
	fn_combi_t55 5, 0,0,4,1,2,3
L10716:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10740:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10764:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10772:	fn_y
# --- block 583 ---
L10776:	fn_link  L10796
	fn_link  L10820
	fn_link  L10844
	fn_link  L10852
	fn_combi_t55 5, 0,0,4,1,2,3
L10796:	fn_force
	fn_tor a0
	addiw a0,a0,2
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10820:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10844:	fn_box
	.word 0x00000002	# raw word 2
	fn_box_body
L10852:	fn_y
# --- block 584 ---
L10856:	fn_link  L10876
	fn_link  L10696
	fn_link  L10776
	fn_link  L10900
	fn_combi_t58 5, 0,1,4,2,4,3
L10876:	fn_tor a0
	fn_tor a1
	mulw a0,a0,a1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L10900:	fn_y
# --- block 585 ---
L10904:	fn_link  L10916
	fn_link  NanoPrelude.$2a.
	fn_combi_t44 4, 0,1,3,0,2,2
L10916:	fn_elink _prim_fneg
# --- block 586 ---
L10920:	fn_link  L10932
	fn_link  L10904
	fn_combi_t3 3, 0,1,2,0,0,0
L10932:	fn_combi_t0 1, 0,0,0,0,0,0
# --- block 587 ---
L10936:	fn_link  NanoPrelude.$2f.
	fn_combi_t45 6, 0,1,5,2,3,4
# --- block 588 ---
L10944:	fn_link  L10856
	fn_link  L10964
	fn_link  L10920
	fn_link  L10936
	fn_combi_t10 5, 0,1,4,2,3,0
L10964:	fn_elink _prim_itof
# --- block 589 ---
L10968:	fn_link  L10980
	fn_link  L11004
	fn_combi_t8 4, 2,0,3,1,0,0
L10980:	fn_force
	fn_tor a0
	addiw a0,a0,1
	fn_databox a0,a0
	fn_update a0
	fn_go a0
L11004:	fn_y
# --- block 590 ---
L11008:	fn_link  NanoPrelude.$2b.
	fn_link  L10968
	fn_link  L11024
	fn_combi_t5 4, 0,1,3,2,0,0
L11024:	fn_combi_t42 5, 0,2,3,1,4,3
# --- block 591 ---
L11028:	fn_link  L11008
	fn_combi_t42 5, 0,2,3,1,3,4
# --- block 592 ---
L11036:	fn_link  L10944
	fn_link  L11028
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 593 ---
L11048:	fn_link  L11060
	fn_link  L11064
	fn_combi_t29 5, 0,2,1,3,4,4
L11060:	fn_elink _prim_ge
L11064:	fn_box
	.word 0x0000000c	# raw word 12
	fn_box_body
# --- block 594 ---
L11072:	fn_link  L11048
	fn_combi_t46 5, 0,3,1,2,3,4
# --- block 595 ---
L11080:	fn_link  L10680
	fn_link  L11104
	fn_link  L11036
	fn_link  L11072
	fn_link  L11112
	fn_combi_t27 6, 0,1,2,5,3,4
L11104:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11112:	fn_y
# --- block 596 ---
Sphere.dtor:	fn_link  L11140
	fn_link  L11148
	fn_link  Sphere.piD
	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2f.
	fn_combi_t40 6, 0,1,5,2,3,4
L11140:	fn_box
	.word 0x000000b4	# raw word 180
	fn_box_body
L11148:	fn_elink _prim_itof
# --- block 597 ---
Sphere.piD:	fn_link  L11164
	fn_link  L11192
	fn_elink NanoPrelude.$2b.
# --- block 598 ---
L11164:	fn_link  L11176
	fn_link  L11184
	fn_elink Sphere.d
L11176:	fn_box
	.word 0x05f5e100	# raw word 100000000
	fn_box_body
L11184:	fn_box
	.word 0x00d80da1	# raw word 14159265
	fn_box_body
# --- block 599 ---
L11192:	fn_link  L11200
	fn_elink _prim_itof
L11200:	fn_box
	.word 0x00000003	# raw word 3
	fn_box_body
# --- block 600 ---
Sphere.veccross:	fn_link  L11376
	fn_combi_t3 3, 1,0,2,0,0,0
# --- block 601 ---
L11216:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 602 ---
L11224:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t40 6, 0,1,2,5,3,4
# --- block 603 ---
L11236:	fn_link  L11216
	fn_link  L11224
	fn_combi_t6 4, 0,2,1,3,0,0
# --- block 604 ---
L11248:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 605 ---
L11256:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t40 6, 0,1,3,4,2,5
# --- block 606 ---
L11268:	fn_link  L11248
	fn_link  L11256
	fn_combi_t3 3, 0,1,2,0,0,0
# --- block 607 ---
L11280:	fn_link  NanoPrelude.$2a.
	fn_combi_t2 3, 0,2,1,0,0,0
# --- block 608 ---
L11288:	fn_link  NanoPrelude.$2a.
	fn_link  NanoPrelude.$2d.
	fn_combi_t54 6, 5,0,1,2,4,3
# --- block 609 ---
L11300:	fn_link  L11280
	fn_link  L11288
	fn_combi_t16 5, 0,2,1,3,4,0
# --- block 610 ---
L11312:	fn_link  L11320
	fn_combi_t38 5, 0,1,4,2,3,4
L11320:	fn_combi_t28 5, 0,3,4,1,3,2
# --- block 611 ---
L11324:	fn_link  L11300
	fn_link  L11312
	fn_combi_t7 4, 0,1,2,3,0,0
# --- block 612 ---
L11336:	fn_link  L11324
	fn_link  L11348
	fn_combi_t3 3, 0,1,2,0,0,0
L11348:	fn_combi_t39 5, 0,1,2,4,3,4
# --- block 613 ---
L11352:	fn_link  L11336
	fn_link  L11368
	fn_link  L11372
	fn_combi_t5 4, 0,1,3,2,0,0
L11368:	fn_combi_t53 5, 0,1,4,2,4,3
L11372:	fn_combi_t38 5, 0,1,4,2,3,4
# --- block 614 ---
L11376:	fn_link  L11236
	fn_link  L11268
	fn_link  L11352
	fn_combi_t39 5, 0,3,1,4,2,4
# --- block 615 ---
Sphere.lookat:	fn_link  L11440
	fn_link  L11416
	fn_link  L11424
	fn_link  L11428
	fn_link  L11436
	fn_combi_t29 6, 5,0,1,2,3,4
L11416:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11424:	fn_elink _prim_itof
L11428:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11436:	fn_elink _prim_itof
# --- block 616 ---
L11440:	fn_link  L11448
	fn_elink _prim_itof
L11448:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
# --- block 617 ---
Sphere.vup:	fn_link  L11504
	fn_link  L11480
	fn_link  L11488
	fn_link  L11492
	fn_link  L11500
	fn_combi_t29 6, 5,0,1,2,3,4
L11480:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11488:	fn_elink _prim_itof
L11492:	fn_box
	.word 0x00000000	# raw word 0
	fn_box_body
L11500:	fn_elink _prim_itof
# --- block 618 ---
L11504:	fn_link  L11512
	fn_elink _prim_itof
L11512:	fn_box
	.word 0x00000001	# raw word 1
	fn_box_body
# --- block 619 ---
Sphere.fov:	fn_link  L11528
	fn_elink _prim_itof
L11528:	fn_box
	.word 0x0000002d	# raw word 45
	fn_box_body
# --- block 620 ---
Sphere.simWin:	fn_box
	.word 0x00000003	# raw word 3
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
_unimpprim_addiw$202:
	la a0, _unimpprim_addiw$202$name
	tail _unimpfi_halt
_unimpprim_addiw$202$name:
	.asciz "addiw 2"
	.balign 4, 0
	.balign 4
_unimpprim_addiw$203:
	la a0, _unimpprim_addiw$203$name
	tail _unimpfi_halt
_unimpprim_addiw$203$name:
	.asciz "addiw 3"
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
