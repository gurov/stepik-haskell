
{-

Реализуйте функцию parsePerson, которая разбирает строки вида firstName = John\nlastName = Connor\nage = 30
и возвращает либо результат типа Person, либо ошибку типа Error.

Строка, которая подается на вход, должна разбивать по символу '\n' на список строк,
каждая из которых имеет вид X = Y. Если входная строка не имеет указанный вид, то функция должна возвращать ParsingError.

    Если указаны не все поля, то возвращается IncompleteDataError.
    Если в поле age указано не число, то возвращается IncorrectDataError str, где str — содержимое поля age.
    Если в строке присутствуют лишние поля, то они игнорируются.

-}
import Text.Read
import Data.List.Split
import Data.Char


(|>) x f = f x

data Error = ParsingError | IncompleteDataError | IncorrectDataError String deriving (Show, Eq)

data Person = Person { firstName :: String, lastName :: String, age :: Int } deriving (Show, Eq)

-- splitBy     :: (Char -> Bool) -> String -> [String]
-- splitBy p s =  case dropWhile p s of
--                       "" -> []
--                       s' -> w : splitBy p s''
--                             where (w, s'') = break p s'

-- parseInt c = read c :: Int



-- unwordArray (a:b:xs) = a:b:[unwords xs]

-- parseLine xs | length xs > 2 && (head . tail) xs == "="   = Right (unwordArray xs)
--              | otherwise                                  = Left ParsingError

-- isPersionField (Right (a:_)) | a == "firstName"  = True
--                              | a == "lastName"   = True
--                              | a == "age"        = True
--                              | otherwise         = False
-- isPersionField (Left _)                          = True


-- checkAge age = readMaybe age :: Maybe Int

-- convertErrorAge s1@(Right (a:b:age:c)) | a == "age" && (checkAge age) == Nothing = Left (IncorrectDataError age)
--                                        | otherwise                               = s1
-- convertErrorAge s2                                                               = s2



-- test2 p (Right (attr:_:s:_)) | attr == "firstName"  = p {firstName = s}
--                              | attr == "lastName"   = p {lastName  = s}
--                              | attr == "age"        = p {age       = parseInt s} 
        

-- hhh ss = Right (foldr (\x p -> test2 p x) (Person "" "" 0) ss)



-- final2 xs = if length errorList > 0 then head errorList else hhh [x | x@(Right _) <- xs] where
--     errorList = [x | x@(Left _) <- xs]
            
    

-- parsePerson :: String -> Either Error Person
-- parsePerson s = s
--     |> splitBy (=='\n') 
--     |> filter (/="")
--     |> map words
--     |> map parseLine
--     |> filter isPersionField
--     |> map convertErrorAge
--     |> final2






parsePerson :: String -> Either Error Person
parsePerson str = if isValidStr str == False then
                        Left ParsingError
                  else if (hasAllFields fields pairs') == False then
                        Left IncompleteDataError
                  else if ageIsCorrect str == False then
                        Left (IncorrectDataError $ snd (valueOf "age" pairs'))
                  else 
                        Right Person { 
                                    lastName = snd $ valueOf "lastName" pairs',
                                    firstName = snd $ valueOf "firstName" pairs',
                                    age = (read (snd $ valueOf "age" pairs')::Int)
                                }
                  where
                    pairs' = pairs str
                    fields = ["lastName", "firstName", "age"]




pairs str = map (\(key:value:[]) -> (key,value)) (filter isPair (map keyValues (lines str)))
isPair str = length str == 2
-- fields = splitOn "\n"
keyValues str = let 
                s1 = splitOn " = " str
                s2 = splitOn " =" str
            in 
                if (length s1) == 0 then
                    s2
                else
                    s1
isValidStr str = (length $ pairs str) > 0 && isValidFields str && hasField "age" (pairs str) --(length (snd (age' str)) > 0)
valueOf key pairs = head (filter (\(key',_) -> key' == key) pairs)
isNumber' str = all (True ==) (map isDigit str) && length str > 0

hasAllFields fields pairs = all (True ==) (map (\f -> hasField f pairs) fields)
hasField field pairs = length (filter (\(key,_) -> key == field) pairs) > 0

age' str = valueOf "age" (pairs str)
ageIsCorrect str = isNumber' (snd (age' str))
isValidFields str = all (True==) (map (\f -> ((length (splitOn "=" f)) > 0) && ((length (splitOn " = " f)) > 0)) (lines str))