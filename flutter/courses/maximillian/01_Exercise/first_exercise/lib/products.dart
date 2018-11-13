import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    '\$${products[index]['price'].toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              child: Text('Union Square, San Francisco'),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                iconSize: 24,
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      '/product/' + index.toString(),
                    ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                iconSize: 24,
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      '/product/' + index.toString(),
                    ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProducts() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
          itemBuilder: _buildProductItem, itemCount: products.length);
    } else {
      productCards = Center(child: Text('No products found, please add some.'));
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProducts();
  }
}
