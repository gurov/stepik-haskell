
import Data.List

evenOnly :: [a] -> [a]
-- evenOnly list = snd $ foldl' ff (initFlag,[]) list where
--     initFlag                        = True
--     ff (flag,xs) i | flag == True   = (False, xs)
--                    | flag == False  = (True, i:xs)   

evenOnly = foldr (\(i,x) xs -> if even i then x:xs else xs) [] . zip [1..]


-- evenOnly :: [a] -> [a]
-- evenOnly = snd . foldr (\a (xs, ys) -> (a : ys, xs)) ([], [])                