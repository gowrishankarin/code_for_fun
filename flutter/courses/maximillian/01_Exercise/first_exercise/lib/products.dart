import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  Widget _buildProducts() {
    Widget productCards;
    if(products.length > 0) {
      productCards =  ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length
      );
    } else {
      productCards =  Center(child: Text('No products found, please add some.'));
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildProducts();
  }
}
