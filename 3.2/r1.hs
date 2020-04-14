

module Demo where

import Data.Char


readDigits :: String -> (String, String)
readDigits s = (takeWhile isDigit s, dropWhile isDigit s)