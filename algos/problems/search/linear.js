var beasts = ['Centaur', 'Godzilla', 'Mosura', 'Minotaur', 'Hydra', 'Nessie'];

function searchIndex(items, item) {
    for(let i=0; items.length; ++i) {
        if(items[i] === item) {
            return i;
        }
    }
    return null;
}

function isPresent(items, item) {
    for(let i=0; items.length; ++i) {
        if(items[i] === item) {
            return true;
        }
    }
    return false;
}

console.log(searchIndex(beasts, 'Minotaur'));
console.log(isPresent(beasts, 'Minotaur'));

console.log(beasts.indexOf('Godzilla'));
console.log(
    beasts.findIndex(function(item) {
        return item === 'Godzilla';
    })
);
console.log(
    beasts.find(function(item) {
        return item === 'Godzilla'
    })
);

console.log(beasts.includes('Godzilla'));