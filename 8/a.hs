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

-- Naïve solution: calculate all 5-adjacent-digit products and take the largest.

-- This was the solution that seemed obvious to me - generate all 5-lists of
-- adjacent digits, compute the product of each, and then find the maximum.

findMax5Product xs = maximum $ map product $ window 5 xs

window n xs = takeWhile (\s -> length s == n) $ map (take n) (tails xs)
