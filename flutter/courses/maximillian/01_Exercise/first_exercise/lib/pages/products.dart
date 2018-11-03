import 'package:flutter/material.dart';

import '../product_manager.dart';

// This is home page.
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ProductManager(),
    );
  }
}
