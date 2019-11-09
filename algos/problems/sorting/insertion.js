const numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

function insertionSort(numbers) {
    
    for(let i=0; i < numbers.length; ++i) {
        if(numbers[i] < numbers[0]) {
            // Move number to the first position
            numbers.unshift(numbers.splice(i, 1)[0]);
        } else {
            // Find where number should go
            for(let j=1; j < i; ++j) {
                if(numbers[i] > numbers[j-1] && numbers[i] < numbers[j]) {
                    // Move number to the right spot
                    numbers.splice(j, 0, numbers.splice(i, 1)[0]);
                }
            }
        }
    }
}
console.log(numbers);
insertionSort(numbers);
console.log(numbers);