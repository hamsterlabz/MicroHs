import os, subprocess
O = os.path.expanduser("~/work/MicroHs/funboot/rv64g/build/self")
out = []
def w(s=""): out.append(s)

w("# Self-compilation and suite results")
w()
w("mhs64 is the compiler compiled to the rv64 fun target and run on the reducer.")
w("All figures are `fun: reductions` unless a time is given.  Everything here was")
w("produced with `-c -hi`: one object per module, imports satisfied from the")
w("interface written beside each object.")
w()

# --- interface round trip ---
chk = os.path.join(O, "check.log")
tot = ""
if os.path.exists(chk):
    for l in open(chk):
        if l.startswith("TOTAL"): tot = l.strip()
w("## 1. Interface round-trip")
w()
w("Every module writes `<module>.hi.hs` and every module is then compiled against")
w("the interfaces, with the GHC-built compiler.  This is the gate: mhs64 is not")
w("worth running until it passes.")
w()
w("```")
w(tot or "(not run)")
w("```")
w()
w("Eight bugs had to be fixed to get there, all found by running this check rather")
w("than by running the self-compile:")
w()
w("| bug | what it produced |")
w("|---|---|")
w("| partial operator application | `Functor ((a ->))` for `(->) a` |")
w("| multi-line import lists cut off | `import Data.List(map,` and nothing after |")
w("| two imports on one line | `import Prelude(); import MHSPrelude` -- MHSPrelude never seen |")
w("| closure walk stopped at interfaces | hid `import Text.Show(showChar)` behind one |")
w("| qualified-only imports | `undefined type: IntMap` -- types print unqualified |")
w("| operator type constructors | `type :~: ::`, `data :~: a b` |")
w("| tuple constructor | `instance Typeable ,` |")
w("| empty file left on a throw | `MiniPrelude` read as a nameless module, 13 cascades |")
w()

# --- self compile ---
tsv = os.path.join(O, "self64.tsv")
rows = []
if os.path.exists(tsv):
    for l in open(tsv):
        p = l.rstrip("\n").split("\t")
        if len(p) >= 4: rows.append(p)
ok = [r for r in rows if r[3] == "ok"]
bad = [r for r in rows if r[3] != "ok"]
wall = sum(int(r[1]) for r in rows if r[1].isdigit())
red = sum(int(r[2]) for r in ok if r[2].isdigit())
w("## 2. mhs64 self-compile")
w()
w("The compiler compiling its own modules, one object at a time, in dependency order.")
w("Before this work mhs64 could not compile MicroHs at all: the whole-program compile")
w("exhausts the 128 MiB heap, at `-O0` as well, so it was never a question of the")
w("optimizer.  Per module, it fits.")
w()
w("| | |")
w("|---|---:|")
w("| modules compiled | **%d** |" % len(ok))
w("| modules timed out | %d |" % len(bad))
w("| wall clock | %d s |" % wall)
w("| reductions | %s |" % f"{red:,}")
w()
w("### Per module")
w()
w("| module | s | reductions |")
w("|---|---:|---:|")
for r in rows:
    rr = f"{int(r[2]):,}" if r[2].isdigit() else ("timeout" if r[3] != "ok" else "?")
    w("| %s | %s | %s |" % (r[0], r[1], rr))
w()
w("### Where it stops")
w()
w("`Data.Text` is 66 lines with 6 instances and does not finish in 15 minutes,")
w("while `Data.String` -- comparable size -- takes 209 s.  The difference is the")
w("import: `Data.String` names five modules directly, `Data.Text` imports")
w("`MiniPrelude`, which re-exports 23 modules.  Compiling against a re-export hub")
w("pulls its whole closure, roughly a hundred interfaces, and the name filter")
w("cannot prune any of it because the hub's export list mentions everything.")
w()
w("So the interface scheme scales with a small prelude -- the flite programs below")
w("compile in seconds -- and does not yet scale to the compiler's own module graph,")
w("where every module imports `MHSPrelude`.  That is the next thing to fix, and it")
w("is a real interface system rather than a lexical filter.")
w()

# --- suites ---
w("## 3. Suites")
w()
for suite in ("flite", "nofib", "gadt"):
    f = os.path.join(O, "suite_%s.txt" % suite)
    if not os.path.exists(f): continue
    lines = [l.split() for l in open(f) if " RAN " in l or "FAIL" in l]
    ran = [l for l in lines if len(l) > 1 and l[1] == "RAN"]
    fails = [l for l in lines if len(l) > 1 and l[1] != "RAN"]
    w("### %s -- %d programs, %d failed" % (suite, len(ran), len(fails)))
    w()
    w("| program | reductions | result |")
    w("|---|---:|---|")
    for l in ran:
        red_ = f"{int(l[2]):,}" if len(l) > 2 and l[2].isdigit() else "?"
        res = l[3] if len(l) > 3 else ""
        w("| %s | %s | %s |" % (l[0], red_, res))
    for l in fails:
        w("| %s | -- | %s |" % (l[0], l[1]))
    w()

path = os.path.expanduser("~/work/MicroHs/funboot/rv64g/SELFCOMPILE.md")
open(path, "w").write("\n".join(out) + "\n")
print("wrote", path, len(out), "lines")
