// Given a number n return the fibonacci sum;
// Series: 0, 1, 1, 2, 3, 5, 8
function fibonacciRecursive(num) {
    if(num === 0) {
        return 0;
    }
    if(num <= 2) {
        return 1;
    }

    return fibonacciRecursive(num - 2) + fibonacciRecursive(num - 1);
}

function fibonacciLoop(num) {

    let series = [0, 1, 1];
    if(num <= 2) {
        return series[num];
    }

    
    for(let i=3; i <= num; i++) {
        series.push(series[i-1] + series[i - 2]);
    }
    return series[num];
}

console.log(fibonacciLoop(1), fibonacciRecursive(1));
console.log(fibonacciLoop(2), fibonacciRecursive(2));
console.log(fibonacciLoop(3), fibonacciRecursive(3));
console.log(fibonacciLoop(4), fibonacciRecursive(4));
console.log(fibonacciLoop(5), fibonacciRecursive(5));
console.log(fibonacciLoop(6), fibonacciRecursive(6));
console.log(fibonacciLoop(7), fibonacciRecursive(7));
console.log(fibonacciLoop(8), fibonacciRecursive(8));
console.log(fibonacciLoop(9), fibonacciRecursive(9));
console.log(fibonacciLoop(10), fibonacciRecursive(10));