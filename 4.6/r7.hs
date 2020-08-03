{-

Реализуйте представителя класса типов Monoid для типа Xor,
в котором mappend выполняет операцию xor.

-}


newtype Xor = Xor { getXor :: Bool }
    deriving (Eq,Show)

instance Monoid Xor where
    mempty = Xor False
    mappend (Xor False) (Xor False) = Xor False
    mappend (Xor True) (Xor False) = Xor True
    mappend (Xor False) (Xor True) = Xor True
    mappend (Xor True) (Xor True) = Xor False