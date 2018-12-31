import 'package:flutter/material.dart';

import './book_row.dart';
import '../commons/widgets/common.dart';

class BookShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonWidgets.buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Book Shelf'),
      ),
      body: Container(
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Hero(
              tag: 'image-hero',
              child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/images/owl.png',
                    width: 50.0,
                    height: 50.0,
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
            Container(
              height: 450.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      indicatorWeight: 3.0,
                      isScrollable: true,
                      labelColor: Colors.black87,
                      tabs: <Widget>[
                        Tab(
                          text: 'Books',
                        ),
                        Tab(
                          text: 'Podcasts',
                        ),
                        Tab(
                          text: 'Workshops',
                        )
                      ],
                    ),
                    BookRow()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
