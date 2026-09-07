-- EXPECT: D Data.Bool_Type.False = <2,X,[0]>
-- EXPECT: D Data.Bool_Type.True = <2,X,[1]>
-- EXPECT: D Data.Ordering_Type.LT = <3,X,[0]>
-- EXPECT: D Data.Ordering_Type.EQ = <3,X,[1]>
-- EXPECT: D Data.Ordering_Type.GT = <3,X,[2]>
-- EXPECT: D Primitives.Char = <1,X,[0]>
-- EXPECT: D Primitives.primIntAdd = ((<4,X(X(XX)),[0,3,2,1]> Y) +)
-- EXPECT: D Primitives.primIntSub = ((<4,X(X(XX)),[0,3,2,1]> Y) -)
-- EXPECT: D Primitives.primIntMul = ((<4,X(X(XX)),[0,3,2,1]> Y) *)
-- EXPECT: D Primitives.primIntQuot = ((<4,X(X(XX)),[0,3,2,1]> Y) quot)
-- EXPECT: D Primitives.primIntRem = ((<4,X(X(XX)),[0,3,2,1]> Y) rem)
-- EXPECT: D Primitives.primIntSubR = (<3,XXX,[0,2,1]> Primitives.primIntSub)
-- EXPECT: D Primitives.primIntNeg = (Primitives.primIntSub #0)
-- EXPECT: D Primitives.primBranchEQ = (<3,X(XX),[2,1,0]> ==)
-- EXPECT: D Primitives.primBranchNE = (<3,X(XX),[2,1,0]> /=)
-- EXPECT: D Primitives.primBranchLT = (<3,X(XX),[2,1,0]> <)
-- EXPECT: D Primitives.primBranchLE = (<3,X(XX),[2,1,0]> <=)
-- EXPECT: D Primitives.primBranchGT = (<3,X(XX),[2,1,0]> >)
-- EXPECT: D Primitives.primBranchGE = (<3,X(XX),[2,1,0]> >=)
-- EXPECT: D Primitives.primIntEQ = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchEQ) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primIntNE = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchNE) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primIntLT = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchLT) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primIntLE = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchLE) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primIntGT = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchGT) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primIntGE = (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchGE) Data.Bool_Type.False) Data.Bool_Type.True)
-- EXPECT: D Primitives.primFloatWAdd = ((<4,X(X(XX)),[0,3,2,1]> Y) f+)
-- EXPECT: D Primitives.primFloatWSub = ((<4,X(X(XX)),[0,3,2,1]> Y) f-)
-- EXPECT: D Primitives.primFloatWMul = ((<4,X(X(XX)),[0,3,2,1]> Y) f*)
-- EXPECT: D Primitives.primFloatWDiv = ((<4,X(X(XX)),[0,3,2,1]> Y) f/)
-- EXPECT: D Primitives.primFloatWNeg = fneg
-- EXPECT: D Primitives.primFloatWEQ = (<3,X(XX),[2,1,0]> f==)
-- EXPECT: D Primitives.primFloatWNE = (<3,X(XX),[2,1,0]> f/=)
-- EXPECT: D Primitives.primFloatWLT = (<3,X(XX),[2,1,0]> f<)
-- EXPECT: D Primitives.primFloatWLE = (<3,X(XX),[2,1,0]> f<=)
-- EXPECT: D Primitives.primFloatWGT = (<3,X(XX),[2,1,0]> f>)
-- EXPECT: D Primitives.primFloatWGE = (<3,X(XX),[2,1,0]> f>=)
-- EXPECT: D Primitives.primFloatWShow = fshow
-- EXPECT: D Primitives.primFloatWRead = fread
-- EXPECT: D Primitives.primFloatWFromInt = itof
-- EXPECT: D Primitives.primWordAdd = ((<4,X(X(XX)),[0,3,2,1]> Y) +)
-- EXPECT: D Primitives.primWordSub = ((<4,X(X(XX)),[0,3,2,1]> Y) -)
-- EXPECT: D Primitives.primWordMul = ((<4,X(X(XX)),[0,3,2,1]> Y) *)
-- EXPECT: D Primitives.primWordQuot = ((<4,X(X(XX)),[0,3,2,1]> Y) uquot)
-- EXPECT: D Primitives.primWordRem = ((<4,X(X(XX)),[0,3,2,1]> Y) urem)
-- EXPECT: D Primitives.primWordAnd = ((<4,X(X(XX)),[0,3,2,1]> Y) and)
-- EXPECT: D Primitives.primWordOr = ((<4,X(X(XX)),[0,3,2,1]> Y) or)
-- EXPECT: D Primitives.primWordXor = ((<4,X(X(XX)),[0,3,2,1]> Y) xor)
-- EXPECT: D Primitives.primWordShl = ((<4,X(X(XX)),[0,3,2,1]> Y) shl)
-- EXPECT: D Primitives.primWordShr = ((<4,X(X(XX)),[0,3,2,1]> Y) shr)
-- EXPECT: D Primitives.primWordAshr = ((<4,X(X(XX)),[0,3,2,1]> Y) ashr)
-- EXPECT: D Primitives.primWordInv = ((((<5,XX(XXX),[0,4,1,2,3]> Primitives.primWordXor) Primitives.primWordSub) #0) #1)
-- EXPECT: D Primitives.primWordToFloatWRaw = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primWordFromFloatWRaw = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primIntAnd = ((<4,X(X(XX)),[0,3,2,1]> Y) and)
-- EXPECT: D Primitives.primIntOr = ((<4,X(X(XX)),[0,3,2,1]> Y) or)
-- EXPECT: D Primitives.primIntXor = ((<4,X(X(XX)),[0,3,2,1]> Y) xor)
-- EXPECT: D Primitives.primIntShl = ((<4,X(X(XX)),[0,3,2,1]> Y) shl)
-- EXPECT: D Primitives.primIntShr = ((<4,X(X(XX)),[0,3,2,1]> Y) ashr)
-- EXPECT: D Primitives.primIntInv = ((((<5,XX(XXX),[0,4,1,2,3]> Primitives.primIntXor) Primitives.primIntSub) #0) #1)
-- EXPECT: D Primitives.primWordEQ = (<3,X(XX),[2,1,0]> ==)
-- EXPECT: D Primitives.primWordNE = (<3,X(XX),[2,1,0]> /=)
-- EXPECT: D Primitives.primWordLT = (<3,X(XX),[2,1,0]> u<)
-- EXPECT: D Primitives.primWordLE = (<3,X(XX),[2,1,0]> u<=)
-- EXPECT: D Primitives.primWordGT = (<3,X(XX),[2,1,0]> u>)
-- EXPECT: D Primitives.primWordGE = (<3,X(XX),[2,1,0]> u>=)
-- EXPECT: D Primitives.primWordToInt = <1,X,[0]>
-- EXPECT: D Primitives.primIntToWord = <1,X,[0]>
-- EXPECT: D Primitives.primCharEQ = (<3,X(XX),[2,1,0]> ==)
-- EXPECT: D Primitives.primCharNE = (<3,X(XX),[2,1,0]> /=)
-- EXPECT: D Primitives.primCharLT = (<3,X(XX),[2,1,0]> u<)
-- EXPECT: D Primitives.primCharLE = (<3,X(XX),[2,1,0]> u<=)
-- EXPECT: D Primitives.primCharGT = (<3,X(XX),[2,1,0]> u>)
-- EXPECT: D Primitives.primCharGE = (<3,X(XX),[2,1,0]> u>=)
-- EXPECT: D Primitives.primFix = Y
-- EXPECT: D Primitives.primSeq = seq
-- EXPECT: D Primitives.primStringCompare = scmp
-- EXPECT: D Primitives.primBranchULT = (<3,X(XX),[2,1,0]> u<)
-- EXPECT: D Primitives.primBranchUEQ = (<3,X(XX),[2,1,0]> ==)
-- EXPECT: D Primitives.primIntCompare = (((<4,X(XX)XX,[0,1,3,2,3]> (<5,XXX(XX)X,[0,3,4,1,4,2]> Primitives.primBranchLT)) (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchEQ) Data.Ordering_Type.GT) Data.Ordering_Type.EQ)) Data.Ordering_Type.LT)
-- EXPECT: D Primitives.primCharCompare = ((<4,X(XX)(XX),[0,1,2,1,3]> Primitives.primIntCompare) Primitives.primOrd)
-- EXPECT: D Primitives.primWordCompare = (((<4,X(XX)XX,[0,1,3,2,3]> (<5,XXX(XX)X,[0,3,4,1,4,2]> Primitives.primBranchULT)) (((<5,XXXXX,[0,3,4,1,2]> Primitives.primBranchUEQ) Data.Ordering_Type.GT) Data.Ordering_Type.EQ)) Data.Ordering_Type.LT)
-- EXPECT: D Primitives.primStringEQ = sequal
-- EXPECT: D Primitives.primChr = <1,X,[0]>
-- EXPECT: D Primitives.primOrd = <1,X,[0]>
-- EXPECT: D Primitives.primUnsafeCoerce = <1,X,[0]>
-- EXPECT: D Primitives.primBind = ((<4,X(XXX),[0,1,2,3]> Primitives.primUnsafeCoerce) ((<5,XX(XXX),[0,2,1,3,4]> Primitives.primUnsafeCoerce) (<4,X(XX)X,[0,1,3,2]> Primitives.primUnsafeCoerce)))
-- EXPECT: D Primitives.primThen = ((<4,X(XXX),[0,1,2,3]> Primitives.primUnsafeCoerce) ((<5,XX(XXX),[0,2,1,3,4]> Primitives.primUnsafeCoerce) (<4,XXX,[0,1,2]> Primitives.primUnsafeCoerce)))
-- EXPECT: D Primitives.primReturn = ((<3,X(XX),[0,1,2]> Primitives.primUnsafeCoerce) <2,XX,[1,0]>)
-- EXPECT: D Primitives.primGetArgRef = ((Primitives.primArrAlloc #1) (Primitives.primUnsafeCoerce #0))
-- EXPECT: D Primitives.primPerformIO = ((<3,XXX,[0,2,1]> Primitives.primUnsafeCoerce) <1,X,[0]>)
-- EXPECT: D Primitives.primRnfErr = <2,X,[1]>
-- EXPECT: D Primitives.primRnfNoErr = <2,X,[1]>
-- EXPECT: D Primitives.primNewCAStringLen = newCAStringLen
-- EXPECT: D Primitives.primPeekCAString = peekCAString
-- EXPECT: D Primitives.primPeekCAStringLen = peekCAStringLen
-- EXPECT: D Primitives.primWordToPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primPtrToWord = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primIntToPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primPtrToInt = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primFunPtrToWord = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primIntToFunPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primFunPtrToPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primPtrToFunPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives._wordSize = (((Y ((<4,X(XXX)X,[0,1,2,3,3]> ((<5,XXX(XX)X,[0,3,1,2,4,4]> Primitives.primWordEQ) #0)) (((<6,X(XXX)(XX),[3,0,4,1,2,5]> Primitives.primWordShr) #1) ((<3,XXX,[0,2,1]> Primitives.primIntAdd) #1)))) (Primitives.primWordInv #0)) #0)
-- EXPECT: D Primitives.c_iswindows = ^iswindows
-- EXPECT: D Primitives._isWindows = ((Primitives.primIntEQ (Primitives.primPerformIO Primitives.c_iswindows)) #1)
-- EXPECT: D Primitives.prim_arr_alloc = A.alloc
-- EXPECT: D Primitives.prim_arr_copy = A.copy
-- EXPECT: D Primitives.prim_arr_size = A.size
-- EXPECT: D Primitives.prim_arr_read = A.read
-- EXPECT: D Primitives.prim_arr_write = A.write
-- EXPECT: D Primitives.prim_bs_wr = A.wrb
-- EXPECT: D Primitives.prim_bs_rd = A.rdb
-- EXPECT: D Primitives.primBSWriteByte = ((<5,X(XXXX),[0,1,2,3,4]> Primitives.primUnsafeCoerce) ((<6,XXXX(XX),[0,2,3,4,5,1]> Primitives.prim_bs_wr) <1,X,[0]>))
-- EXPECT: D Primitives.primBSReadByte = ((<4,X(XXX),[0,1,2,3]> Primitives.primUnsafeCoerce) Primitives.prim_bs_rd)
-- EXPECT: D Primitives.primBSeqA = bs==
-- EXPECT: D Primitives.primBScmpA = bscmp
-- EXPECT: D Primitives.primArrAlloc = ((<4,X(XXX),[0,1,2,3]> Primitives.primUnsafeCoerce) Primitives.prim_arr_alloc)
-- EXPECT: D Primitives.primArrCopy = ((<3,X(XX),[0,1,2]> Primitives.primUnsafeCoerce) Primitives.prim_arr_copy)
-- EXPECT: D Primitives.primArrSize = ((<3,X(XX),[0,1,2]> Primitives.primUnsafeCoerce) Primitives.prim_arr_size)
-- EXPECT: D Primitives.primArrRead = ((<4,X(XXX),[0,1,2,3]> Primitives.primUnsafeCoerce) Primitives.prim_arr_read)
-- EXPECT: D Primitives.primArrWrite = ((<5,X(XXXX),[0,1,2,3,4]> Primitives.primUnsafeCoerce) ((<6,XXXX(XX),[0,2,3,4,5,1]> Primitives.prim_arr_write) <1,X,[0]>))
-- EXPECT: D Primitives.primArrEQ = ((<4,X(XX)(XX),[0,1,2,1,3]> Primitives.primIntEQ) Primitives.primUnsafeCoerce)
-- EXPECT: D Primitives.primGC = (Primitives.primReturn <1,X,[0]>)
-- EXPECT: D Primitives.primForeignPtrToPtr = Primitives.primUnsafeCoerce
-- EXPECT: D Primitives.primNewForeignPtr = ((<3,X(XX),[0,1,2]> Primitives.primReturn) Primitives.primUnsafeCoerce)
-- EXPECT: D Primitives.primAddFinalizer = ((<4,XX,[0,1]> Primitives.primReturn) <1,X,[0]>)
-- EXPECT: D V1.main = (Primitives.primUnsafeCoerce (<2,XX,[1,0]> <1,X,[0]>))
-- EXPECT: end
-- CWD: ../..
module T81CtxAll(main) where
import Prelude
import MicroHs.Exp
import MicroHs.Compile
import MicroHs.CompileCache
import MicroHs.Flags
import MicroHs.Ident
main :: IO ()
main = do
  let flags = (defaultFlags ".") { paths = ["", "mhs", "src", "lib", "paths", "funboot"] }
  (rds, _, _) <- compileCacheTop flags (mkIdent "V1") emptyCache
  case rds of
    (_, ds) -> do
      mapM_ (\ (i, e) -> putStrLn ("D " ++ showIdent i ++ " = " ++ show e)) ds
      putStrLn "end"
