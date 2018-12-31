import 'package:flutter/material.dart';

import 'book_shelf/book_shelf.dart';
import 'commons/widgets/common.dart';

void main() => runApp(BookReaderApp());

class BookReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book Reader',
      //home: BookReaderHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      routes: {
        '/': (BuildContext context) => BookReaderHomePage()
      },
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
    
    return Scaffold(
      drawer: CommonWidgets.buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Fluffy'),
        actions: <Widget>[

        ],
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'image-hero',
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          'assets/images/owl.png',
                          width: 170.0,
                          height: 170.0,
                          color: Colors.white,
                        )),
                  ),
                  Hero(
                    tag: 'hero-text',
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: new Text(
                        'Explore, Analyze, Discover',
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: MaterialButton(
                          minWidth: 150.0,
                          onPressed: () {
                            controller.forward();
                            Future.delayed(Duration(milliseconds: 250)).then(
                                (_) => Navigator.of(context).push(
                                        MaterialPageRoute<Null>(
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
