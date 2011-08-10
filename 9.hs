-- 9. Find the product(s) of the Pythagorean triple(s) with a sum of N.

import System.Environment

main = do
    args <- getArgs
    print $ pythagoreanProducts $ read $ head args

--

pythagoreanProducts n =
    [ a * b * (n - a - b) | a <- [1 .. (n `div` 3) - 1],
                            b <- [a + 1 .. (n - a - 1) `div` 2],
                            a^2 + b^2 == (n - a - b)^2 ]

-- maxA = max {a | a + (a + 1) + (a + 2) <= n}
--      = max {a | 3 (a + 1) <= n}
--      = floor (n / 3) - 1

-- maxB = max {b | a + b + (b + 1) <= n}
--      = max {b | a + 2b + 1 <= n}
--      = max {b | 2b <= (n - a - 1)}
--      = floor ((n - a - 1) / 2)
