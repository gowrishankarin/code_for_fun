let months = ['March', 'Jan', 'Feb', 'Dec'];
months.sort();
console.log(months);

let array1 = [1, 30, 4, 21, 10000];
array1.sort()
console.log(array1);


months.sort(function(a, b) {
    // return a.localeCompare(b);
});

array1.sort(function(a, b) {
    return a - b;

})

console.log(array1);


//#1 - Sort 10 schools around your house by distance:
// Insertion / Heap - O(1) space complexity

//#2 - eBay sorts listings by the current Bid amount:
// Radix or Counting 

//#3 - Sport scores on ESPN
// Quick

//#4 - Massive database (can't fit all into memory) needs to sort through past year's user data
// Quick

//#5 - Almost sorted Udemy review data needs to update and add 2 new reviews
// Insertion 

//#6 - Temperature Records for the past 50 years in Canada
// Quick

//#7 - Large user name database needs to be sorted. Data is very random.
// Quick

//#8 - You want to teach sorting for the first time
// Bubble