# --- host effects: files by path, and argv -------------------------------
# The path arrives one byte at a time (io.pathc) because the graph has no way
# to hand over a buffer; io.open consumes it and resets the buffer.
  .balign 4
_io_pathc:
  fn.pop a0
  jal ra, _fforce
  la t0, _pathbuf
  la t1, _pathlen
  lw t2, 0(t1)
  li t4, 1023
  bgeu t2, t4, 1f
  add t3, t0, t2
  sb a0, 0(t3)
  addi t2, t2, 1
  sw t2, 0(t1)
1:
  .word 0x0000000b
  .balign 4
_io_open:
  fn.pop a0
  jal ra, _fforce               # a0 = the IOMode
  la t0, _pathbuf
  la t1, _pathlen
  lw t2, 0(t1)
  add t3, t0, t2
  sb zero, 0(t3)                 # NUL-terminate
  sw zero, 0(t1)                 # reset for the next path
  li t4, 0                       # ReadMode: O_RDONLY
  beqz a0, 1f
  li t5, 1
  bne a0, t5, 2f
  li t4, 0x241                   # WriteMode:  O_WRONLY|O_CREAT|O_TRUNC
  j 1f
2:
  li t5, 2
  bne a0, t5, 3f
  li t4, 0x441                   # AppendMode: O_WRONLY|O_CREAT|O_APPEND
  j 1f
3:
  li t4, 0x42                    # ReadWriteMode: O_RDWR|O_CREAT
1:
  li a0, -100                    # AT_FDCWD
  la a1, _pathbuf
  mv a2, t4
  li a3, 0x1b6                   # 0666
  li a7, 56                      # openat -> fd, negative on failure
  ecall
  .word 0x0005755b
  jr a0
  .balign 4
_io_close:
  fn.pop a0
  jal ra, _fforce
  li a7, 57
  ecall
  .word 0x0000000b
  .balign 4
_io_getbf:                       # one byte from the current fd
  la a2, _cur_fd
  lw a0, 0(a2)
  la a1, _iobuf
  li a2, 1
  li a7, 63                      # read
  ecall
  blez a0, 1f                    # 0 = EOF, <0 = error
  la a1, _iobuf
  lbu a0, 0(a1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0
  .balign 4
_io_getb:                        # one byte from stdin
  li a0, 0
  la a1, _iobuf
  li a2, 1
  li a7, 63
  ecall
  blez a0, 1f
  la a1, _iobuf
  lbu a0, 0(a1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0
  .balign 4
_io_argc:
  la t0, _argv_base
  lw t0, 0(t0)
  lw a0, 0(t0)
  .word 0x0005755b
  jr a0
  .balign 4
_io_argsel:
  fn.pop a0
  jal ra, _fforce               # a0 = the argv index
  la t0, _argv_base
  lw t0, 0(t0)
  addi t0, t0, 4
  slli t1, a0, 2
  add t0, t0, t1
  lw t0, 0(t0)
  la t1, _arg_ptr
  sw t0, 0(t1)
  la t1, _arg_off
  sw zero, 0(t1)
  .word 0x0000000b
  .balign 4
_io_argrd:                       # next byte of the selected arg, -1 at the end
  la t0, _arg_ptr
  lw t0, 0(t0)
  la t1, _arg_off
  lw t2, 0(t1)
  add t3, t0, t2
  lbu a0, 0(t3)
  beqz a0, 1f
  addi t2, t2, 1
  sw t2, 0(t1)
  j 2f
1:
  li a0, -1
2:
  .word 0x0005755b
  jr a0

  .balign 8
_pathbuf:
  .skip 1024
_pathlen:
  .skip 8
_arg_ptr:
  .skip 8
_arg_off:
  .skip 8
