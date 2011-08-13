-- Benchmark a bunch of different solutions using Criterion.

import Criterion.Main
import Data.Char
import List

import Input

main = defaultMain [
         bgroup "euler8" [
           bench "a1" $ whnf (max5Product_a1 . digits) input_large,
           bench "a2" $ whnf (max5Product_a2 . digits) input_large,
           bench "a3" $ whnf (max5Product_a3 . digits) input_large,
           bench "b1" $ whnf (max5Product_b1 . digits) input_large,
           bench "b2" $ whnf (max5Product_b2 . digits) input_large,
           bench "c"  $ whnf (max5Product_c  . digits) input_large,
           bench "d"  $ whnf (max5Product_d  . digits) input_large,
           bench "e"  $ whnf (max5Product_e  . digits) input_large
         ]
       ]

digits str = map (\c -> ord c - ord '0') str


-- a. "Obvious" solution:

max5Product_a1 xs = maximum $ map product $ window 5 xs
    where window n ys = takeWhile (\s -> length s == n) $ map (take n) (tails ys)

max5Product_a2 xs = maximum $ map product $ window 5 xs
    where window n ys = map (take n) (tails padded)
            where padded = ys ++ (take (n - 1) $ repeat 0)

max5Product_a3 xs = maximum $ map product $ window 5 xs
    where window n ys = take count $ map (take n) (tails ys)
            where count = length ys - (n - 1)


-- b. Hand-rolled iteration:

max5Product_b1 xs = iter 0 xs
    where iter p (a:b:c:d:e:ys) = iter (max p (a * b * c * d * e)) (b:c:d:e:ys)
          iter p ys = p

max5Product_b2 xs = iter 0 xs
    where iter p (a:ys@(b:c:d:e:_)) = iter (max p (a * b * c * d * e)) ys
          iter p _ = p


-- c. Hand-rolled iteration, skipping ahead at zeroes.

max5Product_c xs = iter 0 xs
    where iter p (a:b:c:d:e:ys) = iter (max p (a * b * c * d * e)) rest
            where rest = if e == 0
                         then ys
                         else b:c:d:e:ys
          iter p ys = p


-- d. Hand-rolled iteration without pattern-matching.

max5Product_d xs = iter 0 xs
    where iter p ys = if null rest
                      then nextP
                      else iter nextP rest
            where prod = product $ take 5 ys
                  rest = tail ys
                  nextP = max p prod


-- e. Alternative whole-list solution, due to Clemens Fruhwirth.

max5Product_e = maximum . (map product) . groups
    where groups xs = zipWith5 (\a b c d e -> [a,b,c,d,e])
                               xs (drop 1 xs) (drop 2 xs) (drop 3 xs) (drop 4 xs)
