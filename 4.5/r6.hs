{-

    Теперь нам нужно написать функцию avg, которая считает среднее арифметическое всех значений в дереве.
    И мы хотим, чтобы эта функция осуществляла только один проход по дереву.
    Это можно сделать при помощи вспомогательной функции,
    возвращающей количество листьев и сумму значений в них. Реализуйте эту функцию.

-}

(|>) n f = f $ n

data Tree a = Leaf a | Node (Tree a) (Tree a)

leafCount :: Tree a -> Int
leafCount (Leaf _) = 1
leafCount (Node a b) = leafCount a + leafCount b

leafCountValues :: Tree Int -> Int
leafCountValues (Leaf a) = a
leafCountValues (Node a b) = leafCountValues a + leafCountValues b

avg :: Tree Int -> Int
avg t =
    let (c,s) = go t
    in s `div` c
  where
    go :: Tree Int -> (Int,Int)
    go t = (leafCount t, leafCountValues t)


-- avg :: Tree Int -> Int
-- avg t =
--     let (c,s) = go t
--     in s `div` c
--   where
--     sumt (a1,b1) (a2,b2) = (a1+a2, b1+b2)
--     go :: Tree Int -> (Int,Int)
--     go (Node a b) = sumt (go a) (go b)
--     go (Leaf n)   = (1, n)