
data Result = Fail | Success

doSomeWork :: SomeData -> (Result,Int)


processData :: SomeData -> String
processData someData =
  case doSomeWork someData of
    (_, 0) -> "Success"
    (_, err) -> "Fail: " ++ show err

