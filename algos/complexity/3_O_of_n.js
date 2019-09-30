import { SSL_OP_MICROSOFT_BIG_SSLV3_BUFFER } from "constants";

function printFirstItemThenFirstHalfThenSayHi100Times(items) {
    console.log(items[0]); // O(1)

    var middleIndex = Math.floor(items.length / 2); // O(1)
    var index = 0; // O(1)

    while (index < middleIndex) {  // O(n/2)
        console.log(items[index]); // O(n/2)
        index++; // O(n/2)
    }

    for (var i = 0; i < 100; i++) { // O(100)
        console.log('hi'); // O(100)
    }
}

// O_BIG(1 + 1 + 1 + n/2 + n/2 + n/2 + 100 + 100) = BIG_O(3 + 3n/2 + 200) = BIG_O(n + 1) = BIG_O(n)