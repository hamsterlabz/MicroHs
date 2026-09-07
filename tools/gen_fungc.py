#!/usr/bin/env python3
"""Embed the bare-metal collector's assembly as a Haskell string module.

Reads gcc -S output on stdin, writes src/MicroHs/FunGc.hs on stdout.
.file and .attribute directives are dropped so the outer listing's -march
governs the whole file.  The C file stays the source of truth; the Makefile
regenerates this module whenever it changes.
"""
import sys

def esc(line):
    out = []
    for ch in line:
        if ch == '\\':
            out.append('\\\\')
        elif ch == '"':
            out.append('\\"')
        elif ch == '\t':
            out.append('\\t')
        else:
            out.append(ch)
    return ''.join(out)

print("-- GENERATED from funboot/rv32/fun_gc_cheney.c by the Makefile"
      " -- do not edit")
print("module MicroHs.FunGc(funGcAsm) where")
print("import Prelude(); import MHSPrelude")
print("funGcAsm :: String")
print("funGcAsm = concat [")
# The collector uses cbo.flush; the graph listing's -march has no zicbom, so
# the bundled block declares the extension for its own extent.  push/pop
# keeps it strictly local to the GC.
print('  "\\t.option push\\n",')
print('  "\\t.option arch, +zicbom\\n",')
for raw in sys.stdin:
    line = raw.rstrip('\n')
    stripped = line.lstrip()
    if stripped.startswith('.file') or stripped.startswith('.attribute'):
        continue
    print('  "%s\\n",' % esc(line))
print('  "\\t.option pop\\n",')
print('  ""]')
