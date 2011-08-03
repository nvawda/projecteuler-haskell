-- 2. Find the sum of the even-valued Fibonacci terms up to four million.

fibonacci = f 1 2
    where f a b = a : f b (a + b)

main = putStrLn $ show s
    where s = sum $ filter even $ takeWhile (<= 4000000) fibonacci
