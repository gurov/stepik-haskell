
module Demo where


lengthList :: [a] -> Int
lengthList = foldr (\_ s -> 1 + s) 0


sumOdd :: [Integer] -> Integer
sumOdd = foldr (\x s -> if odd x then (x + s) else s) 0

-- good solution
-- sumOdd = foldr (+) 0 . filter odd




