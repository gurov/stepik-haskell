

module Demo where


squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes = concatMap test where
    test x = x * x : x * x * x : [] 


