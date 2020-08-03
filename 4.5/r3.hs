{-

Тип List, определенный ниже, эквивалентен определению списков из стандартной библиотеки в том смысле,
что существуют взаимно обратные функции, преобразующие List a в [a] и обратно. Реализуйте эти функции.

-}

data List a = Nil | Cons a (List a) deriving (Show, Eq)

fromList :: List a -> [a]

fromList Nil = []
fromList (Cons a xs) = a : fromList xs


toList :: [a] -> List a
toList = foldr (\x l -> Cons x l) Nil
-- toList = foldr Cons Nil