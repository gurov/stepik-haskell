
{-

Реализуйте функцию findDigitOrX, использующую функцию findDigit (последнюю реализовывать не нужно).
findDigitOrX должна находить цифру в строке, а если в строке цифр нет, то она должна возвращать символ 'X'. Используйте конструкцию case.

-}

import Data.Char(isDigit)


findDigit :: [Char] -> Maybe Char
findDigit (x:xs) = helper x xs where
    helper a []     | isDigit a     = Just a
                    | otherwise     = Nothing
    helper a (b:bs) | isDigit a     = Just a
                    | otherwise     = helper b bs


findDigitOrX :: [Char] -> Char
findDigitOrX s = case findDigit s of 
    Nothing -> 'X'
    Just a  -> a