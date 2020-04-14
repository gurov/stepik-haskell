
module Demo where

addTwoElements :: a -> a -> [a] -> [a]
addTwoElements a b = (a :) . (b :) 
