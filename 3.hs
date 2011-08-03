-- 3. Find the largest prime factor of 600851475143.

-- Naïve approach - find all prime factors, and take the largest.

largestPrimeFactor n = f n 2
    where f x d
            | x == d          = d
            | x `rem` d == 0  = f (x `div` d) d
            | otherwise       = f x (d + 1)

main = putStrLn $ show $ largestPrimeFactor 600851475143
