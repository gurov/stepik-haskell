
module Demo where

isPalindrome :: Eq a => [a] -> Bool
isPalindrome l = pall l True where
    pall [] b           = b
    pall [a] b          = b
    pall _ False        = False
    pall (a:as) b       = pall (init as) (last as == a) 

