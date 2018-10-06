var userFactory = require('./userFactory');

var alex = userFactory('Alex Banks', 100);
var eve = userFactory('Eve Parcello', 100, 'employee', 'This and That');

eve.payDay(100);

console.log(alex.toString());
console.log(eve.toString());