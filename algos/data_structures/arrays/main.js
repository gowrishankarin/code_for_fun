const array = ['a', 'b', 'c', 'd', 'e'];

array.push('x');
console.log(array);

let popped = array.pop();
console.log(popped);

popped = array.pop();
console.log(popped);

array.unshift('0');
console.log(array);

array.splice(2, 0, 'alien');
console.log(array);