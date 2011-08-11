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

-- The same algorithm as version b, but implemented without pattern-matching.

findMax5Product xs = iter 0 xs
    where iter p xs = if null rest
                      then nextP
                      else iter nextP rest
            where prod = product $ take 5 xs
                  rest = tail xs
                  nextP = max p prod
