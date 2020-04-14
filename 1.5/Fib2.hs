module Demo where


fibonacci n | n == 0     = 0
fibonacci n | n >= 1     = helperP 1 0 n
fibonacci n | n <= 1     = helperN 1 0 n
fibonacci n | otherwise  = error "args must be >=0"



helperP acc1 acc2 1 = acc1
helperP acc1 acc2 n = helperP (acc2 + acc1) acc1 (n - 1)

helperN acc1 acc2 (-1) = acc1
helperN acc1 acc2 n = helperN (acc2 - acc1) acc1 (n + 1)
