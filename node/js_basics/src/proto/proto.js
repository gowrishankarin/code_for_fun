let cat = {breed: 'Munchkin'};
let myCat = {name: 'Fluffykins'};

Object.setPrototypeOf(myCat, cat);

console.log(myCat);
console.log(myCat.__proto__);

cat.tailLength = 15;

console.log(myCat.tailLength);

/* Prototype */
function Dog() {

}
let myDog = new Dog()
console.log(myDog.breed);

Dog.prototype.breed = 'Bulldog';
let newDog = new Dog()

console.log(newDog.breed);