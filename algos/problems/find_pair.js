// Find the pair sum is 8
const array_1 = [1, 2, 4, 5];
const array_2 = [1, 3, 1, 4];

function findPairSum(a1, sum) {
    var array = new Array();
    var hash = new Object();

    for(let i = 0; i < a1.length; i++) {
        if(hash[a1[i]] == true) {
            array.push([a1[i], sum - a1[i]])
        }
        hash[sum - a1[i]] = true;
    }

    return array;
}

let retVal = findPairSum(array_1, 6);
console.log(retVal);