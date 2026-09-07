p = "src/MicroHs/FunBlobs.hs"; s = open(p).read()
old = """  ++ [ "  .balign 8", "_tos_api:", "  .skip 4"
     , "  .balign 8", "_tos_argc:", "  .skip 4"
     , "  .balign 8", "_tos_argv:", "  .skip 4" ]"""
new = """  ++ [ "  .balign 8", "_iobuf:",  "  .skip 8"   -- the one-byte read/write staging
     , "  .balign 8", "_cur_fd:", "  .skip 8"   -- fd the byte effects act on
     , "  .balign 8", "_tos_api:", "  .skip 4"
     , "  .balign 8", "_tos_argc:", "  .skip 4"
     , "  .balign 8", "_tos_argv:", "  .skip 4" ]"""
assert old in s
open(p, "w").write(s.replace(old, new, 1)); print("thin data block completed")
