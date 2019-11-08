const numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

function selectionSort(numbers) {
    for(var i=0; i < numbers.length; ++i) {

        let smallIndex = i;
        let temp = numbers[smallIndex]

        for(var j=i+1; j < numbers.length; ++j) {
            let item0 = numbers[smallIndex];
            let item1 = numbers[j];

            if(item1 < item0) {
                small = item1;
                smallIndex = j;
            } 
        }
        
        numbers[i] = numbers[smallIndex];
        numbers[smallIndex] = temp;

    }
}
console.log(numbers);
selectionSort(numbers);
console.log(numbers);