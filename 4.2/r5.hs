data Bit = Zero | One deriving (Eq, Show)
data Sign = Minus | Plus deriving (Eq, Show)
data Z = Z Sign [Bit] deriving (Eq, Show)


add :: Z -> Z -> Z
add z1 z2 = toEnum (fromEnum z1 + fromEnum z2) :: Z

mul :: Z -> Z -> Z
mul z1 z2 = toEnum (fromEnum z1 * fromEnum z2) :: Z


instance Enum Z where
    toEnum x = Z (if x >= 0 then Plus else Minus) (reverse (helper x [])) where
        helper x acc | abs(x) <=0 = acc
                     | abs(x) > 0 = helper (abs(x) `div` 2) ((if abs(x `mod` 2) == 1 then One else Zero) : acc)
    fromEnum (Z s bits) = (if s == Plus then 1 else (-1)) * helper (reverse bits) 0 where
        helper [] m = m
        helper (b:xs) m = helper xs (m + (if b == One then 1 else 0) * 2 ^ (length xs))

