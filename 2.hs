-- 2. Find the sum of the even-valued Fibonacci terms up to N (four million).

import System.Environment

main = do
    args <- getArgs
    print $ sumEvenFibsUpTo $ read $ head args

--

sumEvenFibsUpTo n = sum $ filter even $ takeWhile (<= n) fibonacci

fibonacci = f 1 2
    where f a b = a : f b (a + b)
