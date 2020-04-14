
module Demo where

groupElems :: Eq a => [a] -> [[a]]

groupElems l  = helper l where
    helper [] = []
    helper r = (fst (spann r)) : helper (snd (spann r)) where
         spann t = span (== (head t)) t



-- groupElems l  = helper l where
--     helper [] = []
--     helper r = (fst (spann r)) : helper (snd (spann r)) where
--          spann t = span (== head t) t



-- groupElems :: Eq a => [a] -> [[a]]
-- groupElems [] = []
-- groupElems xs = ys : groupElems zs where
--     (ys, zs) = span (== head xs) xs