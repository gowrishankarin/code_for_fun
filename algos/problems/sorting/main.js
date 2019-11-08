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
