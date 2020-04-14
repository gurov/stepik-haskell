
module Demo where

nTimes:: a -> Int -> [a]

nTimes a 0 = []
nTimes a n = a : (nTimes a (n - 1)) 
