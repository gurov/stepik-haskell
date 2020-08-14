import Data.List
import Data.Bits

(|>) x f = f $ x


disBoat a b = [1,2,3]
  |> map (\i -> (i == a && i /= b) || (i /= a && i == b))
  |> filter (== True)
  |> length


disBreg bregA1 bregA2 bregB1 bregB2 = [1,2,3]
  |> map (\i -> (elem i bregA1 && elem i bregB2) || (elem i bregA2 && elem i bregB1))  
  |> filter (== True)
  |> length

distance (bregA1,a,bregA2) (bregB1,b,bregB2) = disBoat a b + 2 * (disBreg bregA1 bregA2 bregB1 bregB2)


check s = s

--  foldr (\x y -> (head y - x):(tail y)) [3] [1,2,3]


ss = [0,0,0,0,1,2,3]
  |> permutations
  |> map (\(a1:b1:c1:d:a2:b2:c2:_) -> (sort [a1,b1,c1], d, sort [a2,b2,c2]))
  |> nub
  |> filter (\(breg1,_,breg2) -> not( breg1 == [0,1,2] || breg1 == [0,2,3] || breg2 == [0,1,2] || breg2 == [0,2,3])) 
  |> sort
  |> subsequences
  |> filter (\s -> length s > 2)
  |> filter (\s -> head s == ([0,0,0],0,[1,2,3]) && last s == ([1,2,3],0,[0,0,0]))
  |> filter (\s -> length (distance s) == check s)
  -- |> map permutations
  -- |> concat
  
