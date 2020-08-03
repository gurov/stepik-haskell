
{-

Реализуйте функцию, которая ищет в строке первое вхождение символа, который является цифрой, и возвращает Nothing, если в строке нет цифр.

-}

import Data.Char(isDigit)

findDigit :: [Char] -> Maybe Char
findDigit (x:xs) = helper x xs where
    helper a []     | isDigit a     = Just a
                    | otherwise     = Nothing
    helper a (b:bs) | isDigit a     = Just a
                    | otherwise     = helper b bs
