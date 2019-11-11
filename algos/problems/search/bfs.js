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

    breadthFirstSearch() {
        let currentNode = this.root;
        let list = [];
        let queue = [];

        queue.push(currentNode);

        while(queue.length > 0) {
            currentNode = queue.shift();
            console.log(currentNode.value);
            list.push(currentNode.value);

            if(currentNode.left) {
                queue.push(currentNode.left);
            }
            if(currentNode.right) {
                queue.push(currentNode.right);
            }
        }
    }

    breadthFirstSearchRecursive(queue, list) {
        if(!queue.length) {
            return list;
        }

        let currentNode = queue.shift();
        list.push(currentNode.value);
        console.log(currentNode.value);
        if(currentNode.left) {
            queue.push(currentNode.left);
        }

        if(currentNode.right) {
            queue.push(currentNode.right);
        }

        return this.breadthFirstSearchRecursive(queue, list);
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
console.log(JSON.stringify(traverse(tree.root)));
console.log(tree.lookup(1));
console.log(tree.lookup(6));
console.log(tree.lookup(16));
console.log(tree.lookup(20));

tree.breadthFirstSearch();
tree.breadthFirstSearchRecursive([tree.root], []);


tree.remove(170);
console.log(tree.lookup(170));