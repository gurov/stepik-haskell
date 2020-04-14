

module Demo where

-- perms :: [a] -> [[a]]
-- perms [] = [[]]
-- perms (x:xs) = helper x xs where
--     helper a bs = [[a] ++ (concatMap (helper a) bs), bs ++ [a]] 

-- 1 [[]]           -> [[1]]
-- 2 [1]            -> [[2,1],[1,2]]
-- z [a,b]          -> [  [z,a,b],[a,z,b],[a,b,z]  ]
-- 3 [[1,2],[2,1]]  -> [3,1,2] [1,3,2] [1,2,3] [3,2,1] [2,3,1] [2,1,3]




-- perms xs = helper2 [[]] xs where
--     helper2 acc [] = acc
--     helper2 acc (a:ys) = helper2 (perebor a acc) ys where
--         perebor t acc = concatMap (\ss -> insBetween t ss) acc where

--             insBetween a bs = helper [] [] bs ++ [bs ++ [a]] where
--                 helper acc p1 [] = acc
--                 helper acc p1 (h:t2) = helper ((p1 ++ [a,h] ++ t2):acc) (p1 ++ [h]) t2 


        
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concatMap  (interleave x)  (perms xs) where


    interleave x [] = [[x]]
    interleave x (y:ys) =(x:y:ys) : (map (y:) (interleave x ys)) 


-- interleave::a->[a]->[[a]]





-- perms (x:xs) = insBetween x xs


-- perms (x:xs) = concatMap (helper a) xs where
--     helper a bs = [[a] ++ bs, bs ++ [a]] 