// compare arrays
const array_1 = [1, 2, 4, 5];
const array_2 = [1, 3, 4, 4];

function compare(a1, a2) {

    var hash = new Object();
    for(let i = 0; i < a1.length; i++) {
        hash[a1[i]] = true;
    }
    console.log(hash);

    for(let i = 0; i < a2.length; i++) {
        if(hash[a2[i]] === true) {
            console.log(a2[i] + ' is present!')
        }
    };
}

compare(array_1, array_2);