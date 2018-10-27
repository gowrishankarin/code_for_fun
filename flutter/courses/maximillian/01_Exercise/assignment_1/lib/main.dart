import 'package:flutter/material.dart';

import './text_output.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1'),
        ),
        body: Center(child: TextOutput('This is assignment no 1'))
      ),
    );
  }
  
}