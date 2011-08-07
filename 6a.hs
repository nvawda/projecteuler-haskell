-- 6. Calculate |∑(i²) - (∑i)²| for i=1..N.

import System.Environment

main = do
    args <- getArgs
    print $ differenceSquares $ read $ head args

-- Naïve approach - compute sums directly.

differenceSquares n = sum' ^ 2 - sumSquares
    where sum' = sum [i | i <- [1..n]]
          sumSquares = sum [i ^ 2 | i <- [1..n]]
