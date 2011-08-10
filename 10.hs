-- 10. Find the sum of all primes below N.

import System.Environment

main = do
    args <- getArgs
    print $ sumPrimesBelow $ read $ head args

--

sumPrimesBelow n = sum $ takeWhile (< n) primes

primes = 2 : restPrimes 3
    where restPrimes n =
            if any isDivisor $ takeWhile (\p -> p ^ 2 <= n) primes
            then rest
            else n : rest
            where isDivisor p = n `rem` p == 0
                  rest = restPrimes (n + 1)
