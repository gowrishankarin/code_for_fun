class MyArray {
    constructor() {
        this.length = 0;
        this.data = {};
    }

    push(item) { // BIG_O(1)
        this.data[this.length] = item;
        this.length++;
    }

    pop() { // BIG_O(1)
        const item = this.data[this.length - 1];
        delete this.data[this.length - 1];
        this.length--;
        return item;
    }

    delete(index) { // BIG_O(n)
        const item = this.data[index];
        this.shiftItems(index);
        return item;
    }

    shiftItems(index) { // BIG_O(n)
        for(let i=index; i < this.length - 1; i++) {
            this.data[i] = this.data[i+1];
        }

        delete this.data[this.length - 1];
        this.length--;
    }
}

const newArray = new MyArray();
newArray.push('Hi');
newArray.push('you');
newArray.push('!');

newArray.delete(1);
//newArray.pop();
//newArray.pop();

console.log(newArray)