import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import './product_manager.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Exercise'),
        ),
        body: ProductManager('New Product'),
      ),
    );
  }

  // TODO: implement build

}
