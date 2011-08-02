-- 1. Find the sum of all multiples of 3 or 5 below 1000.

-- Optimized approach using O(1) operations.

sumMultiples n = sumMultiplesOf 3 + sumMultiplesOf 5 - sumMultiplesOf 15
    where sumMultiplesOf p = p * (sumUpTo $ countMultiplesOf p)
          countMultiplesOf p = div (n - 1) p
          sumUpTo x = x * (x + 1) `div` 2

main = putStrLn $ show $ sumMultiples 1000
