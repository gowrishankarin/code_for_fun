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

    isPresent(key) {
        //let hash = this._hash(key);
        const current = this.data[key];
        if(current) {
            return key;
        }

        this.data[key] = key;
        return undefined;
    }
}

const a1 = [2, 5, 1, 2, 3, 5, 1, 2, 4];
const a2 = [2, 1, 1, 2, 3, 5, 1, 2, 4];
const a3 = [2, 3, 4, 5];

function isPresent(array) {
    const hashTable = new HashTable(50);
    for(let i=0; i < array.length; i++) {
        let val = hashTable.isPresent(array[i]);
        if(val !== undefined) {
            return val;
        }
    }
    return undefined;
}

console.log(isPresent(a1));
console.log(isPresent(a2));
console.log(isPresent(a3));