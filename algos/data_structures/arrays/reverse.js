
function reverse(str) { // BIG_O(n)
    let revString = '';
    for(let i=str.length; i > 0; i--) {
        revString += str[i-1];
    }
    return revString;
}

const output = reverse('Gowri');
console.log(output);