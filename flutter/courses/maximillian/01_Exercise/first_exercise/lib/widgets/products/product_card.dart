import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import 'address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleDefault(product.title),
        SizedBox(
          width: 8.0,
        ),
        PriceTag(product.price.toString()),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            iconSize: 24,
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' + model.allProducts[productIndex].id,
                ),
          ),
          IconButton(
            icon: Icon(model.allProducts[productIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            iconSize: 24,
            color: Colors.red,
            onPressed: () {
              model.selectProduct(model.allProducts[productIndex].id);
              model.toggleProductFavoriteStatus();
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(product.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/food.jpg'),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: _buildTitlePriceRow(),
          ),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context),
          // Text(product.userEmail)
        ],
      ),
    );
  }
}
