{-

Определите тип записи, который хранит элементы лога. Имя конструктора должно совпадать с именем типа, и запись должна содержать три поля:
timestamp — время, когда произошло событие (типа UTCTime);
logLevel — уровень события (типа LogLevel);
message — сообщение об ошибке (типа String).
Определите функцию logLevelToString, возвращающую текстуальное представление типа LogLevel, и функцию logEntryToString, возвращающую текстуальное представление записи в виде:

<время>: <уровень>: <сообщение>


Для преобразование типа UTCTime в строку используйте функцию timeToString.

-}


import Data.Time.Clock
import Data.Time.Format
-- import System.Locale

(&) x f = f x

timeToString :: UTCTime -> String
timeToString = formatTime defaultTimeLocale "%a %d %T"

data LogLevel = Error | Warning | Info deriving (Show)

data LogEntry = LogEntry {timestamp :: UTCTime, logLevel :: LogLevel, message :: String}
    deriving (Show)

logLevelToString :: LogLevel -> String
logLevelToString = show 

logEntryToString :: LogEntry -> String
logEntryToString t = (t & timestamp & timeToString) ++ ": " ++ (t & logLevel & logLevelToString) ++ ": " ++ (t & message)

ct = read "2019-02-24 18:28:52.607875 UTC"::UTCTime

le = LogEntry ct Info "Info Message"

-- test1 =
--   let ct = read "2019-02-24 18:28:52.607875 UTC"::UTCTime
--       le = LogEntry ct Info "Info Message"
--   in logEntryToString le