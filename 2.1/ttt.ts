
interface A {}
interface B {}

function tt (a: A, [b, c]: [A, B], d: A): [B, A, A] {
    return [c, a, a];
}