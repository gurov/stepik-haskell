
module Demo where



-- integration :: (Double -> Double) -> Double -> Double -> Double
-- integration f a b = helper 0 b 1000
--     where
--         h = (b - a)/1000
--         sss s1 s2 = h * (s1 + s2) / 2
--         helper acc b' n | n == 0 = 0
--         helper acc b' n | n > 0 = helper (sss (f b') (f (b' - h))) (b' - h) (n - 1)
        

integration :: (Double -> Double) -> Double -> Double -> Double

integration f a b = h * ((f a + f b)/2 + center) where
        n = 200
        h = (b - a)/n
        center = sum $ [f (a + h*x) | x <- [1,2 ..n-1] ]


