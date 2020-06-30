
// perms :: [a] -> [[a]]
// perms [] = [[]]
// perms (x:xs) = concatMap  (interleave x)  (perms xs) where


//     interleave x [] = [[x]]
//     interleave x (y:ys) =(x:y:ys) : (map (y:) (interleave x ys)) 


const interleave = (x, [y, ...ys]) => {
    if (y === undefined) return [[x]];
    return [x, y, ...ys, ...interleave(x, ys).map(el => [y, ...el])];
}

const perms = ([x, ...xs]) => {
    if (x === undefined) return [[]];
    return perms(xs).map(el => [...interleave(x, el)]);
}