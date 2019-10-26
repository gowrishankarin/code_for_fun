
/* Simple Object */
var bubbleObject = {
	x: 100,
	y: 200,
	add: function() {
		return this.x + this.y;
	}
};

console.log(bubbleObject);
console.log(bubbleObject.add());


/* Simple Class */
function Bubble() {
	this.x = 100;
	this.y = 200;
	this.add = function() {
		return this.x + this.y;
	}
};

bubbleObject = new Bubble();
console.log(bubbleObject);
console.log(bubbleObject.add());


/* Prototypes */
/* Simple Class */
function ProtoBubble(x, y) {
	this.x = x;
	this.y = y;
};

ProtoBubble.prototype.add = function() {
	return this.x + this.y;
}

var protoBubbleObject = new ProtoBubble(100, 200);
console.log(protoBubbleObject);
console.log(protoBubbleObject.add());

/* Class with constructor */
class ImprovedBubble {
	constructor(x, y) {
		this.x = x;
		this.y = y;
	}

	add() {
		return this.x + this.y
	}
}

var improvedBubble = new ImprovedBubble(100, 200);
console.log(improvedBubble);
console.log(improvedBubble.add());

improvedBubble = new ImprovedBubble(200, 300);
console.log(improvedBubble);
console.log(improvedBubble.add());

/* Class with constructor */
class ComplexBubble {
	constructor(x, y, subFunc) {
		this.x = x;
		this.y = y;

		this.sub = subFunc;
	}

	add() {
		return this.x + this.y
	}
}

let subFunc = function sub() {
	return this.x - this.y;
}

var complexBubble = new ComplexBubble(100, 200, subFunc);
console.log(complexBubble);
console.log(complexBubble.add());
console.log(complexBubble.sub());