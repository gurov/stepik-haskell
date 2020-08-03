{-

Рассмотрим еще один пример рекурсивного типа данных:

data Nat = Zero | Suc Nat
Элементы этого типа имеют следующий вид: Zero, Suc Zero, Suc (Suc Zero), Suc (Suc (Suc Zero)), и так далее.
Таким образом мы можем считать, что элементы этого типа - это натуральные числа в унарной системе счисления.

Мы можем написать функцию, которая преобразует Nat в Integer следующим образом:

fromNat :: Nat -> Integer
fromNat Zero = 0
fromNat (Suc n) = fromNat n + 1
Реализуйте функции сложения и умножения этих чисел, а также функцию, вычисляющую факториал.

-}

(|>) n f = f $ n

data Nat = Zero | Suc Nat deriving (Show, Eq)

fromNat :: Nat -> Integer
fromNat Zero = 0
fromNat (Suc n) = fromNat n + 1

toNat :: Integer -> Nat
toNat n = repeat 1
    |> take (fromIntegral n)
    |> foldr (\_ l -> Suc l) Zero

add :: Nat -> Nat -> Nat
add a b = (fromNat a + fromNat b) |> toNat

mul :: Nat -> Nat -> Nat
mul a b = (fromNat a * fromNat b) |> toNat

fac :: Nat -> Nat
fac n = product [1..(fromNat n)] |> toNat
