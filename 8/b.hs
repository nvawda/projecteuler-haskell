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

-- The basic algorithm here is the same as in version a, but this version uses
-- a hand-rolled iteration instead of higher-level list manipulation functions.

findMax5Product xs = iter 0 xs
    where iter p (a:b:c:d:e:xs) = iter (max p (a * b * c * d * e)) (b:c:d:e:xs)
          iter p xs = p
