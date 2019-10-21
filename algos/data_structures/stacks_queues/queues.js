class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class Queue {
    constructor() {
        this.first = null;
        this.last = null;
        this.length = 0;
    }

    peek() {
        if(!this.first) {
            return undefined;
        }
        return this.first.value;
    }

    enqueue(value) {

        let nnew = new Node(value);
        
        if(!this.first) {
            this.first = nnew;
            this.last = nnew;
        } else {
            let last = this.last;
            this.last = nnew;
            nnew.next = last;
        }
        this.length++;
        
        //this.first.prev = nnew;
        //this.last = nnew;

        
    }

    dequeue() {
        if(!this.first) {
            return undefined;
        }

        if(this.first === this.last) {
            this.last = null;
        }

        let first = this.first;
        this.first = this.first.next;
        this.length--;

        return first.value;
    }
}

const myQueue = new Queue();
myQueue.enqueue(1);
myQueue.enqueue(2);
console.log(myQueue.peek());
console.log(myQueue.dequeue());
myQueue.enqueue(3);
console.log(myQueue.dequeue());
console.log(myQueue.dequeue());
console.log(myQueue.dequeue());
console.log(myQueue.dequeue());

console.log(myQueue);