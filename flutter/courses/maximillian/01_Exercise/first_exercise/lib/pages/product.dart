import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(padding: EdgeInsets.all(10.0), child: Text('Details')),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('BACK'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
