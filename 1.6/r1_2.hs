module Demo where


seqA n | n == 0     = 1
seqA n | n >= 1     = helper 2 1 0 n where
    helper a b c 1 = a
    helper a b c 2 = a + b - c * 2
    helper a b c n = helper test a b (n - 1) where
        test = a + b - c * 2
        

seqA n | otherwise  = error "args must be >=0"



