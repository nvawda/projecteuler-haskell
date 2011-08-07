-- 7. Find the Nth prime number.

import System.Environment

main = do
    args <- getArgs
    print $ primes !! ((read $ head args) - 1)

--

primes = 2 : restPrimes 3
    where restPrimes n =
            if any isDivisor $ takeWhile (\p -> p ^ 2 <= n) primes
            then rest
            else n : rest
            where isDivisor p = n `rem` p == 0
                  rest = restPrimes (n + 1)
