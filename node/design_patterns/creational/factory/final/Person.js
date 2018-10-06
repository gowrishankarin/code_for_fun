class Person {
    constructor(name = 'Unnamed Person') {
        this.name = name;
    }

    toString() {
        return JSON.stringify(this);
    }
}

module.exports = Person;