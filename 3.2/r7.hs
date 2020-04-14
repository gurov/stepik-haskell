

module Demo where
import Data.Char



max3 :: Ord a => [a] -> [a] -> [a] -> [a]
max3 = zipWith3 m3 where
    m3 x y = max (max x y)
