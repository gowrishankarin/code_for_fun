let cache = {};
function memoizedAddTo80(n) {
    if(n in cache) {
        return cache[n];
    } else {
        console.log('Long Time');
        cache[n] = n + 80;
        return cache[n];
    }
}

console.log('1', memoizedAddTo80(5));
console.log('2', memoizedAddTo80(5));
console.log('3', memoizedAddTo80(15));

// With closures

function memoizedAddTo800() {
    let cache = {};
    return function(n) {
        if(n in cache) {
            return cache[n];
        } else {
            console.log('Long Time');
            cache[n] = n + 800;
            return cache[n];
        }
    }
}
const memized = memoizedAddTo800();
console.log('4', memized(5));
console.log('5', memized(5));
console.log('6', memized(15));
