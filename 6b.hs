-- 6. Calculate |∑(i²) - (∑i)²| for i=1..N.

import System.Environment

main = do
    args <- getArgs
    print $ differenceSquares $ read $ head args

-- Optimized approach - simplify each summation down to an expression
-- that can be computed in a constant number of arithmetic operations.
--  ∑ i = n (n + 1) / 2
--  ∑ i² = n (n + 1) (2n + 1) / 6

differenceSquares n = sum' ^ 2 - sumSquares
    where sum' = n * (n + 1) `div` 2
          sumSquares = n * (n + 1) * (2 * n + 1) `div` 6
