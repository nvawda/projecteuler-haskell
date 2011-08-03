-- 4. Find the largest palindrome made from the product of two N-digit numbers.

import System.Environment

main = do
    args <- getArgs
    print $ largestPalindromicProduct $ read $ head args

-- Naïve approach - generate all products, filter palindromes, and select max.

largestPalindromicProduct n =
    maximum $ filter palindrome [ x * y | x <- [1..top], y <- [1..x] ]
        where top = (10 ^ n) - 1

palindrome n = s == reverse s
    where s = show n
