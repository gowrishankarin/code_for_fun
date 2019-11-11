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

    remove(value) {
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

                    if(parentNode === null) {
                        this.root = currentNode.left;
                    } else {
                        // if parent > current value, make current left child a child of parent
                        if(currentNode.value < parentNode.value) {
                            parentNode.left = currentNode.left;
                        
                        // if parent < current value, make left child a right child of parent
                        } else if(currentNode.value > parentNode.value) {
                            parentNode.right = currentNode.left;
                        }
                    }
                // Option2: Right child which does not have a left child
                } else if(currentNode.right.left === null) {

                    currentNode.right.left = currentNode.left;
                    if(parentNode === null) {
                        this.root = currentNode.right;
                    } else {
                        // If parent > current, make right child of the left of the parent
                        if(currentNode.value < parentNode.value) {
                            parentNode.left = currentNode.right;
                        // If parent < current, make right child a right child of the parent
                        } else if(currentNode.value > parentNode.value) {
                            parentNode.right = currentNode.right;
                        }
                    }
                    

                // Option 3: Right child that has a left child
                } else {
                    // Find the right child's left most child
                    let leftmost = currentNode.right.left;
                    let leftmostParent = currentNode.right;
                    while(leftmost.left !== null) {
                        leftmostParent = leftmost;
                        leftmost = leftmost.left;
                    }

                    // Parent's left subtree is now leftmost's right subtee
                    leftmostParent.left = leftmost.right;
                    leftmost.left = currentNode.left;
                    leftmost.right = currentNode.right;

                    if(parentNode === null) {
                        this.root = leftmost;
                    } else {
                        if(currentNode.value < parentNode.value) {
                            parentNode.left = leftmost;
                        } else if(currentNode.value > parentNode.value) {
                            parentNode.right = leftmost;
                        }
                    }

                }
                return true;
            }
        }
    }

    inOrder(node, list) {
        if(node.left) {
            this.inOrder(node.left, list)
        }
        list.push(node.value);
        if(node.right) {
            this.inOrder(node.right, list)
        }
        return list;
    }

    dfsInOrder() {
        return this.inOrder(this.root, []);
    }

    preOrder(node, list) {
        list.push(node.value);
        if(node.left) {
            this.preOrder(node.left, list)
        }
        
        if(node.right) {
            this.preOrder(node.right, list)
        }
        return list;
    }

    dfsPreOrder() {
        return this.preOrder(this.root, []);
    }

    postOrder(node, list) {
        
        if(node.left) {
            this.postOrder(node.left, list);
        }
        
        if(node.right) {
            this.postOrder(node.right, list)
        } 
        list.push(node.value);
        return list;
    }

    dfsPostOrder() {
        return this.postOrder(this.root, []);
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
tree.insert(1);
tree.insert(6);
tree.insert(15);
tree.insert(170);

//      9
//  4       20
//1   6  15    170

let inOrder = [1, 4, 6, 9, 15, 20, 170]
let preOrder = [9, 4, 1, 6, 20, 15, 170] // To recreate a tree
let postOrder = [1, 6, 4, 15, 170, 20, 9]

console.log("In Order:")
console.log(inOrder);
console.log(tree.dfsInOrder());

console.log("Pre Order:")
console.log(preOrder);
console.log(tree.dfsPreOrder());

console.log("Post Order:")
console.log(postOrder);
console.log(tree.dfsPostOrder());
