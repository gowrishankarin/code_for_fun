import 'package:flutter/material.dart';

import '../product_manager.dart';

// This is home page.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Exercise'),
        ),
        body: ProductManager(),
      );
  }
}