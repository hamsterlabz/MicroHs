p="src/MicroHs/Expr.hs"; s=open(p).read()
old = """        ppCs (Right fs) = braces (hsep $ map f fs)
          where f (i, t) = ppIdent i <+> text "::" <+> ppSType t <> text ","
"""
new = """        -- Fields are SEPARATED by commas, not terminated by them:
        -- `Endo {appEndo :: a -> a,}` is not a record, it is a syntax error.
        ppCs (Right fs) = braces (hsep $ punctuate (text ",") $ map f fs)
          where f (i, t) = ppConName i <+> text "::" <+> ppSType t
"""
assert old in s
open(p,"w").write(s.replace(old,new,1)); print("record field comma fixed")
