p="src/MicroHs/Compile.hs"; s=open(p).read()
old = """  when (sepComp flags) $ liftIO $ writeInterface pathfn file defs tmdl"""
new = """  -- Not for a module that IS an interface: it already has one, and the name
  -- would come out `Data/Semigroup.hi.hi.hs`.
  when (sepComp flags && not (isSuffixOf ".hi.hs" pathfn)) $
    liftIO $ writeInterface pathfn file defs tmdl"""
assert old in s
s = s.replace(old, new, 1)
old2 = """  writeFile hifn txt"""
new2 = """  -- Forced before the file is opened.  writeFile evaluates the string AS it
  -- writes, so anything that throws part way leaves a truncated -- usually
  -- empty -- interface on disk, and an empty interface is a module with no
  -- name: every importer then fails with `module name does not agree with
  -- file name: MiniPrelude Main`, thirteen of them from one bad write.
  length txt `seq` writeFile hifn txt"""
assert old2 in s
open(p,"w").write(s.replace(old2,new2,1)); print("both fixes applied")
