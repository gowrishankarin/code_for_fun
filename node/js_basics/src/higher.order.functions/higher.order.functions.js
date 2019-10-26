require('babel-core/register');
require('babel-polyfill');

var fs = require('fs');


var animals = [{
    name: 'Fluffykins', type: 'dragon', age: 52
}, {
    name: 'Hamilton', type: 'dog', age: 299
}, {
    name: 'Caro', type: 'dog', age: 32
}, {
    name: 'Harold', type: 'cat', age: 21
}, {
    name: 'Ursula', type: 'snake', age: 12
}, {
    name: 'Jimmy', type: 'frog', age: 2
} ];

/* FILTER */
var isDog = function(animal) {
	return animal.type === 'dog'
};
var dogs = animals.filter(isDog);
console.log(dogs);

/* MAP */ 
var animalName = function(animal) {
	return animal.name;
}
var animalNames = animals.map(animalName);
console.log(animalNames);

var animalsProfile = function(animal) {
	return animal.name + ' is a ' + animal.type
}
console.log(animals.map(animalsProfile));

/* ES6 */
animalName = animals.map((animal) => animal.name);
console.log(animalName);

animalsProfile = animals.map((animal) => animal.name + ' is a ' + animal.type);
console.log(animalsProfile);

/* REDUCE */
var sum = animals.reduce(function(sum, animal) {
	return sum + animal.age;
}, 0)
console.log(sum);

var output = fs.readFileSync('data.txt', 'utf8')
	.trim()
	.split('\n')
	.map(line => line.split('\t'))
	.reduce((customers, line) => {
		customers[line[0]] = [];
		customers[line[0]].push({
			name: line[1], price: line[2], quantity: line[3]
		})
		return customers;
	}, {});
console.log(JSON.stringify(output, null, 2));