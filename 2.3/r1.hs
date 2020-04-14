
module Demo where


-- class Eq a where
--     (==), (/=) :: a -> a -> Bool
--     x /= y = not (x == y)

-- instance Eq Bool where
--     True  == True       = True
--     False == False      = True
--     _     == _          = False

class Printable a where
    toString :: a -> [Char]

instance Printable Bool where
    toString True   = "true"
    toString False  = "false"

instance Printable () where
    toString ()     = "unit type"
-- GHCi> toString (False,())
-- "(false,unit type)"
-- GHCi> toString (True,False)
-- "(true,false)"

instance (Printable a, Printable b) => Printable (a, b) where
    toString p = "(" ++ toString(fst p) ++ "," ++ toString(snd p) ++ ")"