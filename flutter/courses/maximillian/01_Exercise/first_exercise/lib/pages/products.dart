import 'package:flutter/material.dart';

import '../product_manager.dart';
import './product_admin.dart';

// This is home page.
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductAdminPage()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ProductManager(),
    );
  }
}
