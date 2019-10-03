// Reference type
var object1 = {value: 10};
var object2 = object1;
var object3 = {value: 10};

console.log(object1 === object2);
console.log(object1 === object3);

// Context
const object4 = {
    a: function() {
        console.log(this);
    }
}
object4.a();

// Instantiation
class Player {
    constructor(name, type) {
        this.name = name;
        this.type = type;
    }

    introduce() {
        console.log(`Hi I am ${this.name}, I am a ${this.type}`);
    }
}

class Wizard extends Player {
    constructor(name, type) {
        super(name, type);
    }

    play() {
        console.log(`WEEEEEE I am a ${this.type}`);
    }
}

const wizard1 = new Wizard('Shelly', 'Healer');
const wizard2 = new Wizard('Shawn', 'Dark Magic');

wizard1.play();
wizard1.introduce();