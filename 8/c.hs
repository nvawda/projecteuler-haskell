import Data.Char
import List
import System.Environment

import Input

main = do
    args <- getArgs
    print $ findMax5Product $ digits $ selectInput args
        where selectInput args = if not (null args) && head args == "--small"
                                 then input_small
                                 else input_large

digits str = map (\c -> ord c - ord '0') str

-- This is like version b, with the addition of one optimization (skipping five
-- digits ahead when a zero is encountered). However, this change does not seem
-- to make a significant difference to performance.

findMax5Product xs = iter 0 xs
    where iter p (a:b:c:d:e:xs) = iter (max p (a * b * c * d * e)) rest
            where rest = if e == 0
                         then xs
                         else b:c:d:e:xs
          iter p xs = p
