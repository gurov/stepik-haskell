{-

Реализуйте представителя класса типов Monoid для Maybe' a так, чтобы mempty не был равен Maybe' Nothing.
Нельзя накладывать никаких дополнительных ограничений на тип a, кроме указанных в условии.

-}

-- import Data.Monoid

newtype Maybe' a = Maybe' { getMaybe :: Maybe a }
    deriving (Eq,Show)

instance Monoid a => Monoid (Maybe' a) where
    mempty = Maybe' $ Just mempty
    mappend (Maybe' (Just a)) (Maybe' (Just b)) = Maybe' $ Just $ mappend a b
    _ `mappend` _ = Maybe' $ mempty