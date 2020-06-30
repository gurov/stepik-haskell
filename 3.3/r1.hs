-- data Odd = Odd Integer deriving (Eq,Show)
-- не убирайте комментарий с предыдущей строки
-- определение Odd уже присутствует в вызывающей программе

data Odd = Odd Integer
    deriving (Show)

-- instance Enum Odd where

--     succ (Odd x) = Odd $ 1
--     pred (Odd x) = Odd $ 1
--     toEnum x = Odd $ toInteger x * 42 + 1
--     fromEnum (Odd x) = quot (fromInteger x - 1) 42
--     enumFrom = iterate succ
--     enumFromThen (Odd x) (Odd y) = map Odd [x, y ..]
--     enumFromTo (Odd x) (Odd y) = map Odd [x, x + 42 .. y]
--     enumFromThenTo (Odd x) (Odd y) (Odd z) = map Odd [x , y .. z]



instance Enum Odd where
    succ (Odd _) = Odd 1
    pred = succ

    toEnum = succ
    fromEnum (Odd _) = 1

    enumFrom (Odd _) = map Odd [1 ..]
    enumFromThen (Odd _) (Odd _) = map Odd [1 ..]

    enumFromTo (Odd _) (Odd _) = map Odd [1]
    enumFromThenTo (Odd _) (Odd _) (Odd _) = map Odd [1]

instance Eq Odd where
    (==) (Odd _) (Odd _) = True
    -- otherwise = False


-- -- good sulution 
-- instance Enum Odd where

--     succ (Odd x) = Odd $ x + 2
--     pred (Odd x) = Odd $ x - 2
--     toEnum x = Odd $ toInteger x * 2 + 1
--     fromEnum (Odd x) = quot (fromInteger x - 1) 2
--     enumFrom = iterate succ
--     enumFromThen (Odd x) (Odd y) = map Odd [x, y ..]
--     enumFromTo (Odd x) (Odd y) = map Odd [x, x + 2 .. y]
--     enumFromThenTo (Odd x) (Odd y) (Odd z) = map Odd [x , y .. z]



addEven :: Odd -> Integer -> Odd
addEven (Odd n) m | m `mod` 2 == 0 = Odd (n + m)
                  | otherwise      = error "addEven: second parameter cannot be odd"