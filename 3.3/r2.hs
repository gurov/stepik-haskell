
coins = [2, 3, 7]

-- change :: (Ord a, Num a) => a -> [[a]]
change n = helper n where
    helper n = [x:y | x <- coins, y <- (helper 3), x < n]