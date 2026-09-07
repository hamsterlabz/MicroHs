p = "src/MicroHs/Main.hs"; s = open(p).read()
old = '''    "--bare" -> decodeArgs f{rvfun = True, rvfunLinux = True} mdls args
    "--rvfun-io" -> decodeArgs f{rvfun = True, rvfunIO = True} mdls args'''
new = '''    -- The fun target: real fn.* instructions.  Every live use wraps the entry
    -- with performIO, so that is not a separate flag any more.  `--bare` adds
    -- the Linux _start prologue on top; it is how the runtime is generated.
    "--rvfun" -> decodeArgs f{rvfun = True, rvfunIO = True} mdls args
    "--rvfun-io" -> decodeArgs f{rvfun = True, rvfunIO = True} mdls args   -- old name for --rvfun
    "--bare" -> decodeArgs f{rvfun = True, rvfunIO = True, rvfunLinux = True} mdls args'''
assert old in s
s = s.replace(old, new, 1)
# --rvfun-box was never used by anything: no script, no test, no template.
old2 = '''    "--rvfun-box" -> decodeArgs f{rvfun = True, rvfunBox = True} mdls args   -- boxed SoC fun_core (no Linux _start)\n'''
assert old2 in s
s = s.replace(old2, "", 1)
s = s.replace('''          prelude | rvfun64g flags && (rvfunLinux flags || rvfunBox flags)''',
              '''          prelude | rvfun64g flags && rvfunLinux flags''', 1)
s = s.replace('''                  | rvfunBox   flags = boxPrelude\n''', "", 1)
s = s.replace('''          suffix  = if rvfunLinux flags || rvfunBox flags then "\\n_funtext_end:\\n" else ""''',
              '''          suffix  = if rvfunLinux flags then "\\n_funtext_end:\\n" else ""''', 1)
open(p, "w").write(s)

p = "src/MicroHs/Flags.hs"; s = open(p).read()
import re
s = re.sub(r"\n *rvfunBox *:: *Bool,[^\n]*", "", s, count=1)
s = re.sub(r"\n *rvfunBox *= *False,", "", s, count=1)
open(p, "w").write(s)
print("flags consolidated; rvfunBox removed")
