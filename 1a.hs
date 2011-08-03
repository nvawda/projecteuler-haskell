-- 1. Find the sum of all multiples of 3 or 5 below N (1000).

import System.Environment

main = do
    args <- getArgs
    print $ sumMultiples $ read $ head args

-- Naïve approach - sum the multiples directly. Requires O(n) operations.

isMultipleOf x y = rem x y == 0

sumMultiples n = sum $ filter isMultiple [1..n-1]
    where isMultiple x = (x `isMultipleOf` 3) || (x `isMultipleOf` 5)
