import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import './pages/home.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }

  // TODO: implement build

}
