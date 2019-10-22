class Node {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}

class BinarySearchTree {
    constructor() {
        this.root = null;
    }

    insert(value) {
        const newNode = new Node(value);
        if(!this.root) {
            this.root = newNode;
            return this;
        }

        let currentNode = this.root;
    
        while(true) {

            if(value < currentNode.value) {
                if(!currentNode.left) {
                    currentNode.left = newNode;
                    return this;
                }
                currentNode = currentNode.left;
            } else {
                if(!currentNode.right) {
                    currentNode.right = newNode;
                    return this;
                }
                currentNode = currentNode.right;
            }
        }
    }

    lookup(value) {
        let currentNode = this.root;
        while(currentNode) {
            if(value < currentNode.value) {
                currentNode = currentNode.left;
            } else if(value > currentNode.value) {
                currentNode = currentNode.right;
            } else if(value === currentNode.value) {
                return currentNode;
            }
        }
        return undefined;
    }

    remove() {
        if(!this.root) {
            return undefined;
        }
        let currentNode = this.root;
        let parentNode = null;
        while(currentNode) {
            if(value < currentNode.value) {
                parentNode = currentNode;
                currentNode = currentNode.left;
            } else if(value > currentNode.value) {
                parentNode = currentNode;
                currentNode = currentNode.right;
            } else if(value === currentNode.value) {
                // Option 1: No Right Child
                if(currentNode.right === null) {


                // Option2: Right child which does not have a left child
                } else if(currentNode.right.left === null) {
                    

                // Option 3: Right child that has a left child
                } else {


                }
            }
        }
        return undefined;
    }
}

function traverse(node) {
    const tree = {
        value: node.value
    };

    tree.left = node.left === null ? null : traverse(node.left);
    tree.right = node.right === null ? null : traverse(node.right);
    return tree;
}

const tree  = new BinarySearchTree();
tree.insert(9);
tree.insert(4);
tree.insert(20);
tree.insert(19);
tree.insert(6);
tree.insert(15);
tree.insert(170);
console.log(JSON.stringify(traverse(tree.root)));
console.log(tree.lookup(1));
console.log(tree.lookup(6));
console.log(tree.lookup(16));
console.log(tree.lookup(20));