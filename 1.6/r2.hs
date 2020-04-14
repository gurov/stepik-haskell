
module Demo where

import Data.Char

rrr :: Integer -> (Integer, Integer)
rrr x = (toInteger strSum, toInteger strLength)
    where
        strAr = show $ abs x
        strSum = sum $ map digitToInt strAr
        strLength = length strAr





-- let strAr = show (abs n) in
--     (strSum, strLength) = 

-- -- ss :: Integer -> Integer
-- ss n = length (show (abs n))
-- ss2 n = sum (map digitToInt (show (abs n)))
-- -- ss2 n =  show (abs n)
