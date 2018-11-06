import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

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
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(addProduct),
      ),
      Expanded(child: Products(products, deleteProduct: deleteProduct))
    ],);
  }
}
