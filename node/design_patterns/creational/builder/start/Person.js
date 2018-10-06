class Person {
    constructor(name, isEmployee=false, hours=40, money=0, shoppinglist=[]) {
        this.name = name;
        this.isEmployee = isEmployee;
        this.isManager = this.isManager;
        this.hours = hours;
        this.money = money;
        this.shoppinglist = shoppinglist;
    }

    toString() {
        return JSON.stringify(this);
    }
}

module.exports = Person;