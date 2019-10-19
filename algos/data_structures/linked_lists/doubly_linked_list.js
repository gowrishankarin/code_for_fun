class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
        this.prev = null;
    }
}

class DoublyLinkedList {
    constructor(value) {
        this.head = new Node(value);
        this.tail = this.head;
        this.head.next = null;
        this.head.prev = null;
        this.length = 1;
    }

    append(value) {
        let newNode = new Node(value);
        newNode.prev = this.tail;
        this.tail.next = newNode;
        this.tail = newNode;

        this.length++;
    }

    prepend(value) {
        let newNode = new Node(value);
        this.head.prev = newNode;
        newNode.next = this.head;
        this.head = newNode;
        this.length++;
        return this;
    }

    traverseToIndex(index) {
        let counter = 0;
        let leaderNode = this.head;
        while(counter !== index) {
            leaderNode = leaderNode.next;
            counter++;
        }
        return leaderNode;
    }

    insert(index, value) {
        
        if(index == 0) {
            this.prepend(value);
            return;
        }

        if(index >= this.length) {
            this.append(value);
            //return newNode;
            return;
        }

        let newNode = new Node(value);
        console.log('Mid');
        let currentNode = this.traverseToIndex(index - 1);
        let tmpNxtNode = currentNode.next;
        newNode.prev = currentNode;
        currentNode.next = newNode;
        newNode.next = tmpNxtNode;
        tmpNxtNode.prev = newNode;
        this.length++;
    }

    remove(index) {
        if(index == 0) {
            this.head = this.head.next;
            this.head.prev = null;
            this.length--;
            return;
        }

        if(index >= this.lengths) {
            return;
        }

        let currentNode = this.traverseToIndex(index - 1);
        let nextNode = currentNode.next;
        currentNode.next = nextNode.next;
        nextNode.next.prev = currentNode;

    }

    reverse() {

        let currentNode = this.tail;
        while(currentNode) {
            let thisNode = currentNode;
            currentNode = currentNode.prev;

            currentNode.next = currentNode;
            thisNode.prev = currentNode;
        }


    }

    printAll() {
        console.log('Length: ' + this.length);
        let currentNode = this.head;
        let valueArray = [];
        while(currentNode !== null) {
            valueArray.push(currentNode.value);
            currentNode = currentNode.next;
        }
        return valueArray;
    }


    printAllRev() {
        console.log('Length: ' + this.length);
        let currentNode = this.tail;
        let valueArray = [];
        while(currentNode !== null) {
            valueArray.push(currentNode.value);
            currentNode = currentNode.prev;
        }
        return valueArray;
    }
}

const myLinkedList1 = new DoublyLinkedList(10);
 myLinkedList1.append(20);
 myLinkedList1.append(30);
 myLinkedList1.prepend(0);
 myLinkedList1.insert(0, -5);
 myLinkedList1.insert(5, 35);
 myLinkedList1.insert(4, 25);

let array = myLinkedList1.printAll();
console.log(array);

 console.log(myLinkedList1.printAllRev());
myLinkedList1.remove(3);
console.log(myLinkedList1.printAllRev());

myLinkedList1.reverse();
console.log(myLinkedList1.printAll());