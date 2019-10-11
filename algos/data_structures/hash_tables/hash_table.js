class HashTable {
    constructor(size) {
        this.data = new Array(size);
    }

    _hash(key) {
        let hash = 0;
        for (let i=0; i < key.length; i++) {
            hash = (hash + key.charCodeAt(i) * i) % this.data.length;
        }
        return hash;
    }



    get(key) {
        let hash = this._hash(key);
        const current = this.data[hash];
        if(!current) {
            return undefined;
        }
        for(let i = 0; i < current.length; i++) {
            if(current[i][0] === key) {
                return current[i][1];
            }
        }
        
    }

    set(key, val) {
        let hash = this._hash(key);
        if(!this.data[hash]) {
            this.data[hash] = [];
        }
        
        this.data[hash].push([key, val]);
        return this.data;
    }

    keys() {
        let keys = [];
        for(let i=0; i < this.data.length; i++) {
            if(this.data[i]) {
                keys.push(this.data[i][0][0]);
            }
            
        }
        return keys;
    }
}

const myHashTable = new HashTable(50);
myHashTable.set('grapes', 10000);
myHashTable.set('oranges', 10000);
myHashTable.set('apples', 10000);
myHashTable.set('bananas', 10000);
myHashTable.set('grapes', 200);
let val = myHashTable.get('grapes');
console.log(val);
console.log(myHashTable.keys());
console.log(myHashTable)