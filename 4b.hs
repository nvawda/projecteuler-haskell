-- 4. Find the largest palindrome made from the product of two N-digit numbers.

import System.Environment

main = do
    args <- getArgs
    print $ largestPalindromicProduct $ read $ head args

-- "Inside-out" approach - generate all palindromes, then filter pair products.

largestPalindromicProduct n = maximum $ filter isProduct palindromes
    where bot = 10 ^ (n - 1)
          top = 10 * bot - 1
          palindromes = map makePal [bot..top]
            where makePal x = read (s ++ reverse s)
                    where s = show x
          isProduct x = or [ x `rem` y == 0 | y <- [pairBot..pairTop] ]
            where pairBot = max bot (x `div` top)
                  pairTop = min top (x `div` bot)
