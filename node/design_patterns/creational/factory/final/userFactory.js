var Employee = require('./Employee');
var Shopper = require('./Shopper');

var userFactory = function(name, money, type, description) {
    if(type == 'employee') {
        return new Employee(name, money, description)
    } else {
        return new Shopper(name, money)
    }
}

module.exports = userFactory;