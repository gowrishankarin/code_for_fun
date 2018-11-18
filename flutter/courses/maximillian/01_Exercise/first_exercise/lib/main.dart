import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './scoped-models/products.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.green,
        buttonColor: Colors.green,
        //buttonTheme: ButtonThemeData(
        //  textTheme: TextTheme()
        //)
        //fontFamily: 'Oswald'
      ),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) =>
            ProductAdminPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(index),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(),
        );
      },
    ),);
  }
}
