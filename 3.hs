-- 3. Find the largest prime factor of N (600851475143).

import System.Environment

main = do
    args <- getArgs
    print $ largestPrimeFactor $ read $ head args

-- Naïve approach - find all prime factors, and take the largest.

largestPrimeFactor n = f n 2
    where f x d
            | x == d          = d
            | x `rem` d == 0  = f (x `div` d) d
            | otherwise       = f x (d + 1)
