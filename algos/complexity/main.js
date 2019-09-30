const {performance, PerformanceObserver} = require('perf_hooks');
const nemos = new Array(1000).fill('Nemo');

function findNemo(array) {
    let t0 = performance.now()
    for(let i = 0; i < array.length; i++) {
        if(array[i] === 'Nemo') {
            console.log('Found Nemo');
        }
    }
    let t1 = performance.now()
    console.log('Time taken is ' + (t1 - t0) + ' milliseconds!');
}

findNemo(nemos); // O(n) --> Linear Time