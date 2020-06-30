
data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Eq, Show)

(&) g f = f g

abbrFirstName :: Person -> Person
abbrFirstName p = p {firstName = helper (p & firstName)} where
    helper name | length name == 0 = ""
                | length name < 2  = name
                | otherwise        = (head name):"." 




