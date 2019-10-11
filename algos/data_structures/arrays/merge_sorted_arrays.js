const a1 = [0, 3, 4, 31];
const a2 = [4, 6, 30];

function mergeSortedArray(a1, a2) {

    let a1Item = a1[0];
    let a2Item = a2[0];

    let i = 1;
    let j = 1;

   
    let merged_array = [];
    while(a1Item || a2Item) {
        console.log(a1Item, a2Item);
        if(!a2Item || a1Item < a2Item) {
            merged_array.push(a1Item);
            a1Item = a1[i]
            i++;
        } else {
            merged_array.push(a2Item);
            a2Item = a2[j];
            j++;
        }

    }

    // for(let j=i; j < len1; j++) {
    //     merged_array.push(a1[j]);
    // }

    return merged_array;


}

let merged_array = mergeSortedArray(a1, a2);
console.log(merged_array);