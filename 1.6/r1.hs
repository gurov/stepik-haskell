module Demo where


seqA n | n == 0     = 1
seqA n | n >= 1     = helper 2 1 0 n
seqA n | otherwise  = error "args must be >=0"


helper acc1 acc2 acc3 1 = acc1
helper acc1 acc2 acc3 2 = acc1 + acc2 - acc3 * 2
helper acc1 acc2 acc3 n = helper (acc1 + acc2 - acc3 * 2) acc1 acc2 (n - 1)



-- seqA n = let
--   helper n a b c =
--     if n == 0 then a else helper (n - 1) b c (c + b - 2 * a)
--   in
--     helper n 1 2 3

