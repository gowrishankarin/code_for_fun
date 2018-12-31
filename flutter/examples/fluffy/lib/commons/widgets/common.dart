import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget buildSideDrawer(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          title: Text('Choose'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Book Shelf'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Awesome Login'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/awesome-login');
          },
        )
      ],
    ));
  }
}
