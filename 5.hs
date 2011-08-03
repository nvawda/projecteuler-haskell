-- 5. Find the smallest positive integer evenly divisible by [1..N].

import System.Environment

main = do
    args <- getArgs
    print $ lcmUpTo $ read $ head args

--

lcmUpTo n = foldl1 lcm [1..n]
