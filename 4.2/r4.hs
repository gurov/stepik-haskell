data Shape = Circle Double | Rectangle Double Double

square :: Double -> Shape
square a = Rectangle a a

isSquare :: Shape -> Bool
isSquare (Rectangle a b)    | a == b    = True
                            -- | otherwise = False   
isSquare _ = False


-- isSquare :: Shape -> Bool
-- isSquare a | a == (Rectangle a b)