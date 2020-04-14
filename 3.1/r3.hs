
module Demo where


oddsOnly :: Integral a => [a] -> [a]

oddsOnly [] = []

oddsOnly (x: xs) | odd x = x : oddsOnly xs
oddsOnly (x: xs) | even x = oddsOnly xs





