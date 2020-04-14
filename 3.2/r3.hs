

module Demo where

qsort :: Ord a => [a] -> [a]

qsort [] = []
qsort (x:xs) = left ++ (x : right) where
     left  = qsort (filter (<= x) xs)
     right = qsort (filter (> x) xs)


-- qsort [] = []
-- qsort (x:xs) = qs (<= x) ++ (x : qs (> x)) where
--      qs p = qsort (filter p xs)

-- qsort (x:xs) = qsort (fi (< x)) ++ [x] ++ qsort (fi (> x)) where
--     fi p = filter p xs

