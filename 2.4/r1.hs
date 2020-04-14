
module Demo where



class KnownToGork a where
    stomp :: a -> a
    doesEnrageGork :: a -> Bool

class KnownToMork a where
    stab :: a -> a
    doesEnrageMork :: a -> Bool

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
    stompOrStab :: a -> a
    stompOrStab a | both = stomp (stab a) where both = doesEnrageMork a && doesEnrageGork a
    stompOrStab a | doesEnrageMork a    = stomp a
    stompOrStab a | doesEnrageGork a    = stab a
    stompOrStab a | otherwise                   = a
