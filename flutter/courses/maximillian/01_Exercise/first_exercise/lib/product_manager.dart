import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, dynamic>> products;
  
  ProductManager(this.products);

//   final Map startingProduct;

//   ProductManager({this.startingProduct});

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _ProductManagerState();
//   }
// }

// class _ProductManagerState extends State<ProductManager> {
//   List<Map> _products = [];

  // @override
  // void initState() {
  //   if(widget.startingProduct != null) {
  //     _products = [widget.startingProduct];
  //   }
    
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(ProductManager oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      
      Expanded(child: Products(products))
    ],);
  }
}
