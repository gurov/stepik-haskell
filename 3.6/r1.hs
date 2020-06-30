
module Demo where

import Data.List

revRange :: (Char,Char) -> [Char]


revRange (a,b) = unfoldr g b where
    g x | x >= a = Just (x, pred x)
        | x < a = Nothing
        