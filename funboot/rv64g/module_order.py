import os, re, sys
roots = {"lib": "", "src": "", "mhs": "", "paths": ""}
mods = {}   # module name -> path
for base in ("lib", "src", "mhs", "paths"):
    for dirpath, _, files in os.walk(base):
        for f in files:
            if f.endswith(".hs"):
                p = os.path.join(dirpath, f)
                rel = os.path.relpath(p, base)[:-3].replace(os.sep, ".")
                mods.setdefault(rel, p)
deps = {}
for m, p in mods.items():
    ds = set()
    for l in open(p, errors="ignore"):
        # A {-# SOURCE #-} import is the edge that BREAKS a cycle -- it exists
        # precisely so the two modules need not be ordered.  Counting it as a
        # dependency puts a module before the ones it needs: Data.Tuple came
        # out 58 places ahead of Data.Monoid.Internal, which it imports, and so
        # compiled it from source instead of reading its interface.
        if "{-# SOURCE #-}" in l:
            continue
        # `import Prelude()` takes NOTHING from Prelude -- it is how a module
        # turns the implicit Prelude off.  As an ordering edge it invents a
        # cycle (Data.Monoid.Internal -> Prelude -> Data.Tuple -> back), and
        # breaking that cycle put Data.Tuple 58 places ahead of a module it
        # imports, which it then compiled from source: ten minutes and a heap
        # at its limit, for a module that reads its interface in seconds.
        if re.match(r"\s*import\s+[A-Za-z0-9_.]+\s*\(\s*\)", l):
            continue
        mm = re.match(r"\s*import\s+(?:qualified\s+)?([A-Z][A-Za-z0-9_.]*)", l)
        if mm and mm.group(1) in mods:
            ds.add(mm.group(1))
    deps[m] = ds - {m}
order, seen, stack = [], set(), set()
def visit(m):
    if m in seen: return
    if m in stack: return          # cycle: leave it, boot files handle these
    stack.add(m)
    for d in sorted(deps.get(m, ())): visit(d)
    stack.discard(m); seen.add(m); order.append(m)
target = sys.argv[1] if len(sys.argv) > 1 else "MicroHs.Main"
visit(target)
print("\n".join(order))
