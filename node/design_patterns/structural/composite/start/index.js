var CatalogItem = require('./CatalogItem');

var boots = new CatalogItem("Leather Boots", 79.99);
var sneakers = new CatalogItem("Kicks", 39.99);
var flipFlops = new CatalogItem("California Work Boots", 19.99);

console.log("Boots Total: ", `$${boots.total}`);

boots.print();
sneakers.print();