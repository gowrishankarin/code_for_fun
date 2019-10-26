class TrieNode {
    constructor() {
        this.children = {};
        this.isEndOfWord = false;
    }
}

class Trie {
    constructor() {
        this.root = new TrieNode();
    }
    
    insert(word) {
        let current = this.root;
        for(let i=0; i < word.length; i++) {
            let char = word[i];
            let trieNode = current.children[char];
            if(trieNode === null) {
                trieNode = new TrieNode();
                current.children[char] = trieNode;
            }
            current = trieNode;
        }
        current.isEndOfWord = true;
    }

    search(word) {
        let  current = this.root;
        for(let i=0; i < word.length; i++) {
            let char = word[i];
            let trieNode = current.children[char];
            if(trieNode === null) {
                return false;
            }
            current = trieNode;
        }
        return current.isEndOfWord;
    }

    deleteNode(current, word, index) {
        if(index === word.length) {
            // When end of word is reached only delete if current.endOfWord is true
            if(!current.isEndOfWord) {
                return false;
            }
            current.endOfWord = false;
            return Object.keys(current.children).length === 0;
        }

        let char = word[index];
        let trieNode = current.children[char];
        if(node === null) {
            return false;
        }

        let shouldDeleteCurrentNode = delete(trieNode, word, index + 1);

        // If true ithen delete the mapping of character and trienode reference from map.
        if(shouldDeleteCurrentNode) {
            current.children[char] = null;
            return Object.keys(current.children).length === 0;
        }
        return false;
    }

    delete(word) {
        deleteNode(this.root, word, 0);
    }
}