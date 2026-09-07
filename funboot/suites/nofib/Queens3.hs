-- Queens3.hs - mirrors benches/queens.ml of min-caml-hs: one queen per row, a
-- column legal when no earlier queen shares it or either diagonal, N = 10 with
-- 724 solutions.  Integer only.
module Queens3(main) where
import Prelude
import Data.IOArray

n :: Int
n = 10

main :: IO ()
main = do
  col <- newIOArray n (0::Int)
  let safe r c i =
        if i >= r then return (1::Int)
        else do ci <- readIOArray col i
                let d  = ci - c
                    dd = if d < 0 then negate d else d
                if ci == c then return 0
                  else if dd == r - i then return 0
                  else safe r c (i+1)
      place r =
        if r >= n then return (1::Int)
        else let tryc c acc =
                   if c >= n then return acc
                   else do s <- safe r c 0
                           if s == 1
                             then do writeIOArray col r c
                                     p <- place (r+1)
                                     tryc (c+1) (acc+p)
                             else tryc (c+1) acc
             in tryc 0 0
  p <- place 0
  putStrLn (show p)
