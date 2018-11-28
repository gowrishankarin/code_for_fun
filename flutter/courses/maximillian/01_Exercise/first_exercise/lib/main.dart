import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './scoped-models/main.dart';
import './models/product.dart';

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
  final MainModel _model = MainModel();
    
  @override
  void initState() {
    _model.autoAuthenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
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
        '/': (BuildContext context) => _model.user == null ? AuthPage() : ProductsPage(_model),
        '/products': (BuildContext context) => ProductsPage(_model),
        '/admin': (BuildContext context) =>
            ProductAdminPage(_model)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final String productId = pathElements[2];
          final Product product = _model.allProducts.firstWhere((Product product) {
            return product.id == productId;
          });
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(product),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_model),
        );
      },
    ),);
  }
}
