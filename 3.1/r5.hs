
module Demo where

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 as bs cs = helper as bs cs where
    
    helper [] [] [] = []
    helper [] bs cs = helper [0] bs cs
    helper as [] cs = helper as [0] cs
    helper as bs [] = helper as bs [0]
    helper (a:as) (b:bs) (c:cs) = a + b + c : helper as bs cs
