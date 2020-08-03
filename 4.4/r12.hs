eitherToMaybe :: Either a b -> Maybe a
eitherToMaybe (Left a) _ = Just a
eitherToMaybe (Right _) _ = Nothing
