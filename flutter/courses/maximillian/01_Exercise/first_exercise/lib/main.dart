import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MyAppState();
  }
  // @override

}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Food Tester'];

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Exercise'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _products.add('New Product');
                  });
                  //setState();
                },
                child: Text('Add Product'),
              ),
            ),
            Column(
              children: _products
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/food.jpg'),
                            Text(element)
                          ],
                        ),
                      ),
                    )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
