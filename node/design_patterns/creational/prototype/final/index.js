var Shopper = require('./scout_prototype');

var alex =  scout_prototype.clone();
alex.name = 'Alex Banks';
alex.addItemToList('Slingshot');

var eve =  scout_prototype.clone();
eve.name = 'Eve Porcello';
alex.addItemToList('Reading Light');

console.log(`${alex.name}: ${alex.shoppinglist}`);
console.log(`${eve.name}: ${eve.shoppinglist}`);