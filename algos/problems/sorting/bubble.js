const numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

function bubbleSort(numbers) {
    for(let i=0; i < numbers.length; ++i) {
        for(let j=1; j < numbers.length; ++j) {
            let item0 = numbers[j-1];
            let item1 = numbers[j];

            if(item0 > item1) {
                numbers[j-1] = item1;
                numbers[j] = item0;
            }
        }
    }
}
console.log(numbers);
bubbleSort(numbers);
console.log(numbers);