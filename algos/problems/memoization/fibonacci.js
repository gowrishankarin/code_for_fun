let calculations = 0;
function fibonacci(n) {
    calculations++;
    if(n < 2) {
        return n;
    }

    return fibonacci(n-1) + fibonacci(n-2);
}

calculations1 = 0;
    
function fibonacciMaster() {
    let cache = {};

    return function fib(n) {
        calculations1++;
        if(n in cache) {
            return cache[n];
        } else {
            if(n < 2) {
                return n;
            } else {
                cache[n] = fib(n-1) + fib(n-2);
                return cache[n];
            }
        }
    }
}

const fasterFib = fibonacciMaster();
let n = 5;
console.log('Slow', fibonacci(n));
console.log('We did ' + calculations + ' calculations');

console.log('DP', fasterFib(n));
console.log('We did ' + calculations1 + ' calculations');
