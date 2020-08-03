{-

Плоскость разбита на квадратные ячейки. Стороны ячеек параллельны осям координат. Координаты углов ячейки с координатой (0,0) имеют неотрицательные координаты. Один из углов этой ячейки имеет координату (0,0). С ростом координат ячеек увеличиваются координаты точек внутри этих ячеек.

Реализуйте функции getCenter, которая принимает координату ячейки и возвращает координату ее центра, и функцию getCell, которая принимает координату точки и возвращает номер ячейки в которой находится данная точка. В качестве первого аргумента обе эти функции принимают ширину ячейки.


Требуется написать две функции

getCenter, которая по размеру квадратов и номеру одного из них возвращает координаты его центра. Пример на рисунке обозначен красным:
getCenter 2.2 (Coord 2 1) = Coord 5.5 3.3
getCell, которая по размеру квадратов и координатам точки возвращает номер квадрата, в который попадает эта точка. Пример на рисунке обозначен синим:
getCell 2.2 (Coord 3.2 1.6) = Coord 1 0

-}

data Coord a = Coord a a deriving (Show)

getCenter :: Double -> Coord Int -> Coord Double
getCenter s (Coord a b) = Coord (s * a' + half a) (s * b' + half b) where
    a' = fromIntegral a
    b' = fromIntegral b
    half c = if c > 0 then 0.5 * s else (-0.5) * s


getCell :: Double -> Coord Double -> Coord Int
getCell s (Coord a b) = Coord (truncate (a/s)) (truncate (b/s))