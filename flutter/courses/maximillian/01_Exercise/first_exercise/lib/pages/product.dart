import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

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
          title: Text(product['title']),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product['image']),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  product['title'],
                  style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Union Square, San Francisco',
                    style: TextStyle(fontFamily: 'Oswald'),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        '|',
                        style: TextStyle(color: Colors.grey),
                      )),
                  Text(
                    '\$' + product['price'].toString(),
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  product['description'],
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
      ),
    );
  }
}
