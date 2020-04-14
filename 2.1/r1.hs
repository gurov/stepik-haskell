
module Demo where
import Data.Function

-- multSecond = g `on` h

-- g = undefined

-- h = undefined
-- snd
multSecond :: (a, Integer) -> (a, Integer) -> Integer

multSecond = g `on` h

g = (*)
h = snd
