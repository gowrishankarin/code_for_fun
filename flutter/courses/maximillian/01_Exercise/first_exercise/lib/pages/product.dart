import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/address_tag.dart';
import '../widgets/products/price_tag.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  Widget _buildAddressPriceRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AddressTag('Union Square, San Francisco'),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              '|',
              style: TextStyle(color: Colors.grey),
            )),
        PriceTag(product.price.toString())
      ],
    );
  }

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure'),
          content: Text('This action cannot be undone!'),
          actions: <Widget>[
            FlatButton(
              child: Text('DISCARD'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('Back Button Pressed');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  image: NetworkImage(product.image),
                  height: 300.0,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/food.jpg'),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                _buildAddressPriceRow(product),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    //child: Text('DELETE'),
                    onPressed: () => _showWarningDialog(context),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
