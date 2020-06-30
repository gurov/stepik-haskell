import Data.List (foldl')

data Bit = Zero | One deriving (Eq, Show)
data Sign = Minus | Plus deriving (Eq, Show)
data Z = Z Sign [Bit] deriving (Eq, Show)


bitToIn :: Bit -> Int
bitToIn One  = 1
bitToIn Zero = 0

toDec :: [Bit] -> Int
toDec = foldl' (\acc x -> acc * 2 + bitToIn x) 0

add :: Z -> Z -> Z
add z1 z2 = toEnum (fromEnum z1 + fromEnum z2) :: Z

mul :: Z -> Z -> Z
mul z1 z2 = toEnum (fromEnum z1 * fromEnum z2) :: Z

binarz :: Int -> [Int]
binarz 0 = []
binarz n = [(mod n 2)] ++ binarz (div n 2) 

toBin :: [Int] -> [Bit]
toBin = map (\t -> if t == 1 then One else Zero)

instance Enum Z where
    toEnum x | x >= 0 = Z Plus (toBin . binarz $ x)
             | x <  0 = Z Minus (toBin . binarz . abs $ x)
    fromEnum (Z s bits) | s == Plus  = toDec . reverse $ bits
                        | s == Minus = (-1) * (toDec . reverse $ bits)


