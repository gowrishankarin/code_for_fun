import 'package:flutter/material.dart';

import '../libraries/flip_bar/flip_box_bar.dart';

class FlipBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlipBarDemoState();
  }
}

class _FlipBarDemoState extends State<FlipBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip Bar Demo'),
      ),
      body: Column(),
      bottomNavigationBar: FlipBoxBar(
        items: [
          FlipBarItem(
            icon: Icon(Icons.map),
            text: Text('Map'),
            frontColor: Colors.blue,
            backColor: Colors.blueAccent
          ),
          FlipBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            text: Text('Read'),
            frontColor: Colors.orange,
            backColor: Colors.orangeAccent
          ),
          FlipBarItem(
            icon: Icon(Icons.add),
            text: Text('Add'),
            frontColor: Colors.cyan,
            backColor: Colors.cyanAccent
          ),
          FlipBarItem(
            icon: Icon(Icons.print),
            text: Text('Print'),
            frontColor: Colors.purple,
            backColor: Colors.purpleAccent
          ),
        ],
        onIndexChanged: (newIndex) {
          print(newIndex);
        },
      ),
    );
  }
}
