-- QRDecomp.hs - mirrors benches/qr_decomposition.ml of min-caml-hs: Householder
-- QR of the same 30x30 matrix, filled from the same 5x5 block, reporting the
-- sum of Q*R, which equals the sum of A (828) when the decomposition is right.
-- Float, so see the note on the numeric models.
module QRDecomp(main) where
import Prelude
import Data.IOArray

n :: Int
n = 30

main :: IO ()
main = do
  base <- newIOArray 25 (0.0::Double)
  a <- newIOArray (n*n) (0.0::Double)
  w <- newIOArray (n*n) (0.0::Double)
  q <- newIOArray (n*n) (0.0::Double)
  r <- newIOArray (n*n) (0.0::Double)
  h <- newIOArray ((n+1)*n) (0.0::Double)
  let ix i j = i*n + j
      hx i j = i*n + j
      md5 i = if i < 5 then i else md5 (i-5)
      setb i j v = writeIOArray base (i*5+j) v
  setb 0 0 3.0; setb 0 1 5.0; setb 0 2 0.0; setb 0 3 0.0; setb 0 4 1.0
  setb 1 0 0.0; setb 1 1 2.0; setb 1 2 3.0; setb 1 3 0.0; setb 1 4 9.0
  setb 2 0 (0.0-1.0); setb 2 1 1.0; setb 2 2 4.0; setb 2 3 2.0; setb 2 4 3.0
  setb 3 0 6.0; setb 3 1 0.0; setb 3 2 (0.0-9.0); setb 3 3 1.0; setb 3 4 0.0
  setb 4 0 (0.0-8.0); setb 4 1 3.0; setb 4 2 1.0; setb 4 3 (0.0-5.0); setb 4 4 2.0
  let fill i j = if i >= n then return ()
                 else if j >= n then fill (i+1) 0
                 else do v <- readIOArray base (md5 i * 5 + md5 j)
                         writeIOArray a (ix i j) v
                         fill i (j+1)
      trans i j = if i >= n then return ()
                  else if j >= n then trans (i+1) 0
                  else do v <- readIOArray a (ix j i)
                          writeIOArray w (ix i j) v
                          trans i (j+1)
      dotoff arr ox brr oy len acc =
        if len <= 0 then return acc
        else do p <- readIOArray arr ox; s <- readIOArray brr oy
                dotoff arr (ox+1) brr (oy+1) (len-1) (acc + p*s)
      hstep k =
        if k >= n then return () else do
          let t = n - k
          nx <- dotoff w (ix k k) w (ix k k) t 0.0
          wkk <- readIOArray w (ix k k)
          let s = sqrt nx
              y0 = if wkk > 0.0 then negate s else s
          let mkz i = if i >= t then return () else do
                v <- if i == 0 then return (wkk - y0) else readIOArray w (ix k (k+i))
                writeIOArray h (hx 0 i) v
                mkz (i+1)
          mkz 0
          zz <- dotoff h (hx 0 0) h (hx 0 0) t 0.0
          let c = if zz == 0.0 then 0.0 else 2.0 / zz
              mkh i j = if i >= t then return ()
                        else if j >= t then mkh (i+1) 0
                        else do zi <- readIOArray h (hx 0 i); zj <- readIOArray h (hx 0 j)
                                writeIOArray h (hx (1+i) j)
                                  ((if i == j then 1.0 else 0.0) - c*zi*zj)
                                mkh i (j+1)
          mkh 0 0
          let qrow i = if i >= n then return () else do
                if k == 0
                  then let q0 j = if j >= t then return () else do
                             v <- readIOArray h (hx (1+i) j)
                             writeIOArray q (ix i j) v
                             q0 (j+1)
                       in q0 0
                  else do let qcol j = if j >= t then return () else do
                                v <- dotoff q (ix i k) h (hx (1+j) 0) t 0.0
                                writeIOArray r (ix 0 j) v
                                qcol (j+1)
                              qput j = if j >= t then return () else do
                                v <- readIOArray r (ix 0 j)
                                writeIOArray q (ix i (j+k)) v
                                qput (j+1)
                          qcol 0; qput 0
                qrow (i+1)
          qrow 0
          writeIOArray w (ix k k) y0
          let wrow i = if i >= n then return () else do
                let wcol j = if j >= t then return () else do
                      v <- dotoff w (ix i k) h (hx (1+j) 0) t 0.0
                      writeIOArray r (ix 1 j) v
                      wcol (j+1)
                    wput j = if j >= t then return () else do
                      v <- readIOArray r (ix 1 j)
                      writeIOArray w (ix i (j+k)) v
                      wput (j+1)
                wcol 0; wput 0
                wrow (i+1)
          wrow (k+1)
          hstep (k+1)
      mkr i j = if i >= n then return ()
                else if j >= n then mkr (i+1) 0
                else do v <- if i <= j then readIOArray w (ix j i) else return 0.0
                        writeIOArray r (ix i j) v
                        mkr i (j+1)
      sumqr i j acc =
        if i >= n then return acc
        else if j >= n then sumqr (i+1) 0 acc
        else do let dotqr t ac = if t >= n then return ac
                                 else do p <- readIOArray q (ix i t)
                                         s <- readIOArray r (ix t j)
                                         dotqr (t+1) (ac + p*s)
                d <- dotqr 0 0.0
                sumqr i (j+1) (acc + d)
  fill 0 0
  trans 0 0
  hstep 0
  mkr 0 0
  s <- sumqr 0 0 0.0
  putStrLn (show (truncate (s + 0.5) :: Int))
