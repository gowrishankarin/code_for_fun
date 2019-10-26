

function noCurrying(name, size, element) {
    return name + ' is a ' +
        size + ' dragon that breaths ' + 
        element + '!';
}

console.log(noCurrying('Gary', 'tiny', 'lightning'))

let dragon = 
    name => 
        size =>
            element =>
                name + ' is a ' + size + ' dragon that breaths ' + element + '!';

let result = dragon('Geetu')('large')('fire');
console.log(result);

let geetuDragon = dragon('Geetu');
console.log(geetuDragon);
let largeDragon = geetuDragon('large');
console.log(largeDragon);
let fireDragon = largeDragon('fire');
console.log(fireDragon);

let dragons = [{
    name: 'fluffykins', element: 'lightning'
}, {
    name: 'noomi', element: 'lightning'
}, {
    name: 'karo', element: 'fire'
}, {
    name: 'doomer', element: 'timewarp'
}];

let hasElement = (element, obj) => obj.element === element;

let lightningDragons = dragons.filter(x => hasElement('lightning', x));

console.log(lightningDragons);