class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class Stack {
    constructor() {
        this.top = null;
        this.bottom = null;
        this.length = 0;
    }

    peek() {
        if(!this.top) {
            return undefined;
        }
        return this.top.value;
    }

    push(value) {
        let top = new Node(value);
        top.next = this.top;
        this.top = top;
        this.length++;
    }

    pop() {
        if(this.length == 0) {
            return undefined;
        }
        let top = this.top;
        this.top = top.next;
        this.length--;
        return top.value;
    }
}

const myStack = new Stack();
myStack.push(1);
myStack.push(2);
console.log(myStack.peek());
console.log(myStack.pop());
myStack.push(3);
console.log(myStack.pop());
console.log(myStack.pop());
console.log(myStack.pop());
console.log(myStack.pop());
