const boxes = [1, 2, 3, 4, 5];

function pairIt(array) {
    array.forEach(function(item) {
        array.forEach(function(item1) {
            console.log("Pair (" + item + ' ' + item1 + ')');
        });
    });
}
pairIt(boxes);