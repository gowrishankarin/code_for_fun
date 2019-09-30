function iterate(boxes, boxes2) {
    boxes.forEach(function(box){ // O(m)
        console.log("Found a box");
    });

    boxes2.forEach(function(box) { // O(n)
        console.log("Found a box2");
    })
}

// BIG_O(m + n)
