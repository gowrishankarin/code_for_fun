import 'package:flutter/material.dart';

import './book_row.dart';

class BookShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
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
                    new TabBar(
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
