const basket = ['apples', 'grapes', 'pears'];
// Linked List: apple --> grapes --> pears

// Shuffling is fast
// 

let obj1 = {a: true};
let obj2 = obj1;

obj1.a = 'booya';
console.log('1', obj1);
console.log('2', obj2);

delete obj1;

console.log('2', obj2);
obj1 = undefined;
console.log('2', obj2);
