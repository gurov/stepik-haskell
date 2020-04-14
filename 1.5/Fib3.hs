module Demo where

fibonacci n | n == 0     = 0
fibonacci n | n >= 1     = helperP 1 0 n
fibonacci n | n <= 1     = (-1)^((-n) + 1) * helperP 1 0 (-n) 

helperP acc1 acc2 1 = acc1
helperP acc1 acc2 n = helperP (acc2 + acc1) acc1 (n - 1)
