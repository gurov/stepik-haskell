data LogLevel = Error | Warning | Info -- deriving (Ord)

cmp :: LogLevel -> LogLevel -> Ordering
cmp Error Error = EQ
cmp Error _ = GT
cmp Warning Error = LT
cmp Warning Warning = EQ
cmp Warning Info = GT
cmp Info Info = EQ
cmp Info _ = LT

-- good solution
-- cmp :: LogLevel -> LogLevel -> Ordering
-- cmp x y = compare (ord x)  (ord y) where
--    ord Error = 3
--    ord Warning = 2
--    ord Info = 1