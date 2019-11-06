// 2 Functions that finds the recursion of a number
// a. Recursive
// b. Loop

function factorialRecursive(num) {
    if(num === 0 || num === 1) {
        return 1;
    }
    return num * factorialLoop(num - 1);
}

function factorialLoop(num) {
    if(num === 0 || num === 1) {
        return 1;
    }

    let output = 1;
    for(let i=1; i <= num; i++) {
        output *= i;
    }
    return output;
}

console.log(factorialLoop(1), factorialRecursive(1));
console.log(factorialLoop(2), factorialRecursive(2));
console.log(factorialLoop(3), factorialRecursive(3));
console.log(factorialLoop(4), factorialRecursive(4));
console.log(factorialLoop(5), factorialRecursive(5));
console.log(factorialLoop(6), factorialRecursive(6));
console.log(factorialLoop(7), factorialRecursive(7));
console.log(factorialLoop(8), factorialRecursive(8));
console.log(factorialLoop(9), factorialRecursive(9));
console.log(factorialLoop(10), factorialRecursive(10));

