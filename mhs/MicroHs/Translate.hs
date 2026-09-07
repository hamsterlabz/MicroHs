-- fun target shadow of MicroHs.Translate (mhs/ precedes src/ on the self-build
-- include path, so this replaces src/MicroHs/Translate.hs when the compiler is
-- compiled BY mhs for the fun backend; the GHC build (-ighc -isrc) is untouched).
--
-- The real module implements `mhs -r` and the interactive loop by translating a
-- compiled combinator graph into host values, which needs a table naming every
-- runtime primitive (IO.>>=, A.read, bs++, catch, dynsym, ...). Those names are
-- the host C runtime's, and the fun backend has no host runtime to translate
-- into: the program IS the graph. Compiling that table for the fun target would
-- emit a graph atom per primitive with no fun encoding, so the two entry points
-- reject instead. Everything else the compiler does (compile to .S / .comb) is
-- unaffected.
module MicroHs.Translate(
  translate, translateAndRun
  ) where
import Prelude(); import MHSPrelude
import Primitives(AnyType)
import MicroHs.Desugar(LDef)
import MicroHs.Ident

translate :: (Ident, [LDef]) -> AnyType
translate _ = error "mhs (fun): in-process evaluation is not available on the fun backend"

translateAndRun :: (Ident, [LDef]) -> IO ()
translateAndRun _ = error "mhs (fun): -r (run in process) is not available on the fun backend"
