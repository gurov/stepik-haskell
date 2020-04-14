

module Demo where


filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2 = filter p where
    p x = p1 x || p2 x 

-- f1 x = True

-- f2 x = True


-- const t1 = (a) => a > 0;
-- const t2 = (a) => a == -3;
-- const t3 = (a) => t1(a) || t2(a);