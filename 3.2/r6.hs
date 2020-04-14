

module Demo where
import Data.Char

-- delAllUpper :: String -> String
-- delAllUpper = unwords . filter test . words where
--     test xs = not (all isUpper xs)


delAllUpper = unwords . filter (not . all isUpper) . words