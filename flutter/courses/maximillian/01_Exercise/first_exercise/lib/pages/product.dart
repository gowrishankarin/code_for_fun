import 'package:flutter/material.dart';
import 'dart:async';

import 'package:map_view/map_view.dart';

import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/address_tag.dart';
import '../widgets/products/price_tag.dart';
import '../widgets/products/product_fab.dart';

import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  void _showMap() {
    final List<Marker> markers = <Marker>[
      Marker('position', 'Position', product.locationData.latitude,
          product.locationData.longitude)
    ];
    final CameraPosition cameraPosition = CameraPosition(
      Location(
        product.locationData.latitude,
        product.locationData.longitude,
      ),
      14.0,
    );
    final mapView = MapView();
    mapView.show(
      MapOptions(
        initialCameraPosition: cameraPosition,
        mapViewType: MapViewType.normal,
        title: 'Product Location',
      ),
      toolbarActions: [
        ToolbarAction('Close', 1),
      ],
    );
    mapView.onToolbarAction.listen((int id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
    mapView.onMapReady.listen((_) {
      mapView.setMarkers(markers);
    });
  }

  Widget _buildAddressPriceRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: _showMap,
          child: AddressTag(product.locationData.address),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              '|',
              style: TextStyle(color: Colors.grey),
            )),
        PriceTag(product.price.toString())
      ],
    );
  }

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure'),
          content: Text('This action cannot be undone!'),
          actions: <Widget>[
            FlatButton(
              child: Text('DISCARD'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(product.title),
        // ),
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(product.title),
                  background: Hero(
                    tag: product.id,
                    child: FadeInImage(
                      image: NetworkImage(product.image),
                      height: 300.0,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/food.jpg'),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: TitleDefault(product.title),
                  ),
                  _buildAddressPriceRow(product),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      //child: Text('DELETE'),
                      onPressed: () => _showWarningDialog(context),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: ProductFab(product),
      ),
    );
  }
}
