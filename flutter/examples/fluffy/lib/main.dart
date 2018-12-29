import 'package:flutter/material.dart';

import 'book_shelf.dart';

void main() => runApp(BookReaderApp());

class BookReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book Reader',
      home: BookReaderHomePage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class BookReaderHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookReaderHomePageState();
  }
}

class _BookReaderHomePageState extends State<BookReaderHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.blue[900],
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'image-hero',
              child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('assets/images/owl.png')),
            ),
            Hero(
              tag: 'hero-text',
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: new Text(
                  'Discover, Learn, Elevate',
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Opacity(
              opacity: animation.value,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: MaterialButton(
                    minWidth: 150.0,
                    onPressed: () {
                      controller.forward();
                      Future.delayed(Duration(milliseconds: 250)).then((_) =>
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return BookShelf();
                          })));
                    },
                    color: Colors.white,
                    child: new Text(
                      'Start Exploring',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
