
import Data.List


coins = [2,3,7]




change :: (Ord a, Num a) => a -> [[a]]
change n = helper [[]] n where
    helper acc n | n <= 0    = acc 
    helper acc n | n > 0   = [x:y |x <- coins, y <- (helper acc (n - x)), sum (x:y) == n]


-- test n = helper [] n where
--     helper acc 0 = acc
--     helper 


-- bad solution
-- coins = [2, 3, 7]
-- test2 n xs = concatMap (\t -> replicate (n `div` t) t) xs
-- -- change :: (Ord a, Num a) => a -> [[a]]
-- change n = [x | x <- subsequences (test2 n coins), sum x == n]
    

