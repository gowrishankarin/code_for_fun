import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      validator: (String value) {
        if(value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long';
        }
      },
      // onChanged: (String value) {
      //   setState(() {
      //     _titleValue = value;
      //   });
      // },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      validator: (String value) {
        if(value.isEmpty || value.length < 15) {
          return 'Description is required and should be 15+ characters long';
        }
      },
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      }
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
      validator: (String value) {
        if(value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be 5+ characters long';
        }
      },
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      }
    );
  }

  void _submitForm() {
    if(!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      width: targetWidth,
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Save'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: _submitForm,
            )
            // GestureDetector(
            //   onTap: _submitForm,
            //   child: Container(
            //     color: Colors.green,
            //     padding: EdgeInsets.all(5.0),
            //     child: Text('My Button'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

/*
// Sample for MODAL Creation
class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Save'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('This is a modal'),
                );
              });
        },
      ),
    );
  }
}
*/
