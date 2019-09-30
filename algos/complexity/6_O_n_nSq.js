function printAllNumbersThenAllPairSums(numbers) {

    console.log('these are the numbers:'); // O(1)
    numbers.forEach(function(number) { // O(n)
      console.log(number);
    });
  
    console.log('and these are their sums:');
    numbers.forEach(function(firstNumber) { // O(n)
      numbers.forEach(function(secondNumber) { // O(n)
        console.log(firstNumber + secondNumber); // O(1)
      });
    });
  }
  
  printAllNumbersThenAllPairSums([1,2,3,4,5])

  // BIG_O(1 + n + n*n + 1) = BIG_O(n^2)