var CatalogItem = require('./CatalogItem');

var boots = new CatalogItem("Leather Boots", 79.99);
var sneakers = new CatalogItem("Kicks", 39.99);
var flipFlops = new CatalogItem("California Work Boots", 19.99);

//console.log("Boots Total: ", `$${boots.total}`);

boots.print();
sneakers.print();

// COMPOSITES
var CatalogGroup = require('./CatalogGroup');

var group_shoes = new CatalogGroup("Shoe and Such", [
    boots, sneakers, flipFlops
]);

// console.log('Shoes total: ', `$${group_shoes.total}`);

//group_shoes.print();

var group_food = new CatalogGroup("Food for while you try on clothes", [
    new CatalogItem("Milkshake", 5.99),
    new CatalogItem("French Fried", 3.99)
]);

var keychain = new CatalogItem("Key Chain", 0.99);

var catalog = new CatalogGroup("Clothes and Food", [
    keychain, group_shoes, group_food
]);

// console.log(`$${catalog.total}`);

catalog.print()