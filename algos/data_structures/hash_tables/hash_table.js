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
        let hash = this._hash(key)
        return this.data[hash];
    }

    set(key, val) {
        let hash = this._hash(key);
        this.data[hash] = val;
    }
}

const myHashTable = new HashTable(50);
myHashTable.set('grapes', 10000);
let val = myHashTable.get('grapes');
console.log(val);