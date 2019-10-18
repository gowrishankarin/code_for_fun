 let myLinkedList = {
     head: {
         value: 1,
         next: {

         }
     }
 };

 class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }

    // value() {
    //     return this.value;
    // }
 }
 class LinkedList {
    constructor(value) {
        this.head = new Node(value);
        this.tail = this.head;
        this.length = 1;
    }

    append(value) {

        let newNode = new Node(value);
        this.tail.next = newNode;
        this.tail = newNode;
        this.length++;

    }
    prepend(value) {
        let newNode = new Node(value);
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
        let tmpNode = currentNode.next;
        currentNode.next = newNode;
        newNode.next = tmpNode;
        this.length++;
    }

    remove(index) {
        if(index == 0) {
            this.head = this.head.next;
            return;
        }

        if(index >= this.length) {
            // Remove last node
            return;
        }

        let currentNode = this.traverseToIndex(index - 1);
        currentNode.next = currentNode.next.next;
        this.length--;
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
 }

 const myLinkedList1 = new LinkedList(10);
 myLinkedList1.append(20);
 myLinkedList1.append(30);
 myLinkedList1.prepend(0);
 myLinkedList1.insert(0, -5);
 myLinkedList1.insert(5, 35);
 myLinkedList1.insert(4, 25);

 let array = myLinkedList1.printAll();
 console.log(array);
 myLinkedList1.remove(0);
 console.log(myLinkedList1.printAll());
 myLinkedList1.remove(3);
 console.log(myLinkedList1.printAll());


